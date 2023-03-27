Return-Path: <bounce+16102+197+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2326D1D23
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:13 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id Ek7bYY1809624xhNoRAzLxJ2; Fri, 31 Mar 2023 02:55:12 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.33316.1679919334926780756
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:15:35 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71337611F1;
	Mon, 27 Mar 2023 12:15:34 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBF0C433EF;
	Mon, 27 Mar 2023 12:15:24 +0000 (UTC)
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
Subject: [linux-oxnas] [PATCH 11/21] mips: dma-mapping: skip invalidating before bidirectional DMA
Date: Mon, 27 Mar 2023 14:13:07 +0200
Message-Id: <20230327121317.4081816-12-arnd@kernel.org>
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
X-Gm-Message-State: hCMvv2URK1rRwjRG8BYrMfvMx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256512;
 bh=eSRibY9YGGi8L9RCX3JHh5KZEq9UTKkmcLq8UF2cH24=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=cee9kv1dlrKVhxMW5tH7khU9AgHRB1B8WJmdSoWILLeEGzAM+riA7c+sc5foOziMOTX
 vrRECT5vvcuSTti+y4yRC242YI7C2ns+i6+ugUyfB7w4RT8kOp7fvRIXyg7CWgfKlcQB7
 /0RAOHkqZj74CV/Wf8nBYEqiSS/Mb8VXUH0=

From: Arnd Bergmann <arnd@arndb.de>

Some architectures that need to invalidate buffers after bidirectional
DMA because of speculative prefetching only do a simpler writeback
before that DMA, while architectures that don't need to do the second
invalidate tend to have a combined writeback+invalidate before the
DMA.

The behavior on mips is slightly inconsistent, as it always
does the invalidation before bidirectional DMA and conditionally
does it a second time.

In order to make the behavior the same as the rest, change it
so that there is exactly one invalidation here, either before
or after the DMA.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/mm/dma-noncoherent.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoheren=
t.c
index 3c4fc97b9f39..b4350faf4f1e 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -65,7 +65,11 @@ static inline void dma_sync_virt_for_device(void *addr=
, size_t size,
 		dma_cache_inv((unsigned long)addr, size);
 		break;
 	case DMA_BIDIRECTIONAL:
-		dma_cache_wback_inv((unsigned long)addr, size);
+		if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
+		    cpu_needs_post_dma_flush())
+			dma_cache_wback((unsigned long)addr, size);
+		else
+			dma_cache_wback_inv((unsigned long)addr, size);
 		break;
 	default:
 		BUG();
--=20
2.39.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#197): https://groups.io/g/linux-oxnas/message/197
Mute This Topic: https://groups.io/mt/97970103/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


