Return-Path: <bounce+16102+278+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A982F6FCB2B
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:13 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id wdqpYY1809624xmiR5N5CfeA; Tue, 09 May 2023 09:19:12 -0700
X-Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.35907.1683153012560417820
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 15:30:12 -0700
X-Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-24e16918323so2626467a91.2
        for <linux-oxnas@groups.io>; Wed, 03 May 2023 15:30:12 -0700 (PDT)
X-Gm-Message-State: bwgo3E10eJd4XvSl0MjOOTRrx1808289AA=
X-Google-Smtp-Source: ACHHUZ68cmsHxtB87iONW+SsuMsSJr4NkMfMrRrxl8kzW+7lj28j0Q7Ue/XhdACq9ZdVdGd7yUEu7w==
X-Received: by 2002:a17:90a:a891:b0:247:bdd3:a039 with SMTP id h17-20020a17090aa89100b00247bdd3a039mr172899pjq.8.1683153011868;
        Wed, 03 May 2023 15:30:11 -0700 (PDT)
X-Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id jx12-20020a17090b46cc00b0024e0141353dsm1872551pjb.28.2023.05.03.15.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 15:30:11 -0700 (PDT)
Message-ID: <bae5336c-a26a-cabb-6b83-ee9cece18130@gmail.com>
Date: Wed, 3 May 2023 15:29:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Olof Johansson <olof@lixom.net>, Christian Marangi <ansuelsmth@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
 <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,f.fainelli@gmail.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649152;
 bh=0QZxmmPX5ICIHNVA48JDQuqP9EOIkugIqlf8himYXy0=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=uxhItDOxf55Gzppi538T+mhpz/NT+wlsjFLuMxHgP45wRrmmVTx+KH185dcXNcoYEnc
 efTZWuX/R7xtKL307p4ySvahSVxQc92Wd2vGuBIpAPrtxWBxgctSUttFH5SXBooBGTYs1
 WNpKnp/wHnwJHp27g0N4zz3cAF531u1QYDw=

On 5/2/23 18:04, Rob Herring wrote:
> On Tue, May 2, 2023 at 6:02 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 5/2/23 12:40, Rob Herring wrote:
>>> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>>
>>>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>>
>>>>>> Does your script also cater for .dts files not matching any pattern,
>>>>>> but including a .dtsi file that does match a pattern?
>>>>>
>>>>> I assume I built everything after moving, but maybe not...
>>>>>
>>>>> That's all just "details". First, we need agreement on a) moving
>>>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>>>> been stuck on a) for being 'too much churn'.
>>>>
>>>> Sorry for missing most of the discussion last week. The script sounds
>>>> fine to me, the only reason I didn't want to do this in the past is that
>>>> we had the plan to move platforms out of the kernel tree to an external
>>>> repository and I wanted to do this platform at a time and also only move
>>>> each one once. I don't think that is going to happen anytime soon now,
>>>> so let's just do your script.
>>>>
>>>> Can you send me the script and/or a pull request of the resulting
>>>> tree based on my soc/dt branch? Everything is merged upstream,
>>>> and I think git-merge would handle the remaining merges with any
>>>> other changes in mainline.
>>>
>>> I've dusted off my script and made a branch[1] with the result.
>>> There's just a couple of fixes needed after the script is run (see the
>>> top commit). The cross arch includes are all fixed up by the script.
>>> dtbs_install maintains a flat install. I compared the number of .dtbs
>>> before and after to check the script.
>>>
>>> I think the only issue remaining is finalizing the mapping of
>>> platforms to subdirs. What I have currently is a mixture of SoC
>>> families and vendors. The most notable are all the Freescale/NXP
>>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>>> either. Once that's finalized, I still need to go update MAINTAINERS.
>>>
>>> Here's the current mapping:
>>>
>>> vendor_map = {
>>>       'alphascale' : 'alphascale',
>>>       'alpine' : 'alpine',
>>>       'artpec' : 'axis',
>>>       'axm' : 'lsi',
>>>       'cx9' : 'cnxt',
>>>       'ecx' : 'calxeda',
>>>       'highbank' : 'calxeda',
>>>       'ep7' : 'cirrus',
>>>       'mxs': 'mxs',
>>>       'imx23': 'mxs',
>>>       'imx28': 'mxs',
>>>       'sun' : 'allwinner',
>>>       'imx': 'imx',
>>>       'e6' : 'imx',
>>>       'e7' : 'imx',
>>>       'mba6' : 'imx',
>>>       'ls': 'fsl',
>>>       'vf': 'fsl',
>>>       'qcom': 'qcom',
>>>       'am3' : 'ti',
>>>       'am4' : 'ti',
>>>       'am5' : 'ti',
>>>       'dra' : 'ti',
>>>       'keystone' : 'ti',
>>>       'omap' : 'ti',
>>>       'compulab' : 'ti',
>>>       'logicpd' : 'ti',
>>>       'elpida' : 'ti',
>>>       'motorola' : 'ti',
>>>       'twl' : 'ti',
>>>       'da' : 'ti',
>>>       'dm' : 'ti',
>>>       'nspire' : 'nspire',
>>>       'armada' : 'marvell',
>>>       'dove' : 'marvell',
>>>       'kirkwood' : 'marvell',
>>>       'orion' : 'marvell',
>>>       'mvebu' : 'marvell',
>>>       'mmp' : 'marvell',
>>>       'berlin' : 'berlin',
>>>       'pxa2' : 'pxa',
>>>       'pxa3' : 'pxa',
>>>       'pxa' : 'marvell',
>>>       'arm-' : 'arm',
>>>       'integ' : 'arm',
>>>       'mps' : 'arm',
>>>       've' : 'arm',
>>>       'aspeed' : 'aspeed',
>>>       'ast2' : 'aspeed',
>>>       'facebook' : 'aspeed',
>>>       'ibm' : 'aspeed',
>>>       'openbmc' : 'aspeed',
>>>       'en7' : 'airoha',
>>>       'at91' : 'microchip',
>>>       'sama' : 'microchip',
>>>       'sam9' : 'microchip',
>>>       'usb_' : 'microchip',
>>>       'tny_' : 'microchip',
>>>       'mpa1600' : 'microchip',
>>>       'animeo_ip' : 'microchip',
>>>       'aks-cdu' : 'microchip',
>>>       'ethernut5' : 'microchip',
>>>       'evk-pro3' : 'microchip',
>>>       'pm9g45' : 'microchip',
>>>       'ge86' : 'microchip',
>>>       'bcm' : 'brcm',
>>
>> How about we use 'broadcom' here, to follow what arm64 does? I could
>> rename arch/mips/boot/dts/brcm to arch/mips/boot/dts/broadcom for
>> consistency, too?
> 
> Okay, though if starting clean I'd somewhat prefer to use the vendor
> prefix. I guess since arm and arm64 share dtsi files, they should
> match.

Sounds good to me, let's go with "brcm" then.
-- 
Florian



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#278): https://groups.io/g/linux-oxnas/message/278
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


