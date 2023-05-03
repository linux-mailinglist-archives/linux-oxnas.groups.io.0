Return-Path: <bounce+16102+266+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 9166F6FCB20
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:02 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 86cXYY1809624xMrUDRxB5SQ; Tue, 09 May 2023 09:19:01 -0700
X-Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
 by mx.groups.io with SMTP id smtpd.web10.15725.1683110360013258511
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 03:39:20 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 0B6772B069AF;
	Wed,  3 May 2023 06:39:16 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 03 May 2023 06:39:19 -0400
X-ME-Sender: <xms:1DlSZB7HiFiKBkbDk9Fv7gPm0PBlQwsViA2U0jrJ-zAvaGGXygjRfw>
    <xme:1DlSZO7Xv3BGjOkExLnmK9KmCr--oWstES3EN49SY5iNy2GzZvlcZGCBKUJPghkrI
    QHcpC3F6G8-6XDxIKM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:1DlSZIccd8i4Vx2LA8c2HM7NFtzw7mZtVBcV3SKmH2AQM6JbCF_CHQ>
    <xmx:1DlSZKLbrwHphpHQEODq666D9lh730jAC6AHGXPodgu0ZEkePvTEhA>
    <xmx:1DlSZFLUz-hUAS40dmSCJktAgcIF6Zhaiq8T6Xf-Uy8e1qyU5yr_Tg>
    <xmx:1DlSZAIqlEfAPQg-BumeZvu2_KmGcwHX44l_oJiCgrykutWtz2oOTfYnqQo>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E9F69B60086; Wed,  3 May 2023 06:39:15 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
In-Reply-To: 
 <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
 <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
Date: Wed, 03 May 2023 12:38:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
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
X-Gm-Message-State: uJXfAE92ixGwo57sa0QvaxfUx1808289AA=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649141;
 bh=3dQuC92bMEr7DxO3Sx6wCYowxzSQXEF0HW57tLuWejI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Y7krCKEylZNUq00wWfvJ8hN5aeLRbx6XhHll9ea+YyYvaAge8E2b9GYM4WIukVuK6BD
 kY5SxEp3hqwP53t9JmOnH2WMgZtWkIVG1wTpDzr4tMLhc2hTnchhB6VoIpHoA/bpij8tS
 dnA/U9mbl0fOP0H5rKllFIE6DRs9m/lx9v8=

On Wed, May 3, 2023, at 03:17, Rob Herring wrote:
> On Tue, May 2, 2023 at 5:52=E2=80=AFPM Dmitry Baryshkov <dmitry.baryshkov=
@linaro.org> wrote:
>> On 02/05/2023 22:40, Rob Herring wrote:
>> >      'berlin' : 'berlin',
>> >      'pxa2' : 'pxa',
>> >      'pxa3' : 'pxa',
>> >      'pxa' : 'marvell',
>>
>> I'd question if it makes sense to split the pxa line. Yes, it was sold
>> by Intel to Marvell, but IIRC the devices still had some inheritance.
>> So, if we have the 'pxa' subdir, I'd move Marvell PXAs to that dir too.
>
> I think I probably split it because it was different maintainers.
> Though it doesn't look like pxa168 or pxa910 have any maintainer. They
> are a mixture of pxa and mmp I think.

I think the original split here is probably the best we can do,
but there is no good way to do it because of the confusing naming
and the problem that there is no clear line between pxa and mmp.
As far as I can tell, the release timeline was:

Intel pxa2xx (mach-pxa, xscale, still exists)
Intel pxa3xx (mach-pxa, xscale, still exists)
Intel pxa90x (never merged)
Marvell pxa93x (mach-pxa, xscale, removed in Linux-6.3, no DT)
Marvell pxa92x (never merged)
Marvell pxa91x (mach-mmp, pj1, still exists)
Marvell pxa168 (mach-mmp, pj1, still exists)
Marvell pxa95x (mach-pxa, pj4, long gone)
Marvell pxa688 (mach-mmp, pj4, known as mmp2)

So with pxa93x out of the picture, we can simplify it as using
'pxa' as the name for all the above chips with an Intel XScale
core, and 'marvell' for all the other ones that have a Marvell
core and exist in mach-mmp.

     Arnd


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#266): https://groups.io/g/linux-oxnas/message/266
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


