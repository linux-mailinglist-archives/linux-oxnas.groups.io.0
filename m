Return-Path: <bounce+16102+231+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9C6D3E35
	for <lists+linux-oxnas@lfdr.de>; Mon,  3 Apr 2023 09:42:30 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 9EccYY1809624xGFQMsmyhzo; Mon, 03 Apr 2023 00:42:28 -0700
X-Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.64564.1680507747541161000
 for <linux-oxnas@groups.io>;
 Mon, 03 Apr 2023 00:42:27 -0700
X-Received: by mail-wr1-f51.google.com with SMTP id l27so28264679wrb.2
        for <linux-oxnas@groups.io>; Mon, 03 Apr 2023 00:42:27 -0700 (PDT)
X-Gm-Message-State: OLthFMjjLrFhcAdMwSpAqnWCx1808289AA=
X-Google-Smtp-Source: AKy350Z6e6J7uSkW2Hv2dRYhOElAG4NTAcR0nwGJ0pugXPyWTFpVuEPcRywE7wwpOPRnYtIXtriOjA==
X-Received: by 2002:a5d:55c7:0:b0:2d2:ab47:3ef4 with SMTP id i7-20020a5d55c7000000b002d2ab473ef4mr28234897wrw.70.1680507746014;
        Mon, 03 Apr 2023 00:42:26 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002e62384d17dsm8180482wrr.21.2023.04.03.00.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:42:25 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Date: Mon, 03 Apr 2023 09:42:20 +0200
Subject: [linux-oxnas] [PATCH RFC v2 3/4] ARM: configs: remove oxnas_v6_defconfig
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v2-3-e51078376f08@linaro.org>
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
 bh=PvjE3hmc1Lj2q11JZXfkMPGr6tN+910wGbIdiRt8CXQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=k7J8x8AIKpMnsCwFriCoFCebODhxyReF0GPD0T7UGrZnsP4nB6dYQeTUHxed5zU38fb
 7YM1iAUSjDwYGy86xx+83FM6V3IwOHF7rZdhjDE266uN/CrjnJQ8JgpvM2Cr8Jc64O9qF
 3yxFiqWSx2nCgtKsiiB9nqz7OdO6OIH41HY=

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX820 specific defconfig.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/configs/oxnas_v6_defconfig | 92 ---------------------------------=
----
 1 file changed, 92 deletions(-)

diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v=
6_defconfig
deleted file mode 100644
index 70a67b3fc91b..000000000000
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ /dev/null
@@ -1,92 +0,0 @@
-CONFIG_SYSVIPC=3Dy
-CONFIG_NO_HZ_IDLE=3Dy
-CONFIG_HIGH_RES_TIMERS=3Dy
-CONFIG_CGROUPS=3Dy
-CONFIG_BLK_DEV_INITRD=3Dy
-CONFIG_EMBEDDED=3Dy
-CONFIG_PERF_EVENTS=3Dy
-CONFIG_STRICT_KERNEL_RWX=3Dy
-CONFIG_STRICT_MODULE_RWX=3Dy
-CONFIG_ARCH_MULTI_V6=3Dy
-CONFIG_ARCH_OXNAS=3Dy
-CONFIG_MACH_OX820=3Dy
-CONFIG_SMP=3Dy
-CONFIG_NR_CPUS=3D16
-CONFIG_ARCH_FORCE_MAX_ORDER=3D12
-CONFIG_SECCOMP=3Dy
-CONFIG_ARM_APPENDED_DTB=3Dy
-CONFIG_ARM_ATAG_DTB_COMPAT=3Dy
-CONFIG_KEXEC=3Dy
-CONFIG_EFI=3Dy
-CONFIG_CPU_IDLE=3Dy
-CONFIG_ARM_CPUIDLE=3Dy
-CONFIG_VFP=3Dy
-CONFIG_MODULES=3Dy
-CONFIG_MODULE_UNLOAD=3Dy
-CONFIG_PARTITION_ADVANCED=3Dy
-CONFIG_CMDLINE_PARTITION=3Dy
-CONFIG_CMA=3Dy
-CONFIG_NET=3Dy
-CONFIG_PACKET=3Dy
-CONFIG_UNIX=3Dy
-CONFIG_INET=3Dy
-CONFIG_IP_PNP=3Dy
-CONFIG_IP_PNP_DHCP=3Dy
-CONFIG_IP_PNP_BOOTP=3Dy
-CONFIG_IP_PNP_RARP=3Dy
-CONFIG_IPV6_ROUTER_PREF=3Dy
-CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
-CONFIG_INET6_AH=3Dm
-CONFIG_INET6_ESP=3Dm
-CONFIG_INET6_IPCOMP=3Dm
-CONFIG_IPV6_MIP6=3Dm
-CONFIG_IPV6_TUNNEL=3Dm
-CONFIG_IPV6_MULTIPLE_TABLES=3Dy
-CONFIG_DEVTMPFS=3Dy
-CONFIG_DEVTMPFS_MOUNT=3Dy
-CONFIG_MTD=3Dy
-CONFIG_MTD_CMDLINE_PARTS=3Dy
-CONFIG_MTD_BLOCK=3Dy
-CONFIG_MTD_RAW_NAND=3Dy
-CONFIG_MTD_NAND_OXNAS=3Dy
-CONFIG_MTD_UBI=3Dy
-CONFIG_BLK_DEV_LOOP=3Dy
-CONFIG_BLK_DEV_RAM=3Dy
-CONFIG_BLK_DEV_RAM_SIZE=3D65536
-CONFIG_NETDEVICES=3Dy
-CONFIG_STMMAC_ETH=3Dy
-CONFIG_REALTEK_PHY=3Dy
-CONFIG_INPUT_EVDEV=3Dy
-CONFIG_SERIAL_8250=3Dy
-CONFIG_SERIAL_8250_CONSOLE=3Dy
-CONFIG_SERIAL_OF_PLATFORM=3Dy
-CONFIG_GPIO_GENERIC_PLATFORM=3Dy
-CONFIG_NEW_LEDS=3Dy
-CONFIG_LEDS_CLASS=3Dy
-CONFIG_LEDS_CLASS_FLASH=3Dm
-CONFIG_LEDS_GPIO=3Dy
-CONFIG_LEDS_TRIGGERS=3Dy
-CONFIG_LEDS_TRIGGER_TIMER=3Dy
-CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
-CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
-CONFIG_LEDS_TRIGGER_CPU=3Dy
-CONFIG_LEDS_TRIGGER_GPIO=3Dy
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
-CONFIG_ARM_TIMER_SP804=3Dy
-CONFIG_EXT4_FS=3Dy
-CONFIG_MSDOS_FS=3Dy
-CONFIG_VFAT_FS=3Dy
-CONFIG_TMPFS=3Dy
-CONFIG_TMPFS_POSIX_ACL=3Dy
-CONFIG_UBIFS_FS=3Dy
-CONFIG_PSTORE=3Dy
-CONFIG_PSTORE_CONSOLE=3Dy
-CONFIG_PSTORE_PMSG=3Dy
-CONFIG_PSTORE_RAM=3Dy
-CONFIG_NLS_CODEPAGE_437=3Dy
-CONFIG_NLS_ISO8859_1=3Dy
-CONFIG_NLS_UTF8=3Dy
-CONFIG_DMA_CMA=3Dy
-CONFIG_CMA_SIZE_MBYTES=3D64
-CONFIG_PRINTK_TIME=3Dy
-CONFIG_MAGIC_SYSRQ=3Dy

--=20
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#231): https://groups.io/g/linux-oxnas/message/231
Mute This Topic: https://groups.io/mt/98030326/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


