Return-Path: <bounce+16102+56+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 03085791E1
	for <lists+linux-oxnas@lfdr.de>; Mon, 29 Jul 2019 19:19:09 +0200 (CEST)
X-Received: from huawei.com (huawei.com [45.249.212.32])
 by groups.io with SMTP; Thu, 25 Jul 2019 07:24:37 -0700
X-Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C3ECBCDEFA99158479AC;
	Thu, 25 Jul 2019 22:24:33 +0800 (CST)
X-Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 25 Jul 2019
 22:24:23 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <linus.walleij@linaro.org>, <narmstrong@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-oxnas@groups.io>,
	<linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [linux-oxnas] [PATCH] pinctrl: oxnas: remove set but not used variable 'arg'
Date: Thu, 25 Jul 2019 22:24:19 +0800
Message-ID: <20190725142419.29892-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,yuehaibing@huawei.com
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1564420748;
 bh=uc08bdwOKUT4YH/7MvGULqTfiP4tZJl4Rm/WXz0mPj0=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=j8XPgvGcQriTtGN7abkABxasWXZf/LOoRUXp1pIZndJOEwc64sH35FP3OOffCYHcCyl
 0x9hP3IF0hdXyMq/hXpnEUzDRz1mFxjas71FwAjHVHaleY73eYuAhbDwtTBx1DgrOOjwK
 4twpaPtSzXboNnLBB+BxDfSVuPW9oJpHJWQ=

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/pinctrl/pinctrl-oxnas.c: In function oxnas_ox810se_pinconf_set:
drivers/pinctrl/pinctrl-oxnas.c:905:6: warning: variable arg set but not used [-Wunused-but-set-variable]
drivers/pinctrl/pinctrl-oxnas.c: In function oxnas_ox820_pinconf_set:
drivers/pinctrl/pinctrl-oxnas.c:944:6: warning: variable arg set but not used [-Wunused-but-set-variable]

It is never used since commit 4b0c0c25fa79 ("pinctrl:
oxnas: Add support for OX820"), so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/pinctrl-oxnas.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index b4edbe0..fa81a09 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -902,7 +902,6 @@ static int oxnas_ox810se_pinconf_set(struct pinctrl_dev *pctldev,
 	struct oxnas_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct oxnas_gpio_bank *bank = pctl_to_bank(pctl, pin);
 	unsigned int param;
-	u32 arg;
 	unsigned int i;
 	u32 offset = pin - bank->gpio_chip.base;
 	u32 mask = BIT(offset);
@@ -912,7 +911,6 @@ static int oxnas_ox810se_pinconf_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_UP:
@@ -941,7 +939,6 @@ static int oxnas_ox820_pinconf_set(struct pinctrl_dev *pctldev,
 	struct oxnas_gpio_bank *bank = pctl_to_bank(pctl, pin);
 	unsigned int bank_offset = (bank->id ? PINMUX_820_BANK_OFFSET : 0);
 	unsigned int param;
-	u32 arg;
 	unsigned int i;
 	u32 offset = pin - bank->gpio_chip.base;
 	u32 mask = BIT(offset);
@@ -951,7 +948,6 @@ static int oxnas_ox820_pinconf_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_UP:
-- 
2.7.4



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#56): https://groups.io/g/linux-oxnas/message/56
Mute This Topic: https://groups.io/mt/32644935/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

