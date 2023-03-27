Return-Path: <bounce+16102+206+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF46D1D33
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:26 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id VtgQYY1809624xYxaBltHZWO; Fri, 31 Mar 2023 02:55:25 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.33214.1679919412627355236
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:16:52 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2785F611EF;
	Mon, 27 Mar 2023 12:16:52 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501AFC433EF;
	Mon, 27 Mar 2023 12:16:43 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean() helper
Date: Mon, 27 Mar 2023 14:13:16 +0200
Message-Id: <20230327121317.4081816-21-arnd@kernel.org>
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
X-Gm-Message-State: hketvi6SiUqJSlzrV82iZtnrx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256525;
 bh=PdYknwEJQHyK82bEUqsarQddS7I+OmXaYZzyzZKuIS8=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=nMo2RUjc+yJyJrH1bB6FAIDG8XDIpiWJuZ3BvdElOZKY3nSodwbmmXsaNPGIevHbx7a
 GMpd4bOnvd8WA5W+y36fLKypKQhTV5EjC7vKHvod8pFAHjioPzvkahs9k577BtQHc39dn
 Otve4PmGb9vEsQdyZcjjO+gq70Yo1WvV2lE=

From: Arnd Bergmann <arnd@arndb.de>

The arm version of the arch_sync_dma_for_cpu() function annotates pages a=
s
PG_dcache_clean after a DMA, but no other architecture does this here. On
ia64, the same thing is done in arch_sync_dma_for_cpu(), so it makes sens=
e
to use the same hook in order to have identical arch_sync_dma_for_cpu()
semantics as all other architectures.

Splitting this out has multiple effects:

 - for dma-direct, this now gets called after arch_sync_dma_for_cpu()
   for DMA_FROM_DEVICE mappings, but not for DMA_BIDIRECTIONAL. While
   it would not be harmful to keep doing it for bidirectional mappings,
   those are apparently not used in any callers that care about the flag.

 - Since arm has its own dma-iommu abstraction, this now also needs to
   call the same function, so the calls are added there to mirror the
   dma-direct version.

 - Like dma-direct, the dma-iommu version now marks the dcache clean
   for both coherent and noncoherent devices after a DMA, but it only
   does this for DMA_FROM_DEVICE, not DMA_BIDIRECTIONAL.

[ HELP NEEDED: can anyone confirm that it is a correct assumption
  on arm that a cache-coherent device writing to a page always results
  in it being in a PG_dcache_clean state like on ia64, or can a device
  write directly into the dcache?]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig          |  1 +
 arch/arm/mm/dma-mapping.c | 71 +++++++++++++++++++++++----------------
 2 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e24a9820e12f..125d58c54ab1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -7,6 +7,7 @@ config ARM
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
+	select ARCH_HAS_DMA_MARK_CLEAN if MMU
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index cc702cb27ae7..b703cb83d27e 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -665,6 +665,28 @@ static void dma_cache_maint(phys_addr_t paddr,
 	} while (left);
 }
=20
+/*
+ * Mark the D-cache clean for these pages to avoid extra flushing.
+ */
+void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
+{
+	unsigned long pfn =3D PFN_UP(paddr);
+	unsigned long off =3D paddr & (PAGE_SIZE - 1);
+	size_t left =3D size;
+
+	if (size < PAGE_SIZE)
+		return;
+
+	if (off)
+		left -=3D PAGE_SIZE - off;
+
+	while (left >=3D PAGE_SIZE) {
+		struct page *page =3D pfn_to_page(pfn++);
+		set_bit(PG_dcache_clean, &page->flags);
+		left -=3D PAGE_SIZE;
+	}
+}
+
 static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
 {
 	if (IS_ENABLED(CONFIG_CPU_V6) ||
@@ -715,24 +737,6 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t=
 size,
 		outer_inv_range(paddr, paddr + size);
 		dma_cache_maint(paddr, size, dmac_inv_range);
 	}
-
-	/*
-	 * Mark the D-cache clean for these pages to avoid extra flushing.
-	 */
-	if (dir !=3D DMA_TO_DEVICE && size >=3D PAGE_SIZE) {
-		unsigned long pfn =3D PFN_UP(paddr);
-		unsigned long off =3D paddr & (PAGE_SIZE - 1);
-		size_t left =3D size;
-
-		if (off)
-			left -=3D PAGE_SIZE - off;
-
-		while (left >=3D PAGE_SIZE) {
-			struct page *page =3D pfn_to_page(pfn++);
-			set_bit(PG_dcache_clean, &page->flags);
-			left -=3D PAGE_SIZE;
-		}
-	}
 }
=20
 #ifdef CONFIG_ARM_DMA_USE_IOMMU
@@ -1294,6 +1298,17 @@ static int arm_iommu_map_sg(struct device *dev, st=
ruct scatterlist *sg,
 	return -EINVAL;
 }
=20
+static void arm_iommu_sync_dma_for_cpu(phys_addr_t phys, size_t len,
+				       enum dma_data_direction dir,
+				       bool dma_coherent)
+{
+	if (!dma_coherent)
+		arch_sync_dma_for_cpu(phys, s->length, dir);
+
+	if (dir =3D=3D DMA_FROM_DEVICE)
+		arch_dma_mark_clean(phys, s->length);
+}
+
 /**
  * arm_iommu_unmap_sg - unmap a set of SG buffers mapped by dma_map_sg
  * @dev: valid struct device pointer
@@ -1316,8 +1331,9 @@ static void arm_iommu_unmap_sg(struct device *dev,
 		if (sg_dma_len(s))
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
-		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
+		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+			arm_iommu_sync_dma_for_cpu(sg_phys(s), s->length, dir,
+						   dev->dma_coherent);
 	}
 }
=20
@@ -1335,12 +1351,9 @@ static void arm_iommu_sync_sg_for_cpu(struct devic=
e *dev,
 	struct scatterlist *s;
 	int i;
=20
-	if (dev->dma_coherent)
-		return;
-
 	for_each_sg(sg, s, nents, i)
-		arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
-
+		arm_iommu_sync_dma_for_cpu(sg_phys(s), s->length, dir,
+					   dev->dma_coherent);
 }
=20
 /**
@@ -1425,9 +1438,9 @@ static void arm_iommu_unmap_page(struct device *dev=
, dma_addr_t handle,
 	if (!iova)
 		return;
=20
-	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		phys =3D iommu_iova_to_phys(mapping->domain, handle);
-		arch_sync_dma_for_cpu(phys, size, dir);
+		arm_iommu_sync_dma_for_cpu(phys, size, dir, dev->dma_coherent);
 	}
=20
 	iommu_unmap(mapping->domain, iova, len);
@@ -1497,11 +1510,11 @@ static void arm_iommu_sync_single_for_cpu(struct =
device *dev,
 	struct dma_iommu_mapping *mapping =3D to_dma_iommu_mapping(dev);
 	phys_addr_t phys;
=20
-	if (dev->dma_coherent || !(handle & PAGE_MASK))
+	if (!(handle & PAGE_MASK))
 		return;
=20
 	phys =3D iommu_iova_to_phys(mapping->domain, handle);
-	arch_sync_dma_for_cpu(phys, size, dir);
+	arm_iommu_sync_dma_for_cpu(phys, size, dir, dev->dma_coherent);
 }
=20
 static void arm_iommu_sync_single_for_device(struct device *dev,
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#206): https://groups.io/g/linux-oxnas/message/206
Mute This Topic: https://groups.io/mt/97970112/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


