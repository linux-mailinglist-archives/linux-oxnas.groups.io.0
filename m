Return-Path: <bounce+16102+118+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A5C3FD508
	for <lists+linux-oxnas@lfdr.de>; Wed,  1 Sep 2021 10:14:34 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id SyF3YY1809624xW5zWKBMOmc; Wed, 01 Sep 2021 01:14:32 -0700
X-Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.5080.1630484070956336651
 for <linux-oxnas@groups.io>;
 Wed, 01 Sep 2021 01:14:31 -0700
X-Received: by mail-wm1-f54.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so4107083wme.1
        for <linux-oxnas@groups.io>; Wed, 01 Sep 2021 01:14:30 -0700 (PDT)
X-Gm-Message-State: 9PQ2wQr9xDEGGmMiIo5cZqXtx1808289AA=
X-Google-Smtp-Source: ABdhPJy56BIXwV6S+CNtfU74OvWAfHGQFSrCbv//ooL8zb7ycm/Q6XDk7np66gkBwQP0broPCUxdHA==
X-Received: by 2002:a1c:443:: with SMTP id 64mr8358428wme.180.1630484069127;
        Wed, 01 Sep 2021 01:14:29 -0700 (PDT)
X-Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1? ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
        by smtp.gmail.com with ESMTPSA id o26sm4626093wmc.17.2021.09.01.01.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 01:14:28 -0700 (PDT)
Subject: Re: [linux-oxnas] [PATCH] mtd: rawnand: oxnas: Make use of the helper function devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-kernel@vger.kernel.org
References: <20210901074207.9333-1-caihuoqing@baidu.com>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <61ab65d3-bf52-5701-95d2-476b8c2d719c@baylibre.com>
Date: Wed, 1 Sep 2021 10:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901074207.9333-1-caihuoqing@baidu.com>
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
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1630484072;
 bh=7uXxbJ0NOv27jiHthACiLYaaxd6X9XihdFJttIY10sY=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Vpm6Rso1YGA4wAP/hQf3VVtCeZtL9srqbanlfS0xrK9hLmfg5l/ThcQ1sT16PbcyPLo
 EKRY0c9BRSLJQA1lmdPnoR4sGqCeYQj/rCd1mQu6ZYvkgigdeVjn+onKYn69ORo3AqJ/X
 hFnz0th5wMDS1i5CqcHmUnZfDvW4/Oxm+LQ=

On 01/09/2021 09:42, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/mtd/nand/raw/oxnas_nand.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
> index f44947043e5a..cd112d45e0b5 100644
> --- a/drivers/mtd/nand/raw/oxnas_nand.c
> +++ b/drivers/mtd/nand/raw/oxnas_nand.c
> @@ -79,7 +79,6 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	struct oxnas_nand_ctrl *oxnas;
>  	struct nand_chip *chip;
>  	struct mtd_info *mtd;
> -	struct resource *res;
>  	int count = 0;
>  	int err = 0;
>  	int i;
> @@ -92,8 +91,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  
>  	nand_controller_init(&oxnas->base);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	oxnas->io_base = devm_ioremap_resource(&pdev->dev, res);
> +	oxnas->io_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(oxnas->io_base))
>  		return PTR_ERR(oxnas->io_base);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#118): https://groups.io/g/linux-oxnas/message/118
Mute This Topic: https://groups.io/mt/85297013/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


