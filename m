Return-Path: <bounce+16102+134+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D0443F02
	for <lists+linux-oxnas@lfdr.de>; Wed,  3 Nov 2021 10:10:17 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id Gu88YY1809624xK1sOK4Ldwv; Wed, 03 Nov 2021 02:10:16 -0700
X-Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web09.5622.1635208239716232772
 for <linux-oxnas@groups.io>;
 Mon, 25 Oct 2021 17:30:39 -0700
X-Received: by mail-yb1-f170.google.com with SMTP id t127so30304823ybf.13
        for <linux-oxnas@groups.io>; Mon, 25 Oct 2021 17:30:39 -0700 (PDT)
X-Gm-Message-State: 7V5JSp9Yn1EkdwEhfzPzvXB5x1808289AA=
X-Google-Smtp-Source: ABdhPJwkdfRIKjhmBppLm+T21H0QPHoD4LXXiPIYhqq5jQAumISBbcpXVG/c3VSAYycVKUykbWB0N2n0Rav/D4MlbEo=
X-Received: by 2002:a5b:cce:: with SMTP id e14mr20273877ybr.486.1635208238648;
 Mon, 25 Oct 2021 17:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
 <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com> <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
In-Reply-To: <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
From: "Saravana Kannan via groups.io" <saravanak=google.com@groups.io>
Date: Mon, 25 Oct 2021 17:30:02 -0700
Message-ID: <CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Amit Pundir <amit.pundir@linaro.org>
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
Reply-To: linux-oxnas@groups.io,saravanak@google.com
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1635930616;
 bh=xCX1iGwNZEt94m6Lrf3W2dwkBl9DOws7sj5MeC7ew3k=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=P796/uV1ZYNpjGY8ufLARTLjSYRIhsBnmAJnC8gLbejd3r5vfUc+rf0Y+cGJSUC0TMH
 T2H5zSPjKZe3rveAQXfxMOeKJFs1Nzfwk77Qx7iQr6Dlq1tonpunkTlZ/BeYEzz/tIouk
 bo6YTdaBCxPVXYdf+f/wLYxNGOAZsPx4rtI=

On Fri, Oct 22, 2021 at 10:00 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Fri, 22 Oct 2021 at 05:13, Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> > >
> > > Hi Saravana,
> > >
> > > This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> > > I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.
> >
> > Amit top posting? How did that happen? :)
> >
> > The fact you are seeing this issue is super strange though. The driver
> > literally does nothing other than allowing some sync_state() callbacks
> > to happen. I also grepped for the occurence of "simple-bus" in
> > arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
> > soc node.
> >
> > The only thing I can think of is that without my patch some
> > sync_state() callbacks weren't getting called and maybe it was masking
> > some other issue.
> >
> > Can you try to boot with this log (see log patch below) and see if the
> > device hangs right after a sync_state() callback? Also, looking at the
> > different sync_state() implementations in upstream, I'm guessing one
> > of the devices isn't voting for interconnect bandwidth when it should
> > have.
> >
> > Another thing you could do is boot without the simple-bus changes and
> > then look for all instances of "state_synced" in /sys/devices and then
> > see if any of them has the value "0" after boot up is complete.
>
> Turned out RB5 is not even reaching up to
> device_links_flush_sync_list() and seem to be stuck somewhere in
> device_links_driver_bound(). So I added more print logs to narrow down
> to any specific lock state but those additional prints seem to have
> added enough delay to unblock that particular driver (Serial:
> 8250/16550 driver if I understood the logs correctly) and I eventually
> booted to UI.

Ugh... I think I know what's going on. It popped into my head over the weekend.

Couple of ways to confirm my theory:
1. After it finishes booting in both cases, can you compare the output
of the command below? I'm expecting to see a significant drop in the
number of device links.
ls -l /sys/class/devlink | wc -l

2. Can you try out this terrible hack patch (not final fix, no code
reviews please) on top of Tot to see if it fixes your issue without
having to add hacky logs?

Thanks,
Saravana

--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -38,10 +38,12 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
         * a device that has a more specific driver.
         */
        if (match && match->data) {
-               if (of_property_match_string(np, "compatible",
match->compatible) == 0)
+               if (of_property_match_string(np, "compatible",
match->compatible) == 0) {
+                       of_platform_populate(np, NULL, lookup, &pdev->dev);
                        return 0;
-               else
+               } else {
                        return -ENODEV;
+               }
        }


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#134): https://groups.io/g/linux-oxnas/message/134
Mute This Topic: https://groups.io/mt/86786845/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


