Return-Path: <bounce+16102+213+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C596D1D39
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:30 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id W7nTYY1809624xDz2SmSXlON; Fri, 31 Mar 2023 02:55:29 -0700
X-Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.39072.1679931791181148044
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 08:43:11 -0700
X-Received: by mail-pg1-f179.google.com with SMTP id d22so5414166pgw.2
        for <linux-oxnas@groups.io>; Mon, 27 Mar 2023 08:43:11 -0700 (PDT)
X-Gm-Message-State: Wnka0gAEWKT3EfFSwHHZWAY2x1808289AA=
X-Google-Smtp-Source: AKy350ZLARTDoGqBnXYfSrHDqt1ndSavaTIx5HilksseUiOHQOdKd5qG9m3KbOwJxwDn1K1TODO6L/v92bKQLX9gh5M=
X-Received: by 2002:a63:e20f:0:b0:50a:592b:25ba with SMTP id
 q15-20020a63e20f000000b0050a592b25bamr3326211pgh.3.1679931790647; Mon, 27 Mar
 2023 08:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-3-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-3-arnd@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Mar 2023 08:42:59 -0700
Message-ID: <CAMo8BfJwjcQxWVW9o6brvBYTgUe9v=QGgs39=_V6Oc9-OKv7Sw@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH 02/21] xtensa: dma-mapping: use normal cache invalidation rules
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
	"David S. Miller" <davem@davemloft.net>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, 
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
Reply-To: linux-oxnas@groups.io,jcmvbkbc@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256529;
 bh=Y8oAg/b9vK6qCcmD7vxGD2iGJPcfepwSkrPjX4aXtik=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=O4S2g6WYN2dEV22KkIR6XUSycz9Pll3wQaS01NbBZTmrsLv9UWzjpm+0midArOuILCH
 7eMEPxcmA5Vn6kZdCSkMuiqsVdj01JvxelHWlnHL14RDYFCB20kMnqlj9vlay/TMUKxeh
 1PcoFe9+c4puSoVOUGTxla5NU9ReW6jXTGE=

On Mon, Mar 27, 2023 at 5:14=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> xtensa is one of the platforms that has both write-back and write-through
> caches, and needs to account for both in its DMA mapping operations.
>
> It does this through a set of operations that is different from any
> architecture. This is not a problem by itself, but it makes it rather
> hard to figure out whether this is correct or not, and to unify this
> implementation with the others.
>
> Change the semantics to the usual ones for non-speculating CPUs:
>
>  - On DMA_TO_DEVICE, call __flush_dcache_range() to perform the
>    writeback even on writethrough caches, where this is a nop.
>
>  - On DMA_FROM_DEVICE, invalidate the mapping before the DMA rather
>    than afterwards.
>
>  - On DMA_BIDIRECTIONAL, combine the pre-writeback with the
>    post-invalidate into a call to __flush_invalidate_dcache_range()
>    that turns into a simple invalidate on writeback caches.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/xtensa/Kconfig                  |  1 -
>  arch/xtensa/include/asm/cacheflush.h |  6 +++---
>  arch/xtensa/kernel/pci-dma.c         | 29 +++++-----------------------
>  3 files changed, 8 insertions(+), 28 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#213): https://groups.io/g/linux-oxnas/message/213
Mute This Topic: https://groups.io/mt/97970094/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


