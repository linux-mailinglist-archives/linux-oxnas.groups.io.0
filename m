Return-Path: <bounce+16102+152+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B54843C9
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 15:52:21 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id JOXRYY1809624xWFK264wsyg; Tue, 04 Jan 2022 06:52:20 -0800
X-Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7604.1641307938323636512
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 06:52:18 -0800
X-Received: by mail-wr1-f47.google.com with SMTP id d9so76775913wrb.0
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 06:52:18 -0800 (PST)
X-Gm-Message-State: GyK6Umy72OynQrapAGjyt0wDx1808289AA=
X-Google-Smtp-Source: ABdhPJyu7XA8SWsiYPPQCj6xPaOAbwDu2a0ry2jooPPLmfASRRiymsHWP0AZCLawD0zJKoMYS6lP5Q==
X-Received: by 2002:adf:efd0:: with SMTP id i16mr43370519wrp.86.1641307936801;
        Tue, 04 Jan 2022 06:52:16 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id s8sm44631911wra.9.2022.01.04.06.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:52:16 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: vkoul@kernel.org
Cc: linux-oxnas@groups.io,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH 3/4] MAINTAINERS: add OX810SE DMA driver files under Oxnas entry
Date: Tue,  4 Jan 2022 15:52:05 +0100
Message-Id: <20220104145206.135524-4-narmstrong@baylibre.com>
In-Reply-To: <20220104145206.135524-1-narmstrong@baylibre.com>
References: <20220104145206.135524-1-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641307940;
 bh=hRxIX7soHTSY5f46rWLuB0RhMJWYSW5u+ye72z/Ay38=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=MGiiImSd59MjYna9arOx7X7pKmoSeBLw8WgDxzyBIieO6Sg3JJPGkehg/+DCDesVS0w
 ctSn7jkBfvFfm2RPvqUVPO8pUgk1CHw9kzVc0Mb1rd+EBEGgrY6AGujhNrQ5AFmxCcXOY
 Iys501/CY5OkzqWYID6AhAC08R27VocKRSk=

Add the DMA driver file and bindings in the Oxnas maintainers entry.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..782332ab0d9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2371,8 +2371,10 @@ M:	Neil Armstrong <narmstrong@baylibre.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-oxnas@groups.io (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml
 F:	arch/arm/boot/dts/ox8*.dts*
 F:	arch/arm/mach-oxnas/
+F:	drivers/dma/oxnas_adma.c
 F:	drivers/power/reset/oxnas-restart.c
 N:	oxnas
 
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#152): https://groups.io/g/linux-oxnas/message/152
Mute This Topic: https://groups.io/mt/88190967/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


