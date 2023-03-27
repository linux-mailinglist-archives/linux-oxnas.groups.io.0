Return-Path: <bounce+16102+209+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF16D1D3A
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:32 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id NoFlYY1809624xO64t3QD57q; Fri, 31 Mar 2023 02:55:30 -0700
X-Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
 by mx.groups.io with SMTP id smtpd.web11.34267.1679922150064445582
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 06:02:30 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 01DFD582160;
	Mon, 27 Mar 2023 09:02:29 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 27 Mar 2023 09:02:29 -0400
X-ME-Sender: <xms:4JMhZKEbJtHy_-7r0mhUuAf1RDVX6ONGet-C4uHDHI8aFxDwJeBTbg>
    <xme:4JMhZLWFbqjeW-l2s4SA4L2AsblAYcYuZ6OQ60CbfoemRcndoOUNn99kWSsbLC3eM
    b-EfXBxvzBJwVrahuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4JMhZELkazMXWEydSMGlmDWOa0OVgB7P_WKB0YhrlPTlihQYux3WDg>
    <xmx:4JMhZEHovsEueCzwFyZ_7j_02sVES08XwzN6GBrtdqzrQFX09dmI0A>
    <xmx:4JMhZAUOI7kSkdg94xSzJhhTWcVlrr09q_AxuFUHeLD9-JISNVRWQg>
    <xmx:5JMhZP2bf1MV6jKd0e2JRv6hBv-xH3H71MSGG9ZG8p0hNuqV3tmOJw>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 75C74B60086; Mon, 27 Mar 2023 09:02:24 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-236-g06c0f70e43-fm-20230313.001-g06c0f70e
Mime-Version: 1.0
Message-Id: <a0b2c6a1-9f9a-490a-af1b-52d856102bc7@app.fastmail.com>
In-Reply-To: <52eef604-085e-acf9-f3ee-41ba9d8441d2@csgroup.eu>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-7-arnd@kernel.org>
 <52eef604-085e-acf9-f3ee-41ba9d8441d2@csgroup.eu>
Date: Mon, 27 Mar 2023 15:02:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
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
Subject: Re: [linux-oxnas] [PATCH 06/21] powerpc: dma-mapping: minimize for_cpu flushing
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: Yf5RGFmGLIUxlvmxceZilf1vx1808289AA=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256530;
 bh=NlgrxqszVwIWSO6oGnxj2ATvTiTUF02W2lSqXwv5v1g=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=ZujUm8m868wo8gpFutznphz+9p+H1r5t5OWz6+8yu3vGBhjQfmkVNreavLD8MM9CydT
 UDrOPp8TE7g5wMlc7mrHjhaOQg4Cq+G3u+ECcQZ++qvxcrNklA1n0697qarGokpXEC6Eg
 F7eSxOBOUls/f0wpkav+701dQNkAxTeUMzQ=

On Mon, Mar 27, 2023, at 14:56, Christophe Leroy wrote:
> Le 27/03/2023 =C3=A0 14:13, Arnd Bergmann a =C3=A9crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The powerpc dma_sync_*_for_cpu() variants do more flushes than on other
>> architectures. Reduce it to what everyone else does:
>>=20
>>   - No flush is needed after data has been sent to a device
>>=20
>>   - When data has been received from a device, the cache only needs to
>>     be invalidated to clear out cache lines that were speculatively
>>     prefetched.
>>=20
>> In particular, the second flushing of partial cache lines of bidirection=
al
>> buffers is actively harmful -- if a single cache line is written by both
>> the CPU and the device, flushing it again does not maintain coherency
>> but instead overwrite the data that was just received from the device.
>
> Hum ..... Who is right ?
>
> That behaviour was introduced by commit 03d70617b8a7 ("powerpc: Prevent=
=20
> memory corruption due to cache invalidation of unaligned DMA buffer")
>
> I think your commit log should explain why that commit was wrong, and=20
> maybe say that your patch is a revert of that commit ?

Ok, I'll try to explain this better. To clarify here: the __dma_sync()
function in commit 03d70617b8a7 is used both before and after a DMA,
but my patch 05/21 splits this in two, and patch 06/21 only changes
the part that gets called after the DMA-from-device but leaves the
part before DMA-from-device unchanged, which Andrew's patch
addressed.

As I mentioned in the cover letter, it is still unclear whether
we want to consider this the expected behavior as the documentation
seems unclear, but my series does not attempt to answer that
question.

     Arnd


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#209): https://groups.io/g/linux-oxnas/message/209
Mute This Topic: https://groups.io/mt/97970098/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


