Return-Path: <bounce+16102+248+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD66F5663
	for <lists+linux-oxnas@lfdr.de>; Wed,  3 May 2023 12:42:06 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id QvFjYY1809624xSPk5HIxFqz; Wed, 03 May 2023 03:42:04 -0700
X-Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.15763.1683110524164520982
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 03:42:04 -0700
X-Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso33457415e9.0
        for <linux-oxnas@groups.io>; Wed, 03 May 2023 03:42:03 -0700 (PDT)
X-Gm-Message-State: P69vfNf7yrywrrg7EYVjujt8x1808289AA=
X-Google-Smtp-Source: ACHHUZ4+w/861P1TP8XCtb+nKXdXmZXNl4DkJQUk42yYWgf1yqlqtWDrqllYUzBQocFIkyK2KHDH1w==
X-Received: by 2002:a7b:c391:0:b0:3f1:9391:46c with SMTP id s17-20020a7bc391000000b003f19391046cmr14791096wmj.30.1683110522481;
        Wed, 03 May 2023 03:42:02 -0700 (PDT)
X-Received: from ?IPV6:2a01:e0a:982:cbb0:68:e58d:3e87:f8c2? ([2a01:e0a:982:cbb0:68:e58d:3e87:f8c2])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b003f09d7b6e20sm1512696wmc.2.2023.05.03.03.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 03:42:02 -0700 (PDT)
Message-ID: <10572b4a-c3dc-6a28-bb21-c8a95444886e@linaro.org>
Date: Wed, 3 May 2023 12:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
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
 <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
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
 q=dns/txt; s=20140610; t=1683110524;
 bh=0/LBYpLxENoNdpsY5gy3R+miAHmoB9eo2fFce0dEKCs=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=DewgedHMg4FLuEIf8uO+yNCqoVqyq1TPRACDo06F5xhIrWAG7fgkMPQ0/xJCVbFuU/A
 8dHSLHmNdLsrtBUgAsJCNRp+2L7FSeyb9FeGnUwpaeK814g1pAuGAgW69p1LfpWTJh+NX
 9KOi7ax/lsjuBQpp/ElfThDH6/Z6iynRDlk=

On 03/05/2023 00:01, Christian Hewitt wrote:
> 
> 
>> On 2 May 2023, at 8:40 pm, Rob Herring <robh+dt@kernel.org> wrote:
>>
>> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>
>>>>> Does your script also cater for .dts files not matching any pattern,
>>>>> but including a .dtsi file that does match a pattern?
>>>>
>>>> I assume I built everything after moving, but maybe not...
>>>>
>>>> That's all just "details". First, we need agreement on a) moving
>>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>>> been stuck on a) for being 'too much churn'.
>>>
>>> Sorry for missing most of the discussion last week. The script sounds
>>> fine to me, the only reason I didn't want to do this in the past is that
>>> we had the plan to move platforms out of the kernel tree to an external
>>> repository and I wanted to do this platform at a time and also only move
>>> each one once. I don't think that is going to happen anytime soon now,
>>> so let's just do your script.
>>>
>>> Can you send me the script and/or a pull request of the resulting
>>> tree based on my soc/dt branch? Everything is merged upstream,
>>> and I think git-merge would handle the remaining merges with any
>>> other changes in mainline.
>>
>> I've dusted off my script and made a branch[1] with the result.
>> There's just a couple of fixes needed after the script is run (see the
>> top commit). The cross arch includes are all fixed up by the script.
>> dtbs_install maintains a flat install. I compared the number of .dtbs
>> before and after to check the script.
>>
>> I think the only issue remaining is finalizing the mapping of
>> platforms to subdirs. What I have currently is a mixture of SoC
>> families and vendors. The most notable are all the Freescale/NXP
>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>> either. Once that's finalized, I still need to go update MAINTAINERS.
>>
>> Here's the current mapping:
>>
>> vendor_map = {
>>     'alphascale' : 'alphascale',
>>     'alpine' : 'alpine',
>>     'artpec' : 'axis',
>>     'axm' : 'lsi',
>>     'cx9' : 'cnxt',
>>     'ecx' : 'calxeda',
>>     'highbank' : 'calxeda',
>>     'ep7' : 'cirrus',
>>     'mxs': 'mxs',
>>     'imx23': 'mxs',
>>     'imx28': 'mxs',
>>     'sun' : 'allwinner',
>>     'imx': 'imx',
>>     'e6' : 'imx',
>>     'e7' : 'imx',
>>     'mba6' : 'imx',
>>     'ls': 'fsl',
>>     'vf': 'fsl',
>>     'qcom': 'qcom',
>>     'am3' : 'ti',
>>     'am4' : 'ti',
>>     'am5' : 'ti',
>>     'dra' : 'ti',
>>     'keystone' : 'ti',
>>     'omap' : 'ti',
>>     'compulab' : 'ti',
>>     'logicpd' : 'ti',
>>     'elpida' : 'ti',
>>     'motorola' : 'ti',
>>     'twl' : 'ti',
>>     'da' : 'ti',
>>     'dm' : 'ti',
>>     'nspire' : 'nspire',
>>     'armada' : 'marvell',
>>     'dove' : 'marvell',
>>     'kirkwood' : 'marvell',
>>     'orion' : 'marvell',
>>     'mvebu' : 'marvell',
>>     'mmp' : 'marvell',
>>     'berlin' : 'berlin',
>>     'pxa2' : 'pxa',
>>     'pxa3' : 'pxa',
>>     'pxa' : 'marvell',
>>     'arm-' : 'arm',
>>     'integ' : 'arm',
>>     'mps' : 'arm',
>>     've' : 'arm',
>>     'aspeed' : 'aspeed',
>>     'ast2' : 'aspeed',
>>     'facebook' : 'aspeed',
>>     'ibm' : 'aspeed',
>>     'openbmc' : 'aspeed',
>>     'en7' : 'airoha',
>>     'at91' : 'microchip',
>>     'sama' : 'microchip',
>>     'sam9' : 'microchip',
>>     'usb_' : 'microchip',
>>     'tny_' : 'microchip',
>>     'mpa1600' : 'microchip',
>>     'animeo_ip' : 'microchip',
>>     'aks-cdu' : 'microchip',
>>     'ethernut5' : 'microchip',
>>     'evk-pro3' : 'microchip',
>>     'pm9g45' : 'microchip',
>>     'ge86' : 'microchip',
>>     'bcm' : 'brcm',
>>     'exynos' : 'samsung',
>>     's3c' : 'samsung',
>>     's5p' : 'samsung',
>>     'gemini' : 'gemini',
>>     'hi3' : 'hisilicon',
>>     'hip' : 'hisilicon',
>>     'hisi' : 'hisilicon',
>>     'sd5' : 'hisilicon',
>>     'hpe' : 'hpe',
>>     'intel': 'intel',
>>     'mt' : 'mediatek',
>>     'meson' : 'meson',
> 
> ‘meson’ : ‘amlogic’,
> 
> ^ to match the SoC vendor name (and arm64)

Ack we're trying to get rid of meson, so it would be time.

Neil

> 
> Christian
> 
>>     'moxa' : 'moxa',
>>     'mstar' : 'mstar',
>>     'nuvo' : 'nuvoton',
>>     'lpc' : 'lpc',
>>     'lan96' : 'microchip',
>>     'owl' : 'actions',
>>     'ox8' : 'oxsemi',
>>     'rda' : 'rda',
>>     'rtd' : 'realtek',
>>     'r7' : 'renesas',
>>     'r8' : 'renesas',
>>     'r9' : 'renesas',
>>     'emev2' : 'renesas',
>>     'sh73a' : 'renesas',
>>     'gr-' : 'renesas',
>>     'iwg' : 'renesas',
>>     'rk' : 'rockchip',
>>     'rv11' : 'rockchip',
>>     'rockchip' : 'rockchip',
>>     'socfpga' : 'socfpga',
>>     'stm' : 'stm32',
>>     'sti' : 'sti',
>>     'st-pin' : 'sti',
>>     'ste' : 'st-ericsson',
>>     'spear' : 'spear',
>>     'axp' : 'allwinner',
>>     'tegra' : 'nvidia',
>>     'milbeaut' : 'socionext',
>>     'uniph' : 'socionext',
>>     'vt8500' : 'vt8500',
>>     'wm8' : 'vt8500',
>>     'xen' : 'xen',
>>     'zx' : 'zte',
>>     'zynq' : 'xilinx',
>> }
>>
>> Rob
>>
>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-move-v2
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#248): https://groups.io/g/linux-oxnas/message/248
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/xyzzy [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


