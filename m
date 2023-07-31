Return-Path: <bounce+16102+314+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A50AF7699E7
	for <lists+linux-oxnas@lfdr.de>; Mon, 31 Jul 2023 16:44:25 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=c0sqoj9BeB3gXqGczAgocCunksExSvcYfHmvTi8v1yU=;
 c=relaxed/simple; d=groups.io;
 h=X-Received:X-Received:X-Received:X-Gm-Message-State:X-Google-Smtp-Source:X-Received:X-Received:Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:Organization:In-Reply-To:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Language:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1690814664; v=1;
 b=OzAL6uyuJblt24IJd2WiAq/hrsTK91ovD/p0JK2fz8vLGYgmKxPosIXZIf3HSKp68q+FIkbt
 0SUsLjwkkkj2qMyx6iQ3DrJhchJH6wtpbtINV1mtNCZz3p1h3uoqWLSAggBr+hMZmHYBz6NWkkz
 p4is43wcgM9+5XCUz3oG/WMs=
X-Received: by 127.0.0.2 with SMTP id 8J4bYY1809624xHjCZSGubc1; Mon, 31 Jul 2023 07:44:24 -0700
X-Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9271.1690814663591005931
 for <linux-oxnas@groups.io>;
 Mon, 31 Jul 2023 07:44:24 -0700
X-Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so3175896f8f.3
        for <linux-oxnas@groups.io>; Mon, 31 Jul 2023 07:44:23 -0700 (PDT)
X-Gm-Message-State: 3GrnNalFApgkDTcEvZYuI1CBx1808289AA=
X-Google-Smtp-Source: APBJJlFg4JPQPIRmOB6Hi4fqXz3/h/QBl/zQnkJSgivpJXMlE5rTh4htchIZ0U7og1vFfw+8kJrNBw==
X-Received: by 2002:a5d:591b:0:b0:317:71a6:f408 with SMTP id v27-20020a5d591b000000b0031771a6f408mr20111wrd.67.1690814661791;
        Mon, 31 Jul 2023 07:44:21 -0700 (PDT)
X-Received: from ?IPV6:2a01:e0a:982:cbb0:f723:b60b:92cd:4df4? ([2a01:e0a:982:cbb0:f723:b60b:92cd:4df4])
        by smtp.gmail.com with ESMTPSA id b18-20020adfe312000000b0031437ec7ec1sm13352255wrj.2.2023.07.31.07.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 07:44:21 -0700 (PDT)
Message-ID: <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
Date: Mon, 31 Jul 2023 16:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Subject: Re: [linux-oxnas] [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl driver
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
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-oxnas@groups.io,
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
Precedence: Bulk
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/plugh>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On 30/06/2023 18:58, Neil Armstrong wrote:
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove support
> for OX810 and OX820 pinctrl & gpio.

Do you plan to take patches 9, 10 & 11 or should I funnel them via a final =
SoC PR ?

Thanks,
Neil

>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/pinctrl/Kconfig         |   11 -
>   drivers/pinctrl/Makefile        |    1 -
>   drivers/pinctrl/pinctrl-oxnas.c | 1292 --------------------------------=
-------
>   3 files changed, 1304 deletions(-)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 57d57af1f624..7dfb7190580e 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -355,17 +355,6 @@ config PINCTRL_OCELOT
>  =20
>   	  If conpiled as a module, the module name will be pinctrl-ocelot.
>  =20
> -config PINCTRL_OXNAS
> -	bool
> -	depends on OF
> -	select PINMUX
> -	select PINCONF
> -	select GENERIC_PINCONF
> -	select GPIOLIB
> -	select OF_GPIO
> -	select GPIOLIB_IRQCHIP
> -	select MFD_SYSCON
> -
>   config PINCTRL_PALMAS
>   	tristate "Pinctrl driver for the PALMAS Series MFD devices"
>   	depends on OF && MFD_PALMAS
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 482b391b5deb..dd6cda270294 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -38,7 +38,6 @@ obj-$(CONFIG_PINCTRL_MCP23S08)	+=3D pinctrl-mcp23s08.o
>   obj-$(CONFIG_PINCTRL_MICROCHIP_SGPIO)	+=3D pinctrl-microchip-sgpio.o
>   obj-$(CONFIG_PINCTRL_MLXBF3)	+=3D pinctrl-mlxbf3.o
>   obj-$(CONFIG_PINCTRL_OCELOT)	+=3D pinctrl-ocelot.o
> -obj-$(CONFIG_PINCTRL_OXNAS)	+=3D pinctrl-oxnas.o
>   obj-$(CONFIG_PINCTRL_PALMAS)	+=3D pinctrl-palmas.o
>   obj-$(CONFIG_PINCTRL_PIC32)	+=3D pinctrl-pic32.o
>   obj-$(CONFIG_PINCTRL_PISTACHIO)	+=3D pinctrl-pistachio.o
> diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-ox=
nas.c
> deleted file mode 100644
> index fb10a8473ebe..000000000000
> --- a/drivers/pinctrl/pinctrl-oxnas.c
> +++ /dev/null
> @@ -1,1292 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Oxford Semiconductor OXNAS SoC Family pinctrl driver
> - *
> - * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
> - *
> - * Based on pinctrl-pic32.c
> - * Joshua Henderson, <joshua.henderson@microchip.com>
> - * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
> - */
> -#include <linux/gpio/driver.h>
> -#include <linux/interrupt.h>
> -#include <linux/io.h>
> -#include <linux/irq.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
> -#include <linux/pinctrl/pinconf.h>
> -#include <linux/pinctrl/pinconf-generic.h>
> -#include <linux/pinctrl/pinctrl.h>
> -#include <linux/pinctrl/pinmux.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/regmap.h>
> -#include <linux/mfd/syscon.h>
> -
> -#include "pinctrl-utils.h"
> -
> -#define PINS_PER_BANK		32
> -
> -#define GPIO_BANK_START(bank)		((bank) * PINS_PER_BANK)
> -
> -/* OX810 Regmap Offsets */
> -#define PINMUX_810_PRIMARY_SEL0		0x0c
> -#define PINMUX_810_SECONDARY_SEL0	0x14
> -#define PINMUX_810_TERTIARY_SEL0	0x8c
> -#define PINMUX_810_PRIMARY_SEL1		0x10
> -#define PINMUX_810_SECONDARY_SEL1	0x18
> -#define PINMUX_810_TERTIARY_SEL1	0x90
> -#define PINMUX_810_PULLUP_CTRL0		0xac
> -#define PINMUX_810_PULLUP_CTRL1		0xb0
> -
> -/* OX820 Regmap Offsets */
> -#define PINMUX_820_BANK_OFFSET		0x100000
> -#define PINMUX_820_SECONDARY_SEL	0x14
> -#define PINMUX_820_TERTIARY_SEL		0x8c
> -#define PINMUX_820_QUATERNARY_SEL	0x94
> -#define PINMUX_820_DEBUG_SEL		0x9c
> -#define PINMUX_820_ALTERNATIVE_SEL	0xa4
> -#define PINMUX_820_PULLUP_CTRL		0xac
> -
> -/* GPIO Registers */
> -#define INPUT_VALUE	0x00
> -#define OUTPUT_EN	0x04
> -#define IRQ_PENDING	0x0c
> -#define OUTPUT_SET	0x14
> -#define OUTPUT_CLEAR	0x18
> -#define OUTPUT_EN_SET	0x1c
> -#define OUTPUT_EN_CLEAR	0x20
> -#define RE_IRQ_ENABLE	0x28
> -#define FE_IRQ_ENABLE	0x2c
> -
> -struct oxnas_function {
> -	const char *name;
> -	const char * const *groups;
> -	unsigned int ngroups;
> -};
> -
> -struct oxnas_pin_group {
> -	const char *name;
> -	unsigned int pin;
> -	unsigned int bank;
> -	struct oxnas_desc_function *functions;
> -};
> -
> -struct oxnas_desc_function {
> -	const char *name;
> -	unsigned int fct;
> -};
> -
> -struct oxnas_gpio_bank {
> -	void __iomem *reg_base;
> -	struct gpio_chip gpio_chip;
> -	struct irq_chip irq_chip;
> -	unsigned int id;
> -};
> -
> -struct oxnas_pinctrl {
> -	struct regmap *regmap;
> -	struct device *dev;
> -	struct pinctrl_dev *pctldev;
> -	const struct oxnas_function *functions;
> -	unsigned int nfunctions;
> -	const struct oxnas_pin_group *groups;
> -	unsigned int ngroups;
> -	struct oxnas_gpio_bank *gpio_banks;
> -	unsigned int nbanks;
> -};
> -
> -struct oxnas_pinctrl_data {
> -	struct pinctrl_desc *desc;
> -	struct oxnas_pinctrl *pctl;
> -};
> -
> -static const struct pinctrl_pin_desc oxnas_ox810se_pins[] =3D {
> -	PINCTRL_PIN(0, "gpio0"),
> -	PINCTRL_PIN(1, "gpio1"),
> -	PINCTRL_PIN(2, "gpio2"),
> -	PINCTRL_PIN(3, "gpio3"),
> -	PINCTRL_PIN(4, "gpio4"),
> -	PINCTRL_PIN(5, "gpio5"),
> -	PINCTRL_PIN(6, "gpio6"),
> -	PINCTRL_PIN(7, "gpio7"),
> -	PINCTRL_PIN(8, "gpio8"),
> -	PINCTRL_PIN(9, "gpio9"),
> -	PINCTRL_PIN(10, "gpio10"),
> -	PINCTRL_PIN(11, "gpio11"),
> -	PINCTRL_PIN(12, "gpio12"),
> -	PINCTRL_PIN(13, "gpio13"),
> -	PINCTRL_PIN(14, "gpio14"),
> -	PINCTRL_PIN(15, "gpio15"),
> -	PINCTRL_PIN(16, "gpio16"),
> -	PINCTRL_PIN(17, "gpio17"),
> -	PINCTRL_PIN(18, "gpio18"),
> -	PINCTRL_PIN(19, "gpio19"),
> -	PINCTRL_PIN(20, "gpio20"),
> -	PINCTRL_PIN(21, "gpio21"),
> -	PINCTRL_PIN(22, "gpio22"),
> -	PINCTRL_PIN(23, "gpio23"),
> -	PINCTRL_PIN(24, "gpio24"),
> -	PINCTRL_PIN(25, "gpio25"),
> -	PINCTRL_PIN(26, "gpio26"),
> -	PINCTRL_PIN(27, "gpio27"),
> -	PINCTRL_PIN(28, "gpio28"),
> -	PINCTRL_PIN(29, "gpio29"),
> -	PINCTRL_PIN(30, "gpio30"),
> -	PINCTRL_PIN(31, "gpio31"),
> -	PINCTRL_PIN(32, "gpio32"),
> -	PINCTRL_PIN(33, "gpio33"),
> -	PINCTRL_PIN(34, "gpio34"),
> -};
> -
> -static const struct pinctrl_pin_desc oxnas_ox820_pins[] =3D {
> -	PINCTRL_PIN(0, "gpio0"),
> -	PINCTRL_PIN(1, "gpio1"),
> -	PINCTRL_PIN(2, "gpio2"),
> -	PINCTRL_PIN(3, "gpio3"),
> -	PINCTRL_PIN(4, "gpio4"),
> -	PINCTRL_PIN(5, "gpio5"),
> -	PINCTRL_PIN(6, "gpio6"),
> -	PINCTRL_PIN(7, "gpio7"),
> -	PINCTRL_PIN(8, "gpio8"),
> -	PINCTRL_PIN(9, "gpio9"),
> -	PINCTRL_PIN(10, "gpio10"),
> -	PINCTRL_PIN(11, "gpio11"),
> -	PINCTRL_PIN(12, "gpio12"),
> -	PINCTRL_PIN(13, "gpio13"),
> -	PINCTRL_PIN(14, "gpio14"),
> -	PINCTRL_PIN(15, "gpio15"),
> -	PINCTRL_PIN(16, "gpio16"),
> -	PINCTRL_PIN(17, "gpio17"),
> -	PINCTRL_PIN(18, "gpio18"),
> -	PINCTRL_PIN(19, "gpio19"),
> -	PINCTRL_PIN(20, "gpio20"),
> -	PINCTRL_PIN(21, "gpio21"),
> -	PINCTRL_PIN(22, "gpio22"),
> -	PINCTRL_PIN(23, "gpio23"),
> -	PINCTRL_PIN(24, "gpio24"),
> -	PINCTRL_PIN(25, "gpio25"),
> -	PINCTRL_PIN(26, "gpio26"),
> -	PINCTRL_PIN(27, "gpio27"),
> -	PINCTRL_PIN(28, "gpio28"),
> -	PINCTRL_PIN(29, "gpio29"),
> -	PINCTRL_PIN(30, "gpio30"),
> -	PINCTRL_PIN(31, "gpio31"),
> -	PINCTRL_PIN(32, "gpio32"),
> -	PINCTRL_PIN(33, "gpio33"),
> -	PINCTRL_PIN(34, "gpio34"),
> -	PINCTRL_PIN(35, "gpio35"),
> -	PINCTRL_PIN(36, "gpio36"),
> -	PINCTRL_PIN(37, "gpio37"),
> -	PINCTRL_PIN(38, "gpio38"),
> -	PINCTRL_PIN(39, "gpio39"),
> -	PINCTRL_PIN(40, "gpio40"),
> -	PINCTRL_PIN(41, "gpio41"),
> -	PINCTRL_PIN(42, "gpio42"),
> -	PINCTRL_PIN(43, "gpio43"),
> -	PINCTRL_PIN(44, "gpio44"),
> -	PINCTRL_PIN(45, "gpio45"),
> -	PINCTRL_PIN(46, "gpio46"),
> -	PINCTRL_PIN(47, "gpio47"),
> -	PINCTRL_PIN(48, "gpio48"),
> -	PINCTRL_PIN(49, "gpio49"),
> -};
> -
> -static const char * const oxnas_ox810se_fct0_group[] =3D {
> -	"gpio0",  "gpio1",  "gpio2",  "gpio3",
> -	"gpio4",  "gpio5",  "gpio6",  "gpio7",
> -	"gpio8",  "gpio9",  "gpio10", "gpio11",
> -	"gpio12", "gpio13", "gpio14", "gpio15",
> -	"gpio16", "gpio17", "gpio18", "gpio19",
> -	"gpio20", "gpio21", "gpio22", "gpio23",
> -	"gpio24", "gpio25", "gpio26", "gpio27",
> -	"gpio28", "gpio29", "gpio30", "gpio31",
> -	"gpio32", "gpio33", "gpio34"
> -};
> -
> -static const char * const oxnas_ox810se_fct3_group[] =3D {
> -	"gpio0",  "gpio1",  "gpio2",  "gpio3",
> -	"gpio4",  "gpio5",  "gpio6",  "gpio7",
> -	"gpio8",  "gpio9",
> -	"gpio20",
> -	"gpio22", "gpio23", "gpio24", "gpio25",
> -	"gpio26", "gpio27", "gpio28", "gpio29",
> -	"gpio30", "gpio31", "gpio32", "gpio33",
> -	"gpio34"
> -};
> -
> -static const char * const oxnas_ox820_fct0_group[] =3D {
> -	"gpio0",  "gpio1",  "gpio2",  "gpio3",
> -	"gpio4",  "gpio5",  "gpio6",  "gpio7",
> -	"gpio8",  "gpio9",  "gpio10", "gpio11",
> -	"gpio12", "gpio13", "gpio14", "gpio15",
> -	"gpio16", "gpio17", "gpio18", "gpio19",
> -	"gpio20", "gpio21", "gpio22", "gpio23",
> -	"gpio24", "gpio25", "gpio26", "gpio27",
> -	"gpio28", "gpio29", "gpio30", "gpio31",
> -	"gpio32", "gpio33", "gpio34", "gpio35",
> -	"gpio36", "gpio37", "gpio38", "gpio39",
> -	"gpio40", "gpio41", "gpio42", "gpio43",
> -	"gpio44", "gpio45", "gpio46", "gpio47",
> -	"gpio48", "gpio49"
> -};
> -
> -static const char * const oxnas_ox820_fct1_group[] =3D {
> -	"gpio3", "gpio4",
> -	"gpio12", "gpio13", "gpio14", "gpio15",
> -	"gpio16", "gpio17", "gpio18", "gpio19",
> -	"gpio20", "gpio21", "gpio22", "gpio23",
> -	"gpio24"
> -};
> -
> -static const char * const oxnas_ox820_fct4_group[] =3D {
> -	"gpio5", "gpio6", "gpio7", "gpio8",
> -	"gpio24", "gpio25", "gpio26", "gpio27",
> -	"gpio40", "gpio41", "gpio42", "gpio43"
> -};
> -
> -static const char * const oxnas_ox820_fct5_group[] =3D {
> -	"gpio28", "gpio29", "gpio30", "gpio31"
> -};
> -
> -#define FUNCTION(_name, _gr)					\
> -	{							\
> -		.name =3D #_name,					\
> -		.groups =3D oxnas_##_gr##_group,			\
> -		.ngroups =3D ARRAY_SIZE(oxnas_##_gr##_group),	\
> -	}
> -
> -static const struct oxnas_function oxnas_ox810se_functions[] =3D {
> -	FUNCTION(gpio, ox810se_fct0),
> -	FUNCTION(fct3, ox810se_fct3),
> -};
> -
> -static const struct oxnas_function oxnas_ox820_functions[] =3D {
> -	FUNCTION(gpio, ox820_fct0),
> -	FUNCTION(fct1, ox820_fct1),
> -	FUNCTION(fct4, ox820_fct4),
> -	FUNCTION(fct5, ox820_fct5),
> -};
> -
> -#define OXNAS_PINCTRL_GROUP(_pin, _name, ...)				\
> -	{								\
> -		.name =3D #_name,						\
> -		.pin =3D _pin,						\
> -		.bank =3D _pin / PINS_PER_BANK,				\
> -		.functions =3D (struct oxnas_desc_function[]){		\
> -			__VA_ARGS__, { } },				\
> -	}
> -
> -#define OXNAS_PINCTRL_FUNCTION(_name, _fct)		\
> -	{						\
> -		.name =3D #_name,				\
> -		.fct =3D _fct,				\
> -	}
> -
> -static const struct oxnas_pin_group oxnas_ox810se_groups[] =3D {
> -	OXNAS_PINCTRL_GROUP(0, gpio0,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(1, gpio1,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(2, gpio2,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(3, gpio3,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(4, gpio4,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(5, gpio5,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(6, gpio6,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(7, gpio7,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(8, gpio8,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(9, gpio9,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(10, gpio10,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(11, gpio11,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(12, gpio12,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(13, gpio13,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(14, gpio14,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(15, gpio15,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(16, gpio16,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(17, gpio17,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(18, gpio18,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(19, gpio19,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(20, gpio20,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(21, gpio21,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(22, gpio22,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(23, gpio23,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(24, gpio24,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(25, gpio25,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(26, gpio26,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(27, gpio27,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(28, gpio28,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(29, gpio29,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(30, gpio30,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(31, gpio31,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(32, gpio32,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(33, gpio33,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -	OXNAS_PINCTRL_GROUP(34, gpio34,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct3, 3)),
> -};
> -
> -static const struct oxnas_pin_group oxnas_ox820_groups[] =3D {
> -	OXNAS_PINCTRL_GROUP(0, gpio0,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(1, gpio1,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(2, gpio2,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(3, gpio3,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(4, gpio4,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(5, gpio5,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(6, gpio6,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(7, gpio7,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(8, gpio8,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(9, gpio9,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(10, gpio10,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(11, gpio11,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(12, gpio12,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(13, gpio13,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(14, gpio14,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(15, gpio15,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(16, gpio16,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(17, gpio17,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(18, gpio18,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(19, gpio19,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(20, gpio20,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(21, gpio21,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(22, gpio22,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(23, gpio23,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1)),
> -	OXNAS_PINCTRL_GROUP(24, gpio24,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct1, 1),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 5)),
> -	OXNAS_PINCTRL_GROUP(25, gpio25,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(26, gpio26,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(27, gpio27,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(28, gpio28,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
> -	OXNAS_PINCTRL_GROUP(29, gpio29,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
> -	OXNAS_PINCTRL_GROUP(30, gpio30,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
> -	OXNAS_PINCTRL_GROUP(31, gpio31,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct5, 5)),
> -	OXNAS_PINCTRL_GROUP(32, gpio32,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(33, gpio33,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(34, gpio34,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(35, gpio35,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(36, gpio36,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(37, gpio37,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(38, gpio38,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(39, gpio39,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(40, gpio40,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(41, gpio41,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(42, gpio42,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(43, gpio43,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0),
> -			OXNAS_PINCTRL_FUNCTION(fct4, 4)),
> -	OXNAS_PINCTRL_GROUP(44, gpio44,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(45, gpio45,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(46, gpio46,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(47, gpio47,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(48, gpio48,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -	OXNAS_PINCTRL_GROUP(49, gpio49,
> -			OXNAS_PINCTRL_FUNCTION(gpio, 0)),
> -};
> -
> -static inline struct oxnas_gpio_bank *pctl_to_bank(struct oxnas_pinctrl =
*pctl,
> -						   unsigned int pin)
> -{
> -	return &pctl->gpio_banks[pin / PINS_PER_BANK];
> -}
> -
> -static int oxnas_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pctl->ngroups;
> -}
> -
> -static const char *oxnas_pinctrl_get_group_name(struct pinctrl_dev *pctl=
dev,
> -						unsigned int group)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pctl->groups[group].name;
> -}
> -
> -static int oxnas_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> -					unsigned int group,
> -					const unsigned int **pins,
> -					unsigned int *num_pins)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -
> -	*pins =3D &pctl->groups[group].pin;
> -	*num_pins =3D 1;
> -
> -	return 0;
> -}
> -
> -static const struct pinctrl_ops oxnas_pinctrl_ops =3D {
> -	.get_groups_count =3D oxnas_pinctrl_get_groups_count,
> -	.get_group_name =3D oxnas_pinctrl_get_group_name,
> -	.get_group_pins =3D oxnas_pinctrl_get_group_pins,
> -	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_pin,
> -	.dt_free_map =3D pinctrl_utils_free_map,
> -};
> -
> -static int oxnas_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pctl->nfunctions;
> -}
> -
> -static const char *
> -oxnas_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned int=
 func)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pctl->functions[func].name;
> -}
> -
> -static int oxnas_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
> -					    unsigned int func,
> -					    const char * const **groups,
> -					    unsigned int * const num_groups)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -
> -	*groups =3D pctl->functions[func].groups;
> -	*num_groups =3D pctl->functions[func].ngroups;
> -
> -	return 0;
> -}
> -
> -static int oxnas_ox810se_pinmux_enable(struct pinctrl_dev *pctldev,
> -				       unsigned int func, unsigned int group)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	const struct oxnas_pin_group *pg =3D &pctl->groups[group];
> -	const struct oxnas_function *pf =3D &pctl->functions[func];
> -	const char *fname =3D pf->name;
> -	struct oxnas_desc_function *functions =3D pg->functions;
> -	u32 mask =3D BIT(pg->pin);
> -
> -	while (functions->name) {
> -		if (!strcmp(functions->name, fname)) {
> -			dev_dbg(pctl->dev,
> -				"setting function %s bank %d pin %d fct %d mask %x\n",
> -				fname, pg->bank, pg->pin,
> -				functions->fct, mask);
> -
> -			regmap_write_bits(pctl->regmap,
> -					  (pg->bank ?
> -						PINMUX_810_PRIMARY_SEL1 :
> -						PINMUX_810_PRIMARY_SEL0),
> -					  mask,
> -					  (functions->fct =3D=3D 1 ?
> -						mask : 0));
> -			regmap_write_bits(pctl->regmap,
> -					  (pg->bank ?
> -						PINMUX_810_SECONDARY_SEL1 :
> -						PINMUX_810_SECONDARY_SEL0),
> -					  mask,
> -					  (functions->fct =3D=3D 2 ?
> -						mask : 0));
> -			regmap_write_bits(pctl->regmap,
> -					  (pg->bank ?
> -						PINMUX_810_TERTIARY_SEL1 :
> -						PINMUX_810_TERTIARY_SEL0),
> -					  mask,
> -					  (functions->fct =3D=3D 3 ?
> -						mask : 0));
> -
> -			return 0;
> -		}
> -
> -		functions++;
> -	}
> -
> -	dev_err(pctl->dev, "cannot mux pin %u to function %u\n", group, func);
> -
> -	return -EINVAL;
> -}
> -
> -static int oxnas_ox820_pinmux_enable(struct pinctrl_dev *pctldev,
> -				     unsigned int func, unsigned int group)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	const struct oxnas_pin_group *pg =3D &pctl->groups[group];
> -	const struct oxnas_function *pf =3D &pctl->functions[func];
> -	const char *fname =3D pf->name;
> -	struct oxnas_desc_function *functions =3D pg->functions;
> -	unsigned int offset =3D (pg->bank ? PINMUX_820_BANK_OFFSET : 0);
> -	u32 mask =3D BIT(pg->pin);
> -
> -	while (functions->name) {
> -		if (!strcmp(functions->name, fname)) {
> -			dev_dbg(pctl->dev,
> -				"setting function %s bank %d pin %d fct %d mask %x\n",
> -				fname, pg->bank, pg->pin,
> -				functions->fct, mask);
> -
> -			regmap_write_bits(pctl->regmap,
> -					  offset + PINMUX_820_SECONDARY_SEL,
> -					  mask,
> -					  (functions->fct =3D=3D 1 ?
> -						mask : 0));
> -			regmap_write_bits(pctl->regmap,
> -					  offset + PINMUX_820_TERTIARY_SEL,
> -					  mask,
> -					  (functions->fct =3D=3D 2 ?
> -						mask : 0));
> -			regmap_write_bits(pctl->regmap,
> -					  offset + PINMUX_820_QUATERNARY_SEL,
> -					  mask,
> -					  (functions->fct =3D=3D 3 ?
> -						mask : 0));
> -			regmap_write_bits(pctl->regmap,
> -					  offset + PINMUX_820_DEBUG_SEL,
> -					  mask,
> -					  (functions->fct =3D=3D 4 ?
> -						mask : 0));
> -			regmap_write_bits(pctl->regmap,
> -					  offset + PINMUX_820_ALTERNATIVE_SEL,
> -					  mask,
> -					  (functions->fct =3D=3D 5 ?
> -						mask : 0));
> -
> -			return 0;
> -		}
> -
> -		functions++;
> -	}
> -
> -	dev_err(pctl->dev, "cannot mux pin %u to function %u\n", group, func);
> -
> -	return -EINVAL;
> -}
> -
> -static int oxnas_ox810se_gpio_request_enable(struct pinctrl_dev *pctldev=
,
> -					     struct pinctrl_gpio_range *range,
> -					     unsigned int offset)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(range->gc);
> -	u32 mask =3D BIT(offset - bank->gpio_chip.base);
> -
> -	dev_dbg(pctl->dev, "requesting gpio %d in bank %d (id %d) with mask 0x%=
x\n",
> -		offset, bank->gpio_chip.base, bank->id, mask);
> -
> -	regmap_write_bits(pctl->regmap,
> -			  (bank->id ?
> -				PINMUX_810_PRIMARY_SEL1 :
> -				PINMUX_810_PRIMARY_SEL0),
> -			  mask, 0);
> -	regmap_write_bits(pctl->regmap,
> -			  (bank->id ?
> -				PINMUX_810_SECONDARY_SEL1 :
> -				PINMUX_810_SECONDARY_SEL0),
> -			  mask, 0);
> -	regmap_write_bits(pctl->regmap,
> -			  (bank->id ?
> -				PINMUX_810_TERTIARY_SEL1 :
> -				PINMUX_810_TERTIARY_SEL0),
> -			  mask, 0);
> -
> -	return 0;
> -}
> -
> -static int oxnas_ox820_gpio_request_enable(struct pinctrl_dev *pctldev,
> -					   struct pinctrl_gpio_range *range,
> -					   unsigned int offset)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(range->gc);
> -	unsigned int bank_offset =3D (bank->id ? PINMUX_820_BANK_OFFSET : 0);
> -	u32 mask =3D BIT(offset - bank->gpio_chip.base);
> -
> -	dev_dbg(pctl->dev, "requesting gpio %d in bank %d (id %d) with mask 0x%=
x\n",
> -		offset, bank->gpio_chip.base, bank->id, mask);
> -
> -	regmap_write_bits(pctl->regmap,
> -			  bank_offset + PINMUX_820_SECONDARY_SEL,
> -			  mask, 0);
> -	regmap_write_bits(pctl->regmap,
> -			  bank_offset + PINMUX_820_TERTIARY_SEL,
> -			  mask, 0);
> -	regmap_write_bits(pctl->regmap,
> -			  bank_offset + PINMUX_820_QUATERNARY_SEL,
> -			  mask, 0);
> -	regmap_write_bits(pctl->regmap,
> -			  bank_offset + PINMUX_820_DEBUG_SEL,
> -			  mask, 0);
> -	regmap_write_bits(pctl->regmap,
> -			  bank_offset + PINMUX_820_ALTERNATIVE_SEL,
> -			  mask, 0);
> -
> -	return 0;
> -}
> -
> -static int oxnas_gpio_get_direction(struct gpio_chip *chip,
> -				      unsigned int offset)
> -{
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	u32 mask =3D BIT(offset);
> -
> -	if (readl_relaxed(bank->reg_base + OUTPUT_EN) & mask)
> -		return GPIO_LINE_DIRECTION_OUT;
> -
> -	return GPIO_LINE_DIRECTION_IN;
> -}
> -
> -static int oxnas_gpio_direction_input(struct gpio_chip *chip,
> -				      unsigned int offset)
> -{
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	u32 mask =3D BIT(offset);
> -
> -	writel_relaxed(mask, bank->reg_base + OUTPUT_EN_CLEAR);
> -
> -	return 0;
> -}
> -
> -static int oxnas_gpio_get(struct gpio_chip *chip, unsigned int offset)
> -{
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	u32 mask =3D BIT(offset);
> -
> -	return (readl_relaxed(bank->reg_base + INPUT_VALUE) & mask) !=3D 0;
> -}
> -
> -static void oxnas_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			       int value)
> -{
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	u32 mask =3D BIT(offset);
> -
> -	if (value)
> -		writel_relaxed(mask, bank->reg_base + OUTPUT_SET);
> -	else
> -		writel_relaxed(mask, bank->reg_base + OUTPUT_CLEAR);
> -}
> -
> -static int oxnas_gpio_direction_output(struct gpio_chip *chip,
> -				       unsigned int offset, int value)
> -{
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	u32 mask =3D BIT(offset);
> -
> -	oxnas_gpio_set(chip, offset, value);
> -	writel_relaxed(mask, bank->reg_base + OUTPUT_EN_SET);
> -
> -	return 0;
> -}
> -
> -static int oxnas_gpio_set_direction(struct pinctrl_dev *pctldev,
> -				    struct pinctrl_gpio_range *range,
> -				    unsigned int offset, bool input)
> -{
> -	struct gpio_chip *chip =3D range->gc;
> -
> -	if (input)
> -		oxnas_gpio_direction_input(chip, offset);
> -	else
> -		oxnas_gpio_direction_output(chip, offset, 0);
> -
> -	return 0;
> -}
> -
> -static const struct pinmux_ops oxnas_ox810se_pinmux_ops =3D {
> -	.get_functions_count =3D oxnas_pinmux_get_functions_count,
> -	.get_function_name =3D oxnas_pinmux_get_function_name,
> -	.get_function_groups =3D oxnas_pinmux_get_function_groups,
> -	.set_mux =3D oxnas_ox810se_pinmux_enable,
> -	.gpio_request_enable =3D oxnas_ox810se_gpio_request_enable,
> -	.gpio_set_direction =3D oxnas_gpio_set_direction,
> -};
> -
> -static const struct pinmux_ops oxnas_ox820_pinmux_ops =3D {
> -	.get_functions_count =3D oxnas_pinmux_get_functions_count,
> -	.get_function_name =3D oxnas_pinmux_get_function_name,
> -	.get_function_groups =3D oxnas_pinmux_get_function_groups,
> -	.set_mux =3D oxnas_ox820_pinmux_enable,
> -	.gpio_request_enable =3D oxnas_ox820_gpio_request_enable,
> -	.gpio_set_direction =3D oxnas_gpio_set_direction,
> -};
> -
> -static int oxnas_ox810se_pinconf_get(struct pinctrl_dev *pctldev,
> -				     unsigned int pin, unsigned long *config)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct oxnas_gpio_bank *bank =3D pctl_to_bank(pctl, pin);
> -	unsigned int param =3D pinconf_to_config_param(*config);
> -	u32 mask =3D BIT(pin - bank->gpio_chip.base);
> -	int ret;
> -	u32 arg;
> -
> -	switch (param) {
> -	case PIN_CONFIG_BIAS_PULL_UP:
> -		ret =3D regmap_read(pctl->regmap,
> -				  (bank->id ?
> -					PINMUX_810_PULLUP_CTRL1 :
> -					PINMUX_810_PULLUP_CTRL0),
> -				  &arg);
> -		if (ret)
> -			return ret;
> -
> -		arg =3D !!(arg & mask);
> -		break;
> -	default:
> -		return -ENOTSUPP;
> -	}
> -
> -	*config =3D pinconf_to_config_packed(param, arg);
> -
> -	return 0;
> -}
> -
> -static int oxnas_ox820_pinconf_get(struct pinctrl_dev *pctldev,
> -				   unsigned int pin, unsigned long *config)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct oxnas_gpio_bank *bank =3D pctl_to_bank(pctl, pin);
> -	unsigned int param =3D pinconf_to_config_param(*config);
> -	unsigned int bank_offset =3D (bank->id ? PINMUX_820_BANK_OFFSET : 0);
> -	u32 mask =3D BIT(pin - bank->gpio_chip.base);
> -	int ret;
> -	u32 arg;
> -
> -	switch (param) {
> -	case PIN_CONFIG_BIAS_PULL_UP:
> -		ret =3D regmap_read(pctl->regmap,
> -				  bank_offset + PINMUX_820_PULLUP_CTRL,
> -				  &arg);
> -		if (ret)
> -			return ret;
> -
> -		arg =3D !!(arg & mask);
> -		break;
> -	default:
> -		return -ENOTSUPP;
> -	}
> -
> -	*config =3D pinconf_to_config_packed(param, arg);
> -
> -	return 0;
> -}
> -
> -static int oxnas_ox810se_pinconf_set(struct pinctrl_dev *pctldev,
> -				     unsigned int pin, unsigned long *configs,
> -				     unsigned int num_configs)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct oxnas_gpio_bank *bank =3D pctl_to_bank(pctl, pin);
> -	unsigned int param;
> -	unsigned int i;
> -	u32 offset =3D pin - bank->gpio_chip.base;
> -	u32 mask =3D BIT(offset);
> -
> -	dev_dbg(pctl->dev, "setting pin %d bank %d mask 0x%x\n",
> -		pin, bank->gpio_chip.base, mask);
> -
> -	for (i =3D 0; i < num_configs; i++) {
> -		param =3D pinconf_to_config_param(configs[i]);
> -
> -		switch (param) {
> -		case PIN_CONFIG_BIAS_PULL_UP:
> -			dev_dbg(pctl->dev, "   pullup\n");
> -			regmap_write_bits(pctl->regmap,
> -					  (bank->id ?
> -						PINMUX_810_PULLUP_CTRL1 :
> -						PINMUX_810_PULLUP_CTRL0),
> -					  mask, mask);
> -			break;
> -		default:
> -			dev_err(pctl->dev, "Property %u not supported\n",
> -				param);
> -			return -ENOTSUPP;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int oxnas_ox820_pinconf_set(struct pinctrl_dev *pctldev,
> -				   unsigned int pin, unsigned long *configs,
> -				   unsigned int num_configs)
> -{
> -	struct oxnas_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct oxnas_gpio_bank *bank =3D pctl_to_bank(pctl, pin);
> -	unsigned int bank_offset =3D (bank->id ? PINMUX_820_BANK_OFFSET : 0);
> -	unsigned int param;
> -	unsigned int i;
> -	u32 offset =3D pin - bank->gpio_chip.base;
> -	u32 mask =3D BIT(offset);
> -
> -	dev_dbg(pctl->dev, "setting pin %d bank %d mask 0x%x\n",
> -		pin, bank->gpio_chip.base, mask);
> -
> -	for (i =3D 0; i < num_configs; i++) {
> -		param =3D pinconf_to_config_param(configs[i]);
> -
> -		switch (param) {
> -		case PIN_CONFIG_BIAS_PULL_UP:
> -			dev_dbg(pctl->dev, "   pullup\n");
> -			regmap_write_bits(pctl->regmap,
> -					  bank_offset + PINMUX_820_PULLUP_CTRL,
> -					  mask, mask);
> -			break;
> -		default:
> -			dev_err(pctl->dev, "Property %u not supported\n",
> -				param);
> -			return -ENOTSUPP;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct pinconf_ops oxnas_ox810se_pinconf_ops =3D {
> -	.pin_config_get =3D oxnas_ox810se_pinconf_get,
> -	.pin_config_set =3D oxnas_ox810se_pinconf_set,
> -	.is_generic =3D true,
> -};
> -
> -static const struct pinconf_ops oxnas_ox820_pinconf_ops =3D {
> -	.pin_config_get =3D oxnas_ox820_pinconf_get,
> -	.pin_config_set =3D oxnas_ox820_pinconf_set,
> -	.is_generic =3D true,
> -};
> -
> -static void oxnas_gpio_irq_ack(struct irq_data *data)
> -{
> -	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	u32 mask =3D BIT(data->hwirq);
> -
> -	writel(mask, bank->reg_base + IRQ_PENDING);
> -}
> -
> -static void oxnas_gpio_irq_mask(struct irq_data *data)
> -{
> -	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	unsigned int type =3D irqd_get_trigger_type(data);
> -	u32 mask =3D BIT(data->hwirq);
> -
> -	if (type & IRQ_TYPE_EDGE_RISING)
> -		writel(readl(bank->reg_base + RE_IRQ_ENABLE) & ~mask,
> -		       bank->reg_base + RE_IRQ_ENABLE);
> -
> -	if (type & IRQ_TYPE_EDGE_FALLING)
> -		writel(readl(bank->reg_base + FE_IRQ_ENABLE) & ~mask,
> -		       bank->reg_base + FE_IRQ_ENABLE);
> -}
> -
> -static void oxnas_gpio_irq_unmask(struct irq_data *data)
> -{
> -	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(chip);
> -	unsigned int type =3D irqd_get_trigger_type(data);
> -	u32 mask =3D BIT(data->hwirq);
> -
> -	if (type & IRQ_TYPE_EDGE_RISING)
> -		writel(readl(bank->reg_base + RE_IRQ_ENABLE) | mask,
> -		       bank->reg_base + RE_IRQ_ENABLE);
> -
> -	if (type & IRQ_TYPE_EDGE_FALLING)
> -		writel(readl(bank->reg_base + FE_IRQ_ENABLE) | mask,
> -		       bank->reg_base + FE_IRQ_ENABLE);
> -}
> -
> -static unsigned int oxnas_gpio_irq_startup(struct irq_data *data)
> -{
> -	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> -
> -	oxnas_gpio_direction_input(chip, data->hwirq);
> -	oxnas_gpio_irq_unmask(data);
> -
> -	return 0;
> -}
> -
> -static int oxnas_gpio_irq_set_type(struct irq_data *data, unsigned int t=
ype)
> -{
> -	if ((type & (IRQ_TYPE_EDGE_RISING|IRQ_TYPE_EDGE_FALLING)) =3D=3D 0)
> -		return -EINVAL;
> -
> -	irq_set_handler_locked(data, handle_edge_irq);
> -
> -	return 0;
> -}
> -
> -static void oxnas_gpio_irq_handler(struct irq_desc *desc)
> -{
> -	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
> -	struct oxnas_gpio_bank *bank =3D gpiochip_get_data(gc);
> -	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> -	unsigned long stat;
> -	unsigned int pin;
> -
> -	chained_irq_enter(chip, desc);
> -
> -	stat =3D readl(bank->reg_base + IRQ_PENDING);
> -
> -	for_each_set_bit(pin, &stat, BITS_PER_LONG)
> -		generic_handle_domain_irq(gc->irq.domain, pin);
> -
> -	chained_irq_exit(chip, desc);
> -}
> -
> -#define GPIO_BANK(_bank)						\
> -	{								\
> -		.gpio_chip =3D {						\
> -			.label =3D "GPIO" #_bank,				\
> -			.request =3D gpiochip_generic_request,		\
> -			.free =3D gpiochip_generic_free,			\
> -			.get_direction =3D oxnas_gpio_get_direction,	\
> -			.direction_input =3D oxnas_gpio_direction_input,	\
> -			.direction_output =3D oxnas_gpio_direction_output, \
> -			.get =3D oxnas_gpio_get,				\
> -			.set =3D oxnas_gpio_set,				\
> -			.ngpio =3D PINS_PER_BANK,				\
> -			.base =3D GPIO_BANK_START(_bank),			\
> -			.owner =3D THIS_MODULE,				\
> -			.can_sleep =3D 0,					\
> -		},							\
> -		.irq_chip =3D {						\
> -			.name =3D "GPIO" #_bank,				\
> -			.irq_startup =3D oxnas_gpio_irq_startup,	\
> -			.irq_ack =3D oxnas_gpio_irq_ack,		\
> -			.irq_mask =3D oxnas_gpio_irq_mask,		\
> -			.irq_unmask =3D oxnas_gpio_irq_unmask,		\
> -			.irq_set_type =3D oxnas_gpio_irq_set_type,	\
> -		},							\
> -	}
> -
> -static struct oxnas_gpio_bank oxnas_gpio_banks[] =3D {
> -	GPIO_BANK(0),
> -	GPIO_BANK(1),
> -};
> -
> -static struct oxnas_pinctrl ox810se_pinctrl =3D {
> -	.functions =3D oxnas_ox810se_functions,
> -	.nfunctions =3D ARRAY_SIZE(oxnas_ox810se_functions),
> -	.groups =3D oxnas_ox810se_groups,
> -	.ngroups =3D ARRAY_SIZE(oxnas_ox810se_groups),
> -	.gpio_banks =3D oxnas_gpio_banks,
> -	.nbanks =3D ARRAY_SIZE(oxnas_gpio_banks),
> -};
> -
> -static struct pinctrl_desc oxnas_ox810se_pinctrl_desc =3D {
> -	.name =3D "oxnas-pinctrl",
> -	.pins =3D oxnas_ox810se_pins,
> -	.npins =3D ARRAY_SIZE(oxnas_ox810se_pins),
> -	.pctlops =3D &oxnas_pinctrl_ops,
> -	.pmxops =3D &oxnas_ox810se_pinmux_ops,
> -	.confops =3D &oxnas_ox810se_pinconf_ops,
> -	.owner =3D THIS_MODULE,
> -};
> -
> -static struct oxnas_pinctrl ox820_pinctrl =3D {
> -	.functions =3D oxnas_ox820_functions,
> -	.nfunctions =3D ARRAY_SIZE(oxnas_ox820_functions),
> -	.groups =3D oxnas_ox820_groups,
> -	.ngroups =3D ARRAY_SIZE(oxnas_ox820_groups),
> -	.gpio_banks =3D oxnas_gpio_banks,
> -	.nbanks =3D ARRAY_SIZE(oxnas_gpio_banks),
> -};
> -
> -static struct pinctrl_desc oxnas_ox820_pinctrl_desc =3D {
> -	.name =3D "oxnas-pinctrl",
> -	.pins =3D oxnas_ox820_pins,
> -	.npins =3D ARRAY_SIZE(oxnas_ox820_pins),
> -	.pctlops =3D &oxnas_pinctrl_ops,
> -	.pmxops =3D &oxnas_ox820_pinmux_ops,
> -	.confops =3D &oxnas_ox820_pinconf_ops,
> -	.owner =3D THIS_MODULE,
> -};
> -
> -static struct oxnas_pinctrl_data oxnas_ox810se_pinctrl_data =3D {
> -	.desc =3D &oxnas_ox810se_pinctrl_desc,
> -	.pctl =3D &ox810se_pinctrl,
> -};
> -
> -static struct oxnas_pinctrl_data oxnas_ox820_pinctrl_data =3D {
> -	.desc =3D &oxnas_ox820_pinctrl_desc,
> -	.pctl =3D &ox820_pinctrl,
> -};
> -
> -static const struct of_device_id oxnas_pinctrl_of_match[] =3D {
> -	{ .compatible =3D "oxsemi,ox810se-pinctrl",
> -	  .data =3D &oxnas_ox810se_pinctrl_data
> -	},
> -	{ .compatible =3D "oxsemi,ox820-pinctrl",
> -	  .data =3D &oxnas_ox820_pinctrl_data,
> -	},
> -	{ },
> -};
> -
> -static int oxnas_pinctrl_probe(struct platform_device *pdev)
> -{
> -	const struct of_device_id *id;
> -	const struct oxnas_pinctrl_data *data;
> -	struct oxnas_pinctrl *pctl;
> -
> -	id =3D of_match_node(oxnas_pinctrl_of_match, pdev->dev.of_node);
> -	if (!id)
> -		return -ENODEV;
> -
> -	data =3D id->data;
> -	if (!data || !data->pctl || !data->desc)
> -		return -EINVAL;
> -
> -	pctl =3D devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> -	if (!pctl)
> -		return -ENOMEM;
> -	pctl->dev =3D &pdev->dev;
> -	dev_set_drvdata(&pdev->dev, pctl);
> -
> -	pctl->regmap =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> -						       "oxsemi,sys-ctrl");
> -	if (IS_ERR(pctl->regmap)) {
> -		dev_err(&pdev->dev, "failed to get sys ctrl regmap\n");
> -		return -ENODEV;
> -	}
> -
> -	pctl->functions =3D data->pctl->functions;
> -	pctl->nfunctions =3D data->pctl->nfunctions;
> -	pctl->groups =3D data->pctl->groups;
> -	pctl->ngroups =3D data->pctl->ngroups;
> -	pctl->gpio_banks =3D data->pctl->gpio_banks;
> -	pctl->nbanks =3D data->pctl->nbanks;
> -
> -	pctl->pctldev =3D pinctrl_register(data->desc, &pdev->dev, pctl);
> -	if (IS_ERR(pctl->pctldev)) {
> -		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
> -		return PTR_ERR(pctl->pctldev);
> -	}
> -
> -	return 0;
> -}
> -
> -static int oxnas_gpio_probe(struct platform_device *pdev)
> -{
> -	struct device_node *np =3D pdev->dev.of_node;
> -	struct of_phandle_args pinspec;
> -	struct oxnas_gpio_bank *bank;
> -	unsigned int id, ngpios;
> -	int irq, ret;
> -	struct gpio_irq_chip *girq;
> -
> -	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges",
> -					     3, 0, &pinspec)) {
> -		dev_err(&pdev->dev, "gpio-ranges property not found\n");
> -		return -EINVAL;
> -	}
> -
> -	id =3D pinspec.args[1] / PINS_PER_BANK;
> -	ngpios =3D pinspec.args[2];
> -
> -	if (id >=3D ARRAY_SIZE(oxnas_gpio_banks)) {
> -		dev_err(&pdev->dev, "invalid gpio-ranges base arg\n");
> -		return -EINVAL;
> -	}
> -
> -	if (ngpios > PINS_PER_BANK) {
> -		dev_err(&pdev->dev, "invalid gpio-ranges count arg\n");
> -		return -EINVAL;
> -	}
> -
> -	bank =3D &oxnas_gpio_banks[id];
> -
> -	bank->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(bank->reg_base))
> -		return PTR_ERR(bank->reg_base);
> -
> -	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	bank->id =3D id;
> -	bank->gpio_chip.parent =3D &pdev->dev;
> -	bank->gpio_chip.ngpio =3D ngpios;
> -	girq =3D &bank->gpio_chip.irq;
> -	girq->chip =3D &bank->irq_chip;
> -	girq->parent_handler =3D oxnas_gpio_irq_handler;
> -	girq->num_parents =3D 1;
> -	girq->parents =3D devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
> -				     GFP_KERNEL);
> -	if (!girq->parents)
> -		return -ENOMEM;
> -	girq->parents[0] =3D irq;
> -	girq->default_type =3D IRQ_TYPE_NONE;
> -	girq->handler =3D handle_level_irq;
> -
> -	ret =3D gpiochip_add_data(&bank->gpio_chip, bank);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to add GPIO chip %u: %d\n",
> -			id, ret);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static struct platform_driver oxnas_pinctrl_driver =3D {
> -	.driver =3D {
> -		.name =3D "oxnas-pinctrl",
> -		.of_match_table =3D oxnas_pinctrl_of_match,
> -		.suppress_bind_attrs =3D true,
> -	},
> -	.probe =3D oxnas_pinctrl_probe,
> -};
> -
> -static const struct of_device_id oxnas_gpio_of_match[] =3D {
> -	{ .compatible =3D "oxsemi,ox810se-gpio", },
> -	{ .compatible =3D "oxsemi,ox820-gpio", },
> -	{ },
> -};
> -
> -static struct platform_driver oxnas_gpio_driver =3D {
> -	.driver =3D {
> -		.name =3D "oxnas-gpio",
> -		.of_match_table =3D oxnas_gpio_of_match,
> -		.suppress_bind_attrs =3D true,
> -	},
> -	.probe =3D oxnas_gpio_probe,
> -};
> -
> -static int __init oxnas_gpio_register(void)
> -{
> -	return platform_driver_register(&oxnas_gpio_driver);
> -}
> -arch_initcall(oxnas_gpio_register);
> -
> -static int __init oxnas_pinctrl_register(void)
> -{
> -	return platform_driver_register(&oxnas_pinctrl_driver);
> -}
> -arch_initcall(oxnas_pinctrl_register);
>=20



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#314): https://groups.io/g/linux-oxnas/message/314
Mute This Topic: https://groups.io/mt/99877138/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


