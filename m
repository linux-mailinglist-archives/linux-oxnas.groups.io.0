Return-Path: <bounce+16102+54+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2282658B
	for <lists+linux-oxnas@lfdr.de>; Wed, 22 May 2019 16:16:52 +0200 (CEST)
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by groups.io with SMTP; Wed, 22 May 2019 06:19:23 -0700
X-Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9B1A421473
	for <linux-oxnas@groups.io>; Wed, 22 May 2019 13:19:22 +0000 (UTC)
X-Received: by mail-qt1-f181.google.com with SMTP id z19so2205185qtz.13
        for <linux-oxnas@groups.io>; Wed, 22 May 2019 06:19:22 -0700 (PDT)
X-Gm-Message-State: APjAAAX21o2QXjExLpg1l0rxg6rA4U4RWSBcQA2X/CgveXus8O27fJzf
	AroM742VzOcAbyMJ8XELHWqbd5Aa+JxOByemmg==
X-Google-Smtp-Source: APXvYqyvYTuRn9kxbS1Z4NqODKeovcHPYdzWdAvI9bwxOBcedkYyTwND/I5vtUvsg9uaG6kVGsaTqAdvJBL/eqFqgL8=
X-Received: by 2002:a0c:929a:: with SMTP id b26mr70772394qvb.148.1558531161859;
 Wed, 22 May 2019 06:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 May 2019 08:19:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
Message-ID: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH] dt: bindings: mtd: replace references to nand.txt with nand-controller.yaml
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, 
	Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Rutland <mark.rutland@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Andy Gross <agross@kernel.org>, 
	David Brown <david.brown@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@st.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, 
	Mans Rullgard <mans@mansr.com>, devicetree@vger.kernel.org, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1558534610;
 bh=6TeQuxMm8DHLOipcGVG95SMTeAhe4eII51iePbjHTy4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Biah2a/MAeIzlbLLvz4u1QLzxSykywHFlm4cQ5WYG5aU2ELh55eMVCZ9/aAfq1qpI8w
 MZIWMSebkv651X0ibMp3l/paFE+kmYf+2Del3NX8AupKeNLEfuxn2Z0h8PwNFuoCbrf6A
 kCT3HaOXdoLGLLedBY+HAyRKBW9abnlMyfI=

On Tue, May 21, 2019 at 2:28 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> nand-controller.yaml replaced nand.txt however the references to it were
> not updated. This change updates these references wherever it appears in
> bindings documentation.
>
> Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Mauro already sent a similar patch.

Rob

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#54): https://groups.io/g/linux-oxnas/message/54
Mute This Topic: https://groups.io/mt/31720296/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

