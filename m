Return-Path: <bounce+16102+133+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id C38FE443F03
	for <lists+linux-oxnas@lfdr.de>; Wed,  3 Nov 2021 10:10:17 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id REFxYY1809624xpSxi0qslSH; Wed, 03 Nov 2021 02:10:16 -0700
X-Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.249.1634922001819614062
 for <linux-oxnas@groups.io>;
 Fri, 22 Oct 2021 10:00:02 -0700
X-Received: by mail-io1-f50.google.com with SMTP id i189so6306348ioa.1
        for <linux-oxnas@groups.io>; Fri, 22 Oct 2021 10:00:01 -0700 (PDT)
X-Gm-Message-State: DQ0Hl1ypvZZKqRNFtmW4dYnCx1808289AA=
X-Google-Smtp-Source: ABdhPJzxQ0fZin7R9PkqV1UP1dkqBLaE11BhnPXYcqoa5W2nV/HynKJCgyp+2iBylPP9BT6beLI8s2+3hLU0rL6J7ec=
X-Received: by 2002:a05:6602:168f:: with SMTP id s15mr547913iow.178.1634922001157;
 Fri, 22 Oct 2021 10:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com> <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
In-Reply-To: <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 22 Oct 2021 22:29:24 +0530
Message-ID: <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
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
 q=dns/txt; s=20140610; t=1635930616;
 bh=d0EtpMOxhQv5/XY2azTkuIzUyUqdk/oq+Bxo8sC0N5Q=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=wtNsEdm4uxGQzU6Z8gq4xhR+894YjaqeLybvPK5KLjO5Qx1sMFiLOskRdN2xqhuaNTj
 Qlt3/cTp5MhhnYEV2BGkSbiPz6GsScdhG+2R+0uTCzkmS64T08lbmO3taLLW3tObjtIAA
 tVMWuquDXN16v8fH7kReYTG7x7E5AhUUPwg=

On Fri, 22 Oct 2021 at 05:13, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> >
> > Hi Saravana,
> >
> > This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> > I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.
>
> Amit top posting? How did that happen? :)
>
> The fact you are seeing this issue is super strange though. The driver
> literally does nothing other than allowing some sync_state() callbacks
> to happen. I also grepped for the occurence of "simple-bus" in
> arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
> soc node.
>
> The only thing I can think of is that without my patch some
> sync_state() callbacks weren't getting called and maybe it was masking
> some other issue.
>
> Can you try to boot with this log (see log patch below) and see if the
> device hangs right after a sync_state() callback? Also, looking at the
> different sync_state() implementations in upstream, I'm guessing one
> of the devices isn't voting for interconnect bandwidth when it should
> have.
>
> Another thing you could do is boot without the simple-bus changes and
> then look for all instances of "state_synced" in /sys/devices and then
> see if any of them has the value "0" after boot up is complete.

Turned out RB5 is not even reaching up to
device_links_flush_sync_list() and seem to be stuck somewhere in
device_links_driver_bound(). So I added more print logs to narrow down
to any specific lock state but those additional prints seem to have
added enough delay to unblock that particular driver (Serial:
8250/16550 driver if I understood the logs correctly) and I eventually
booted to UI.

On the booted RB5 *with* and *without* the simple-bus changes, I see 4
instances of "0" state_synced nodes at:

/sys/devices/platform/soc@0/9100000.interconnect/state_synced
/sys/devices/platform/soc@0/1500000.interconnect/state_synced
/sys/devices/platform/soc@0/1740000.interconnect/state_synced
/sys/devices/platform/soc@0/163d000.interconnect/state_synced

Regards,
Amit Pundir

>
> -Saravana
>
> -- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1099,6 +1099,7 @@ static void device_links_flush_sync_list(struct
> list_head *list,
>                 if (dev != dont_lock_dev)
>                         device_lock(dev);
>
> +               dev_info(dev, "Calling sync_state()\n");
>                 if (dev->bus->sync_state)
>                         dev->bus->sync_state(dev);
>                 else if (dev->driver && dev->driver->sync_state)


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#133): https://groups.io/g/linux-oxnas/message/133
Mute This Topic: https://groups.io/mt/86786845/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


