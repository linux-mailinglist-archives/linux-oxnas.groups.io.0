Return-Path: <bounce+16102+62+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC433F91E0
	for <lists+linux-oxnas@lfdr.de>; Tue, 12 Nov 2019 15:20:36 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id VtA4YY1809624xXydCUfnw6M; Tue, 12 Nov 2019 06:20:35 -0800
X-Received: from huawei.com (huawei.com [45.249.212.191])
 by mx.groups.io with SMTP id smtpd.web11.10187.1572830235145602265
 for <linux-oxnas@groups.io>;
 Sun, 03 Nov 2019 17:17:15 -0800
X-Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id AEC5BAC7CFCEE8B8AB48;
	Mon,  4 Nov 2019 09:17:12 +0800 (CST)
X-Received: from [127.0.0.1] (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 09:17:11 +0800
Subject: Re: [linux-oxnas] [PATCH -next 01/30] pinctrl: pxa25x: use devm_platform_ioremap_resource() to simplify code
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-2-yuehaibing@huawei.com>
 <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Florian Fainelli
	<f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, bcm-kernel-feedback-list
	<bcm-kernel-feedback-list@broadcom.com>, Jesper Nilsson
	<jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, "Ludovic
 Desroches" <ludovic.desroches@microchip.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Baruch Siach <baruch@tkos.co.il>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<linux-oxnas@groups.io>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	MSM <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	"Vladimir Zapolskiy" <vz@mleia.com>, Neil Armstrong
	<narmstrong@baylibre.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Andy Gross
	<agross@kernel.org>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <c8b14d9b-253b-47a1-641f-e89d2cc79686@huawei.com>
Date: Mon, 4 Nov 2019 09:17:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,yuehaibing@huawei.com
X-Gm-Message-State: zF4cRgikRi2sGZG6uA5hkkuxx1808289AA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1573568435;
 bh=JjOmm154vgRiley0Ie/YidEYwWoHBFmOV0gjcuJJTdM=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=Xfta22cbyGmi14hmKOdSGTIXhZBOrayUP4IlhyNvGIOjcoQYXc8l59/STy4gKm6x5ia
 Mlrf6qjC97k3ezWj/Ed8IH3Aqpi8ZL+I3d/VkrGILEm/e75Uqow+3PqqW4p34fSMUAlu9
 dP93Jly8Kby5uXwMj0YeQ6nA/RHCxrCxwyc=

On 2019/11/4 8:18, Linus Walleij wrote:
> On Thu, Oct 17, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:
> 
>> Use devm_platform_ioremap_resource() to simplify the code a bit.
>> This is detected by coccinelle.
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> These are too many patches changing too little.
> One patch should be one technical step.
> 
> I'd say squash them all into one big patch and resend.
> 
> You can collect the ACKs you received, but don't put
> too many people on CC, they will be annoyed.

Ok, will do that, thanks!

> 
> Yours,
> Linus Walleij
> 
> .
> 


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#62): https://groups.io/g/linux-oxnas/message/62
Mute This Topic: https://groups.io/mt/54270634/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

