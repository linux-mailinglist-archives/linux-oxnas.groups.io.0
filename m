Return-Path: <bounce+16102+126+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F34053DB
	for <lists+linux-oxnas@lfdr.de>; Thu,  9 Sep 2021 15:23:03 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id ZxLAYY1809624xbzs1qWHOYC; Thu, 09 Sep 2021 06:23:02 -0700
X-Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.18598.1631138578034792235
 for <linux-oxnas@groups.io>;
 Wed, 08 Sep 2021 15:02:58 -0700
X-Received: by mail-yb1-f178.google.com with SMTP id k65so7229563yba.13
        for <linux-oxnas@groups.io>; Wed, 08 Sep 2021 15:02:57 -0700 (PDT)
X-Gm-Message-State: Fo6udstUs8UmomnD7nFqDLtWx1808289AA=
X-Google-Smtp-Source: ABdhPJxClOdeLnlr90MK1KP1cTL7b5WQrlcEprzjPCW6hNsUleQfKwSjp3Z9+e8nH9EAsa8vkVGGODNF/IKN+WaxZHU=
X-Received: by 2002:a05:6902:1201:: with SMTP id s1mr600170ybu.432.1631138577011;
 Wed, 08 Sep 2021 15:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAPDyKFrsKvHXMT-6CuFXKfqX+hZa3vGAu7hQz=9ZYBC7-dYS0w@mail.gmail.com>
In-Reply-To: <CAPDyKFrsKvHXMT-6CuFXKfqX+hZa3vGAu7hQz=9ZYBC7-dYS0w@mail.gmail.com>
From: "Saravana Kannan via groups.io" <saravanak=google.com@groups.io>
Date: Wed, 8 Sep 2021 15:02:21 -0700
Message-ID: <CAGETcx8xfb+mnmo9wvX_C19Ta_FFh+jn8sz2sKyx5PJY1aZCyg@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
To: Ulf Hansson <ulf.hansson@linaro.org>
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
Reply-To: linux-oxnas@groups.io,saravanak@google.com
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1631193782;
 bh=KU8v+eEdwEDdVqKXHcf640DX3PrZXqJSFk5DeuJXngU=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Du3J2D7igfFfUiFsA+gOceXQbx/aVHOSN036lJqFzNig1RsAx1w+2banF7RZYBWp84g
 0RkLI0ozcPeYPqyVJk94jPkVscNKbRYqFN/+0YF4yWM37cogG3fVsMy3f1xJXLvJgzqNt
 wv9MyloytsMaqYQJMFTIQRku+6NS9OKh/zY=

On Tue, Sep 7, 2021 at 3:41 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
> >
> > fw_devlink could end up creating device links for bus only devices.
> > However, bus only devices don't get probed and can block probe() or
> > sync_state() [1] call backs of other devices. To avoid this, probe these
> > devices using the simple-pm-bus driver.
> >
> > However, there are instances of devices that are not simple buses (they
> > get probed by their specific drivers) that also list the "simple-bus"
> > (or other bus only compatible strings) in their compatible property to
> > automatically populate their child devices. We still want these devices
> > to get probed by their specific drivers. So, we make sure this driver
> > only probes devices that are only buses.
> >
> > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Saravana Kannan <saravanak@google.com>
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> I will run some tests as soon as I can and let you know the results.

Thanks.

-Saravana

>
> Kind regards
> Uffe
>
> > ---
> >  drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > index 01a3d0cd08ed..3e086a9f34cb 100644
> > --- a/drivers/bus/simple-pm-bus.c
> > +++ b/drivers/bus/simple-pm-bus.c
> > @@ -13,11 +13,26 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >
> > -
> >  static int simple_pm_bus_probe(struct platform_device *pdev)
> >  {
> > -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > -       struct device_node *np = pdev->dev.of_node;
> > +       const struct device *dev = &pdev->dev;
> > +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > +       struct device_node *np = dev->of_node;
> > +       const struct of_device_id *match;
> > +
> > +       match = of_match_device(dev->driver->of_match_table, dev);
> > +
> > +       /*
> > +        * These are transparent bus devices (not simple-pm-bus matches) that
> > +        * have their child nodes populated automatically.  So, don't need to
> > +        * do anything more.
> > +        */
> > +       if (match && match->data) {
> > +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > +                       return 0;
> > +               else
> > +                       return -ENODEV;
> > +       }
> >
> >         dev_dbg(&pdev->dev, "%s\n", __func__);
> >
> > @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >
> >  static int simple_pm_bus_remove(struct platform_device *pdev)
> >  {
> > +       const void *data = of_device_get_match_data(&pdev->dev);
> > +
> > +       if (data)
> > +               return 0;
> > +
> >         dev_dbg(&pdev->dev, "%s\n", __func__);
> >
> >         pm_runtime_disable(&pdev->dev);
> >         return 0;
> >  }
> >
> > +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> > +
> >  static const struct of_device_id simple_pm_bus_of_match[] = {
> >         { .compatible = "simple-pm-bus", },
> > +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> > +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> > +       { .compatible = "isa",          .data = ONLY_BUS },
> > +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
> >         { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> > --
> > 2.33.0.153.gba50c8fa24-goog
> >


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#126): https://groups.io/g/linux-oxnas/message/126
Mute This Topic: https://groups.io/mt/85483780/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


