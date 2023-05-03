Return-Path: <bounce+16102+268+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4D6FCB21
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:04 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 4vAIYY1809624xTNGYisddNo; Tue, 09 May 2023 09:19:03 -0700
X-Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
 by mx.groups.io with SMTP id smtpd.web11.16192.1683111757179523667
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 04:02:37 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 6C7392B0671E;
	Wed,  3 May 2023 07:02:32 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 03 May 2023 07:02:34 -0400
X-ME-Sender: <xms:Rj9SZKlTTnbDiHX55Z0zVK4RRHqTtD34Ic0kr9gu8LXRZUd5vW1sNQ>
    <xme:Rj9SZB2RRbTSlfnvoyCiq-CjuDURcGdNgs5GoDJl4qCHFJ5-ZHoIvp9bWKCYjpXN-
    ODT0WgrXyw40LeC0sc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Rj9SZIovGybcnhaYiLbWAMPNr2wtxMzL-NEtbKfgejz2jVx79Q3BOw>
    <xmx:Rj9SZOmlZGrdb2-rGVi2XdPxahue8H13hkdPES4NDGwCeY-jXgd-ew>
    <xmx:Rj9SZI2--fY13skOLwZ1x9wt_VRgsao0yXJv8XyToKLEhPijWfOSBw>
    <xmx:SD9SZMJstDJSwk6E9VhGeSPmli8W6KuMDF8H4lCfg1AWmdfP8FfC5WnUfw0>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B77FBB6008D; Wed,  3 May 2023 07:02:30 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
In-Reply-To: 
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Date: Wed, 03 May 2023 13:02:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>,
 "Christian Marangi" <ansuelsmth@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: j7BJrSCLvPJS4TDilw625umZx1808289AA=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649143;
 bh=Iszy/DzsuBRbuDawas0Lsvk5ILpY4JDFTtxuQw1B6iI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=VjDxoLKSTU++USH05V60/yIC3tZ0B6YoyeKP1o6PIgaKo5Uz+Th2v3xnP+U4cR9ul+g
 PzwMcriJvPUsJGFnMIY7q3PUVsq0pLWPVmCxVC90q8KIovubxQHDkcbEOk2tSbT7HT/Gf
 eFhmYQx9LvwXnMRerRKE+5sX+a+CXF2dfR8=

On Tue, May 2, 2023, at 21:40, Rob Herring wrote:
> On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:

> vendor_map =3D {
>     'alphascale' : 'alphascale',
>     'alpine' : 'alpine',

I would make this one 'amazon' if we go with current manufacturers.

>     'nspire' : 'nspire',

nspire is the name of the end-user product, so that doesn't quite
fit. The SoC was apparently an LSI logic Zevio, which is now owned
by Broadcom.

>     'mvebu' : 'marvell',
>     'mmp' : 'marvell',
>     'berlin' : 'berlin',

While berlin is related to pxa/mmp, this one is now owned
by Synaptics, and the 64-bit versions are already in the
synaptics subdir, so I'd go with teh same here.

>     'openbmc' : 'aspeed',
>     'en7' : 'airoha',

airoha is a separate company now, but the hardware is still
shared with mediatek, so we could consider lumping it into
that subdir, but a separate one may be better long-term.

>     'gemini' : 'gemini',

This one is also a product name, not a company. Apparently,
gemini was originally made by Storm Semiconductor, and then
by Cortina, which was subsequently acquired by Inphi, and that ended
up in Marvell after the product was already discontinued.

Out of the four, I'd probably go with 'cortina' as the
directory name.

>     'meson' : 'meson',

-> amlogic

>     'moxa' : 'moxa',
>     'mstar' : 'mstar',

-> sigmastar

>     'nuvo' : 'nuvoton',
>     'lpc' : 'lpc',

-> nxp

>     'lan96' : 'microchip',
>     'owl' : 'actions',
>     'ox8' : 'oxsemi',
>     'rda' : 'rda',

-> unisoc

>     'rtd' : 'realtek',
>     'r7' : 'renesas',
>     'r8' : 'renesas',
>     'r9' : 'renesas',
>     'emev2' : 'renesas',
>     'sh73a' : 'renesas',
>     'gr-' : 'renesas',
>     'iwg' : 'renesas',
>     'rk' : 'rockchip',
>     'rv11' : 'rockchip',
>     'rockchip' : 'rockchip',
>     'socfpga' : 'socfpga',

-> intel

>     'stm' : 'stm32',
>     'sti' : 'sti',
>     'st-pin' : 'sti',
>     'ste' : 'st-ericsson',
>     'spear' : 'spear',

I would put all five of these into 'st'. The ux500 was developed
in st-ericsson, but last sold by st, and the other ones are all
original st products.

      Arnd


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#268): https://groups.io/g/linux-oxnas/message/268
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


