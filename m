Return-Path: <bounce+16102+249+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF56FCB03
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:17:59 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id obSFYY1809624xcN7CK9v4l9; Tue, 09 May 2023 09:17:58 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.83253.1682438291856550081
 for <linux-oxnas@groups.io>;
 Tue, 25 Apr 2023 08:58:12 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E35A62BF2
	for <linux-oxnas@groups.io>; Tue, 25 Apr 2023 15:58:11 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EF7C433A4
	for <linux-oxnas@groups.io>; Tue, 25 Apr 2023 15:58:10 +0000 (UTC)
X-Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-b99dae893c0so2516709276.3
        for <linux-oxnas@groups.io>; Tue, 25 Apr 2023 08:58:10 -0700 (PDT)
X-Gm-Message-State: aCuMYVjSjxHYDCMi6GydZ2Gnx1808289AA=
X-Google-Smtp-Source: AKy350bpts/PPga3+dzd9vak+rbAaLdXpa4DHHS4UXvr1kLSlKfqR897O6l7AESMOVdvAuhJNuLkwu1gSc/085IiOR0=
X-Received: by 2002:a25:b097:0:b0:b97:f46:a2b8 with SMTP id
 f23-20020a25b097000000b00b970f46a2b8mr12284894ybj.17.1682438288965; Tue, 25
 Apr 2023 08:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
In-Reply-To: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 25 Apr 2023 10:57:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Message-ID: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
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
 q=dns/txt; s=20140610; t=1683649078;
 bh=9Xk5/lrh7DWpV6gOgSBmyH06PqKryKIkYmWUrRpvecQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Q7KuirluyH53KoNd+5Y+jKAS0GLPJdI4GAlH+vm4VacVkoQ25WVr589LRjBAWX7u/IZ
 BltHa9LC9fxr16n1f0YtOIuJvVZysFAgHsC0LhXcb0c/oH5U/rvQJexvCS8q4iqADHXzr
 m9KA5XlpVpfhxGWNuENoTEW9Fju5Q24Av4Y=

On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.org>=
 wrote:
> > I have a script[1] that does the conversion written the last time this
> > came up. Just have to agree on directory names. I think the easiest
> > would be for Arnd/Olof to run it at the end of a merge window before
> > rc1.
>
> "emev2" and "sh7" are missing for renesas.

No doubt it's been bitrotting (or I may have missed some).

> Does your script also cater for .dts files not matching any pattern,
> but including a .dtsi file that does match a pattern?

I assume I built everything after moving, but maybe not...

That's all just "details". First, we need agreement on a) moving
things to subdirs and b) doing it 1-by-1 or all at once. So far we've
been stuck on a) for being 'too much churn'.

One nice thing with subdirs is 'make CHECK_DTBS=3Dy
arch/arm/boot/dts/foo/' can build everything for a platform family
without having to mess with the kconfig. Maybe most folks don't care,
but I do. My CI job running schema checks looks like this to deal with
grouping the arm dts files (this list is probably out of date too, but
less so):

        if [ "$ARCH" =3D "arm" ]; then
            VENDOR_LIST=3D"alphascale alpine artpec aspeed axm bcm cx9
(ecx|highbank) \
              efm ep7 imx1 imx23 imx28 imx27 imx5 imx6 imx7 ls vf qcom \
              (am3|am4|am5|dra|keystone|omap|compulab|logicpd|elpida|motoro=
la-cpcap|da|dm)
\
              nspire armada dove kirkwood orion mvebu mmp2 berlin pxa
(arm-|integ|mps|ve) \
              (at91|sama|usb_|tny_|mpa1600|animeo_ip|aks-cdu|ethernut5|evk-=
pro3|pm9g45|ge86)
\
              exynos s3c s5p gemini (hisi|hi3|hip) mt meson moxa nuvo
lpc owl ox8 \
              (r7|r8|r9|emev2|sh73a|gr-|iwg) (rk|rv11) socfpga stm
(sti|st-pin) ste \
              spear (sun|axp) tegra uniph (vt8500|wm8) xen zynq"
        else
            VENDOR_LIST=3D$(ls arch/$ARCH/boot/dts/ | xargs)
        fi

Rob


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#249): https://groups.io/g/linux-oxnas/message/249
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


