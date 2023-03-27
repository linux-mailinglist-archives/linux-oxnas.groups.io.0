Return-Path: <bounce+16102+203+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 272FB6D1D2D
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:22 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id OZivYY1809624x5njvwjlRH4; Fri, 31 Mar 2023 02:55:21 -0700
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web11.33331.1679919388073846753
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:16:28 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 77DF7B81186;
	Mon, 27 Mar 2023 12:16:26 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EE3C433AC;
	Mon, 27 Mar 2023 12:16:16 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 17/21] ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}() internally
Date: Mon, 27 Mar 2023 14:13:13 +0200
Message-Id: <20230327121317.4081816-18-arnd@kernel.org>
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
X-Gm-Message-State: iw5U77kdBb9Ic1Kg4Trdo6sLx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256521;
 bh=3x4fJm6XvXnVEhtDpVxWPFuDx5G+rGZMyeQ4wwQuSI0=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=Yuj8NrIQtXV54wAn50Z4CFKFb8nfFN6Gik/QKIsaBydwaGPVm+VtWdaqb0CkdspUge7
 clBU/fgJ6GuBxlyBkYvDpZCqfvq1tT2X496eVz7m5vALkXGW0Cg9kRyber5OkS52FaWGE
 iAtKwie6eCUSum7Pw8iwwy65rzfRo+zrNbI=

From: Arnd Bergmann <arnd@arndb.de>

The arm specific iommu code in dma-mapping.c uses the page+offset based
__dma_page_cpu_to_dev()/__dma_page_dev_to_cpu() helpers in place of the
phys_addr_t based arch_sync_dma_for_device()/arch_sync_dma_for_cpu()
wrappers around the.

In order to be able to move the latter part set of functions into
common code, change the iommu implementation to use them directly
and remove the internal ones as a separate interface.

As page+offset and phys_address are equivalent, but are used in
different parts of the code here, this allows removing some of
the conversion but adds them elsewhere.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/dma-mapping.c | 93 ++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 60 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 8bc01071474a..ce4b74f34a58 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -622,16 +622,14 @@ static void __arm_dma_free(struct device *dev, size=
_t size, void *cpu_addr,
 	kfree(buf);
 }
=20
-static void dma_cache_maint_page(struct page *page, unsigned long offset=
,
+static void dma_cache_maint(phys_addr_t paddr,
 	size_t size, enum dma_data_direction dir,
 	void (*op)(const void *, size_t, int))
 {
-	unsigned long pfn;
+	unsigned long pfn =3D PFN_DOWN(paddr);
+	unsigned long offset =3D paddr % PAGE_SIZE;
 	size_t left =3D size;
=20
-	pfn =3D page_to_pfn(page) + offset / PAGE_SIZE;
-	offset %=3D PAGE_SIZE;
-
 	/*
 	 * A single sg entry may refer to multiple physically contiguous
 	 * pages.  But we still need to process highmem pages individually.
@@ -641,8 +639,7 @@ static void dma_cache_maint_page(struct page *page, u=
nsigned long offset,
 	do {
 		size_t len =3D left;
 		void *vaddr;
-
-		page =3D pfn_to_page(pfn);
+		struct page *page =3D pfn_to_page(pfn);
=20
 		if (PageHighMem(page)) {
 			if (len + offset > PAGE_SIZE)
@@ -674,14 +671,11 @@ static void dma_cache_maint_page(struct page *page,=
 unsigned long offset,
  * Note: Drivers should NOT use this function directly.
  * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
  */
-static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
 {
-	phys_addr_t paddr;
+	dma_cache_maint(paddr, size, dir, dmac_map_area);
=20
-	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
-
-	paddr =3D page_to_phys(page) + off;
 	if (dir =3D=3D DMA_FROM_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 	} else {
@@ -690,34 +684,30 @@ static void __dma_page_cpu_to_dev(struct page *page=
, unsigned long off,
 	/* FIXME: non-speculating: flush on bidirectional mappings? */
 }
=20
-static void __dma_page_dev_to_cpu(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
 {
-	phys_addr_t paddr =3D page_to_phys(page) + off;
-
 	/* FIXME: non-speculating: not required */
 	/* in any case, don't bother invalidating if DMA to device */
 	if (dir !=3D DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
=20
-		dma_cache_maint_page(page, off, size, dir, dmac_unmap_area);
+		dma_cache_maint(paddr, size, dir, dmac_unmap_area);
 	}
=20
 	/*
 	 * Mark the D-cache clean for these pages to avoid extra flushing.
 	 */
 	if (dir !=3D DMA_TO_DEVICE && size >=3D PAGE_SIZE) {
-		unsigned long pfn;
+		unsigned long pfn =3D PFN_UP(paddr);
+		unsigned long off =3D paddr & (PAGE_SIZE - 1);
 		size_t left =3D size;
=20
-		pfn =3D page_to_pfn(page) + off / PAGE_SIZE;
-		off %=3D PAGE_SIZE;
-		if (off) {
-			pfn++;
+		if (off)
 			left -=3D PAGE_SIZE - off;
-		}
+
 		while (left >=3D PAGE_SIZE) {
-			page =3D pfn_to_page(pfn++);
+			struct page *page =3D pfn_to_page(pfn++);
 			set_bit(PG_dcache_clean, &page->flags);
 			left -=3D PAGE_SIZE;
 		}
@@ -1204,7 +1194,7 @@ static int __map_sg_chunk(struct device *dev, struc=
t scatterlist *sg,
 		unsigned int len =3D PAGE_ALIGN(s->offset + s->length);
=20
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+			arch_sync_dma_for_device(phys + s->offset, s->length, dir);
=20
 		prot =3D __dma_info_to_prot(dir, attrs);
=20
@@ -1306,8 +1296,7 @@ static void arm_iommu_unmap_sg(struct device *dev,
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_dev_to_cpu(sg_page(s), s->offset,
-					      s->length, dir);
+			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 	}
 }
=20
@@ -1329,7 +1318,7 @@ static void arm_iommu_sync_sg_for_cpu(struct device=
 *dev,
 		return;
=20
 	for_each_sg(sg, s, nents, i)
-		__dma_page_dev_to_cpu(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
=20
 }
=20
@@ -1351,7 +1340,8 @@ static void arm_iommu_sync_sg_for_device(struct dev=
ice *dev,
 		return;
=20
 	for_each_sg(sg, s, nents, i)
-		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_device(page_to_phys(sg_page(s)) + s->offset,
+					 s->length, dir);
 }
=20
 /**
@@ -1373,7 +1363,8 @@ static dma_addr_t arm_iommu_map_page(struct device =
*dev, struct page *page,
 	int ret, prot, len =3D PAGE_ALIGN(size + offset);
=20
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		__dma_page_cpu_to_dev(page, offset, size, dir);
+		arch_sync_dma_for_device(page_to_phys(page) + offset,
+					 size, dir);
=20
 	dma_addr =3D __alloc_iova(mapping, len);
 	if (dma_addr =3D=3D DMA_MAPPING_ERROR)
@@ -1406,7 +1397,7 @@ static void arm_iommu_unmap_page(struct device *dev=
, dma_addr_t handle,
 {
 	struct dma_iommu_mapping *mapping =3D to_dma_iommu_mapping(dev);
 	dma_addr_t iova =3D handle & PAGE_MASK;
-	struct page *page;
+	phys_addr_t phys;
 	int offset =3D handle & ~PAGE_MASK;
 	int len =3D PAGE_ALIGN(size + offset);
=20
@@ -1414,8 +1405,8 @@ static void arm_iommu_unmap_page(struct device *dev=
, dma_addr_t handle,
 		return;
=20
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		page =3D phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-		__dma_page_dev_to_cpu(page, offset, size, dir);
+		phys =3D iommu_iova_to_phys(mapping->domain, handle);
+		arch_sync_dma_for_cpu(phys, size, dir);
 	}
=20
 	iommu_unmap(mapping->domain, iova, len);
@@ -1483,30 +1474,26 @@ static void arm_iommu_sync_single_for_cpu(struct =
device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
 	struct dma_iommu_mapping *mapping =3D to_dma_iommu_mapping(dev);
-	dma_addr_t iova =3D handle & PAGE_MASK;
-	struct page *page;
-	unsigned int offset =3D handle & ~PAGE_MASK;
+	phys_addr_t phys;
=20
-	if (dev->dma_coherent || !iova)
+	if (dev->dma_coherent || !(handle & PAGE_MASK))
 		return;
=20
-	page =3D phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_dev_to_cpu(page, offset, size, dir);
+	phys =3D iommu_iova_to_phys(mapping->domain, handle);
+	arch_sync_dma_for_cpu(phys, size, dir);
 }
=20
 static void arm_iommu_sync_single_for_device(struct device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
 	struct dma_iommu_mapping *mapping =3D to_dma_iommu_mapping(dev);
-	dma_addr_t iova =3D handle & PAGE_MASK;
-	struct page *page;
-	unsigned int offset =3D handle & ~PAGE_MASK;
+	phys_addr_t phys;
=20
-	if (dev->dma_coherent || !iova)
+	if (dev->dma_coherent || !(handle & PAGE_MASK))
 		return;
=20
-	page =3D phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_cpu_to_dev(page, offset, size, dir);
+	phys =3D iommu_iova_to_phys(mapping->domain, handle);
+	arch_sync_dma_for_device(phys, size, dir);
 }
=20
 static const struct dma_map_ops iommu_ops =3D {
@@ -1789,20 +1776,6 @@ void arch_teardown_dma_ops(struct device *dev)
 	set_dma_ops(dev, NULL);
 }
=20
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_cpu_to_dev(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_dev_to_cpu(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
 void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_ha=
ndle,
 		gfp_t gfp, unsigned long attrs)
 {
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#203): https://groups.io/g/linux-oxnas/message/203
Mute This Topic: https://groups.io/mt/97970109/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


