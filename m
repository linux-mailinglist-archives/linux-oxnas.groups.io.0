Return-Path: <bounce+16102+188+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F616D1D1B
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:08 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id mLYhYY1809624xzpswM8J6Of; Fri, 31 Mar 2023 02:55:06 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.33279.1679919256787149316
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:14:16 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E406F611E4;
	Mon, 27 Mar 2023 12:14:15 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CE2C433A0;
	Mon, 27 Mar 2023 12:14:06 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 02/21] xtensa: dma-mapping: use normal cache invalidation rules
Date: Mon, 27 Mar 2023 14:12:58 +0200
Message-Id: <20230327121317.4081816-3-arnd@kernel.org>
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
X-Gm-Message-State: 0hq3XEtMS62i6sOZXUN5K2gXx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256506;
 bh=etWimwIjREMfgKn3/KN40DoD5HxEwfSh33AjMZWksMk=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=UhfAAy8iaeY7wCiSbb6lM5RXYTZilNHLuqjdNpw/rBxWWzLAqXbmxkAP2k6Z1w4edpL
 qOTE7r+hdBq5kVytHMKSC1+Tp8iinBESYj2KhaiPVt6oSsNViKcQw1HSUvi8bFQSiAS3g
 nAHzdtZvKYGquXyUP7IXtRjfpgWUeI+t0TM=

From: Arnd Bergmann <arnd@arndb.de>

xtensa is one of the platforms that has both write-back and write-through
caches, and needs to account for both in its DMA mapping operations.

It does this through a set of operations that is different from any
architecture. This is not a problem by itself, but it makes it rather
hard to figure out whether this is correct or not, and to unify this
implementation with the others.

Change the semantics to the usual ones for non-speculating CPUs:

 - On DMA_TO_DEVICE, call __flush_dcache_range() to perform the
   writeback even on writethrough caches, where this is a nop.

 - On DMA_FROM_DEVICE, invalidate the mapping before the DMA rather
   than afterwards.

 - On DMA_BIDIRECTIONAL, combine the pre-writeback with the
   post-invalidate into a call to __flush_invalidate_dcache_range()
   that turns into a simple invalidate on writeback caches.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/xtensa/Kconfig                  |  1 -
 arch/xtensa/include/asm/cacheflush.h |  6 +++---
 arch/xtensa/kernel/pci-dma.c         | 29 +++++-----------------------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index bcb0c5d2abc2..b938bacbb9af 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -8,7 +8,6 @@ config XTENSA
 	select ARCH_HAS_DMA_PREP_COHERENT if MMU
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
-	select ARCH_HAS_SYNC_DMA_FOR_CPU if MMU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if MMU
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_HAS_STRNCPY_FROM_USER if !KASAN
diff --git a/arch/xtensa/include/asm/cacheflush.h b/arch/xtensa/include/a=
sm/cacheflush.h
index 7b4359312c25..2f645d25565a 100644
--- a/arch/xtensa/include/asm/cacheflush.h
+++ b/arch/xtensa/include/asm/cacheflush.h
@@ -61,9 +61,9 @@ static inline void __flush_dcache_page(unsigned long va=
)
 static inline void __flush_dcache_range(unsigned long va, unsigned long =
sz)
 {
 }
-# define __flush_invalidate_dcache_all()	__invalidate_dcache_all()
-# define __flush_invalidate_dcache_page(p)	__invalidate_dcache_page(p)
-# define __flush_invalidate_dcache_range(p,s)	__invalidate_dcache_range(=
p,s)
+# define __flush_invalidate_dcache_all		__invalidate_dcache_all
+# define __flush_invalidate_dcache_page		__invalidate_dcache_page
+# define __flush_invalidate_dcache_range	__invalidate_dcache_range
 #endif
=20
 #if defined(CONFIG_MMU) && (DCACHE_WAY_SIZE > PAGE_SIZE)
diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index 94955caa4488..ff3bf015eca4 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -43,38 +43,19 @@ static void do_cache_op(phys_addr_t paddr, size_t siz=
e,
 		}
 }
=20
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
 	switch (dir) {
-	case DMA_BIDIRECTIONAL:
+	case DMA_TO_DEVICE:
+		do_cache_op(paddr, size, __flush_dcache_range);
+		break;
 	case DMA_FROM_DEVICE:
 		do_cache_op(paddr, size, __invalidate_dcache_range);
 		break;
-
-	case DMA_NONE:
-		BUG();
-		break;
-
-	default:
-		break;
-	}
-}
-
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
 	case DMA_BIDIRECTIONAL:
-	case DMA_TO_DEVICE:
-		if (XCHAL_DCACHE_IS_WRITEBACK)
-			do_cache_op(paddr, size, __flush_dcache_range);
+		do_cache_op(paddr, size, __flush_invalidate_dcache_range);
 		break;
-
-	case DMA_NONE:
-		BUG();
-		break;
-
 	default:
 		break;
 	}
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#188): https://groups.io/g/linux-oxnas/message/188
Mute This Topic: https://groups.io/mt/97970094/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


