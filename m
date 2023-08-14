Return-Path: <bounce+16102+317+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB477B3B1
	for <lists+linux-oxnas@lfdr.de>; Mon, 14 Aug 2023 10:16:51 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=oqC+/ztnTXKWc4w2MMuAvnUwCnMjzHNpTcIJj3BD654=;
 c=relaxed/simple; d=groups.io;
 h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:To:Cc:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Reply-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1692001009; v=1;
 b=HHCfWoSAti8Iqkj3AscCBb12ApVOlBzdBZQXJfFOWEaoPPqVFeYY6ueHUi1fC/SMkMBZWw+V
 iGmLH6SLZGxfHfQ+Djv5rf0H/dWSgnBxc6CrIB3TRJwgp970XNiFdr4oEbyrxVSD6omzlq/CyL/
 hTc+8L5FXx+mOtHZCuWMKbps=
X-Received: by 127.0.0.2 with SMTP id ssDPYY1809624xAZnXh8UN3l; Mon, 14 Aug 2023 01:16:49 -0700
X-Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.102964.1692001009357175743
 for <linux-oxnas@groups.io>;
 Mon, 14 Aug 2023 01:16:49 -0700
X-Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31965c94001so1794876f8f.3
        for <linux-oxnas@groups.io>; Mon, 14 Aug 2023 01:16:49 -0700 (PDT)
X-Gm-Message-State: RfM7tWPm540Ko85U0R7pemLgx1808289AA=
X-Google-Smtp-Source: AGHT+IHX78yALUC6TfJmxHpY/Vzhc04B2FmIM8L6KyavO81tCgZNWUIAM6mwnod39AFqlqblIjWoLg==
X-Received: by 2002:adf:fe4b:0:b0:319:7b6f:4a5d with SMTP id m11-20020adffe4b000000b003197b6f4a5dmr754091wrs.52.1692001007768;
        Mon, 14 Aug 2023 01:16:47 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d4281000000b00317a29af4b2sm13542994wrq.68.2023.08.14.01.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:16:47 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Mon, 14 Aug 2023 10:16:38 +0200
Subject: [linux-oxnas] [PATCH v3 2/3] dt-bindings: pinctrl: oxnas,pinctrl: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230814-topic-oxnas-upstream-remove-v3-2-04a0c5cdda52@linaro.org>
References: <20230814-topic-oxnas-upstream-remove-v3-0-04a0c5cdda52@linaro.org>
In-Reply-To: <20230814-topic-oxnas-upstream-remove-v3-0-04a0c5cdda52@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lU0Rgil/ev1/BqzGapYknrWAekAzhIDCjFFvr/Tl7mg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk2eLrougnqgseJ8fSlmQlnqFv6JZXdi8KV8xB/MqT
 WEbXIMSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZNni6wAKCRB33NvayMhJ0ckED/
 9+P/7v769IVBeyAtdWUeboLvTpXwBhrhbP46psTSwZNOuxKqSq/BGzPmFqIwuQIiyNcjvBww6jBcQi
 lHAkGQqKrnualw1SR522LGxIl7H8cBnD5uFPTU3Rn6xpFm5WfUpfSO2Pza9h/m6Zic60eNJYq+pDh6
 euN2M9DmPtrf9OCsR1NdnagOrvB8L9XwMKzpbOXPRJKItmpjz++VL3wwoWbdZi8yKNQgCx/mM3reeL
 kp2YJFl7v3qAbPDL2I5rTClrkk/uCAM0PyqPxz+nT4bL4zhV99HZ4OVagfzn8lnKoWCh7kmkt3EheF
 7OZtDDv3DrzL+3pydmWc0IlNwEQ505w5UA2UNPdvevYUx5ioOYxcQKFMH+Zbb4BobV662FDLkMNXOl
 D8cNSTcQzp9/yuS3wMm8mS+hCFJobInwUOYIySrkkGOjaHG8x3+cXTnVCZ7qxie6NvVBs2XOxOY5uB
 aWPI9mLr6jXNBnHF9wFx/xaV9s6VYTvrOZtx+ie20lGQzLAZDpi0HQtUq1iFOoSyvmg0kOqCDz9jhf
 kXLfF8Kb9z3NGD0PGV95z4vVbmKpGJTKS7ZLOEbRMI6/Fdk9LCDiumPV13NCPuozm6pOhM4imkjl8A
 hXudQv2fH0IVeUuarHYvpYTVa8Kq0QOoXfPb19S/bOHSBLNCuMxhVd6Ce7Ww==
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
View/Reply Online (#317): https://groups.io/g/linux-oxnas/message/317
Mute This Topic: https://groups.io/mt/100732980/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


