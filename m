Return-Path: <bounce+16102+187+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 582EA6D1D1C
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:10 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id iEi6YY1809624xCEqMl5br7E; Fri, 31 Mar 2023 02:55:08 -0700
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web11.33275.1679919249868915315
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:14:10 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0738B81157;
	Mon, 27 Mar 2023 12:14:07 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F17DC433A1;
	Mon, 27 Mar 2023 12:13:58 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 01/21] openrisc: dma-mapping: flush bidirectional mappings
Date: Mon, 27 Mar 2023 14:12:57 +0200
Message-Id: <20230327121317.4081816-2-arnd@kernel.org>
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
X-Gm-Message-State: kmNIdzmET0yrxsEI0GRlHSqOx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256508;
 bh=bhtKaLLsflI0fl8O37wQf5q2dwGa0WcNPrpvteyIErI=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=bxnDV1Zq66Ux4OCtRXZgleA5YQL6Sl3sbRLkF09JrRrd9ch0YmFxwkvVWFnjpUcc8Yz
 SXVixt3x6O64UrQMD8T7CwOBItRFrc0cPH7KkwRmF3VgzjfMcSC1e663fEjk8BPzvVNHJ
 pkTrfHPPTYJfBsZ33iToezWm54G371i3f9s=

From: Arnd Bergmann <arnd@arndb.de>

The cache management operations on DMA are different from the
other architectures:

 - on DMA_TO_DEVICE, Openrisc currently invalidates the cache
   after the writeback, where a simple writeback without
   invalidation should be sufficient.

 - on DMA_BIDIRECTIONAL, Openrisc does nothing, while most
   architectures either flush before DMA, or writeback before
   and invalidate after DMA. The separate invalidation for
   DMA_BIDIRECTIONAL/DMA_FROM_DEVICE is only required on CPUs
   that can do speculative prefetches.

Change both to have the normal set of operations.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/openrisc/kernel/dma.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
index b3edbb33b621..91a00d09ffad 100644
--- a/arch/openrisc/kernel/dma.c
+++ b/arch/openrisc/kernel/dma.c
@@ -103,10 +103,10 @@ void arch_sync_dma_for_device(phys_addr_t addr, siz=
e_t size,
=20
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		/* Flush the dcache for the requested range */
+		/* Write back the dcache for the requested range */
 		for (cl =3D addr; cl < addr + size;
 		     cl +=3D cpuinfo->dcache_block_size)
-			mtspr(SPR_DCBFR, cl);
+			mtspr(SPR_DCBWR, cl);
 		break;
 	case DMA_FROM_DEVICE:
 		/* Invalidate the dcache for the requested range */
@@ -114,12 +114,13 @@ void arch_sync_dma_for_device(phys_addr_t addr, siz=
e_t size,
 		     cl +=3D cpuinfo->dcache_block_size)
 			mtspr(SPR_DCBIR, cl);
 		break;
+	case DMA_BIDIRECTIONAL:
+		/* Flush the dcache for the requested range */
+		for (cl =3D addr; cl < addr + size;
+		     cl +=3D cpuinfo->dcache_block_size)
+			mtspr(SPR_DCBFR, cl);
+		break;
 	default:
-		/*
-		 * NOTE: If dir =3D=3D DMA_BIDIRECTIONAL then there's no need to
-		 * flush nor invalidate the cache here as the area will need
-		 * to be manually synced anyway.
-		 */
 		break;
 	}
 }
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#187): https://groups.io/g/linux-oxnas/message/187
Mute This Topic: https://groups.io/mt/97970093/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


