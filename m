Return-Path: <bounce+16102+131+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032A443F01
	for <lists+linux-oxnas@lfdr.de>; Wed,  3 Nov 2021 10:10:15 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id 7LDZYY1809624xZBbzhvSdYC; Wed, 03 Nov 2021 02:10:14 -0700
X-Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.7816.1634815301848361801
 for <linux-oxnas@groups.io>;
 Thu, 21 Oct 2021 04:21:42 -0700
X-Received: by mail-io1-f48.google.com with SMTP id o184so388174iof.6
        for <linux-oxnas@groups.io>; Thu, 21 Oct 2021 04:21:41 -0700 (PDT)
X-Gm-Message-State: w4j4eZFeqlryRGCESI63PKU9x1808289AA=
X-Google-Smtp-Source: ABdhPJxMRo/M6HcJdEwh6eTZSJmNRK1zwILbTp96Xp6bcY/ASKoT49bvdtBnoUUI19JfFMMWqZN4m0P00TAN76G7v0w=
X-Received: by 2002:a05:6638:3796:: with SMTP id w22mr3510784jal.25.1634815300995;
 Thu, 21 Oct 2021 04:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-3-saravanak@google.com>
In-Reply-To: <20210929000735.585237-3-saravanak@google.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 21 Oct 2021 16:51:04 +0530
Message-ID: <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, 
	linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, John Stultz <john.stultz@linaro.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,amit.pundir@linaro.org
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1635930614;
 bh=sR4yXAZzHLcxIdY4PzTzMOSXCMAUWxsB3vnKi3mL5ro=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=H0cFrY2EnqJAYMTT/iC6gYDl7p/6sSLv0Top9Qk0AliBklgMGVkrXCFrOF2QX4aNIb7
 cL3j3TGQtp9rwp9aMMWrTu8wg42Q7rWFiHe6ErpO3Z6V63xXj5wGYAVJixFRY9AeruZuP
 NMjhOQj911xbMsEekD44Rei+dPzU01wprJA=

Hi Saravana,

This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.

Regards,
Amit Pundir

On Wed, 29 Sept 2021 at 05:37, Saravana Kannan <saravanak@google.com> wrote:
>
> The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to work
> with fw_devlink. So, always compile it in for CONFIG_OF and delete the
> config since it's no longer necessary.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig |  1 -
>  arch/arm/configs/oxnas_v6_defconfig |  1 -
>  arch/arm/configs/shmobile_defconfig |  1 -
>  arch/arm/mach-omap2/Kconfig         |  1 -
>  arch/arm64/configs/defconfig        |  1 -
>  drivers/bus/Kconfig                 | 12 ------------
>  drivers/bus/Makefile                |  2 +-
>  drivers/soc/canaan/Kconfig          |  1 -
>  8 files changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index d9abaae118dd..362720ae8d65 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -196,7 +196,6 @@ CONFIG_PCI_EPF_TEST=m
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_OMAP_OCP2SCP=y
> -CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
> index cae0db6b4eaf..de37f7e90999 100644
> --- a/arch/arm/configs/oxnas_v6_defconfig
> +++ b/arch/arm/configs/oxnas_v6_defconfig
> @@ -46,7 +46,6 @@ CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_DMA_CMA=y
>  CONFIG_CMA_SIZE_MBYTES=64
> -CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index d9a27e4e0914..18d2a960b2d2 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -40,7 +40,6 @@ CONFIG_PCI_RCAR_GEN2=y
>  CONFIG_PCIE_RCAR_HOST=y
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index 7df8f5276ddf..02f2f3157f07 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -112,7 +112,6 @@ config ARCH_OMAP2PLUS
>         select PM_GENERIC_DOMAINS
>         select PM_GENERIC_DOMAINS_OF
>         select RESET_CONTROLLER
> -       select SIMPLE_PM_BUS
>         select SOC_BUS
>         select TI_SYSC
>         select OMAP_IRQCHIP
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index f423d08b9a71..474b1f2e3f06 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -245,7 +245,6 @@ CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_FW_LOADER_USER_HELPER=y
>  CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>  CONFIG_HISILICON_LPC=y
> -CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_FSL_MC_BUS=y
>  CONFIG_TEGRA_ACONNECT=m
>  CONFIG_GNSS=m
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index e7f7eee6ee9a..dc3801369488 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -141,18 +141,6 @@ config QCOM_EBI2
>           Interface 2, which can be used to connect things like NAND Flash,
>           SRAM, ethernet adapters, FPGAs and LCD displays.
>
> -config SIMPLE_PM_BUS
> -       tristate "Simple Power-Managed Bus Driver"
> -       depends on OF && PM
> -       help
> -         Driver for transparent busses that don't need a real driver, but
> -         where the bus controller is part of a PM domain, or under the control
> -         of a functional clock, and thus relies on runtime PM for managing
> -         this PM domain and/or clock.
> -         An example of such a bus controller is the Renesas Bus State
> -         Controller (BSC, sometimes called "LBSC within Bus Bridge", or
> -         "External Bus Interface") as found on several Renesas ARM SoCs.
> -
>  config SUN50I_DE2_BUS
>         bool "Allwinner A64 DE2 Bus Driver"
>           default ARM64
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index 397e35392bff..86aacd36a56d 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -26,7 +26,7 @@ obj-$(CONFIG_OMAP_OCP2SCP)    += omap-ocp2scp.o
>  obj-$(CONFIG_QCOM_EBI2)                += qcom-ebi2.o
>  obj-$(CONFIG_SUN50I_DE2_BUS)   += sun50i-de2.o
>  obj-$(CONFIG_SUNXI_RSB)                += sunxi-rsb.o
> -obj-$(CONFIG_SIMPLE_PM_BUS)    += simple-pm-bus.o
> +obj-$(CONFIG_OF)               += simple-pm-bus.o
>  obj-$(CONFIG_TEGRA_ACONNECT)   += tegra-aconnect.o
>  obj-$(CONFIG_TEGRA_GMI)                += tegra-gmi.o
>  obj-$(CONFIG_TI_PWMSS)         += ti-pwmss.o
> diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
> index 8179b69518b4..853096b7e84c 100644
> --- a/drivers/soc/canaan/Kconfig
> +++ b/drivers/soc/canaan/Kconfig
> @@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
>         depends on RISCV && SOC_CANAAN && OF
>         default SOC_CANAAN
>          select PM
> -        select SIMPLE_PM_BUS
>          select SYSCON
>          select MFD_SYSCON
>         help
> --
> 2.33.0.685.g46640cef36-goog
>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#131): https://groups.io/g/linux-oxnas/message/131
Mute This Topic: https://groups.io/mt/86786845/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


