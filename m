Return-Path: <bounce+16102+79+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F2198701
	for <lists+linux-oxnas@lfdr.de>; Tue, 31 Mar 2020 00:10:15 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id kCoRYY1809624x1Gh4E40hlg; Mon, 30 Mar 2020 15:10:13 -0700
X-Received: from fudo.makrotopia.org (fudo.makrotopia.org [185.142.180.71])
 by mx.groups.io with SMTP id smtpd.web12.1867.1585606212821499962
 for <linux-oxnas@groups.io>;
 Mon, 30 Mar 2020 15:10:13 -0700
X-Received: from local
	by fudo.makrotopia.org with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.92.3)
	(envelope-from <daniel@makrotopia.org>)
	id 1jJ2bf-00016t-Nf; Tue, 31 Mar 2020 00:10:09 +0200
Date: Mon, 30 Mar 2020 23:09:59 +0100
From: "Daniel Golle" <daniel@makrotopia.org>
To: Neil Armstrong <narmstrong@baylibre.com>, linux-oxnas@groups.io,
	linux-arm-kernel@lists.infradead.org
Cc: Sungbo Eo <mans0n@gorani.run>
Subject: [linux-oxnas] [PATCH v2] power: reset: introduce oxnas-restart
Message-ID: <20200330220508.GA12698@makrotopia.org>
References: <467de56a-5d82-ad4a-a681-88c0dedfa8eb@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <467de56a-5d82-ad4a-a681-88c0dedfa8eb@baylibre.com>
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,daniel@makrotopia.org
X-Gm-Message-State: 08kCtgtLqJVXCAfOUuhLlIimx1808289AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1585606213;
 bh=fDLMgZG457tERCWPIui6tKs8pZ9RIzrZXDkM9iDAyg4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=vu3+kkPtYbmXNCoQIpfAAJuS6FNP9DCrQBRMzkxuqxHrTRYCdMnZMn3TfSx5qVZkLyV
 c82d5Z3Vmzoxw24ORtiH56y5NjrS05QvJw8ms1RWw/aPflIgd5JtjhJH+bfhN6hNR2Ubx
 Aw2m1CxPP4zDO0dkSTmF6zFl9BOMN2ph3Ls=

Add reboot handler for Oxford OX820 chips as reboot currenly hangs on
those boards. Code is based on ox820_assert_system_reset() found in
https://github.com/kref/linux-oxnas.git in
arch/arm/mach-oxnas/mach-ox820.c line 181.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
v2: style fixes and MAINTAINERS entry added
 MAINTAINERS                         |   1 +
 drivers/power/reset/Kconfig         |   7 +
 drivers/power/reset/Makefile        |   1 +
 drivers/power/reset/oxnas-restart.c | 234 ++++++++++++++++++++++++++++
 4 files changed, 243 insertions(+)
 create mode 100644 drivers/power/reset/oxnas-restart.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 50e8b900c0ae..d70acf978c6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2154,6 +2154,7 @@ L:	linux-oxnas@groups.io (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/mach-oxnas/
 F:	arch/arm/boot/dts/ox8*.dts*
+F:	drivers/power/reset/oxnas-restart.c
 N:	oxnas
 
 ARM/PALM TREO SUPPORT
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 890380302080..4dfac618b942 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -123,6 +123,13 @@ config POWER_RESET_OCELOT_RESET
 	help
 	  This driver supports restart for Microsemi Ocelot SoC.
 
+config POWER_RESET_OXNAS
+	bool "OXNAS SoC restart driver"
+	depends on ARCH_OXNAS
+	default MACH_OX820
+	help
+	  Restart support for OXNAS/PLXTECH OX820 SoC.
+
 config POWER_RESET_PIIX4_POWEROFF
 	tristate "Intel PIIX4 power-off driver"
 	depends on PCI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index da37f8b851dc..5710ca469517 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_POWER_RESET_GPIO_RESTART) += gpio-restart.o
 obj-$(CONFIG_POWER_RESET_HISI) += hisi-reboot.o
 obj-$(CONFIG_POWER_RESET_MSM) += msm-poweroff.o
 obj-$(CONFIG_POWER_RESET_MT6323) += mt6323-poweroff.o
+obj-$(CONFIG_POWER_RESET_OXNAS) += oxnas-restart.o
 obj-$(CONFIG_POWER_RESET_QCOM_PON) += qcom-pon.o
 obj-$(CONFIG_POWER_RESET_OCELOT_RESET) += ocelot-reset.o
 obj-$(CONFIG_POWER_RESET_PIIX4_POWEROFF) += piix4-poweroff.o
diff --git a/drivers/power/reset/oxnas-restart.c b/drivers/power/reset/oxnas-restart.c
new file mode 100644
index 000000000000..2c6ee20e3402
--- /dev/null
+++ b/drivers/power/reset/oxnas-restart.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: (GPL-2.0)
+/*
+ * oxnas SoC reset driver
+ * based on:
+ * Microsemi MIPS SoC reset driver
+ * and ox820_assert_system_reset() written by Ma Hajun <mahaijuns@gmail.com>
+ *
+ * Copyright (c) 2013 Ma Hajun <mahaijuns@gmail.com>
+ * Copyright (c) 2017 Microsemi Corporation
+ * Copyright (c) 2020 Daniel Golle <daniel@makrotopia.org>
+ */
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/notifier.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+
+/* bit numbers of reset control register */
+#define OX820_SYS_CTRL_RST_SCU                0
+#define OX820_SYS_CTRL_RST_COPRO              1
+#define OX820_SYS_CTRL_RST_ARM0               2
+#define OX820_SYS_CTRL_RST_ARM1               3
+#define OX820_SYS_CTRL_RST_USBHS              4
+#define OX820_SYS_CTRL_RST_USBHSPHYA          5
+#define OX820_SYS_CTRL_RST_MACA               6
+#define OX820_SYS_CTRL_RST_MAC                OX820_SYS_CTRL_RST_MACA
+#define OX820_SYS_CTRL_RST_PCIEA              7
+#define OX820_SYS_CTRL_RST_SGDMA              8
+#define OX820_SYS_CTRL_RST_CIPHER             9
+#define OX820_SYS_CTRL_RST_DDR                10
+#define OX820_SYS_CTRL_RST_SATA               11
+#define OX820_SYS_CTRL_RST_SATA_LINK          12
+#define OX820_SYS_CTRL_RST_SATA_PHY           13
+#define OX820_SYS_CTRL_RST_PCIEPHY            14
+#define OX820_SYS_CTRL_RST_STATIC             15
+#define OX820_SYS_CTRL_RST_GPIO               16
+#define OX820_SYS_CTRL_RST_UART1              17
+#define OX820_SYS_CTRL_RST_UART2              18
+#define OX820_SYS_CTRL_RST_MISC               19
+#define OX820_SYS_CTRL_RST_I2S                20
+#define OX820_SYS_CTRL_RST_SD                 21
+#define OX820_SYS_CTRL_RST_MACB               22
+#define OX820_SYS_CTRL_RST_PCIEB              23
+#define OX820_SYS_CTRL_RST_VIDEO              24
+#define OX820_SYS_CTRL_RST_DDR_PHY            25
+#define OX820_SYS_CTRL_RST_USBHSPHYB          26
+#define OX820_SYS_CTRL_RST_USBDEV             27
+#define OX820_SYS_CTRL_RST_ARMDBG             29
+#define OX820_SYS_CTRL_RST_PLLA               30
+#define OX820_SYS_CTRL_RST_PLLB               31
+
+/* bit numbers of clock control register */
+#define OX820_SYS_CTRL_CLK_COPRO              0
+#define OX820_SYS_CTRL_CLK_DMA                1
+#define OX820_SYS_CTRL_CLK_CIPHER             2
+#define OX820_SYS_CTRL_CLK_SD                 3
+#define OX820_SYS_CTRL_CLK_SATA               4
+#define OX820_SYS_CTRL_CLK_I2S                5
+#define OX820_SYS_CTRL_CLK_USBHS              6
+#define OX820_SYS_CTRL_CLK_MACA               7
+#define OX820_SYS_CTRL_CLK_MAC                OX820_SYS_CTRL_CLK_MACA
+#define OX820_SYS_CTRL_CLK_PCIEA              8
+#define OX820_SYS_CTRL_CLK_STATIC             9
+#define OX820_SYS_CTRL_CLK_MACB               10
+#define OX820_SYS_CTRL_CLK_PCIEB              11
+#define OX820_SYS_CTRL_CLK_REF600             12
+#define OX820_SYS_CTRL_CLK_USBDEV             13
+#define OX820_SYS_CTRL_CLK_DDR                14
+#define OX820_SYS_CTRL_CLK_DDRPHY             15
+#define OX820_SYS_CTRL_CLK_DDRCK              16
+
+/* Regmap offsets */
+#define OX820_CLK_SET_REGOFFSET               0x2c
+#define OX820_CLK_CLR_REGOFFSET               0x30
+#define OX820_RST_SET_REGOFFSET               0x34
+#define OX820_RST_CLR_REGOFFSET               0x38
+#define OX820_SECONDARY_SEL_REGOFFSET         0x14
+#define OX820_TERTIARY_SEL_REGOFFSET          0x8c
+#define OX820_QUATERNARY_SEL_REGOFFSET        0x94
+#define OX820_DEBUG_SEL_REGOFFSET             0x9c
+#define OX820_ALTERNATIVE_SEL_REGOFFSET       0xa4
+#define OX820_PULLUP_SEL_REGOFFSET            0xac
+#define OX820_SEC_SECONDARY_SEL_REGOFFSET     0x100014
+#define OX820_SEC_TERTIARY_SEL_REGOFFSET      0x10008c
+#define OX820_SEC_QUATERNARY_SEL_REGOFFSET    0x100094
+#define OX820_SEC_DEBUG_SEL_REGOFFSET         0x10009c
+#define OX820_SEC_ALTERNATIVE_SEL_REGOFFSET   0x1000a4
+#define OX820_SEC_PULLUP_SEL_REGOFFSET        0x1000ac
+
+struct oxnas_restart_context {
+	struct regmap *sys_ctrl;
+	struct notifier_block restart_handler;
+};
+
+static int ox820_restart_handle(struct notifier_block *this,
+				 unsigned long mode, void *cmd)
+{
+	struct oxnas_restart_context *ctx = container_of(this, struct
+							oxnas_restart_context,
+							restart_handler);
+	u32 value;
+
+	/*
+	 * Assert reset to cores as per power on defaults
+	 * Don't touch the DDR interface as things will come to an impromptu
+	 * stop NB Possibly should be asserting reset for PLLB, but there are
+	 * timing concerns here according to the docs
+	 */
+	value = BIT(OX820_SYS_CTRL_RST_COPRO)		|
+		BIT(OX820_SYS_CTRL_RST_USBHS)		|
+		BIT(OX820_SYS_CTRL_RST_USBHSPHYA)	|
+		BIT(OX820_SYS_CTRL_RST_MACA)		|
+		BIT(OX820_SYS_CTRL_RST_PCIEA)		|
+		BIT(OX820_SYS_CTRL_RST_SGDMA)		|
+		BIT(OX820_SYS_CTRL_RST_CIPHER)		|
+		BIT(OX820_SYS_CTRL_RST_SATA)		|
+		BIT(OX820_SYS_CTRL_RST_SATA_LINK)	|
+		BIT(OX820_SYS_CTRL_RST_SATA_PHY)	|
+		BIT(OX820_SYS_CTRL_RST_PCIEPHY)		|
+		BIT(OX820_SYS_CTRL_RST_STATIC)		|
+		BIT(OX820_SYS_CTRL_RST_UART1)		|
+		BIT(OX820_SYS_CTRL_RST_UART2)		|
+		BIT(OX820_SYS_CTRL_RST_MISC)		|
+		BIT(OX820_SYS_CTRL_RST_I2S)		|
+		BIT(OX820_SYS_CTRL_RST_SD)		|
+		BIT(OX820_SYS_CTRL_RST_MACB)		|
+		BIT(OX820_SYS_CTRL_RST_PCIEB)		|
+		BIT(OX820_SYS_CTRL_RST_VIDEO)		|
+		BIT(OX820_SYS_CTRL_RST_USBHSPHYB)	|
+		BIT(OX820_SYS_CTRL_RST_USBDEV);
+
+	regmap_write(ctx->sys_ctrl, OX820_RST_SET_REGOFFSET, value);
+
+	/* Release reset to cores as per power on defaults */
+	regmap_write(ctx->sys_ctrl, OX820_RST_CLR_REGOFFSET,
+			BIT(OX820_SYS_CTRL_RST_GPIO));
+
+	/*
+	 * Disable clocks to cores as per power-on defaults - must leave DDR
+	 * related clocks enabled otherwise we'll stop rather abruptly.
+	 */
+	value = BIT(OX820_SYS_CTRL_CLK_COPRO)		|
+		BIT(OX820_SYS_CTRL_CLK_DMA)		|
+		BIT(OX820_SYS_CTRL_CLK_CIPHER)		|
+		BIT(OX820_SYS_CTRL_CLK_SD)		|
+		BIT(OX820_SYS_CTRL_CLK_SATA)		|
+		BIT(OX820_SYS_CTRL_CLK_I2S)		|
+		BIT(OX820_SYS_CTRL_CLK_USBHS)		|
+		BIT(OX820_SYS_CTRL_CLK_MAC)		|
+		BIT(OX820_SYS_CTRL_CLK_PCIEA)		|
+		BIT(OX820_SYS_CTRL_CLK_STATIC)		|
+		BIT(OX820_SYS_CTRL_CLK_MACB)		|
+		BIT(OX820_SYS_CTRL_CLK_PCIEB)		|
+		BIT(OX820_SYS_CTRL_CLK_REF600)		|
+		BIT(OX820_SYS_CTRL_CLK_USBDEV);
+
+	regmap_write(ctx->sys_ctrl, OX820_CLK_CLR_REGOFFSET, value);
+
+	/* Enable clocks to cores as per power-on defaults */
+
+	/* Set sys-control pin mux'ing as per power-on defaults */
+	regmap_write(ctx->sys_ctrl, OX820_SECONDARY_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_TERTIARY_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_QUATERNARY_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_DEBUG_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_ALTERNATIVE_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_PULLUP_SEL_REGOFFSET, 0);
+
+	regmap_write(ctx->sys_ctrl, OX820_SEC_SECONDARY_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_SEC_TERTIARY_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_SEC_QUATERNARY_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_SEC_DEBUG_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_SEC_ALTERNATIVE_SEL_REGOFFSET, 0);
+	regmap_write(ctx->sys_ctrl, OX820_SEC_PULLUP_SEL_REGOFFSET, 0);
+
+	/*
+	 * No need to save any state, as the ROM loader can determine whether
+	 * reset is due to power cycling or programatic action, just hit the
+	 * (self-clearing) CPU reset bit of the block reset register
+	 */
+	value =
+		BIT(OX820_SYS_CTRL_RST_SCU) |
+		BIT(OX820_SYS_CTRL_RST_ARM0) |
+		BIT(OX820_SYS_CTRL_RST_ARM1);
+
+	regmap_write(ctx->sys_ctrl, OX820_RST_SET_REGOFFSET, value);
+
+	pr_emerg("Unable to restart system\n");
+	return NOTIFY_DONE;
+}
+
+static int ox820_restart_probe(struct platform_device *pdev)
+{
+	struct oxnas_restart_context *ctx;
+	struct regmap *sys_ctrl;
+	struct device *dev = &pdev->dev;
+	int err = 0;
+
+	sys_ctrl = syscon_node_to_regmap(pdev->dev.of_node);
+	if (IS_ERR(sys_ctrl))
+		return PTR_ERR(sys_ctrl);
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->sys_ctrl = sys_ctrl;
+	ctx->restart_handler.notifier_call = ox820_restart_handle;
+	ctx->restart_handler.priority = 192;
+	err = register_restart_handler(&ctx->restart_handler);
+	if (err)
+		dev_err(dev, "can't register restart notifier (err=%d)\n", err);
+
+	return err;
+}
+
+static const struct of_device_id ox820_restart_of_match[] = {
+	{ .compatible = "oxsemi,ox820-sys-ctrl" },
+	{}
+};
+
+static struct platform_driver ox820_restart_driver = {
+	.probe = ox820_restart_probe,
+	.driver = {
+		.name = "ox820-chip-reset",
+		.of_match_table = ox820_restart_of_match,
+	},
+};
+builtin_platform_driver(ox820_restart_driver);
-- 
2.26.0


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#79): https://groups.io/g/linux-oxnas/message/79
Mute This Topic: https://groups.io/mt/72664777/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

