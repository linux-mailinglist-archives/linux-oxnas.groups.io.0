Return-Path: <bounce+16102+247+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D536E4171
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:17 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id uWXRYY1809624xTGQCyntW4e; Mon, 17 Apr 2023 00:42:16 -0700
X-Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
 by mx.groups.io with SMTP id smtpd.web11.11767.1681390329225874052
 for <linux-oxnas@groups.io>;
 Thu, 13 Apr 2023 05:52:09 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 5A7EC2B066F8;
	Thu, 13 Apr 2023 08:52:03 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 13 Apr 2023 08:52:06 -0400
X-ME-Sender: <xms:8fo3ZIGGcweoBIf29WNloFKKsICMp7uD7W3WGDtwvAzEbureoRK3kQ>
    <xme:8fo3ZBVH6htlD2rv7m0KIlRDqt5H_xpJqhWk8H5XXhJ6hTi8Y46KqzYekT6ZEcvP-
    iySV_XAsUXsef2fpLI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekkedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:8fo3ZCJ6WRNY0qBjN-s19TED1hDYTi9JrZ1EWdX72x5Uz5tiomDupw>
    <xmx:8fo3ZKH4DvlQ_zzGPiQu2mlSLPVJsJocFs7o5u97ykj5S3RFQKqVIQ>
    <xmx:8fo3ZOVGcI2r7KyDnkTbNlptbOhRxQn3piCwIrpYa2EmmVt1L7apJg>
    <xmx:8vo3ZLLx-tSRguyqR96OdIBkL35NPK3OPhvrjBvWAq6rBkTuILKinq3Ygk0>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3A89EB60086; Thu, 13 Apr 2023 08:52:01 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <66899d69-1339-4a61-8612-6f8e452b0b26@app.fastmail.com>
In-Reply-To: 
 <OS0PR01MB5922EDAFCD6DA0313DB99C5E86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-22-arnd@kernel.org>
 <OS0PR01MB5922EDAFCD6DA0313DB99C5E86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Date: Thu, 13 Apr 2023 14:51:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
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
 "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>
Subject: Re: [linux-oxnas] [PATCH 21/21] dma-mapping: replace custom code with generic implementation
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: L8dlt3byhF2Rf1cY9xMYDozpx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717336;
 bh=ozzL90rtYldnexa0ndqYGo+tJeoBO+pXB0lVF1yfKz8=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=nuLIEqc3I2H9oBnCBsSpSVb8SfgTXSenZI1WztDvESIFi8jPNWUa5ObnKltLi0sHcuT
 Wuy6mX2wAET0/4yVzXFJcKv+aveB8L1Cz4m/kA8t+/XWTtAKY43miScZyOXj2iQGJdaxS
 oww4BLJRHurZcCkgiaZ+3NAI6Vd58wev860=

On Thu, Apr 13, 2023, at 14:13, Biju Das wrote:
> Hi all,
>
> FYI, this patch breaks on RZ/G2L SMARC EVK board and Arnd will send V2 
> for fixing this issue.
>
> [10:53] <biju> [    3.384408] Unable to handle kernel paging request at 
> virtual address 000000004afb0080

Right, sorry about this, I accidentally removed the 'phys_to_virt()'
conversion on arm64.

     Arnd


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#247): https://groups.io/g/linux-oxnas/message/247
Mute This Topic: https://groups.io/mt/97970113/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


