Return-Path: <bounce+16102+199+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AC6D1D2A
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:20 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id dXyKYY1809624xWM70Drl6fn; Fri, 31 Mar 2023 02:55:19 -0700
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web10.33194.1679919353269315488
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:15:53 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6BE7B80D0C;
	Mon, 27 Mar 2023 12:15:51 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C656C4339B;
	Mon, 27 Mar 2023 12:15:42 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 13/21] arc: dma-mapping: skip invalidating before bidirectional DMA
Date: Mon, 27 Mar 2023 14:13:09 +0200
Message-Id: <20230327121317.4081816-14-arnd@kernel.org>
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
X-Gm-Message-State: KZL1GqUWvS3hxTwS36vbat6Dx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256519;
 bh=rwmZz/5gBadaXrVGCwKQHLyCl+YZo67EbWgNg4WcXGc=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=aXDWaz1RHFHD3KSYPjGC5m7kcdh7YBKxebPlk1UIVk/RohM4/duNKrwWlk7rPngtQEe
 Ug9bCvM4HbpM38KGWlVpCLAbreBnhMWYWJBf/g0w8kRNMy5mJsY4E4qFb1eXHvEVhEn4S
 KSe7cDeEC4uXDB6Lbfc6VVEUg0KVv4irx/k=

From: Arnd Bergmann <arnd@arndb.de>

Some architectures that need to invalidate buffers after bidirectional
DMA because of speculative prefetching only do a simpler writeback
before that DMA, while architectures that don't need to do the second
invalidate tend to have a combined writeback+invalidate before the
DMA.

arc is one of the architectures that does both, which seems unnecessary.

Change it to behave like arm/arm64/xtensa instead, and use just a
writeback before the DMA when we do the invalidate afterwards.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/mm/dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 2a7fbbb83b70..ddb96786f765 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -40,7 +40,7 @@ void arch_dma_prep_coherent(struct page *page, size_t s=
ize)
  *          |-----------------------------------------------------------=
-----
  * TO_DEV   |   writeback        writeback      |   none          none
  * FROM_DEV |   invalidate       invalidate     |   invalidate*   invali=
date*
- * BIDIR    |   writeback+inv    writeback+inv  |   invalidate    invali=
date
+ * BIDIR    |   writeback        writeback      |   invalidate    invali=
date
  *
  *     [*] needed for CPU speculative prefetches
  *
@@ -61,7 +61,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t=
 size,
 		break;
=20
 	case DMA_BIDIRECTIONAL:
-		dma_cache_wback_inv(paddr, size);
+		dma_cache_wback(paddr, size);
 		break;
=20
 	default:
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#199): https://groups.io/g/linux-oxnas/message/199
Mute This Topic: https://groups.io/mt/97970105/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


