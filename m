Return-Path: <bounce+16102+128+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD624053DD
	for <lists+linux-oxnas@lfdr.de>; Thu,  9 Sep 2021 15:23:05 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id ydyiYY1809624xMkFWDNd1hp; Thu, 09 Sep 2021 06:23:04 -0700
X-Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.1406.1631149085800316334
 for <linux-oxnas@groups.io>;
 Wed, 08 Sep 2021 17:58:06 -0700
X-Received: by mail-yb1-f171.google.com with SMTP id v10so378746ybq.7
        for <linux-oxnas@groups.io>; Wed, 08 Sep 2021 17:58:05 -0700 (PDT)
X-Gm-Message-State: o5Yi7uETrlvMbt8NdV8SCAg9x1808289AA=
X-Google-Smtp-Source: ABdhPJx6jMeZ1TPMxNnT0r8N0YE1O5XCrnypAETOvNniF5nykzWvLeL9V4Cs/QSsyKiyKuGwycwNXOjDNxsx3aj/850=
X-Received: by 2002:a25:e0d4:: with SMTP id x203mr286478ybg.391.1631149084671;
 Wed, 08 Sep 2021 17:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
 <CAGETcx_7N3gtaT-YHGaGL+Qtkv=JOhgPcPF1A+kQ4aaDoetvSA@mail.gmail.com> <CAL_Jsq+-DAz+80QtpX5obWWcy=MAyxmTb262VAgMiKwnn=hfxQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+-DAz+80QtpX5obWWcy=MAyxmTb262VAgMiKwnn=hfxQ@mail.gmail.com>
From: "Saravana Kannan via groups.io" <saravanak=google.com@groups.io>
Date: Wed, 8 Sep 2021 17:57:28 -0700
Message-ID: <CAGETcx_=8yX6ObaEJk8QNSaWQPdFHsw4R74JrDFKqOL0AN-gLw@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
To: Rob Herring <robh+dt@kernel.org>
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
Reply-To: linux-oxnas@groups.io,saravanak@google.com
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1631193784;
 bh=WZSBq6tjDl/DyT09QLAIEQmgHQWrcfROsVvE24KmhGI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=wxe/tXQ1yjvPMLUPswCX8LBCAMNPpmqVYHuMw69whdPXGPur3fJ7a4iHGZlOyU2mgLE
 15qALfRQ7wIgEsofqMR+TcUSuqN6f2eNsUhUCJsVDOvqnEE0i62BLx0SKlP3nYL31/FP5
 f3eN/drisxO9MDiiA1PeDswoFLOo2mjs6oM=

On Wed, Sep 8, 2021 at 5:16 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Sep 7, 2021 at 2:01 AM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Mon, Sep 6, 2021 at 12:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >
> > > Hi Saravana,
> > >
> > > Thanks for your patch!
> > >
> > > CC linux-pm, Lee (mfd)
> > >
> > > On Sat, Sep 4, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > fw_devlink could end up creating device links for bus only devices.
> > > > However, bus only devices don't get probed and can block probe() or
> > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > devices using the simple-pm-bus driver.
> > > >
> > > > However, there are instances of devices that are not simple buses (they
> > > > get probed by their specific drivers) that also list the "simple-bus"
> > > > (or other bus only compatible strings) in their compatible property to
> > > > automatically populate their child devices. We still want these devices
> > > > to get probed by their specific drivers. So, we make sure this driver
> > > > only probes devices that are only buses.
> > >
> > > Note that this can also be the case for buses declaring compatibility
> > > with "simple-pm-bus".  However, at the moment, none of such device
> > > nodes in upstream DTS files have device-specific drivers.
> >
> > Not sure about mfd, but I want to make sure we don't confuse busses
> > (which are typically added to a class) with these "simple bus" devices
> > that are added to platform_bus. Also if these other buses are actually
> > causing an issue, then then should implement their own stub driver or
> > use try patch[2] if they are added to classes (devices on classes
> > don't probe)
> >
> > [2] - https://lore.kernel.org/lkml/20210831224510.703253-1-saravanak@google.com/
> >
> > >
> > > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > Tested-by: Saravana Kannan <saravanak@google.com>
> > >
> > > > --- a/drivers/bus/simple-pm-bus.c
> > > > +++ b/drivers/bus/simple-pm-bus.c
> > > > @@ -13,11 +13,26 @@
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_runtime.h>
> > > >
> > > > -
> > > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > > >  {
> > > > -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > > -       struct device_node *np = pdev->dev.of_node;
> > > > +       const struct device *dev = &pdev->dev;
> > > > +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > > +       struct device_node *np = dev->of_node;
> > > > +       const struct of_device_id *match;
> > > > +
> > > > +       match = of_match_device(dev->driver->of_match_table, dev);
> > > > +
> > > > +       /*
> > > > +        * These are transparent bus devices (not simple-pm-bus matches) that
> > > > +        * have their child nodes populated automatically.  So, don't need to
> > > > +        * do anything more.
> > > > +        */
> > > > +       if (match && match->data) {
> > > > +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > >
> > > Does this work as expected? Having multiple compatible values in a
> > > device node does not guarantee there exist a separate driver for any
> > > of the device-specific compatible values.
> >
> > Right, and if they are platform devices that are equivalent to
> > simple-bus (meaning, they don't do anything in Linux and just have
> > their devices populated) we can add those to this list too.
>
> I think this needs to be a list of compatibles we have drivers for
> instead.

I don't think a "denylist" (devices we shouldn't probe with this
driver) would be a short list. As of today, literally any device that
has children could add a "simple-bus" to the compatible property and
get its child devices populated for free. If we use a denylist, we'll
have to update it every time someone adds "simple-bus" as a general
match to a DT node (new or otherwise) that isn't in the denylist. The
list would blow up and be a maintenance headache.

Also, a denylist won't capture any DT that isn't part of the kernel
repo but depends on "simple-bus" to populate the device's child nodes.
Keep in mind this could be true even for completely upstream drivers
today. And on top of that, this will also break for downstream drivers
and platforms in the development stage.

The allowlist is much smaller and manageable.

> A more specific compatible that the OS doesn't understand
> shouldn't cause a change in behavior and adding one would.

I think the amount of specific compatible strings that'll be added,
but won't have drivers added to Linux AND would want to boot with
Linux is much less likely than the amount of times we'd have to update
a denylist.

Also, if we do hit the cases you mention and we want those devices to
get probed anyway, with my current allowlist approach, we could use
"driver_override" to force this driver to match them. If you use a
denylist like you said, there's no way you can get the simple-pm-bus
to unbind and let the more specific driver to bind.

> I expect it to be a short list.

>
> We are guaranteed that of_match_device() returns the best match in the
> match list, so we really just need 1 list here with a boolean to bail
> or not.
>
> > > > +                       return 0;
> > > > +               else
> > > > +                       return -ENODEV;
> > >
> > > So if we get here, as both branches use "return", we skip the
> > > pm_runtime_enable() and of_platform_populate() below:
> > >   - of_platform_populate() is handled for these buses by
> > >     of_platform_default_populate(), so that's OK,
> > >   - I'm wondering if any of the simple-mfd sub-devices use Runtime
> > >     PM, but currently fail to save power because pm_runtime_enable()
> > >     is never called for the MFD container, just like with simple-bus...
> >
> > But this doesn't affect simple-mfd though.
> >
> > >
> > > > +       }
> > > >
> > > >         dev_dbg(&pdev->dev, "%s\n", __func__);
> > > >
> > > > @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> > > >
> > > >  static int simple_pm_bus_remove(struct platform_device *pdev)
> > > >  {
> > > > +       const void *data = of_device_get_match_data(&pdev->dev);
> > > > +
> > > > +       if (data)
> > > > +               return 0;
> > > > +
> > > >         dev_dbg(&pdev->dev, "%s\n", __func__);
> > > >
> > > >         pm_runtime_disable(&pdev->dev);
> > > >         return 0;
> > > >  }
> > > >
> > > > +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> > > > +
> > > >  static const struct of_device_id simple_pm_bus_of_match[] = {
> > > >         { .compatible = "simple-pm-bus", },
> > > > +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> > > > +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> > > > +       { .compatible = "isa",          .data = ONLY_BUS },
> > >
> > > #ifdef CONFIG_ARM_AMBA ?
> >
> > Not needed? If CONFIG_ARM_AMBA isn't enabled, the device wouldn't be
> > created in the first place.
> >
> > >
> > > > +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
> > > >         { /* sentinel */ }
> > >
> > > This is now (almost[*]) the same as of_default_bus_match_table[]
> > > in drivers/of/platform.c. Perhaps it can be shared?
> >
> > I wanted this table to be expandable as needed. That's why I'm
> > intentionally not using of_default_bus_match_table[].
> >
> > >
> > > [*] Especially if "simple-pm-bus" and "simple-bus" would be treated
> > >     the same.
> >
> > They are not treated the same way.
>
> I think it would be better if they were. IOW, the core code stops
> descending into simple-bus, etc. nodes and they are populated here.
> Then we just get rid of of_default_bus_match_table.

Right, I would if we could. But we can't simply stop descending the
simple-bus nodes in the core code because all the specific drivers
that used to have their child devices populated automatically would
stop working and would need to be updated to populate their child
devices. And I'm sure there are a ton more downstream kernels and
downstream DTs (that use upstream kernels) that we would break.

If you really want to do that go for it, but I'd rather not do all
this as part of trying to fix the issue Ulf reported that needs
simple-bus only devices probed.

> That could cause some issues with init ordering. As I recall the at91
> gpio and pinctrl drivers are sensitive to this. The default call to
> of_platform_populate doesn't work on those systems because the devices
> get created later than when their machine specific call happens. It
> may have been a case of a parent probe assuming a child probe
> completed after of_platform_populate returns (also a problem for Qcom
> with DWC3). There's a fix for at91 somewhere in the git history after
> I broke it. I started trying to untangle things with at91, but never
> finished that.

I think it'll cause a lot of issues if we stop descending simple-bus
nodes in the core code. We're just scratching the surface here.

-Saravana


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#128): https://groups.io/g/linux-oxnas/message/128
Mute This Topic: https://groups.io/mt/85483780/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


