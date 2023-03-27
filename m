Return-Path: <bounce+16102+191+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCAF6D1D20
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:12 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id jPzLYY1809624xismlG4pDJd; Fri, 31 Mar 2023 02:55:10 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.33171.1679919282277359763
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:14:42 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0689611CA;
	Mon, 27 Mar 2023 12:14:41 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C784C433A4;
	Mon, 27 Mar 2023 12:14:32 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 05/21] powerpc: dma-mapping: split out cache operation logic
Date: Mon, 27 Mar 2023 14:13:01 +0200
Message-Id: <20230327121317.4081816-6-arnd@kernel.org>
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
X-Gm-Message-State: MP9Fjd7Am2q7csWWekJzIS1sx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256510;
 bh=V/zC4msTdL70FPEvFOZbr98fSuldjDEejFTZHNbfmuE=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=TNWIiR41n6UnbkJBuoGjmiHWSvif0ucybaoPhHd/1ToDva+d0axlQGg7+y9+h0TwvZy
 oKPjU/ujEHQKZSauKmwh3xihxurYkcz5H6dY/OS6bG2SBjQ8gjGQ20oP1794W/hKG/00y
 r5svZle6a3pOb9UjJ93jICQHHLwldiU17iY=

From: Arnd Bergmann <arnd@arndb.de>

The powerpc arch_sync_dma_for_device()/arch_sync_dma_for_cpu() functions
behave differently from all other architectures, at least for some of
the operations.

As a preparation for making the behavior more consistent, reorder the
logic in which they decide whether to flush, invalidate or clean the.
No change in behavior is intended.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/dma-noncoherent.c | 91 +++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-nonc=
oherent.c
index 30260b5d146d..f10869d27de5 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -16,31 +16,28 @@
 #include <asm/tlbflush.h>
 #include <asm/dma.h>
=20
+enum dma_cache_op {
+	DMA_CACHE_CLEAN,
+	DMA_CACHE_INVAL,
+	DMA_CACHE_FLUSH,
+};
+
 /*
  * make an area consistent.
  */
-static void __dma_sync(void *vaddr, size_t size, int direction)
+static void __dma_op(void *vaddr, size_t size, enum dma_cache_op op)
 {
 	unsigned long start =3D (unsigned long)vaddr;
 	unsigned long end   =3D start + size;
=20
-	switch (direction) {
-	case DMA_NONE:
-		BUG();
-	case DMA_FROM_DEVICE:
-		/*
-		 * invalidate only when cache-line aligned otherwise there is
-		 * the potential for discarding uncommitted data from the cache
-		 */
-		if ((start | end) & (L1_CACHE_BYTES - 1))
-			flush_dcache_range(start, end);
-		else
-			invalidate_dcache_range(start, end);
-		break;
-	case DMA_TO_DEVICE:		/* writeback only */
+	switch (op) {
+	case DMA_CACHE_CLEAN:
 		clean_dcache_range(start, end);
 		break;
-	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
+	case DMA_CACHE_INVAL:
+		invalidate_dcache_range(start, end);
+		break;
+	case DMA_CACHE_FLUSH:
 		flush_dcache_range(start, end);
 		break;
 	}
@@ -48,16 +45,16 @@ static void __dma_sync(void *vaddr, size_t size, int =
direction)
=20
 #ifdef CONFIG_HIGHMEM
 /*
- * __dma_sync_page() implementation for systems using highmem.
+ * __dma_highmem_op() implementation for systems using highmem.
  * In this case, each page of a buffer must be kmapped/kunmapped
- * in order to have a virtual address for __dma_sync(). This must
+ * in order to have a virtual address for __dma_op(). This must
  * not sleep so kmap_atomic()/kunmap_atomic() are used.
  *
  * Note: yes, it is possible and correct to have a buffer extend
  * beyond the first page.
  */
-static inline void __dma_sync_page_highmem(struct page *page,
-		unsigned long offset, size_t size, int direction)
+static inline void __dma_highmem_op(struct page *page,
+		unsigned long offset, size_t size, enum dma_cache_op op)
 {
 	size_t seg_size =3D min((size_t)(PAGE_SIZE - offset), size);
 	size_t cur_size =3D seg_size;
@@ -71,7 +68,7 @@ static inline void __dma_sync_page_highmem(struct page =
*page,
 		start =3D (unsigned long)kmap_atomic(page + seg_nr) + seg_offset;
=20
 		/* Sync this buffer segment */
-		__dma_sync((void *)start, seg_size, direction);
+		__dma_op((void *)start, seg_size, op);
 		kunmap_atomic((void *)start);
 		seg_nr++;
=20
@@ -88,32 +85,70 @@ static inline void __dma_sync_page_highmem(struct pag=
e *page,
 #endif /* CONFIG_HIGHMEM */
=20
 /*
- * __dma_sync_page makes memory consistent. identical to __dma_sync, but
- * takes a struct page instead of a virtual address
+ * __dma_phys_op makes memory consistent. identical to __dma_op, but
+ * takes a phys_addr_t instead of a virtual address
  */
-static void __dma_sync_page(phys_addr_t paddr, size_t size, int dir)
+static void __dma_phys_op(phys_addr_t paddr, size_t size, enum dma_cache=
_op op)
 {
 	struct page *page =3D pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned offset =3D paddr & ~PAGE_MASK;
=20
 #ifdef CONFIG_HIGHMEM
-	__dma_sync_page_highmem(page, offset, size, dir);
+	__dma_highmem_op(page, offset, size, op);
 #else
 	unsigned long start =3D (unsigned long)page_address(page) + offset;
-	__dma_sync((void *)start, size, dir);
+	__dma_op((void *)start, size, op);
 #endif
 }
=20
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	__dma_sync_page(paddr, size, dir);
+	switch (direction) {
+	case DMA_NONE:
+		BUG();
+	case DMA_FROM_DEVICE:
+		/*
+		 * invalidate only when cache-line aligned otherwise there is
+		 * the potential for discarding uncommitted data from the cache
+		 */
+		if ((start | end) & (L1_CACHE_BYTES - 1))
+			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		else
+			__dma_phys_op(start, end, DMA_CACHE_INVAL);
+		break;
+	case DMA_TO_DEVICE:		/* writeback only */
+		__dma_phys_op(start, end, DMA_CACHE_CLEAN);
+		break;
+	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
+		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		break;
+	}
 }
=20
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	__dma_sync_page(paddr, size, dir);
+	switch (direction) {
+	case DMA_NONE:
+		BUG();
+	case DMA_FROM_DEVICE:
+		/*
+		 * invalidate only when cache-line aligned otherwise there is
+		 * the potential for discarding uncommitted data from the cache
+		 */
+		if ((start | end) & (L1_CACHE_BYTES - 1))
+			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		else
+			__dma_phys_op(start, end, DMA_CACHE_INVAL);
+		break;
+	case DMA_TO_DEVICE:		/* writeback only */
+		__dma_phys_op(start, end, DMA_CACHE_CLEAN);
+		break;
+	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
+		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		break;
+	}
 }
=20
 void arch_dma_prep_coherent(struct page *page, size_t size)
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#191): https://groups.io/g/linux-oxnas/message/191
Mute This Topic: https://groups.io/mt/97970097/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


