Return-Path: <bounce+16102+296+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C6744042
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:58:42 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id xHo2YY1809624xSoMgpx9EHa; Fri, 30 Jun 2023 09:58:41 -0700
X-Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.19019.1688144320765065502
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:41 -0700
X-Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso9586735e9.1
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:40 -0700 (PDT)
X-Gm-Message-State: o4WE0imk8e5J5cEJwIoQwkIMx1808289AA=
X-Google-Smtp-Source: ACHHUZ4jfOLP9DSUM8iQinRS8Vum9XKSxSLXf+7HjFdIRyfIkOHCYGoWFaqy2VXVGNXPMBo+xTlFUg==
X-Received: by 2002:a1c:4b16:0:b0:3fb:be7c:d58a with SMTP id y22-20020a1c4b16000000b003fbbe7cd58amr2269200wma.26.1688144319230;
        Fri, 30 Jun 2023 09:58:39 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:38 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:27 +0200
Subject: [linux-oxnas] [PATCH v2 02/15] dt-bindings: clk: oxnas: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-2-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bzno7XM9r0SNC/gStJcrLz6bOxC+B4tnBfXrQVc4AKA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm08GTlhXUvs7ni+2UnaR66va/P33VZvppd02s3
 XjaYa9iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtAAKCRB33NvayMhJ0fEwD/
 0c8c0kdMcu9cAO6MW+kau0NON/fYuaafAI++DNEg4rOBcbZZ9RNE9EqK8ZG+ERzfrEi1n/fLjJS0x5
 E6k5Fj2Q+rGH7PAw1HeAmuECHlLgX2IMHWVF4EDSLWIlzZPUS8XFNz5vIMGCCMLv7Y311cVfmzrTtr
 IEwejNA/OmS0grIUXEClx8Sp1TinImZI9jHZh3AijGq8XiEW2E0rFGHrATPJHuA9Nx1BwEtrKMecSk
 wFtJCh+PCDWqm1SNjVQcYLbX3RPFRz0aXKKjET4NB7kZvPtD7T5mNh6cjK1k/keUTjEVplgtjJwA/d
 HZOrPOQNr1jKROsXy72AQ3XUs4WnPy8g31SX1EQNlXBl9j40MaU14ZEHPTtS5C/iIJrqxM4KNKGFWY
 5pBAzHw/vaYt7C5NcrI4LGTpWgGwFPrvhahxuXCgAPHeEaHOAxcdYt3wjfm3obKlDO4bVWFYmnwGYb
 TFSxRTatfNcT/7G8e/fPR2InfUfImg9Q08gRNTvR0ls0t3P49CYiS1VwFL4cV9dT4CnQvNEWkmLNjf
 l/K7qlaz1AtLH22wg9bT79EL/ud1qabQeYwF5uFQHItpwMH3bgcoREdJeHPSLbdL4ZTJOzKFoSGJz0
 ir6/tIunoN+bjEYP4Voc/7R8Pq+IIgVJ/8ED+SCvmiwkzoJFptWW6NxwIHRg==
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
 q=dns/txt; s=20140610; t=1688144321;
 bh=spZlao7UOOqb7E7cDBYjbOtPp033ZNepoXvu8S++Dgk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=gDYScimsAhXp6oQLsiLzSf+dI4e8aLgJ5IHqrPhsYYa3md7pyKpAzHjdS0tpH7HhvhZ
 BWDdu5GI4zSo7nWmNR4EnsWlk73hjBKwFpF+QafcLq4deZSVRDyXRa5E/f6q9p2dK0gq0
 5ReFdGZQl3ecXWEiJFP9fDwIAQ10AgXp1C0=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 clock bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/clock/oxnas,stdclk.txt     | 28 ------------------=
----
 1 file changed, 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt b/Doc=
umentation/devicetree/bindings/clock/oxnas,stdclk.txt
deleted file mode 100644
index b652f3fb7796..000000000000
--- a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Oxford Semiconductor OXNAS SoC Family Standard Clocks
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Please also refer to clock-bindings.txt in this directory for common clock
-bindings usage.
-
-Required properties:
-- compatible: For OX810SE, should be "oxsemi,ox810se-stdclk"
-	      For OX820, should be "oxsemi,ox820-stdclk"
-- #clock-cells: 1, see below
-
-Parent node should have the following properties :
-- compatible: For OX810SE, should be
-		"oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd"
-	      For OX820, should be
-		"oxsemi,ox820-sys-ctrl", "syscon", "simple-mfd"
-
-example:
-
-sys: sys-ctrl@000000 {
-	compatible =3D "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
-	reg =3D <0x000000 0x100000>;
-
-	stdclk: stdclk {
-		compatible =3D "oxsemi,ox810se-stdclk";
-		#clock-cells =3D <1>;
-	};
-};

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#296): https://groups.io/g/linux-oxnas/message/296
Mute This Topic: https://groups.io/mt/99877125/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


