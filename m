Return-Path: <bounce+16102+214+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5656D1D38
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:30 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id sOCwYY1809624xWPkJzhnHex; Fri, 31 Mar 2023 02:55:29 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.7996.1680120981737492602
 for <linux-oxnas@groups.io>;
 Wed, 29 Mar 2023 13:16:21 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0ABA761DEE;
	Wed, 29 Mar 2023 20:16:21 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEB3C433D2;
	Wed, 29 Mar 2023 20:16:12 +0000 (UTC)
Date: Wed, 29 Mar 2023 21:16:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [linux-oxnas] [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional DMA
Message-ID: <764e8d2f-ed98-49dc-8fdb-112d59359148@spud>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-10-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,conor@kernel.org
X-Gm-Message-State: 7N8sWhPbdDOm65mqt9w4qkdGx1808289AA=
Content-Type: multipart/mixed; boundary="Groupsio=fSJCH7eyUODu5KlXAeOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256529;
 bh=nnbqpUciWlrpbb1uT/zCxWrN/LdBUGwfSWZ56k9Re/M=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=eFGLLduVOVWk0CVK2ywa7Ev2vjxxUtwXBJNl8b6RodkWty64vlnDosybV2E3SivtTcE
 vgMd22aez1ANUCQxDZhGXlFPTLZFWiVeTsw8ByFuuBHzyBsSKqNO0KMddw8GaajtMLfpz
 QaYWhN/T0jbCRHWCqTIha1h51YdiVHIhgEw=

--Groupsio=fSJCH7eyUODu5KlXAeOC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 02:13:05PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
>=20
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.

Rationale makes sense to me..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for working on all of this Arnd!


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#214): https://groups.io/g/linux-oxnas/message/214
Mute This Topic: https://groups.io/mt/97970101/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--Groupsio=fSJCH7eyUODu5KlXAeOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCScigAKCRB4tDGHoIJi
0jHpAP47kMhf2uxHoGKhD+jHsEYnFgTHptLnAfIJV6N+QeFoOAD/YxG6hd8qhesW
6Tw9EqBEW/4auX2CLsbK7xE8fP5A9wg=
=os1C
-----END PGP SIGNATURE-----

--Groupsio=fSJCH7eyUODu5KlXAeOC--
