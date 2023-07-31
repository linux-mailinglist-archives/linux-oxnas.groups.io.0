Return-Path: <bounce+16102+313+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A564B7699C5
	for <lists+linux-oxnas@lfdr.de>; Mon, 31 Jul 2023 16:41:30 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=6gdN4r9nUHkEhXNZaDgCmhY7NT0/kogTCIo1D8ii/NE=;
 c=relaxed/simple; d=groups.io;
 h=X-Received:X-Received:X-Received:X-Gm-Message-State:X-Google-Smtp-Source:X-Received:X-Received:From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Reply-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1690814489; v=1;
 b=Pk1aMTwfi934IuCIwZCygkHeV8o51ib5vCXRdBlvQGQnaQ6P+KcrGd0jjaF4ylb8xWRWymUg
 vnmJPjYDYIOpnwTkDOB3hf9xVepD9Uma2TsMCJCvwlfGbNi9K9f0kVyXpOpmSY94DR9s0GJNxpM
 NFvxR6ePIEQXqhXvHfhhODmc=
X-Received: by 127.0.0.2 with SMTP id Rm4TYY1809624xTjplvUeaAf; Mon, 31 Jul 2023 07:41:29 -0700
X-Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9196.1690814488503076032
 for <linux-oxnas@groups.io>;
 Mon, 31 Jul 2023 07:41:28 -0700
X-Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31771a876b5so3842528f8f.3
        for <linux-oxnas@groups.io>; Mon, 31 Jul 2023 07:41:28 -0700 (PDT)
X-Gm-Message-State: EWsYLWbwxDFS0EKXXQYzBTanx1808289AA=
X-Google-Smtp-Source: APBJJlEJjIB41drVJiDqIw+6g+TOpO6luWe2Kl+uP3cedi/upkl+7Ymm6bT8oHmQbYCN49fVKvQ4dA==
X-Received: by 2002:adf:f043:0:b0:316:f5b1:98c with SMTP id t3-20020adff043000000b00316f5b1098cmr27062wro.24.1690814486994;
        Mon, 31 Jul 2023 07:41:26 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm13257372wrn.52.2023.07.31.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:41:26 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Mon, 31 Jul 2023 16:41:11 +0200
Subject: [linux-oxnas] [PATCH net-next v3 2/2] dt-bindings: net: oxnas-dwmac: remove obsolete bindings
MIME-Version: 1.0
Message-Id: <20230731-topic-oxnas-upstream-remove-v3-2-a1bddb085629@linaro.org>
References: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
In-Reply-To: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Daniel Golle <daniel@makrotopia.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=WWAewszZaAHurbGkUxcBGJ6GDkRuE9cM+WDXKbpY0xY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkx8gS1TRmFKi1+xt8uDPsnx1sL0IzKB9M5omlr9Sy
 rUuNrEWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMfIEgAKCRB33NvayMhJ0btUEA
 DEk4H3MLBfZh8zYgTUsqf0fYd7vq08z2cXu+hFnxsas87nXiUF1kr1y5uLkwlON1K8YZ0D8oX0jjWi
 Sqb3xSYL9bDBdQ8pgF3oYzliqGCcETsaGCmfvLIHM+iNxZgYmaDdGkbvyhotY97V68vDwQqwmXoFiL
 WxiwEGiRCZj/mlL2ZO0U0So8wC3Ml/x1JrWkVcFuqNeF4Nv1d1NoijKajk5ZxkOkBT8ldgZngxW678
 RBfaTexnBMPQl+U7VZbiDOrYrrE65JBtup4q8V7+UxlzGACwEpBfgu7HkmxfGVZT4mv3yIVu3w4bX7
 EBEs5x8NjbX2tXMu8IyY3ebxUbeWakn1LWqjeshqVrEjM1rtIVXFpLUEWpm1hYLAPSFFCs5q2s0WUb
 K+bc/EmtQ+tOsbfkaKLqXCdpmWbDLfZ+vNzLG5/Ou0BF1YjZxKxqWUEUGSVa1yKjhCTFMIp+QbRaah
 eyhmQGS3VHoaCi0OhDsV+FSe0Dt4clq8eXzZeLkV8yrlqj5ZeIV7NRzj32Uqwt908h6/ojkyO8E3cg
 rD1YpIwcj0D10xwVZe7q4lsbc18NVFPLHbArTVsY21qTA3f/eugNYmxPUSiz+AjWh6jtX+XGGL+9z4
 4f+lk3fEOJua2zq2tbv/NAB8r6PD3WdB9YCIrORWgDddyzed4ps5dUnEBZbQ==
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
OX810 and OX820 dwmac glue.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
View/Reply Online (#313): https://groups.io/g/linux-oxnas/message/313
Mute This Topic: https://groups.io/mt/100462874/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


