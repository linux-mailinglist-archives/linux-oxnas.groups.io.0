Return-Path: <bounce+16102+224+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6126D1D4B
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:41 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id mnCRYY1809624xFegzYnch60; Fri, 31 Mar 2023 02:55:40 -0700
X-Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.50174.1680253323305274689
 for <linux-oxnas@groups.io>;
 Fri, 31 Mar 2023 02:02:03 -0700
X-Received: by mail-yb1-f182.google.com with SMTP id p203so26585022ybb.13
        for <linux-oxnas@groups.io>; Fri, 31 Mar 2023 02:02:03 -0700 (PDT)
X-Gm-Message-State: R6uYTP9dCFflyWm7nTHpPbU7x1808289AA=
X-Google-Smtp-Source: AKy350YI8e95DFYP40XLqEj+u/39+STuziGTnuEb3AUKVWMQr59PuRxxs6tiZPNOPKYnKLtLdYTZJpdc8TKai7hc3Ak=
X-Received: by 2002:a05:6902:1006:b0:b78:4b00:775f with SMTP id
 w6-20020a056902100600b00b784b00775fmr12714571ybt.4.1680253322494; Fri, 31 Mar
 2023 02:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-16-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-16-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 11:01:51 +0200
Message-ID: <CACRpkdbMry_UUYN1MuXTUpRXV+Tj9RSDvN-iBdvR8hDfkTaX4w@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches before DMA
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
 q=dns/txt; s=20140610; t=1680256540;
 bh=hRRJ/7qkHKsKE9LPpl8lhy0OUU3g8vtIFivDXEySoUI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=SpDzZ/qJw7z3K6P6ypct1bW9y9fqAai4sbTC3Aaul3dDbOAGleDR6f2vzqGzWnmdZ76
 FeI4B4IeSqCCKiqXE4O0b0yJrVh8iqC8/wWNC2KD0DQN9wVYkdrY2rnxcPk78D7GufyEL
 +sXkGFAVekF17asFhIsrbX6f1cd2d6u+1eo=

On Mon, Mar 27, 2023 at 2:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

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
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#224): https://groups.io/g/linux-oxnas/message/224
Mute This Topic: https://groups.io/mt/97970107/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


