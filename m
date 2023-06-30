Return-Path: <bounce+16102+307+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB02744073
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:59:00 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id Vq4vYY1809624xIvKSOrcVO0; Fri, 30 Jun 2023 09:58:59 -0700
X-Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.19033.1688144339084829509
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:59 -0700
X-Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-314172bb818so2325236f8f.1
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:58 -0700 (PDT)
X-Gm-Message-State: hYIodz4eLyq5XO5ycR6TMlX0x1808289AA=
X-Google-Smtp-Source: APBJJlEKyEGgCYGMVtZF4uOEb2+kQTTFHk1HYk7zoA+qJfRnhfllehuKYiRJedUqKHunCJKD/gD5YA==
X-Received: by 2002:adf:ed0a:0:b0:314:13e2:2f6c with SMTP id a10-20020adfed0a000000b0031413e22f6cmr2444572wro.58.1688144337623;
        Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:38 +0200
Subject: [linux-oxnas] [PATCH v2 13/15] irqchip: irq-versatile-fpga: remove obsolete oxnas compatible
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-13-fb6ab3dea87c@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Hwq/1nyBJbIaeaNsvFzhDu1oXx5gpF7OJ2azvf7yeno=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5eVilyz5juesTZ+I8YEmM7E2RHfvZxVYP1ZZV
 mwVWJPmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0dq1EA
 Cn2KcT1QQ1o1T7+RYh3kPUyZMDiiOc1DSphO3W/uzuy17B2do61hFjY0ldTR9LVnga9ZpODHRUkIR7
 XY925yWYXfnrJgPmf02FEU37ju1/RJ424oSZMlsZ99qOyF0Gd4/pCCGcSwDiVhFH6+gx4ASuiOTZc9
 UNHnfQjGBOcD/HnhgwB38S+QSpueoaTYDT6Mjc5cX0SBcGXjGp9Bx+Md99BODkp4Hd9Y5mJ+CY/+8/
 w1GO8w/7Dmb7m79QwPWi6c/G5/i5MHFpAl9kc2QU/6ynyI5xPJUoJiFFLZAlNngwtVPWJENg0Q1UBw
 YN7jBh7yKomkrlxp6NW4WKFYSEFaKt4ybYtjmo+3DmpbQO/yc6r1k1bl46qufJJWzK1fE7phMItHf/
 1EO6h4/9HG5YhAEmtw4VuXyotDSG7xHUX84iTUqisRFHtkh3aq+vcCh42Glx+/g9amw3FUDvIQw9lm
 B7w/d/CgDk94Qs0gp/nKv8v/o1/fZMhTgS2mZbSXar3CcvfJEaoG3oNjk0VIK8iHwEbgROuQgEGKbz
 evwteKmyZKDOO1c/lCrJmD/4h3CnxXB9HxUynW1SZXjBIpchVe5SetsPfmEo1WkJzkyQvNovTcLpaJ
 rjkszeLvxd0rHZrpvV22nNfMyHRdmt4uWeyFu7fIz0koHI40RGLbE+d44/5Q==
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
 q=dns/txt; s=20140610; t=1688144339;
 bh=nupIdhgcqqx89HJtTRhRgLpOyGEB7bAQ/osMXLmom1k=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=n56bZ8dOWZN1Ztw82ZWfRZzsupGDMNNaQMOwHsOdEXCgB0y9fe/ujH2PlDbIPUU73UK
 UCVgvOvvAVw2gW0Q0Q2KxYUsqrmXVPMU1Z08qbV12roodwk0Q6QBMjHSKRtwYrtIJ+QYB
 6VTlpaCEPAOaY2YnEOMNc5H5ofpvuNXpo+U=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-ver=
satile-fpga.c
index ba543ed9c154..5018a06060e6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -242,5 +242,4 @@ static int __init fpga_irq_of_init(struct device_node *=
node,
 }
 IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
 IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
-IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
 #endif

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#307): https://groups.io/g/linux-oxnas/message/307
Mute This Topic: https://groups.io/mt/99877142/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


