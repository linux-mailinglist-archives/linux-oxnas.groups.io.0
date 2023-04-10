Return-Path: <bounce+16102+244+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E03246E416F
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:15 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id swF8YY1809624x1C4TCSCNWI; Mon, 17 Apr 2023 00:42:14 -0700
X-Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.37656.1681105037796977737
 for <linux-oxnas@groups.io>;
 Sun, 09 Apr 2023 22:37:18 -0700
X-Received: by mail-ej1-f43.google.com with SMTP id sh8so10103518ejc.10
        for <linux-oxnas@groups.io>; Sun, 09 Apr 2023 22:37:17 -0700 (PDT)
X-Gm-Message-State: EE7UjBJh277mkITYXGuxorCEx1808289AA=
X-Google-Smtp-Source: AKy350YTLowzB2oBTshKq4rUG1CwxaDQBrenUjB20X2/2en11DizxiRt7NJuVWdjlDxpJZAqRXbXzA==
X-Received: by 2002:a17:906:a043:b0:94b:5921:69f9 with SMTP id bg3-20020a170906a04300b0094b592169f9mr200904ejb.64.1681105036100;
        Sun, 09 Apr 2023 22:37:16 -0700 (PDT)
X-Received: from [192.168.0.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906350d00b0094b0f3886b0sm104670eja.76.2023.04.09.22.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 22:37:15 -0700 (PDT)
Message-ID: <5d091ef6-0f4c-dbf6-fb73-f9f9d13af3d8@linaro.org>
Date: Mon, 10 Apr 2023 06:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [linux-oxnas] [PATCH] mtd: nand: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Miaoqian Lin <linmq006@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Liang Yang <liang.yang@amlogic.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-amlogic@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>,
 Roger Quadros <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Stephen Boyd <sboyd@kernel.org>, Valentin Korenblit
 <vkorenblit@sequans.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park
 <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,tudor.ambarus@linaro.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717334;
 bh=vXE/qGHnP5FhT1qzC4RWxj/4BgoXKBiUSFJcUzSNcfk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=dSVZAgHXm7EbodqsaQsBkDWFY5bL0nxtbCUWD28GGtVO2m8EUDCapdyXuBrPWjxATkv
 mD0HYYilH053dc8zJ3bkXUjkHTe8qirUFjBjfSE53EZqo3c8k4uPWZc8a4IbowTabf14W
 Lm9M7Mq94a+AynwyLrKkXSKtxkISFRxXFlg=



On 4/8/23 19:53, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

b4 seems didn't take my tag on 00/49, here it is again:
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#244): https://groups.io/g/linux-oxnas/message/244
Mute This Topic: https://groups.io/mt/98314479/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


