Return-Path: <bounce+16102+318+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D377B3B2
	for <lists+linux-oxnas@lfdr.de>; Mon, 14 Aug 2023 10:16:52 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=SnStTQS6M9UGVU0hL+JWRquFLqy2e8y4wZfHDt4GZww=;
 c=relaxed/simple; d=groups.io;
 h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:To:Cc:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Reply-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1692001011; v=1;
 b=HpfR0gqPxEms/OflI+GuePtM44m1b1mTq+uE3kULXUfTW9Crbf01h8rKOtbtocVpU7KA+ZnW
 5kKWalUAhUuv3+W3ZfsFivOMIv3B0b3lKaREfoAjDa0n6taT82xeTXqB2suZAR7BkrtvLi2Bnz1
 WVCfB4HPXTz+NArszX7ZTF14=
X-Received: by 127.0.0.2 with SMTP id GK3KYY1809624xbEeq9zTaPU; Mon, 14 Aug 2023 01:16:51 -0700
X-Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.102965.1692001010607699613
 for <linux-oxnas@groups.io>;
 Mon, 14 Aug 2023 01:16:50 -0700
X-Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe167d4a18so37577815e9.0
        for <linux-oxnas@groups.io>; Mon, 14 Aug 2023 01:16:50 -0700 (PDT)
X-Gm-Message-State: rUkSkL7oMdgJpFwzQhpSU2Z5x1808289AA=
X-Google-Smtp-Source: AGHT+IFxoZYypMWMApyftvpZB+eRWVc7nLZT8b8RmwQysm55SPF8kxFmUC8yXR5M66sqVwKCaSHESw==
X-Received: by 2002:a1c:ed15:0:b0:3fb:e206:ca5f with SMTP id l21-20020a1ced15000000b003fbe206ca5fmr7168108wmh.31.1692001008961;
        Mon, 14 Aug 2023 01:16:48 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d4281000000b00317a29af4b2sm13542994wrq.68.2023.08.14.01.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:16:48 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Mon, 14 Aug 2023 10:16:39 +0200
Subject: [linux-oxnas] [PATCH v3 3/3] dt-bindings: gpio: gpio_oxnas: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230814-topic-oxnas-upstream-remove-v3-3-04a0c5cdda52@linaro.org>
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
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jE6ByQZPyn94kajLMkmmnkKqcK01TK88XsXfpl+GUMQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk2eLrjDbTfAEmzdlc5+OVy72+nkloYG/jlpD4hbXa
 p3OXVuyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZNni6wAKCRB33NvayMhJ0XR6EA
 CgJ78xhOK89ymzp6lmIQDll16C4q2KKUwZpYLi19PkP5CHYpod1KfImzp6DZMipWgeNV5BXID4vbFc
 QmdNIQkTjkK9dA8Hf5Qz5Eg4OEOBW5AtBRZqaYxTEZY7lAAx10WH6ykM9DJ1JsvrjqvefO1PunTVKo
 ebeaG0C7j/zmILuEyedPLzWe9pRbSJ0YAeitBmOl2m7NzBdEo9T5foRIK2tp7tWfOrsagovPAiE2cq
 LQeNLBsZuhVYSmoeexUC9oTAq8A0DJBD03OtYj7ypPFc0SKyxvsZ7VDXpj07abZAvv7X1tHKyPfBoD
 KL09HCmsLKWO8qqR0F3JjoVv8L9T7MpfdXbbxtWJWCjVYghU4gN4g9M9yoez6+cz9mB9YFmwlrhDJz
 0SY3yGvAWAi2GGQeJRPWzs4bm7a3LTsQpvi/w1F9/6vdoTdbdf4DbWNpnxa3/0R9j4X8Nn6ZBkh0b/
 TyDymJbacbClLxEvtE4KyVzDjEbbLXYZK9DhhQ3v/5jQetF6u1P0Cq00antay22GdXUDJu4tpo8kg6
 OAs+/3tH4J6VdE7bVpxEobtPrbVIvRn3Rf7CYOJsFlb53iKgcTQwe7sMQa9r94rRtZgWBnlHhdSzfA
 6qH0uQAbjStD4KwG92omB0aHYoteiIuTHrJOW/JCQcTtwvbIgmtNltRr1vGQ==
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
OX810 and OX820 gpio bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/gpio/gpio_oxnas.txt        | 47 ------------------=
----
 1 file changed, 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt b/Docume=
ntation/devicetree/bindings/gpio/gpio_oxnas.txt
deleted file mode 100644
index 966514744df4..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Oxford Semiconductor OXNAS SoC GPIO Controller
-
-Please refer to gpio.txt for generic information regarding GPIO bindings.
-
-Required properties:
- - compatible: "oxsemi,ox810se-gpio" or "oxsemi,ox820-gpio"
- - reg: Base address and length for the device.
- - interrupts: The port interrupt shared by all pins.
- - gpio-controller: Marks the port as GPIO controller.
- - #gpio-cells: Two. The first cell is the pin number and
-   the second cell is used to specify the gpio polarity as defined in
-   defined in <dt-bindings/gpio/gpio.h>:
-      0 =3D GPIO_ACTIVE_HIGH
-      1 =3D GPIO_ACTIVE_LOW
- - interrupt-controller: Marks the device node as an interrupt controller.
- - #interrupt-cells: Two. The first cell is the GPIO number and second cel=
l
-   is used to specify the trigger type as defined in
-   <dt-bindings/interrupt-controller/irq.h>:
-      IRQ_TYPE_EDGE_RISING
-      IRQ_TYPE_EDGE_FALLING
-      IRQ_TYPE_EDGE_BOTH
- - gpio-ranges: Interaction with the PINCTRL subsystem, it also specifies =
the
-   gpio base and count, should be in the format of numeric-gpio-range as
-   specified in the gpio.txt file.
-
-Example:
-
-gpio0: gpio@0 {
-	compatible =3D "oxsemi,ox810se-gpio";
-	reg =3D <0x000000 0x100000>;
-	interrupts =3D <21>;
-	#gpio-cells =3D <2>;
-	gpio-controller;
-	interrupt-controller;
-	#interrupt-cells =3D <2>;
-	gpio-ranges =3D <&pinctrl 0 0 32>;
-};
-
-keys {
-	...
-
-	button-esc {
-		label =3D "ESC";
-		linux,code =3D <1>;
-		gpios =3D <&gpio0 12 0>;
-	};
-};

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#318): https://groups.io/g/linux-oxnas/message/318
Mute This Topic: https://groups.io/mt/100732981/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


