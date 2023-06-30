Return-Path: <bounce+16102+298+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 025DB74404A
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:58:45 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 4NI4YY1809624xcX1gOKLNBH; Fri, 30 Jun 2023 09:58:44 -0700
X-Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.19034.1688144324158791740
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:58:44 -0700
X-Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso3594265e9.3
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:58:43 -0700 (PDT)
X-Gm-Message-State: EcXZS48Ty4yroKNMNr0tSUnFx1808289AA=
X-Google-Smtp-Source: ACHHUZ4kb1V3frCsFczRLlLgyifNBy0GBwdYjOu0RRm8Jn7X375HH7LEfgN4UjwZK03/hf8LXBRCLQ==
X-Received: by 2002:a1c:4b0d:0:b0:3fb:b3aa:1c89 with SMTP id y13-20020a1c4b0d000000b003fbb3aa1c89mr2480542wma.19.1688144322719;
        Fri, 30 Jun 2023 09:58:42 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:42 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:29 +0200
Subject: [linux-oxnas] [PATCH v2 04/15] dt-bindings: timer: oxsemi,rps-timer: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-4-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qERiig5wSYeUoOI63YnahZ6nGdl82BedWKVtaXlIxWs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm16A/yr4DilaWEdtzFgOEAGl/phXffqIwaLSmt
 sPsOlVaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtQAKCRB33NvayMhJ0VDKD/
 47nyBKDAl2AY31ET35jQBTsmpGScqftSs8OcPuDPcN3VCsaWRv6UtgqcnEPJQnrzelrje0S3YGxPwF
 QcW3X6EWl3afDg0NhSDkHRIoXrVRFWxVUBXS0N3S8LKjVAWZKVkF62qgsGKTGCqhnIXvrtFwkJ1lXm
 MraxYWnOzHeiIf8ys9fhtGURRlCdkPn5qq1x/ZNCCQ5AwjWVRPg/8aqcvWGK4YVS7fTZcmsG+swmUD
 /AxQrAUMrJITN3Fsd8amhU2ujq9+quGZY2ch+5l7277ZFDC8kxuuh9szLemh9V31xMCCVd3J3IGJwH
 4cckGQPOijSnOTxHF7HwSAWxmnbMCQJqW/S3I79dtFD1/LL5lRZkHCDplu6cDNkNtX3WMwQN7FZdA1
 lZOacGLxkVnteC9JDXnxkGKG/NUWe8OPTD7SFm6dlXikbL+qcw3E65Aq2GILG2yK2w7wYTCz88WKT6
 Ca9MJTRkvLSpUGvWTVfkDnH3r2oZMZ/c7iyrrHrWcCt96/g4XvyDU81HEg2K69hTCjV6GFQbIcdEHA
 N35J/1Fc1TMzOTitNRKzN+cyw1K1gnbIDzLODWsLwLk89HSh+6vSzrYp0mDv05ZvqR0WTFMPfWT7FT
 zwf7ysaGzArnbrJ4b2hsre8VHA6zxuXtL8gxaGy79xMpYSwfDEy55y669tWw==
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
 q=dns/txt; s=20140610; t=1688144324;
 bh=2W/FbD3xZJZnlsMS5FjLenW8fQy9nrsFFcNj9p6NoYk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=MZ/WGTPr1u/aiD8MSzfsM2VnZYTC4q0U6rx9z7jWRx2QluBODi+h/IyzP5yqVgjVQBC
 CNCIFpPbOGP25zfqaDwOiOgnmftxCoAb+FgfuhAZknDyZ+ockf53S+t3OmwPjyQHIFTwN
 1zm9/yLAIegsZ8EvZu5GNPCejxzgGM1je8M=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 timer bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/timer/oxsemi,rps-timer.txt      | 17 -------------=
----
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt b=
/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
deleted file mode 100644
index d191612539e8..000000000000
--- a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Oxford Semiconductor OXNAS SoCs Family RPS Timer
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Required properties:
-- compatible: Should be "oxsemi,ox810se-rps-timer" or "oxsemi,ox820-rps-ti=
mer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The interrupts of the two timers
-- clocks : The phandle of the timer clock source
-
-example:
-
-timer0: timer@200 {
-	compatible =3D "oxsemi,ox810se-rps-timer";
-	reg =3D <0x200 0x40>;
-	clocks =3D <&rpsclk>;
-	interrupts =3D <4 5>;
-};

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#298): https://groups.io/g/linux-oxnas/message/298
Mute This Topic: https://groups.io/mt/99877131/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


