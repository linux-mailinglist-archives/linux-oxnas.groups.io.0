Return-Path: <bounce+16102+301+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A41C744058
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:58:51 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id dwMCYY1809624x6t8Kj7nsSy; Fri, 30 Jun 2023 09:58:49 -0700
X-Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.19037.1688144329460093116
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:49 -0700
X-Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3142860734aso182995f8f.1
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:49 -0700 (PDT)
X-Gm-Message-State: v8rwoMGCalyq1XQsalOpCCvzx1808289AA=
X-Google-Smtp-Source: APBJJlGvfNvFW0jCjGvznY6HK+i+JgrFVqcRb7025tQ2yfPikbi7tpgq/sWhuqGevYLVCCnwbLd10A==
X-Received: by 2002:adf:f84a:0:b0:314:140a:e629 with SMTP id d10-20020adff84a000000b00314140ae629mr5874134wrq.7.1688144327901;
        Fri, 30 Jun 2023 09:58:47 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:47 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:32 +0200
Subject: [linux-oxnas] [PATCH v2 07/15] net: stmmac: dwmac-oxnas: remove obsolete dwmac glue driver
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-7-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Daniel Golle <daniel@makrotopia.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=9143;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ejAz1IAJoZ72AsGfMantZn1z4aUBu8ItOfmfHHeZV44=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm2VumAiS88SMnmjtsiebP+hoRV9So6UYEBjYMz
 JLbm4f6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtgAKCRB33NvayMhJ0fFoD/
 4923BNV/pVrdOwyik5/XtouR/Jlvt2gqmGEwEHrrLa9vkPleS9mo6rFBzrMKzub/3s8c0Nr8QGy9QX
 +ITgdAz3hadwdg6WD+pKQmzwLr5SKeq4Ompojznza9M1D2ah0zwnaqriC16RPkG1RVd+yHb+vvad44
 hEomE8lC0Fp8nJasBuzOIhGWqpmkdS4b2C+xrwoXbS1GGO2wMEX/1g1EoRXC+ntNgxjcL6pRnrYaZF
 s8s/YQvObMyhIAxq3i7JOy9pGZqwN1tvk8Vbf0R5EqttAQXu2KCd5SELFBQ8wGQl/Byf3ffNsUi6sO
 5+QyzsJ8RAQXIBJl+0rkLowTnsVe8drEo+VvVZYq4XasdenxbljLuxYlBD0sDgTteI8waV+7lWfORa
 wCLKAhLDXnOIGcCQSyhfia/noLqc3yJfrFgtgAG1DAdx89/WN2JJKXpxe0+hW3WDx8PzdfRmwW0HMe
 2ZnzPiJnTfeZUGsuw9gaKmmaPst2kgi1p9ap02/RB4dnRnRwSFVc8T/zWwPwFF5rT1ftWWLcRCo+TP
 ZpDESoAgNFIdfafkjaFeyNwqnzIypqe54Fm12UQO0BeDNGH+nMauN2ZDkw1V47DNwcS4hqcB3rykP2
 B8r4+4oRQfgq78z6eBgoDKvoxAxBrKjMsBceQDGiSyuaKHNNYRYR4VgR9deA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1688144329;
 bh=8HyGDBe/6DL/b9C0n/QMjPo5AjlWZYh1eBtImwjxIDw=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=opfTLY+0onRX+lH3S+dgU74LS4/dY/OY5a0Xa+lK0XznOVM1JmEulOgi6BLSyfCUJq8
 BERkE7p8UM65k9tVCJ8sUU3HSzqxcH0MNn5jjdQtAvOnl3SWmAflfpRGhUIFg6N/Mm7O1
 ItSZq9ztqlARejDWSVguQQj+ZrAy0Mk1JOI=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 ethernet.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig       |  11 -
 drivers/net/ethernet/stmicro/stmmac/Makefile      |   1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c | 245 ------------------=
----
 3 files changed, 257 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethe=
rnet/stmicro/stmmac/Kconfig
index 5583f0b055ec..06c6871f8788 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,17 +121,6 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
=20
-config DWMAC_OXNAS
-	tristate "Oxford Semiconductor OXNAS dwmac support"
-	default ARCH_OXNAS
-	depends on OF && COMMON_CLK && (ARCH_OXNAS || COMPILE_TEST)
-	select MFD_SYSCON
-	help
-	  Support for Ethernet controller on Oxford Semiconductor OXNAS SoCs.
-
-	  This selects the Oxford Semiconductor OXNASSoC glue layer support for
-	  the stmmac device driver. This driver is used for OX820.
-
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/eth=
ernet/stmicro/stmmac/Makefile
index 7dd3d388068b..5b57aee19267 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+=3D dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+=3D dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+=3D dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+=3D dwmac-meson.o dwmac-meson8b.o
-obj-$(CONFIG_DWMAC_OXNAS)	+=3D dwmac-oxnas.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+=3D dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+=3D dwmac-rk.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+=3D dwmac-altr-socfpga.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-oxnas.c
deleted file mode 100644
index 42954020de2c..000000000000
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
+++ /dev/null
@@ -1,245 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Oxford Semiconductor OXNAS DWMAC glue layer
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- * Copyright (C) 2014 Daniel Golle <daniel@makrotopia.org>
- * Copyright (C) 2013 Ma Haijun <mahaijuns@gmail.com>
- * Copyright (C) 2012 John Crispin <blogic@openwrt.org>
- */
-
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-#include <linux/stmmac.h>
-
-#include "stmmac_platform.h"
-
-/* System Control regmap offsets */
-#define OXNAS_DWMAC_CTRL_REGOFFSET	0x78
-#define OXNAS_DWMAC_DELAY_REGOFFSET	0x100
-
-/* Control Register */
-#define DWMAC_CKEN_RX_IN        14
-#define DWMAC_CKEN_RXN_OUT      13
-#define DWMAC_CKEN_RX_OUT       12
-#define DWMAC_CKEN_TX_IN        10
-#define DWMAC_CKEN_TXN_OUT      9
-#define DWMAC_CKEN_TX_OUT       8
-#define DWMAC_RX_SOURCE         7
-#define DWMAC_TX_SOURCE         6
-#define DWMAC_LOW_TX_SOURCE     4
-#define DWMAC_AUTO_TX_SOURCE    3
-#define DWMAC_RGMII             2
-#define DWMAC_SIMPLE_MUX        1
-#define DWMAC_CKEN_GTX          0
-
-/* Delay register */
-#define DWMAC_TX_VARDELAY_SHIFT		0
-#define DWMAC_TXN_VARDELAY_SHIFT	8
-#define DWMAC_RX_VARDELAY_SHIFT		16
-#define DWMAC_RXN_VARDELAY_SHIFT	24
-#define DWMAC_TX_VARDELAY(d)		((d) << DWMAC_TX_VARDELAY_SHIFT)
-#define DWMAC_TXN_VARDELAY(d)		((d) << DWMAC_TXN_VARDELAY_SHIFT)
-#define DWMAC_RX_VARDELAY(d)		((d) << DWMAC_RX_VARDELAY_SHIFT)
-#define DWMAC_RXN_VARDELAY(d)		((d) << DWMAC_RXN_VARDELAY_SHIFT)
-
-struct oxnas_dwmac;
-
-struct oxnas_dwmac_data {
-	int (*setup)(struct oxnas_dwmac *dwmac);
-};
-
-struct oxnas_dwmac {
-	struct device	*dev;
-	struct clk	*clk;
-	struct regmap	*regmap;
-	const struct oxnas_dwmac_data	*data;
-};
-
-static int oxnas_dwmac_setup_ox810se(struct oxnas_dwmac *dwmac)
-{
-	unsigned int value;
-	int ret;
-
-	ret =3D regmap_read(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, &value);
-	if (ret < 0)
-		return ret;
-
-	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY */
-	value |=3D BIT(DWMAC_CKEN_GTX)		|
-		 /* Use simple mux for 25/125 Mhz clock switching */
-		 BIT(DWMAC_SIMPLE_MUX);
-
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
-
-	return 0;
-}
-
-static int oxnas_dwmac_setup_ox820(struct oxnas_dwmac *dwmac)
-{
-	unsigned int value;
-	int ret;
-
-	ret =3D regmap_read(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, &value);
-	if (ret < 0)
-		return ret;
-
-	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY */
-	value |=3D BIT(DWMAC_CKEN_GTX)		|
-		 /* Use simple mux for 25/125 Mhz clock switching */
-		BIT(DWMAC_SIMPLE_MUX)		|
-		/* set auto switch tx clock source */
-		BIT(DWMAC_AUTO_TX_SOURCE)	|
-		/* enable tx & rx vardelay */
-		BIT(DWMAC_CKEN_TX_OUT)		|
-		BIT(DWMAC_CKEN_TXN_OUT)	|
-		BIT(DWMAC_CKEN_TX_IN)		|
-		BIT(DWMAC_CKEN_RX_OUT)		|
-		BIT(DWMAC_CKEN_RXN_OUT)	|
-		BIT(DWMAC_CKEN_RX_IN);
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
-
-	/* set tx & rx vardelay */
-	value =3D DWMAC_TX_VARDELAY(4)	|
-		DWMAC_TXN_VARDELAY(2)	|
-		DWMAC_RX_VARDELAY(10)	|
-		DWMAC_RXN_VARDELAY(8);
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_DELAY_REGOFFSET, value);
-
-	return 0;
-}
-
-static int oxnas_dwmac_init(struct platform_device *pdev, void *priv)
-{
-	struct oxnas_dwmac *dwmac =3D priv;
-	int ret;
-
-	/* Reset HW here before changing the glue configuration */
-	ret =3D device_reset(dwmac->dev);
-	if (ret)
-		return ret;
-
-	ret =3D clk_prepare_enable(dwmac->clk);
-	if (ret)
-		return ret;
-
-	ret =3D dwmac->data->setup(dwmac);
-	if (ret)
-		clk_disable_unprepare(dwmac->clk);
-
-	return ret;
-}
-
-static void oxnas_dwmac_exit(struct platform_device *pdev, void *priv)
-{
-	struct oxnas_dwmac *dwmac =3D priv;
-
-	clk_disable_unprepare(dwmac->clk);
-}
-
-static int oxnas_dwmac_probe(struct platform_device *pdev)
-{
-	struct plat_stmmacenet_data *plat_dat;
-	struct stmmac_resources stmmac_res;
-	struct oxnas_dwmac *dwmac;
-	int ret;
-
-	ret =3D stmmac_get_platform_resources(pdev, &stmmac_res);
-	if (ret)
-		return ret;
-
-	plat_dat =3D stmmac_probe_config_dt(pdev, stmmac_res.mac);
-	if (IS_ERR(plat_dat))
-		return PTR_ERR(plat_dat);
-
-	dwmac =3D devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
-	if (!dwmac) {
-		ret =3D -ENOMEM;
-		goto err_remove_config_dt;
-	}
-
-	dwmac->data =3D (const struct oxnas_dwmac_data *)of_device_get_match_data=
(&pdev->dev);
-	if (!dwmac->data) {
-		ret =3D -EINVAL;
-		goto err_remove_config_dt;
-	}
-
-	dwmac->dev =3D &pdev->dev;
-	plat_dat->bsp_priv =3D dwmac;
-	plat_dat->init =3D oxnas_dwmac_init;
-	plat_dat->exit =3D oxnas_dwmac_exit;
-
-	dwmac->regmap =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							"oxsemi,sys-ctrl");
-	if (IS_ERR(dwmac->regmap)) {
-		dev_err(&pdev->dev, "failed to have sysctrl regmap\n");
-		ret =3D PTR_ERR(dwmac->regmap);
-		goto err_remove_config_dt;
-	}
-
-	dwmac->clk =3D devm_clk_get(&pdev->dev, "gmac");
-	if (IS_ERR(dwmac->clk)) {
-		ret =3D PTR_ERR(dwmac->clk);
-		goto err_remove_config_dt;
-	}
-
-	ret =3D oxnas_dwmac_init(pdev, plat_dat->bsp_priv);
-	if (ret)
-		goto err_remove_config_dt;
-
-	ret =3D stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_dwmac_exit;
-
-
-	return 0;
-
-err_dwmac_exit:
-	oxnas_dwmac_exit(pdev, plat_dat->bsp_priv);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
-
-	return ret;
-}
-
-static const struct oxnas_dwmac_data ox810se_dwmac_data =3D {
-	.setup =3D oxnas_dwmac_setup_ox810se,
-};
-
-static const struct oxnas_dwmac_data ox820_dwmac_data =3D {
-	.setup =3D oxnas_dwmac_setup_ox820,
-};
-
-static const struct of_device_id oxnas_dwmac_match[] =3D {
-	{
-		.compatible =3D "oxsemi,ox810se-dwmac",
-		.data =3D &ox810se_dwmac_data,
-	},
-	{
-		.compatible =3D "oxsemi,ox820-dwmac",
-		.data =3D &ox820_dwmac_data,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, oxnas_dwmac_match);
-
-static struct platform_driver oxnas_dwmac_driver =3D {
-	.probe  =3D oxnas_dwmac_probe,
-	.remove_new =3D stmmac_pltfr_remove,
-	.driver =3D {
-		.name           =3D "oxnas-dwmac",
-		.pm		=3D &stmmac_pltfr_pm_ops,
-		.of_match_table =3D oxnas_dwmac_match,
-	},
-};
-module_platform_driver(oxnas_dwmac_driver);
-
-MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-MODULE_DESCRIPTION("Oxford Semiconductor OXNAS DWMAC glue layer");
-MODULE_LICENSE("GPL v2");

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#301): https://groups.io/g/linux-oxnas/message/301
Mute This Topic: https://groups.io/mt/99877135/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


