Return-Path: <bounce+16102+292+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A479D702982
	for <lists+linux-oxnas@lfdr.de>; Mon, 15 May 2023 11:50:33 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 4cBCYY1809624xmn9qO3bfer; Mon, 15 May 2023 02:50:31 -0700
X-Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mx.groups.io with SMTP id smtpd.web11.3424.1683672890015604373
 for <linux-oxnas@groups.io>;
 Tue, 09 May 2023 15:54:50 -0700
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
X-Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1qdIgl1tr2-00lTxs; Wed, 10
 May 2023 00:54:31 +0200
Date: Wed, 10 May 2023 00:54:29 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
	linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com,
	linux-stm32@st-md-mailman.stormreply.com,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	kernel@dh-electronics.com, Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <ZFrPJQdwoxqFpzUO@probook>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
X-Provags-ID: V03:K1:aR+k41JkL+Jax7RkQK1pXFPVqGsXbknpTCCf601eNGl3xQsbw4B
 lW4IptIuDnFJb+jaCScKg4f1qDLjuoiDEqEJsUWT/Ek6YzDXkULOeXYq9EqgQyN8A6axbG1
 JRKm5mq+iW4e1K1v2w2BOTrGSmAwegcfBLrzES8HGqnWOqrguxalKWu6+fqbhobKFkw7JNy
 qeUuaRpvcFFSSatMddRDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NarrxlSjiwo=;5z5rCQykqX1e+FbZ2ba6e5Rh6DH
 bfvBGeIXFywNjKNr0Tn58UPG96wezZLM4+H12pkCrjAC7Mqwg2PXJ70aoM1kBI8o+tAa0/419
 3XnQYa+XRlKna2zFjBCJKWpZoYii5XtCMCKO105lV0P6vMHckC89sxCK/LdwCvu0lF7OfocC+
 2ouaaWRHCt4YshSvfh5z/Ja+IC5J4jOv8eNZ6b4Ga79LPwxkC/RJjnB/nQ4E0edaxrobbRSOn
 Mpc/31AKJOkyrRi41IgtGWTEODyE2XZV00pU1y5sHoF3JU/eGsc2doa+Rrzh30STHQZStIaTS
 0sulR/BBWHEsrZf3LZvhDzOcbQ+0mpl9BfQXNLiDuCZay2ePoIqaUwts7JSoeIsxQHjZrbVOf
 h75oej0aNqoFhgx0M6WDh9xZydkRj4bbDxKZdwcWTSlHLDLbE26jSZC/2Oe+gjXSYJFSqcTIo
 y61XXOKn0w6OleXfF53iuFeaDOuP15yxKD4yYijJGDa3gETH/hjoY9RV4RF3njrNZ9cpp0pyL
 Wt5sq1md9IKuXv5zDNciEDB062aPPEfIdiuOL3ekvbmUkb/y0X/5vyJogDfXW1s/BcAt1Lw7O
 3fGQXfFWHtWSvKoTsdKwCQNoGLoqEX0ymmlOjO2H6zmOGgpDD61I3NBO058aLG0Ir0rXeho5F
 meMuCSguMavkm9x2cC+ehI31nsDXo/+BF4SlfWoDxIdTlxFojtrUwUJw55+y8lR/UsTKS8nM4
 UfuLe8Un7sHRz/mdblkfo8MYekpfSGy5OF1q4F6ySdpHLnN9/KLwguD2QRIXgxNbN+S3apSzh
 3RdOKnqeNprc0VYDcOdrgnL7BqsQDF2Rl2MSPh0TxeAydGQ6S6Uk6WUGWH/J/uB0ZIvQUETeq
 5wpcXi+kJF8q+LL66lQwIIQV2De+d1d5U2u4IhbVKY+H63H0/8T+2HkkllmX/vS+xMdVykkpc
 +lGd2EXuA+PHYRD1FvmkNVjxg7g=
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,j.neuschaefer@gmx.net
X-Gm-Message-State: rGWw00vQup76ep9SVxCd6D5Kx1808289AA=
Content-Type: multipart/mixed; boundary="Groupsio=hQYSUSMWES4U9JNyHoMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1684144231;
 bh=XM5QnZTxyirX2rORlFybvfnRXhpHWO0+XL+rt/Ln9OY=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=PlS0ddHYiJOWpkRtNaF/mwNrQfM5+bdWhFCuQK6r6tJE7okYxZ8xRbB5EEnZWluNC8F
 KNqawLocqoi5BAhHfrZRLlUaLBjVVQLqvD8vryS5B5SQ+kdTxezVrUlebNm4F1RUpWGqp
 76soscZh7mgpvSmeOuFYTyjrK8uPWwJCPzM=

--Groupsio=hQYSUSMWES4U9JNyHoMf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
[...]
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
>=20
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
>=20
> Here's the current mapping:
>=20
> vendor_map =3D {
[...]
>     'aspeed' : 'aspeed',
>     'ast2' : 'aspeed',
>     'facebook' : 'aspeed',
>     'ibm' : 'aspeed',

>     'openbmc' : 'aspeed',

The openbmc flash layouts are currently only used by aspeed devicetrees,
but they don't really depend on any aspeed details. It would be possible
to reuse them in Nuvoton BMC devicetrees in the future, for example.

In that sense, I think putting them in a separate "openbmc" directory
would be slightly better.


Jonathan



[...]
>     'nuvo' : 'nuvoton',
[...]
> }
>=20
> Rob
>=20
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-=
move-v2


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#292): https://groups.io/g/linux-oxnas/message/292
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--Groupsio=hQYSUSMWES4U9JNyHoMf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmRazv0ACgkQCDBEmo7z
X9tB/A//Y5MU9b+r/mxCUuxjsa0CB4Ewu8xmc+YTd1pdMEIrJYfgdpXFskBmzFsg
QFYR1gBnq7P4mhusW4RaYWxpzD3M45B2vIuhgL6t8lqIWae0UuNbPEO4rbCIbvGZ
PCx1dTAGZ2vg+mxRK0OYouuCE9EvgrC9PGmOcgDkqCLngGsr11gXz0GMNebggmie
TX8iauQHnzfGaSQWtwIdQRu1gj2d/VO5NSn4CrgvMIuLCSwhTwY+e9H9/+CcrqHK
wNiMG0W8yY5CMO7ZSYf7EkEidunJ0htwqJmUoLfpqN4NZ/21yno69v+L36ZRu/lq
+KrZJeaXC3Ar39R2x75Pns5em46uwJJdI5aXumj9xPU3A3rgWCQcrECZJ7i/HEoK
hzhnsQhJNP4jAPVxdiaWJTYUXHRwafI6/GVvj1BvfgqZ9VHE28iGdDcgVvOfmkDx
eRZQxcJzFaWZeWTOeM05/dHUDUJXFrYvDsj0+FgneBU/oqEc+H4bR9AP2ttU24hU
4jBq2I2FlDyKlC0ARS22oRQlZG6KS50d1Nvx6cLr7lxeOHmcW09dPCqHijQVtX3V
f/Z7MYrDEXgTK8r1wJk6PuvVN+jFX/l/Ali5L/OJqUsZB4bgteXKEWXWMmgik1/I
d3nr3gTYEaykVkjCJORFKu4G2FHrzWgWpFYsl8Mu+safGLa+rdA=
=Jzyt
-----END PGP SIGNATURE-----

--Groupsio=hQYSUSMWES4U9JNyHoMf--
