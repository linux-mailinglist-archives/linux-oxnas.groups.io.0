Return-Path: <bounce+16102+138+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7645D643
	for <lists+linux-oxnas@lfdr.de>; Thu, 25 Nov 2021 09:35:55 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id h2qDYY1809624xOjzhGWsaWB; Thu, 25 Nov 2021 00:35:54 -0800
X-Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web12.6.1637007504000157370
 for <linux-oxnas@groups.io>;
 Mon, 15 Nov 2021 12:18:24 -0800
X-Received: by mail-yb1-f182.google.com with SMTP id i194so17146843yba.6
        for <linux-oxnas@groups.io>; Mon, 15 Nov 2021 12:18:23 -0800 (PST)
X-Gm-Message-State: rGDnJjgVqVfwyIPkrxlMxnxpx1808289AA=
X-Google-Smtp-Source: ABdhPJxKkmPEnUXj0aVbJDTQXnWiiYrBJDqwAo+CYLHhYd6MMCN9FGeHm5tb4KkW7mZ9cUyGQQ0uXz7x+4W8OBjmlCo=
X-Received: by 2002:a5b:783:: with SMTP id b3mr1822562ybq.328.1637007502971;
 Mon, 15 Nov 2021 12:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen> <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
In-Reply-To: <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
From: "Saravana Kannan via groups.io" <saravanak=google.com@groups.io>
Date: Mon, 15 Nov 2021 12:17:46 -0800
Message-ID: <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
To: Abel Vesa <abelvesa@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
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
 q=dns/txt; s=20140610; t=1637829354;
 bh=rQlu4QiSbnpju0MXn0SNc5X0OOLegsvp4WqoxYy9anc=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=oVll5BCIJnevKh/Y5XEhR5ILmzdPEc882+R3lU5v29Ff0RXpTdl7rGZMMJV1tOR4IPy
 cqX83Umi6pS/QRhYZ9AqLVk3TcfW1aRb8wAJE0fuKQRfgPQ3iEYRSxAftdLmDClUbSIbp
 wRJ47P7VLkU4P0o4GwKW7jH7+VBf0b69jc4=

On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> >
> > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > fw_devlink could end up creating device links for bus only devices.
> > > However, bus only devices don't get probed and can block probe() or
> > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > devices using the simple-pm-bus driver.
> > >
> > > However, there are instances of devices that are not simple buses (they get
> > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > bus only compatible strings) in their compatible property to automatically
> > > populate their child devices. We still want these devices to get probed by
> > > their specific drivers. So, we make sure this driver only probes devices
> > > that are only buses.
> > >
> > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 39 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > > index 01a3d0cd08ed..6b8d6257ed8a 100644
> > > --- a/drivers/bus/simple-pm-bus.c
> > > +++ b/drivers/bus/simple-pm-bus.c
> > > @@ -13,11 +13,36 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >
> > > -
> > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > >  {
> > > -     const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > -     struct device_node *np = pdev->dev.of_node;
> > > +     const struct device *dev = &pdev->dev;
> > > +     const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > +     struct device_node *np = dev->of_node;
> > > +     const struct of_device_id *match;
> > > +
> > > +     /*
> > > +      * Allow user to use driver_override to bind this driver to a
> > > +      * transparent bus device which has a different compatible string
> > > +      * that's not listed in simple_pm_bus_of_match. We don't want to do any
> > > +      * of the simple-pm-bus tasks for these devices, so return early.
> > > +      */
> > > +     if (pdev->driver_override)
> > > +             return 0;
> > > +
> > > +     match = of_match_device(dev->driver->of_match_table, dev);
> > > +     /*
> > > +      * These are transparent bus devices (not simple-pm-bus matches) that
> > > +      * have their child nodes populated automatically.  So, don't need to
> > > +      * do anything more. We only match with the device if this driver is
> > > +      * the most specific match because we don't want to incorrectly bind to
> > > +      * a device that has a more specific driver.
> > > +      */
> > > +     if (match && match->data) {
> > > +             if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > +                     return 0;
> > > +             else
> > > +                     return -ENODEV;
> > > +     }
> >
> > This change is breaking the expected behavior for the already existent
> > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > devlink, the devices suspend sequence changes (and even breaks).
> >
> > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > should've been reversed: keep the simple-bus as is and add another
> > compatible, IDK, something like simple-trasnparent-bus, or something.
>
> The intent of this change IS to affect existing simple-bus nodes (but
> not in the way it's affecting you). But if it's breaking stuff, we
> obviously need to fix it.
>
> I have a hunch on what's going on in your case, but can you point me
> to the specific simple-bus node that's getting affected? I'm expecting
> it to be a simple-bus node that gets added AFTER this driver is
> registered at device_initcall (module_init gets converted to
> device_initcall).
>
> Also, can you try this hack patch to see if it helps your case?
> https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
>
> I have some thoughts on how I could fix this, but I need to think
> about a few cases.

Hi Abel,

Friendly reminder.

-Saravana


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#138): https://groups.io/g/linux-oxnas/message/138
Mute This Topic: https://groups.io/mt/87298933/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


