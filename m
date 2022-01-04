Return-Path: <bounce+16102+147+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id C6767483DDF
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 09:12:07 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id fs9lYY1809624xA3hAVPfVCf; Tue, 04 Jan 2022 00:12:06 -0800
X-Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.4169.1641283925048197553
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 00:12:05 -0800
X-Received: by mail-wr1-f52.google.com with SMTP id d9so74559457wrb.0
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 00:12:04 -0800 (PST)
X-Gm-Message-State: 1lQuAaaQNCrnQCaNYcMYWyDsx1808289AA=
X-Google-Smtp-Source: ABdhPJxngzms95ImKdpuvaRPcAr7DbG1IH2gK3IFD3//AZsi/g458BwAO4hwAJC5ygGk+OCzXSJeYw==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id f10mr42207306wry.248.1641283923156;
        Tue, 04 Jan 2022 00:12:03 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id j3sm36608295wrt.14.2022.01.04.00.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 00:12:02 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: linux-oxnas@groups.io
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH 3/3] ARM: dts: ox810se: Add Ethernet support
Date: Tue,  4 Jan 2022 09:11:55 +0100
Message-Id: <20220104081155.91120-1-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641283926;
 bh=Y2Cb+ZgBe0yiFRs5Nxx1dZnWm3ksZAZzV0JuydxMyAQ=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=n5AJX5mO/4mByXZEhmjTgI4PvImVOArljLN42xkY+of4307GrYNzl0LGLJiSInZJ3Ny
 foLDHnx1I3AO+z2dHQQkDVMyux8SDdibE1r0uky8/VBKPGcpm6DeKaay61ul4TIBui4fp
 vcgvOYlGn50V5xaU8fDvUjgM7Ay17ttNqJ8=

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
View/Reply Online (#147): https://groups.io/g/linux-oxnas/message/147
Mute This Topic: https://groups.io/mt/88186529/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


