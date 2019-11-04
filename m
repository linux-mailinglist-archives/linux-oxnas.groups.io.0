Return-Path: <bounce+16102+61+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C474DF91DF
	for <lists+linux-oxnas@lfdr.de>; Tue, 12 Nov 2019 15:20:36 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id FZ51YY1809624xPqI7O9VCve; Tue, 12 Nov 2019 06:20:35 -0800
X-Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web12.9602.1572826723446214721
 for <linux-oxnas@groups.io>;
 Sun, 03 Nov 2019 16:18:43 -0800
X-Received: by mail-ua1-f67.google.com with SMTP id n41so4440318uae.2
        for <linux-oxnas@groups.io>; Sun, 03 Nov 2019 16:18:43 -0800 (PST)
X-Gm-Message-State: yb3RXGw2SEME87Ieg0k78FbOx1808289AA=
X-Google-Smtp-Source: APXvYqxaDMOhPupmDshbsu4K1ddLDJNFp+Loev7XOmTsYtFTpgq7W/3FH8VrI3bEONc6DjxIfdtklet+o4Mib1wkwhc=
X-Received: by 2002:ab0:70a9:: with SMTP id q9mr4518172ual.84.1572826722501;
 Sun, 03 Nov 2019 16:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20191017122640.22976-1-yuehaibing@huawei.com> <20191017122640.22976-2-yuehaibing@huawei.com>
In-Reply-To: <20191017122640.22976-2-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Nov 2019 01:18:31 +0100
Message-ID: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH -next 01/30] pinctrl: pxa25x: use devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Baruch Siach <baruch@tkos.co.il>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@axis.com, 
	linux-oxnas@groups.io, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	MSM <linux-arm-msm@vger.kernel.org>, linux-tegra@vger.kernel.org, 
	Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Andy Gross <agross@kernel.org>
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1573568435;
 bh=3Hr2S0eSM3g3QKv8KxCzbROWstQEcYJQUAlDubUSGkI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=jaEMmaoATBsPxekTicOGq+a9tNx8RjKK+7IYI7peEwNBnHOEiB4Mbza3utaeR/LMIWb
 OmnyWB6ewnBCp0AyQ7PPLcigzC9+t9IuuUUTMrtriZQ1zEtnQF5HVR30EK3Y6ZykC2oeq
 L+gc2GoTPuRZOFXhIC3dW9UDMqzEZNWyh/I=

On Thu, Oct 17, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

These are too many patches changing too little.
One patch should be one technical step.

I'd say squash them all into one big patch and resend.

You can collect the ACKs you received, but don't put
too many people on CC, they will be annoyed.

Yours,
Linus Walleij

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#61): https://groups.io/g/linux-oxnas/message/61
Mute This Topic: https://groups.io/mt/54270634/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

