Return-Path: <bounce+16102+229+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 345C96D3E33
	for <lists+linux-oxnas@lfdr.de>; Mon,  3 Apr 2023 09:42:28 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id e57sYY1809624xxKQ2gWfeFk; Mon, 03 Apr 2023 00:42:26 -0700
X-Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.64446.1680507746030886467
 for <linux-oxnas@groups.io>;
 Mon, 03 Apr 2023 00:42:26 -0700
X-Received: by mail-wr1-f54.google.com with SMTP id m2so28259058wrh.6
        for <linux-oxnas@groups.io>; Mon, 03 Apr 2023 00:42:25 -0700 (PDT)
X-Gm-Message-State: uynbfimZ4mveVuuRsDEVX3Inx1808289AA=
X-Google-Smtp-Source: AKy350Yniqdqc+Q5myV/H73Qhyh9BvslsjSTxkmlc/aqhCtpZ8+tchcyrqoWB2n2QIIhHWA81UE92w==
X-Received: by 2002:adf:e882:0:b0:2ce:a8f4:2b01 with SMTP id d2-20020adfe882000000b002cea8f42b01mr13253583wrm.32.1680507744351;
        Mon, 03 Apr 2023 00:42:24 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002e62384d17dsm8180482wrr.21.2023.04.03.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:42:24 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Mon, 03 Apr 2023 09:42:18 +0200
Subject: [linux-oxnas] [PATCH RFC v2 1/4] ARM: dts: oxnas: remove obsolete device tree files
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v2-1-e51078376f08@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Golle <daniel@makrotopia.org>
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
 q=dns/txt; s=20140610; t=1680507746;
 bh=cKpXWbONW7h4FvQqnvHoY5cWq1HRw+GdcEW5RQqaswQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=WEtsiDPd0zQNSyJ9RxznsBa3Gv3Tdw65kjKr3QeEZCvGObc3/8gv4+SKsUehJUrEZMh
 1tmT/qaaVawnml7wlJTrgZjHb5240kAYvjDprjWb5OI6hLubdIGaQwm9kKeo93d8bhH79
 GjUwDm7t+XSEd86K1VWh9Dam4dQCC8bwJV4=

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 devices.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/Makefile                         |   3 -
 arch/arm/boot/dts/ox810se-wd-mbwe.dts              | 115 -------
 arch/arm/boot/dts/ox810se.dtsi                     | 357 -----------------=
----
 .../dts/ox820-cloudengines-pogoplug-series-3.dts   |  93 ------
 arch/arm/boot/dts/ox820.dtsi                       | 299 -----------------
 5 files changed, 867 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe4152e5846..ad83faecfdc6 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1033,9 +1033,6 @@ dtb-$(CONFIG_ARCH_PXA) +=3D \
 	pxa300-raumfeld-speaker-m.dtb \
 	pxa300-raumfeld-speaker-one.dtb \
 	pxa300-raumfeld-speaker-s.dtb
-dtb-$(CONFIG_ARCH_OXNAS) +=3D \
-	ox810se-wd-mbwe.dtb \
-	ox820-cloudengines-pogoplug-series-3.dtb
 dtb-$(CONFIG_ARCH_QCOM) +=3D \
 	qcom-apq8016-sbc.dtb \
 	qcom-apq8026-asus-sparrow.dtb \
diff --git a/arch/arm/boot/dts/ox810se-wd-mbwe.dts b/arch/arm/boot/dts/ox81=
0se-wd-mbwe.dts
deleted file mode 100644
index c59e06ff2423..000000000000
--- a/arch/arm/boot/dts/ox810se-wd-mbwe.dts
+++ /dev/null
@@ -1,115 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * wd-mbwe.dtsi - Device tree file for Western Digital My Book World Editi=
on
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- */
-
-/dts-v1/;
-#include "ox810se.dtsi"
-
-/ {
-	model =3D "Western Digital My Book World Edition";
-
-	compatible =3D "wd,mbwe", "oxsemi,ox810se";
-
-	chosen {
-		bootargs =3D "console=3DttyS1,115200n8 earlyprintk=3Dserial";
-	};
-
-	memory {
-		/* 128Mbytes DDR */
-		reg =3D <0x48000000 0x8000000>;
-	};
-
-	aliases {
-		serial1 =3D &uart1;
-		gpio0 =3D &gpio0;
-		gpio1 =3D &gpio1;
-	};
-
-	gpio-keys-polled {
-		compatible =3D "gpio-keys-polled";
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-		poll-interval =3D <100>;
-
-		power {
-			label =3D "power";
-			gpios =3D <&gpio0 0 1>;
-			linux,code =3D <0x198>;
-		};
-
-		recovery {
-			label =3D "recovery";
-			gpios =3D <&gpio0 4 1>;
-			linux,code =3D <0xab>;
-		};
-	};
-
-	leds {
-		compatible =3D "gpio-leds";
-
-		a0 {
-			label =3D "activity0";
-			gpios =3D <&gpio0 25 0>;
-			default-state =3D "keep";
-		};
-
-		a1 {
-			label =3D "activity1";
-			gpios =3D <&gpio0 26 0>;
-			default-state =3D "keep";
-		};
-
-		a2 {
-			label =3D "activity2";
-			gpios =3D <&gpio0 5 0>;
-			default-state =3D "keep";
-		};
-
-		a3 {
-			label =3D "activity3";
-			gpios =3D <&gpio0 6 0>;
-			default-state =3D "keep";
-		};
-
-		a4 {
-			label =3D "activity4";
-			gpios =3D <&gpio0 7 0>;
-			default-state =3D "keep";
-		};
-
-		a5 {
-			label =3D "activity5";
-			gpios =3D <&gpio1 2 0>;
-			default-state =3D "keep";
-		};
-	};
-
-	i2c-gpio {
-		compatible =3D "i2c-gpio";
-		gpios =3D <&gpio0 3 0 /* sda */
-			 &gpio0 2 0 /* scl */
-			 >;
-		i2c-gpio,delay-us =3D <2>;        /* ~100 kHz */
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-		rtc0: rtc@48 {
-			compatible =3D "st,m41t00";
-			reg =3D <0x68>;
-		};
-	};
-};
-
-&etha {
-	status =3D "okay";
-};
-
-&uart1 {
-	status =3D "okay";
-
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_uart1>;
-};
diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dts=
i
deleted file mode 100644
index 96c0745f7b70..000000000000
--- a/arch/arm/boot/dts/ox810se.dtsi
+++ /dev/null
@@ -1,357 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * ox810se.dtsi - Device tree file for Oxford Semiconductor OX810SE SoC
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <dt-bindings/clock/oxsemi,ox810se.h>
-#include <dt-bindings/reset/oxsemi,ox810se.h>
-
-/ {
-	#address-cells =3D <1>;
-	#size-cells =3D <1>;
-	compatible =3D "oxsemi,ox810se";
-
-	cpus {
-		#address-cells =3D <0>;
-		#size-cells =3D <0>;
-
-		cpu {
-			device_type =3D "cpu";
-			compatible =3D "arm,arm926ej-s";
-			clocks =3D <&armclk>;
-		};
-	};
-
-	memory {
-		device_type =3D "memory";
-		/* Max 256MB @ 0x48000000 */
-		reg =3D <0x48000000 0x10000000>;
-	};
-
-	clocks {
-		osc: oscillator {
-			compatible =3D "fixed-clock";
-			#clock-cells =3D <0>;
-			clock-frequency =3D <25000000>;
-		};
-
-		gmacclk: gmacclk {
-			compatible =3D "fixed-clock";
-			#clock-cells =3D <0>;
-			clock-frequency =3D <125000000>;
-		};
-
-		rpsclk: rpsclk {
-			compatible =3D "fixed-factor-clock";
-			#clock-cells =3D <0>;
-			clock-div =3D <1>;
-			clock-mult =3D <1>;
-			clocks =3D <&osc>;
-		};
-
-		pll400: pll400 {
-			compatible =3D "fixed-clock";
-			#clock-cells =3D <0>;
-			clock-frequency =3D <733333333>;
-		};
-
-		sysclk: sysclk {
-			compatible =3D "fixed-factor-clock";
-			#clock-cells =3D <0>;
-			clock-div =3D <4>;
-			clock-mult =3D <1>;
-			clocks =3D <&pll400>;
-		};
-
-		armclk: armclk {
-			compatible =3D "fixed-factor-clock";
-			#clock-cells =3D <0>;
-			clock-div =3D <2>;
-			clock-mult =3D <1>;
-			clocks =3D <&pll400>;
-		};
-	};
-
-	soc {
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-		compatible =3D "simple-bus";
-		ranges;
-		interrupt-parent =3D <&intc>;
-
-		etha: ethernet@40400000 {
-			compatible =3D "oxsemi,ox810se-dwmac", "snps,dwmac";
-			reg =3D <0x40400000 0x2000>;
-			interrupts =3D <8>;
-			interrupt-names =3D "macirq";
-			mac-address =3D [000000000000]; /* Filled in by U-Boot */
-			phy-mode =3D "rgmii";
-
-			clocks =3D <&stdclk 6>, <&gmacclk>;
-			clock-names =3D "gmac", "stmmaceth";
-			resets =3D <&reset 6>;
-
-			/* Regmap for sys registers */
-			oxsemi,sys-ctrl =3D <&sys>;
-
-			status =3D "disabled";
-		};
-
-		apb-bridge@44000000 {
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
-			compatible =3D "simple-bus";
-			ranges =3D <0 0x44000000 0x1000000>;
-
-			pinctrl: pinctrl {
-				compatible =3D "oxsemi,ox810se-pinctrl";
-
-				/* Regmap for sys registers */
-				oxsemi,sys-ctrl =3D <&sys>;
-
-				pinctrl_uart0: uart0 {
-					uart0a {
-						pins =3D "gpio31";
-						function =3D "fct3";
-					};
-					uart0b {
-						pins =3D "gpio32";
-						function =3D "fct3";
-					};
-				};
-
-				pinctrl_uart0_modem: uart0_modem {
-					uart0c {
-						pins =3D "gpio27";
-						function =3D "fct3";
-					};
-					uart0d {
-						pins =3D "gpio28";
-						function =3D "fct3";
-					};
-					uart0e {
-						pins =3D "gpio29";
-						function =3D "fct3";
-					};
-					uart0f {
-						pins =3D "gpio30";
-						function =3D "fct3";
-					};
-					uart0g {
-						pins =3D "gpio33";
-						function =3D "fct3";
-					};
-					uart0h {
-						pins =3D "gpio34";
-						function =3D "fct3";
-					};
-				};
-
-				pinctrl_uart1: uart1 {
-					uart1a {
-						pins =3D "gpio20";
-						function =3D "fct3";
-					};
-					uart1b {
-						pins =3D "gpio22";
-						function =3D "fct3";
-					};
-				};
-
-				pinctrl_uart1_modem: uart1_modem {
-					uart1c {
-						pins =3D "gpio8";
-						function =3D "fct3";
-					};
-					uart1d {
-						pins =3D "gpio9";
-						function =3D "fct3";
-					};
-					uart1e {
-						pins =3D "gpio23";
-						function =3D "fct3";
-					};
-					uart1f {
-						pins =3D "gpio24";
-						function =3D "fct3";
-					};
-					uart1g {
-						pins =3D "gpio25";
-						function =3D "fct3";
-					};
-					uart1h {
-						pins =3D "gpio26";
-						function =3D "fct3";
-					};
-				};
-
-				pinctrl_uart2: uart2 {
-					uart2a {
-						pins =3D "gpio6";
-						function =3D "fct3";
-					};
-					uart2b {
-						pins =3D "gpio7";
-						function =3D "fct3";
-					};
-				};
-
-				pinctrl_uart2_modem: uart2_modem {
-					uart2c {
-						pins =3D "gpio0";
-						function =3D "fct3";
-					};
-					uart2d {
-						pins =3D "gpio1";
-						function =3D "fct3";
-					};
-					uart2e {
-						pins =3D "gpio2";
-						function =3D "fct3";
-					};
-					uart2f {
-						pins =3D "gpio3";
-						function =3D "fct3";
-					};
-					uart2g {
-						pins =3D "gpio4";
-						function =3D "fct3";
-					};
-					uart2h {
-						pins =3D "gpio5";
-						function =3D "fct3";
-					};
-				};
-			};
-
-			gpio0: gpio@0 {
-				compatible =3D "oxsemi,ox810se-gpio";
-				reg =3D <0x000000 0x100000>;
-				interrupts =3D <21>;
-				#gpio-cells =3D <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells =3D <2>;
-				ngpios =3D <32>;
-				oxsemi,gpio-bank =3D <0>;
-				gpio-ranges =3D <&pinctrl 0 0 32>;
-			};
-
-			gpio1: gpio@100000 {
-				compatible =3D "oxsemi,ox810se-gpio";
-				reg =3D <0x100000 0x100000>;
-				interrupts =3D <22>;
-				#gpio-cells =3D <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells =3D <2>;
-				ngpios =3D <3>;
-				oxsemi,gpio-bank =3D <1>;
-				gpio-ranges =3D <&pinctrl 0 32 3>;
-			};
-
-			uart0: serial@200000 {
-			       compatible =3D "ns16550a";
-			       reg =3D <0x200000 0x100000>;
-			       clocks =3D <&sysclk>;
-			       interrupts =3D <23>;
-			       reg-shift =3D <0>;
-			       fifo-size =3D <16>;
-			       reg-io-width =3D <1>;
-			       current-speed =3D <115200>;
-			       no-loopback-test;
-			       status =3D "disabled";
-			       resets =3D <&reset RESET_UART1>;
-			};
-
-			uart1: serial@300000 {
-			       compatible =3D "ns16550a";
-			       reg =3D <0x300000 0x100000>;
-			       clocks =3D <&sysclk>;
-			       interrupts =3D <24>;
-			       reg-shift =3D <0>;
-			       fifo-size =3D <16>;
-			       reg-io-width =3D <1>;
-			       current-speed =3D <115200>;
-			       no-loopback-test;
-			       status =3D "disabled";
-			       resets =3D <&reset RESET_UART2>;
-			};
-
-			uart2: serial@900000 {
-			       compatible =3D "ns16550a";
-			       reg =3D <0x900000 0x100000>;
-			       clocks =3D <&sysclk>;
-			       interrupts =3D <29>;
-			       reg-shift =3D <0>;
-			       fifo-size =3D <16>;
-			       reg-io-width =3D <1>;
-			       current-speed =3D <115200>;
-			       no-loopback-test;
-			       status =3D "disabled";
-			       resets =3D <&reset RESET_UART3>;
-			};
-
-			uart3: serial@a00000 {
-			       compatible =3D "ns16550a";
-			       reg =3D <0xa00000 0x100000>;
-			       clocks =3D <&sysclk>;
-			       interrupts =3D <30>;
-			       reg-shift =3D <0>;
-			       fifo-size =3D <16>;
-			       reg-io-width =3D <1>;
-			       current-speed =3D <115200>;
-			       no-loopback-test;
-			       status =3D "disabled";
-			       resets =3D <&reset RESET_UART4>;
-			};
-		};
-
-		apb-bridge@45000000 {
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
-			compatible =3D "simple-bus";
-			ranges =3D <0 0x45000000 0x1000000>;
-
-			sys: sys-ctrl@0 {
-				compatible =3D "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
-				reg =3D <0x000000 0x100000>;
-
-				reset: reset-controller {
-					compatible =3D "oxsemi,ox810se-reset";
-					#reset-cells =3D <1>;
-				};
-
-				stdclk: stdclk {
-					compatible =3D "oxsemi,ox810se-stdclk";
-					#clock-cells =3D <1>;
-				};
-			};
-
-			rps@300000 {
-				#address-cells =3D <1>;
-				#size-cells =3D <1>;
-				compatible =3D "simple-bus";
-				ranges =3D <0 0x300000 0x100000>;
-
-				intc: interrupt-controller@0 {
-					compatible =3D "oxsemi,ox810se-rps-irq";
-					interrupt-controller;
-					reg =3D <0 0x200>;
-					#interrupt-cells =3D <1>;
-					valid-mask =3D <0xffffffff>;
-					clear-mask =3D <0xffffffff>;
-				};
-
-				timer0: timer@200 {
-					compatible =3D "oxsemi,ox810se-rps-timer";
-					reg =3D <0x200 0x40>;
-					clocks =3D <&rpsclk>;
-					interrupts =3D <4 5>;
-				};
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/ox820-cloudengines-pogoplug-series-3.dts b/a=
rch/arm/boot/dts/ox820-cloudengines-pogoplug-series-3.dts
deleted file mode 100644
index c3daceccde55..000000000000
--- a/arch/arm/boot/dts/ox820-cloudengines-pogoplug-series-3.dts
+++ /dev/null
@@ -1,93 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * cloudengines-pogoplug-series-3.dtsi - Device tree file for Cloud Engine=
s PogoPlug Series 3
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- */
-
-/dts-v1/;
-#include "ox820.dtsi"
-
-/ {
-	model =3D "Cloud Engines PogoPlug Series 3";
-
-	compatible =3D "cloudengines,pogoplugv3", "oxsemi,ox820";
-
-	chosen {
-		bootargs =3D "earlyprintk";
-		stdout-path =3D "serial0:115200n8";
-	};
-
-	memory {
-		/* 128Mbytes DDR */
-		reg =3D <0x60000000 0x8000000>;
-	};
-
-	aliases {
-		serial0 =3D &uart0;
-		gpio0 =3D &gpio0;
-		gpio1 =3D &gpio1;
-	};
-
-	leds {
-		compatible =3D "gpio-leds";
-
-		blue {
-			label =3D "pogoplug:blue";
-			gpios =3D <&gpio0 2 0>;
-			default-state =3D "keep";
-		};
-
-		orange {
-			label =3D "pogoplug:orange";
-			gpios =3D <&gpio1 16 1>;
-			default-state =3D "keep";
-		};
-
-		green {
-			label =3D "pogoplug:green";
-			gpios =3D <&gpio1 17 1>;
-			default-state =3D "keep";
-		};
-	};
-};
-
-&uart0 {
-	status =3D "okay";
-
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_uart0>;
-};
-
-&nandc {
-	status =3D "okay";
-
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_nand>;
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
-
-&etha {
-	status =3D "okay";
-
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_etha_mdio>;
-};
diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
deleted file mode 100644
index dde4364892bf..000000000000
--- a/arch/arm/boot/dts/ox820.dtsi
+++ /dev/null
@@ -1,299 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * ox820.dtsi - Device tree file for Oxford Semiconductor OX820 SoC
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/oxsemi,ox820.h>
-#include <dt-bindings/reset/oxsemi,ox820.h>
-
-/ {
-	#address-cells =3D <1>;
-	#size-cells =3D <1>;
-	compatible =3D "oxsemi,ox820";
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-		enable-method =3D "oxsemi,ox820-smp";
-
-		cpu@0 {
-			device_type =3D "cpu";
-			compatible =3D "arm,arm11mpcore";
-			clocks =3D <&armclk>;
-			reg =3D <0>;
-		};
-
-		cpu@1 {
-			device_type =3D "cpu";
-			compatible =3D "arm,arm11mpcore";
-			clocks =3D <&armclk>;
-			reg =3D <1>;
-		};
-	};
-
-	memory {
-		device_type =3D "memory";
-		/* Max 512MB @ 0x60000000 */
-		reg =3D <0x60000000 0x20000000>;
-	};
-
-	clocks {
-		osc: oscillator {
-			compatible =3D "fixed-clock";
-			#clock-cells =3D <0>;
-			clock-frequency =3D <25000000>;
-		};
-
-		gmacclk: gmacclk {
-			compatible =3D "fixed-clock";
-			#clock-cells =3D <0>;
-			clock-frequency =3D <125000000>;
-		};
-
-		sysclk: sysclk {
-			compatible =3D "fixed-factor-clock";
-			#clock-cells =3D <0>;
-			clock-div =3D <4>;
-			clock-mult =3D <1>;
-			clocks =3D <&osc>;
-		};
-
-		plla: plla {
-			compatible =3D "fixed-clock";
-			#clock-cells =3D <0>;
-			clock-frequency =3D <850000000>;
-		};
-
-		armclk: armclk {
-			compatible =3D "fixed-factor-clock";
-			#clock-cells =3D <0>;
-			clock-div =3D <2>;
-			clock-mult =3D <1>;
-			clocks =3D <&plla>;
-		};
-	};
-
-	soc {
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-		compatible =3D "simple-bus";
-		ranges;
-		interrupt-parent =3D <&gic>;
-
-		nandc: nand-controller@41000000 {
-			compatible =3D "oxsemi,ox820-nand";
-			reg =3D <0x41000000 0x100000>;
-			clocks =3D <&stdclk CLK_820_NAND>;
-			resets =3D <&reset RESET_NAND>;
-			#address-cells =3D <1>;
-			#size-cells =3D <0>;
-			status =3D "disabled";
-		};
-
-		etha: ethernet@40400000 {
-			compatible =3D "oxsemi,ox820-dwmac", "snps,dwmac";
-			reg =3D <0x40400000 0x2000>;
-			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names =3D "macirq", "eth_wake_irq";
-			mac-address =3D [000000000000]; /* Filled in by U-Boot */
-			phy-mode =3D "rgmii";
-
-			clocks =3D <&stdclk CLK_820_ETHA>, <&gmacclk>;
-			clock-names =3D "gmac", "stmmaceth";
-			resets =3D <&reset RESET_MAC>;
-
-			/* Regmap for sys registers */
-			oxsemi,sys-ctrl =3D <&sys>;
-
-			status =3D "disabled";
-		};
-
-		apb-bridge@44000000 {
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
-			compatible =3D "simple-bus";
-			ranges =3D <0 0x44000000 0x1000000>;
-
-			pinctrl: pinctrl {
-				compatible =3D "oxsemi,ox820-pinctrl";
-
-				/* Regmap for sys registers */
-				oxsemi,sys-ctrl =3D <&sys>;
-
-				pinctrl_uart0: uart0 {
-					uart0 {
-						pins =3D "gpio30", "gpio31";
-						function =3D "fct5";
-					};
-				};
-
-				pinctrl_uart0_modem: uart0_modem {
-					uart0_modem_a {
-						pins =3D "gpio24", "gpio24", "gpio26", "gpio27";
-						function =3D "fct4";
-					};
-					uart0_modem_b {
-						pins =3D "gpio28", "gpio29";
-						function =3D "fct5";
-					};
-				};
-
-				pinctrl_uart1: uart1 {
-					uart1 {
-						pins =3D "gpio7", "gpio8";
-						function =3D "fct4";
-					};
-				};
-
-				pinctrl_uart1_modem: uart1_modem {
-					uart1_modem {
-						pins =3D "gpio5", "gpio6", "gpio40", "gpio41", "gpio42", "gpio43";
-						function =3D "fct4";
-					};
-				};
-
-				pinctrl_etha_mdio: etha_mdio {
-					etha_mdio {
-						pins =3D "gpio3", "gpio4";
-						function =3D "fct1";
-					};
-				};
-
-				pinctrl_nand: nand {
-					nand {
-						pins =3D "gpio12", "gpio13", "gpio14", "gpio15",
-						     "gpio16", "gpio17", "gpio18", "gpio19",
-						     "gpio20", "gpio21", "gpio22", "gpio23",
-						     "gpio24";
-						function =3D "fct1";
-					};
-				};
-			};
-
-			gpio0: gpio@0 {
-				compatible =3D "oxsemi,ox820-gpio";
-				reg =3D <0x000000 0x100000>;
-				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-				#gpio-cells =3D <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells =3D <2>;
-				ngpios =3D <32>;
-				oxsemi,gpio-bank =3D <0>;
-				gpio-ranges =3D <&pinctrl 0 0 32>;
-			};
-
-			gpio1: gpio@100000 {
-				compatible =3D "oxsemi,ox820-gpio";
-				reg =3D <0x100000 0x100000>;
-				interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-				#gpio-cells =3D <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells =3D <2>;
-				ngpios =3D <18>;
-				oxsemi,gpio-bank =3D <1>;
-				gpio-ranges =3D <&pinctrl 0 32 18>;
-			};
-
-			uart0: serial@200000 {
-			       compatible =3D "ns16550a";
-			       reg =3D <0x200000 0x100000>;
-			       interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-			       reg-shift =3D <0>;
-			       fifo-size =3D <16>;
-			       reg-io-width =3D <1>;
-			       current-speed =3D <115200>;
-			       no-loopback-test;
-			       status =3D "disabled";
-			       clocks =3D <&sysclk>;
-			       resets =3D <&reset RESET_UART1>;
-			};
-
-			uart1: serial@300000 {
-			       compatible =3D "ns16550a";
-			       reg =3D <0x200000 0x100000>;
-			       interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-			       reg-shift =3D <0>;
-			       fifo-size =3D <16>;
-			       reg-io-width =3D <1>;
-			       current-speed =3D <115200>;
-			       no-loopback-test;
-			       status =3D "disabled";
-			       clocks =3D <&sysclk>;
-			       resets =3D <&reset RESET_UART2>;
-			};
-
-			rps@400000 {
-				#address-cells =3D <1>;
-				#size-cells =3D <1>;
-				compatible =3D "simple-bus";
-				ranges =3D <0 0x400000 0x100000>;
-
-				intc: interrupt-controller@0 {
-					compatible =3D "oxsemi,ox820-rps-irq", "oxsemi,ox810se-rps-irq";
-					interrupt-controller;
-					reg =3D <0 0x200>;
-					interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-					#interrupt-cells =3D <1>;
-					valid-mask =3D <0xffffffff>;
-					clear-mask =3D <0xffffffff>;
-				};
-
-				timer0: timer@200 {
-					compatible =3D "oxsemi,ox820-rps-timer";
-					reg =3D <0x200 0x40>;
-					clocks =3D <&sysclk>;
-					interrupt-parent =3D <&intc>;
-					interrupts =3D <4>;
-				};
-			};
-
-			sys: sys-ctrl@e00000 {
-				compatible =3D "oxsemi,ox820-sys-ctrl", "syscon", "simple-mfd";
-				reg =3D <0xe00000 0x200000>;
-
-				reset: reset-controller {
-					compatible =3D "oxsemi,ox820-reset", "oxsemi,ox810se-reset";
-					#reset-cells =3D <1>;
-				};
-
-				stdclk: stdclk {
-					compatible =3D "oxsemi,ox820-stdclk", "oxsemi,ox810se-stdclk";
-					#clock-cells =3D <1>;
-				};
-			};
-		};
-
-		apb-bridge@47000000 {
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
-			compatible =3D "simple-bus";
-			ranges =3D <0 0x47000000 0x1000000>;
-
-			scu: scu@0 {
-				compatible =3D "arm,arm11mp-scu";
-				reg =3D <0x0 0x100>;
-			};
-
-			local-timer@600 {
-				compatible =3D "arm,arm11mp-twd-timer";
-				reg =3D <0x600 0x20>;
-				interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_RAW(3)|IRQ_TYPE_LEVEL_HIGH)>;
-				clocks =3D <&armclk>;
-			};
-
-			gic: interrupt-controller@1000 {
-				compatible =3D "arm,arm11mp-gic";
-				interrupt-controller;
-				#interrupt-cells =3D <3>;
-				reg =3D <0x1000 0x1000>,
-				      <0x100 0x500>;
-			};
-		};
-	};
-};

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#229): https://groups.io/g/linux-oxnas/message/229
Mute This Topic: https://groups.io/mt/98030324/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


