Return-Path: <bounce+16102+237+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B516E4165
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:06 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 8avjYY1809624xcY9x8DPhBN; Mon, 17 Apr 2023 00:42:04 -0700
X-Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.79895.1680547005269089239
 for <linux-oxnas@groups.io>;
 Mon, 03 Apr 2023 11:36:45 -0700
X-Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17aeb49429eso31835838fac.6
        for <linux-oxnas@groups.io>; Mon, 03 Apr 2023 11:36:45 -0700 (PDT)
X-Gm-Message-State: bXuVDjVFTAvBX0QlTkWfd2Vgx1808289AA=
X-Google-Smtp-Source: AKy350ZUlFhjgnglIoYafXPoxlDOutQn4rOsAma6LUGjUwvFzwRX7OlCEgbyqHLMXYRz6fgk9hhxRA==
X-Received: by 2002:a05:6870:1707:b0:17e:3772:bdd7 with SMTP id h7-20020a056870170700b0017e3772bdd7mr90499oae.46.1680547004506;
        Mon, 03 Apr 2023 11:36:44 -0700 (PDT)
X-Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id xf19-20020a056870cf1300b001724742cfcesm3759713oab.38.2023.04.03.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 11:36:44 -0700 (PDT)
X-Received: (nullmailer pid 1340936 invoked by uid 1000);
	Mon, 03 Apr 2023 18:36:43 -0000
Date: Mon, 3 Apr 2023 13:36:43 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-oxnas@groups.io, Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [linux-oxnas] [PATCH RFC v2 0/4] ARM: oxnas support removal
Message-ID: <20230403183643.GA1335487-robh@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,robh@kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717324;
 bh=Qfsf23tGDi6l41yW0t2zXQKjpz15OQbeD4ede5t55Ec=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=fMBaSUakXa4RPLcVCBApCA7zp+JoMVwApLHXvVMrQqR223aohS9FInrG5BA8HKyB8TC
 C0NkvuBHkAMw2jhxGuASGuh4lYSODQ0NZz+SkRYJ3ikJthWbK+x0qlZEdVnoRCFDpcEEU
 jKpral9iDXAUNOhkbrpaELa/9KueeeVH0JM=

On Mon, Apr 03, 2023 at 09:42:17AM +0200, Neil Armstrong wrote:
> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration to
> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
> 
> In addition, the OX810 hasn't been booted for years and isn't even present
> in an ARM config file.
> 
> For the OX820, lack of USB and SATA support makes the platform not usable
> in the current Linux support and relies on off-tree drivers hacked from the
> vendor (defunct for years) sources.
> 
> The last users are in the OpenWRT distribution, and today's removal means
> support will still be in stable 6.1 LTS kernel until end of 2026.
> 
> If someone wants to take over the development even with lack of SMP, I'll
> be happy to hand off maintainance.
> 
> The plan is to apply the first 4 patches first, then the drivers
> followed by bindings. Finally the MAINTAINANCE entry can be removed.
> 
> I'm not sure about the process of bindings removal, but perhaps the bindings
> should be marked as deprecated first then removed later on ?

Nah, just remove them. Like the code, we can always bring them back if 
needed.

Rob


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#237): https://groups.io/g/linux-oxnas/message/237
Mute This Topic: https://groups.io/mt/98030323/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


