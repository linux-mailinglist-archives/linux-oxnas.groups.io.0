Return-Path: <bounce+16102+270+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 6523C6FCB22
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:04 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id RQwhYY1809624xwd3O2MylYs; Tue, 09 May 2023 09:19:03 -0700
X-Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.17446.1683116031967219982
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 05:13:52 -0700
X-Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-55a214572e8so54946457b3.0
        for <linux-oxnas@groups.io>; Wed, 03 May 2023 05:13:51 -0700 (PDT)
X-Gm-Message-State: 98N3Q5YY6pr0D7TRTl4CN79ax1808289AA=
X-Google-Smtp-Source: ACHHUZ66hRgZLiqP0HgNywmuyEJNjQjxpzuYU/Ewr0nLiWAs/k7+ydf4eMIyKQKo0mpz4nSzQd/diYDGzmnUCVXeNlI=
X-Received: by 2002:a81:4f04:0:b0:54f:ddb9:95e7 with SMTP id
 d4-20020a814f04000000b0054fddb995e7mr20136923ywb.34.1683116031053; Wed, 03
 May 2023 05:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org> <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
In-Reply-To: <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 May 2023 15:13:39 +0300
Message-ID: <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Olof Johansson <olof@lixom.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, 
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
Reply-To: linux-oxnas@groups.io,dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649143;
 bh=hQQGNHh04imYBrA4qeGrow3PMADE117/p7Nf8ffx71M=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=rGULkGNWA6FmpR4wa1ikwhkFAPgI9PydQVMCIRTUY0lIVolhSwLzRIHum/eATVJShn9
 SnmPTsu1uilzyHuJxjNABR6olpwboMxpfBi+HULNsB5iriAn/cLZ5tUl7bxMt/E1I1qAR
 QKx+5VKpV9RP+k0F0s2amFGmA7Ep4sWgVzA=

On Wed, 3 May 2023 at 13:39, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, May 3, 2023, at 03:17, Rob Herring wrote:
> > On Tue, May 2, 2023 at 5:52=E2=80=AFPM Dmitry Baryshkov <dmitry.baryshk=
ov@linaro.org> wrote:
> >> On 02/05/2023 22:40, Rob Herring wrote:
> >> >      'berlin' : 'berlin',
> >> >      'pxa2' : 'pxa',
> >> >      'pxa3' : 'pxa',
> >> >      'pxa' : 'marvell',
> >>
> >> I'd question if it makes sense to split the pxa line. Yes, it was sold
> >> by Intel to Marvell, but IIRC the devices still had some inheritance.
> >> So, if we have the 'pxa' subdir, I'd move Marvell PXAs to that dir too=
.
> >
> > I think I probably split it because it was different maintainers.
> > Though it doesn't look like pxa168 or pxa910 have any maintainer. They
> > are a mixture of pxa and mmp I think.
>
> I think the original split here is probably the best we can do,
> but there is no good way to do it because of the confusing naming
> and the problem that there is no clear line between pxa and mmp.
> As far as I can tell, the release timeline was:
>
> Intel pxa2xx (mach-pxa, xscale, still exists)
> Intel pxa3xx (mach-pxa, xscale, still exists)
> Intel pxa90x (never merged)
> Marvell pxa93x (mach-pxa, xscale, removed in Linux-6.3, no DT)
> Marvell pxa92x (never merged)
> Marvell pxa91x (mach-mmp, pj1, still exists)
> Marvell pxa168 (mach-mmp, pj1, still exists)
> Marvell pxa95x (mach-pxa, pj4, long gone)
> Marvell pxa688 (mach-mmp, pj4, known as mmp2)
>
> So with pxa93x out of the picture, we can simplify it as using
> 'pxa' as the name for all the above chips with an Intel XScale
> core, and 'marvell' for all the other ones that have a Marvell
> core and exist in mach-mmp.

Should it be 'intel' for pxa[23]xx then?

>
>      Arnd



--=20
With best wishes
Dmitry


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#270): https://groups.io/g/linux-oxnas/message/270
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


