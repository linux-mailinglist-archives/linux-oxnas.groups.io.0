Return-Path: <bounce+16102+168+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB850BCCB
	for <lists+linux-oxnas@lfdr.de>; Fri, 22 Apr 2022 18:22:29 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id q3A6YY1809624xFDfVuKw24V; Fri, 22 Apr 2022 09:22:28 -0700
X-Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.10614.1650644547474222405
 for <linux-oxnas@groups.io>;
 Fri, 22 Apr 2022 09:22:28 -0700
X-Received: by mail-wm1-f49.google.com with SMTP id q20so5395640wmq.1
        for <linux-oxnas@groups.io>; Fri, 22 Apr 2022 09:22:27 -0700 (PDT)
X-Gm-Message-State: 588RQz1PpZxs96sKvVHJxim1x1808289AA=
X-Google-Smtp-Source: ABdhPJyhHijmfDn7mBZ8Yi8hIQc2YxGRbhYKiIfgqQ7kbu5nme0yI0od4RgU9nXwoHv4mwvoZwDpMQ==
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id a24-20020a1cf018000000b0037bc13c3128mr13874624wmb.157.1650644545585;
        Fri, 22 Apr 2022 09:22:25 -0700 (PDT)
X-Received: from ?IPV6:2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49? ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c441000b0038ebcbadcedsm5651369wmn.2.2022.04.22.09.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 09:22:24 -0700 (PDT)
Message-ID: <23ce10e4-bdb6-9b3a-465b-8ff86d679296@baylibre.com>
Date: Fri, 22 Apr 2022 18:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [linux-oxnas] [PATCH] clocksource/drivers/oxnas-rps: Fix irq_of_parse_and_map() return value
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io
References: <20220422104101.55754-1-krzysztof.kozlowski@linaro.org>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220422104101.55754-1-krzysztof.kozlowski@linaro.org>
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
 q=dns/txt; s=20140610; t=1650644548;
 bh=aLyXk6lvnfaezYVsULRpK1tOBy/DwgA7q8NEEOHAZX8=;
 h=Content-Type:Date:From:Reply-To:Subject:To;
 b=UgU5tLtUg5+GXR1EBhVeisS/r5GVvYCtDEHX6zBcJSgFOhuXdZ1iQW5jRjiRKtjQyzy
 ng8R/qyq8j8TEHd4CWaaPoIUviWSq01Zl1brZLB2EUti0HyZUNrRbEjOGFjnZpeugngb6
 BA6MHiiP9hUKOCYrTKymK1bC3ZBrHC4Bg4s=

On 22/04/2022 12:41, Krzysztof Kozlowski wrote:
> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>=20
> Fixes: 89355274e1f7 ("clocksource/drivers/oxnas-rps: Add Oxford Semicondu=
ctor RPS Dual Timer")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
View/Reply Online (#168): https://groups.io/g/linux-oxnas/message/168
Mute This Topic: https://groups.io/mt/90631825/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


