Return-Path: <bounce+16102+192+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DAB6D1D19
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:08 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 1UgaYY1809624x1AlRth1QOM; Fri, 31 Mar 2023 02:55:06 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.33173.1679919291630126202
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:14:51 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 333CB611F4;
	Mon, 27 Mar 2023 12:14:51 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E9EC433EF;
	Mon, 27 Mar 2023 12:14:41 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 06/21] powerpc: dma-mapping: minimize for_cpu flushing
Date: Mon, 27 Mar 2023 14:13:02 +0200
Message-Id: <20230327121317.4081816-7-arnd@kernel.org>
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
X-Gm-Message-State: MBA0IG2htI0piAFbYLq5QxZBx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256506;
 bh=qmUPS+wvlficgBUAlu5TRaKYojJPfndYmdBRFRBM4NE=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=tnsw36APa35vTim6WsBuyKLaU541S+tpJBqnCvfAin2o+uUmRWiGoB3LEXz+TPbYloE
 owGxn+sPZ40gQLWgO+9+/BQFczNEdaa9UI/q18p11zGdIWE+G1BzbOuai5BDvavFPOYbe
 wGQy3H/R1upd8LLpGudij+18ORSNDUk8H0Y=

From: Arnd Bergmann <arnd@arndb.de>

The powerpc dma_sync_*_for_cpu() variants do more flushes than on other
architectures. Reduce it to what everyone else does:

 - No flush is needed after data has been sent to a device

 - When data has been received from a device, the cache only needs to
   be invalidated to clear out cache lines that were speculatively
   prefetched.

In particular, the second flushing of partial cache lines of bidirectiona=
l
buffers is actively harmful -- if a single cache line is written by both
the CPU and the device, flushing it again does not maintain coherency
but instead overwrite the data that was just received from the device.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/dma-noncoherent.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-nonc=
oherent.c
index f10869d27de5..e108cacf877f 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -132,21 +132,11 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_=
t size,
 	switch (direction) {
 	case DMA_NONE:
 		BUG();
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
+	case DMA_TO_DEVICE:
 		break;
-	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
-		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		__dma_phys_op(start, end, DMA_CACHE_INVAL);
 		break;
 	}
 }
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#192): https://groups.io/g/linux-oxnas/message/192
Mute This Topic: https://groups.io/mt/97970098/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


