Return-Path: <bounce+16102+312+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C77699C4
	for <lists+linux-oxnas@lfdr.de>; Mon, 31 Jul 2023 16:41:29 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=Hwe5govbdX27tv9/w7LuP41HNMclYkABflvT+Hs1i8c=;
 c=relaxed/simple; d=groups.io;
 h=X-Received:X-Received:X-Received:X-Gm-Message-State:X-Google-Smtp-Source:X-Received:X-Received:From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Reply-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1690814487; v=1;
 b=RxqBjvxK0+sRueP1Qp7D35WDsNaGLwS798WTf3poeOGE1UbBW78x7rnzXtkGRTzhz3MMbJI7
 OuzFpWKdS/w1CM6AucKl0mgdetr6vGSE0mmn8IH3HxUBvQ8KNZBnYq6GwUq5eGSRnJXbJjJ6f1o
 ptKFm0J3qip1SDmcaOfAnP1Y=
X-Received: by 127.0.0.2 with SMTP id P1hGYY1809624xiCGqmFJnTy; Mon, 31 Jul 2023 07:41:27 -0700
X-Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9419.1690814487376207786
 for <linux-oxnas@groups.io>;
 Mon, 31 Jul 2023 07:41:27 -0700
X-Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3177f520802so3054436f8f.1
        for <linux-oxnas@groups.io>; Mon, 31 Jul 2023 07:41:27 -0700 (PDT)
X-Gm-Message-State: f1U2P62FdEm5SZkDupruj41Cx1808289AA=
X-Google-Smtp-Source: APBJJlFS6nEekNqNV5prtaay1YYel2Fl8nlJp2LyuCtRil9V1ranq5K2vd62NQOD0AUBnC/8YeNu2A==
X-Received: by 2002:adf:fc50:0:b0:317:a499:72c8 with SMTP id e16-20020adffc50000000b00317a49972c8mr30257wrs.1.1690814485807;
        Mon, 31 Jul 2023 07:41:25 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm13257372wrn.52.2023.07.31.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:41:25 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Mon, 31 Jul 2023 16:41:10 +0200
Subject: [linux-oxnas] [PATCH net-next v3 1/2] net: stmmac: dwmac-oxnas: remove obsolete dwmac glue driver
MIME-Version: 1.0
Message-Id: <20230731-topic-oxnas-upstream-remove-v3-1-a1bddb085629@linaro.org>
References: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
In-Reply-To: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Daniel Golle <daniel@makrotopia.org>, Andy Shevchenko <andy@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=9157;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KeK91Ff9kAz/F8VcpGA5H65IebgU7OcdG/h/JNKzMs4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkx8gSmgB3tDKsuresBAH0IVYea2GMt9ADt1rMlpoN
 RJKPUliJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMfIEgAKCRB33NvayMhJ0Qs8EA
 CKLwMg/bBsdpuutx1LspD0a7lJ1atynFGsHzC9LrXKAZpVIWiDwDvFpoQWBr9PxWuINErZmWUNUv1a
 C+s4UkX5pVS97M80DodFze9uMsDCkM+/aQgxQ/uIn51lqMu8Xn4Kn/vymR1u1lyoa6kUj0Q9cfw+hf
 GFfub0odCOTWxv7jO1GA9rsAnCfQAvBtWtLkfWdurn6IOXbMmlp4phO1DzCtY/byZ9bEl25PcbaEDN
 /NIyCbJSN0attaH2+4m3CJfaC2QDlKLLn59V78hJ1LESSk2c+ZydyZzqdozNts2NxfoCmm+3Z5d1vS
 Q7SfDjQroJ2br8s6XjvFOTNjKfDsqUf/xXqcyVbcJcnWbd9gAG7MKjO19mGry1KU7xIvptmQqH7Raa
 7lzXtn85Tg48tcOoue/hdUU6/S+eFNb4K6B6bsEduJS5puaAFSw08zvSIL8/0bdkw9evx4YWt1BUbj
 4uX/VSUnIR+093eDLk121E6lMKXnUGxgDGqBKF3DzIr2qiih3gcpsWDGncftpTTWbgVjWBakb7VSNN
 fGvYZpF9IhfMNe8sDOEODH6NGzwR/0BSyJS3PwkmC9dBYq9y8s9GX+Su51mZEYUfmIcKxrMvYyRqIv
 bTjOkg0tm3131+sW79l3RD6gUc6dlScu/ukBODqbr2MbLl1MrBXW2iKoFN+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: Bulk
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/plugh>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 ethernet.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig       |  11 -
 drivers/net/ethernet/stmicro/stmmac/Makefile      |   1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c | 244 ------------------=
----
 3 files changed, 256 deletions(-)

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
index f91753565d60..000000000000
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
+++ /dev/null
@@ -1,244 +0,0 @@
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
View/Reply Online (#312): https://groups.io/g/linux-oxnas/message/312
Mute This Topic: https://groups.io/mt/100462873/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


