Return-Path: <bounce+16102+293+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 994BF702981
	for <lists+linux-oxnas@lfdr.de>; Mon, 15 May 2023 11:50:33 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id RDyeYY1809624x1rBpHX1v71; Mon, 15 May 2023 02:50:31 -0700
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web10.7885.1683687626417945301
 for <linux-oxnas@groups.io>;
 Tue, 09 May 2023 20:00:26 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 808DC638FF;
	Wed, 10 May 2023 03:00:25 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPS id B5C7CC4339B;
	Wed, 10 May 2023 03:00:24 +0000 (UTC)
X-Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C0E5C39562;
	Wed, 10 May 2023 03:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [linux-oxnas] [PATCH net-next v2 00/11] net: stmmac: Convert to platform remove callback returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168368762456.27124.17176817660933091864.git-patchwork-notify@kernel.org>
Date: Wed, 10 May 2023 03:00:24 +0000
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, vz@mleia.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, vkoul@kernel.org,
 kernel@esmil.dk, samin.guo@starfivetech.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 bhupesh.sharma@linaro.org, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,patchwork-bot+netdevbpf@kernel.org
X-Gm-Message-State: YFwR0KDqV3pi5ykaxemJkEXNx1808289AA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1684144231;
 bh=z/r8wxef1fpzb1loSHvcNAt4NUARp113k8FHrNPqL8g=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=PT5/wXntw4lo1cBQwDejA8RIdjO7SkssbwmFMOYwfW5AqIXnuzMgmVNSKFXXctSP3EP
 1SIHMqM5Xx1EAyrMPv4TYpXTY0rbt1SY1DRjR4LwgtVakssEPoiOlFwsrfgUHQqgMBD57
 cmr8JFBgh8V9nH2sAuwvvA/wFFfGWaW7NwA=

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  8 May 2023 16:26:26 +0200 you wrote:
> Hello,
>=20
> (implicit) v1 of this series is available at
> https://lore.kernel.org/netdev/20230402143025.2524443-1-u.kleine-koenig@p=
engutronix.de
> .
>=20
> Changes since then:
>=20
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: stmmac: Make stmmac_pltfr_remove() return void
    https://git.kernel.org/netdev/net-next/c/3246627f11c5
  - [net-next,v2,02/11] net: stmmac: dwmac-visconti: Make visconti_eth_cloc=
k_remove() return void
    https://git.kernel.org/netdev/net-next/c/b9bc44fe068d
  - [net-next,v2,03/11] net: stmmac: dwmac-qcom-ethqos: Drop an if with an =
always false condition
    https://git.kernel.org/netdev/net-next/c/c5f3ffe35cc9
  - [net-next,v2,04/11] net: stmmac: dwmac-visconti: Convert to platform re=
move callback returning void
    https://git.kernel.org/netdev/net-next/c/f4d05c419761
  - [net-next,v2,05/11] net: stmmac: dwmac-dwc-qos-eth: Convert to platform=
 remove callback returning void
    https://git.kernel.org/netdev/net-next/c/360cd89064b6
  - [net-next,v2,06/11] net: stmmac: dwmac-qcom-ethqos: Convert to platform=
 remove callback returning void
    https://git.kernel.org/netdev/net-next/c/5580b559a80a
  - [net-next,v2,07/11] net: stmmac: dwmac-rk: Convert to platform remove c=
allback returning void
    https://git.kernel.org/netdev/net-next/c/903cc461c901
  - [net-next,v2,08/11] net: stmmac: dwmac-sti: Convert to platform remove =
callback returning void
    https://git.kernel.org/netdev/net-next/c/b394982a10d9
  - [net-next,v2,09/11] net: stmmac: dwmac-stm32: Convert to platform remov=
e callback returning void
    https://git.kernel.org/netdev/net-next/c/fec3f552140e
  - [net-next,v2,10/11] net: stmmac: dwmac-sun8i: Convert to platform remov=
e callback returning void
    https://git.kernel.org/netdev/net-next/c/cc708d4ed7b3
  - [net-next,v2,11/11] net: stmmac: dwmac-tegra: Convert to platform remov=
e callback returning void
    https://git.kernel.org/netdev/net-next/c/a86f8601c8f0

You are awesome, thank you!
--=20
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#293): https://groups.io/g/linux-oxnas/message/293
Mute This Topic: https://groups.io/mt/98787607/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


