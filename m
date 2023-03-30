Return-Path: <bounce+16102+185+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DF6D0B80
	for <lists+linux-oxnas@lfdr.de>; Thu, 30 Mar 2023 18:40:48 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id T3lvYY1809624xVfNQQaoyai; Thu, 30 Mar 2023 09:40:46 -0700
X-Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.30741.1680194445638582736
 for <linux-oxnas@groups.io>;
 Thu, 30 Mar 2023 09:40:46 -0700
X-Received: by mail-wm1-f48.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so12173298wms.2
        for <linux-oxnas@groups.io>; Thu, 30 Mar 2023 09:40:45 -0700 (PDT)
X-Gm-Message-State: 0WQB9p3mVloUIv5YGKXqj4QXx1808289AA=
X-Google-Smtp-Source: AK7set+T5+LX8G1drB7duDYdeQf04Abk5u9lOdEbqBzlttJPRn/c1AIIE43phBoZUQBtKJJiVWYC7Q==
X-Received: by 2002:a7b:c8d0:0:b0:3eb:39e7:35fe with SMTP id f16-20020a7bc8d0000000b003eb39e735femr17905942wml.30.1680194443891;
        Thu, 30 Mar 2023 09:40:43 -0700 (PDT)
X-Received: from [172.20.10.2] ([37.166.66.243])
        by smtp.gmail.com with ESMTPSA id w20-20020a05600c475400b003f034c76e85sm3545852wmo.38.2023.03.30.09.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 09:40:43 -0700 (PDT)
Message-ID: <cad25e0a-9594-3d5e-79e7-fd00a80f67ac@linaro.org>
Date: Thu, 30 Mar 2023 18:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [linux-oxnas] [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 guoren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-19-arnd@kernel.org>
 <d7f36a28-0cae-a035-791b-363754aefeee@linaro.org>
 <6a5bd3a3-87e0-4a24-89ca-d265b0817a95@app.fastmail.com>
From: "Neil Armstrong" <neil.armstrong@linaro.org>
In-Reply-To: <6a5bd3a3-87e0-4a24-89ca-d265b0817a95@app.fastmail.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680194446;
 bh=+bQE8IEbt7j0s+d0+hTrtriS6WYNyLxAcgqqYWvobeQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=oVy6bnW6JxS5K/DLT3s0/B/HrjS74aCKoAUX8JrFpxQqoAnC3zJPQj3TfMLpIdYg8ly
 30o7+e9HhO4zGtmUEN7FeJ7sWICqsj0g+kJGC9R8pvepP2931d8okpUe1Otx8AlstJWXh
 ADWACx4qo0hb4t/zZvR8KF6WmOU9XmjAB1g=

Le 30/03/2023 à 12:03, Arnd Bergmann a écrit :
> On Thu, Mar 30, 2023, at 09:48, Neil Armstrong wrote:
>> On 27/03/2023 14:13, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The cache management operations for noncoherent DMA on ARMv6 work
>>> in two different ways:
>>>
>>>    * When CONFIG_DMA_CACHE_RWFO is set, speculative prefetches on in-flight
>>>      DMA buffers lead to data corruption when the prefetched data is written
>>>      back on top of data from the device.
>>>
>>>    * When CONFIG_DMA_CACHE_RWFO is disabled, a cache flush on one CPU
>>>      is not seen by the other core(s), leading to inconsistent contents
>>>      accross the system.
>>>
>>> As a consequence, neither configuration is actually safe to use in a
>>> general-purpose kernel that is used on both MPCore systems and ARM1176
>>> with prefetching enabled.
>>>
>>> We could add further workarounds to make the behavior more dynamic based
>>> on the system, but realistically, there are close to zero remaining
>>> users on any ARM11MPCore anyway, and nobody seems too interested in it,
>>> compared to the more popular ARM1176 used in BMC2835 and AST2500.
>>>
>>> The Oxnas platform has some minimal support in OpenWRT, but most of the
>>> drivers and dts files never made it into the mainline kernel, while the
>>> Arm Versatile/Realview platform mainly serves as a reference system but
>>> is not necessary to be kept working once all other ARM11MPCore are gone.
>>
>> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> It's sad but it's the reality, there's no chance full OXNAS support will
>> ever come upstream and no real work has been done for years.
>>
>> I think OXNAS support can be programmed for removal for next release,
>> it would need significant work to rework current support to make it acceptable
>> before trying to upstream missing bits anyway.
> 
> Ok, thanks for your reply!
> 
> To clarify, do you think we should plan for removal after the next
> stable release (6.3, removed in 6.4), or after the next LTS
> release (probably 6.6, removed in 6.7)? As far as I understand,
> the next OpenWRT release (23.x) will be based on linux-5.15,
> and the one after that (24.x) would likely still use 6.1, unless
> they skip an LTS kernel.

I think it's ok to remove it ASAP, or at least before the next LTS,
not having SMP makes the platform barely usable so the earliest is the best.

Neil

> 
>       Arnd



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#185): https://groups.io/g/linux-oxnas/message/185
Mute This Topic: https://groups.io/mt/97946110/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/xyzzy [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


