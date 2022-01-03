Return-Path: <bounce+16102+145+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CF483678
	for <lists+linux-oxnas@lfdr.de>; Mon,  3 Jan 2022 18:56:47 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id lYHxYY1809624xFtfWLNRYZp; Mon, 03 Jan 2022 09:56:46 -0800
X-Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.31777.1641232603820027122
 for <linux-oxnas@groups.io>;
 Mon, 03 Jan 2022 09:56:44 -0800
X-Received: by mail-wr1-f42.google.com with SMTP id e5so71313663wrc.5
        for <linux-oxnas@groups.io>; Mon, 03 Jan 2022 09:56:43 -0800 (PST)
X-Gm-Message-State: Gq9JVs4ud9BmX0txgkHVKKI3x1808289AA=
X-Google-Smtp-Source: ABdhPJxOtKYtTNaIgDan8PjmiObJStT/bn80hFMljJ8rGG+Y+kZqa1LMyYMm0veoWk234qEPQBjQbg==
X-Received: by 2002:a05:6000:118a:: with SMTP id g10mr38020352wrx.533.1641232602351;
        Mon, 03 Jan 2022 09:56:42 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
        by smtp.gmail.com with ESMTPSA id f13sm35763228wri.51.2022.01.03.09.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:56:41 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: davem@davemloft.net
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io,
	linux-kernel@vger.kernel.org
Subject: [linux-oxnas] [PATCH net-next 2/3] net: stmmac: dwmac-oxnas: Add support for OX810SE
Date: Mon,  3 Jan 2022 18:56:37 +0100
Message-Id: <20220103175638.89625-3-narmstrong@baylibre.com>
In-Reply-To: <20220103175638.89625-1-narmstrong@baylibre.com>
References: <20220103175638.89625-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1641232606;
 bh=MS8toj81iTEqoSzuaRaKZTe2Q4JQ+6lqcQg+TN1LQf4=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=S8VGfk3xjla7IZOtENWPXVE5n3+sFzvNFBmZr9Qqje6QT9QEWKxahxzSSQJxgBCxh1U
 UDqLoCn4a0wp/pwS3BcnnqxwaM4a4qOI6eA4QdMO7pUaQKVTpyZT02Dd2dLgnu43XJicG
 7Xcmz9ckmBtVkFUVOlHeolpRte7M1SPaX2c=

Add support for OX810SE dwmac glue setup, which is a simplified version
of the OX820 introduced later with more control on the PHY interface.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-oxnas.c | 92 ++++++++++++++-----
 1 file changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
index adfeb8d3293d..7ffa4a4eb30f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
@@ -48,12 +49,58 @@
 #define DWMAC_RX_VARDELAY(d)		((d) << DWMAC_RX_VARDELAY_SHIFT)
 #define DWMAC_RXN_VARDELAY(d)		((d) << DWMAC_RXN_VARDELAY_SHIFT)
 
+struct oxnas_dwmac;
+
+struct oxnas_dwmac_data {
+	void (*setup)(struct oxnas_dwmac *dwmac);
+};
+
 struct oxnas_dwmac {
 	struct device	*dev;
 	struct clk	*clk;
 	struct regmap	*regmap;
+	const struct oxnas_dwmac_data	*data;
 };
 
+static void oxnas_dwmac_setup_ox810se(struct oxnas_dwmac *dwmac)
+{
+	unsigned int value;
+
+	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY */
+	value = BIT(DWMAC_CKEN_GTX)		|
+		 /* Use simple mux for 25/125 Mhz clock switching */
+		 BIT(DWMAC_SIMPLE_MUX);
+
+	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
+}
+
+static void oxnas_dwmac_setup_ox820(struct oxnas_dwmac *dwmac)
+{
+	unsigned int value;
+
+	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY */
+	value = BIT(DWMAC_CKEN_GTX)		|
+		 /* Use simple mux for 25/125 Mhz clock switching */
+		BIT(DWMAC_SIMPLE_MUX)		|
+		/* set auto switch tx clock source */
+		BIT(DWMAC_AUTO_TX_SOURCE)	|
+		/* enable tx & rx vardelay */
+		BIT(DWMAC_CKEN_TX_OUT)		|
+		BIT(DWMAC_CKEN_TXN_OUT)	|
+		BIT(DWMAC_CKEN_TX_IN)		|
+		BIT(DWMAC_CKEN_RX_OUT)		|
+		BIT(DWMAC_CKEN_RXN_OUT)	|
+		BIT(DWMAC_CKEN_RX_IN);
+	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
+
+	/* set tx & rx vardelay */
+	value = DWMAC_TX_VARDELAY(4)	|
+		DWMAC_TXN_VARDELAY(2)	|
+		DWMAC_RX_VARDELAY(10)	|
+		DWMAC_RXN_VARDELAY(8);
+	regmap_write(dwmac->regmap, OXNAS_DWMAC_DELAY_REGOFFSET, value);
+}
+
 static int oxnas_dwmac_init(struct platform_device *pdev, void *priv)
 {
 	struct oxnas_dwmac *dwmac = priv;
@@ -75,27 +122,7 @@ static int oxnas_dwmac_init(struct platform_device *pdev, void *priv)
 		return ret;
 	}
 
-	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY */
-	value |= BIT(DWMAC_CKEN_GTX)		|
-		 /* Use simple mux for 25/125 Mhz clock switching */
-		 BIT(DWMAC_SIMPLE_MUX)		|
-		 /* set auto switch tx clock source */
-		 BIT(DWMAC_AUTO_TX_SOURCE)	|
-		 /* enable tx & rx vardelay */
-		 BIT(DWMAC_CKEN_TX_OUT)		|
-		 BIT(DWMAC_CKEN_TXN_OUT)	|
-		 BIT(DWMAC_CKEN_TX_IN)		|
-		 BIT(DWMAC_CKEN_RX_OUT)		|
-		 BIT(DWMAC_CKEN_RXN_OUT)	|
-		 BIT(DWMAC_CKEN_RX_IN);
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
-
-	/* set tx & rx vardelay */
-	value = DWMAC_TX_VARDELAY(4)	|
-		DWMAC_TXN_VARDELAY(2)	|
-		DWMAC_RX_VARDELAY(10)	|
-		DWMAC_RXN_VARDELAY(8);
-	regmap_write(dwmac->regmap, OXNAS_DWMAC_DELAY_REGOFFSET, value);
+	dwmac->data->setup(dwmac);
 
 	return 0;
 }
@@ -128,6 +155,12 @@ static int oxnas_dwmac_probe(struct platform_device *pdev)
 		goto err_remove_config_dt;
 	}
 
+	dwmac->data = (const struct oxnas_dwmac_data *)of_device_get_match_data(&pdev->dev);
+	if (!dwmac->data) {
+		ret = -EINVAL;
+		goto err_remove_config_dt;
+	}
+
 	dwmac->dev = &pdev->dev;
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->init = oxnas_dwmac_init;
@@ -166,8 +199,23 @@ static int oxnas_dwmac_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static const struct oxnas_dwmac_data ox810se_dwmac_data = {
+	.setup = oxnas_dwmac_setup_ox810se,
+};
+
+static const struct oxnas_dwmac_data ox820_dwmac_data = {
+	.setup = oxnas_dwmac_setup_ox820,
+};
+
 static const struct of_device_id oxnas_dwmac_match[] = {
-	{ .compatible = "oxsemi,ox820-dwmac" },
+	{
+		.compatible = "oxsemi,ox810se-dwmac",
+		.data = &ox810se_dwmac_data,
+	},
+	{
+		.compatible = "oxsemi,ox820-dwmac",
+		.data = &ox820_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, oxnas_dwmac_match);
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#145): https://groups.io/g/linux-oxnas/message/145
Mute This Topic: https://groups.io/mt/88117938/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


