Return-Path: <bounce+16102+63+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7D18A201
	for <lists+linux-oxnas@lfdr.de>; Wed, 18 Mar 2020 18:58:20 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id baRSYY1809624xkRo7H5Qvwx; Wed, 18 Mar 2020 10:58:19 -0700
X-Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [91.198.250.253])
 by mx.groups.io with SMTP id smtpd.web11.20549.1584551479300433691
 for <linux-oxnas@groups.io>;
 Wed, 18 Mar 2020 10:11:19 -0700
X-Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-u-204.mailbox.org (Postfix) with ESMTPS id 48jGln33z3zQlFx;
	Wed, 18 Mar 2020 18:11:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
X-Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
	with ESMTP id dDnmRVvElgnL; Wed, 18 Mar 2020 18:11:14 +0100 (CET)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-oxnas@groups.io,
	Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Sungbo Eo <mans0n@gorani.run>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Handle chained IRQs properly
Date: Thu, 19 Mar 2020 02:09:04 +0900
Message-Id: <20200318170904.1461278-1-mans0n@gorani.run>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,mans0n@gorani.run
X-Gm-Message-State: gRTOW63PEKpcKmIABm0VE62Bx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584554299;
 bh=/m9yiB3Od0YFmoTOzyKhUw3gF1rAwgOo6bgTfyhUYBE=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=bgLsJbEKdqU86ZzFx6FFn2haFfr4jCVSreghkUGE1a/hBaNFcw312VEZ/GxhJBw0fiN
 drXOVtU9qO1e1kdF/bWkC2kDtrAcp0k5wCGpNFOY8yrBWQomdH/IogJwZ6aIGKqCrhbnF
 JAWPtQELQZQCmA+s0Ivr3FEcNZQlyeaSvWI=

Enclose the chained handler with chained_irq_{enter,exit}(), so that the
muxed interrupts get properly acked.

This patch also fixes a reboot bug on OX820 SoC, where the jiffies timer
interrupt is never acked. The kernel waits a clock tick forever in
calibrate_delay_converge(), which leads to a boot hang.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
Cc: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/irqchip/irq-versatile-fpga.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-v=
ersatile-fpga.c
index 928858dada75..08faab2fec3e 100644
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
@@ -68,12 +69,15 @@ static void fpga_irq_unmask(struct irq_data *d)
=20
 static void fpga_irq_handle(struct irq_desc *desc)
 {
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
 	struct fpga_irq_data *f =3D irq_desc_get_handler_data(desc);
 	u32 status =3D readl(f->base + IRQ_STATUS);
=20
+	chained_irq_enter(chip, desc);
+
 	if (status =3D=3D 0) {
 		do_bad_IRQ(desc);
-		return;
+		goto out;
 	}
=20
 	do {
@@ -82,6 +86,9 @@ static void fpga_irq_handle(struct irq_desc *desc)
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

View/Reply Online (#63): https://groups.io/g/linux-oxnas/message/63
Mute This Topic: https://groups.io/mt/72055400/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

