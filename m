Return-Path: <bounce+16102+67+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A418BBA8
	for <lists+linux-oxnas@lfdr.de>; Thu, 19 Mar 2020 16:54:04 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id 89QmYY1809624x7ktHGIEqmr; Thu, 19 Mar 2020 08:54:03 -0700
X-Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [91.198.250.252])
 by mx.groups.io with SMTP id smtpd.web11.4607.1584585421113363934
 for <linux-oxnas@groups.io>;
 Wed, 18 Mar 2020 19:37:02 -0700
X-Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 48jWJW00Y7zKp7s;
	Thu, 19 Mar 2020 03:36:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
X-Received: from smtp2.mailbox.org ([80.241.60.241])
	by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id yN29WkZ56Jih; Thu, 19 Mar 2020 03:36:55 +0100 (CET)
From: Sungbo Eo <mans0n@gorani.run>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-oxnas@groups.io
Cc: Sungbo Eo <mans0n@gorani.run>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH v2] irqchip/versatile-fpga: Handle chained IRQs properly
Date: Thu, 19 Mar 2020 11:34:48 +0900
Message-Id: <20200319023448.1479701-1-mans0n@gorani.run>
In-Reply-To: <002b72cab9896fa5ac76a52e0cb503ff@kernel.org>
References: <002b72cab9896fa5ac76a52e0cb503ff@kernel.org>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,mans0n@gorani.run
X-Gm-Message-State: K3lM8KmdROmaCMpuXn8THnnax1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584633243;
 bh=2lX5rEFdUePgYLAkyoFZNI3V4ujaZzb8F+3XARmLHLI=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=FLaUL9GDXhDOdkHBhG6Vp8ISAGxyVhC0lNWEetgcYwdpk7DFkJhBSMMhrQiJrHDkyWj
 u4gIrjyP7OczjAcWGekHbswGf385jPn/IF8xZmydZqUsjwd8IML+Fmif5daHXe2t72ry6
 h0vTPgPL5fNrU/098r6oRSxXPGmEerBzvYM=

Enclose the chained handler with chained_irq_{enter,exit}(), so that the
muxed interrupts get properly acked.

This patch also fixes a reboot bug on OX820 SoC, where the jiffies timer
interrupt is never acked. The kernel waits a clock tick forever in
calibrate_delay_converge(), which leads to a boot hang.

Fixes: c41b16f8c9d9 ("ARM: integrator/versatile: consolidate FPGA IRQ han=
dling code")
Signed-off-by: Sungbo Eo <mans0n@gorani.run>
Cc: Neil Armstrong <narmstrong@baylibre.com>
---
v2: moved readl below chained_irq_enter()
    added Fixes tag

 drivers/irqchip/irq-versatile-fpga.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-v=
ersatile-fpga.c
index 928858dada75..70e2cfff8175 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -6,6 +6,7 @@
 #include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/versatile-fpga.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
@@ -68,12 +69,16 @@ static void fpga_irq_unmask(struct irq_data *d)
=20
 static void fpga_irq_handle(struct irq_desc *desc)
 {
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
 	struct fpga_irq_data *f =3D irq_desc_get_handler_data(desc);
-	u32 status =3D readl(f->base + IRQ_STATUS);
+	u32 status;
+
+	chained_irq_enter(chip, desc);
=20
+	status =3D readl(f->base + IRQ_STATUS);
 	if (status =3D=3D 0) {
 		do_bad_IRQ(desc);
-		return;
+		goto out;
 	}
=20
 	do {
@@ -82,6 +87,9 @@ static void fpga_irq_handle(struct irq_desc *desc)
 		status &=3D ~(1 << irq);
 		generic_handle_irq(irq_find_mapping(f->domain, irq));
 	} while (status);
+
+out:
+	chained_irq_exit(chip, desc);
 }
=20
 /*
--=20
2.25.1


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#67): https://groups.io/g/linux-oxnas/message/67
Mute This Topic: https://groups.io/mt/72077983/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

