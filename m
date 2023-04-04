Return-Path: <bounce+16102+240+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 764666E416E
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:14 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 3LDUYY1809624xX3aFTJRaHD; Mon, 17 Apr 2023 00:42:13 -0700
X-Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.103506.1680619090885788043
 for <linux-oxnas@groups.io>;
 Tue, 04 Apr 2023 07:38:11 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2F05C5C01F2;
	Tue,  4 Apr 2023 10:38:10 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 10:38:10 -0400
X-ME-Sender: <xms:UTYsZBLorW3tY1zvMVXFZ3cesNHjStT3_cAERzTNsPh-RuGoCaQwog>
    <xme:UTYsZNIXGsY7cUMXDMq6OUsdUkmDQ40Df7xp551uroEON2zAPdvVNV9AUPjjxR8NS
    EaKHeZnVuXntXX29q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:UTYsZJsoe9PDD-rYNjFgQI2PDvcryRL0jjSxURUOU9l3PKBlaJLTyQ>
    <xmx:UTYsZCb4ss_ynHnXy58sM82agjBS7wtX0LULG8LN3ki3bL7Ob_yx7Q>
    <xmx:UTYsZIaQcS1DusLJtm20XsqyRjnID-_wHaEdYN19p1stfERLI0b2Qw>
    <xmx:UjYsZFRQFboUXJEt3Cflxf20i3V5-mgACuvv0DbqkAts1zPrlYp7Zw>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8B3B8B60092; Tue,  4 Apr 2023 10:38:09 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <86d63038-e3f5-4c03-b904-a26761b0578d@app.fastmail.com>
In-Reply-To: 
 <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
References: 
 <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
Date: Tue, 04 Apr 2023 16:37:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, soc@kernel.org,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Daniel Golle" <daniel@makrotopia.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [linux-oxnas] [PATCH RFC v2 0/4] ARM: oxnas support removal
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: PfRdSZFPjvmLl3IqySASgCpAx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717333;
 bh=qA6nQE6owdiWFRzPqBBzWMtwsxrbEHzfLm9KsE8a7h0=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=K4wp4GJ/xC2/M9mcA0C84VhC89sXtofgpH0kyUM+GcZ6KN8CnKdUxSWWVV1wHHUBIsu
 ZLSM1vhnWPi1KuNNxAbnDDotIVycJu8RyP4O+MXcp9MQ7bQooat1lS6VAoGq4Tnk8fqCX
 s5KukYFMuiw6sfBjA9Ag+dfjluI5ILPwL/o=

On Mon, Apr 3, 2023, at 09:42, Neil Armstrong wrote:
> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration to
> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
>
> In addition, the OX810 hasn't been booted for years and isn't even present
> in an ARM config file.
>
> For the OX820, lack of USB and SATA support makes the platform not usable
> in the current Linux support and relies on off-tree drivers hacked from the
> vendor (defunct for years) sources.
>
> The last users are in the OpenWRT distribution, and today's removal means
> support will still be in stable 6.1 LTS kernel until end of 2026.
>
> If someone wants to take over the development even with lack of SMP, I'll
> be happy to hand off maintainance.
>
> The plan is to apply the first 4 patches first, then the drivers
> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>

I merged all four into the soc tree now, thanks!

     Arnd


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#240): https://groups.io/g/linux-oxnas/message/240
Mute This Topic: https://groups.io/mt/98030323/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


