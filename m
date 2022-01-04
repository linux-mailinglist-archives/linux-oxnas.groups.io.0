Return-Path: <bounce+16102+157+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDF4843EB
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 15:56:57 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id fTEyYY1809624xJVIgKoXrm6; Tue, 04 Jan 2022 06:56:56 -0800
X-Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.7540.1641308215453818903
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 06:56:55 -0800
X-Received: by mail-wm1-f41.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so1582989wme.4
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 06:56:55 -0800 (PST)
X-Gm-Message-State: 4Ewy8Ort0INXU42WaW5s5h36x1808289AA=
X-Google-Smtp-Source: ABdhPJxFptGtlJldG0ByIqvEYEbbrflwjVjobp1qK+74UeP6+B5JY8OVsdELT/IyNlyDInC3z44YDQ==
X-Received: by 2002:a1c:4c08:: with SMTP id z8mr41067300wmf.48.1641308214010;
        Tue, 04 Jan 2022 06:56:54 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id k10sm19309859wrz.113.2022.01.04.06.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:56:53 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: netdev@vger.kernel.org,
	linux-oxnas@groups.io,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH arm-soc-next v2 3/3] ARM: dts: ox810se: Add Ethernet support
Date: Tue,  4 Jan 2022 15:56:46 +0100
Message-Id: <20220104145646.135877-4-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641308216;
 bh=0vZoYS3RUTA0cThvuoEcMOcuFC4w24T2gmNLymMDQ4Y=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=IxmjqbaBNh8FHIICoJw6n860Oj4ZPzSIsJzKBeHfWagb8reBcxC9nT5/WOOYs/5XcqS
 F0V/E3vFZW48jQ30HQvo2U1dujnMvBjCMUuAmFTLPTKtTRY6rOscggLElkJgGaj6CYS0f
 X/0AJuEHtM15G9Wv3sXIyFtqyGNWzAecr0Y=

Add nodes for the embedded Synopsys DWMAC Ethernet controller.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/ox810se-wd-mbwe.dts |  4 ++++
 arch/arm/boot/dts/ox810se.dtsi        | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/ox810se-wd-mbwe.dts b/arch/arm/boot/dts/ox810se-wd-mbwe.dts
index 7e2fcb220aea..c59e06ff2423 100644
--- a/arch/arm/boot/dts/ox810se-wd-mbwe.dts
+++ b/arch/arm/boot/dts/ox810se-wd-mbwe.dts
@@ -103,6 +103,10 @@ rtc0: rtc@48 {
 	};
 };
 
+&etha {
+	status = "okay";
+};
+
 &uart1 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
index 0755e5864c4a..96c0745f7b70 100644
--- a/arch/arm/boot/dts/ox810se.dtsi
+++ b/arch/arm/boot/dts/ox810se.dtsi
@@ -81,6 +81,24 @@ soc {
 		ranges;
 		interrupt-parent = <&intc>;
 
+		etha: ethernet@40400000 {
+			compatible = "oxsemi,ox810se-dwmac", "snps,dwmac";
+			reg = <0x40400000 0x2000>;
+			interrupts = <8>;
+			interrupt-names = "macirq";
+			mac-address = [000000000000]; /* Filled in by U-Boot */
+			phy-mode = "rgmii";
+
+			clocks = <&stdclk 6>, <&gmacclk>;
+			clock-names = "gmac", "stmmaceth";
+			resets = <&reset 6>;
+
+			/* Regmap for sys registers */
+			oxsemi,sys-ctrl = <&sys>;
+
+			status = "disabled";
+		};
+
 		apb-bridge@44000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#157): https://groups.io/g/linux-oxnas/message/157
Mute This Topic: https://groups.io/mt/88191074/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


