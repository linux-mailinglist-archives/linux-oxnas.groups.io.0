Return-Path: <bounce+16102+155+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id D029E4843E7
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 15:56:55 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id XVJ2YY1809624xIr9yV6zSnX; Tue, 04 Jan 2022 06:56:54 -0800
X-Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.7722.1641308213819755167
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 06:56:54 -0800
X-Received: by mail-wr1-f44.google.com with SMTP id j18so76715221wrd.2
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 06:56:53 -0800 (PST)
X-Gm-Message-State: 823v6NehQDEGHUp9hfLuoa3qx1808289AA=
X-Google-Smtp-Source: ABdhPJzpq3iDZwJh1M7Crwd08FIYBMlecfSVZrHd7FpM1bxy/phrabpFNFgGHzHZVJt0eB4nnnZWCQ==
X-Received: by 2002:a5d:47cd:: with SMTP id o13mr43062755wrc.669.1641308212220;
        Tue, 04 Jan 2022 06:56:52 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id k10sm19309859wrz.113.2022.01.04.06.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:56:51 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	devicetree@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-oxnas@groups.io,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH net-next v2 1/3] dt-bindings: net: oxnas-dwmac: Add bindings for OX810SE
Date: Tue,  4 Jan 2022 15:56:44 +0100
Message-Id: <20220104145646.135877-2-narmstrong@baylibre.com>
In-Reply-To: <20220104145646.135877-1-narmstrong@baylibre.com>
References: <20220104145646.135877-1-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641308214;
 bh=0t/6uMBLPSwLPWI6grvXmuvt/ImgAXTopK7vYSHjXxI=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=tdbO8qBlu0HYaMtSq8a99pefsY+XGDu5IpgRyLDV7oIYZCO4QtAAtmdozAog8BUaf/u
 V1mZL6tq3dZL3xhznKNYZhIlv7LB2k79Lwd3g51zQfs/RO4DUAyyznju1ajo3H1FIAFPQ
 9rMc2HjZqkJ1vJGoz5K1VS41dQJLffJth2c=

Add SoC specific bindings for OX810SE support.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/net/oxnas-dwmac.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt b/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
index d7117a22fd87..27db496f1ce8 100644
--- a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
@@ -9,6 +9,9 @@ Required properties on all platforms:
 - compatible:	For the OX820 SoC, it should be :
 		- "oxsemi,ox820-dwmac" to select glue
 		- "snps,dwmac-3.512" to select IP version.
+		For the OX810SE SoC, it should be :
+		- "oxsemi,ox810se-dwmac" to select glue
+		- "snps,dwmac-3.512" to select IP version.
 
 - clocks: Should contain phandles to the following clocks
 - clock-names:	Should contain the following:
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#155): https://groups.io/g/linux-oxnas/message/155
Mute This Topic: https://groups.io/mt/88191072/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


