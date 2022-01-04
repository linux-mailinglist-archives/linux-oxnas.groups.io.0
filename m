Return-Path: <bounce+16102+150+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E826F4843C3
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 15:52:19 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id CtRdYY1809624xfBgCMMUnZZ; Tue, 04 Jan 2022 06:52:18 -0800
X-Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.7490.1641307936946812838
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 06:52:17 -0800
X-Received: by mail-wr1-f46.google.com with SMTP id s1so76802404wrg.1
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 06:52:16 -0800 (PST)
X-Gm-Message-State: iiZBiaE8FeQR78IdXBdyXisMx1808289AA=
X-Google-Smtp-Source: ABdhPJx4kQyL0ttnXdIRNhjV07Tkq2L16wjwU04mseESZ3DUxnFYbJE4jpsJy4ziJ7JFVSZc8x8LOw==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr42885627wrn.288.1641307935035;
        Tue, 04 Jan 2022 06:52:15 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id s8sm44631911wra.9.2022.01.04.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:52:14 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: vkoul@kernel.org,
	devicetree@vger.kernel.org
Cc: linux-oxnas@groups.io,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH 1/4] dt-bindings: dma: Add bindings for ox810se dma engine
Date: Tue,  4 Jan 2022 15:52:03 +0100
Message-Id: <20220104145206.135524-2-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641307938;
 bh=C8thIv7bVX1ZC2ZHxd8fGD6BwOQ2ALEH4DLyluLAk7s=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=v30gbYooIG+jENdIbIh6vPq12lyFlM4Oe9hdQFbPFmMMKtzzJL82UcN7XJmVnT3OIEq
 Jrba9vdij8Ote+a4PJY2Bg0gLk03hR0N423PfgVt9P7v+vATZIBoYI4SZlD5vWrGlT5CS
 kTPPMzCZgzUc5VCVH5P6NdkXYPr2hd1ZVoA=

This adds the YAML dt-bindings for the DMA engine found in the
Oxford Semiconductor OX810SE SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/dma/oxsemi,ox810se-dma.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml

diff --git a/Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml b/Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml
new file mode 100644
index 000000000000..6efa28e8b124
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/oxsemi,ox810se-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Oxford Semiconductor DMA Controller Device Tree Bindings
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  "#dma-cells":
+    const: 1
+
+  compatible:
+    const: oxsemi,ox810se-dma
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dma
+      - const: sgdma
+
+  interrupts:
+    maxItems: 5
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: dma
+      - const: sgdma
+
+  dma-channels: true
+
+  oxsemi,targets-types:
+    description:
+      Table with allowed memory ranges and memory type associated.
+    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
+    minItems: 4
+    items:
+      items:
+        - description:
+            The first cell defines the memory range start address
+        - description:
+            The first cell defines the memory range end address
+        - description:
+            The third cell represents memory type, 0 for SATA,
+            1 for DPE RX, 2 for DPE TX, 5 for AUDIO TX, 6 for AUDIO RX,
+            15 for DRAM MEMORY.
+          enum: [ 0, 1, 2, 5, 6, 15 ]
+
+required:
+  - "#dma-cells"
+  - dma-channels
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - reset-names
+  - oxsemi,targets-types
+
+additionalProperties: false
+
+examples:
+  - |
+    dma: dma-controller@600000 {
+        compatible = "oxsemi,ox810se-dma";
+        reg = <0x600000 0x100000>, <0xc00000 0x100000>;
+        reg-names = "dma", "sgdma";
+        interrupts = <13>, <14>, <15>, <16>, <20>;
+        clocks = <&stdclk 1>;
+        resets = <&reset 8>, <&reset 24>;
+        reset-names = "dma", "sgdma";
+
+        /* Encodes the authorized memory types */
+        oxsemi,targets-types =
+            <0x45900000 0x45a00000 0>,  /* SATA */
+            <0x42000000 0x43000000 0>,  /* SATA DATA */
+            <0x48000000 0x58000000 15>, /* DDR */
+            <0x58000000 0x58020000 15>; /* SRAM */
+
+        #dma-cells = <1>;
+        dma-channels = <5>;
+    };
+...
-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#150): https://groups.io/g/linux-oxnas/message/150
Mute This Topic: https://groups.io/mt/88190965/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


