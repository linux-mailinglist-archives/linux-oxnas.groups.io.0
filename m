Return-Path: <bounce+16102+219+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52F6D1D4C
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:42 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id EsjUYY1809624xYUdhPwWtyU; Fri, 31 Mar 2023 02:55:41 -0700
X-Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
 by mx.groups.io with SMTP id smtpd.web10.21328.1680170634524429333
 for <linux-oxnas@groups.io>;
 Thu, 30 Mar 2023 03:03:54 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id A6E105821FE;
	Thu, 30 Mar 2023 06:03:53 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 30 Mar 2023 06:03:53 -0400
X-ME-Sender: <xms:h14lZP2P6-1WML0tnHU0HdMdtZK3G6AdboBJze6kLEnEZTHVfufW-A>
    <xme:h14lZOG421saOUxl3VTrr1QErXRPxmod2xdJenKYhBULtUD7d6J8ovO92D02wTAv1
    7ZDE3mwId6_yOeP8ic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehkedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:h14lZP41dAmtiVu4ty1E8BBZ-9reNxwryxuQCN8Se8vdMAwQTZcBkg>
    <xmx:h14lZE2dCL5QmCe3baeT7FUMFxbuJwcm88C-9hfhLub0UJvmYVxYPg>
    <xmx:h14lZCHsPaycpm9MVz5soXkltYLZMmnIjjAwPs6W0AlziFmXAZIfJA>
    <xmx:iV4lZI76poFBm_RbGrZvSm-s7BW_iB7cNPqH9WgtDueAW0AKJy54Lg>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 423AFB60086; Thu, 30 Mar 2023 06:03:51 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <6a5bd3a3-87e0-4a24-89ca-d265b0817a95@app.fastmail.com>
In-Reply-To: <d7f36a28-0cae-a035-791b-363754aefeee@linaro.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-19-arnd@kernel.org>
 <d7f36a28-0cae-a035-791b-363754aefeee@linaro.org>
Date: Thu, 30 Mar 2023 12:03:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Christoph Hellwig" <hch@lst.de>,
 "Robin Murphy" <robin.murphy@arm.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 "Daniel Golle" <daniel@makrotopia.org>
Subject: Re: [linux-oxnas] [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: hk5VQDgWLibXxt6s8NWDPdUgx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256541;
 bh=9b/fcYebAazY2hgzrFpld7eksP1aebs6lDFmC7H4HMQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Wd76iKfFqgGxkEYwr5vsZju0CnGlK1IoP6TRRR1lDPxfNOkWUsf1aJ9+kmI4MJjuCY7
 aDOuGw4+98NUJi3gATAInaWhOBxw2pQiTUGuqZ3CqWPWf+6LAI/IlZsD3pF+mX0rlP3iQ
 XaE+kgvL7KqRrAIRDQVYcZkuU8UFYCATKao=

On Thu, Mar 30, 2023, at 09:48, Neil Armstrong wrote:
> On 27/03/2023 14:13, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The cache management operations for noncoherent DMA on ARMv6 work
>> in two different ways:
>> 
>>   * When CONFIG_DMA_CACHE_RWFO is set, speculative prefetches on in-flight
>>     DMA buffers lead to data corruption when the prefetched data is written
>>     back on top of data from the device.
>> 
>>   * When CONFIG_DMA_CACHE_RWFO is disabled, a cache flush on one CPU
>>     is not seen by the other core(s), leading to inconsistent contents
>>     accross the system.
>> 
>> As a consequence, neither configuration is actually safe to use in a
>> general-purpose kernel that is used on both MPCore systems and ARM1176
>> with prefetching enabled.
>> 
>> We could add further workarounds to make the behavior more dynamic based
>> on the system, but realistically, there are close to zero remaining
>> users on any ARM11MPCore anyway, and nobody seems too interested in it,
>> compared to the more popular ARM1176 used in BMC2835 and AST2500.
>> 
>> The Oxnas platform has some minimal support in OpenWRT, but most of the
>> drivers and dts files never made it into the mainline kernel, while the
>> Arm Versatile/Realview platform mainly serves as a reference system but
>> is not necessary to be kept working once all other ARM11MPCore are gone.
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> It's sad but it's the reality, there's no chance full OXNAS support will
> ever come upstream and no real work has been done for years.
>
> I think OXNAS support can be programmed for removal for next release,
> it would need significant work to rework current support to make it acceptable
> before trying to upstream missing bits anyway.

Ok, thanks for your reply!

To clarify, do you think we should plan for removal after the next
stable release (6.3, removed in 6.4), or after the next LTS
release (probably 6.6, removed in 6.7)? As far as I understand,
the next OpenWRT release (23.x) will be based on linux-5.15,
and the one after that (24.x) would likely still use 6.1, unless
they skip an LTS kernel.

     Arnd


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#219): https://groups.io/g/linux-oxnas/message/219
Mute This Topic: https://groups.io/mt/97946110/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


