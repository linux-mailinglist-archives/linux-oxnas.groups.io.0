Return-Path: <bounce+16102+245+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D246E4170
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:16 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id NYCxYY1809624xb9kOb3BDm4; Mon, 17 Apr 2023 00:42:14 -0700
X-Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.8712.1681201247853712198
 for <linux-oxnas@groups.io>;
 Tue, 11 Apr 2023 01:20:48 -0700
X-Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 86501C000B;
	Tue, 11 Apr 2023 08:20:25 +0000 (UTC)
Date: Tue, 11 Apr 2023 10:20:25 +0200
From: "Miquel Raynal via groups.io" <miquel.raynal=bootlin.com@groups.io>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>, Vignesh
 Raghavendra <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
 Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>, Naga
 Sureshkumar Relli <nagasure@xilinx.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, linux-amlogic@lists.infradead.org, Chuanhong
 Guo <gch981213@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Heiko
 Stuebner <heiko@sntech.de>, Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Yang
 Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de, Arnd Bergmann
 <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, ye xingchen
 <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>, Roger Quadros
 <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Stephen Boyd <sboyd@kernel.org>, Valentin
 Korenblit <vkorenblit@sequans.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org, Kyungmin
 Park <kyungmin.park@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>
Subject: Re: [linux-oxnas] [PATCH] mtd: nand: Convert to platform remove callback returning void
Message-ID: <20230411102025.6b2fdc9e@xps-13>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
	<20230407101043.299f5e22@xps-13>
	<20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
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
X-Gm-Message-State: lqbSlTUEyNfudvr3JLspQ4Qfx1808289AA=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717334;
 bh=OsfVe8R3garwsT53Ci5bsA9eSaBs1EFWhlPrsGBO8xo=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=gnaLVNHwWbls4fSUYucQ18J0C3eY0bpRZdEujRApQVvmaRU/ZfxirQjeNdvALdGwIQY
 I29/mcNM6pUyHgMu18tH23PO0Bh8ZRL5cCmaT1KaaobCUcFpehZg+Dl7koh3vEhK8NAJV
 xK3G3kMUW09FO4Mi4pwJwR35hRPReWdnoHs=

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Sat, 8 Apr 2023 20:53:32 +0200:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>=20
> Hey Miquel,
>=20
> On Fri, Apr 07, 2023 at 10:10:43AM +0200, Miquel Raynal wrote:
> > I've looked at the different patches, they look good to me but as they
> > are all trivial and exactly identical, would you mind sending this
> > again all squashed in a single patch? A subsystem-wide conversion seems
> > appropriate. In all cases I plan to take this for the next merge
> > window. =20
>=20
> I slightly prefer them separately, because I like small patches and
> because the Acks and Reviews only apply to the individual drivers.
> But I don't mind seriously, so here comes the series squashed into one.

For any non trivial change, I would definitely do that as well.

The thing is, by collecting the tags with b4, you lost all the Acks and
Reviews targets, while we could prevent this, see below.

> While going through the changed, probably the s3c24xx driver (which
> isn't exactly identical to the other changes) could benefit from an
> additional change throwing out the early exit (which---I guess---cannot
> be hit).

Yes, I believe the 'info =3D=3D NULL' condition is useless, feel free to
drop it in a second patch if you wish.

> BTW, I constructed the lists of acks/reviews myself and found the same
> set. However b4 wailed about each patch claiming:
>=20
> 	    =E2=9C=97 BADSIG: DKIM/infradead.org

No idea what this means, any pointer?

> And it didn't like you producing the tags, saying:
>=20
> 	NOTE: some trailers ignored due to from/email mismatches:
> 	    ! Trailer: Acked-by: Roger Quadros <rogerq@kernel.org>
> 	     Msg From: Miquel Raynal <miquel.raynal@bootlin.com>
> 	    [...]

Well, yes, I don't expect b4 to read plain english when I say "I
collected them for you" ^^ But at least my list had a '# <area>' suffix
for each of the Acked and Reviewed changes, which is now missing. I
don't know  how useful they actually are, but it seems to me that the
information was lost between v1 and v2?

Thanks,
Miqu=C3=A8l


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#245): https://groups.io/g/linux-oxnas/message/245
Mute This Topic: https://groups.io/mt/98314480/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


