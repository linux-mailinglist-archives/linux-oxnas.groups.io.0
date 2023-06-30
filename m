Return-Path: <bounce+16102+308+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCF744075
	for <lists+linux-oxnas@lfdr.de>; Fri, 30 Jun 2023 18:59:02 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 3xAZYY1809624xoYPe1V5IDq; Fri, 30 Jun 2023 09:59:01 -0700
X-Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.19045.1688144340593396905
 for <linux-oxnas@groups.io>;
 Fri, 30 Jun 2023 09:59:00 -0700
X-Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-313e742a787so1907118f8f.1
        for <linux-oxnas@groups.io>; Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
X-Gm-Message-State: GRpqa3PivuRYGCLEA3shBnPUx1808289AA=
X-Google-Smtp-Source: ACHHUZ67VHZg4s+SYrTR6+84c/ufKS7Q01De9EVEy+1Ktnx9SqhFoXMa/ALr5i7wOY4YYAh12zGPEA==
X-Received: by 2002:a05:6000:104d:b0:314:2c4:9fea with SMTP id c13-20020a056000104d00b0031402c49feamr7004552wrx.29.1688144339127;
        Fri, 30 Jun 2023 09:58:59 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:58 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:39 +0200
Subject: [linux-oxnas] [PATCH v2 14/15] dt-bindings: interrupt-controller: arm,versatile-fpga-irq: mark oxnas compatible as deprecated
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-14-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KAyf/uprdG2/Uxev0fRE9woiE1KO/ssntpRa1SRTGCE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5ebaeq5y28ag1NJPXsR2UMRtXo/2vvtxyaCAH
 q7bNYGyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0a00D/
 949YBvowHmFLhM/PIxv1RNwEMg/gXdoG/wZrUvr3PALas1Cu0FQTMj4xevGv3DdfS8uo3ctM9oWYV6
 By90JIc1WSNQmG+KCH4hm+/qf5oE+Gw0Z3wEBD3rsvElYFEQ3fwuPrztim6PnbGy8QDBwms1IQIfzf
 h7RLWvZ+E8qGp3eltGC12OHkBIePX0rXXrxjdedr/j5FIw6tA75yvupH2hOl4NrPRBMFysio3ZkDWc
 9M8CG8/5lKHq46Y0YQxGe33JYEliELgFeuQZ2F2wAa8691MAj/qQgGvNkK+p0d3QC8ffPUSwyr3VmH
 5Q25o0x6lw7sIETB+MEPAkNIHmB/T6nlcBZXSf8KPxekM9p89ERPpyZVYu6fgo7AgnHZ2ViAWfT0aK
 vJMjzlAtrNbHtCUfuytjC+4kbC3bDd9vNFE29dLvMuhuZD+DnsX/UoP/WyAgt28L2k8BVEWwSbyCaQ
 2eYdh4Y+6SFl4s5/eClwjOvqKjGKgqEhW8aOec1A+m1QS5VYIk8pHdk0RSKLAMbNrghtIhbKMyQhU5
 860pnYTW31uqEHzSrRV62sO4Jd841tMmNAuImfY91tf2tLKDPYfECYF1tRp4lhsqUy9s8lxoRc4IJV
 mozMYh/oDrg2/3lH8mszi0QhKB4BvSDNTDFh/hQrDLMyXPR5es8ILH2xAzcg==
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
 q=dns/txt; s=20140610; t=1688144341;
 bh=iHMfen4oiWr99ivHrQVTXKloNy/njYQW9G0UVuUYx2Y=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=IGdET6fB3AuGe0DvWECW3AZhXgx6iRySCqs/tstJWCpNwF7YomgYlGaSKdEz4QUQYAv
 KiFtjibo+FmWTe1VSlbcyX7PdI9MFwwY5g6Wkd6GMf45M1ZUBfCw/N5l8JQ9SQEsWOOjz
 FvXuP3W8jI7YsahxiHu16Tdkl+fNWViuEAw=

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, mark the
OX810 and OX820 IRQ compatible as deprecated.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt          | 4 =
+++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,ver=
satile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controlle=
r/arm,versatile-fpga-irq.txt
index 2a1d16bdf834..ea939f54c5eb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-=
fpga-irq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-=
fpga-irq.txt
@@ -6,7 +6,7 @@ controllers are OR:ed together and fed to the CPU tile's IR=
Q input. Each
 instance can handle up to 32 interrupts.
=20
 Required properties:
-- compatible: "arm,versatile-fpga-irq" or "oxsemi,ox810se-rps-irq"
+- compatible: "arm,versatile-fpga-irq"
 - interrupt-controller: Identifies the node as an interrupt controller
 - #interrupt-cells: The number of cells to define the interrupts.  Must be=
 1
   as the FPGA IRQ controller has no configuration options for interrupt
@@ -19,6 +19,8 @@ Required properties:
   the system till not make it possible for devices to request these
   interrupts.
=20
+The "oxsemi,ox810se-rps-irq" compatible is deprecated.
+
 Example:
=20
 pic: pic@14000000 {

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#308): https://groups.io/g/linux-oxnas/message/308
Mute This Topic: https://groups.io/mt/99877143/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


