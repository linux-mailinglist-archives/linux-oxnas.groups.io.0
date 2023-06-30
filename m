Return-Path: <bounce+16102+302+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121B74405A
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:58:52 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id nTv3YY1809624xjDgXoR6EhA; Fri, 30 Jun 2023 09:58:51 -0700
X-Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.19026.1688144331208255119
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:51 -0700
X-Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-313e23d0a28so2499745f8f.3
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:50 -0700 (PDT)
X-Gm-Message-State: TdB1h6LyWsI2SDvLibdOghwpx1808289AA=
X-Google-Smtp-Source: APBJJlFzJ7gr49cK2EFetGNMd9/0U3UmpawqrBNoY08qj+GcUBgCTd+Ktz+AScGTGOpt8dI5w0r6GA==
X-Received: by 2002:adf:f389:0:b0:314:1e3e:611d with SMTP id m9-20020adff389000000b003141e3e611dmr3218380wro.71.1688144329626;
        Fri, 30 Jun 2023 09:58:49 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:49 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:33 +0200
Subject: [linux-oxnas] [PATCH v2 08/15] dt-bindings: net: oxnas-dwmac: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-8-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TLDrcb0mzwLI06ByewFdMOz8nc1IDfSB9k98JAwmgYI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm3h8ExnMBya+L7ppxVXE2kolWWvQzXeql91gvK
 3+FRKWOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtwAKCRB33NvayMhJ0TcTD/
 49DmQNUye4umPLTMTCCVgbCtNVJnEqPD1yc38kQmygaiwUUL4p3pz0vbeCvj4ah6wu6WO+XRXqO0gQ
 3k854on6XQUHo9WrsI6NjE6HooFs84KtwrRG00j4Q1eOa0jGdK0HBjP0Py8hGuEHOQlmE3k+HF40+T
 b+T0qeWwVShG9ulHY3KNZdNF4NaQxia8Hc6gD2wxvqa9v/0OQ5zeGclkMBLecEFnQ9fJWqbyK0Smil
 f+UYvCvqSZnJ+kJjTx/C4uMU3yKJAAN2ZBioc/NYQTfd9Ao7We+j131ZZdxzbbiPZk10JdshwTWIVw
 hHEBPbng8MZ+L+DixJfbqX1+7EOZJbtrFZQZ/nhXrV11IGac36jlbj6qx66dR4pKpR7gk4vTTlnrU+
 5FYspLKqZwbP1JP4QcJzm4UI1moYpO/7HQTM7duxBYz05ojPgMch2OsmFWan4Vijea0dkux5MWOA3W
 k+D/2E1Rq7qy6FRLDZQpRs3mJyOv0xO3NUbrSxKol//M/yMsNBGEXZrZpWAUUfIrOee3adJp+CdL82
 P5q00RhvgockGnpC1hG5wKP0yRKgORY5nFDbWDIwuGhzUDBMhVT7MUujUqLyipH2e/Z8ZUMImThizb
 JOwoQ062na9BGzhuWa3S2u3m9KYCZD8xurvT7t19cdpUO0lWiIRLKh2RgE/w==
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
 q=dns/txt; s=20140610; t=1688144331;
 bh=ib5PJNYIuv8i8n5NbRQj/Xp8Kcf7BYY8q4K5DCvg+lk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=sIa8WRIc+oyc8bsWELEg01cmlaiPbJoDu8YK9pMt0cSPttxG4XNbw3TaBrt8zTUDxjI
 EwzsU8qbjJ27njYU6aDf9QigzNjvSOgmZEOduhtZkRl4bu3100uFn/7mZChXPjc/+3Jo0
 jke2vdrDeoSgMyWThv7Unp2mFuyJarSZOak=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 dwmac glue.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/net/oxnas-dwmac.txt        | 41 ------------------=
----
 1 file changed, 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt b/Docume=
ntation/devicetree/bindings/net/oxnas-dwmac.txt
deleted file mode 100644
index 27db496f1ce8..000000000000
--- a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Oxford Semiconductor OXNAS DWMAC Ethernet controller
-
-The device inherits all the properties of the dwmac/stmmac devices
-described in the file stmmac.txt in the current directory with the
-following changes.
-
-Required properties on all platforms:
-
-- compatible:	For the OX820 SoC, it should be :
-		- "oxsemi,ox820-dwmac" to select glue
-		- "snps,dwmac-3.512" to select IP version.
-		For the OX810SE SoC, it should be :
-		- "oxsemi,ox810se-dwmac" to select glue
-		- "snps,dwmac-3.512" to select IP version.
-
-- clocks: Should contain phandles to the following clocks
-- clock-names:	Should contain the following:
-		- "stmmaceth" for the host clock - see stmmac.txt
-		- "gmac" for the peripheral gate clock
-
-- oxsemi,sys-ctrl: a phandle to the system controller syscon node
-
-Example :
-
-etha: ethernet@40400000 {
-	compatible =3D "oxsemi,ox820-dwmac", "snps,dwmac-3.512";
-	reg =3D <0x40400000 0x2000>;
-	interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names =3D "macirq", "eth_wake_irq";
-	mac-address =3D [000000000000]; /* Filled in by U-Boot */
-	phy-mode =3D "rgmii";
-
-	clocks =3D <&stdclk CLK_820_ETHA>, <&gmacclk>;
-	clock-names =3D "gmac", "stmmaceth";
-	resets =3D <&reset RESET_MAC>;
-
-	/* Regmap for sys registers */
-	oxsemi,sys-ctrl =3D <&sys>;
-
-};

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#302): https://groups.io/g/linux-oxnas/message/302
Mute This Topic: https://groups.io/mt/99877137/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


