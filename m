Return-Path: <bounce+16102+218+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E562B6D1D3E
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:35 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id orwnYY1809624xBM1Ix9opmU; Fri, 31 Mar 2023 02:55:34 -0700
X-Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.19933.1680163932071783513
 for <linux-oxnas@groups.io>;
 Thu, 30 Mar 2023 01:12:12 -0700
X-Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-536af432ee5so341331747b3.0
        for <linux-oxnas@groups.io>; Thu, 30 Mar 2023 01:12:11 -0700 (PDT)
X-Gm-Message-State: 7yYPAyWnTLUM64aU7yIy3MsSx1808289AA=
X-Google-Smtp-Source: AKy350a/1aBIXwj5sRzvro+POKQZrQ8u1qzHA9lYRVf8cH3+kLmmcEZ591QzYhrOYx7KtYdusctEvAjdnpZqGPXhdtA=
X-Received: by 2002:a81:c84a:0:b0:541:753d:32f9 with SMTP id
 k10-20020a81c84a000000b00541753d32f9mr10995359ywl.9.1680163931243; Thu, 30
 Mar 2023 01:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-19-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-19-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Mar 2023 10:12:00 +0200
Message-ID: <CACRpkdYuyzkvSQY0sQJei39d9ZoGM_DbJQ5LxUg3sXsBmzJyaQ@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, Daniel Golle <daniel@makrotopia.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256534;
 bh=PBBeYbZiYlObfc3UkWlqThvKoTKlWYtyvCmFnt2t79E=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=R37RBz/MFYAWM7TBWNcb4huSXAyDDgabqcPexIqdQygBZHBYEyU+aVAqefGDAvpILoj
 vPqVS4i4zO0OyVF6MY9ckYVl2IFozHihfzUQp0D3qrbcmLpt/LUw6wC4jevkMLmvvOAv9
 Otl2CMduHRpphr5keMdTK4JBULinyrAyIpg=

On Mon, Mar 27, 2023 at 2:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The cache management operations for noncoherent DMA on ARMv6 work
> in two different ways:
>
>  * When CONFIG_DMA_CACHE_RWFO is set, speculative prefetches on in-flight
>    DMA buffers lead to data corruption when the prefetched data is writte=
n
>    back on top of data from the device.
>
>  * When CONFIG_DMA_CACHE_RWFO is disabled, a cache flush on one CPU
>    is not seen by the other core(s), leading to inconsistent contents
>    accross the system.
>
> As a consequence, neither configuration is actually safe to use in a
> general-purpose kernel that is used on both MPCore systems and ARM1176
> with prefetching enabled.
>
> We could add further workarounds to make the behavior more dynamic based
> on the system, but realistically, there are close to zero remaining
> users on any ARM11MPCore anyway, and nobody seems too interested in it,
> compared to the more popular ARM1176 used in BMC2835 and AST2500.
>
> The Oxnas platform has some minimal support in OpenWRT, but most of the
> drivers and dts files never made it into the mainline kernel, while the
> Arm Versatile/Realview platform mainly serves as a reference system but
> is not necessary to be kept working once all other ARM11MPCore are gone.
>
> Take the easy way out here and drop support for multiprocessing on
> ARMv6, along with the CONFIG_DMA_CACHE_RWFO option and the cache
> management implementation for it. This also helps with other ARMv6
> issues, but for the moment leaves the ability to build a kernel that
> can run on both ARMv7 SMP and single-processor ARMv6, which we probably
> want to stop supporting as well, but not as part of this series.
>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Daniel Golle <daniel@makrotopia.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-oxnas@groups.io
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Yeah, we discussed this earlier, let's just drop it. Not worth the effort.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#218): https://groups.io/g/linux-oxnas/message/218
Mute This Topic: https://groups.io/mt/97970110/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


