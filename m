Return-Path: <bounce+16102+215+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE66D1D3B
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:32 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id Ai35YY1809624xJsTEjqt93X; Fri, 31 Mar 2023 02:55:31 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.8970.1680122899931431787
 for <linux-oxnas@groups.io>;
 Wed, 29 Mar 2023 13:48:20 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57B1161E31;
	Wed, 29 Mar 2023 20:48:19 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B6DC433D2;
	Wed, 29 Mar 2023 20:48:10 +0000 (UTC)
Date: Wed, 29 Mar 2023 21:48:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org, samuel@sholland.org
Subject: Re: [linux-oxnas] [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
Message-ID: <2668e232-ae83-4576-beaa-08e420236996@spud>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,conor@kernel.org
X-Gm-Message-State: YDnI3QpVYJSSywQBYgWlCgRUx1808289AA=
Content-Type: multipart/mixed; boundary="Groupsio=KpzwNyVTGo81NVDQgfV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256531;
 bh=6rkIiLNU7fjDFwtmQ7wrIlr6FuczueS7WGJxh2r9x48=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=TERk8YOEEeyxbW7F9lssxveXLjMrKbJKeH5Y/68QZOd3Fq8gAfV1FMV17aDXC0X8yUp
 HF42aGCbBDLslN0y56oyimViAQQ9vyuhwZch2Vb3A2lJ4zxfyfIWhEGzYd525klxvd1eg
 EAIDIn5Wk+Vcgt9ozvjPJs4LazIsrckaCY4=

--Groupsio=KpzwNyVTGo81NVDQgfV6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 02:13:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but

> if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.

So does this need a
Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zic=
bom extension")
then, even if the cacheline really should not have been touched by the
CPU?
Also, minor typo, s/drive/driver/.

In the thread we had that sparked this, I went digging for the source of
the flushes, and it came from a review comment:
https://lore.kernel.org/linux-riscv/342e3c12-ebb0-badf-7d4c-c444a2b842b2@sh=
olland.org/
But *surely* if no other arch needs to do that, then we are safe to also
not do it... Your logic seems right by me at least, especially given the
lack of flushes elsewhere.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
>  		break;
>  	case DMA_FROM_DEVICE:
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	default:
>  		break;
> --=20
> 2.39.2
>=20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#215): https://groups.io/g/linux-oxnas/message/215
Mute This Topic: https://groups.io/mt/97970100/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--Groupsio=KpzwNyVTGo81NVDQgfV6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCSkCAAKCRB4tDGHoIJi
0pCKAQCFyZKqUabYSSJXqqHCLgZcuhg7cae4P41SpPSV+c3z5gEA/c0XOLzsLOMI
IgRP+ghvnIZnEAVO3yHmHKYu0MBqmQM=
=36EO
-----END PGP SIGNATURE-----

--Groupsio=KpzwNyVTGo81NVDQgfV6--
