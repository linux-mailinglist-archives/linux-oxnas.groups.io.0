Return-Path: <bounce+16102+71+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C8418E38F
	for <lists+linux-oxnas@lfdr.de>; Sat, 21 Mar 2020 19:03:42 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id WkmnYY1809624xpkK8K5pDHB; Sat, 21 Mar 2020 11:03:41 -0700
X-Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [91.198.250.252])
 by mx.groups.io with SMTP id smtpd.web12.7834.1584798038860762756
 for <linux-oxnas@groups.io>;
 Sat, 21 Mar 2020 06:40:39 -0700
X-Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 48l1xJ4ySSzKpBh;
	Sat, 21 Mar 2020 14:40:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
X-Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
	with ESMTP id Gpg7pxJw-UWe; Sat, 21 Mar 2020 14:40:33 +0100 (CET)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-oxnas@groups.io,
	Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Sungbo Eo <mans0n@gorani.run>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Apply clear-mask earlier
Date: Sat, 21 Mar 2020 22:38:42 +0900
Message-Id: <20200321133842.2408823-1-mans0n@gorani.run>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,mans0n@gorani.run
X-Gm-Message-State: aSrBqAuKNlWbu0kxtJ0NMG6qx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584813821;
 bh=6AYQlck0IiDyWRtEBk2keOYRewbmbkrOVWlgG9kPyCk=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=isJjcn2k6vlJjScd/Z0PR3tmMgy5kYVeWq0+zPdUxCwT79aXqgUzPHCvmcyWwKTyo7W
 jJDqF7cMWf9YpL5wSzUU/IfMYSrv23zBsP4VhOkdvpsqZohZALTV6kKGZCo6/lvWEXHbr
 toQVFE6hFRmNSplgW7W1D7NVSRpCCncdORQ=

Clear its own IRQs before the parent IRQ get enabled, so that the
remaining IRQs do not accidentally interrupt the parent IRQ controller.

This patch also fixes a reboot bug on OX820 SoC, where the remaining
rps-timer IRQ raises a GIC interrupt that is left pending. After that,
the rps-timer IRQ is cleared during driver initialization, and there's
no IRQ left in rps-irq when local_irq_enable() is called, which evokes
an error message "unexpected IRQ trap".

Fixes: bdd272cbb97a ("irqchip: versatile FPGA: support cascaded interrupt=
s from DT")
Signed-off-by: Sungbo Eo <mans0n@gorani.run>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Daniel Golle <daniel@makrotopia.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-v=
ersatile-fpga.c
index 70e2cfff8175..f1386733d3bc 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -212,6 +212,9 @@ int __init fpga_irq_of_init(struct device_node *node,
 	if (of_property_read_u32(node, "valid-mask", &valid_mask))
 		valid_mask =3D 0;
=20
+	writel(clear_mask, base + IRQ_ENABLE_CLEAR);
+	writel(clear_mask, base + FIQ_ENABLE_CLEAR);
+
 	/* Some chips are cascaded from a parent IRQ */
 	parent_irq =3D irq_of_parse_and_map(node, 0);
 	if (!parent_irq) {
@@ -221,9 +224,6 @@ int __init fpga_irq_of_init(struct device_node *node,
=20
 	fpga_irq_init(base, node->name, 0, parent_irq, valid_mask, node);
=20
-	writel(clear_mask, base + IRQ_ENABLE_CLEAR);
-	writel(clear_mask, base + FIQ_ENABLE_CLEAR);
-
 	/*
 	 * On Versatile AB/PB, some secondary interrupts have a direct
 	 * pass-thru to the primary controller for IRQs 20 and 22-31 which need
--=20
2.25.2


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#71): https://groups.io/g/linux-oxnas/message/71
Mute This Topic: https://groups.io/mt/72451155/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

