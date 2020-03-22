Return-Path: <bounce+16102+73+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D568218E90B
	for <lists+linux-oxnas@lfdr.de>; Sun, 22 Mar 2020 14:05:30 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id rX8wYY1809624xv3iirdQkQX; Sun, 22 Mar 2020 06:05:29 -0700
X-Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.28465.1584882327037236101
 for <linux-oxnas@groups.io>;
 Sun, 22 Mar 2020 06:05:27 -0700
X-Received: by mail-wm1-f68.google.com with SMTP id 26so6837320wmk.1
        for <linux-oxnas@groups.io>; Sun, 22 Mar 2020 06:05:26 -0700 (PDT)
X-Gm-Message-State: jjKzMDueDzcixUr6PRtD71xlx1808289AA=
X-Google-Smtp-Source: ADFU+vt663IbGfqXLqaBBoBd/TtlcKYWmh2rCAAdSzpeyW9dLOYoeNgoyGmVYk+sBiebfEUDTJQ5xw==
X-Received: by 2002:a05:600c:2190:: with SMTP id e16mr14938974wme.42.1584882325357;
        Sun, 22 Mar 2020 06:05:25 -0700 (PDT)
X-Received: from Armstrongs-MacBook-Pro.local ([2a01:e35:2ec0:82b0:5d7b:95e6:6719:f85a])
        by smtp.gmail.com with ESMTPSA id a11sm18675524wrx.54.2020.03.22.06.05.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Mar 2020 06:05:24 -0700 (PDT)
Subject: Re: [linux-oxnas] [PATCH] ARM: dts: oxnas: Fix clear-mask property
To: Sungbo Eo <mans0n@gorani.run>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200321143653.2412823-1-mans0n@gorani.run>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Message-ID: <ca1a1cdc-6c20-bd2c-d1ea-edd6610f68a4@baylibre.com>
Date: Sun, 22 Mar 2020 14:05:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200321143653.2412823-1-mans0n@gorani.run>
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584882329;
 bh=zZb3RPT7i7reT+pMcnPeL1qS/BeYZIuNca67VJbhdQY=;
 h=Content-Type:Date:From:Reply-To:Subject:To;
 b=U7H46/FwpUX0HooLveZvqCjUDpqC5+574RjmPspAumL4jGudqKZGVEW1ndyYOfOcFcJ
 djq4H9nnpSQ1OOkpD0JnBDegThalRRTCn5XnodgeL1G0OkQzCV3sPm6nEj69cSDsjCnVg
 oz43+YF6NzjamRdYxj9vMrYF869ITkS93tQ=

Hi,

Le 21/03/2020 à 15:36, Sungbo Eo a écrit :
> Disable all rps-irq interrupts during driver initialization to prevent
> an accidental interrupt on GIC.
> 
> Fixes: 84316f4ef141 ("ARM: boot: dts: Add Oxford Semiconductor OX810SE dtsi")
> Fixes: 38d4a53733f5 ("ARM: dts: Add support for OX820 and Pogoplug V3")
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
>  arch/arm/boot/dts/ox810se.dtsi | 4 ++--
>  arch/arm/boot/dts/ox820.dtsi   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
> index 9f6c2b660ed3..0755e5864c4a 100644
> --- a/arch/arm/boot/dts/ox810se.dtsi
> +++ b/arch/arm/boot/dts/ox810se.dtsi
> @@ -323,8 +323,8 @@ intc: interrupt-controller@0 {
>  					interrupt-controller;
>  					reg = <0 0x200>;
>  					#interrupt-cells = <1>;
> -					valid-mask = <0xFFFFFFFF>;
> -					clear-mask = <0>;
> +					valid-mask = <0xffffffff>;
> +					clear-mask = <0xffffffff>;
>  				};
>  
>  				timer0: timer@200 {
> diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
> index c9b327732063..90846a7655b4 100644
> --- a/arch/arm/boot/dts/ox820.dtsi
> +++ b/arch/arm/boot/dts/ox820.dtsi
> @@ -240,8 +240,8 @@ intc: interrupt-controller@0 {
>  					reg = <0 0x200>;
>  					interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>  					#interrupt-cells = <1>;
> -					valid-mask = <0xFFFFFFFF>;
> -					clear-mask = <0>;
> +					valid-mask = <0xffffffff>;
> +					clear-mask = <0xffffffff>;
>  				};
>  
>  				timer0: timer@200 {
> 

Thanks a lot for the patch,
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

I'll apply it asap and push it to arm-soc fixes.

Neil

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#73): https://groups.io/g/linux-oxnas/message/73
Mute This Topic: https://groups.io/mt/72451154/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

