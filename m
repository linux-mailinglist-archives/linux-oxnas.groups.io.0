Return-Path: <bounce+16102+189+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A5C6D1D1F
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:12 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id jmd3YY1809624xva5DvVBFFl; Fri, 31 Mar 2023 02:55:10 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.33166.1679919265009855664
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:14:25 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 95DAD611E6;
	Mon, 27 Mar 2023 12:14:24 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id D461BC433A4;
	Mon, 27 Mar 2023 12:14:15 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 03/21] sparc32: flush caches in dma_sync_*for_device
Date: Mon, 27 Mar 2023 14:12:59 +0200
Message-Id: <20230327121317.4081816-4-arnd@kernel.org>
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
X-Gm-Message-State: GDoc7iPD4cRhY0Qra2bHXmifx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256510;
 bh=/9wfGNt+JsUiX4+ko4aWYAN7fMQnJqEDFvk/n8fq9wc=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=av7Tp/Pfq/6D2zZrDO00646iNs/u71sPB6B2yg7ynxgV5NavQ3F2a9qHJyGuwQc7VJa
 /ay1+vxipnGER7c+pnqptuNMHCbAWMWKM2Xy6WFmpdutAyGdSghlM/FhmEhxuuTbC16pI
 DiCfq7rJlIfRXM1Z3eZVYj2T0kD//CHZw+o=

From: Arnd Bergmann <arnd@arndb.de>

Leon has a very minimalistic cache that has no range operations
and requires being flushed entirely to deal with noncoherent
DMA. Most in-order architectures do their cache management in
the dma_sync_*for_device() operations rather than dma_sync_*for_cpu.

Since the cache is write-through only, both should have the same
effect, so change it for consistency with the other architectures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sparc/Kconfig         | 2 +-
 arch/sparc/kernel/ioport.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 84437a4c6545..637da50e236c 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -51,7 +51,7 @@ config SPARC
 config SPARC32
 	def_bool !64BIT
 	select ARCH_32BIT_OFF_T
-	select ARCH_HAS_SYNC_DMA_FOR_CPU
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select CLZ_TAB
 	select DMA_DIRECT_REMAP
 	select GENERIC_ATOMIC64
diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index 4e4f3d3263e4..4f3d26066ec2 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -306,7 +306,7 @@ arch_initcall(sparc_register_ioport);
  * On LEON systems without cache snooping, the entire D-CACHE must be fl=
ushed to
  * make DMA to cacheable memory coherent.
  */
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
 	if (dir !=3D DMA_TO_DEVICE &&
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#189): https://groups.io/g/linux-oxnas/message/189
Mute This Topic: https://groups.io/mt/97970095/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


