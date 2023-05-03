Return-Path: <bounce+16102+273+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D56FCB26
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:07 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 6inrYY1809624xa3A75VKakN; Tue, 09 May 2023 09:19:06 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.18836.1683119823330030186
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 06:17:03 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E39E662D96
	for <linux-oxnas@groups.io>; Wed,  3 May 2023 13:17:02 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BEFC433AC
	for <linux-oxnas@groups.io>; Wed,  3 May 2023 13:17:01 +0000 (UTC)
X-Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso6031572e87.0
        for <linux-oxnas@groups.io>; Wed, 03 May 2023 06:17:01 -0700 (PDT)
X-Gm-Message-State: 4XsEQfAjVgPDnNL9wrNmdeA0x1808289AA=
X-Google-Smtp-Source: ACHHUZ4XoUscEY44VabA5tNDJYMyOoaF7CDhHSN63Jv4Bd86fg89uBNzW43NBIrFuEuIivWhSP0hKhXIoN/CJGAf91U=
X-Received: by 2002:ac2:5198:0:b0:4ed:b842:3a99 with SMTP id
 u24-20020ac25198000000b004edb8423a99mr934135lfi.59.1683119819681; Wed, 03 May
 2023 06:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org> <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com> <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
 <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com>
In-Reply-To: <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 May 2023 08:16:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
Message-ID: <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
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
Reply-To: linux-oxnas@groups.io,robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649146;
 bh=zSVdAcjKcCN4v0uD88f7xeFrYVelOpL6GJSRDVe4d3k=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=oVR/7cOOSEUbbDfmoOxQOqIKDj/a6znYH1zj0aYtBLnDsCZGVgsffSUpknYLoryRZV4
 lbzUJ3XWd+L5672jk8NC4T/4ZKkGq19EYBN8eWWf/NUX9p5a0GcHKV112KRtjMm6f5cn3
 usTlyUEdBX2ugua7ExqnUrUC1TSAubnKvho=

On Wed, May 3, 2023 at 7:19=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, May 3, 2023, at 14:13, Dmitry Baryshkov wrote:
> > On Wed, 3 May 2023 at 13:39, Arnd Bergmann <arnd@arndb.de> wrote:
>
> >> So with pxa93x out of the picture, we can simplify it as using
> >> 'pxa' as the name for all the above chips with an Intel XScale
> >> core, and 'marvell' for all the other ones that have a Marvell
> >> core and exist in mach-mmp.
> >
> > Should it be 'intel' for pxa[23]xx then?
>
> Probably yes, that would put it next to ixp4xx, which makes
> a lot of sense (same vintage, same cpu core), though it is
> a bit funny to have these together with lsi axxia and
> altera socfpga, both of which are also in the intel
> directory. socfpga is of course the only one that anybody
> at Intel cares about these days.

We could do a second level of directories here:

intel/pxa/
intel/ixp/
intel/socfpga/

arm64 broadcom dts files are structured that way.

Rob


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#273): https://groups.io/g/linux-oxnas/message/273
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


