Return-Path: <bounce+16102+55+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5D2658D
	for <lists+linux-oxnas@lfdr.de>; Wed, 22 May 2019 16:16:52 +0200 (CEST)
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by groups.io with SMTP; Wed, 22 May 2019 06:56:06 -0700
X-Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9B2D021841
	for <linux-oxnas@groups.io>; Wed, 22 May 2019 13:56:05 +0000 (UTC)
X-Received: by mail-qk1-f171.google.com with SMTP id f126so1495394qkc.9
        for <linux-oxnas@groups.io>; Wed, 22 May 2019 06:56:05 -0700 (PDT)
X-Gm-Message-State: APjAAAXx9g7jQv8Imtuj+c0+etyh42EhQQBne0fzDQr1fF+JTYkn7Dew
	LxAls12Pj63ZdZB5nME4r9uxqNlZ9M7DU04TuQ==
X-Google-Smtp-Source: APXvYqzvt+EFGiFr6y2zsSRBs4qOUs7e+/z+bJpZu4CMkQbtQjvYCr7ioBnDYS6ibBsbagsPUO0sVjALMvR6IRu+67E=
X-Received: by 2002:a37:dc03:: with SMTP id v3mr70538862qki.151.1558533364775;
 Wed, 22 May 2019 06:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com> <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
In-Reply-To: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 May 2019 08:55:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ+zNQ3CeBh8K=oBiZZsiBQ8w1w=6vs8zOQeqUf_qhqcg@mail.gmail.com>
Message-ID: <CAL_JsqJ+zNQ3CeBh8K=oBiZZsiBQ8w1w=6vs8zOQeqUf_qhqcg@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH] dt: bindings: mtd: replace references to nand.txt with nand-controller.yaml
To: Kamal Dasu <kdasu.kdev@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
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
 q=dns/txt; s=20140610; t=1558534611;
 bh=GmK88Yn3melgqXhLKid5Qxj6U12yzc0jJNXoGLlTd+4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=WzbOf0cHzh0yD+ixQBG7hK9+VQKMTZV+V5mS5ugT5i+pJlvkwUXb1b8KAeidn13GIf0
 vVq0KYZFOAYwyymBVcYvVdJ8wRByD5pdE619vUZs5GRMuDP7XNwYGgRJoURgOpDrkyxVS
 RbjLyJmfmiuaEyAopPvCTf0PrBOj/Ov2UpQ=

On Wed, May 22, 2019 at 8:19 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, May 21, 2019 at 2:28 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >
> > nand-controller.yaml replaced nand.txt however the references to it were
> > not updated. This change updates these references wherever it appears in
> > bindings documentation.
> >
> > Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
> >
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>
> Mauro already sent a similar patch.

Actually, Mauro's patch missed a bunch of cases that aren't full
paths, so I'll take this one.

Rob

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#55): https://groups.io/g/linux-oxnas/message/55
Mute This Topic: https://groups.io/mt/31720296/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

