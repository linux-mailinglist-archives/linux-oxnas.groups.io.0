Return-Path: <bounce+16102+284+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF76FCB31
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:18 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id wUQaYY1809624xOv9u9m1Eaa; Tue, 09 May 2023 09:19:17 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.29808.1683357976857510286
 for <linux-oxnas@groups.io>;
 Sat, 06 May 2023 00:26:17 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28379614D7
	for <linux-oxnas@groups.io>; Sat,  6 May 2023 07:26:16 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DD4C433D2
	for <linux-oxnas@groups.io>; Sat,  6 May 2023 07:26:15 +0000 (UTC)
X-Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ac785015d6so28761141fa.0
        for <linux-oxnas@groups.io>; Sat, 06 May 2023 00:26:15 -0700 (PDT)
X-Gm-Message-State: p4D4j1hEhaV9ZiMrpEnZRi36x1808289AA=
X-Google-Smtp-Source: ACHHUZ4qS4i5Im7J3Ox7v0tb1ueCK3xmeH5uM44ArLR4roviIMhnWXngkOBBuBeiDbJ5qp2UGTwR6EkhF28IpBmVniU=
X-Received: by 2002:a17:907:3d9f:b0:959:5454:1db7 with SMTP id
 he31-20020a1709073d9f00b0095954541db7mr3511012ejc.3.1683357953246; Sat, 06
 May 2023 00:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-10-arnd@kernel.org>
 <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com> <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
In-Reply-To: <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 6 May 2023 15:25:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Message-ID: <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional DMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,guoren@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649157;
 bh=0a6WL3BObkBtfOjgRjTMIp6r2mOjSxA/s/yZ7xdLZg0=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=DFQC7gfdnY1IFfWCXhFmw9YZqhw+GSqx/oQPaprySfAAHsRCAeCnvigtJeOH2hen1nS
 r+wnxq02xWODtmEx5+/dMQ5epGLtoyI2vN8QOii57bL+NjGN2GLQj+th+H5kBpmKVudfH
 eA4tZaEBJ9jBfEvdvNj5Wdc+mRIUWPFcC7A=

On Fri, May 5, 2023 at 9:19=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 5, 2023, at 07:47, Guo Ren wrote:
> > On Mon, Mar 27, 2023 at 8:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>
> >>
> >> riscv also invalidates the caches before the transfer, which does
> >> not appear to serve any purpose.
> > Yes, we can't guarantee the CPU pre-load cache lines randomly during
> > dma working.
> >
> > But I've two purposes to keep invalidates before dma transfer:
> >  - We clearly tell the CPU these cache lines are invalid. The caching
> > algorithm would use these invalid slots first instead of replacing
> > valid ones.
> >  - Invalidating is very cheap. Actually, flush and clean have the same
> > performance in our machine.
>
> The main purpose of the series was to get consistent behavior on
> all machines, so I really don't want a custom optimization on
> one architecture. You make a good point about cacheline reuse
> after invalidation, but if we do that, I'd suggest doing this
> across all architectures.
Yes, invalidation of DMA_FROM_DEVICE-for_device is a proposal for all
architectures.

>
> > So, how about:
> >
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoh=
erent.c
> > index d919efab6eba..2c52fbc15064 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -22,8 +22,6 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size=
_t size,
> >                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> >                 break;
> >         case DMA_FROM_DEVICE:
> > -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> > -               break;
> >         case DMA_BIDIRECTIONAL:
> >                 ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> >                 break;
>
> This is something we can consider. Unfortunately, this is something
> that no architecture (except pa-risc, which has other problems)
> does at the moment, so we'd probably need to have a proper debate
> about this.
>
> We already have two conflicting ways to handle DMA_FROM_DEVICE,
> either invalidate/invalidate, or clean/invalidate. I can see
I vote to invalidate/invalidate.

My key point is to let DMA_FROM_DEVICE-for_device invalidate, and
DMA_BIDIRECTIONAL contains DMA_FROM_DEVICE.
So I also agree:
@@ -22,8 +22,6 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t s=
ize,
                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
                 break;
         case DMA_FROM_DEVICE:
 -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
 +              ALT_CMO_OP(invalidate, vaddr, size, riscv_cbom_block_size);
                 break;
         case DMA_BIDIRECTIONAL:
                 ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
                 break;

> that flush/invalidate may be a sensible option as well, but I'd
> want to have that discussion after the series is complete, so
> we can come to a generic solution that has the same documented
> behavior across all architectures.
Yes, I agree to unify them into a generic solution first. My proposal
could be another topic in the future.
For that purpose, I give
Acked-by: Guo Ren <guoren@kernel.org>

>
> In particular, if we end up moving arm64 and riscv back to the
> traditional invalidate/invalidate for DMA_FROM_DEVICE and
> document that driver must not rely on buffers getting cleaned
After invalidation, the cache lines are also cleaned, right? So why do
we need to document it additionally?

> before a partial DMA_FROM_DEVICE, the question between clean
> or flush becomes moot as well.
>
> > @@ -42,7 +40,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t =
size,
> >                 break;
> >         case DMA_FROM_DEVICE:
> >         case DMA_BIDIRECTIONAL:
> >                 /* I'm not sure all drivers have guaranteed cacheline
> > alignment. If not, this inval would cause problems */
> > -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> > +               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> >                 break;
>
> This is my original patch, and I would not mix it with the other
> change. The problem with non-aligned DMA_BIDIRECTIONAL buffers in
> is that both flush and inval would be wrong if you get simultaneous
> writes from device and cpu to the same cache line, so there is
> no way to win this. Using inval instead of flush would at least
> work if the CPU data in the cacheline is read-only from the CPU,
> so that seems better than something that is always wrong.
If CPU data in the cacheline is read-only, the cacheline would never
be dirty. Yes, It's always safe.
Okay, I agree we must keep cache-line-aligned. I comment it here, just
worry some dirty drivers couldn't work with the "invalid mechanism"
because of the CPU data corruption, and device data in the cacheline
is useless.

>
> The documented API is that sharing the cache line is not allowed
> at all, so anything that would observe a difference between the
> two is also a bug. One idea that we have considered already is
> that we could overwrite the unused bits of the cacheline with
> poison values and/or mark them as invalid using KASAN for debugging
> purposes, to find drivers that already violate this.
>
>       Arnd



--=20
Best Regards
 Guo Ren


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#284): https://groups.io/g/linux-oxnas/message/284
Mute This Topic: https://groups.io/mt/97970101/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


