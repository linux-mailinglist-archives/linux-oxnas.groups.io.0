Return-Path: <bounce+16102+182+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8B599786
	for <lists+linux-oxnas@lfdr.de>; Fri, 19 Aug 2022 10:44:10 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id uzjGYY1809624xld2Q0ZNzr6; Fri, 19 Aug 2022 01:44:09 -0700
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web08.14384.1660648073771120865
 for <linux-oxnas@groups.io>;
 Tue, 16 Aug 2022 04:07:54 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4474BB81675
	for <linux-oxnas@groups.io>; Tue, 16 Aug 2022 11:07:51 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2881C43140
	for <linux-oxnas@groups.io>; Tue, 16 Aug 2022 11:07:49 +0000 (UTC)
X-Received: by mail-qv1-f44.google.com with SMTP id j1so2807785qvv.8
        for <linux-oxnas@groups.io>; Tue, 16 Aug 2022 04:07:49 -0700 (PDT)
X-Gm-Message-State: qYCGpPHCGXflIGdmaecZMEI1x1808289AA=
X-Google-Smtp-Source: AA6agR6jPSaNNOF5k9aH9Wvt0lAB54bLIxg5uSvrINyZxUK1+FmKqYfk1bSdzRgwlPgw75Neoa0irEIOwci8GPjPWYs=
X-Received: by 2002:a05:6102:b14:b0:38a:88dd:c169 with SMTP id
 b20-20020a0561020b1400b0038a88ddc169mr8394631vst.84.1660648058275; Tue, 16
 Aug 2022 04:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com> <Yvtxv2jywm3+Q3ut@arm.com>
In-Reply-To: <Yvtxv2jywm3+Q3ut@arm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 16 Aug 2022 19:07:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Np=L9JcrGjh8zy1Kxb8b9f_dzD00kgV6odzZV-L5pbA@mail.gmail.com>
Message-ID: <CAAhV-H6Np=L9JcrGjh8zy1Kxb8b9f_dzD00kgV6odzZV-L5pbA@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Zi Yan <ziy@nvidia.com>, Linux-MM <linux-mm@kvack.org>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Mike Rapoport <rppt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Mike Rapoport <rppt@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	"David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	Ley Foon Tan <ley.foon.tan@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,chenhuacai@kernel.org
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1660898649;
 bh=DXXa3513dxoVN49JzMTbRnz5D/8+LM9PGZN65sroUOM=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=rr1uANTEisKAk8OVS6ZqlLzBGuOp1NcLYdOXd4Ooe+5BbyAIJpVkXB7EPeT+iEnVHdN
 vLGcP9c4Py9oTLno90bl70/281RUnET5/JwakTeZDnhJ3pQiU+gdV9LTlaQ7K5eg3k55Y
 QRGg3DYVH6B31j0MRvcCXUitaQuZmCYQhpw=

For LoongArch:

Acked-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Aug 16, 2022 at 6:30 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Aug 15, 2022 at 10:39:59AM -0400, Zi Yan wrote:
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 571cc234d0b3..c6fcd8746f60 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1401,7 +1401,7 @@ config XEN
> >       help
> >         Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
> >
> > -config FORCE_MAX_ZONEORDER
> > +config ARCH_FORCE_MAX_ORDER
> >       int
> >       default "14" if ARM64_64K_PAGES
> >       default "12" if ARM64_16K_PAGES
>
> For arm64:
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#182): https://groups.io/g/linux-oxnas/message/182
Mute This Topic: https://groups.io/mt/93120787/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


