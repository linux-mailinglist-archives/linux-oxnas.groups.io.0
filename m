Return-Path: <bounce+16102+196+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E25346D1D25
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:15 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id BOo4YY1809624xrCRKMI4Lno; Fri, 31 Mar 2023 02:55:14 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.33311.1679919325106513247
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:15:25 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A573B611CE;
	Mon, 27 Mar 2023 12:15:24 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A3DC433A4;
	Mon, 27 Mar 2023 12:15:16 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 10/21] csky: dma-mapping: skip invalidating before DMA from device
Date: Mon, 27 Mar 2023 14:13:06 +0200
Message-Id: <20230327121317.4081816-11-arnd@kernel.org>
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
X-Gm-Message-State: ZWy6KYkHsiUKdJBf8E2Rp2Trx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256514;
 bh=Hz8wqk9UgRpNQKmtdopW8ZXc6LUUjcR7VzyQVbq/nyI=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=viPxbSOx7qJkcLdJJbxtHivs7BdZD14iUzcxiYkliNwovCU3rNZRGWUcwwznWmpHgJa
 0LgHQcXbStbWzxGzo8qc42O+vpY9d/CFxzuBFmMwN3qYNhptSqIvhyJb8vWJ2Jam7bdCA
 YYcEwx5sXqcm+4FID9X4lSTjAivzRqbV38w=

From: Arnd Bergmann <arnd@arndb.de>

csky is the only architecture that does a full flush for the
dma_sync_*_for_device(..., DMA_FROM_DEVICE) operation. The requirement
is only make sure there are no dirty cache lines for the buffer,
which can be either done through an invalidate operation (as on most
architectures including arm32, mips and arc), or a writeback (as on
arm64 and riscv). The cache also has to be invalidated eventually but
csky already does that after the transfer.

Use a 'clean' operation here for consistency with arm64 and riscv.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/mm/dma-mapping.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
index 82447029feb4..c90f912e2822 100644
--- a/arch/csky/mm/dma-mapping.c
+++ b/arch/csky/mm/dma-mapping.c
@@ -60,11 +60,9 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_=
t size,
 {
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		cache_op(paddr, size, dma_wb_range);
-		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		cache_op(paddr, size, dma_wbinv_range);
+		cache_op(paddr, size, dma_wb_range);
 		break;
 	default:
 		BUG();
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#196): https://groups.io/g/linux-oxnas/message/196
Mute This Topic: https://groups.io/mt/97970102/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


