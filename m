Return-Path: <bounce+16102+80+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C5198D01
	for <lists+linux-oxnas@lfdr.de>; Tue, 31 Mar 2020 09:36:57 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 00c7YY1809624xesZm293aJp; Tue, 31 Mar 2020 00:36:55 -0700
X-Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.4558.1585640214139087081
 for <linux-oxnas@groups.io>;
 Tue, 31 Mar 2020 00:36:54 -0700
X-Received: by mail-wm1-f65.google.com with SMTP id r16so1316141wmg.5
        for <linux-oxnas@groups.io>; Tue, 31 Mar 2020 00:36:53 -0700 (PDT)
X-Gm-Message-State: GcRStuLO8iuYOTJkpf9BuLrnx1808289AA=
X-Google-Smtp-Source: ADFU+vtoANaPYTJEmGeYh36dCy5Mo4Dl8m8uEua8kjzS4+sbgHX5uMEHm2gTDAHa3Hyymh9MnpzK3Q==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr2086750wmf.85.1585640212407;
        Tue, 31 Mar 2020 00:36:52 -0700 (PDT)
X-Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2? ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id n9sm25340464wru.50.2020.03.31.00.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 00:36:51 -0700 (PDT)
Subject: Re: [linux-oxnas] [PATCH v2] power: reset: introduce oxnas-restart
To: Daniel Golle <daniel@makrotopia.org>, linux-oxnas@groups.io,
 linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>
Cc: Sungbo Eo <mans0n@gorani.run>
References: <467de56a-5d82-ad4a-a681-88c0dedfa8eb@baylibre.com>
 <20200330220508.GA12698@makrotopia.org>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e1682107-9025-68ec-098e-36a42cae9ed5@baylibre.com>
Date: Tue, 31 Mar 2020 09:36:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330220508.GA12698@makrotopia.org>
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1585640215;
 bh=pWtqSG0CcSFF/JTBzd/nRHCJv7ajxCFdIT/WJanbM+c=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=MuNsPrS8DoYjmMaVNlI8F6GJjm4Gw2/FMFFhPCj10VXRG752EWFbOmtQcpbZS/hlhVS
 YRMb+nn5XG4HcJ1Ayp4+dl9jzvYXOK0QOzIbmQKeyUnCuCujeeBSVY6VXe0sOcHjmDeTq
 KB8MD+xiBucPH0r3fLAjbYUHJkjkS21ivVc=

Hi Daniel,

I think Sebastian Reichel <sre@kernel.org> is missing in Cc.

Added him.

@Sebastian, I can take it in my arm-soc oxnas tree with your ack if it's simpler.

Neil

On 31/03/2020 00:09, Daniel Golle wrote:
> Add reboot handler for Oxford OX820 chips as reboot currenly hangs on
> those boards. Code is based on ox820_assert_system_reset() found in
> https://github.com/kref/linux-oxnas.git in
> arch/arm/mach-oxnas/mach-ox820.c line 181.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> v2: style fixes and MAINTAINERS entry added
>  MAINTAINERS                         |   1 +
>  drivers/power/reset/Kconfig         |   7 +
>  drivers/power/reset/Makefile        |   1 +
>  drivers/power/reset/oxnas-restart.c | 234 ++++++++++++++++++++++++++++
>  4 files changed, 243 insertions(+)
>  create mode 100644 drivers/power/reset/oxnas-restart.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50e8b900c0ae..d70acf978c6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2154,6 +2154,7 @@ L:	linux-oxnas@groups.io (moderated for non-subscribers)
>  S:	Maintained
>  F:	arch/arm/mach-oxnas/
>  F:	arch/arm/boot/dts/ox8*.dts*
> +F:	drivers/power/reset/oxnas-restart.c
>  N:	oxnas
>  
>  ARM/PALM TREO SUPPORT
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 890380302080..4dfac618b942 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -123,6 +123,13 @@ config POWER_RESET_OCELOT_RESET
>  	help
>  	  This driver supports restart for Microsemi Ocelot SoC.
>  
> +config POWER_RESET_OXNAS
> +	bool "OXNAS SoC restart driver"
> +	depends on ARCH_OXNAS
> +	default MACH_OX820
> +	help
> +	  Restart support for OXNAS/PLXTECH OX820 SoC.
> +
>  config POWER_RESET_PIIX4_POWEROFF
>  	tristate "Intel PIIX4 power-off driver"
>  	depends on PCI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index da37f8b851dc..5710ca469517 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_POWER_RESET_GPIO_RESTART) += gpio-restart.o
>  obj-$(CONFIG_POWER_RESET_HISI) += hisi-reboot.o
>  obj-$(CONFIG_POWER_RESET_MSM) += msm-poweroff.o
>  obj-$(CONFIG_POWER_RESET_MT6323) += mt6323-poweroff.o
> +obj-$(CONFIG_POWER_RESET_OXNAS) += oxnas-restart.o
>  obj-$(CONFIG_POWER_RESET_QCOM_PON) += qcom-pon.o
>  obj-$(CONFIG_POWER_RESET_OCELOT_RESET) += ocelot-reset.o
>  obj-$(CONFIG_POWER_RESET_PIIX4_POWEROFF) += piix4-poweroff.o
> diff --git a/drivers/power/reset/oxnas-restart.c b/drivers/power/reset/oxnas-restart.c
> new file mode 100644
> index 000000000000..2c6ee20e3402
> --- /dev/null
> +++ b/drivers/power/reset/oxnas-restart.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: (GPL-2.0)
> +/*
> + * oxnas SoC reset driver
> + * based on:
> + * Microsemi MIPS SoC reset driver
> + * and ox820_assert_system_reset() written by Ma Hajun <mahaijuns@gmail.com>
> + *
> + * Copyright (c) 2013 Ma Hajun <mahaijuns@gmail.com>
> + * Copyright (c) 2017 Microsemi Corporation
> + * Copyright (c) 2020 Daniel Golle <daniel@makrotopia.org>
> + */
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/notifier.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/regmap.h>
> +
> +/* bit numbers of reset control register */
> +#define OX820_SYS_CTRL_RST_SCU                0
> +#define OX820_SYS_CTRL_RST_COPRO              1
> +#define OX820_SYS_CTRL_RST_ARM0               2
> +#define OX820_SYS_CTRL_RST_ARM1               3
> +#define OX820_SYS_CTRL_RST_USBHS              4
> +#define OX820_SYS_CTRL_RST_USBHSPHYA          5
> +#define OX820_SYS_CTRL_RST_MACA               6
> +#define OX820_SYS_CTRL_RST_MAC                OX820_SYS_CTRL_RST_MACA
> +#define OX820_SYS_CTRL_RST_PCIEA              7
> +#define OX820_SYS_CTRL_RST_SGDMA              8
> +#define OX820_SYS_CTRL_RST_CIPHER             9
> +#define OX820_SYS_CTRL_RST_DDR                10
> +#define OX820_SYS_CTRL_RST_SATA               11
> +#define OX820_SYS_CTRL_RST_SATA_LINK          12
> +#define OX820_SYS_CTRL_RST_SATA_PHY           13
> +#define OX820_SYS_CTRL_RST_PCIEPHY            14
> +#define OX820_SYS_CTRL_RST_STATIC             15
> +#define OX820_SYS_CTRL_RST_GPIO               16
> +#define OX820_SYS_CTRL_RST_UART1              17
> +#define OX820_SYS_CTRL_RST_UART2              18
> +#define OX820_SYS_CTRL_RST_MISC               19
> +#define OX820_SYS_CTRL_RST_I2S                20
> +#define OX820_SYS_CTRL_RST_SD                 21
> +#define OX820_SYS_CTRL_RST_MACB               22
> +#define OX820_SYS_CTRL_RST_PCIEB              23
> +#define OX820_SYS_CTRL_RST_VIDEO              24
> +#define OX820_SYS_CTRL_RST_DDR_PHY            25
> +#define OX820_SYS_CTRL_RST_USBHSPHYB          26
> +#define OX820_SYS_CTRL_RST_USBDEV             27
> +#define OX820_SYS_CTRL_RST_ARMDBG             29
> +#define OX820_SYS_CTRL_RST_PLLA               30
> +#define OX820_SYS_CTRL_RST_PLLB               31
> +
> +/* bit numbers of clock control register */
> +#define OX820_SYS_CTRL_CLK_COPRO              0
> +#define OX820_SYS_CTRL_CLK_DMA                1
> +#define OX820_SYS_CTRL_CLK_CIPHER             2
> +#define OX820_SYS_CTRL_CLK_SD                 3
> +#define OX820_SYS_CTRL_CLK_SATA               4
> +#define OX820_SYS_CTRL_CLK_I2S                5
> +#define OX820_SYS_CTRL_CLK_USBHS              6
> +#define OX820_SYS_CTRL_CLK_MACA               7
> +#define OX820_SYS_CTRL_CLK_MAC                OX820_SYS_CTRL_CLK_MACA
> +#define OX820_SYS_CTRL_CLK_PCIEA              8
> +#define OX820_SYS_CTRL_CLK_STATIC             9
> +#define OX820_SYS_CTRL_CLK_MACB               10
> +#define OX820_SYS_CTRL_CLK_PCIEB              11
> +#define OX820_SYS_CTRL_CLK_REF600             12
> +#define OX820_SYS_CTRL_CLK_USBDEV             13
> +#define OX820_SYS_CTRL_CLK_DDR                14
> +#define OX820_SYS_CTRL_CLK_DDRPHY             15
> +#define OX820_SYS_CTRL_CLK_DDRCK              16
> +
> +/* Regmap offsets */
> +#define OX820_CLK_SET_REGOFFSET               0x2c
> +#define OX820_CLK_CLR_REGOFFSET               0x30
> +#define OX820_RST_SET_REGOFFSET               0x34
> +#define OX820_RST_CLR_REGOFFSET               0x38
> +#define OX820_SECONDARY_SEL_REGOFFSET         0x14
> +#define OX820_TERTIARY_SEL_REGOFFSET          0x8c
> +#define OX820_QUATERNARY_SEL_REGOFFSET        0x94
> +#define OX820_DEBUG_SEL_REGOFFSET             0x9c
> +#define OX820_ALTERNATIVE_SEL_REGOFFSET       0xa4
> +#define OX820_PULLUP_SEL_REGOFFSET            0xac
> +#define OX820_SEC_SECONDARY_SEL_REGOFFSET     0x100014
> +#define OX820_SEC_TERTIARY_SEL_REGOFFSET      0x10008c
> +#define OX820_SEC_QUATERNARY_SEL_REGOFFSET    0x100094
> +#define OX820_SEC_DEBUG_SEL_REGOFFSET         0x10009c
> +#define OX820_SEC_ALTERNATIVE_SEL_REGOFFSET   0x1000a4
> +#define OX820_SEC_PULLUP_SEL_REGOFFSET        0x1000ac
> +
> +struct oxnas_restart_context {
> +	struct regmap *sys_ctrl;
> +	struct notifier_block restart_handler;
> +};
> +
> +static int ox820_restart_handle(struct notifier_block *this,
> +				 unsigned long mode, void *cmd)
> +{
> +	struct oxnas_restart_context *ctx = container_of(this, struct
> +							oxnas_restart_context,
> +							restart_handler);
> +	u32 value;
> +
> +	/*
> +	 * Assert reset to cores as per power on defaults
> +	 * Don't touch the DDR interface as things will come to an impromptu
> +	 * stop NB Possibly should be asserting reset for PLLB, but there are
> +	 * timing concerns here according to the docs
> +	 */
> +	value = BIT(OX820_SYS_CTRL_RST_COPRO)		|
> +		BIT(OX820_SYS_CTRL_RST_USBHS)		|
> +		BIT(OX820_SYS_CTRL_RST_USBHSPHYA)	|
> +		BIT(OX820_SYS_CTRL_RST_MACA)		|
> +		BIT(OX820_SYS_CTRL_RST_PCIEA)		|
> +		BIT(OX820_SYS_CTRL_RST_SGDMA)		|
> +		BIT(OX820_SYS_CTRL_RST_CIPHER)		|
> +		BIT(OX820_SYS_CTRL_RST_SATA)		|
> +		BIT(OX820_SYS_CTRL_RST_SATA_LINK)	|
> +		BIT(OX820_SYS_CTRL_RST_SATA_PHY)	|
> +		BIT(OX820_SYS_CTRL_RST_PCIEPHY)		|
> +		BIT(OX820_SYS_CTRL_RST_STATIC)		|
> +		BIT(OX820_SYS_CTRL_RST_UART1)		|
> +		BIT(OX820_SYS_CTRL_RST_UART2)		|
> +		BIT(OX820_SYS_CTRL_RST_MISC)		|
> +		BIT(OX820_SYS_CTRL_RST_I2S)		|
> +		BIT(OX820_SYS_CTRL_RST_SD)		|
> +		BIT(OX820_SYS_CTRL_RST_MACB)		|
> +		BIT(OX820_SYS_CTRL_RST_PCIEB)		|
> +		BIT(OX820_SYS_CTRL_RST_VIDEO)		|
> +		BIT(OX820_SYS_CTRL_RST_USBHSPHYB)	|
> +		BIT(OX820_SYS_CTRL_RST_USBDEV);
> +
> +	regmap_write(ctx->sys_ctrl, OX820_RST_SET_REGOFFSET, value);
> +
> +	/* Release reset to cores as per power on defaults */
> +	regmap_write(ctx->sys_ctrl, OX820_RST_CLR_REGOFFSET,
> +			BIT(OX820_SYS_CTRL_RST_GPIO));
> +
> +	/*
> +	 * Disable clocks to cores as per power-on defaults - must leave DDR
> +	 * related clocks enabled otherwise we'll stop rather abruptly.
> +	 */
> +	value = BIT(OX820_SYS_CTRL_CLK_COPRO)		|
> +		BIT(OX820_SYS_CTRL_CLK_DMA)		|
> +		BIT(OX820_SYS_CTRL_CLK_CIPHER)		|
> +		BIT(OX820_SYS_CTRL_CLK_SD)		|
> +		BIT(OX820_SYS_CTRL_CLK_SATA)		|
> +		BIT(OX820_SYS_CTRL_CLK_I2S)		|
> +		BIT(OX820_SYS_CTRL_CLK_USBHS)		|
> +		BIT(OX820_SYS_CTRL_CLK_MAC)		|
> +		BIT(OX820_SYS_CTRL_CLK_PCIEA)		|
> +		BIT(OX820_SYS_CTRL_CLK_STATIC)		|
> +		BIT(OX820_SYS_CTRL_CLK_MACB)		|
> +		BIT(OX820_SYS_CTRL_CLK_PCIEB)		|
> +		BIT(OX820_SYS_CTRL_CLK_REF600)		|
> +		BIT(OX820_SYS_CTRL_CLK_USBDEV);
> +
> +	regmap_write(ctx->sys_ctrl, OX820_CLK_CLR_REGOFFSET, value);
> +
> +	/* Enable clocks to cores as per power-on defaults */
> +
> +	/* Set sys-control pin mux'ing as per power-on defaults */
> +	regmap_write(ctx->sys_ctrl, OX820_SECONDARY_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_TERTIARY_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_QUATERNARY_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_DEBUG_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_ALTERNATIVE_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_PULLUP_SEL_REGOFFSET, 0);
> +
> +	regmap_write(ctx->sys_ctrl, OX820_SEC_SECONDARY_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_SEC_TERTIARY_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_SEC_QUATERNARY_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_SEC_DEBUG_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_SEC_ALTERNATIVE_SEL_REGOFFSET, 0);
> +	regmap_write(ctx->sys_ctrl, OX820_SEC_PULLUP_SEL_REGOFFSET, 0);
> +
> +	/*
> +	 * No need to save any state, as the ROM loader can determine whether
> +	 * reset is due to power cycling or programatic action, just hit the
> +	 * (self-clearing) CPU reset bit of the block reset register
> +	 */
> +	value =
> +		BIT(OX820_SYS_CTRL_RST_SCU) |
> +		BIT(OX820_SYS_CTRL_RST_ARM0) |
> +		BIT(OX820_SYS_CTRL_RST_ARM1);
> +
> +	regmap_write(ctx->sys_ctrl, OX820_RST_SET_REGOFFSET, value);
> +
> +	pr_emerg("Unable to restart system\n");
> +	return NOTIFY_DONE;
> +}
> +
> +static int ox820_restart_probe(struct platform_device *pdev)
> +{
> +	struct oxnas_restart_context *ctx;
> +	struct regmap *sys_ctrl;
> +	struct device *dev = &pdev->dev;
> +	int err = 0;
> +
> +	sys_ctrl = syscon_node_to_regmap(pdev->dev.of_node);
> +	if (IS_ERR(sys_ctrl))
> +		return PTR_ERR(sys_ctrl);
> +
> +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->sys_ctrl = sys_ctrl;
> +	ctx->restart_handler.notifier_call = ox820_restart_handle;
> +	ctx->restart_handler.priority = 192;
> +	err = register_restart_handler(&ctx->restart_handler);
> +	if (err)
> +		dev_err(dev, "can't register restart notifier (err=%d)\n", err);
> +
> +	return err;
> +}
> +
> +static const struct of_device_id ox820_restart_of_match[] = {
> +	{ .compatible = "oxsemi,ox820-sys-ctrl" },
> +	{}
> +};
> +
> +static struct platform_driver ox820_restart_driver = {
> +	.probe = ox820_restart_probe,
> +	.driver = {
> +		.name = "ox820-chip-reset",
> +		.of_match_table = ox820_restart_of_match,
> +	},
> +};
> +builtin_platform_driver(ox820_restart_driver);
> 


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#80): https://groups.io/g/linux-oxnas/message/80
Mute This Topic: https://groups.io/mt/72664777/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

