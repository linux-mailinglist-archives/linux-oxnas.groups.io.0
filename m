Return-Path: <bounce+16102+201+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CDE6D1D29
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:19 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 26LIYY1809624xBC207VlFMX; Fri, 31 Mar 2023 02:55:18 -0700
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web11.33323.1679919370649494076
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:16:11 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1CE8CB81189;
	Mon, 27 Mar 2023 12:16:09 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F899C433EF;
	Mon, 27 Mar 2023 12:15:59 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches before DMA
Date: Mon, 27 Mar 2023 14:13:11 +0200
Message-Id: <20230327121317.4081816-16-arnd@kernel.org>
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
X-Gm-Message-State: DPd5sCcawBqkf0EbqybTURzfx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256518;
 bh=gLcIaozzgjc3zUKDl0hiZRIX8kTh4CmUnHhiClRKhQA=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=G0eJHv1MAAbcfCDHvbKh1p0YwEYZi8Gb960DxALzCXk2fnD2ONAOf8jrMTDSKJ3pNkF
 b1x56gBJV6IcGQyqbedI4DofD1+/wbkP6dNVGHviT7TGvuRcpQajCw6zqnRH12uryVUId
 FkzTMxzLmaWlzafZLesrEqNEwTewp+JTC1E=

From: Arnd Bergmann <arnd@arndb.de>

Most ARM CPUs can have write-back caches and that require
cache management to be done in the dma_sync_*_for_device()
operation. This is typically done in both writeback and
writethrough mode.

The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
(arm920t, arm940t) implementations are the exception here,
and only do the cache management after the DMA is complete,
in the dma_sync_*_for_cpu() operation.

Change this for consistency with the other platforms. This
should have no user visible effect.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/cache-v4.S   | 8 ++++----
 arch/arm/mm/cache-v4wt.S | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index 7787057e4990..e2b104876340 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -117,23 +117,23 @@ ENTRY(v4_dma_flush_range)
 	ret	lr
=20
 /*
- *	dma_unmap_area(start, size, dir)
+ *	dma_map_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4_dma_unmap_area)
+ENTRY(v4_dma_map_area)
 	teq	r2, #DMA_TO_DEVICE
 	bne	v4_dma_flush_range
 	/* FALLTHROUGH */
=20
 /*
- *	dma_map_area(start, size, dir)
+ *	dma_unmap_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4_dma_map_area)
+ENTRY(v4_dma_unmap_area)
 	ret	lr
 ENDPROC(v4_dma_unmap_area)
 ENDPROC(v4_dma_map_area)
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index 0b290c25a99d..652218752f88 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -172,24 +172,24 @@ v4wt_dma_inv_range:
 	.equ	v4wt_dma_flush_range, v4wt_dma_inv_range
=20
 /*
- *	dma_unmap_area(start, size, dir)
+ *	dma_map_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wt_dma_unmap_area)
+ENTRY(v4wt_dma_map_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_TO_DEVICE
 	bne	v4wt_dma_inv_range
 	/* FALLTHROUGH */
=20
 /*
- *	dma_map_area(start, size, dir)
+ *	dma_unmap_area(start, size, dir)
  *	- start	- kernel virtual start address
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wt_dma_map_area)
+ENTRY(v4wt_dma_unmap_area)
 	ret	lr
 ENDPROC(v4wt_dma_unmap_area)
 ENDPROC(v4wt_dma_map_area)
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#201): https://groups.io/g/linux-oxnas/message/201
Mute This Topic: https://groups.io/mt/97970107/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


