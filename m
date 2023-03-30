Return-Path: <bounce+16102+221+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 8436E6D1D46
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:39 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id IDmSYY1809624xpY1aShaS3r; Fri, 31 Mar 2023 02:55:38 -0700
X-Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.24275.1680181173234476610
 for <linux-oxnas@groups.io>;
 Thu, 30 Mar 2023 05:59:33 -0700
X-Received: by mail-io1-f51.google.com with SMTP id m22so8235062ioy.4
        for <linux-oxnas@groups.io>; Thu, 30 Mar 2023 05:59:33 -0700 (PDT)
X-Gm-Message-State: pxEAe2F7mmTQGW0BTorCvMIQx1808289AA=
X-Google-Smtp-Source: AKy350Yt7w4HDnt8ZzJ1OA1g5OCPUWPp6heQMoQ57xTct+y1JPFpMNsPMtx4N97vitPklV5i5ccLJReO6yCW0ia7/Oo=
X-Received: by 2002:a02:95c3:0:b0:3eb:3166:9da4 with SMTP id
 b61-20020a0295c3000000b003eb31669da4mr2710421jai.2.1680181172425; Thu, 30 Mar
 2023 05:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-9-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Mar 2023 13:59:06 +0100
Message-ID: <CA+V-a8v--RqxFJYTZ04vVgiA69VJsFWk=r=TvRvokhpAV-famg@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, 
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
Reply-To: linux-oxnas@groups.io,prabhakar.csengg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256538;
 bh=RdZkrWOwN4WkjHZ5P2jbvEnvhkMIrydU5LVsOYlBrN0=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=TKoO5A6DBOUn6YREC65rjn1J7AjTRCu5I9iOy30OxC+Kwi3HGeoYX+oA5DvfkWzrz1R
 0aUVuWn3+bIyJ8x8vLBStFEqyOdqTdQ8CWCE/+GZkG+Uc5X4+Q1/W3QoKABbreW2g7soV
 TD0xiG3saXGqHTBh3YuxfJ8slXHvah0lo0Y=

On Mon, Mar 27, 2023 at 1:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
>                 break;
>         case DMA_FROM_DEVICE:
>         case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>                 break;
>         default:
>                 break;
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#221): https://groups.io/g/linux-oxnas/message/221
Mute This Topic: https://groups.io/mt/97970100/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


