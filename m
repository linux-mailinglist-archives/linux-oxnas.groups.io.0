Return-Path: <bounce+16102+272+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1426FCB25
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:07 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 8ht8YY1809624xzVOH50IrTK; Tue, 09 May 2023 09:19:06 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.18633.1683119344275496308
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 06:09:04 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDDF262B15
	for <linux-oxnas@groups.io>; Wed,  3 May 2023 13:09:03 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F69FC433A0
	for <linux-oxnas@groups.io>; Wed,  3 May 2023 13:09:03 +0000 (UTC)
X-Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ac675d84b5so17511571fa.3
        for <linux-oxnas@groups.io>; Wed, 03 May 2023 06:09:03 -0700 (PDT)
X-Gm-Message-State: j5P1D1ehMDLCtkxBw2qPsuTYx1808289AA=
X-Google-Smtp-Source: ACHHUZ50B+ONgazRTst79ZMphnWydxujQ+xpsmD1oxBiJc6OIwSZRmXeOONoaPS4VdIBDlX9Htpoiog7d0wWQm74E6U=
X-Received: by 2002:a2e:80ca:0:b0:2a5:f82e:e2a6 with SMTP id
 r10-20020a2e80ca000000b002a5f82ee2a6mr239ljg.47.1683119341121; Wed, 03 May
 2023 06:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
In-Reply-To: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 May 2023 08:08:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL-WMNxHrgCzn=LfH6gpE_Yb3uRwo97ssHPoZenK3CEeQ@mail.gmail.com>
Message-ID: <CAL_JsqL-WMNxHrgCzn=LfH6gpE_Yb3uRwo97ssHPoZenK3CEeQ@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, 
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
 q=dns/txt; s=20140610; t=1683649146;
 bh=1IPRxS6iVWtUa7D1kCNrAU7wynLgyp/5Na1OWpbrP1Q=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=F6QoqSdxlpXYQFxlj9sTwTv33Xzgo4gUxhJBCRT7K2bCbewICB87O2FMVGMJG6BuEdV
 kNcjlDF9JB9N8fu6nFmsfGL551UljZ0zvUa0QssKI2g9d0oGOB/HD+vSCFzfCZ2hycMJc
 TCj30x4xdZbxYpURICNHa0gZASpdL1tzt1w=

On Wed, May 3, 2023 at 6:02=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 2, 2023, at 21:40, Rob Herring wrote:
> > On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
>
> > vendor_map =3D {
> >     'alphascale' : 'alphascale',
> >     'alpine' : 'alpine',
>
> I would make this one 'amazon' if we go with current manufacturers.
>
> >     'nspire' : 'nspire',
>
> nspire is the name of the end-user product, so that doesn't quite
> fit. The SoC was apparently an LSI logic Zevio, which is now owned
> by Broadcom.

I'm inclined to leave it. I put it in the category of a one-off thing
that's not sharing anything

> >     'mvebu' : 'marvell',
> >     'mmp' : 'marvell',
> >     'berlin' : 'berlin',
>
> While berlin is related to pxa/mmp, this one is now owned
> by Synaptics, and the 64-bit versions are already in the
> synaptics subdir, so I'd go with teh same here.
>
> >     'openbmc' : 'aspeed',
> >     'en7' : 'airoha',
>
> airoha is a separate company now, but the hardware is still
> shared with mediatek, so we could consider lumping it into
> that subdir, but a separate one may be better long-term.
>
> >     'gemini' : 'gemini',
>
> This one is also a product name, not a company. Apparently,
> gemini was originally made by Storm Semiconductor, and then
> by Cortina, which was subsequently acquired by Inphi, and that ended
> up in Marvell after the product was already discontinued.
>
> Out of the four, I'd probably go with 'cortina' as the
> directory name.

I had 'cortina' previously. Linus wanted gemini...

Rob


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#272): https://groups.io/g/linux-oxnas/message/272
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


