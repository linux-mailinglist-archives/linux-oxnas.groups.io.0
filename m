Return-Path: <bounce+16102+309+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2C974407B
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:59:04 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id tubpYY1809624x19z9N103Zz; Fri, 30 Jun 2023 09:59:03 -0700
X-Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.19036.1688144342931729171
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:59:03 -0700
X-Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso11328995e9.1
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:59:02 -0700 (PDT)
X-Gm-Message-State: RiSVrNpxKXfRcxQpFRoZuiN6x1808289AA=
X-Google-Smtp-Source: APBJJlHFfj2oZl0xVr1nB2zXh05figvBAqXp7tIH/wIQJvw0txyZj53M9A0+P0VhEGIP+1a6UuKwCw==
X-Received: by 2002:a5d:49d1:0:b0:314:172b:a75a with SMTP id t17-20020a5d49d1000000b00314172ba75amr3025280wrs.26.1688144340838;
        Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:40 +0200
Subject: [linux-oxnas] [PATCH v2 15/15] MAINTAINERS: remove OXNAS entry
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-15-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/Lhm4rki32xogr5e1680FrjcVLCt+j7sMVgTOqF2+4g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm6aoHZMmN8vUbEzTBcIOV7ONJvx2yeNn0kZRnx
 LgLt0iSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JugAKCRB33NvayMhJ0aMOD/
 4o1u07bP99PyNkyrdoo5HuA/tEA4HRTOWRFwUBK2Fr4hLcuccLKZbqEoot/K06rPOpWlmBA0xJibYq
 9sx1cEJc+h2Z6AM6bLv21ZYqK5qXiv45NFZpA+avGwHQ3eQR49KMC8+J9Fb92MOTESddkVzr1uu4WE
 e9aJ1LI/ccd/i2cJ1q6JYWT4B5L5cIQbiI/ZtSRz8pqJ4w6w0RKypV0T7VJm80k0Jv8SmEp0Dlp+vG
 2WQAMcwB/wTd8fh2LKmHED0shMiW2MEQuAkLKiPoDPvybnsLhvaPHGkWmSMXRhTZl6DoGzOsvrTeGt
 aTFim1T/5SP8kSCH5IyYKe7HfsE8Yt9gBcyRyqu0NC2ehuN5DgDWJ25XQwf3CLLfN8xEj42a7f9Exr
 zWAe21b8vupE/IPlBZdtLAl4pizrS9O5UPCdYcEh7XVCBa8AMrQci3cdYVfnZjmMz9oQqhg9nYhA0V
 JGXiIp5zNtWsKoFqxPzpq30E48YAl7SC9jsUWLsXeqRm5FyrRsX8HmFPcHSNlOHUHID+XL5ltvxMy9
 5gbGOWZlwiRjX+X7+KZrzjzudA7BX8jOe+INgytdS3AgKSHSOiXc8Sx/ja2xf/Z/Hwp1CQeFZO2eQN
 2DfMAaMQrsOrzJs9Ps4BqxlAh6NcIKGU989Dmfjl521a7QN3/cdOvxA/sGbw==
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
 q=dns/txt; s=20140610; t=1688144343;
 bh=p/7VbdD3bBboCmlbAy5pk0EeVd7wdr2ktLzztE/xUmk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=pMyqgUdlFxl0bUPihIY9h4QlRFrSbXYir7Xl5GqcPJdMp2EJP08zWA+kUQLr1OfgMhQ
 TkSmqtRklDCd4y/V44JXIgWMD6d2Fi22LLyo/ProNALoMDkg1EIJ4Wy8ilax6bcbqJRNm
 gzdVtRoIYSSmtIbuS4pyAmDFZM1K1bi3nEk=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove MAINTAINERS
entry for OXNAS files.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 MAINTAINERS | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4545d4287305..cfe1bc884005 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2565,16 +2565,6 @@ S:	Maintained
 W:	http://www.digriz.org.uk/ts78xx/kernel
 F:	arch/arm/mach-orion5x/ts78xx-*
=20
-ARM/OXNAS platform support
-M:	Neil Armstrong <neil.armstrong@linaro.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-oxnas@groups.io (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm/boot/dts/ox8*.dts*
-F:	arch/arm/mach-oxnas/
-F:	drivers/power/reset/oxnas-restart.c
-N:	oxnas
-
 ARM/QUALCOMM CHROMEBOOK SUPPORT
 R:	cros-qcom-dts-watchers@chromium.org
 F:	arch/arm64/boot/dts/qcom/sc7180*

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#309): https://groups.io/g/linux-oxnas/message/309
Mute This Topic: https://groups.io/mt/99877145/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


