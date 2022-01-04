Return-Path: <bounce+16102+148+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F20483E57
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 09:42:27 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id vtn7YY1809624xLeNZQC4syC; Tue, 04 Jan 2022 00:42:25 -0800
X-Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.4223.1641285744091359709
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 00:42:24 -0800
X-Received: by mail-wr1-f51.google.com with SMTP id s1so74630573wra.6
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 00:42:23 -0800 (PST)
X-Gm-Message-State: e7TGxV9YofwcEyBLv1x7hIMRx1808289AA=
X-Google-Smtp-Source: ABdhPJz+klqyzLgB8Ih+zYN1plyHR9OQ5WQs4Sk3Da4D+c9ZDZbfpGhv3+zj/sjyuElh2AEzzQzS/Q==
X-Received: by 2002:a5d:4568:: with SMTP id a8mr42639622wrc.471.1641285742516;
        Tue, 04 Jan 2022 00:42:22 -0800 (PST)
X-Received: from ?IPv6:2001:861:44c0:66c0:f6da:6ac:481:1df0? ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id n8sm39740782wri.47.2022.01.04.00.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 00:42:22 -0800 (PST)
Subject: Re: [linux-oxnas] [PATCH net-next 2/3] net: stmmac: dwmac-oxnas: Add support for OX810SE
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-kernel@vger.kernel.org
References: <20220103175638.89625-1-narmstrong@baylibre.com>
 <20220103175638.89625-3-narmstrong@baylibre.com>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4a0ea0f1-9cc5-a242-75af-ed4bd0537b16@baylibre.com>
Date: Tue, 4 Jan 2022 09:42:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103175638.89625-3-narmstrong@baylibre.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1641285745;
 bh=nLYhtxCGaDWtikEiqJQTiYOaqsWXfIvkFhdk+QyVvpk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=MMACTw2f5LSh78FWrS4ClQx8LNI4VfW2eh5K7++SsxPdUrMehXjSP1nUn1O6QHV7exZ
 6FsKme5o8cBLHY05ag/CCBAcLs3iF5872wXCqVs9eBb65Rtl/HyQlhFsig1mV/kjVQ7qZ
 RbNHIIgjxxseEfC6J5Hz18y7VSkFyImwDCQ=

On 03/01/2022 18:56, Neil Armstrong wrote:
> Add support for OX810SE dwmac glue setup, which is a simplified version
> of the OX820 introduced later with more control on the PHY interface.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-oxnas.c | 92 ++++++++++++++-----
>  1 file changed, 70 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-oxnas.c
> index adfeb8d3293d..7ffa4a4eb30f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> @@ -48,12 +49,58 @@
>  #define DWMAC_RX_VARDELAY(d)		((d) << DWMAC_RX_VARDELAY_SHIFT)
>  #define DWMAC_RXN_VARDELAY(d)		((d) << DWMAC_RXN_VARDELAY_SHIFT)
> =20
> +struct oxnas_dwmac;
> +
> +struct oxnas_dwmac_data {
> +	void (*setup)(struct oxnas_dwmac *dwmac);
> +};
> +
>  struct oxnas_dwmac {
>  	struct device	*dev;
>  	struct clk	*clk;
>  	struct regmap	*regmap;
> +	const struct oxnas_dwmac_data	*data;
>  };
> =20
> +static void oxnas_dwmac_setup_ox810se(struct oxnas_dwmac *dwmac)
> +{
> +	unsigned int value;
> +
> +	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY *=
/
> +	value =3D BIT(DWMAC_CKEN_GTX)		|
> +		 /* Use simple mux for 25/125 Mhz clock switching */
> +		 BIT(DWMAC_SIMPLE_MUX);
> +
> +	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
> +}
> +
> +static void oxnas_dwmac_setup_ox820(struct oxnas_dwmac *dwmac)
> +{
> +	unsigned int value;
> +
> +	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY *=
/
> +	value =3D BIT(DWMAC_CKEN_GTX)		|
> +		 /* Use simple mux for 25/125 Mhz clock switching */
> +		BIT(DWMAC_SIMPLE_MUX)		|
> +		/* set auto switch tx clock source */
> +		BIT(DWMAC_AUTO_TX_SOURCE)	|
> +		/* enable tx & rx vardelay */
> +		BIT(DWMAC_CKEN_TX_OUT)		|
> +		BIT(DWMAC_CKEN_TXN_OUT)	|
> +		BIT(DWMAC_CKEN_TX_IN)		|
> +		BIT(DWMAC_CKEN_RX_OUT)		|
> +		BIT(DWMAC_CKEN_RXN_OUT)	|
> +		BIT(DWMAC_CKEN_RX_IN);
> +	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
> +
> +	/* set tx & rx vardelay */
> +	value =3D DWMAC_TX_VARDELAY(4)	|
> +		DWMAC_TXN_VARDELAY(2)	|
> +		DWMAC_RX_VARDELAY(10)	|
> +		DWMAC_RXN_VARDELAY(8);
> +	regmap_write(dwmac->regmap, OXNAS_DWMAC_DELAY_REGOFFSET, value);
> +}
> +
>  static int oxnas_dwmac_init(struct platform_device *pdev, void *priv)
>  {
>  	struct oxnas_dwmac *dwmac =3D priv;
> @@ -75,27 +122,7 @@ static int oxnas_dwmac_init(struct platform_device *p=
dev, void *priv)
>  		return ret;
>  	}

There's an issue with the patch, the value read from register is not used, =
I'll send a V2 with the fix.

Neil

> =20
> -	/* Enable GMII_GTXCLK to follow GMII_REFCLK, required for gigabit PHY *=
/
> -	value |=3D BIT(DWMAC_CKEN_GTX)		|
> -		 /* Use simple mux for 25/125 Mhz clock switching */
> -		 BIT(DWMAC_SIMPLE_MUX)		|
> -		 /* set auto switch tx clock source */
> -		 BIT(DWMAC_AUTO_TX_SOURCE)	|
> -		 /* enable tx & rx vardelay */
> -		 BIT(DWMAC_CKEN_TX_OUT)		|
> -		 BIT(DWMAC_CKEN_TXN_OUT)	|
> -		 BIT(DWMAC_CKEN_TX_IN)		|
> -		 BIT(DWMAC_CKEN_RX_OUT)		|
> -		 BIT(DWMAC_CKEN_RXN_OUT)	|
> -		 BIT(DWMAC_CKEN_RX_IN);
> -	regmap_write(dwmac->regmap, OXNAS_DWMAC_CTRL_REGOFFSET, value);
> -
> -	/* set tx & rx vardelay */
> -	value =3D DWMAC_TX_VARDELAY(4)	|
> -		DWMAC_TXN_VARDELAY(2)	|
> -		DWMAC_RX_VARDELAY(10)	|
> -		DWMAC_RXN_VARDELAY(8);
> -	regmap_write(dwmac->regmap, OXNAS_DWMAC_DELAY_REGOFFSET, value);
> +	dwmac->data->setup(dwmac);
> =20
>  	return 0;
>  }
> @@ -128,6 +155,12 @@ static int oxnas_dwmac_probe(struct platform_device =
*pdev)
>  		goto err_remove_config_dt;
>  	}
> =20
> +	dwmac->data =3D (const struct oxnas_dwmac_data *)of_device_get_match_da=
ta(&pdev->dev);
> +	if (!dwmac->data) {
> +		ret =3D -EINVAL;
> +		goto err_remove_config_dt;
> +	}
> +
>  	dwmac->dev =3D &pdev->dev;
>  	plat_dat->bsp_priv =3D dwmac;
>  	plat_dat->init =3D oxnas_dwmac_init;
> @@ -166,8 +199,23 @@ static int oxnas_dwmac_probe(struct platform_device =
*pdev)
>  	return ret;
>  }
> =20
> +static const struct oxnas_dwmac_data ox810se_dwmac_data =3D {
> +	.setup =3D oxnas_dwmac_setup_ox810se,
> +};
> +
> +static const struct oxnas_dwmac_data ox820_dwmac_data =3D {
> +	.setup =3D oxnas_dwmac_setup_ox820,
> +};
> +
>  static const struct of_device_id oxnas_dwmac_match[] =3D {
> -	{ .compatible =3D "oxsemi,ox820-dwmac" },
> +	{
> +		.compatible =3D "oxsemi,ox810se-dwmac",
> +		.data =3D &ox810se_dwmac_data,
> +	},
> +	{
> +		.compatible =3D "oxsemi,ox820-dwmac",
> +		.data =3D &ox820_dwmac_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, oxnas_dwmac_match);
>=20



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#148): https://groups.io/g/linux-oxnas/message/148
Mute This Topic: https://groups.io/mt/88117938/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


