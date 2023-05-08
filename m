Return-Path: <bounce+16102+288+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70A6FCB34
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:21 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id nMDIYY1809624xihldnw9Cm3; Tue, 09 May 2023 09:19:20 -0700
X-Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.81.1683574734029045206
 for <linux-oxnas@groups.io>;
 Mon, 08 May 2023 12:38:54 -0700
X-Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-965ddb2093bso626173566b.2
        for <linux-oxnas@groups.io>; Mon, 08 May 2023 12:38:53 -0700 (PDT)
X-Gm-Message-State: defKaVhrF9TFu7H4dLraIJmLx1808289AA=
X-Google-Smtp-Source: ACHHUZ6dsVgo1prYYtLrJg0gIiYhBjQNx+st7OeU+cr1SkPuxS+S4CB5SSBSFTCcvBvNJKZ/6ClIl+DTCz2pkxjEmWc=
X-Received: by 2002:a17:906:dac5:b0:94a:4fc5:4c2e with SMTP id
 xi5-20020a170906dac500b0094a4fc54c2emr9330195ejb.49.1683574732223; Mon, 08
 May 2023 12:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de> <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
From: "Martin Blumenstingl via groups.io" <martin.blumenstingl=googlemail.com@groups.io>
Date: Mon, 8 May 2023 21:38:41 +0200
Message-ID: <CAFBinCAXQywWReBbqRCgB36gKGjhX9Tx6g-8OTewt_xipdhp3w@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH net-next v2 01/11] net: stmmac: Make stmmac_pltfr_remove() return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	Simon Horman <simon.horman@corigine.com>
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
 q=dns/txt; s=20140610; t=1683649160;
 bh=cKdMxsHX+FDtb8XvWBlMGf3pQ8RkdkxnCQIRXdASpUw=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=baq//emVkKjk8W48QSxt82/mZN/Q8NseqKx/lOQ+eY21qCb8EXCspl92B9qZVdlPsvk
 uodVSIRr8tm8yWPjHUBtbWO6mCUbS+tXEFbsCHsNe/eD0Np9pFp8jvHEMRtst4SzYIg6+
 bovobHz/BXxMT48zG/n+9k0vzYR20qxK2Wc=

On Mon, May 8, 2023 at 4:27=E2=80=AFPM Uwe Kleine-K=C3=B6nig
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
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
For these two Amlogic Meson drivers:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#288): https://groups.io/g/linux-oxnas/message/288
Mute This Topic: https://groups.io/mt/98787605/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


