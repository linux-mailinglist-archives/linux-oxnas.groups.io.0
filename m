Return-Path: <bounce+16102+276+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id D59246FCB2A
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:11 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id D3PoYY1809624xuJ0lInOkff; Tue, 09 May 2023 09:19:10 -0700
X-Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.33299.1683146408536254408
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 13:40:08 -0700
X-Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so5624800276.0
        for <linux-oxnas@groups.io>; Wed, 03 May 2023 13:40:08 -0700 (PDT)
X-Gm-Message-State: cI4PzPiWMLws0P5erHjDfKK3x1808289AA=
X-Google-Smtp-Source: ACHHUZ504wPVYlURitbUXR0w6GF5Hd5chFJsuF27bLfRTjvW8/vWf4wN9zc7VHWrnnoXqNvPfLtTOnqfU50Ll8hIGF4=
X-Received: by 2002:a25:656:0:b0:b25:a1e1:5b65 with SMTP id
 83-20020a250656000000b00b25a1e15b65mr3778724ybg.5.1683146407758; Wed, 03 May
 2023 13:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org> <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com> <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
 <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com> <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
 <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
In-Reply-To: <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 May 2023 22:39:55 +0200
Message-ID: <CACRpkdZBFqhoK7WhERX8yfBHL8kxYqnOZGgBCcWaHpT8qB2S4Q@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, 
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
Reply-To: linux-oxnas@groups.io,linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649150;
 bh=7gnP1l7NQWnHybI4CqaBw5k856O4Vsjcioi8Swb0myw=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=fmMJXzDLrbfhKXdy23yfSFHJUbcrFCGboxeNb4viGp3iM7ef1JUFfhlXfOMgfhOl3SW
 fGombPXGKMNVlb3x07Tf4qU9GN0b5oihsjcv2O9BReF+Nm4MBkkz6Zh38YcjDZRF5sQxn
 YIzqPFBZWE481m4F5uQ3KDX2S0jzgpLb+i4=

On Wed, May 3, 2023 at 10:37=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Wed, May 3, 2023, at 15:16, Rob Herring wrote:
>
> > We could do a second level of directories here:
>
> Works for me, but at that point, I'd really also want to do it
> for nxp with its five or more product lines (mxs, imx, lpc,
> s32, layerscape, vybrid)
>
> > intel/pxa/
> > intel/ixp/
> > intel/socfpga/
>
> and intel/axxia I guess.

This looks neat. I like it.

Yours,
Linus Walleij


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#276): https://groups.io/g/linux-oxnas/message/276
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


