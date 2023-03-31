Return-Path: <bounce+16102+225+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E19E6D1D4E
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:43 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id NsWnYY1809624x8H7ccgewuD; Fri, 31 Mar 2023 02:55:42 -0700
X-Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mx.groups.io with SMTP id smtpd.web10.50245.1680253712042483827
 for <linux-oxnas@groups.io>;
 Fri, 31 Mar 2023 02:08:34 -0700
X-Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48688)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1piAjS-0004Sf-1D; Fri, 31 Mar 2023 10:07:38 +0100
X-Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1piAjI-000119-8l; Fri, 31 Mar 2023 10:07:28 +0100
Date: Fri, 31 Mar 2023 10:07:28 +0100
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
Subject: Re: [linux-oxnas] [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches before DMA
Message-ID: <ZCai0FmZiOqsMkzc@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-16-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230327121317.4081816-16-arnd@kernel.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,linux@armlinux.org.uk
X-Gm-Message-State: FRsrFeFUUU01oQn7KhufX3R4x1808289AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256542;
 bh=DV0nmlaOwIX+XXHj+cSFaCX1C1tyFf6iUmF/uR0BumY=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=MPR7WjP14r6gJW73cZD4CyFwesLdnoVrokJQYvvVsUq7jjVcG5RVh/xm1MGUathPeSz
 PRlC2t3Xo1WNDmAzMjX6tT8PtlLdooc2uBQ9loplF6a9rWQYFGChcF4qOjPtcPGR5V4Ej
 U34URZ9VNQHyuZcj4vtiQjVJ0RiJbORt+OM=

On Mon, Mar 27, 2023 at 02:13:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most ARM CPUs can have write-back caches and that require
> cache management to be done in the dma_sync_*_for_device()
> operation. This is typically done in both writeback and
> writethrough mode.
> 
> The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
> (arm920t, arm940t) implementations are the exception here,
> and only do the cache management after the DMA is complete,
> in the dma_sync_*_for_cpu() operation.
> 
> Change this for consistency with the other platforms. This
> should have no user visible effect.

NAK...

The reason we do cache management _after_ is to ensure that there
is no stale data. The kernel _has_ (at the very least in the past)
performed DMA to data structures that are embedded within other
data structures, resulting in cache lines being shared. If one of
those cache lines is touched while DMA is progressing, then we
must to cache management _after_ the DMA operation has completed.
Doing it before is no good.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#225): https://groups.io/g/linux-oxnas/message/225
Mute This Topic: https://groups.io/mt/97970107/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


