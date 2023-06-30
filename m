Return-Path: <bounce+16102+304+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A0744061
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:58:56 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id tvR9YY1809624x5nXgTaDEL2; Fri, 30 Jun 2023 09:58:54 -0700
X-Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.19029.1688144334288525635
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:54 -0700
X-Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-311394406d0so2314598f8f.2
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:53 -0700 (PDT)
X-Gm-Message-State: 9kjtMz1Oqq2cP0mfQ7VPd7WRx1808289AA=
X-Google-Smtp-Source: APBJJlGMQoq8MJdB0hfT3I6T0d0F1LVt3vu4+o1NWHKLvHvj4GZq3IgRqC7tve+tvUz9c8RXUpjMNw==
X-Received: by 2002:adf:cc81:0:b0:314:d19:fc31 with SMTP id p1-20020adfcc81000000b003140d19fc31mr2913745wrj.51.1688144332721;
        Fri, 30 Jun 2023 09:58:52 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:52 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:35 +0200
Subject: [linux-oxnas] [PATCH v2 10/15] dt-bindings: pinctrl: oxnas,pinctrl: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-10-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lU0Rgil/ev1/BqzGapYknrWAekAzhIDCjFFvr/Tl7mg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm4+5/g0rcYb66QxjBIlFiUjvocLVgWZT6mtpaE
 GF1Pn0+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuAAKCRB33NvayMhJ0dPvD/
 93ZAw/LIPqNPF0li9/7yv9xUx84tStF1AkO8ltYZ00U95njJe5mPlivwj+pDdPNLiCEk2nmUPunY3M
 7CuVgtBbHpWcIqx8BDZ70S3yrj6NvQ4MaoES6FuoTEwqXEc8PMvk6wEkEjfL0M13jSe/oNVrYgnzlq
 tenzbEkFaTh5Hgi4XxDqiMvprL37YdzCRzmsoic5XqS2eewnvUAUqy+rhQ1GdnpyiOVv8V0tp4Pqm5
 9cOwbashPgyJeWOsmnzN6Rae795M5pTBkJx1knCyQtXZLKEPNifnQOCfpzSjIFHuPMTqYDQzeZetvI
 fjP4q1vHO1m6hvP6sYHb4iMNXi4ho37b8eUabnUBZP2syBsyP+UBeL0f6wMbDE4Bqyc8i2Me9rXVVD
 qbaKXAAZzqiZgNKBbCRSU+kwDU0/mZVH9BNnAORdEYeYo4XSglwuLtKubLamhA1DHbMmeO5spP202f
 3O5Rg17wscN4iJbKsZjfzH4YJ2Vx0gMqEO77pyJhyhxiLkXDfiHiX3ESELQpbUQb76vCDlxOvUNIis
 sLVWN+pk3K2ckjcQhpsFrL3blpXjHiNTZDdFkjiMf2MdFl69K2sRxnNDEvBZCAAkMBXGExG5t6kuE5
 YzCjrEAZmHYK/h/PtJt2bj+n/N+O8EIkQJnxiI6dKaSy/UtKIirJ4XpqqPqw==
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
 q=dns/txt; s=20140610; t=1688144334;
 bh=6MA7PSGgJ04315cNlUkBIKG6wK/c3K/glvJUoFJOrwo=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=fkLDyB4H0KPwgnSO5JdcIgc0E0MB0eF42aqX7zsblM/ddJAUCbbUTuJrSQNcamcEImf
 f0/wBbedxifHnx3IKDcUy2SX+FgSJGuqkkT4/8GMhGgLzs0R1iIw9kcuMDd3T5GqXXV/S
 BGHDXyqafZaeLNOwky2cvfeJk+8w1nnZkqc=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 pinctrl bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 56 ------------------=
----
 1 file changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt b/=
Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
deleted file mode 100644
index b1159434f593..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Oxford Semiconductor OXNAS SoC Family Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-OXNAS 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configuration=
s of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "oxsemi,ox810se-pinctrl" or "oxsemi,ox820-pinctrl"
- - oxsemi,sys-ctrl: a phandle to the system controller syscon node
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
-
-Example:
-
-pinctrl: pinctrl {
-	compatible =3D "oxsemi,ox810se-pinctrl";
-
-	/* Regmap for sys registers */
-	oxsemi,sys-ctrl =3D <&sys>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2a {
-			pins =3D "gpio31";
-			function =3D "fct3";
-		};
-		uart2b {
-			pins =3D "gpio32";
-			function =3D "fct3";
-		};
-	};
-};
-
-uart2: serial@900000 {
-	compatible =3D "ns16550a";
-	reg =3D <0x900000 0x100000>;
-	clocks =3D <&sysclk>;
-	interrupts =3D <29>;
-	reg-shift =3D <0>;
-	fifo-size =3D <16>;
-	reg-io-width =3D <1>;
-	current-speed =3D <115200>;
-	no-loopback-test;
-	resets =3D <&reset 22>;
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_uart2>;
-};

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#304): https://groups.io/g/linux-oxnas/message/304
Mute This Topic: https://groups.io/mt/99877139/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


