Return-Path: <bounce+16102+233+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 149466D65A3
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Apr 2023 16:43:11 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id N1TcYY1809624x6ZV9SFacEE; Tue, 04 Apr 2023 07:43:10 -0700
X-Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.103641.1680619377122126518
 for <linux-oxnas@groups.io>;
 Tue, 04 Apr 2023 07:43:09 -0700
X-Received: by mail-wr1-f48.google.com with SMTP id d17so33066504wrb.11
        for <linux-oxnas@groups.io>; Tue, 04 Apr 2023 07:43:09 -0700 (PDT)
X-Gm-Message-State: xQOsYwEe2tWp8IxWMSC36Ug9x1808289AA=
X-Google-Smtp-Source: AKy350YBdvNgOC8F8gqfsSh8GXu4M4HZH2CymaXshNdroBrqtynflWna7ZvGWLovVOxyHFO0u4kGHA==
X-Received: by 2002:adf:f18e:0:b0:2d3:b1fa:3031 with SMTP id h14-20020adff18e000000b002d3b1fa3031mr1712262wro.16.1680619388666;
        Tue, 04 Apr 2023 07:43:08 -0700 (PDT)
X-Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id y6-20020adff6c6000000b002ceac2ccc4asm12489979wrp.23.2023.04.04.07.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 07:43:08 -0700 (PDT)
Message-ID: <f221954d-66f2-8dac-8e2b-5769c18d9aca@linaro.org>
Date: Tue, 4 Apr 2023 16:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Subject: Re: [linux-oxnas] [PATCH RFC v2 0/4] ARM: oxnas support removal
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "linux-oxnas@groups.io"
 <linux-oxnas@groups.io>, Linus Walleij <linus.walleij@linaro.org>,
 Daniel Golle <daniel@makrotopia.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
 <86d63038-e3f5-4c03-b904-a26761b0578d@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <86d63038-e3f5-4c03-b904-a26761b0578d@app.fastmail.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680619390;
 bh=jS15q+1GvlgnOM1S4mupnv554+m/lUbvrc6xYeNdYD8=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=l4d4WcNTpMDFZ7qLNVJfEAPiblP+YHGmktukhxF2KOGvBhHTxUisGpKx0FczaWS6Z3m
 PV2/GclbMl838Xcn9Fo2TKQLvs0tRbJbXFYqxAqIwv5hEwhSGZQTRc/YR2TvgV1OW0azq
 1NZUJpTy53eVrglKetNAIorzUl1HsloDZfE=

On 04/04/2023 16:37, Arnd Bergmann wrote:
> On Mon, Apr 3, 2023, at 09:42, Neil Armstrong wrote:
>> With [1] removing MPCore SMP support, this makes the OX820 barely usable=
,
>> associated with a clear lack of maintainance, development and migration =
to
>> dt-schema it's clear that Linux support for OX810 and OX820 should be re=
moved.
>>
>> In addition, the OX810 hasn't been booted for years and isn't even prese=
nt
>> in an ARM config file.
>>
>> For the OX820, lack of USB and SATA support makes the platform not usabl=
e
>> in the current Linux support and relies on off-tree drivers hacked from =
the
>> vendor (defunct for years) sources.
>>
>> The last users are in the OpenWRT distribution, and today's removal mean=
s
>> support will still be in stable 6.1 LTS kernel until end of 2026.
>>
>> If someone wants to take over the development even with lack of SMP, I'l=
l
>> be happy to hand off maintainance.
>>
>> The plan is to apply the first 4 patches first, then the drivers
>> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>>
>=20
> I merged all four into the soc tree now, thanks!

Thanks for handling this !

Neil

>=20
>       Arnd



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#233): https://groups.io/g/linux-oxnas/message/233
Mute This Topic: https://groups.io/mt/98030323/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


