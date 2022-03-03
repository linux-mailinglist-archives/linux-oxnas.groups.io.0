Return-Path: <bounce+16102+165+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7FC4CB84F
	for <lists+linux-oxnas@lfdr.de>; Thu,  3 Mar 2022 09:07:18 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id 4t4JYY1809624xebQxsu6RRV; Thu, 03 Mar 2022 00:07:17 -0800
X-Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.8719.1646294834252998922
 for <linux-oxnas@groups.io>;
 Thu, 03 Mar 2022 00:07:15 -0800
X-Received: by mail-wm1-f46.google.com with SMTP id r187-20020a1c2bc4000000b003810e6b192aso2734468wmr.1
        for <linux-oxnas@groups.io>; Thu, 03 Mar 2022 00:07:13 -0800 (PST)
X-Gm-Message-State: ky2UpoDZ3LukKuzvuc1q0aZWx1808289AA=
X-Google-Smtp-Source: ABdhPJxssSWDTS0arUsVI2AtPzFrsJyLEpnlrXh0+Wuj4W0lgc2VDglTI9bvy0zswsg7KY/31OI4Qw==
X-Received: by 2002:a05:600c:3546:b0:381:7a9d:eee2 with SMTP id i6-20020a05600c354600b003817a9deee2mr2762176wmq.24.1646294832313;
        Thu, 03 Mar 2022 00:07:12 -0800 (PST)
X-Received: from ?IPV6:2001:861:44c0:66c0:37d4:6d61:9015:27a5? ([2001:861:44c0:66c0:37d4:6d61:9015:27a5])
        by smtp.gmail.com with ESMTPSA id p12-20020a5d48cc000000b001e6114938a8sm1244035wrs.56.2022.03.03.00.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 00:07:11 -0800 (PST)
Message-ID: <7d585748-7a41-13ca-60da-20eb4fe78374@baylibre.com>
Date: Thu, 3 Mar 2022 09:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [linux-oxnas] [PATCH] clk: Use of_device_get_match_data()
To: cgel.zte@gmail.com, mturquette@baylibre.com
Cc: sboyd@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20220303014856.2059307-1-chi.minghao@zte.com.cn>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220303014856.2059307-1-chi.minghao@zte.com.cn>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1646294837;
 bh=bviJvjWp90I301RCsXdywMUNhVLpxk3S9cCehSpfnmY=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=L9MhLJBiu7vfGiasfKbfxeMufVcG5kd+VHoMpJ/Py/iJuVs3iOoW66a1zMh3b3QiWx7
 QYI/yUkSyF8meqYN2z1taUY9R40A3Vj3gJiKEbItK32SJRB4s6PHvL9TEPkDMSTCY6qTz
 Ryr4MPG+hBUvju4v1DIlnmvDo3OO1f5QV3o=

On 03/03/2022 02:48, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
>=20
> Use of_device_get_match_data() to simplify the code.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> ---
>   drivers/clk/clk-oxnas.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
> index 78d5ea669fea..cda5e258355b 100644
> --- a/drivers/clk/clk-oxnas.c
> +++ b/drivers/clk/clk-oxnas.c
> @@ -209,15 +209,11 @@ static int oxnas_stdclk_probe(struct platform_devic=
e *pdev)
>   {
>   	struct device_node *np =3D pdev->dev.of_node;
>   	const struct oxnas_stdclk_data *data;
> -	const struct of_device_id *id;
>   	struct regmap *regmap;
>   	int ret;
>   	int i;
>  =20
> -	id =3D of_match_device(oxnas_stdclk_dt_ids, &pdev->dev);
> -	if (!id)
> -		return -ENODEV;
> -	data =3D id->data;
> +	data =3D of_device_get_match_data(&pdev->dev);
>  =20
>   	regmap =3D syscon_node_to_regmap(of_get_parent(np));
>   	if (IS_ERR(regmap)) {


Acked-by: Neil Armstrong <narmstrong@baylibre.com>


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#165): https://groups.io/g/linux-oxnas/message/165
Mute This Topic: https://groups.io/mt/89521472/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


