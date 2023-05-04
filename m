Return-Path: <bounce+16102+279+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5826FCB2C
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:13 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id zTj3YY1809624xC9A0VrBY8c; Tue, 09 May 2023 09:19:12 -0700
X-Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web10.44167.1683184174359652134
 for <linux-oxnas@groups.io>;
 Thu, 04 May 2023 00:09:35 -0700
X-Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3445knZ4015912;
	Thu, 4 May 2023 09:09:19 +0200
X-Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qc6uw8hjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 May 2023 09:09:19 +0200
X-Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCD5210002A;
	Thu,  4 May 2023 09:09:16 +0200 (CEST)
X-Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0066210F61;
	Thu,  4 May 2023 09:09:15 +0200 (CEST)
X-Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 4 May
 2023 09:09:15 +0200
Message-ID: <95076d3b-5667-8cb3-c09a-e0b7dc2b03c3@foss.st.com>
Date: Thu, 4 May 2023 09:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [linux-oxnas] [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-realtek-soc@lists.infradead.org>,
        <linux-arm-kernel@axis.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <chrome-platform@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        Geert Uytterhoeven
	<geert@linux-m68k.org>,
        <linux-sunxi@lists.linux.dev>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-actions@lists.infradead.org>,
        <linux-unisoc@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-rpi-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>,
        <kernel@dh-electronics.com>, Olof
 Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "linux-oxnas@groups.io" <linux-oxnas@groups.io>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-MIME-Autoconverted: from 8bit to quoted-printable by mx07-00178001.pphosted.com id 3445knZ4015912
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,alexandre.torgue@foss.st.com
X-Gm-Message-State: cupLHGAx9DgKDkGQpoCxanpIx1808289AA=
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649152;
 bh=KhH7eL1nh/V0dfyg5QFi4Wm6pCCxmAnRRdAWHVJIW4w=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=CPH8YVuuI9dZqkJOYzus9EVOmcNY+/VSPDeKmZOrMsCRNwD6u6LC3QOCum6Av+3Byl6
 zFYCpiQoqE/9SKftcMSG6hUtGDY82a/Cyrbqq616Luzo1s+6IsJpiE2VRoNb7i3lIJQ+D
 8IdyNVTWiIjXghopCfDAHd31z9iAseMsAvc=

On 5/3/23 13:02, Arnd Bergmann wrote:
> On Tue, May 2, 2023, at 21:40, Rob Herring wrote:
>> On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wro=
te:
>=20

...

>=20
>>      'stm' : 'stm32',
>>      'sti' : 'sti',
>>      'st-pin' : 'sti',
>>      'ste' : 'st-ericsson',
>>      'spear' : 'spear',
>=20
> I would put all five of these into 'st'. The ux500 was developed
> in st-ericsson, but last sold by st, and the other ones are all
> original st products.

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

thanks
Alex

>=20
>        Arnd
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#279): https://groups.io/g/linux-oxnas/message/279
Mute This Topic: https://groups.io/mt/98787592/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


