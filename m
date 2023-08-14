Return-Path: <bounce+16102+319+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2FD77B3BA
	for <lists+linux-oxnas@lfdr.de>; Mon, 14 Aug 2023 10:17:17 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=DmHx8tDjhT3Ul1KnHNTFpu6pWPhuHD+81R/Xfoo6G3E=;
 c=relaxed/simple; d=groups.io;
 h=Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:Organization:In-Reply-To:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Language:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1692001036; v=1;
 b=v7pb0dAbTXWHlWhyfoT8L2Cr7ehjM0vDuNs+h52NTge4NfIJqMzaSV7ogPmxnfJ5Y8rAP1br
 eqFeFR8j0RrRRq5JB+jLvNn2yM57LpAzvwyi2hn4WYsc4wqSXEP2UjcwPANdiVggVYacWAxzFJi
 cuVgafX26ysRPdW8bjCkIY0Q=
X-Received: by 127.0.0.2 with SMTP id wjv2YY1809624xwTQRAGnkSZ; Mon, 14 Aug 2023 01:17:16 -0700
X-Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.103238.1692001035800555144
 for <linux-oxnas@groups.io>;
 Mon, 14 Aug 2023 01:17:16 -0700
X-Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-318015ade49so3679065f8f.0
        for <linux-oxnas@groups.io>; Mon, 14 Aug 2023 01:17:15 -0700 (PDT)
X-Gm-Message-State: AF0bOFoDRRcocH02LsuX4KKAx1808289AA=
X-Google-Smtp-Source: AGHT+IEXbvgn6LW0yU+nkhHkcfkiCGwjUBAMcP+fKEDjyEF9E2V8kNEM6NVC/BjPKkIdX0hZ6fKCKg==
X-Received: by 2002:adf:f24e:0:b0:319:7b50:cf5e with SMTP id b14-20020adff24e000000b003197b50cf5emr880096wrp.19.1692001034196;
        Mon, 14 Aug 2023 01:17:14 -0700 (PDT)
X-Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d444d000000b00317f29ad113sm13580045wrr.32.2023.08.14.01.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:17:13 -0700 (PDT)
Message-ID: <ff999018-8490-0f58-0a50-e82f1effce5c@linaro.org>
Date: Mon, 14 Aug 2023 10:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Subject: Re: [linux-oxnas] [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-oxnas@groups.io,
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
 <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
 <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Precedence: Bulk
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/plugh>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2023 15:44, Linus Walleij wrote:
> On Mon, Jul 31, 2023 at 4:44 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>> On 30/06/2023 18:58, Neil Armstrong wrote:
>>> Due to lack of maintenance and stall of development for a few years now,
>>> and since no new features will ever be added upstream, remove support
>>> for OX810 and OX820 pinctrl & gpio.
>>
>> Do you plan to take patches 9, 10 & 11 or should I funnel them via a final SoC PR ?
> 
> I tried to apply them to the pinctrl tree but that fails ...
> Could you rebase patches 9,10,11 onto my "devel" branch
> and send separately? Then I will apply them right away.

Sure, sent them right now!

Thx,
Neil

> 
> Yours,
> Linus Walleij



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#319): https://groups.io/g/linux-oxnas/message/319
Mute This Topic: https://groups.io/mt/99877138/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/xyzzy [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


