Return-Path: <bounce+16102+267+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 906976FCB1F
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:02 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id s8wgYY1809624xPrEnUAohZa; Tue, 09 May 2023 09:19:01 -0700
X-Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
 by mx.groups.io with SMTP id smtpd.web10.15784.1683110603664994405
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 03:43:23 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 15E712B0695A;
	Wed,  3 May 2023 06:43:21 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 03 May 2023 06:43:23 -0400
X-ME-Sender: <xms:yDpSZPCqsf08zSuGB9S_Yyasjyfw8C7NFU4cOM__vE3LKtp5PZuGng>
    <xme:yDpSZFiEb6HH6H_58GlixH3G-nv3jp37AdKwTgdBGBFYH0DY8nzkEJ5mgat6Fv9LK
    KKIIOZPpYqGCV37HyY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:yDpSZKnB4jWJCZbdAILCLoQ7Tb1JDWaGOQ4QRvtfyLGkz3ZL_6SLDg>
    <xmx:yDpSZBy3OQb_c4T8ysdY1Cp9Lj863KLs0081WZpxCobqdPOlwPyYug>
    <xmx:yDpSZETjKdOdSUw3JxfayiFtx-J69d0-e3sxVxrEKYSU1TR-jv4gqw>
    <xmx:yDpSZAxATWHiqR3-vrO-mZXAs2G96Hf5p2LRUHruhuMW2qX03HsehI4wpP4>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4B4C0B60086; Wed,  3 May 2023 06:43:20 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <89dfb3e4-4009-4ed1-8cb0-d6ee16928caa@app.fastmail.com>
In-Reply-To: <20230503011920.GB31464@dragon>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <2783a3ba-8fcb-7e5f-3147-91d02e573ba4@kernel.org>
 <20230503011920.GB31464@dragon>
Date: Wed, 03 May 2023 12:43:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shawn Guo" <shawnguo@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>,
 "Christian Marangi" <ansuelsmth@gmail.com>,
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
X-Gm-Message-State: htXwjY0fHue9Uy05DW1xsJ4ex1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649141;
 bh=iCINsMUctuuwLNskiczsVLKqHgvVE0/uvwT8FGwGv7A=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=uthp1h/vUbPYnBXasuvvneCbJng7w25FGFZTdJcdcUAluRkYM46XhNUe2qqDAqq97oJ
 iR7zX2zp4o5lcoyD7IeO2zt/SJjMTgjQgm6vsvAMtdoUQzUfIQoZhw9ZwYUn/Sm3Brkpu
 cdgHq5PCKp+ZJ1zb8s4Q0w1NNUdNd9t+xQU=

On Wed, May 3, 2023, at 03:19, Shawn Guo wrote:
> On Tue, May 02, 2023 at 10:02:03PM +0200, Krzysztof Kozlowski wrote:
>> On 02/05/2023 21:40, Rob Herring wrote:
>> 
>> If I remember correctly, Vybrid are a bit closer to iMX than to LS
>> (Layerscape), but it should be Shawn's call (+Cc).
>
> I would suggest to have all Freescale/NXP platforms in a single
> directory, which includes all mxs, imx, fsl ones.

I'd go with 'nxp' for all of those then, and also include the lpc* ones.

It's fine to stay with historic names if changing it causes problems,
but if we are going to change anyway, then let's call it the current
owner's name. It will get messy again soon enough with the next round
of mergers and acquisitions.

      Arnd


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#267): https://groups.io/g/linux-oxnas/message/267
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


