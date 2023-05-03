Return-Path: <bounce+16102+269+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F896FCB23
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:06 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id MjClYY1809624xs6uQ3qiewA; Tue, 09 May 2023 09:19:04 -0700
X-Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.17350.1683115275445171488
 for <linux-oxnas@groups.io>;
 Wed, 03 May 2023 05:01:16 -0700
Date: Wed, 3 May 2023 14:01:12 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-realtek-soc@lists.infradead.org>, <linux-arm-kernel@axis.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<chrome-platform@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<linux-rockchip@lists.infradead.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, <linux-sunxi@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-actions@lists.infradead.org>, <linux-unisoc@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rpi-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, <kernel@dh-electronics.com>, "Olof
 Johansson" <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <20230503120112.GC19396@axis.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,jesper.nilsson@axis.com
X-Gm-Message-State: 4EX0haMNGr2fAGo0fOxQ91KAx1808289AA=
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649144;
 bh=iXAzgK0x+O8aMSGo34HKrkyJGCYvC6130dzn5b4xBsE=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=tCOD0U8IyIYsKku7Aa/qC6/fqENNOXwI2GuESoqTl/5/LoBImwp0G2eixNT9JiHZLGE
 yPJiazqRum+md9BxKPDocaYwYumz/EfpeOBqnZ3gkWrHW1ijNeyMnkf1QFsvdetlCsnB5
 9J8G+93e1cOxTL4SJUuzxgn+O9OdfbEhurk=

On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
> 
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
> 
> Here's the current mapping:
> 
> vendor_map = {
> [...]
>     'artpec' : 'axis',

Looks good for our platforms also, thanks!

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#269): https://groups.io/g/linux-oxnas/message/269
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


