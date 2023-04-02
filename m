Return-Path: <bounce+16102+234+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 814736E4164
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:06 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id FProYY1809624xfQyjWNlvwz; Mon, 17 Apr 2023 00:42:04 -0700
X-Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.45974.1680446480037592213
 for <linux-oxnas@groups.io>;
 Sun, 02 Apr 2023 07:41:20 -0700
X-Received: by mail-wr1-f47.google.com with SMTP id j24so26874464wrd.0
        for <linux-oxnas@groups.io>; Sun, 02 Apr 2023 07:41:19 -0700 (PDT)
X-Gm-Message-State: UBkz00EjbVaNq5pSWVK8mwbux1808289AA=
X-Google-Smtp-Source: AKy350blBuOVV+IjEZR9/y8oar0G5BwMskydAcUw+0jw7gSYoEmOmZAUU8e+M2Tp1dBCe1Rkl1g83g==
X-Received: by 2002:adf:f38e:0:b0:2dc:c9c0:85cc with SMTP id m14-20020adff38e000000b002dcc9c085ccmr26600215wro.59.1680446478145;
        Sun, 02 Apr 2023 07:41:18 -0700 (PDT)
X-Received: from jernej-laptop.localnet ([209.198.137.155])
        by smtp.gmail.com with ESMTPSA id q10-20020a056000136a00b002c6e8cb612fsm7363100wrz.92.2023.04.02.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 07:41:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Subject: Re: [linux-oxnas] [PATCH net-next 01/11] net: stmmac: Make stmmac_pltfr_remove() return void
Date: Sun, 02 Apr 2023 16:41:14 +0200
Message-ID: <2674462.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
References: 
 <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,jernej.skrabec@gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717324;
 bh=HAzIoxpJIaDTMceHjjjclZgJhX5ryncy1NLIUuySq0U=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=V//dCMvSQVqCwlqeoF5HP1Cti9neCgZFla9pU1U4tUMcLVaMyrzADV0MZlKduPPu3Db
 Wqy/HIo1suDQgbv7+nhK2zonc2Ffe0hixKamNNnFM/sEsJy2Bk0h22w5iSO9dT5PLRh6p
 Yd6VqtQUgIKR+lvbagat5oQu0JN1Nm3nQn0=

Dne nedelja, 02. april 2023 ob 16:30:15 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
>=20
> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
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
>  drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 ++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c       | 2 +-

For sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   | 2 +-
>  17 files changed, 22 insertions(+), 33 deletions(-)





-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#234): https://groups.io/g/linux-oxnas/message/234
Mute This Topic: https://groups.io/mt/98314476/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


