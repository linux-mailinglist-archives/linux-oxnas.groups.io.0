Return-Path: <bounce+16102+205+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 0069F6D1D31
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:24 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id BT28YY1809624xFan3ZFqfLa; Fri, 31 Mar 2023 02:55:23 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.33211.1679919403837016052
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:16:43 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64B50611EA;
	Mon, 27 Mar 2023 12:16:43 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id A199BC433A4;
	Mon, 27 Mar 2023 12:16:34 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 19/21] ARM: dma-mapping: use generic form of arch_sync_dma_* helpers
Date: Mon, 27 Mar 2023 14:13:15 +0200
Message-Id: <20230327121317.4081816-20-arnd@kernel.org>
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
X-Gm-Message-State: I9Qb5jdiJJ36ftk7g2emB9eQx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256523;
 bh=yHzoziJgjW6uBQmbETIT+dMRrP/6YHZ1vjAGIIP6mxs=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=B6DtvBJBX9VWkGdmLJQvyHU/mvPZ/LivKndVl9gv12toS5FXHDeX6buMg7hdnaZzN58
 aTAbj/s0wmcA1T9+jCQIbRzPQPqmekaZa6WTAL6/Czhz+dE48+pYjwXRlLRkhZA2tMjcd
 JW7RVlxCKbVf5whKQICkZcfIptTD4l4W1OE=

From: Arnd Bergmann <arnd@arndb.de>

As the final step of the conversion to generic arch_sync_dma_*
helpers, change the Arm implementation to look the same as the
new generic version, by calling the dmac_{clean,inv,flush}_area
low-level functions instead of the abstracted dmac_{map,unmap}_area
version.

On ARMv6/v7, this invalidates the caches after a DMA transfer from
a device because of speculative prefetching, while on earlier versions
it only needs to do this before the transfer.

This should not change any of the current behavior.

FIXME: address CONFIG_DMA_CACHE_RWFO properly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/dma-mapping-nommu.c | 11 +++----
 arch/arm/mm/dma-mapping.c       | 53 +++++++++++++++++++++++----------
 2 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-no=
mmu.c
index cfd9c933d2f0..12b5c6ae93fc 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -16,12 +16,13 @@
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dmac_map_area(__va(paddr), size, dir);
-
-	if (dir =3D=3D DMA_FROM_DEVICE)
+	if (dir =3D=3D DMA_FROM_DEVICE) {
+		dmac_inv_range(__va(paddr), __va(paddr + size));
 		outer_inv_range(paddr, paddr + size);
-	else
+	} else {
+		dmac_clean_range(__va(paddr), __va(paddr + size));
 		outer_clean_range(paddr, paddr + size);
+	}
 }
=20
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
@@ -29,7 +30,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
 {
 	if (dir !=3D DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
-		dmac_unmap_area(__va(paddr), size, dir);
+		dmac_inv_range(__va(paddr), __va(paddr));
 	}
 }
=20
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index ce4b74f34a58..cc702cb27ae7 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -623,8 +623,7 @@ static void __arm_dma_free(struct device *dev, size_t=
 size, void *cpu_addr,
 }
=20
 static void dma_cache_maint(phys_addr_t paddr,
-	size_t size, enum dma_data_direction dir,
-	void (*op)(const void *, size_t, int))
+	size_t size, void (*op)(const void *, const void *))
 {
 	unsigned long pfn =3D PFN_DOWN(paddr);
 	unsigned long offset =3D paddr % PAGE_SIZE;
@@ -647,18 +646,18 @@ static void dma_cache_maint(phys_addr_t paddr,
=20
 			if (cache_is_vipt_nonaliasing()) {
 				vaddr =3D kmap_atomic(page);
-				op(vaddr + offset, len, dir);
+				op(vaddr + offset, vaddr + offset + len);
 				kunmap_atomic(vaddr);
 			} else {
 				vaddr =3D kmap_high_get(page);
 				if (vaddr) {
-					op(vaddr + offset, len, dir);
+					op(vaddr + offset, vaddr + offset + len);
 					kunmap_high(page);
 				}
 			}
 		} else {
 			vaddr =3D page_address(page) + offset;
-			op(vaddr, len, dir);
+			op(vaddr, vaddr + len);
 		}
 		offset =3D 0;
 		pfn++;
@@ -666,6 +665,18 @@ static void dma_cache_maint(phys_addr_t paddr,
 	} while (left);
 }
=20
+static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	if (IS_ENABLED(CONFIG_CPU_V6) ||
+	    IS_ENABLED(CONFIG_CPU_V6K) ||
+	    IS_ENABLED(CONFIG_CPU_V7) ||
+	    IS_ENABLED(CONFIG_CPU_V7M))
+		return true;
+
+	/* FIXME: runtime detection */
+	return false;
+}
+
 /*
  * Make an area consistent for devices.
  * Note: Drivers should NOT use this function directly.
@@ -674,25 +685,35 @@ static void dma_cache_maint(phys_addr_t paddr,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dma_cache_maint(paddr, size, dir, dmac_map_area);
-
-	if (dir =3D=3D DMA_FROM_DEVICE) {
-		outer_inv_range(paddr, paddr + size);
-	} else {
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		dma_cache_maint(paddr, size, dmac_clean_range);
 		outer_clean_range(paddr, paddr + size);
+		break;
+	case DMA_FROM_DEVICE:
+		dma_cache_maint(paddr, size, dmac_inv_range);
+		outer_inv_range(paddr, paddr + size);
+		break;
+	case DMA_BIDIRECTIONAL:
+		if (arch_sync_dma_cpu_needs_post_dma_flush()) {
+			dma_cache_maint(paddr, size, dmac_clean_range);
+			outer_clean_range(paddr, paddr + size);
+		} else {
+			dma_cache_maint(paddr, size, dmac_flush_range);
+			outer_flush_range(paddr, paddr + size);
+		}
+		break;
+	default:
+		break;
 	}
-	/* FIXME: non-speculating: flush on bidirectional mappings? */
 }
=20
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	/* FIXME: non-speculating: not required */
-	/* in any case, don't bother invalidating if DMA to device */
-	if (dir !=3D DMA_TO_DEVICE) {
+	if (dir !=3D DMA_TO_DEVICE && arch_sync_dma_cpu_needs_post_dma_flush())=
 {
 		outer_inv_range(paddr, paddr + size);
-
-		dma_cache_maint(paddr, size, dir, dmac_unmap_area);
+		dma_cache_maint(paddr, size, dmac_inv_range);
 	}
=20
 	/*
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#205): https://groups.io/g/linux-oxnas/message/205
Mute This Topic: https://groups.io/mt/97970111/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


