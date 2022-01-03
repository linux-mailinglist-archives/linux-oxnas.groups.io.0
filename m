Return-Path: <bounce+16102+144+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C05D483675
	for <lists+linux-oxnas@lfdr.de>; Mon,  3 Jan 2022 18:56:46 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id xNDiYY1809624xNDtaYrlSph; Mon, 03 Jan 2022 09:56:44 -0800
X-Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.32127.1641232603154937342
 for <linux-oxnas@groups.io>;
 Mon, 03 Jan 2022 09:56:43 -0800
X-Received: by mail-wr1-f45.google.com with SMTP id o3so13131195wrh.10
        for <linux-oxnas@groups.io>; Mon, 03 Jan 2022 09:56:42 -0800 (PST)
X-Gm-Message-State: tUzVCb61iMyUFVa8WyxUWwtLx1808289AA=
X-Google-Smtp-Source: ABdhPJw7NRuoQzYialN/ofxRojlC+rMlNFgTAaoktigERArvcxUcZfxMwsO4ZIqBe2qOY/2d56FPug==
X-Received: by 2002:a05:6000:2a4:: with SMTP id l4mr40910111wry.460.1641232601515;
        Mon, 03 Jan 2022 09:56:41 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
        by smtp.gmail.com with ESMTPSA id f13sm35763228wri.51.2022.01.03.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:56:40 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: davem@davemloft.net,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io,
	linux-kernel@vger.kernel.org
Subject: [linux-oxnas] [PATCH net-next 1/3] dt-bindings: net: oxnas-dwmac: Add bindings for OX810SE
Date: Mon,  3 Jan 2022 18:56:36 +0100
Message-Id: <20220103175638.89625-2-narmstrong@baylibre.com>
In-Reply-To: <20220103175638.89625-1-narmstrong@baylibre.com>
References: <20220103175638.89625-1-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641232604;
 bh=FRznCGwYSXstmEXjQxmzLlxDGRnuFb0ZkTlElP1CB40=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=Hg8cU4zR16uKzGYm593bnWm2wM2mroWd7/OKqr2dBPk/1tHSZseQqck4zyhh1xyQdan
 jOYMAr/5pyV36Qhqe1SAdAVc9vtVPAsjZl7BBayBs/5SL1MbBgClWiz3nlau7CBMkxg2i
 GGevullbJgAaU4EkardLfOEr9kIuQ9J1p9U=

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
View/Reply Online (#144): https://groups.io/g/linux-oxnas/message/144
Mute This Topic: https://groups.io/mt/88117937/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


