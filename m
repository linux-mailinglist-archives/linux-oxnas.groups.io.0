Return-Path: <bounce+16102+99+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F6357E98
	for <lists+linux-oxnas@lfdr.de>; Thu,  8 Apr 2021 11:00:51 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id CbORYY1809624ximQ1LVmgtG; Thu, 08 Apr 2021 02:00:50 -0700
X-Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by mx.groups.io with SMTP id smtpd.web11.9722.1617811838434419023
 for <linux-oxnas@groups.io>;
 Wed, 07 Apr 2021 09:10:40 -0700
X-Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 18A9F22236;
	Wed,  7 Apr 2021 18:10:31 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 18:10:30 +0200
From: Michael Walle <michael@walle.cc>
To: ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-oxnas@groups.io, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andreas
 Larsson <andreas@gaisler.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Chris Snook <chris.snook@gmail.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, Florian Fainelli
 <f.fainelli@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Sunil Goutham <sgoutham@marvell.com>,
 Fugang Duan <fugang.duan@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Li Yang <leoyang.li@nxp.com>, Yisen Zhuang
 <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Hauke
 Mehrtens <hauke@hauke-m.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Vadym Kochan <vkochan@marvell.com>, Taras
 Chornyi <tchornyi@marvell.com>, Mirko Lindner <mlindner@marvell.com>,
 Stephen Hemminger <stephen@networkplumber.org>, Felix Fietkau
 <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Bryan Whitehead
 <bryan.whitehead@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, Sergei
 Shtylyov <sergei.shtylyov@gmail.com>, Byungho An <bh74.an@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Vinod Koul <vkoul@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Wingman Kwok <w-kwok2@ti.com>, Murali Karicheri
 <m-karicheri2@ti.com>, Michal Simek <michal.simek@xilinx.com>, Radhey Shyam
 Pandey <radhey.shyam.pandey@xilinx.com>, Kalle Valo <kvalo@codeaurora.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Helmut Schaa
 <helmut.schaa@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?J=C3=A9r=C3=B4me?=
 =?UTF-8?Q?_Pouiller?= <jerome.pouiller@silabs.com>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [linux-oxnas] [PATCH net-next v3 1/2] of: net: pass the dst buffer to of_get_mac_address()
In-Reply-To: <20210406220921.24313-2-michael@walle.cc>
References: <20210406220921.24313-1-michael@walle.cc>
 <20210406220921.24313-2-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <50f474611ecf0f5e61c9a14a24b28773@walle.cc>
X-Sender: michael@walle.cc
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,michael@walle.cc
X-Gm-Message-State: 4dqYoimSSawizT7NTkfe1WMox1808289AA=
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1617872450;
 bh=9uWwc9qGsW5xvJVj5OSLdEfqbjHATuR6Bk3YHBrit2Y=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Ohmc4oU89rDYbcF5QztOyKVkvAetIzH3hJ9vrn9O7gr8p+/4hKmn7ULV+B0vMypc6eU
 BIQQLXNb3Y3PHsSGBeadInnRukGmoc6bCHRSSZZRACr5pqrpKglU254h/EX1twt7d9tDk
 qMQ8PBgbQe4FDIwIYSRNyMxRnKxtS2l45u0=

Am 2021-04-07 00:09, schrieb Michael Walle:
[..]
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index bc0a27de69d4..2d5d5e59aea5 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
> @@ -45,42 +45,35 @@ int of_get_phy_mode(struct device_node *np,
> phy_interface_t *interface)
>  }
>  EXPORT_SYMBOL_GPL(of_get_phy_mode);
> 
> -static const void *of_get_mac_addr(struct device_node *np, const char 
> *name)
> +static int of_get_mac_addr(struct device_node *np, const char *name, 
> u8 *addr)
>  {
>  	struct property *pp = of_find_property(np, name, NULL);
> 
> -	if (pp && pp->length == ETH_ALEN && is_valid_ether_addr(pp->value))
> -		return pp->value;
> -	return NULL;
> +	if (pp && pp->length == ETH_ALEN && is_valid_ether_addr(pp->value)) {
> +		ether_addr_copy(addr, pp->value);

Mh, I guess this should rather be memcpy(addr, pp->value, ETH_ALEN) 
because
ether_addr_copy() needs 2 byte aligned source and destination buffers.

-michael


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#99): https://groups.io/g/linux-oxnas/message/99
Mute This Topic: https://groups.io/mt/81937726/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


