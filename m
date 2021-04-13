Return-Path: <bounce+16102+103+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B84365B6B
	for <lists+linux-oxnas@lfdr.de>; Tue, 20 Apr 2021 16:45:38 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id VsF6YY1809624xWpbUFBcobV; Tue, 20 Apr 2021 07:45:37 -0700
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.4123.1618350015378467862
 for <linux-oxnas@groups.io>;
 Tue, 13 Apr 2021 14:40:15 -0700
X-Received: by mail.kernel.org (Postfix) with ESMTPS id B533E613C0;
	Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
X-Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A519609B9;
	Tue, 13 Apr 2021 21:40:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [linux-oxnas] [PATCH net-next v4 0/2] of: net: support non-platform devices in of_get_mac_address()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <161835001262.18297.4500601910911096840.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 21:40:12 +0000
References: <20210412174718.17382-1-michael@walle.cc>
In-Reply-To: <20210412174718.17382-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-oxnas@groups.io, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, andreas@gaisler.com,
 davem@davemloft.net, kuba@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@siol.net, joyce.ooi@intel.com, chris.snook@gmail.com,
 rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
 f.fainelli@gmail.com, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com, sgoutham@marvell.com, fugang.duan@nxp.com,
 madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com,
 leoyang.li@nxp.com, yisen.zhuang@huawei.com, salil.mehta@huawei.com,
 hauke@hauke-m.de, thomas.petazzoni@bootlin.com, vkochan@marvell.com,
 tchornyi@marvell.com, mlindner@marvell.com, stephen@networkplumber.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com,
 bryan.whitehead@microchip.com, vz@mleia.com, sergei.shtylyov@gmail.com,
 bh74.an@samsung.com, hayashi.kunihiko@socionext.com, peppe.cavallaro@st.com,
 alexandre.torgue@st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, khilman@baylibre.com,
 narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vkoul@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, grygorii.strashko@ti.com, w-kwok2@ti.com,
 m-karicheri2@ti.com, michal.simek@xilinx.com, radhey.shyam.pandey@xilinx.com,
 kvalo@codeaurora.org, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 stf_xl@wp.pl, helmut.schaa@googlemail.com, hkallweit1@gmail.com,
 robh+dt@kernel.org, frowand.list@gmail.com, gregkh@linuxfoundation.org,
 jerome.pouiller@silabs.com, vivien.didelot@gmail.com, olteanv@gmail.com
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,patchwork-bot+netdevbpf@kernel.org
X-Gm-Message-State: 0kYiJHp1QxEKDPciILdipe13x1808289AA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1618929937;
 bh=9aMSIDH0euTr8M41OZEQDck5j/Xu0WgrVhYrWW0gaEo=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=ql3UdQtNl6OM5hmOuvdWSV3o0Gr49D2tkizdnqthULJ2Q8mg3zY0taSGV9CTyI/Da4S
 lz8Lc5PO/7lmgxtvJ14TAHWTdFS2b7hkAQb2Kx7H78ijBL+CyCT8gTAm7SLyeBw559NZH
 YVkkhvRhg8U65TL1hBN+8WG8EjhZLm6pPJI=

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Mon, 12 Apr 2021 19:47:16 +0200 you wrote:
> of_get_mac_address() is commonly used to fetch the MAC address
> from the device tree. It also supports reading it from a NVMEM
> provider. But the latter is only possible for platform devices,
> because only platform devices are searched for a matching device
> node.
>=20
> Add a second method to fetch the NVMEM cell by a device tree node
> instead of a "struct device".
>=20
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] of: net: pass the dst buffer to of_get_mac_address()
    https://git.kernel.org/netdev/net-next/c/83216e3988cd
  - [net-next,v4,2/2] of: net: fix of_get_mac_addr_nvmem() for non-platfor=
m devices
    https://git.kernel.org/netdev/net-next/c/f10843e04a07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#103): https://groups.io/g/linux-oxnas/message/103
Mute This Topic: https://groups.io/mt/82236155/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr=
.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


