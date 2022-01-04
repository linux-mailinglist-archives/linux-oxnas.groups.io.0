Return-Path: <bounce+16102+149+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEFA4843C4
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 15:52:19 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id p1bQYY1809624xKXrT05zFMx; Tue, 04 Jan 2022 06:52:18 -0800
X-Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.7489.1641307936237059529
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 06:52:17 -0800
X-Received: by mail-wr1-f48.google.com with SMTP id e5so76680609wrc.5
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 06:52:15 -0800 (PST)
X-Gm-Message-State: tg2HASSPsTwQoldj4yUmagGix1808289AA=
X-Google-Smtp-Source: ABdhPJw/715o7C1vxbbnWVHhEuOXt9DGLA4fqF9EXUXPePaBDOq2rGd+7F+ilaJHSgrNr911QzGXaQ==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr43444018wrn.378.1641307934167;
        Tue, 04 Jan 2022 06:52:14 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id s8sm44631911wra.9.2022.01.04.06.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:52:13 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: vkoul@kernel.org
Cc: linux-oxnas@groups.io,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH 0/4] dmaengine: Add support Oxford Semiconductor OXNAS DMA Engine
Date: Tue,  4 Jan 2022 15:52:02 +0100
Message-Id: <20220104145206.135524-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1641307938;
 bh=6VV6GuJq/7RKkoZTv03C8UWn792PFDo/ajj1bcLxJMg=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=ofJArFXkQiJrbH2PZP4F8vqeq964SUU/aRtrc1qCDNOrTeIEZT5mAGYF28gslEUuLwV
 vC0QELprfPHy1l4vVG58quLl1g9iYMRoEb4Ga4aHdCLi8d1YF6gNV8CTAkdbOyy2HThPt
 O9ghoUeOmqW0FilUac58K/grgMc/4rLynsA=

This serie adds support for the DMA engine found in Oxford Semiconductor SoCs,
notably in the OX810SE where it's heavily used for SATA transfers.

The driver was on my pipe since 2016 and a courageous person managed to get
the SATA driver work up mainline kernel with this driver, so I cleaned it up
in order to be upstreamed.

I plan to push the last patch through arm-soc when bindings is applied.

Neil Armstrong (4):
  dt-bindings: dma: Add bindings for ox810se dma engine
  dmaengine: Add Oxford Semiconductor OXNAS DMA Controller
  MAINTAINERS: add OX810SE DMA driver files under Oxnas entry
  ARM: dts: ox810se: Add DMA Support

 .../bindings/dma/oxsemi,ox810se-dma.yaml      |   97 ++
 MAINTAINERS                                   |    2 +
 arch/arm/boot/dts/ox810se-wd-mbwe.dts         |    4 +
 arch/arm/boot/dts/ox810se.dtsi                |   21 +
 drivers/dma/Kconfig                           |    8 +
 drivers/dma/Makefile                          |    1 +
 drivers/dma/oxnas_adma.c                      | 1045 +++++++++++++++++
 7 files changed, 1178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml
 create mode 100644 drivers/dma/oxnas_adma.c


base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#149): https://groups.io/g/linux-oxnas/message/149
Mute This Topic: https://groups.io/mt/88190964/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


