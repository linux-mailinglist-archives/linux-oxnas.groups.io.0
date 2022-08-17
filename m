Return-Path: <bounce+16102+183+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB7599787
	for <lists+linux-oxnas@lfdr.de>; Fri, 19 Aug 2022 10:44:12 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id PskXYY1809624x6snckdQtO4; Fri, 19 Aug 2022 01:44:10 -0700
X-Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by mx.groups.io with SMTP id smtpd.web08.25908.1660718234573985739
 for <linux-oxnas@groups.io>;
 Tue, 16 Aug 2022 23:37:16 -0700
X-Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M6ywr2Fflz4x3w;
	Wed, 17 Aug 2022 16:36:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zi Yan <zi.yan@sent.com>, linux-mm@kvack.org
Cc: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A
 . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz
 <mike.kravetz@oracle.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi
 <shy828301@gmail.com>, David Rientjes <rientjes@google.com>, James
 Houghton <jthoughton@google.com>, Mike Rapoport <rppt@kernel.org>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vineet
 Gupta <vgupta@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Taichi
 Sugaya <sugaya.taichi@socionext.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen
 <dinguyen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller"
 <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Arnd Bergmann
 <arnd@arndb.de>, Ley Foon Tan <ley.foon.tan@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [linux-oxnas] [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
References: <20220815143959.1511278-1-zi.yan@sent.com>
Date: Wed, 17 Aug 2022 16:36:57 +1000
Message-ID: <87tu6bv0ja.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,mpe@ellerman.id.au
X-Gm-Message-State: m2rlbsGFKx4Ru8vmGNwU0j2Qx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1660898650;
 bh=LjtDy6Fhr0kDkyQYk8XoicoWGA27FkzAIaWQkNE2WVE=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=s7896NZ4WcAwlMe8rBSWG25G1+Tv6S79EKCXrk2QazV0iIYqlFObVw0h1qaOTiX/67L
 QL5EA8sIEd7qfCeVqHhPDuSLKsyqSLGx390X3gCFhvWOEuxeqebXYhgE2u6rmhslcNPXD
 93xLO8B75lqVqQLFEZKeG1oqBYdJNLEULQ8=

Zi Yan <zi.yan@sent.com> writes:
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
...
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#183): https://groups.io/g/linux-oxnas/message/183
Mute This Topic: https://groups.io/mt/93120787/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


