Return-Path: <bounce+16102+287+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D036FCB36
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:23 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id ajRHYY1809624xuKABwQ7cbQ; Tue, 09 May 2023 09:19:22 -0700
X-Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by mx.groups.io with SMTP id smtpd.web10.111114.1683560487858185389
 for <linux-oxnas@groups.io>;
 Mon, 08 May 2023 08:41:29 -0700
X-Received: from lizhe.. (unknown [120.245.132.9])
	by zwqz-smtp-mta-g3-0 (Coremail) with SMTP id _____wBXLFX9F1lkWLGdAw--.17901S4;
	Mon, 08 May 2023 23:41:16 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-oxnas@groups.io,
	linux-stm32@st-md-mailman.stormreply.com,
	Lizhe <sensor1010@163.com>
Subject: [linux-oxnas] [PATCH] dirvers/pinctrl.c : using pinctrl_dev->dev to obtain struct device * dev
Date: Mon,  8 May 2023 23:40:43 +0800
Message-Id: <20230508154043.11859-1-sensor1010@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBXLFX9F1lkWLGdAw--.17901S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ww4UXFy3KF47Zw1xXFW8JFb_yoWxuryDpa
	1fXay5Kr17JF4xJry5A3yUuFy3Kan7J3yxG34UKasrZa15XF97J3y5KF40yFs5KFWkAw43
	Xa15XryY9w1UAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR8OzxUUUUU=
X-Originating-IP: [120.245.132.9]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBdBxpq1gi6EszigAAsK
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,sensor1010@163.com
X-Gm-Message-State: gRFJaJhoRTrKyEmXqLB703q4x1808289AA=
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649162;
 bh=LL3VnTZo+GTjkkq7fFp9dRogK6ylQbw6tLUiBItjuKs=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=VulLCTPamEnKc76cVqZ/KlbFxECN3JXOpEmpBCSdXiMLfGdQLNN2Q2XxHEC6iMvxBWj
 d8Ys0lW/6bfPs0n7VEJEik1jFHPeS3MiEHGDpNLoYck7JEQ7Q/+SQLx7Ycx3wXOS91oyh
 zEgIks+B54/RaALi4xAavRT7X5tHbfVlwdo=

After the execution of the devm_pinctrl_register() function,
the member 'dev' in the 'pinctrl_dev' points to the
'struct device' structure. see pinctrl_init_controller().

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c |  2 +-
 drivers/pinctrl/pinctrl-oxnas.c      | 12 ++++++------
 drivers/pinctrl/pinctrl-pic32.c      | 12 ++++++------
 drivers/pinctrl/pinctrl-stmfx.c      |  6 +++---
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c |  4 ++--
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 3751c7de37aa..9dac920a3619 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -119,7 +119,7 @@ static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	ret = of_property_count_u32_elems(node, "pinmux");
 	if (ret <= 0) {
-		dev_err(pctl->dev,
+		dev_err(pctldev->dev,
 			"missing or empty pinmux property in node %pOFn.\n",
 			node);
 		return ret ? ret : -EINVAL;
diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index fb10a8473ebe..88b03bd9f4dc 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -596,7 +596,7 @@ static int oxnas_ox810se_pinmux_enable(struct pinctrl_dev *pctldev,
 
 	while (functions->name) {
 		if (!strcmp(functions->name, fname)) {
-			dev_dbg(pctl->dev,
+			dev_dbg(pctldev->dev,
 				"setting function %s bank %d pin %d fct %d mask %x\n",
 				fname, pg->bank, pg->pin,
 				functions->fct, mask);
@@ -647,7 +647,7 @@ static int oxnas_ox820_pinmux_enable(struct pinctrl_dev *pctldev,
 
 	while (functions->name) {
 		if (!strcmp(functions->name, fname)) {
-			dev_dbg(pctl->dev,
+			dev_dbg(pctldev->dev,
 				"setting function %s bank %d pin %d fct %d mask %x\n",
 				fname, pg->bank, pg->pin,
 				functions->fct, mask);
@@ -697,7 +697,7 @@ static int oxnas_ox810se_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct oxnas_gpio_bank *bank = gpiochip_get_data(range->gc);
 	u32 mask = BIT(offset - bank->gpio_chip.base);
 
-	dev_dbg(pctl->dev, "requesting gpio %d in bank %d (id %d) with mask 0x%x\n",
+	dev_dbg(pctldev->dev, "requesting gpio %d in bank %d (id %d) with mask 0x%x\n",
 		offset, bank->gpio_chip.base, bank->id, mask);
 
 	regmap_write_bits(pctl->regmap,
@@ -909,7 +909,7 @@ static int oxnas_ox810se_pinconf_set(struct pinctrl_dev *pctldev,
 	u32 offset = pin - bank->gpio_chip.base;
 	u32 mask = BIT(offset);
 
-	dev_dbg(pctl->dev, "setting pin %d bank %d mask 0x%x\n",
+	dev_dbg(pctldev->dev, "setting pin %d bank %d mask 0x%x\n",
 		pin, bank->gpio_chip.base, mask);
 
 	for (i = 0; i < num_configs; i++) {
@@ -946,7 +946,7 @@ static int oxnas_ox820_pinconf_set(struct pinctrl_dev *pctldev,
 	u32 offset = pin - bank->gpio_chip.base;
 	u32 mask = BIT(offset);
 
-	dev_dbg(pctl->dev, "setting pin %d bank %d mask 0x%x\n",
+	dev_dbg(pctldev->dev, "setting pin %d bank %d mask 0x%x\n",
 		pin, bank->gpio_chip.base, mask);
 
 	for (i = 0; i < num_configs; i++) {
@@ -960,7 +960,7 @@ static int oxnas_ox820_pinconf_set(struct pinctrl_dev *pctldev,
 					  mask, mask);
 			break;
 		default:
-			dev_err(pctl->dev, "Property %u not supported\n",
+			dev_err(pctldev->dev, "Property %u not supported\n",
 				param);
 			return -ENOTSUPP;
 		}
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index dad05294fa72..bc98888acb7c 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1937,23 +1937,23 @@ static int pic32_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_UP:
-			dev_dbg(pctl->dev, "   pullup\n");
+			dev_dbg(pctldev->dev, "   pullup\n");
 			writel(mask, bank->reg_base +PIC32_SET(CNPU_REG));
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			dev_dbg(pctl->dev, "   pulldown\n");
+			dev_dbg(pctl_dev->dev, "   pulldown\n");
 			writel(mask, bank->reg_base + PIC32_SET(CNPD_REG));
 			break;
 		case PIN_CONFIG_MICROCHIP_DIGITAL:
-			dev_dbg(pctl->dev, "   digital\n");
+			dev_dbg(pctl_dev->dev, "   digital\n");
 			writel(mask, bank->reg_base + PIC32_CLR(ANSEL_REG));
 			break;
 		case PIN_CONFIG_MICROCHIP_ANALOG:
-			dev_dbg(pctl->dev, "   analog\n");
+			dev_dbg(pctldev->dev, "   analog\n");
 			writel(mask, bank->reg_base + PIC32_SET(ANSEL_REG));
 			break;
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-			dev_dbg(pctl->dev, "   opendrain\n");
+			dev_dbg(pctldev->dev, "   opendrain\n");
 			writel(mask, bank->reg_base + PIC32_SET(ODCU_REG));
 			break;
 		case PIN_CONFIG_INPUT_ENABLE:
@@ -1964,7 +1964,7 @@ static int pic32_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 						    offset, arg);
 			break;
 		default:
-			dev_err(pctl->dev, "Property %u not supported\n",
+			dev_err(pctldev->dev, "Property %u not supported\n",
 				param);
 			return -ENOTSUPP;
 		}
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index ab23d7ac3107..396996201856 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -711,7 +711,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 
 	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
 	if (ret) {
-		dev_err(pctl->dev, "gpio_chip registration failed\n");
+		dev_err(pctldev->dev, "gpio_chip registration failed\n");
 		return ret;
 	}
 
@@ -724,11 +724,11 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 					IRQF_ONESHOT,
 					dev_name(pctl->dev), pctl);
 	if (ret) {
-		dev_err(pctl->dev, "cannot request irq%d\n", irq);
+		dev_err(pctldev->dev, "cannot request irq%d\n", irq);
 		return ret;
 	}
 
-	dev_info(pctl->dev,
+	dev_info(pctldev->dev,
 		 "%ld GPIOs available\n", hweight_long(pctl->gpio_valid_mask));
 
 	return 0;
diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index d2568dab8c78..f997cc26f01f 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -91,7 +91,7 @@ static int pxa2xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	void __iomem *gpdr;
 
 	gpdr = pctl->base_gpdr[pin / 32];
-	dev_dbg(pctl->dev, "set_direction(pin=%d): dir=%d\n",
+	dev_dbg(pctldev->dev, "set_direction(pin=%d): dir=%d\n",
 		pin, !input);
 
 	spin_lock_irqsave(&pctl->lock, flags);
@@ -156,7 +156,7 @@ static int pxa2xx_pmx_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	gafr = pctl->base_gafr[pin / 16];
 	gpdr = pctl->base_gpdr[pin / 32];
 	shift = (pin % 16) << 1;
-	dev_dbg(pctl->dev, "set_mux(pin=%d): af=%d dir=%d\n",
+	dev_dbg(pctldev->dev, "set_mux(pin=%d): af=%d dir=%d\n",
 		pin, df->muxval >> 1, df->muxval & 0x1);
 
 	spin_lock_irqsave(&pctl->lock, flags);
-- 
2.34.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#287): https://groups.io/g/linux-oxnas/message/287
Mute This Topic: https://groups.io/mt/98787606/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


