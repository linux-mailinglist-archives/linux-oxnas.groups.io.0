Return-Path: <bounce+16102+242+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B026E416D
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:13 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id fVrIYY1809624xW8obA5BIgz; Mon, 17 Apr 2023 00:42:12 -0700
X-Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.2747.1680855061896498832
 for <linux-oxnas@groups.io>;
 Fri, 07 Apr 2023 01:11:02 -0700
X-Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D70776000C;
	Fri,  7 Apr 2023 08:10:44 +0000 (UTC)
Date: Fri, 7 Apr 2023 10:10:43 +0200
From: "Miquel Raynal via groups.io" <miquel.raynal=bootlin.com@groups.io>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Yang Yingliang <yangyingliang@huawei.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Valentin Korenblit
 <vkorenblit@sequans.com>, Wang Weiyang <wangweiyang2@huawei.com>, Pali
 =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Marek =?UTF-8?B?QmVow7pu?=
 <kabel@kernel.org>, Han Xu <han.xu@nxp.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy
 <vz@mleia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Liang Yang <liang.yang@amlogic.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Phil Edworthy
 <phil.edworthy@renesas.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Roger Quadros <rogerq@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Manivannan Sadhasivam
 <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linus
 Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Miaoqian Lin <linmq006@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Jack Wang <jinpu.wang@ionos.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach
 <dev@lynxeye.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Jerome
 Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: Re: [linux-oxnas] [PATCH 00/49] mtd: nand: Convert to platform remove callback returning void
Message-ID: <20230407101043.299f5e22@xps-13>
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,miquel.raynal@bootlin.com
X-Gm-Message-State: v7vef3zmeZxchb7yZTI3yRnqx1808289AA=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717332;
 bh=CEt4Y6BqLIMQShGrIhAsP4RreWyYkqbHsohlissz+hA=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=N3mx2eYzl1mXvCOB/cKZpH471EHdv6oPQ2xRBaBRT7+AsUzaeE/NFOoO/Xp28f1BnmC
 FyiXkbRL7Gudshovh8nwfuPbyqhsd4wjo99m18KLb/TWFXMKByIX62AcUkS1LPGIk6oKI
 0OsbWse99n5pvOKqjGsIXlZ4oXQS4z28Z+Y=

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Sat,  1 Apr 2023 18:18:49 +0200:

> Hello,
>=20
> this series adapts the platform drivers below drivers/mtd/nand to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
>=20
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
>=20
> As all drivers already return 0 in their .remove callback, they can be
> converted trivially.

I've looked at the different patches, they look good to me but as they
are all trivial and exactly identical, would you mind sending this
again all squashed in a single patch? A subsystem-wide conversion seems
appropriate. In all cases I plan to take this for the next merge
window.

I've collected the tags received so far if you want:

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # atmel
Reviewed-by: Paul Cercueil <paul@crapouillou.net> # ingenic
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> # ingenic
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # intel
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # mes=
on
Acked-by: Roger Quadros <rogerq@kernel.org> # omap
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Reviewed-by: Heiko Stuebner <heiko@sntech.de> # rockchip
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> # sunxi
Acked-by: Thierry Reding <treding@nvidia.com> # tegra

BTW, thanks to all of you who reviewed and answered to this thread!
This is highly appreciated.=20

Thanks,
Miqu=C3=A8l


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#242): https://groups.io/g/linux-oxnas/message/242
Mute This Topic: https://groups.io/mt/98314477/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


