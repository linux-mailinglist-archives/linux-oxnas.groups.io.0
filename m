Return-Path: <bounce+16102+238+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C06E4169
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:10 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id afw4YY1809624xmBzya8qMXN; Mon, 17 Apr 2023 00:42:09 -0700
X-Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.83670.1680554356108147118
 for <linux-oxnas@groups.io>;
 Mon, 03 Apr 2023 13:39:16 -0700
X-Received: by mail-ed1-f43.google.com with SMTP id y4so122390876edo.2
        for <linux-oxnas@groups.io>; Mon, 03 Apr 2023 13:39:15 -0700 (PDT)
X-Gm-Message-State: Ihqzlol73ACUdHnXTvLtaiadx1808289AA=
X-Google-Smtp-Source: AKy350Yxps2lCxD4+gSI3XRR+EKyXbQm+2ZcypH1MgOjQt3rpacSMedZmkVztU2IZX24o5jZNqKukzBRTVyKq2STkzU=
X-Received: by 2002:a05:6402:a47:b0:502:3e65:44f7 with SMTP id
 bt7-20020a0564020a4700b005023e6544f7mr10506548edb.3.1680554354318; Mon, 03
 Apr 2023 13:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de> <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
From: "Martin Blumenstingl via groups.io" <martin.blumenstingl=googlemail.com@groups.io>
Date: Mon, 3 Apr 2023 22:39:03 +0200
Message-ID: <CAFBinCBX8dQo9898KkXaMaanQ9-LcFA7HHFf+XBM2-f+g8WY7Q@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH net-next 01/11] net: stmmac: Make stmmac_pltfr_remove() return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,martin.blumenstingl@googlemail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717329;
 bh=Wr9b5GpvwW94FeZcA3zRQqQ7ironCHdIbMsFR2x8pu4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=U2Y+sjZNxgDkQJgZDKGDqHF9vKJ/Jv4BV1sIBXvQbq8iRCJdLasPePHGYPI+QRIAhyV
 CLV7IYlxKNfKOGdDxJFA0AKQlvDuM5/Nkks3Vsay1DcQeVoJ8pg0pu/QlW9J+sBL+nPva
 HPBODqvNaXVufb4iBuFrvrSRV+ykkUIGsTo=

On Sun, Apr 2, 2023 at 4:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
>
> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c  | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c     | 2 +-
for dwmac-meson and dwmac-meson8b:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#238): https://groups.io/g/linux-oxnas/message/238
Mute This Topic: https://groups.io/mt/98314476/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


