Return-Path: <bounce+16102+258+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EDB6FCB0B
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:18:07 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id cAA1YY1809624xAhMNHeSogS; Tue, 09 May 2023 09:18:06 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.3154.1683062875045547204
 for <linux-oxnas@groups.io>;
 Tue, 02 May 2023 14:27:55 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71D63621DE
	for <linux-oxnas@groups.io>; Tue,  2 May 2023 21:27:54 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD09C4339C
	for <linux-oxnas@groups.io>; Tue,  2 May 2023 21:27:53 +0000 (UTC)
X-Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2a8db10a5d4so44498681fa.1
        for <linux-oxnas@groups.io>; Tue, 02 May 2023 14:27:53 -0700 (PDT)
X-Gm-Message-State: fduupn0BicD0NGUfiZzsjeitx1808289AA=
X-Google-Smtp-Source: ACHHUZ4VmzJ58Blp8vkFEMpnZTP3rUtg0aygjDIMYeTMpSWAwJvPoANOd1LtrOl749GRPWYY5WO4jHHB7hvvVyp4ngc=
X-Received: by 2002:a2e:860b:0:b0:2a8:bb99:250d with SMTP id
 a11-20020a2e860b000000b002a8bb99250dmr5156347lji.6.1683062871907; Tue, 02 May
 2023 14:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
In-Reply-To: <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 16:27:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Linus Walleij <linus.walleij@linaro.org>
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
 q=dns/txt; s=20140610; t=1683649086;
 bh=KI4cWTjjm4HPQFkyiNAK0swk9sYMx+KFICMGMm5v+P8=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=LnzuTVAWt997aTCb5ZR/I1y7utrKjt47FSF0Srx1vl8BgujLPsfz92JV2vEOKJcwn8s
 iy7rpcbG8FwCR4lxVoI9ka6xLtifTXuQ8qDZOu62ReMsbODSe2HXS7lGMawzaD87JGjJv
 beT+tFBLSSfu/R08PerY2cdk8wyGVCsbevY=

On Tue, May 2, 2023 at 4:19=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, May 2, 2023 at 9:40=E2=80=AFPM Rob Herring <robh+dt@kernel.org> w=
rote:
>
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
>
> I see my nits were fixed like I wanted them, and it's now mostly a
> mix of soc and vendor names that make sense so from my point of view:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> NB:
> arch/arm64/boot/dts/arm$
> vexpress-v2m-rs1.dtsi -> ../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi
>
> This still works after the script, yes?

Yes, because in the script I do:

git grep -l -F "vexpress-v2m-rs1" arch/arm64/boot/dts | xargs perl -p
-i -e "s/vexpress-v2m-rs1/arm\/arm\/vexpress-v2m-rs1/"

Rob


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#258): https://groups.io/g/linux-oxnas/message/258
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


