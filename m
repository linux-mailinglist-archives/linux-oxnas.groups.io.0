Return-Path: <bounce+16102+281+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D66FCB2F
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:17 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id TJKfYY1809624xn2zSjifyG8; Tue, 09 May 2023 09:19:15 -0700
X-Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
 by mx.groups.io with SMTP id smtpd.web10.47586.1683200710473827033
 for <linux-oxnas@groups.io>;
 Thu, 04 May 2023 04:45:10 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 7F8E7580E74;
	Thu,  4 May 2023 07:45:09 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 04 May 2023 07:45:09 -0400
X-ME-Sender: <xms:xJpTZBRFDKFjpUX2zSPaH_4Nc8R2Qpk2no6uSQvOfRDhdZKlcM2S1w>
    <xme:xJpTZKx9r-aiclDw81Wu7rGAVEGjfn7b8plKzDI0Fm4sbn8ToKgyao_lHGOMzamjl
    uNZIJ6W5xJhlsHwBQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeftddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xJpTZG1ikd38RTtD1R071POfBXt5S1hFZ6Fml4H3RBTwbc4m3wVYQA>
    <xmx:xJpTZJBCtHzUiKeZoBrJeZc8fH8Ed5ISfh9DPuxYIqK6axwqLg053Q>
    <xmx:xJpTZKh7kYU5y_FppCdiasiBdQUPjv6lvIKqgolP6FEiBuWg49SF6g>
    <xmx:xZpTZKDU9-4LKKK2Ti8y1N5SEny0C66Vm4BJmIaG1feFi_OTmPFchA>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5DF60B60089; Thu,  4 May 2023 07:45:08 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <6ece505b-1075-48e6-9ff9-1673014e5df1@app.fastmail.com>
In-Reply-To: <ZFOE4wd31hpJh0ro@shell.armlinux.org.uk>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <ZFOE4wd31hpJh0ro@shell.armlinux.org.uk>
Date: Thu, 04 May 2023 13:44:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>, "Rob Herring" <robh+dt@kernel.org>
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
X-Gm-Message-State: L8x6t8LQHjPRkSvD8JbWvWiUx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649155;
 bh=AE/hO7hnq5abNT3ZFbv8ouhAg4QnBJrh+LdeU7snpUk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=XUEiIbB36Wc8yYjp35GNtoorfs2xXT8FMAyRvH77TT9BjvpelCEZ+NzLproAQGKyiY+
 kWXrzHKayRLNi9zSgLEnhBjC/IIxIMKmhxRshFBiX4/0zOQcnosWdnLsRk4vNcE+RFJh7
 tJI+MO4zzo/T8L45qaql4UowrpVpncFHdLw=

On Thu, May 4, 2023, at 12:11, Russell King (Oracle) wrote:
> On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
>> I think the only issue remaining is finalizing the mapping of
>> platforms to subdirs. What I have currently is a mixture of SoC
>> families and vendors. The most notable are all the Freescale/NXP
>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>> either. Once that's finalized, I still need to go update MAINTAINERS.
>
> I haven't followed this discussion at all, so here's a question.
>
> What does this mean for the _installed_ dtb files? Do they move
> location? If they do, lots is going to break, because there will
> be u-boot configurations and other scripts that assume the flat
> directory structure for the installed dtb files.
>
> I don't think changing the installed dtb structure is acceptable
> at this point in time. It's something that _should_ have been
> thought about when ARM was converted to dtb, it's too late to be
> changing that now.

Rob said earlier that his script does keep a flat directory
for the output of 'make dtbs_install'.

     Arnd


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#281): https://groups.io/g/linux-oxnas/message/281
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


