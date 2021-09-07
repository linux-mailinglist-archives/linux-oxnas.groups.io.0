Return-Path: <bounce+16102+123+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id C638E4053D8
	for <lists+linux-oxnas@lfdr.de>; Thu,  9 Sep 2021 15:23:01 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id fvOvYY1809624xuNatJ5bji1; Thu, 09 Sep 2021 06:23:00 -0700
X-Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.33520.1631010581570868681
 for <linux-oxnas@groups.io>;
 Tue, 07 Sep 2021 03:29:42 -0700
X-Received: by mail-lf1-f45.google.com with SMTP id t19so18537770lfe.13
        for <linux-oxnas@groups.io>; Tue, 07 Sep 2021 03:29:41 -0700 (PDT)
X-Gm-Message-State: 1n36VhCRxe27t6x0EnOE0i3gx1808289AA=
X-Google-Smtp-Source: ABdhPJys60vd2EfVBAO3UK31XFjhmxA9GflPqFA1SPD1wWtNddMSkoudjin2lm8iuifGlTtDQT5lpSQrL8eE5I3Y9PA=
X-Received: by 2002:a05:6512:3ca5:: with SMTP id h37mr12527062lfv.254.1631010579680;
 Tue, 07 Sep 2021 03:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com> <20210904000543.2019010-3-saravanak@google.com>
In-Reply-To: <20210904000543.2019010-3-saravanak@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Sep 2021 12:29:03 +0200
Message-ID: <CAPDyKFqO9PLygSnNWSPg9OhnfFfiSUXsEmj7juYjNyYSn2C6og@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v3 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1631193780;
 bh=5m1b+jRIl0ZHsACziDvjq4cKkZI1STGaTX214V0VQhY=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=QiNmxnPN5SUhoYqXAvMn8Uo//0/dIqTZwHnWQRs9F6KQ6xXDGPcYIKXAnDQeTiPiz4Q
 NwRvxYpyED/hXlhuE+iq8fxGtQjIzLEpGREbFJjJRlJfBQz2LDI6mhcX3QR4gvLjKBeJ3
 s3eVUZBjG3p+fdqAIzQd7LXCn21jtb3dBxM=

On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
>
> The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to
> work with fw_devlink. So, always compile it in for CONFIG_OF and delete
> the config since it's no longer necessary.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Some comments, see below. Nevertheless, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

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

Not sure what other people think (and it's not my call to make), but I
would suggest to split this up in four pieces (drivers/bus,
drivers/soc, arm, arm64)

The important part is that the change in drivers/bus gets merged as
part of your series, to make sure we don't break anything.

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
> 2.33.0.153.gba50c8fa24-goog
>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#123): https://groups.io/g/linux-oxnas/message/123
Mute This Topic: https://groups.io/mt/85483781/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


