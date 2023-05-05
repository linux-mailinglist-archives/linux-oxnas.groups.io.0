Return-Path: <bounce+16102+282+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B7C6FCB2D
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:15 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id fPSeYY1809624xLgtURSnVoq; Tue, 09 May 2023 09:19:14 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.20482.1683265658697981980
 for <linux-oxnas@groups.io>;
 Thu, 04 May 2023 22:47:38 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EBF163B2D
	for <linux-oxnas@groups.io>; Fri,  5 May 2023 05:47:38 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E9CC4339E
	for <linux-oxnas@groups.io>; Fri,  5 May 2023 05:47:37 +0000 (UTC)
X-Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2a8ad872ea5so15630631fa.2
        for <linux-oxnas@groups.io>; Thu, 04 May 2023 22:47:37 -0700 (PDT)
X-Gm-Message-State: KBEleVUNCuFaidLM7p7QYFgrx1808289AA=
X-Google-Smtp-Source: ACHHUZ7vjZvoO17O2+xGcjw8YRQwo0MSgi9BtdhaWD+v+3nmuTyY0RrEyW2wbSK+lqJd6C9lcTXOXjjLYHG3jJse7RE=
X-Received: by 2002:a17:907:1c07:b0:960:ddba:e5c7 with SMTP id
 nc7-20020a1709071c0700b00960ddbae5c7mr139047ejc.40.1683265634680; Thu, 04 May
 2023 22:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-10-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 5 May 2023 13:47:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Message-ID: <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional DMA
To: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
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
 q=dns/txt; s=20140610; t=1683649154;
 bh=zSUNQZ2IGJ5xZ+UjMgfaCnhbeaVl5hb7Db9I05ghBp4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=kmGEpwm811bOP2g2Qr1cIT5PZ93Fm50/ei5UtkdAIy/fMNiEo889ad4s0R637TbHOvM
 mBKRQ+p1UhtIqLUSczyrjlAz8e0Zq8ACQ9wVj88GX5n4JQB//lxSBcpbdGlMxxo4FYa16
 4/C1cCnC5I5JcpsEp0cEDStMW43JP9Gl0OI=

On Mon, Mar 27, 2023 at 8:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
>
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.
Yes, we can't guarantee the CPU pre-load cache lines randomly during
dma working.

But I've two purposes to keep invalidates before dma transfer:
 - We clearly tell the CPU these cache lines are invalid. The caching
algorithm would use these invalid slots first instead of replacing
valid ones.
 - Invalidating is very cheap. Actually, flush and clean have the same
performance in our machine.

So, how about:

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoheren=
t.c
index d919efab6eba..2c52fbc15064 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -22,8 +22,6 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t s=
ize,
                ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
                break;
        case DMA_FROM_DEVICE:
-               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
-               break;
        case DMA_BIDIRECTIONAL:
                ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
                break;
@@ -42,7 +40,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size=
,
                break;
        case DMA_FROM_DEVICE:
        case DMA_BIDIRECTIONAL:
                /* I'm not sure all drivers have guaranteed cacheline
alignment. If not, this inval would cause problems */
-               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
                break;
        default:
                break;

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index 640f4c496d26..69c80b2155a1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -25,7 +25,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t=
 size,
>                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>                 break;
>         case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>                 break;
>         default:
>                 break;
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#282): https://groups.io/g/linux-oxnas/message/282
Mute This Topic: https://groups.io/mt/97970101/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


