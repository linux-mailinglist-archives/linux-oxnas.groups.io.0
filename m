Return-Path: <bounce+16102+200+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21B6D1D2B
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:21 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 5N82YY1809624xyF8wD658vd; Fri, 31 Mar 2023 02:55:19 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.33319.1679919360078795622
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:16:00 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E646611E3;
	Mon, 27 Mar 2023 12:15:59 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68CCC433A8;
	Mon, 27 Mar 2023 12:15:50 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 14/21] parisc: dma-mapping: use regular flush/invalidate ops
Date: Mon, 27 Mar 2023 14:13:10 +0200
Message-Id: <20230327121317.4081816-15-arnd@kernel.org>
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
X-Gm-Message-State: HMEmNlz7L639tlkKFZzhj4BGx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256519;
 bh=wq4BLPMVPENieXwkfDWt0JZkhtPImFACwlHsWI9jjbE=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=bBVGVJ6ImCMN1NEOM30AG2/tW5It8NcLdqDIJeS9eYi8ru1nyJcz1nNY3/ESLbvtzvk
 HLFMHnD15oEzHSTYzkLgRD/Si6l9JRNF+6Ai4/6XwQpV6UcQdST19qKCEgesdBvu2+WnK
 oSxZnRN4StNiDZ96Tjwe7AKuyTHxQfXOjnk=

From: Arnd Bergmann <arnd@arndb.de>

non-coherent devices on parisc traditionally use a full flush+invalidate
before and after each DMA, which is more expensive that what we do on
other architectures.

Before transfers to a device, the cache only has to be written back,
but apparently there is no operation for this on parisc. There is no
need to flush it again after the transfer though.

After transfers from a device, the second writeback can be skipped becaus=
e
the CPU was not allowed to write to the buffer anyway, instead a purge
(invalidate without flush) can be used.

The DMA_FROM_DEVICE is handled differently across architectures,
most use only an invalidate (purge) operation, but some have moved
to flush in order to preserve dirty data when the device does not
write to the buffer, see the link below. As parisc already did the
full flush here, keep that behavior.

Link: https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck=
/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm not really sure I understand the semantics of the 'flush'
and 'purge' operations on parisc correctly, please double-check that
this makes sense in the context of this architecture.
---
 arch/parisc/include/asm/cacheflush.h |  6 +++++-
 arch/parisc/kernel/pci-dma.c         | 25 +++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/a=
sm/cacheflush.h
index 0bdee6724132..a4c5042f1821 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -33,8 +33,12 @@ void flush_cache_mm(struct mm_struct *mm);
=20
 void flush_kernel_dcache_page_addr(const void *addr);
=20
+#define clean_kernel_dcache_range(start,size) \
+	flush_kernel_dcache_range((start), (size))
 #define flush_kernel_dcache_range(start,size) \
-	flush_kernel_dcache_range_asm((start), (start)+(size));
+	flush_kernel_dcache_range_asm((start), (start)+(size))
+#define purge_kernel_dcache_range(start,size) \
+	purge_kernel_dcache_range_asm((start), (start)+(size))
=20
 #define ARCH_IMPLEMENTS_FLUSH_KERNEL_VMAP_RANGE 1
 void flush_kernel_vmap_range(void *vaddr, int size);
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index ba87f791323b..6d3d3cffb316 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -446,11 +446,32 @@ void arch_dma_free(struct device *dev, size_t size,=
 void *vaddr,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
+	unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
+
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		clean_kernel_dcache_range(virt, size);
+		break;
+	case DMA_FROM_DEVICE:
+		clean_kernel_dcache_range(virt, size);
+		break;
+	case DMA_BIDIRECTIONAL:
+		flush_kernel_dcache_range(virt, size);
+		break;
+	}
 }
=20
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
+	unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
+
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		purge_kernel_dcache_range(virt, size);
+		break;
+	}
 }
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#200): https://groups.io/g/linux-oxnas/message/200
Mute This Topic: https://groups.io/mt/97970106/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


