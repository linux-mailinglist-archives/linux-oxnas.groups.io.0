Return-Path: <bounce+16102+271+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E76FCB24
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:06 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 3RfuYY1809624x3qkcqTS5HX; Tue, 09 May 2023 09:19:04 -0700
X-Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
 by mx.groups.io with SMTP id smtpd.web11.17531.1683116359733558096
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 05:19:20 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id EC55B580E9F;
	Wed,  3 May 2023 08:19:18 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 03 May 2023 08:19:18 -0400
X-ME-Sender: <xms:RlFSZG2wIaPMnUCk0D7KqEawInmE1-_L62J3SMA4TIiKKHKzfDgyXQ>
    <xme:RlFSZJEoTCzQnYtgSxDlGxz71cJ60UqBPCZrdIUO7FRmYYIysF7_zfY5NZdszx-a9
    tVhxfpZE7joCMW8F0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RlFSZO7j62MYeAlUvjyPb3-P6o-4wwc37gOw1kgDz6mbK1MgAuf_Mw>
    <xmx:RlFSZH1Mg0LO6HmIMFrk6mCZ0cidUx4fxvD5CE7W8Ze6Bg_1CeyB-w>
    <xmx:RlFSZJGjH26FpmK1DgB3wX_QvRn2oXlx3c4mHacW2b7FJimCP_viOQ>
    <xmx:RlFSZFVn9YA1CIDFg0IEtfl6qrxsa6dB5O8KF0d2IrthVw2W78sneA>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9F56BB60086; Wed,  3 May 2023 08:19:18 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com>
In-Reply-To: 
 <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
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
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
 <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
Date: Wed, 03 May 2023 14:18:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
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
X-Gm-Message-State: K0blRRttoX3XCP2nwMzPDzGyx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649144;
 bh=urmXre8Sz9MV291INqiS7MPAD4ucExqnCABcn1rmFFc=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=dAav7aq1R+Mha5ilkokz7YwaCPoTLWq9ot1w/BdtFxdcqJDOTakrrXr0MPPTg7rUbmg
 KlTFvQ9L98nxt6DYSROkM6tB5KW7Ur6VbFGNsWlbsli3Xa1xl8rJIbV8M1bVEQA9ZKYwX
 vXb4yfY9Wtui1IC1c9QrJ6P9vpJ3J/N2FiI=

On Wed, May 3, 2023, at 14:13, Dmitry Baryshkov wrote:
> On Wed, 3 May 2023 at 13:39, Arnd Bergmann <arnd@arndb.de> wrote:

>> So with pxa93x out of the picture, we can simplify it as using
>> 'pxa' as the name for all the above chips with an Intel XScale
>> core, and 'marvell' for all the other ones that have a Marvell
>> core and exist in mach-mmp.
>
> Should it be 'intel' for pxa[23]xx then?

Probably yes, that would put it next to ixp4xx, which makes
a lot of sense (same vintage, same cpu core), though it is
a bit funny to have these together with lsi axxia and
altera socfpga, both of which are also in the intel
directory. socfpga is of course the only one that anybody
at Intel cares about these days.

      Arnd


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#271): https://groups.io/g/linux-oxnas/message/271
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


