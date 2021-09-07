Return-Path: <bounce+16102+124+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 165194053D9
	for <lists+linux-oxnas@lfdr.de>; Thu,  9 Sep 2021 15:23:01 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id GrMsYY1809624xQbfE3d46Y6; Thu, 09 Sep 2021 06:23:00 -0700
X-Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.34260.1631011316149427197
 for <linux-oxnas@groups.io>;
 Tue, 07 Sep 2021 03:41:56 -0700
X-Received: by mail-lf1-f53.google.com with SMTP id e23so4517830lfj.9
        for <linux-oxnas@groups.io>; Tue, 07 Sep 2021 03:41:55 -0700 (PDT)
X-Gm-Message-State: LGBaRSpW2fMaBl41LNVX0GZbx1808289AA=
X-Google-Smtp-Source: ABdhPJx5OzN424vh3oUBOd8az3yzOHpWuZvPJYGzzfbrnfcRI/DT6ljkNdyfvmPJ0H6drgHJs7FbTfrhZnQn3vKdz38=
X-Received: by 2002:a19:ac42:: with SMTP id r2mr12064265lfc.167.1631011314103;
 Tue, 07 Sep 2021 03:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com> <20210904000543.2019010-2-saravanak@google.com>
In-Reply-To: <20210904000543.2019010-2-saravanak@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Sep 2021 12:41:18 +0200
Message-ID: <CAPDyKFrsKvHXMT-6CuFXKfqX+hZa3vGAu7hQz=9ZYBC7-dYS0w@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
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
 bh=225EDrcxN5NtMH1zCdx2sBPR1DuE3daYOK1JfaySwv8=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=UXZXuUQXEtFaa6WoaefZ9KD7sK4Vii0pGSMQtDWhnc8/kjjq9vWBImuJdqq6uSuq/vt
 eN0R7o9wMlMQ5+UbcQbmkCTGDncLs1uHpY82K3u5bDbj1VMQN4UFbI5L2NbOv1oKgZ0OL
 6EmX8octGbooYCkDJsEbvqPi0GaBGKfVnY0=

On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
>
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they
> get probed by their specific drivers) that also list the "simple-bus"
> (or other bus only compatible strings) in their compatible property to
> automatically populate their child devices. We still want these devices
> to get probed by their specific drivers. So, we make sure this driver
> only probes devices that are only buses.
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

I will run some tests as soon as I can and let you know the results.

Kind regards
Uffe

> ---
>  drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 01a3d0cd08ed..3e086a9f34cb 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -13,11 +13,26 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>
> -
>  static int simple_pm_bus_probe(struct platform_device *pdev)
>  {
> -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> -       struct device_node *np = pdev->dev.of_node;
> +       const struct device *dev = &pdev->dev;
> +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> +       struct device_node *np = dev->of_node;
> +       const struct of_device_id *match;
> +
> +       match = of_match_device(dev->driver->of_match_table, dev);
> +
> +       /*
> +        * These are transparent bus devices (not simple-pm-bus matches) that
> +        * have their child nodes populated automatically.  So, don't need to
> +        * do anything more.
> +        */
> +       if (match && match->data) {
> +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> +                       return 0;
> +               else
> +                       return -ENODEV;
> +       }
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
> @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>
>  static int simple_pm_bus_remove(struct platform_device *pdev)
>  {
> +       const void *data = of_device_get_match_data(&pdev->dev);
> +
> +       if (data)
> +               return 0;
> +
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
>         pm_runtime_disable(&pdev->dev);
>         return 0;
>  }
>
> +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> +
>  static const struct of_device_id simple_pm_bus_of_match[] = {
>         { .compatible = "simple-pm-bus", },
> +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> +       { .compatible = "isa",          .data = ONLY_BUS },
> +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> --
> 2.33.0.153.gba50c8fa24-goog
>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#124): https://groups.io/g/linux-oxnas/message/124
Mute This Topic: https://groups.io/mt/85483780/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


