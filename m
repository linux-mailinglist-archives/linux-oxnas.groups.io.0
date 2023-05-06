Return-Path: <bounce+16102+285+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6316FCB30
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:17 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id lDPTYY1809624xBfzy3XIIzz; Tue, 09 May 2023 09:19:15 -0700
X-Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
 by mx.groups.io with SMTP id smtpd.web10.29984.1683359607338467152
 for <linux-oxnas@groups.io>;
 Sat, 06 May 2023 00:53:27 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8739E580382;
	Sat,  6 May 2023 03:53:26 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 06 May 2023 03:53:26 -0400
X-ME-Sender: <xms:cwdWZIyxfxC9bvjRyqPyh0ib1bw6Vq3YOOk7GDOHuGHr104jlhllfw>
    <xme:cwdWZMR86By_Es81Fs24nFfL6mcjYvXqEeFR5y0ciKrGphskxtRvTK7MWwtAln-3I
    9slHMOPYz1bwza1C4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeu
    feefieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cwdWZKWPJSNKGJ1BoPCjHJFB41ohvbYc5lXNMEaSpXVx65fcImDOSA>
    <xmx:cwdWZGjTC32HbA-ZJkwR9iDyfFZL5rCJIdL47Ja82EI69IRoNBcwbA>
    <xmx:cwdWZKA3HC6RuBSTtV_3Bfdw9CRHScG4KYDshiiNwwwPwz9AjH93HQ>
    <xmx:dgdWZEwIsTjJdExHIHSo4sMn188isLdlE6P98sPFv2qrASynbBpX8w>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CB166B60086; Sat,  6 May 2023 03:53:23 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <b464c1e7-f185-46d1-8b15-9592fa0cfc25@app.fastmail.com>
In-Reply-To: 
 <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-10-arnd@kernel.org>
 <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
 <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
 <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Date: Sat, 06 May 2023 09:53:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Christoph Hellwig" <hch@lst.de>,
 linux-kernel@vger.kernel.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
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
 "Max Filippov" <jcmvbkbc@gmail.com>,
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
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [linux-oxnas] [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional DMA
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: WvV6xhSiEv1SFLKi4mbypZtax1808289AA=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649155;
 bh=gd/UFce0x04+0SKFw0TsXlGaZYTXvV7RIOxF6j5QMO4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=u9fIa6UHL7K2ZI7yQ+jmV2jfU3ZWMOqBti0e8S4U/6puVw0S6O3CUAT9rN9+v1hcJQT
 oARkUwhE0AM4c7eoRcPtdrK+8Ow1BjFO+jltsLdVaH556iBCTidtfzzBHXPkuX1sWVzve
 +Ncfz5g0UDz+BKfobuKHjcN5cZY0K0YTtG4=

On Sat, May 6, 2023, at 09:25, Guo Ren wrote:
> On Fri, May 5, 2023 at 9:19=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>>
>> This is something we can consider. Unfortunately, this is something
>> that no architecture (except pa-risc, which has other problems)
>> does at the moment, so we'd probably need to have a proper debate
>> about this.
>>
>> We already have two conflicting ways to handle DMA_FROM_DEVICE,
>> either invalidate/invalidate, or clean/invalidate. I can see
> I vote to invalidate/invalidate.
>
...
>
>> that flush/invalidate may be a sensible option as well, but I'd
>> want to have that discussion after the series is complete, so
>> we can come to a generic solution that has the same documented
>> behavior across all architectures.
> Yes, I agree to unify them into a generic solution first. My proposal
> could be another topic in the future.

Right, I was explicitly trying to exclude that question from my
series, and left it as an architecture specific Kconfig option
based on the current behavior.

>> In particular, if we end up moving arm64 and riscv back to the
>> traditional invalidate/invalidate for DMA_FROM_DEVICE and
>> document that driver must not rely on buffers getting cleaned
> After invalidation, the cache lines are also cleaned, right? So why do
> we need to document it additionally?

I mentioned the debate in the cover letter, the full explanation
is archived at
https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/

In short, the problem that is addressed here is leaking sensitive
kernel data to user space or a device as in this sequence:

1. A DMA buffer is allocated in the kernel and contains stale data
   that is no longer needed but must not be exposed to untrusted
   userspace, i.e. encryption keys or user file pages
2. allocator uses memset() to clear out the buffer
3. buffer gets mapped into a device for DMA_FROM_DEVICE
4. writeback cache gets invalidated, uncovering the sensitive
   data by discarding the zeros
5. device returns less data than expected
6. buffer is unmapped
7. whole buffer is mapped or copied to user space

Will added his patch for arm64 to prevent this scenario by using
'clean' instead of 'invalidate' in step 4, and the same behavior
got copied to riscv but not most of the other architectures.
The dma-mapping documentation does not say anything about this
case, and an alternative approach would be to document that
device drivers must watch out for short reads in step 5, or that
kzalloc() should clean the cache in step 2. Both of these come
at a cost as well.

     Arnd


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#285): https://groups.io/g/linux-oxnas/message/285
Mute This Topic: https://groups.io/mt/97970101/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


