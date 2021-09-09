Return-Path: <bounce+16102+127+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF04053DC
	for <lists+linux-oxnas@lfdr.de>; Thu,  9 Sep 2021 15:23:05 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 6rieYY1809624xJMCjNebvdk; Thu, 09 Sep 2021 06:23:04 -0700
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.948.1631146573177799557
 for <linux-oxnas@groups.io>;
 Wed, 08 Sep 2021 17:16:13 -0700
X-Received: by mail.kernel.org (Postfix) with ESMTPSA id 204FA61176
	for <linux-oxnas@groups.io>; Thu,  9 Sep 2021 00:16:11 +0000 (UTC)
X-Received: by mail-ej1-f46.google.com with SMTP id dc3so5280262ejb.10
        for <linux-oxnas@groups.io>; Wed, 08 Sep 2021 17:16:11 -0700 (PDT)
X-Gm-Message-State: F38CMjJMpHAVUmtApX7kljD5x1808289AA=
X-Google-Smtp-Source: ABdhPJz14Imk476ha8K3WOAD7DkMuuT7rbeRcjoFY4GXGKHqc5FockmccC4lpgUwA6gBj0fp/p9PHV886vX/3e61W1A=
X-Received: by 2002:a17:906:1913:: with SMTP id a19mr364513eje.390.1631146569570;
 Wed, 08 Sep 2021 17:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
 <CAGETcx_7N3gtaT-YHGaGL+Qtkv=JOhgPcPF1A+kQ4aaDoetvSA@mail.gmail.com>
In-Reply-To: <CAGETcx_7N3gtaT-YHGaGL+Qtkv=JOhgPcPF1A+kQ4aaDoetvSA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 8 Sep 2021 19:15:58 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+-DAz+80QtpX5obWWcy=MAyxmTb262VAgMiKwnn=hfxQ@mail.gmail.com>
Message-ID: <CAL_Jsq+-DAz+80QtpX5obWWcy=MAyxmTb262VAgMiKwnn=hfxQ@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
To: Saravana Kannan <saravanak@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <narmstrong@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Android Kernel Team <kernel-team@android.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Lee Jones <lee.jones@linaro.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1631193784;
 bh=oVoM2gBB73znNdsjnqBlH+zuXX/JNlTBTTnc7x7XkQg=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=tyv1BTys6sxOLyILYvShK+okDun3yy76W5rdL/gaxa3oeijpr0g5A7hG4N+kYKzKvxb
 Msji1NGX3lu/djcP6CdssKldgFLPMj//WhiHuI7H0rPM4PLOMioSF8vxYTKYdhRULuup6
 WDjQx0geebiUCiNV4YH+PUy6rO8bHw2IOEg=

On Tue, Sep 7, 2021 at 2:01 AM Saravana Kannan <saravanak@google.com> wrote:
>
> On Mon, Sep 6, 2021 at 12:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Saravana,
> >
> > Thanks for your patch!
> >
> > CC linux-pm, Lee (mfd)
> >
> > On Sat, Sep 4, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
> > > fw_devlink could end up creating device links for bus only devices.
> > > However, bus only devices don't get probed and can block probe() or
> > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > devices using the simple-pm-bus driver.
> > >
> > > However, there are instances of devices that are not simple buses (they
> > > get probed by their specific drivers) that also list the "simple-bus"
> > > (or other bus only compatible strings) in their compatible property to
> > > automatically populate their child devices. We still want these devices
> > > to get probed by their specific drivers. So, we make sure this driver
> > > only probes devices that are only buses.
> >
> > Note that this can also be the case for buses declaring compatibility
> > with "simple-pm-bus".  However, at the moment, none of such device
> > nodes in upstream DTS files have device-specific drivers.
>
> Not sure about mfd, but I want to make sure we don't confuse busses
> (which are typically added to a class) with these "simple bus" devices
> that are added to platform_bus. Also if these other buses are actually
> causing an issue, then then should implement their own stub driver or
> use try patch[2] if they are added to classes (devices on classes
> don't probe)
>
> [2] - https://lore.kernel.org/lkml/20210831224510.703253-1-saravanak@google.com/
>
> >
> > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > Tested-by: Saravana Kannan <saravanak@google.com>
> >
> > > --- a/drivers/bus/simple-pm-bus.c
> > > +++ b/drivers/bus/simple-pm-bus.c
> > > @@ -13,11 +13,26 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >
> > > -
> > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > >  {
> > > -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > -       struct device_node *np = pdev->dev.of_node;
> > > +       const struct device *dev = &pdev->dev;
> > > +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > +       struct device_node *np = dev->of_node;
> > > +       const struct of_device_id *match;
> > > +
> > > +       match = of_match_device(dev->driver->of_match_table, dev);
> > > +
> > > +       /*
> > > +        * These are transparent bus devices (not simple-pm-bus matches) that
> > > +        * have their child nodes populated automatically.  So, don't need to
> > > +        * do anything more.
> > > +        */
> > > +       if (match && match->data) {
> > > +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> >
> > Does this work as expected? Having multiple compatible values in a
> > device node does not guarantee there exist a separate driver for any
> > of the device-specific compatible values.
>
> Right, and if they are platform devices that are equivalent to
> simple-bus (meaning, they don't do anything in Linux and just have
> their devices populated) we can add those to this list too.

I think this needs to be a list of compatibles we have drivers for
instead. A more specific compatible that the OS doesn't understand
shouldn't cause a change in behavior and adding one would. I expect it
to be a short list.

We are guaranteed that of_match_device() returns the best match in the
match list, so we really just need 1 list here with a boolean to bail
or not.

> > > +                       return 0;
> > > +               else
> > > +                       return -ENODEV;
> >
> > So if we get here, as both branches use "return", we skip the
> > pm_runtime_enable() and of_platform_populate() below:
> >   - of_platform_populate() is handled for these buses by
> >     of_platform_default_populate(), so that's OK,
> >   - I'm wondering if any of the simple-mfd sub-devices use Runtime
> >     PM, but currently fail to save power because pm_runtime_enable()
> >     is never called for the MFD container, just like with simple-bus...
>
> But this doesn't affect simple-mfd though.
>
> >
> > > +       }
> > >
> > >         dev_dbg(&pdev->dev, "%s\n", __func__);
> > >
> > > @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> > >
> > >  static int simple_pm_bus_remove(struct platform_device *pdev)
> > >  {
> > > +       const void *data = of_device_get_match_data(&pdev->dev);
> > > +
> > > +       if (data)
> > > +               return 0;
> > > +
> > >         dev_dbg(&pdev->dev, "%s\n", __func__);
> > >
> > >         pm_runtime_disable(&pdev->dev);
> > >         return 0;
> > >  }
> > >
> > > +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> > > +
> > >  static const struct of_device_id simple_pm_bus_of_match[] = {
> > >         { .compatible = "simple-pm-bus", },
> > > +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> > > +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> > > +       { .compatible = "isa",          .data = ONLY_BUS },
> >
> > #ifdef CONFIG_ARM_AMBA ?
>
> Not needed? If CONFIG_ARM_AMBA isn't enabled, the device wouldn't be
> created in the first place.
>
> >
> > > +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
> > >         { /* sentinel */ }
> >
> > This is now (almost[*]) the same as of_default_bus_match_table[]
> > in drivers/of/platform.c. Perhaps it can be shared?
>
> I wanted this table to be expandable as needed. That's why I'm
> intentionally not using of_default_bus_match_table[].
>
> >
> > [*] Especially if "simple-pm-bus" and "simple-bus" would be treated
> >     the same.
>
> They are not treated the same way.

I think it would be better if they were. IOW, the core code stops
descending into simple-bus, etc. nodes and they are populated here.
Then we just get rid of of_default_bus_match_table.

That could cause some issues with init ordering. As I recall the at91
gpio and pinctrl drivers are sensitive to this. The default call to
of_platform_populate doesn't work on those systems because the devices
get created later than when their machine specific call happens. It
may have been a case of a parent probe assuming a child probe
completed after of_platform_populate returns (also a problem for Qcom
with DWC3). There's a fix for at91 somewhere in the git history after
I broke it. I started trying to untangle things with at91, but never
finished that.

Rob


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#127): https://groups.io/g/linux-oxnas/message/127
Mute This Topic: https://groups.io/mt/85483780/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


