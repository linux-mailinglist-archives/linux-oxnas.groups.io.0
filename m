Return-Path: <bounce+16102+167+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8150BCCA
	for <lists+linux-oxnas@lfdr.de>; Fri, 22 Apr 2022 18:22:25 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id h7rXYY1809624xCpFEboQyS0; Fri, 22 Apr 2022 09:22:24 -0700
X-Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.10613.1650644542179852645
 for <linux-oxnas@groups.io>;
 Fri, 22 Apr 2022 09:22:23 -0700
X-Received: by mail-wm1-f48.google.com with SMTP id r187-20020a1c44c4000000b0038ccb70e239so8289378wma.3
        for <linux-oxnas@groups.io>; Fri, 22 Apr 2022 09:22:21 -0700 (PDT)
X-Gm-Message-State: 3cCN7yc0JyeecwyLv7aHWBskx1808289AA=
X-Google-Smtp-Source: ABdhPJw+EDWeUbKGCKyJrHEETjnM0af1aCSAelWxoOQFcRGQ8yuJvjTITii65UfZu3R2Yg+ydQAE9Q==
X-Received: by 2002:a05:600c:3ac6:b0:38e:d79e:d9a with SMTP id d6-20020a05600c3ac600b0038ed79e0d9amr13910088wms.200.1650644540120;
        Fri, 22 Apr 2022 09:22:20 -0700 (PDT)
X-Received: from ?IPV6:2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49? ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
        by smtp.gmail.com with ESMTPSA id p125-20020a1c2983000000b0038e6c62f527sm2374540wmp.14.2022.04.22.09.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 09:22:19 -0700 (PDT)
Message-ID: <f6905ca8-301b-0f95-1cc2-78503bec1496@baylibre.com>
Date: Fri, 22 Apr 2022 18:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [linux-oxnas] [PATCH] clocksource/drivers/oxnas: fix error check return value of irq_of_parse_and_map()
To: cgel.zte@gmail.com, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20220422084816.2775898-1-lv.ruyi@zte.com.cn>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220422084816.2775898-1-lv.ruyi@zte.com.cn>
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
 q=dns/txt; s=20140610; t=1650644544;
 bh=g5mMIlFO7K/XrPFtX1E6sn/ZuzMJrXdZTVKuDqOxK58=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=etkbEWh9NIEidDHlqFXKIt5OOd1zifdyWOoTH/Ulzg9NA+/K3lRtwi3yGZf2KXmC9TQ
 MRwq3iXHbYQ5MOUNcOoEveIHBmFqb6/RSEM3RZGMWRWYDn4unFeX0RKlvbZXBJCaKZ3R+
 +5dbGoYVvwxzDCMlg8JTDPG9bI2OcBxglfA=

On 22/04/2022 10:48, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>=20
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
>=20
> Fixes: 	89355274e1f7 ("clocksource/drivers/oxnas-rps: Add Oxford Semicond=
uctor RPS Dual Timer")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>   drivers/clocksource/timer-oxnas-rps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/=
timer-oxnas-rps.c
> index 56c0cc32d0ac..d514b44e67dd 100644
> --- a/drivers/clocksource/timer-oxnas-rps.c
> +++ b/drivers/clocksource/timer-oxnas-rps.c
> @@ -236,7 +236,7 @@ static int __init oxnas_rps_timer_init(struct device_=
node *np)
>   	}
>  =20
>   	rps->irq =3D irq_of_parse_and_map(np, 0);
> -	if (rps->irq < 0) {
> +	if (!rps->irq) {
>   		ret =3D -EINVAL;
>   		goto err_iomap;
>   	}

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#167): https://groups.io/g/linux-oxnas/message/167
Mute This Topic: https://groups.io/mt/90631824/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


