Return-Path: <bounce+16102+262+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BF36FCB0F
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:18:10 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id BOQpYY1809624xcjO1UIUxFM; Tue, 09 May 2023 09:18:09 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.8352.1683075874318085512
 for <linux-oxnas@groups.io>;
 Tue, 02 May 2023 18:04:34 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 903CA629D9
	for <linux-oxnas@groups.io>; Wed,  3 May 2023 01:04:33 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79650C433A4
	for <linux-oxnas@groups.io>; Wed,  3 May 2023 01:04:32 +0000 (UTC)
X-Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2a8baeac4d1so46313371fa.1
        for <linux-oxnas@groups.io>; Tue, 02 May 2023 18:04:32 -0700 (PDT)
X-Gm-Message-State: 8FnHt7rXknahui6vpAU7YXYux1808289AA=
X-Google-Smtp-Source: ACHHUZ4mSLqb1ExsMkOjNsdZYIFyOMFO5WWfDnvfwZvuM9fv3TyrxmQhN6hT67g4AYdNW/MVo7uZ6IBv6mL14dd4tuc=
X-Received: by 2002:a2e:8402:0:b0:2a8:d103:dc8 with SMTP id
 z2-20020a2e8402000000b002a8d1030dc8mr4705375ljg.2.1683075870337; Tue, 02 May
 2023 18:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
In-Reply-To: <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 20:04:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Message-ID: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, 
	Christian Marangi <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
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
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649089;
 bh=8mBQJoLshubIX5kl3Vv758Y/acdGw34m3r1Fs4PsKCc=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=AZXAz3O0FqooY+0sJ9/QnjLG5cpRKeOwRs4z1Buj99ThVhIJ89n0SB8ewiq3PLZ5PHQ
 3tkQ0xfyJ2B621SvRFxpkBKvF5sN9pMCYxmDPCMloFLtJRtUgEUNwCOxYz7mRrXEdwF9Q
 r1cxJWl73+/GrqcIfcxU3IJCPvyawFCKCgk=

On Tue, May 2, 2023 at 6:02=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.c=
om> wrote:
>
> On 5/2/23 12:40, Rob Herring wrote:
> > On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >>
> >> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
> >>> On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> >>>
> >>>> Does your script also cater for .dts files not matching any pattern,
> >>>> but including a .dtsi file that does match a pattern?
> >>>
> >>> I assume I built everything after moving, but maybe not...
> >>>
> >>> That's all just "details". First, we need agreement on a) moving
> >>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> >>> been stuck on a) for being 'too much churn'.
> >>
> >> Sorry for missing most of the discussion last week. The script sounds
> >> fine to me, the only reason I didn't want to do this in the past is th=
at
> >> we had the plan to move platforms out of the kernel tree to an externa=
l
> >> repository and I wanted to do this platform at a time and also only mo=
ve
> >> each one once. I don't think that is going to happen anytime soon now,
> >> so let's just do your script.
> >>
> >> Can you send me the script and/or a pull request of the resulting
> >> tree based on my soc/dt branch? Everything is merged upstream,
> >> and I think git-merge would handle the remaining merges with any
> >> other changes in mainline.
> >
> > I've dusted off my script and made a branch[1] with the result.
> > There's just a couple of fixes needed after the script is run (see the
> > top commit). The cross arch includes are all fixed up by the script.
> > dtbs_install maintains a flat install. I compared the number of .dtbs
> > before and after to check the script.
> >
> > I think the only issue remaining is finalizing the mapping of
> > platforms to subdirs. What I have currently is a mixture of SoC
> > families and vendors. The most notable are all the Freescale/NXP
> > platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> > either. Once that's finalized, I still need to go update MAINTAINERS.
> >
> > Here's the current mapping:
> >
> > vendor_map =3D {
> >      'alphascale' : 'alphascale',
> >      'alpine' : 'alpine',
> >      'artpec' : 'axis',
> >      'axm' : 'lsi',
> >      'cx9' : 'cnxt',
> >      'ecx' : 'calxeda',
> >      'highbank' : 'calxeda',
> >      'ep7' : 'cirrus',
> >      'mxs': 'mxs',
> >      'imx23': 'mxs',
> >      'imx28': 'mxs',
> >      'sun' : 'allwinner',
> >      'imx': 'imx',
> >      'e6' : 'imx',
> >      'e7' : 'imx',
> >      'mba6' : 'imx',
> >      'ls': 'fsl',
> >      'vf': 'fsl',
> >      'qcom': 'qcom',
> >      'am3' : 'ti',
> >      'am4' : 'ti',
> >      'am5' : 'ti',
> >      'dra' : 'ti',
> >      'keystone' : 'ti',
> >      'omap' : 'ti',
> >      'compulab' : 'ti',
> >      'logicpd' : 'ti',
> >      'elpida' : 'ti',
> >      'motorola' : 'ti',
> >      'twl' : 'ti',
> >      'da' : 'ti',
> >      'dm' : 'ti',
> >      'nspire' : 'nspire',
> >      'armada' : 'marvell',
> >      'dove' : 'marvell',
> >      'kirkwood' : 'marvell',
> >      'orion' : 'marvell',
> >      'mvebu' : 'marvell',
> >      'mmp' : 'marvell',
> >      'berlin' : 'berlin',
> >      'pxa2' : 'pxa',
> >      'pxa3' : 'pxa',
> >      'pxa' : 'marvell',
> >      'arm-' : 'arm',
> >      'integ' : 'arm',
> >      'mps' : 'arm',
> >      've' : 'arm',
> >      'aspeed' : 'aspeed',
> >      'ast2' : 'aspeed',
> >      'facebook' : 'aspeed',
> >      'ibm' : 'aspeed',
> >      'openbmc' : 'aspeed',
> >      'en7' : 'airoha',
> >      'at91' : 'microchip',
> >      'sama' : 'microchip',
> >      'sam9' : 'microchip',
> >      'usb_' : 'microchip',
> >      'tny_' : 'microchip',
> >      'mpa1600' : 'microchip',
> >      'animeo_ip' : 'microchip',
> >      'aks-cdu' : 'microchip',
> >      'ethernut5' : 'microchip',
> >      'evk-pro3' : 'microchip',
> >      'pm9g45' : 'microchip',
> >      'ge86' : 'microchip',
> >      'bcm' : 'brcm',
>
> How about we use 'broadcom' here, to follow what arm64 does? I could
> rename arch/mips/boot/dts/brcm to arch/mips/boot/dts/broadcom for
> consistency, too?

Okay, though if starting clean I'd somewhat prefer to use the vendor
prefix. I guess since arm and arm64 share dtsi files, they should
match.

Rob


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#262): https://groups.io/g/linux-oxnas/message/262
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


