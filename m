Return-Path: <bounce+16102+230+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D23B6D3E34
	for <lists+linux-oxnas@lfdr.de>; Mon,  3 Apr 2023 09:42:29 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id UMKpYY1809624xgXxOAHynGf; Mon, 03 Apr 2023 00:42:28 -0700
X-Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.64447.1680507746708927048
 for <linux-oxnas@groups.io>;
 Mon, 03 Apr 2023 00:42:27 -0700
X-Received: by mail-wr1-f47.google.com with SMTP id t4so23026761wra.7
        for <linux-oxnas@groups.io>; Mon, 03 Apr 2023 00:42:26 -0700 (PDT)
X-Gm-Message-State: s8bNZAPMQUSoYlgvRGczslWrx1808289AA=
X-Google-Smtp-Source: AKy350asEbGzesMfKkqVtRfdX08ALHtN7EQ+XfMJAtdnHQxDKXa07X0OUp7+w4Pm2aTAP9+e/K6dyA==
X-Received: by 2002:a5d:4603:0:b0:2d1:7ade:ab1 with SMTP id t3-20020a5d4603000000b002d17ade0ab1mr24784237wrq.10.1680507745186;
        Mon, 03 Apr 2023 00:42:25 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002e62384d17dsm8180482wrr.21.2023.04.03.00.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:42:24 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Mon, 03 Apr 2023 09:42:19 +0200
Subject: [linux-oxnas] [PATCH RFC v2 2/4] ARM: oxnas: remove OXNAS support
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v2-2-e51078376f08@linaro.org>
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
 q=dns/txt; s=20140610; t=1680507748;
 bh=6iYXsjpn9nWqbBSbCsJ7JMr2KzT54nVSepXD8MsRIoQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=YzBSOGSlir7HOEHVG2G2IMbajkZNNWFuKycmefVQrB1w3LCXHOfi8oPJmBU78FwOm9F
 ZRyBCTEGz9BlhtLw+6r0RN8ChmWjHNrrs/oQxxB6FwllN31iqfYfad+hDKtrpA11B7KDg
 C3osq7KR/LBCGHdZAIA1rIq8yrS+ELLA2p8=

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 ARM support.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/Kconfig              |  2 -
 arch/arm/Makefile             |  1 -
 arch/arm/mach-oxnas/Kconfig   | 38 -----------------
 arch/arm/mach-oxnas/Makefile  |  2 -
 arch/arm/mach-oxnas/headsmp.S | 23 -----------
 arch/arm/mach-oxnas/platsmp.c | 96 ---------------------------------------=
----
 6 files changed, 162 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e24a9820e12f..017329401b3d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -497,8 +497,6 @@ source "arch/arm/mach-omap2/Kconfig"
=20
 source "arch/arm/mach-orion5x/Kconfig"
=20
-source "arch/arm/mach-oxnas/Kconfig"
-
 source "arch/arm/mach-pxa/Kconfig"
=20
 source "arch/arm/mach-qcom/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 485a439e22ca..547e5856eaa0 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -203,7 +203,6 @@ machine-$(CONFIG_ARCH_MSTARV7)		+=3D mstar
 machine-$(CONFIG_ARCH_NOMADIK)		+=3D nomadik
 machine-$(CONFIG_ARCH_NPCM)		+=3D npcm
 machine-$(CONFIG_ARCH_NSPIRE)		+=3D nspire
-machine-$(CONFIG_ARCH_OXNAS)		+=3D oxnas
 machine-$(CONFIG_ARCH_OMAP1)		+=3D omap1
 machine-$(CONFIG_ARCH_OMAP2PLUS)	+=3D omap2
 machine-$(CONFIG_ARCH_ORION5X)		+=3D orion5x
diff --git a/arch/arm/mach-oxnas/Kconfig b/arch/arm/mach-oxnas/Kconfig
deleted file mode 100644
index a9ded7079268..000000000000
--- a/arch/arm/mach-oxnas/Kconfig
+++ /dev/null
@@ -1,38 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-menuconfig ARCH_OXNAS
-	bool "Oxford Semiconductor OXNAS Family SoCs"
-	depends on (ARCH_MULTI_V5 && CPU_LITTLE_ENDIAN) || ARCH_MULTI_V6
-	select ARCH_HAS_RESET_CONTROLLER
-	select COMMON_CLK_OXNAS
-	select GPIOLIB
-	select MFD_SYSCON
-	select OXNAS_RPS_TIMER
-	select PINCTRL_OXNAS
-	select RESET_CONTROLLER
-	select RESET_OXNAS
-	select VERSATILE_FPGA_IRQ
-	select PINCTRL
-	help
-	  Support for OxNas SoC family developed by Oxford Semiconductor.
-
-if ARCH_OXNAS
-
-config MACH_OX810SE
-	bool "Support OX810SE Based Products"
-	depends on ARCH_MULTI_V5
-	select CPU_ARM926T
-	help
-	  Include Support for the Oxford Semiconductor OX810SE SoC Based Products=
.
-
-config MACH_OX820
-	bool "Support OX820 Based Products"
-	depends on ARCH_MULTI_V6
-	select ARM_GIC
-	select DMA_CACHE_RWFO if SMP
-	select HAVE_SMP
-	select HAVE_ARM_SCU if SMP
-	select HAVE_ARM_TWD if SMP
-	help
-	  Include Support for the Oxford Semiconductor OX820 SoC Based Products.
-
-endif
diff --git a/arch/arm/mach-oxnas/Makefile b/arch/arm/mach-oxnas/Makefile
deleted file mode 100644
index 0e78ecfe6c49..000000000000
--- a/arch/arm/mach-oxnas/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_SMP)		+=3D platsmp.o headsmp.o
diff --git a/arch/arm/mach-oxnas/headsmp.S b/arch/arm/mach-oxnas/headsmp.S
deleted file mode 100644
index 9c0f1479f33a..000000000000
--- a/arch/arm/mach-oxnas/headsmp.S
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2013 Ma Haijun <mahaijuns@gmail.com>
- * Copyright (c) 2003 ARM Limited
- * All Rights Reserved
- */
-#include <linux/linkage.h>
-#include <linux/init.h>
-
-	__INIT
-
-/*
- * OX820 specific entry point for secondary CPUs.
- */
-ENTRY(ox820_secondary_startup)
-	mov r4, #0
-	/* invalidate both caches and branch target cache */
-	mcr p15, 0, r4, c7, c7, 0
-	/*
-	 * we've been released from the holding pen: secondary_stack
-	 * should now contain the SVC stack for this core
-	 */
-	b	secondary_startup
diff --git a/arch/arm/mach-oxnas/platsmp.c b/arch/arm/mach-oxnas/platsmp.c
deleted file mode 100644
index f0a50b9e61df..000000000000
--- a/arch/arm/mach-oxnas/platsmp.c
+++ /dev/null
@@ -1,96 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- * Copyright (C) 2013 Ma Haijun <mahaijuns@gmail.com>
- * Copyright (C) 2002 ARM Ltd.
- * All Rights Reserved
- */
-#include <linux/io.h>
-#include <linux/delay.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-#include <asm/cacheflush.h>
-#include <asm/cp15.h>
-#include <asm/smp_plat.h>
-#include <asm/smp_scu.h>
-
-extern void ox820_secondary_startup(void);
-
-static void __iomem *cpu_ctrl;
-static void __iomem *gic_cpu_ctrl;
-
-#define HOLDINGPEN_CPU_OFFSET		0xc8
-#define HOLDINGPEN_LOCATION_OFFSET	0xc4
-
-#define GIC_NCPU_OFFSET(cpu)		(0x100 + (cpu)*0x100)
-#define GIC_CPU_CTRL			0x00
-#define GIC_CPU_CTRL_ENABLE		1
-
-static int __init ox820_boot_secondary(unsigned int cpu,
-		struct task_struct *idle)
-{
-	/*
-	 * Write the address of secondary startup into the
-	 * system-wide flags register. The BootMonitor waits
-	 * until it receives a soft interrupt, and then the
-	 * secondary CPU branches to this address.
-	 */
-	writel(virt_to_phys(ox820_secondary_startup),
-			cpu_ctrl + HOLDINGPEN_LOCATION_OFFSET);
-
-	writel(cpu, cpu_ctrl + HOLDINGPEN_CPU_OFFSET);
-
-	/*
-	 * Enable GIC cpu interface in CPU Interface Control Register
-	 */
-	writel(GIC_CPU_CTRL_ENABLE,
-		gic_cpu_ctrl + GIC_NCPU_OFFSET(cpu) + GIC_CPU_CTRL);
-
-	/*
-	 * Send the secondary CPU a soft interrupt, thereby causing
-	 * the boot monitor to read the system wide flags register,
-	 * and branch to the address found there.
-	 */
-	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
-
-	return 0;
-}
-
-static void __init ox820_smp_prepare_cpus(unsigned int max_cpus)
-{
-	struct device_node *np;
-	void __iomem *scu_base;
-
-	np =3D of_find_compatible_node(NULL, NULL, "arm,arm11mp-scu");
-	scu_base =3D of_iomap(np, 0);
-	of_node_put(np);
-	if (!scu_base)
-		return;
-
-	/* Remap CPU Interrupt Interface Registers */
-	np =3D of_find_compatible_node(NULL, NULL, "arm,arm11mp-gic");
-	gic_cpu_ctrl =3D of_iomap(np, 1);
-	of_node_put(np);
-	if (!gic_cpu_ctrl)
-		goto unmap_scu;
-
-	np =3D of_find_compatible_node(NULL, NULL, "oxsemi,ox820-sys-ctrl");
-	cpu_ctrl =3D of_iomap(np, 0);
-	of_node_put(np);
-	if (!cpu_ctrl)
-		goto unmap_scu;
-
-	scu_enable(scu_base);
-	flush_cache_all();
-
-unmap_scu:
-	iounmap(scu_base);
-}
-
-static const struct smp_operations ox820_smp_ops __initconst =3D {
-	.smp_prepare_cpus	=3D ox820_smp_prepare_cpus,
-	.smp_boot_secondary	=3D ox820_boot_secondary,
-};
-
-CPU_METHOD_OF_DECLARE(ox820_smp, "oxsemi,ox820-smp", &ox820_smp_ops);

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#230): https://groups.io/g/linux-oxnas/message/230
Mute This Topic: https://groups.io/mt/98030325/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


