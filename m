Return-Path: <bounce+16102+190+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3266D1D27
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:17 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id gZKYYY1809624xJzdBGZEsFs; Fri, 31 Mar 2023 02:55:16 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.33168.1679919273322617573
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:14:33 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD90D611ED;
	Mon, 27 Mar 2023 12:14:32 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9C0C433EF;
	Mon, 27 Mar 2023 12:14:24 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 04/21] microblaze: dma-mapping: skip extra DMA flushes
Date: Mon, 27 Mar 2023 14:13:00 +0200
Message-Id: <20230327121317.4081816-5-arnd@kernel.org>
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
X-Gm-Message-State: ZiTyH7gFXqWa6C3kJZ2R2m2Dx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256516;
 bh=Bk6H9r3G4nFgaoYSv672rbCxkPHVPTNfsA7rkcR2eQk=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=jyw4I8WAOC1LdXIwoIPIwwMcPviwO5gPdQ6iuWEuRC0WdBO2NTIrP5TA/qm6JBGnI+f
 t5UK22kZPbZEYOw8WMiZs94kv2yjcvIL4aBZyQhaPYZIo1rKqdUHTWe6L7KPSN2Iex2LS
 E5sTXMZhJ1o+eci/gZGzG65QnFTfDKQGT2s=

From: Arnd Bergmann <arnd@arndb.de>

The microblaze dma_sync_* implementation uses the same function
for both _for_cpu() and _for_device(), which is inconsistent
with other architectures and slightly more expensive.

Split it up into separate functions and skip the parts that
are not needed:

 - on dma_sync_*_for_cpu(..., DMA_TO_DEVICE), skip the second
   writeback, which does nothing.

 - on dma_sync_*_for_cpu(..., DMA_BIDIRECTIONAL), only invalidate
   the cache to clear out cache lines that got loaded speculatively,
   but skip the extraneous writeback.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/microblaze/kernel/dma.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/microblaze/kernel/dma.c b/arch/microblaze/kernel/dma.c
index 04d091ade417..b4c4e45fd45e 100644
--- a/arch/microblaze/kernel/dma.c
+++ b/arch/microblaze/kernel/dma.c
@@ -14,8 +14,8 @@
 #include <linux/bug.h>
 #include <asm/cacheflush.h>
=20
-static void __dma_sync(phys_addr_t paddr, size_t size,
-		enum dma_data_direction direction)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
 {
 	switch (direction) {
 	case DMA_TO_DEVICE:
@@ -30,14 +30,16 @@ static void __dma_sync(phys_addr_t paddr, size_t size=
,
 	}
 }
=20
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_sync(paddr, size, dir);
-}
-
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	__dma_sync(paddr, size, dir);
-}
+	switch (direction) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_BIDIRECTIONAL:
+	case DMA_FROM_DEVICE:
+		invalidate_dcache_range(paddr, paddr + size);
+		break;
+	default:
+		BUG();
+	}}
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#190): https://groups.io/g/linux-oxnas/message/190
Mute This Topic: https://groups.io/mt/97970096/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


