Return-Path: <bounce+16102+252+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C3D6FCB04
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:18:01 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id ua9MYY1809624xCcAtgvuZEf; Tue, 09 May 2023 09:18:00 -0700
X-Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.15010.1682581617984518127
 for <linux-oxnas@groups.io>;
 Thu, 27 Apr 2023 00:46:58 -0700
X-Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-54f6f0dae19so63611307b3.0
        for <linux-oxnas@groups.io>; Thu, 27 Apr 2023 00:46:57 -0700 (PDT)
X-Gm-Message-State: k1hfE899xx04RP6ZoWDiUDxfx1808289AA=
X-Google-Smtp-Source: ACHHUZ7HaYVGM6nGvOsZRMBtBiMwPlSLSnZRX9H8DPPL23/8lo0L0BqQ0czcfVDQqt3pWI+jF9BS0A==
X-Received: by 2002:a81:8787:0:b0:556:1065:e6a8 with SMTP id x129-20020a818787000000b005561065e6a8mr654675ywf.2.1682581616622;
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
X-Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id h206-20020a816cd7000000b00545a0818479sm4629013ywc.9.2023.04.27.00.46.56
        for <linux-oxnas@groups.io>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
X-Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-54fb9b1a421so63640657b3.1
        for <linux-oxnas@groups.io>; Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
X-Received: by 2002:a0d:d712:0:b0:54e:ed46:6b39 with SMTP id
 z18-20020a0dd712000000b0054eed466b39mr582224ywd.31.1682581616022; Thu, 27 Apr
 2023 00:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com> <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
In-Reply-To: <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Apr 2023 09:46:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Ansuel Smith <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
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
Reply-To: linux-oxnas@groups.io,geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649080;
 bh=ud9OUfsZOCyAPs5oIjqs+bSdy+Zsjb3RGF4Jkqu6tow=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=l4myGsWFQTOSSW/Zibnbs2bTCY/lFl7AYImYTj/XJx4c0eXXAlsKs7KUmAC90kBrVWG
 jKhgbBXch6awdGAnmHeoZ6kw9pdokSilfcYMw/fT53KEXLdm5ec15oibgCj2aJwycSKnD
 9Lim9zxmnTDCUoag8QYdPF/LVzqHiNtzs4M=

On Thu, Apr 27, 2023 at 9:37=E2=80=AFAM Matthias Brugger <matthias.bgg@gmai=
l.com> wrote:
> On 25/04/2023 17:57, Rob Herring wrote:
> > On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >> On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.o=
rg> wrote:
> >>> I have a script[1] that does the conversion written the last time thi=
s
> >>> came up. Just have to agree on directory names. I think the easiest
> >>> would be for Arnd/Olof to run it at the end of a merge window before
> >>> rc1.
> >>
> >> "emev2" and "sh7" are missing for renesas.
> >
> > No doubt it's been bitrotting (or I may have missed some).
> >
> >> Does your script also cater for .dts files not matching any pattern,
> >> but including a .dtsi file that does match a pattern?
> >
> > I assume I built everything after moving, but maybe not...
> >
> > That's all just "details". First, we need agreement on a) moving
> > things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> > been stuck on a) for being 'too much churn'.
> >
>
> I think it makes sense to move them and probably the best way to do so is=
, as
> you proposed: that Arnd or Olof run the script to move them just before -=
rc1

FTR, no objections from my side.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#252): https://groups.io/g/linux-oxnas/message/252
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


