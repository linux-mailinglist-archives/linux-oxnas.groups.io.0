Return-Path: <bounce+16102+216+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id B632A6D1D41
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:37 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id ZdHBYY1809624x8XLhHrELrw; Fri, 31 Mar 2023 02:55:36 -0700
X-Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.10706.1680126718142300477
 for <linux-oxnas@groups.io>;
 Wed, 29 Mar 2023 14:51:58 -0700
X-Received: by mail-wm1-f52.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so12299109wmq.4
        for <linux-oxnas@groups.io>; Wed, 29 Mar 2023 14:51:57 -0700 (PDT)
X-Gm-Message-State: 4AX4qQn1HpNFzHaYj48jIDCex1808289AA=
X-Google-Smtp-Source: AK7set8QoMq1gGRgzzGqEiUi0STo43D8VYRH41LQHDT7NbD/gZR3RJOV/DBadJ5PrJGjWGmEaVtwcg==
X-Received: by 2002:a7b:c413:0:b0:3ee:4531:8448 with SMTP id k19-20020a7bc413000000b003ee45318448mr17263952wmi.39.1680126716518;
        Wed, 29 Mar 2023 14:51:56 -0700 (PDT)
X-Received: from smtpclient.apple (global-5-144.n-2.net.cam.ac.uk. [131.111.5.144])
        by smtp.gmail.com with ESMTPSA id a18-20020a1cf012000000b003ed4f6c6234sm3437896wmb.23.2023.03.29.14.51.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Mar 2023 14:51:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [linux-oxnas] [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
Date: Wed, 29 Mar 2023 22:51:54 +0100
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@quicinc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Christoph Hellwig <hch@lst.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-oxnas@groups.io,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org
Message-Id: <837F1B2F-7090-4F9F-A894-594ACF6A8DB2@jrtc27.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,jrtc27@jrtc27.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256536;
 bh=+b7YrKyWwvHfs+oZFkNYFFxBZC4mTbvPyDuGc9/t20I=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Tp71G3uhcTtsCWEQ21f53+HMcpA2pITcbqHQiNu8BOdc4av+ms/aBk6SLq3gTNMtUaB
 cC37zbrJHGXGJ4pjeDdQk9MZgKwa8/fgdRmoy7oPDQeef+IxGnBop2duoPdjPcrL7YAfw
 TY4U4IyKt0QdutIMoy+p60JHLpKC99O/AOk=

On 27 Mar 2023, at 13:13, Arnd Bergmann <arnd@kernel.org> wrote:
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.

FYI [1] proposed this same change a while ago but its justification was
flawed (which was my objection at the time, not the diff itself).

Jess

[1] https://lore.kernel.org/all/20220818165105.99746-1-s.miroshnichenko@yad=
ro.com

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> arch/riscv/mm/dma-noncoherent.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
> 		break;
> 	case DMA_FROM_DEVICE:
> 	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> 		break;
> 	default:
> 		break;
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#216): https://groups.io/g/linux-oxnas/message/216
Mute This Topic: https://groups.io/mt/97970100/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


