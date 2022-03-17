Return-Path: <bounce+16102+166+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E924DCBD2
	for <lists+linux-oxnas@lfdr.de>; Thu, 17 Mar 2022 17:55:34 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id 58fZYY1809624xf0RSwGy5JB; Thu, 17 Mar 2022 09:55:33 -0700
X-Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.94.1647536130944713444
 for <linux-oxnas@groups.io>;
 Thu, 17 Mar 2022 09:55:31 -0700
X-Received: by mail-wr1-f48.google.com with SMTP id p9so8159764wra.12
        for <linux-oxnas@groups.io>; Thu, 17 Mar 2022 09:55:30 -0700 (PDT)
X-Gm-Message-State: bOD9NTDAKbT8UGOH8FIgIWbJx1808289AA=
X-Google-Smtp-Source: ABdhPJyYXDlB/d2tNDCbE6c7hp/FisGGzgGoDAWIvPNSuQV9sLYz7rl6/nmd1ugHlhB3s8zaSQ2/lQ==
X-Received: by 2002:a5d:64e5:0:b0:1fb:5b9a:1a20 with SMTP id g5-20020a5d64e5000000b001fb5b9a1a20mr4810404wri.34.1647536129056;
        Thu, 17 Mar 2022 09:55:29 -0700 (PDT)
X-Received: from [192.168.1.10] (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d4ecf000000b00203de8012f5sm4319852wrv.16.2022.03.17.09.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 09:55:28 -0700 (PDT)
Message-ID: <d53764bd-8b49-37eb-c393-1317180979d1@baylibre.com>
Date: Thu, 17 Mar 2022 17:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [linux-oxnas] [PATCH 02/18] ARM: dts: ox820: align interrupt controller node name with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-1-krzysztof.kozlowski@canonical.com>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220317115705.450427-1-krzysztof.kozlowski@canonical.com>
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
 q=dns/txt; s=20140610; t=1647536133;
 bh=d+iSWO6FxVtWxv0KvxsLNA9wg5PXqSTTwUjyjS61mFM=;
 h=Content-Type:Date:From:Reply-To:Subject:To;
 b=VR+ZfPkwWDTajtnvmzj6jy63CD5As1FTaxXFapQBW/Viz0zxHRTqDBjWxsLvzDHXngo
 ez9KO8yW8srAqx8i60XFjwE+951u4/fjRyjGNbm0/sbY/c3xd7zoNscAoa1QF65hAHG+f
 WOLdHjYpkzfHSECeMHoXLdaqyXy02rkeW2k=

On 17/03/2022 12:56, Krzysztof Kozlowski wrote:
> Fixes dtbs_check warnings like:
>=20
>    gic@1000: $nodename:0: 'gic@1000' does not match '^interrupt-controlle=
r(@[0-9a-f,]+)*$'
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/arm/boot/dts/ox820.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
> index 90846a7655b4..dde4364892bf 100644
> --- a/arch/arm/boot/dts/ox820.dtsi
> +++ b/arch/arm/boot/dts/ox820.dtsi
> @@ -287,7 +287,7 @@ local-timer@600 {
>   				clocks =3D <&armclk>;
>   			};
>  =20
> -			gic: gic@1000 {
> +			gic: interrupt-controller@1000 {
>   				compatible =3D "arm,arm11mp-gic";
>   				interrupt-controller;
>   				#interrupt-cells =3D <3>;

Acked-by: Neil Armstrong <narmstrong@baylibre.com>


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#166): https://groups.io/g/linux-oxnas/message/166
Mute This Topic: https://groups.io/mt/89850036/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


