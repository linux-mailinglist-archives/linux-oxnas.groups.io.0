Return-Path: <bounce+16102+259+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB16FCB0C
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:18:09 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id JCDGYY1809624xLqiw0wJ5bQ; Tue, 09 May 2023 09:18:07 -0700
X-Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4280.1683064868900495271
 for <linux-oxnas@groups.io>;
 Tue, 02 May 2023 15:01:09 -0700
X-Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f19b9d5358so44037015e9.1
        for <linux-oxnas@groups.io>; Tue, 02 May 2023 15:01:08 -0700 (PDT)
X-Gm-Message-State: DXahqQ85uw7cXkxs80sr7LwGx1808289AA=
X-Google-Smtp-Source: ACHHUZ5ybUYKWTDV7iyMT3UD1OcV6iuMEt21qUpy9BFWRJB0WpmP8MgHZQVEdSajDh7czeTwLAcS3Q==
X-Received: by 2002:a7b:c7d4:0:b0:3f1:9ca1:cac3 with SMTP id z20-20020a7bc7d4000000b003f19ca1cac3mr13020245wmk.34.1683064867148;
        Tue, 02 May 2023 15:01:07 -0700 (PDT)
X-Received: from smtpclient.apple ([91.135.9.67])
        by smtp.gmail.com with ESMTPSA id y4-20020a05600c364400b003f175954e71sm1965wmq.32.2023.05.02.15.01.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2023 15:01:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Date: Tue, 2 May 2023 23:01:04 +0100
Cc: Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Olof Johansson <olof@lixom.net>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org,
 linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
Message-Id: <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,christianshewitt@gmail.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649087;
 bh=A1cLBP5yLhj5UnrbEqoaYp9ANJkNGJcgjKotuZaC09U=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=j6Ei7Hln+G2xhCJHCEX3Upfj/YiviNnlOE9sVD+A1+PiJuYUgtQozvx4vMleDubX4LN
 ZfJxS8mqVLCYyGpi3L+sr0otIfCTgRKNbJQz2XdBD+m+Q0OiPmSb4SdCtRi+OMpdtjbW0
 1rT9HDCLXborVwtc1PGiImefyCc6jI7JJqo=



> On 2 May 2023, at 8:40 pm, Rob Herring <robh+dt@kernel.org> wrote:
>=20
> On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>>=20
>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>> On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
>>>=20
>>>> Does your script also cater for .dts files not matching any pattern,
>>>> but including a .dtsi file that does match a pattern?
>>>=20
>>> I assume I built everything after moving, but maybe not...
>>>=20
>>> That's all just "details". First, we need agreement on a) moving
>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>> been stuck on a) for being 'too much churn'.
>>=20
>> Sorry for missing most of the discussion last week. The script sounds
>> fine to me, the only reason I didn't want to do this in the past is that
>> we had the plan to move platforms out of the kernel tree to an external
>> repository and I wanted to do this platform at a time and also only move
>> each one once. I don't think that is going to happen anytime soon now,
>> so let's just do your script.
>>=20
>> Can you send me the script and/or a pull request of the resulting
>> tree based on my soc/dt branch? Everything is merged upstream,
>> and I think git-merge would handle the remaining merges with any
>> other changes in mainline.
>=20
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
>=20
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
>=20
> Here's the current mapping:
>=20
> vendor_map =3D {
>    'alphascale' : 'alphascale',
>    'alpine' : 'alpine',
>    'artpec' : 'axis',
>    'axm' : 'lsi',
>    'cx9' : 'cnxt',
>    'ecx' : 'calxeda',
>    'highbank' : 'calxeda',
>    'ep7' : 'cirrus',
>    'mxs': 'mxs',
>    'imx23': 'mxs',
>    'imx28': 'mxs',
>    'sun' : 'allwinner',
>    'imx': 'imx',
>    'e6' : 'imx',
>    'e7' : 'imx',
>    'mba6' : 'imx',
>    'ls': 'fsl',
>    'vf': 'fsl',
>    'qcom': 'qcom',
>    'am3' : 'ti',
>    'am4' : 'ti',
>    'am5' : 'ti',
>    'dra' : 'ti',
>    'keystone' : 'ti',
>    'omap' : 'ti',
>    'compulab' : 'ti',
>    'logicpd' : 'ti',
>    'elpida' : 'ti',
>    'motorola' : 'ti',
>    'twl' : 'ti',
>    'da' : 'ti',
>    'dm' : 'ti',
>    'nspire' : 'nspire',
>    'armada' : 'marvell',
>    'dove' : 'marvell',
>    'kirkwood' : 'marvell',
>    'orion' : 'marvell',
>    'mvebu' : 'marvell',
>    'mmp' : 'marvell',
>    'berlin' : 'berlin',
>    'pxa2' : 'pxa',
>    'pxa3' : 'pxa',
>    'pxa' : 'marvell',
>    'arm-' : 'arm',
>    'integ' : 'arm',
>    'mps' : 'arm',
>    've' : 'arm',
>    'aspeed' : 'aspeed',
>    'ast2' : 'aspeed',
>    'facebook' : 'aspeed',
>    'ibm' : 'aspeed',
>    'openbmc' : 'aspeed',
>    'en7' : 'airoha',
>    'at91' : 'microchip',
>    'sama' : 'microchip',
>    'sam9' : 'microchip',
>    'usb_' : 'microchip',
>    'tny_' : 'microchip',
>    'mpa1600' : 'microchip',
>    'animeo_ip' : 'microchip',
>    'aks-cdu' : 'microchip',
>    'ethernut5' : 'microchip',
>    'evk-pro3' : 'microchip',
>    'pm9g45' : 'microchip',
>    'ge86' : 'microchip',
>    'bcm' : 'brcm',
>    'exynos' : 'samsung',
>    's3c' : 'samsung',
>    's5p' : 'samsung',
>    'gemini' : 'gemini',
>    'hi3' : 'hisilicon',
>    'hip' : 'hisilicon',
>    'hisi' : 'hisilicon',
>    'sd5' : 'hisilicon',
>    'hpe' : 'hpe',
>    'intel': 'intel',
>    'mt' : 'mediatek',
>    'meson' : 'meson',

=E2=80=98meson=E2=80=99 : =E2=80=98amlogic=E2=80=99,

^ to match the SoC vendor name (and arm64)

Christian

>    'moxa' : 'moxa',
>    'mstar' : 'mstar',
>    'nuvo' : 'nuvoton',
>    'lpc' : 'lpc',
>    'lan96' : 'microchip',
>    'owl' : 'actions',
>    'ox8' : 'oxsemi',
>    'rda' : 'rda',
>    'rtd' : 'realtek',
>    'r7' : 'renesas',
>    'r8' : 'renesas',
>    'r9' : 'renesas',
>    'emev2' : 'renesas',
>    'sh73a' : 'renesas',
>    'gr-' : 'renesas',
>    'iwg' : 'renesas',
>    'rk' : 'rockchip',
>    'rv11' : 'rockchip',
>    'rockchip' : 'rockchip',
>    'socfpga' : 'socfpga',
>    'stm' : 'stm32',
>    'sti' : 'sti',
>    'st-pin' : 'sti',
>    'ste' : 'st-ericsson',
>    'spear' : 'spear',
>    'axp' : 'allwinner',
>    'tegra' : 'nvidia',
>    'milbeaut' : 'socionext',
>    'uniph' : 'socionext',
>    'vt8500' : 'vt8500',
>    'wm8' : 'vt8500',
>    'xen' : 'xen',
>    'zx' : 'zte',
>    'zynq' : 'xilinx',
> }
>=20
> Rob
>=20
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-=
move-v2
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#259): https://groups.io/g/linux-oxnas/message/259
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


