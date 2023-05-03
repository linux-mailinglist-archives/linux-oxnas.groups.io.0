Return-Path: <bounce+16102+275+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DC56FCB29
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:11 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id ZZBfYY1809624xu6FkXcAIcH; Tue, 09 May 2023 09:19:10 -0700
X-Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
 by mx.groups.io with SMTP id smtpd.web11.32895.1683146259899766040
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 13:37:40 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 204E5580DD5;
	Wed,  3 May 2023 16:37:39 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 03 May 2023 16:37:39 -0400
X-ME-Sender: <xms:EsZSZB5kJ0GrHR853zsjReTXCKVzZZoOEsZUrLM9Ii19_fMe7QEyIg>
    <xme:EsZSZO6wVrnO6sfVpVMYHV-p9-4TDkFZOjWwoen4Pv4_WkwrEpvS1M4ci3zIanwDm
    iUGKsSgwu187PEcA7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:EsZSZIeBp0ONVV8TVGAY_CZg0aGNjOO37JGCfetCDzJCfsVOWHoHeA>
    <xmx:EsZSZKLcCAxw1z1MpswPdC09DGpopJXBLGfDzf3ZMawPn9MBk-esNw>
    <xmx:EsZSZFJBmzNloya5zTwIRkajH22JwQIMIb5cn4Bc3yIvQGmJ9q_Iog>
    <xmx:E8ZSZAITCL8EImpKlG0FYkRLfsze_wfBG8B-LvTI8Bca_uFWRtmTrA>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0094FB60086; Wed,  3 May 2023 16:37:37 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <4d9b4159-88b2-48cf-84d9-34169928c8e4@app.fastmail.com>
In-Reply-To: 
 <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
 <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
 <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
 <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com>
 <CAL_JsqJEdZBS231TvkmmipaXEqzvDjz+A32V6uJ4zfSMAJHn2w@mail.gmail.com>
Date: Wed, 03 May 2023 22:37:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>,
 "Christian Marangi" <ansuelsmth@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: 3tjPUpW58JZQEDZgCYAvkxgmx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649150;
 bh=PJ/3voT9bKbfhLlGDq8crwesE45+xJ/Rdevr6wrSNfc=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=cY/G+g7wyDzRqNGGnvl+5OxCLWt3nLTY5ctskR7DvKnU4PfK1dRnQUT+rgmaNSeOoiq
 Bqnwk+/nP2Bd+E3G5m0GWaCtESMUTf0UjiCC6P7kakkl8XNVLwtOt736cf5rmN9jTWMBK
 /74/6oFKX5uC1RoaQOcrY+7OAIyUmKCTtMM=

On Wed, May 3, 2023, at 15:16, Rob Herring wrote:

> We could do a second level of directories here:

Works for me, but at that point, I'd really also want to do it
for nxp with its five or more product lines (mxs, imx, lpc,
s32, layerscape, vybrid)

> intel/pxa/
> intel/ixp/
> intel/socfpga/

and intel/axxia I guess.

     Arnd


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#275): https://groups.io/g/linux-oxnas/message/275
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


