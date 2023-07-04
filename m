Return-Path: <bounce+16102+310+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A077471BA
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jul 2023 14:50:27 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id t7abYY1809624xHSf8ziXI2i; Tue, 04 Jul 2023 05:50:25 -0700
X-Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.57770.1688475025045415097
 for <linux-oxnas@groups.io>;
 Tue, 04 Jul 2023 05:50:25 -0700
X-Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3142970df44so3908243f8f.3
        for <linux-oxnas@groups.io>; Tue, 04 Jul 2023 05:50:24 -0700 (PDT)
X-Gm-Message-State: HUYJsHAQ8Twb8OSex6qt46I5x1808289AA=
X-Google-Smtp-Source: APBJJlGYnTg9Odl6AdblWp67O67QkMbjypzSdthrdvhcA+ODLfuCZz/bh+UKd6Sl1gTFpqUPb6nUyw==
X-Received: by 2002:a5d:4203:0:b0:313:f395:f5a3 with SMTP id n3-20020a5d4203000000b00313f395f5a3mr9492911wrq.38.1688475023459;
        Tue, 04 Jul 2023 05:50:23 -0700 (PDT)
X-Received: from ?IPV6:2a01:e0a:982:cbb0:106:cd85:84ae:7b? ([2a01:e0a:982:cbb0:106:cd85:84ae:7b])
        by smtp.gmail.com with ESMTPSA id g5-20020adff405000000b003143cb109d5sm2634842wro.14.2023.07.04.05.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 05:50:23 -0700 (PDT)
Message-ID: <12266deb-4602-c557-fd80-689765fbf302@linaro.org>
Date: Tue, 4 Jul 2023 14:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Subject: Re: [linux-oxnas] [PATCH v2 06/15] dt-bindings: mtd: oxnas-nand: remove obsolete bindings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-oxnas@groups.io,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-6-fb6ab3dea87c@linaro.org>
 <20230704103026.6db56915@xps-13>
Organization: Linaro Developer Services
In-Reply-To: <20230704103026.6db56915@xps-13>
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
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1688475025;
 bh=f58pBMU4urNZylpgXiPa7fcvSF1TF555bAVd7L9oBo0=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Uwfc5Mmm8X9NKi1RmLfggnfvggj9iAGyBECrtITHrzwru3wJEySYp+A7j921kWrxMEu
 RvZCbltoaSYxFXYSJu8cJBSpGDhFveQUI/u3IlmrYplMtAaIFlkyVuUtqmV+iUmY9OoZ8
 tqr/EBkrRQOngwD3mrjhLQNL/7gAWjAT2/w=

Hi Miquel,

On 04/07/2023 10:30, Miquel Raynal wrote:
> Hi Neil,
> 
> neil.armstrong@linaro.org wrote on Fri, 30 Jun 2023 18:58:31 +0200:
> 
>> Due to lack of maintenance and stall of development for a few years now,
>> and since no new features will ever be added upstream, remove the
>> for OX810 and OX820 nand bindings.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> Acked-by: Daniel Golle <daniel@makrotopia.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> I assume these two mtd related patches will be picked-up through the
> soc tree as well, if that's not the case just ping me and I'll take
> them.

As of today, there's no strong plan, so maintainers can pick their patches
and I'll probably funnel the remaining ones via a final SoC PR.

Thanks,
Neil

> 
> Thanks,
> Miquèl



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#310): https://groups.io/g/linux-oxnas/message/310
Mute This Topic: https://groups.io/mt/99877134/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/xyzzy [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


