Return-Path: <bounce+16102+153+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC94843CB
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 15:52:23 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id 6qjYYY1809624xr1rh6Bvl3S; Tue, 04 Jan 2022 06:52:22 -0800
X-Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.7783.1641307939355712082
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 06:52:19 -0800
X-Received: by mail-wr1-f44.google.com with SMTP id r17so76674177wrc.3
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 06:52:19 -0800 (PST)
X-Gm-Message-State: aE9dnSOjLDxM8pH4LMs17ntfx1808289AA=
X-Google-Smtp-Source: ABdhPJzoD9KCrAW7cQc3I5OWzupEwE2HWlQZKpJqoxpt5YQyfqDhSf1gYObZVM419BaAFM/vInqSqA==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr29191706wrq.653.1641307937870;
        Tue, 04 Jan 2022 06:52:17 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id s8sm44631911wra.9.2022.01.04.06.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:52:17 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: vkoul@kernel.org
Cc: linux-oxnas@groups.io,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH 4/4] ARM: dts: ox810se: Add DMA Support
Date: Tue,  4 Jan 2022 15:52:06 +0100
Message-Id: <20220104145206.135524-5-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641307942;
 bh=2ZzkBpJhILqzQ0jYC2Yhp11WnpGELzFqYE2GOPYdHAk=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=ocu63CG7eBlP2qIkJm2n9g59oBgnxdTBx3IllFSqAsC+sPsULPF6IP8FJ9uZJib4O21
 NnAngF7ERrnfVzYafxUCGWwZ4ZKw4lejQ6F8cqMUrWv/X0kd93DN57UWEJVsCwtAIXbpz
 sKTHRw5ox3SkDMB9JroCB4ialfkltY94Yt4=

This adds the DMA engine node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/ox810se-wd-mbwe.dts |  4 ++++
 arch/arm/boot/dts/ox810se.dtsi        | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/ox810se-wd-mbwe.dts b/arch/arm/boot/dts/ox810se-wd-mbwe.dts
index 7e2fcb220aea..19e5d510e425 100644
--- a/arch/arm/boot/dts/ox810se-wd-mbwe.dts
+++ b/arch/arm/boot/dts/ox810se-wd-mbwe.dts
@@ -103,6 +103,10 @@ rtc0: rtc@48 {
 	};
 };
 
+&dma {
+	status = "okay";
+};
+
 &uart1 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
index 0755e5864c4a..79b2b49dcfbb 100644
--- a/arch/arm/boot/dts/ox810se.dtsi
+++ b/arch/arm/boot/dts/ox810se.dtsi
@@ -334,6 +334,27 @@ timer0: timer@200 {
 					interrupts = <4 5>;
 				};
 			};
+
+			dma: dma-controller@600000 {
+				compatible = "oxsemi,ox810se-dma";
+				reg = <0x600000 0x100000>,
+				      <0xc00000 0x100000>;
+				reg-names = "dma", "sgdma";
+				interrupts = <13>, <14>, <15>, <16>, <20>;
+				clocks = <&stdclk 1>;
+				resets = <&reset 8>, <&reset 24>;
+				reset-names = "dma", "sgdma";
+
+				/* Encodes the authorized memory types */
+				oxsemi,targets-types =
+					<0x45900000 0x45a00000 0>,  /* SATA */
+					<0x42000000 0x43000000 0>,  /* SATA DATA */
+					<0x48000000 0x58000000 15>, /* DDR */
+					<0x58000000 0x58020000 15>; /* SRAM */
+
+				#dma-cells = <1>;
+				dma-channels = <5>;
+			};
 		};
 	};
 };
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#153): https://groups.io/g/linux-oxnas/message/153
Mute This Topic: https://groups.io/mt/88190968/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


