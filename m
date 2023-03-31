Return-Path: <bounce+16102+226+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E889F6D1D4F
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:44 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id m8ejYY1809624xCk12UFwcsT; Fri, 31 Mar 2023 02:55:43 -0700
X-Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.50282.1680253857560267190
 for <linux-oxnas@groups.io>;
 Fri, 31 Mar 2023 02:10:57 -0700
X-Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54184571389so403655837b3.4
        for <linux-oxnas@groups.io>; Fri, 31 Mar 2023 02:10:57 -0700 (PDT)
X-Gm-Message-State: yymgYGhnpvltjNbyVfVAfM1nx1808289AA=
X-Google-Smtp-Source: AKy350bTzBXM6ycL3U98ZDogsouHVf6LJB3iu5qAKOjHJ8TlZEoTyW1DjaakW8G4QqD9ZcHPHI8e6e7vqfXcHXD2Pfk=
X-Received: by 2002:a81:b388:0:b0:545:8202:bbcf with SMTP id
 r130-20020a81b388000000b005458202bbcfmr12463339ywh.9.1680253856716; Fri, 31
 Mar 2023 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-18-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-18-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 11:10:44 +0200
Message-ID: <CACRpkdZdnTX4-jnnXZveXxwOg76yH4Zyoa-ZSGeC7KzOnn+6Lg@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH 17/21] ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}() internally
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
	linux-xtensa@linux-xtensa.org
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
 q=dns/txt; s=20140610; t=1680256543;
 bh=3ebiWtQ5rdzxkRU4YxMvVtCT3NnbsDlgvu+wtVE3m+s=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=SgEI5L3EI9uyWHTjXI6KZn7yDYH7LW+0FNmxO+cEvsCJTF5C+478gNP4phbj2eD65Y7
 4L4MsAlXoyDNrjlPHuGOr+YU6UqW+4HNUPSPIi5cEYIfoqg/3b6akqQ02JUkUxdWd2RkH
 gAFA6DNLxuqdIyWINdKZ5SpVzZdKBs0dszc=

On Mon, Mar 27, 2023 at 2:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm specific iommu code in dma-mapping.c uses the page+offset based
> __dma_page_cpu_to_dev()/__dma_page_dev_to_cpu() helpers in place of the
> phys_addr_t based arch_sync_dma_for_device()/arch_sync_dma_for_cpu()
> wrappers around the.

Broken sentence?

> In order to be able to move the latter part set of functions into
> common code, change the iommu implementation to use them directly
> and remove the internal ones as a separate interface.
>
> As page+offset and phys_address are equivalent, but are used in
> different parts of the code here, this allows removing some of
> the conversion but adds them elsewhere.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me, took me some time to verify and understand
the open-coded version of PFN_UP() and this refactoring alone
makes the patch highly valuable.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#226): https://groups.io/g/linux-oxnas/message/226
Mute This Topic: https://groups.io/mt/97970109/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


