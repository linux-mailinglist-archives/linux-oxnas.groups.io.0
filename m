Return-Path: <bounce+16102+186+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C866D1D1D
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:10 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id rH6oYY1809624xwAbm8lGTqO; Fri, 31 Mar 2023 02:55:09 -0700
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web11.33269.1679919241798999653
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:14:02 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3AEF2B8114B;
	Mon, 27 Mar 2023 12:13:59 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F8CC433D2;
	Mon, 27 Mar 2023 12:13:49 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 00/21] dma-mapping: unify support for cache flushes
Date: Mon, 27 Mar 2023 14:12:56 +0200
Message-Id: <20230327121317.4081816-1-arnd@kernel.org>
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
X-Gm-Message-State: 9OwqgR55yp60Zddll7crpjDpx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256509;
 bh=watrVF5VjJcJcdotWabHX/N3gMSGIXGaJ0yaEd0l0fI=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=teRVK/0SY5npQBo3P7/+Z5WRvH5KPrfFD1Qx8DVwO9ik84Qsel/B4twhH0U0WoIuep8
 tGsLoom9f9OIvSft5k9K1n0pYM9T9QadO10K9LA6Ij3cr4HXkT6o9HdrW6fFITD441kE8
 N1Ei5doRBgvIZMzWBLBqYqYrC60k1Ac5Pmw=

From: Arnd Bergmann <arnd@arndb.de>

After a long discussion about adding SoC specific semantics for when
to flush caches in drivers/soc/ drivers that we determined to be
fundamentally flawed[1], I volunteered to try to move that logic into
architecture-independent code and make all existing architectures do
the same thing.

As we had determined earlier, the behavior is wildly different across
architectures, but most of the differences come down to either bugs
(when required flushes are missing) or extra flushes that are harmless
but might hurt performance.

I finally found the time to come up with an implementation of this, which
starts by replacing every outlier with one of the three common options:

 1. architectures without speculative prefetching (hegagon, m68k,
    openrisc, sh, sparc, and certain armv4 and xtensa implementations)
    only flush their caches before a DMA, by cleaning write-back caches
    (if any) before a DMA to the device, and by invalidating the caches
    before a DMA from a device

 2. arc, microblaze, mips, nios2, sh and later xtensa now follow the
    normal 32-bit arm model and invalidate their writeback caches
    again after a DMA from the device, to remove stale cache lines
    that got prefetched during the DMA. arc, csky and mips used to
    invalidate buffers also before the bidirectional DMA, but this
    is now skipped whenever we know it gets invalidated again
    after the DMA.

 3. parisc, powerpc and riscv already flushed buffers before
    a DMA_FROM_DEVICE, and these get moved to the arm64 behavior
    that does the writeback before and invalidate after both
    DMA_FROM_DEVICE and DMA_BIDIRECTIONAL in order to avoid the
    problem of accidentally leaking stale data if the DMA does
    not actually happen[2].

The last patch in the series replaces the architecture specific code
with a shared version that implements all three based on architecture
specific parameters that are almost always determined at compile time.

The difference between cases 1. and 2. is hardware specific, while betwee=
n
2. and 3. we need to decide which semantics we want, but I explicitly
avoid this question in my series and leave it to be decided later.

Another difference that I do not address here is what cache invalidation
does for partical cache lines. On arm32, arm64 and powerpc, a partial
cache line always gets written back before invalidation in order to
ensure that data before or after the buffer is not discarded. On all
other architectures, the assumption is cache lines are never shared
between DMA buffer and data that is accessed by the CPU. If we end up
always writing back dirty cache lines before a DMA (option 3 above),
then this point becomes moot, otherwise we should probably address this
in a follow-up series to document one behavior or the other and implement
it consistently.

Please review!

      Arnd

[1] https://lore.kernel.org/all/20221212115505.36770-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/

Arnd Bergmann (21):
  openrisc: dma-mapping: flush bidirectional mappings
  xtensa: dma-mapping: use normal cache invalidation rules
  sparc32: flush caches in dma_sync_*for_device
  microblaze: dma-mapping: skip extra DMA flushes
  powerpc: dma-mapping: split out cache operation logic
  powerpc: dma-mapping: minimize for_cpu flushing
  powerpc: dma-mapping: always clean cache in _for_device() op
  riscv: dma-mapping: only invalidate after DMA, not flush
  riscv: dma-mapping: skip invalidation before bidirectional DMA
  csky: dma-mapping: skip invalidating before DMA from device
  mips: dma-mapping: skip invalidating before bidirectional DMA
  mips: dma-mapping: split out cache operation logic
  arc: dma-mapping: skip invalidating before bidirectional DMA
  parisc: dma-mapping: use regular flush/invalidate ops
  ARM: dma-mapping: always invalidate WT caches before DMA
  ARM: dma-mapping: bring back dmac_{clean,inv}_range
  ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}() internally
  ARM: drop SMP support for ARM11MPCore
  ARM: dma-mapping: use generic form of arch_sync_dma_* helpers
  ARM: dma-mapping: split out arch_dma_mark_clean() helper
  dma-mapping: replace custom code with generic implementation

 arch/arc/mm/dma.c                          |  66 ++------
 arch/arm/Kconfig                           |   4 +
 arch/arm/include/asm/cacheflush.h          |  21 +++
 arch/arm/include/asm/glue-cache.h          |   4 +
 arch/arm/mach-oxnas/Kconfig                |   4 -
 arch/arm/mach-oxnas/Makefile               |   1 -
 arch/arm/mach-oxnas/headsmp.S              |  23 ---
 arch/arm/mach-oxnas/platsmp.c              |  96 -----------
 arch/arm/mach-versatile/platsmp-realview.c |   4 -
 arch/arm/mm/Kconfig                        |  19 ---
 arch/arm/mm/cache-fa.S                     |   4 +-
 arch/arm/mm/cache-nop.S                    |   6 +
 arch/arm/mm/cache-v4.S                     |  13 +-
 arch/arm/mm/cache-v4wb.S                   |   4 +-
 arch/arm/mm/cache-v4wt.S                   |  22 ++-
 arch/arm/mm/cache-v6.S                     |  35 +---
 arch/arm/mm/cache-v7.S                     |   6 +-
 arch/arm/mm/cache-v7m.S                    |   4 +-
 arch/arm/mm/dma-mapping-nommu.c            |  36 ++--
 arch/arm/mm/dma-mapping.c                  | 181 ++++++++++-----------
 arch/arm/mm/proc-arm1020.S                 |   4 +-
 arch/arm/mm/proc-arm1020e.S                |   4 +-
 arch/arm/mm/proc-arm1022.S                 |   4 +-
 arch/arm/mm/proc-arm1026.S                 |   4 +-
 arch/arm/mm/proc-arm920.S                  |   4 +-
 arch/arm/mm/proc-arm922.S                  |   4 +-
 arch/arm/mm/proc-arm925.S                  |   4 +-
 arch/arm/mm/proc-arm926.S                  |   4 +-
 arch/arm/mm/proc-arm940.S                  |   4 +-
 arch/arm/mm/proc-arm946.S                  |   4 +-
 arch/arm/mm/proc-feroceon.S                |   8 +-
 arch/arm/mm/proc-macros.S                  |   2 +
 arch/arm/mm/proc-mohawk.S                  |   4 +-
 arch/arm/mm/proc-xsc3.S                    |   4 +-
 arch/arm/mm/proc-xscale.S                  |   6 +-
 arch/arm64/mm/dma-mapping.c                |  28 ++--
 arch/csky/mm/dma-mapping.c                 |  46 +++---
 arch/hexagon/kernel/dma.c                  |  44 ++---
 arch/m68k/kernel/dma.c                     |  43 +++--
 arch/microblaze/kernel/dma.c               |  38 ++---
 arch/mips/mm/dma-noncoherent.c             |  75 +++------
 arch/nios2/mm/dma-mapping.c                |  57 +++----
 arch/openrisc/kernel/dma.c                 |  62 ++++---
 arch/parisc/include/asm/cacheflush.h       |   6 +-
 arch/parisc/kernel/pci-dma.c               |  33 +++-
 arch/powerpc/mm/dma-noncoherent.c          |  76 +++++----
 arch/riscv/mm/dma-noncoherent.c            |  51 +++---
 arch/sh/kernel/dma-coherent.c              |  43 +++--
 arch/sparc/Kconfig                         |   2 +-
 arch/sparc/kernel/ioport.c                 |  38 +++--
 arch/xtensa/Kconfig                        |   1 -
 arch/xtensa/include/asm/cacheflush.h       |   6 +-
 arch/xtensa/kernel/pci-dma.c               |  47 +++---
 include/linux/dma-sync.h                   | 107 ++++++++++++
 54 files changed, 721 insertions(+), 699 deletions(-)
 delete mode 100644 arch/arm/mach-oxnas/headsmp.S
 delete mode 100644 arch/arm/mach-oxnas/platsmp.c
 create mode 100644 include/linux/dma-sync.h

--=20
2.39.2

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Brian Cain <bcain@quicinc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-oxnas@groups.io
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#186): https://groups.io/g/linux-oxnas/message/186
Mute This Topic: https://groups.io/mt/97970092/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


