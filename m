Return-Path: <bounce+16102+300+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A90EE744056
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:58:49 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id G4jJYY1809624xcJU6YgVYTn; Fri, 30 Jun 2023 09:58:48 -0700
X-Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.19024.1688144327859722188
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:48 -0700
X-Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a113so22096765e9.2
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:47 -0700 (PDT)
X-Gm-Message-State: Ot1iCHPQXBmBYK5E7iDDhrcVx1808289AA=
X-Google-Smtp-Source: ACHHUZ7LMrMA78ocv3Tff31XW7n3ukSVcuxlhHrPo8yNKeKKvHDiMykie0NMER5g/1Kygz1grYs10w==
X-Received: by 2002:a05:600c:2243:b0:3fa:9d0f:f1e1 with SMTP id a3-20020a05600c224300b003fa9d0ff1e1mr2902423wmm.35.1688144326214;
        Fri, 30 Jun 2023 09:58:46 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:45 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:31 +0200
Subject: [linux-oxnas] [PATCH v2 06/15] dt-bindings: mtd: oxnas-nand: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-6-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=38rvOQ5JzytmoL2e8XQMRnUMzYw1/Raq4YBpYNRm4dw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm2BW8UwSX3d9Pq718ni0310vOQ0HNcYv2IvLHm
 CF9ZdzKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtgAKCRB33NvayMhJ0Z6yEA
 DQB8ET5EMV67bFiwvw6CHMW/yDZltqA2FQRkT6U0VMXkLspqXbvM5YCSVAJhE0aCOEuSp86cn+sn6B
 fWYyhHNqZR/5Y90GsYVlPN/uNgiwV7djdZJcv8Hr7dPiSDl9hpicmk/oMOjbbFk2/KsZEk4/D8hL52
 m4IUWBoCJlfxhDkSxtZFzKva3EJAGRdSXqKgBs6YFkjMklmRCCde69vPew6/N3svQGqbofvbgY1pcx
 qEn3jwLXNAv/R3f8+pMwEnhekYBxCSGhJZ0QKi2x1b4NC2YUnXjuF96hUl5KnjeNbekLihkL+Zixgl
 qNIiEuLWuFXKNCqbzpVgy3DM+VAkjyQ42Hc3PG31OYbYWTnLSrdi9m4LOcuBUEcETWUuBEIdKz8qgn
 uIIfwD/QwhkEqppN4NSnquwiHhfE/O0qsSOVji2MLteguNXuK2nFacu8zRElULaoSvez4BkfP3E0Hx
 6Qk6g08mNZi9io9R1ZtfGcNJ59QnSZPgbu/iCZpDuGGufzmA0BMF7Hv9Y/aDSO51z947Gg9kG8gxD6
 5/7/Li9DDTGcigSq41lgglOTJqSnGHn/8GoZIqTpQyxBSiJa/VRJv0Fp6XxxEee8EmIUwV12YGJgmk
 xB17WN5EDw0VCkcayM+CD9hpDPnRn8ZJCsjJ3wabBHR4HQ8BcT8pvuxHAm5A==
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
 q=dns/txt; s=20140610; t=1688144328;
 bh=uag40YBni0Dug2hCrd3AD++2rvvY64y+SLyDrlf2G7c=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=HSV66Zr6Wt07W0oIFxUaugK04eOuRIXDvsreVE9N3MAKoN+jF0pKGy3EsTpgix/Chcc
 YA1PyYdKBsueJnvm7wuz0gPRFVbgmk3J2qiOhRGhwmYAN8Vf/G4qEDuJDu3AXm9bFjoZe
 FIWZDiEcL0vovcSGaycPd8Gav3FlWo1OEX8=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
for OX810 and OX820 nand bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mtd/oxnas-nand.txt         | 41 ------------------=
----
 1 file changed, 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documen=
tation/devicetree/bindings/mtd/oxnas-nand.txt
deleted file mode 100644
index 2ba07fc8b79c..000000000000
--- a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Oxford Semiconductor OXNAS NAND Controller
-
-Please refer to nand-controller.yaml for generic information regarding MTD=
 NAND bindings.
-
-Required properties:
- - compatible: "oxsemi,ox820-nand"
- - reg: Base address and length for NAND mapped memory.
-
-Optional Properties:
- - clocks: phandle to the NAND gate clock if needed.
- - resets: phandle to the NAND reset control if needed.
-
-Example:
-
-nandc: nand-controller@41000000 {
-	compatible =3D "oxsemi,ox820-nand";
-	reg =3D <0x41000000 0x100000>;
-	clocks =3D <&stdclk CLK_820_NAND>;
-	resets =3D <&reset RESET_NAND>;
-	#address-cells =3D <1>;
-	#size-cells =3D <0>;
-
-	nand@0 {
-		reg =3D <0>;
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-		nand-ecc-mode =3D "soft";
-		nand-ecc-algo =3D "hamming";
-
-		partition@0 {
-			label =3D "boot";
-			reg =3D <0x00000000 0x00e00000>;
-			read-only;
-		};
-
-		partition@e00000 {
-			label =3D "ubi";
-			reg =3D <0x00e00000 0x07200000>;
-		};
-	};
-};

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#300): https://groups.io/g/linux-oxnas/message/300
Mute This Topic: https://groups.io/mt/99877134/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


