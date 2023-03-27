Return-Path: <bounce+16102+193+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6FC6D1D21
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:13 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id YLfqYY1809624xJ99VjW3mNI; Fri, 31 Mar 2023 02:55:12 -0700
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web10.33176.1679919301366267827
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:15:01 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C83ABB81158;
	Mon, 27 Mar 2023 12:14:59 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660FDC4331E;
	Mon, 27 Mar 2023 12:14:50 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
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
	linux-arm-kernel@lists.infradead.org,
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
Subject: [linux-oxnas] [PATCH 07/21] powerpc: dma-mapping: always clean cache in _for_device() op
Date: Mon, 27 Mar 2023 14:13:03 +0200
Message-Id: <20230327121317.4081816-8-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@kernel.org
X-Gm-Message-State: k7NUEySPXLMT7JEB1I3NjFSux1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256512;
 bh=Llxa2bqUBW36q2L5SubqKrX26SEeA0ERcrsKd/nHv2k=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=anIq64OrZ9D2pgcdRI3bUOorWey9uXxcxXIDr8PgpLHnPrUJZX4a+Dm+tLzo0v6e+A9
 sa/Y1v0IdmRfBM+O50yQQAQkc65oSuXOu8jMek6Dah4HxzOzVBjIXkFfcfqOkydIQql+W
 bet6nloLNdkIJVTq0TLiz7Kc76ozmKUYWUI=

From: Arnd Bergmann <arnd@arndb.de>

The powerpc implementation of arch_sync_dma_for_device() is unique in tha=
t
it sometimes performs a full flush for the arch_sync_dma_for_device(paddr=
,
size, DMA_FROM_DEVICE) operation when the address is unaligned, but
otherwise invalidates the caches.

Since the _for_cpu() counterpart has to invalidate the cache already
in order to avoid stale data from prefetching, this operation only really
needs to ensure that there are no dirty cache lines, which can be done
using either invalidation or cleaning the cache, but not necessarily
both.

Most architectures traditionally go for invalidation here, but as
Will Deacon points out, this can leak old data to user space if
a DMA is started but the device ends up not actually filling the
entire buffer, see the link below.

The same argument applies to DMA_BIDIRECTIONAL transfers. Using
a cache-clean operation is the safe choice here, followed by
invalidating the cache after the DMA to get rid of stale data
that was prefetched before the completion of the DMA.

Link: https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck=
/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/dma-noncoherent.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-nonc=
oherent.c
index e108cacf877f..00e59a4faa2b 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -104,26 +104,7 @@ static void __dma_phys_op(phys_addr_t paddr, size_t =
size, enum dma_cache_op op)
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	switch (direction) {
-	case DMA_NONE:
-		BUG();
-	case DMA_FROM_DEVICE:
-		/*
-		 * invalidate only when cache-line aligned otherwise there is
-		 * the potential for discarding uncommitted data from the cache
-		 */
-		if ((start | end) & (L1_CACHE_BYTES - 1))
-			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
-		else
-			__dma_phys_op(start, end, DMA_CACHE_INVAL);
-		break;
-	case DMA_TO_DEVICE:		/* writeback only */
-		__dma_phys_op(start, end, DMA_CACHE_CLEAN);
-		break;
-	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
-		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
-		break;
-	}
+	__dma_phys_op(start, end, DMA_CACHE_CLEAN);
 }
=20
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#193): https://groups.io/g/linux-oxnas/message/193
Mute This Topic: https://groups.io/mt/97970099/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


