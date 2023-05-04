Return-Path: <bounce+16102+280+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 382876FCB32
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:19 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id xmXLYY1809624xyKvrkOoDKt; Tue, 09 May 2023 09:19:17 -0700
X-Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mx.groups.io with SMTP id smtpd.web10.46200.1683195141448184722
 for <linux-oxnas@groups.io>;
 Thu, 04 May 2023 03:12:22 -0700
X-Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49876)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1puVwF-0004T3-Sb; Thu, 04 May 2023 11:11:51 +0100
X-Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1puVwB-0002mb-S8; Thu, 04 May 2023 11:11:47 +0100
Date: Thu, 4 May 2023 11:11:47 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olof Johansson <olof@lixom.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Linux-OMAP <linux-omap@vger.kernel.org>,
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
Message-ID: <ZFOE4wd31hpJh0ro@shell.armlinux.org.uk>
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
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,linux@armlinux.org.uk
X-Gm-Message-State: n14oJgBeq0SaJSO6ROSD0vMYx1808289AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649157;
 bh=iXOBIKXQLvXX6KSIkUrYkDQwHWv2Tiu5JPir6Zl1cPk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=hs1C/BhTr0pdv7Q3vock4hUcJPxCbork+ACrNkNBKVfCrPGrs22I+VAXI/0USUY6tJG
 e0J8OQldxxxz5k1uRkL5v1mO+Cxv2mdGW3ID2Ve0PJgd5rAKjqrYn0P7WHfEFJu9vfoYc
 Z8k8SnZGa3pkOdLuI/YXH6NLnO7nMVC9qHY=

On Tue, May 02, 2023 at 02:40:19PM -0500, Rob Herring wrote:
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.

I haven't followed this discussion at all, so here's a question.

What does this mean for the _installed_ dtb files? Do they move
location? If they do, lots is going to break, because there will
be u-boot configurations and other scripts that assume the flat
directory structure for the installed dtb files.

I don't think changing the installed dtb structure is acceptable
at this point in time. It's something that _should_ have been
thought about when ARM was converted to dtb, it's too late to be
changing that now.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#280): https://groups.io/g/linux-oxnas/message/280
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


