Return-Path: <bounce+16102+295+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1C744041
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:58:41 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id pdNeYY1809624xHwYt7Ff3FJ; Fri, 30 Jun 2023 09:58:39 -0700
X-Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.19018.1688144319280548517
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:39 -0700
X-Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3142860734aso182801f8f.1
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:39 -0700 (PDT)
X-Gm-Message-State: PjcYLhdeERVOSUVb3e6bs3nlx1808289AA=
X-Google-Smtp-Source: ACHHUZ5fJLXkeHDlekS99srv8CaNw+1WybS+1I3eAvpIdoFsONKseLREnwiIE5G4NEju+Wz8e4zHNQ==
X-Received: by 2002:a5d:4bc3:0:b0:314:99e:af46 with SMTP id l3-20020a5d4bc3000000b00314099eaf46mr8051304wrt.20.1688144317723;
        Fri, 30 Jun 2023 09:58:37 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:37 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:26 +0200
Subject: [linux-oxnas] [PATCH v2 01/15] clk: oxnas: remove obsolete clock driver
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-1-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9036;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1hf999g5eEtxLqg8V04tUPdGH+Hq91QPzTw+uaq9mYk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm0FtQDp9YXTDLZeHYHxn9vyusAxAx2Z1sd8aTE
 pfEkqtCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtAAKCRB33NvayMhJ0SWoEA
 C1ki9NvMY6YAJTD7BcigSaZFUnNaU3bNIzzoTSAIyg+6TKBlDoXVdGwTbafVx6QhUhwNO3NhCK5A6a
 oyCqgHPD4lFTu9ROCWJ2CL278zqVx1VmcSa+uOlpzKK4YYEaWm3vsa7+U5iVGZ8UAOkHyXdnzO8s8w
 1Dfqra3pX8U+bPlqDir97EjKWcfUDdAdzCU6sHYH2n3tQOnojyMSPnw0UwLguaknlzQjDPs029ARay
 XbH6olhY+PTxvnpFJw0Q5HqUuAv4X4Sq4cyUhfV2s/I9v+m0TAwMF+VVAVg1hmYOwWEhzkbiXYY1xg
 ehVEfeUKR3rsFfUMKYZsyfcHGfn9t+/OKBDm7Zr7tQ6x5e4WWB7R0DuWIdeMDAxJw7hkkP+i86lkor
 BKAR2oZiZpywLv+E9+kDhrys05V3s2hMWkjZcB54j5x75xihTEOkua+Wl3qE6PQIuvXbWzGychMmgA
 tBoNJApM2Rh8CFnosbeCabkduja6txGtKlOtxEoTmLmQIDe26HFznjp8yeBoqw9W5yUjj8W8GsTZZM
 EZ8nbLkV9nJjLOI47CzUJgQbQsZCHsILHByMA8g9mlLN9qs74x5fbf9RtEE9gwQqUTQbHb9eIKjXx7
 3fMabs0tQEqq4OPYpGl4GAhLKjcbpCbtNATt6UR9Mu0l878Fs4XmAloBcWDw==
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
 q=dns/txt; s=20140610; t=1688144319;
 bh=u78T0T/M7/7AwFOkR9OvuhBVnGZlPKZHZqSeVN5ppBs=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=UMZLtTBT1NL4wRfC1J883MjnkBvL1PFrKNthkvWobJ0wZkYU88JxUSyVYYoCvvEPNZd
 GK3Q/0DiTcxxg1VBHg3HdQb8eBRVSY2wfhOc27u4iBIF8r+T3tsTnCgN5G0bqUq+VWqSl
 MkSENmJZTad8Acfl97dO9xRK+iMEiHX+Q48=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 clock driver.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/Kconfig     |   7 --
 drivers/clk/Makefile    |   1 -
 drivers/clk/clk-oxnas.c | 251 --------------------------------------------=
----
 3 files changed, 259 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 93f38a8178ba..59a101e1cf65 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -360,13 +360,6 @@ config COMMON_CLK_PXA
 	help
 	  Support for the Marvell PXA SoC.
=20
-config COMMON_CLK_OXNAS
-	bool "Clock driver for the OXNAS SoC Family"
-	depends on ARCH_OXNAS || COMPILE_TEST
-	select MFD_SYSCON
-	help
-	  Support for the OXNAS SoC Family clocks.
-
 config COMMON_CLK_RS9_PCIE
 	tristate "Clock driver for Renesas 9-series PCIe clock generators"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 7cb000549b61..94155999eba3 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -52,7 +52,6 @@ obj-$(CONFIG_ARCH_MOXART)		+=3D clk-moxart.o
 obj-$(CONFIG_ARCH_NOMADIK)		+=3D clk-nomadik.o
 obj-$(CONFIG_ARCH_NPCM7XX)	    	+=3D clk-npcm7xx.o
 obj-$(CONFIG_ARCH_NSPIRE)		+=3D clk-nspire.o
-obj-$(CONFIG_COMMON_CLK_OXNAS)		+=3D clk-oxnas.o
 obj-$(CONFIG_COMMON_CLK_PALMAS)		+=3D clk-palmas.o
 obj-$(CONFIG_CLK_LS1028A_PLLDIG)	+=3D clk-plldig.o
 obj-$(CONFIG_COMMON_CLK_PWM)		+=3D clk-pwm.o
diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
deleted file mode 100644
index 584e293156ad..000000000000
--- a/drivers/clk/clk-oxnas.c
+++ /dev/null
@@ -1,251 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2010 Broadcom
- * Copyright (C) 2012 Stephen Warren
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-#include <linux/stringify.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-
-#include <dt-bindings/clock/oxsemi,ox810se.h>
-#include <dt-bindings/clock/oxsemi,ox820.h>
-
-/* Standard regmap gate clocks */
-struct clk_oxnas_gate {
-	struct clk_hw hw;
-	unsigned int bit;
-	struct regmap *regmap;
-};
-
-struct oxnas_stdclk_data {
-	struct clk_hw_onecell_data *onecell_data;
-	struct clk_oxnas_gate **gates;
-	unsigned int ngates;
-	struct clk_oxnas_pll **plls;
-	unsigned int nplls;
-};
-
-/* Regmap offsets */
-#define CLK_STAT_REGOFFSET	0x24
-#define CLK_SET_REGOFFSET	0x2c
-#define CLK_CLR_REGOFFSET	0x30
-
-static inline struct clk_oxnas_gate *to_clk_oxnas_gate(struct clk_hw *hw)
-{
-	return container_of(hw, struct clk_oxnas_gate, hw);
-}
-
-static int oxnas_clk_gate_is_enabled(struct clk_hw *hw)
-{
-	struct clk_oxnas_gate *std =3D to_clk_oxnas_gate(hw);
-	int ret;
-	unsigned int val;
-
-	ret =3D regmap_read(std->regmap, CLK_STAT_REGOFFSET, &val);
-	if (ret < 0)
-		return ret;
-
-	return val & BIT(std->bit);
-}
-
-static int oxnas_clk_gate_enable(struct clk_hw *hw)
-{
-	struct clk_oxnas_gate *std =3D to_clk_oxnas_gate(hw);
-
-	regmap_write(std->regmap, CLK_SET_REGOFFSET, BIT(std->bit));
-
-	return 0;
-}
-
-static void oxnas_clk_gate_disable(struct clk_hw *hw)
-{
-	struct clk_oxnas_gate *std =3D to_clk_oxnas_gate(hw);
-
-	regmap_write(std->regmap, CLK_CLR_REGOFFSET, BIT(std->bit));
-}
-
-static const struct clk_ops oxnas_clk_gate_ops =3D {
-	.enable =3D oxnas_clk_gate_enable,
-	.disable =3D oxnas_clk_gate_disable,
-	.is_enabled =3D oxnas_clk_gate_is_enabled,
-};
-
-static const char *const osc_parents[] =3D {
-	"oscillator",
-};
-
-static const char *const eth_parents[] =3D {
-	"gmacclk",
-};
-
-#define OXNAS_GATE(_name, _bit, _parents)				\
-struct clk_oxnas_gate _name =3D {						\
-	.bit =3D (_bit),							\
-	.hw.init =3D &(struct clk_init_data) {				\
-		.name =3D #_name,						\
-		.ops =3D &oxnas_clk_gate_ops,				\
-		.parent_names =3D _parents,				\
-		.num_parents =3D ARRAY_SIZE(_parents),			\
-		.flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
-	},								\
-}
-
-static OXNAS_GATE(ox810se_leon, 0, osc_parents);
-static OXNAS_GATE(ox810se_dma_sgdma, 1, osc_parents);
-static OXNAS_GATE(ox810se_cipher, 2, osc_parents);
-static OXNAS_GATE(ox810se_sata, 4, osc_parents);
-static OXNAS_GATE(ox810se_audio, 5, osc_parents);
-static OXNAS_GATE(ox810se_usbmph, 6, osc_parents);
-static OXNAS_GATE(ox810se_etha, 7, eth_parents);
-static OXNAS_GATE(ox810se_pciea, 8, osc_parents);
-static OXNAS_GATE(ox810se_nand, 9, osc_parents);
-
-static struct clk_oxnas_gate *ox810se_gates[] =3D {
-	&ox810se_leon,
-	&ox810se_dma_sgdma,
-	&ox810se_cipher,
-	&ox810se_sata,
-	&ox810se_audio,
-	&ox810se_usbmph,
-	&ox810se_etha,
-	&ox810se_pciea,
-	&ox810se_nand,
-};
-
-static OXNAS_GATE(ox820_leon, 0, osc_parents);
-static OXNAS_GATE(ox820_dma_sgdma, 1, osc_parents);
-static OXNAS_GATE(ox820_cipher, 2, osc_parents);
-static OXNAS_GATE(ox820_sd, 3, osc_parents);
-static OXNAS_GATE(ox820_sata, 4, osc_parents);
-static OXNAS_GATE(ox820_audio, 5, osc_parents);
-static OXNAS_GATE(ox820_usbmph, 6, osc_parents);
-static OXNAS_GATE(ox820_etha, 7, eth_parents);
-static OXNAS_GATE(ox820_pciea, 8, osc_parents);
-static OXNAS_GATE(ox820_nand, 9, osc_parents);
-static OXNAS_GATE(ox820_ethb, 10, eth_parents);
-static OXNAS_GATE(ox820_pcieb, 11, osc_parents);
-static OXNAS_GATE(ox820_ref600, 12, osc_parents);
-static OXNAS_GATE(ox820_usbdev, 13, osc_parents);
-
-static struct clk_oxnas_gate *ox820_gates[] =3D {
-	&ox820_leon,
-	&ox820_dma_sgdma,
-	&ox820_cipher,
-	&ox820_sd,
-	&ox820_sata,
-	&ox820_audio,
-	&ox820_usbmph,
-	&ox820_etha,
-	&ox820_pciea,
-	&ox820_nand,
-	&ox820_etha,
-	&ox820_pciea,
-	&ox820_ref600,
-	&ox820_usbdev,
-};
-
-static struct clk_hw_onecell_data ox810se_hw_onecell_data =3D {
-	.hws =3D {
-		[CLK_810_LEON]	=3D &ox810se_leon.hw,
-		[CLK_810_DMA_SGDMA]	=3D &ox810se_dma_sgdma.hw,
-		[CLK_810_CIPHER]	=3D &ox810se_cipher.hw,
-		[CLK_810_SATA]	=3D &ox810se_sata.hw,
-		[CLK_810_AUDIO]	=3D &ox810se_audio.hw,
-		[CLK_810_USBMPH]	=3D &ox810se_usbmph.hw,
-		[CLK_810_ETHA]	=3D &ox810se_etha.hw,
-		[CLK_810_PCIEA]	=3D &ox810se_pciea.hw,
-		[CLK_810_NAND]	=3D &ox810se_nand.hw,
-	},
-	.num =3D ARRAY_SIZE(ox810se_gates),
-};
-
-static struct clk_hw_onecell_data ox820_hw_onecell_data =3D {
-	.hws =3D {
-		[CLK_820_LEON]	=3D &ox820_leon.hw,
-		[CLK_820_DMA_SGDMA]	=3D &ox820_dma_sgdma.hw,
-		[CLK_820_CIPHER]	=3D &ox820_cipher.hw,
-		[CLK_820_SD]	=3D &ox820_sd.hw,
-		[CLK_820_SATA]	=3D &ox820_sata.hw,
-		[CLK_820_AUDIO]	=3D &ox820_audio.hw,
-		[CLK_820_USBMPH]	=3D &ox820_usbmph.hw,
-		[CLK_820_ETHA]	=3D &ox820_etha.hw,
-		[CLK_820_PCIEA]	=3D &ox820_pciea.hw,
-		[CLK_820_NAND]	=3D &ox820_nand.hw,
-		[CLK_820_ETHB]	=3D &ox820_ethb.hw,
-		[CLK_820_PCIEB]	=3D &ox820_pcieb.hw,
-		[CLK_820_REF600]	=3D &ox820_ref600.hw,
-		[CLK_820_USBDEV]	=3D &ox820_usbdev.hw,
-	},
-	.num =3D ARRAY_SIZE(ox820_gates),
-};
-
-static struct oxnas_stdclk_data ox810se_stdclk_data =3D {
-	.onecell_data =3D &ox810se_hw_onecell_data,
-	.gates =3D ox810se_gates,
-	.ngates =3D ARRAY_SIZE(ox810se_gates),
-};
-
-static struct oxnas_stdclk_data ox820_stdclk_data =3D {
-	.onecell_data =3D &ox820_hw_onecell_data,
-	.gates =3D ox820_gates,
-	.ngates =3D ARRAY_SIZE(ox820_gates),
-};
-
-static const struct of_device_id oxnas_stdclk_dt_ids[] =3D {
-	{ .compatible =3D "oxsemi,ox810se-stdclk", &ox810se_stdclk_data },
-	{ .compatible =3D "oxsemi,ox820-stdclk", &ox820_stdclk_data },
-	{ }
-};
-
-static int oxnas_stdclk_probe(struct platform_device *pdev)
-{
-	struct device_node *np =3D pdev->dev.of_node, *parent_np;
-	const struct oxnas_stdclk_data *data;
-	struct regmap *regmap;
-	int ret;
-	int i;
-
-	data =3D of_device_get_match_data(&pdev->dev);
-
-	parent_np =3D of_get_parent(np);
-	regmap =3D syscon_node_to_regmap(parent_np);
-	of_node_put(parent_np);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "failed to have parent regmap\n");
-		return PTR_ERR(regmap);
-	}
-
-	for (i =3D 0 ; i < data->ngates ; ++i)
-		data->gates[i]->regmap =3D regmap;
-
-	for (i =3D 0; i < data->onecell_data->num; i++) {
-		if (!data->onecell_data->hws[i])
-			continue;
-
-		ret =3D devm_clk_hw_register(&pdev->dev,
-					   data->onecell_data->hws[i]);
-		if (ret)
-			return ret;
-	}
-
-	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
-				      data->onecell_data);
-}
-
-static struct platform_driver oxnas_stdclk_driver =3D {
-	.probe =3D oxnas_stdclk_probe,
-	.driver	=3D {
-		.name =3D "oxnas-stdclk",
-		.suppress_bind_attrs =3D true,
-		.of_match_table =3D oxnas_stdclk_dt_ids,
-	},
-};
-builtin_platform_driver(oxnas_stdclk_driver);

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#295): https://groups.io/g/linux-oxnas/message/295
Mute This Topic: https://groups.io/mt/99877124/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


