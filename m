Return-Path: <bounce+16102+212+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979D6D1D3D
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:34 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id I9HZYY1809624xWQ6JCdJcmf; Fri, 31 Mar 2023 02:55:32 -0700
X-Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mx.groups.io with SMTP id smtpd.web10.37359.1679929374432426499
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 08:02:55 -0700
X-Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58066)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pgoM7-00040C-4u; Mon, 27 Mar 2023 16:01:55 +0100
X-Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pgoLv-0005Vg-EZ; Mon, 27 Mar 2023 16:01:43 +0100
Date: Mon, 27 Mar 2023 16:01:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org
Subject: Re: [linux-oxnas] [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean() helper
Message-ID: <ZCGv18wnEtoFvtfM@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230327121317.4081816-21-arnd@kernel.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,linux@armlinux.org.uk
X-Gm-Message-State: Jg0q4KbzARZcshCbSeZVq1dVx1808289AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256532;
 bh=mY8LTyAmMOWFuYuGqrV9i73TONDju5PdELrCyr4s+q4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=wTk0fFsoCdSsdvLdBOqY5K17eDGcdpk+GjzHxbkJOyB/fjKypIxySG+yGK5NrGi3Dx3
 DSkWHFfFsiFcTIpGXY+qp8EgyYpdCQEVXCRQLsWO7UiFzf0SgUE/CIXirfzeMPGq1fj2+
 nT0qvpbAld4kmGKMBoe/6jUbUEAg5+2A8zY=

On Mon, Mar 27, 2023 at 02:13:16PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The arm version of the arch_sync_dma_for_cpu() function annotates pages as
> PG_dcache_clean after a DMA, but no other architecture does this here.

... because this is an arm32 specific feature. Generically, it's
PG_arch_1, which is a page flag free for architecture use. On arm32
we decided to use this to mark whether we can skip dcache writebacks
when establishing a PTE - and thus it was decided to call it
PG_dcache_clean to reflect how arm32 decided to use that bit.

This isn't just a DMA thing, there are other places that we update
the bit, such as flush_dcache_page() and copy_user_highpage().

So thinking that the arm32 PG_dcache_clean is something for DMA is
actually wrong.

Other architectures are free to do their own other optimisations
using that bit, and their implementations may be DMA-centric.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#212): https://groups.io/g/linux-oxnas/message/212
Mute This Topic: https://groups.io/mt/97970112/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


