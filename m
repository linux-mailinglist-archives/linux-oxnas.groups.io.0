Return-Path: <bounce+16102+161+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6DB48DB86
	for <lists+linux-oxnas@lfdr.de>; Thu, 13 Jan 2022 17:18:01 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id QlVjYY1809624xR4XfqCRzS6; Thu, 13 Jan 2022 08:18:00 -0800
X-Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web09.17166.1641950451155687416
 for <linux-oxnas@groups.io>;
 Tue, 11 Jan 2022 17:20:51 -0800
X-Received: by mail-ot1-f48.google.com with SMTP id a12-20020a0568301dcc00b005919e149b4cso836312otj.8
        for <linux-oxnas@groups.io>; Tue, 11 Jan 2022 17:20:51 -0800 (PST)
X-Gm-Message-State: 02kORWZIqlMx0cwn7xVzDSASx1808289AA=
X-Google-Smtp-Source: ABdhPJwKVbRVa9Z+xJJQV2Zoqbju8GugslOnFTcRStaUzP01u262pTEw+JI9IsWNyzXghdTvpvlLiw==
X-Received: by 2002:a05:6830:25c1:: with SMTP id d1mr5202110otu.240.1641950450430;
        Tue, 11 Jan 2022 17:20:50 -0800 (PST)
X-Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p23sm2389801otf.37.2022.01.11.17.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 17:20:49 -0800 (PST)
X-Received: (nullmailer pid 3855120 invoked by uid 1000);
	Wed, 12 Jan 2022 01:20:48 -0000
Date: Tue, 11 Jan 2022 19:20:48 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, linux-oxnas@groups.io, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [linux-oxnas] [PATCH 1/4] dt-bindings: dma: Add bindings for ox810se dma engine
Message-ID: <Yd4s8OYf7QSryXzr@robh.at.kernel.org>
References: <20220104145206.135524-1-narmstrong@baylibre.com>
 <20220104145206.135524-2-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220104145206.135524-2-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1642090680;
 bh=xW40ystQZ4fUw2FwEkG89dKciwAo91z9H96fBCeS41Y=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=wrgJ1jxt/I4xIsoVyh5mUQCjugWW/WY0SeAmbvX7+GzXYH7BHw3gjLC17NPwA30PGSP
 yx6QGe5prvXSn7pfejMO0O1dWtkXHrklhWY+UZHZMLAyieaIjTH0sG2le9N78qW1b7IPg
 3JCjwO4sClDO3eeMizhSH8qlH869X4QCPqM=

On Tue, Jan 04, 2022 at 03:52:03PM +0100, Neil Armstrong wrote:
> This adds the YAML dt-bindings for the DMA engine found in the
> Oxford Semiconductor OX810SE SoC.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/dma/oxsemi,ox810se-dma.yaml      | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml b/Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml
> new file mode 100644
> index 000000000000..6efa28e8b124
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/oxsemi,ox810se-dma.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/oxsemi,ox810se-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Oxford Semiconductor DMA Controller Device Tree Bindings
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +allOf:
> +  - $ref: "dma-controller.yaml#"
> +
> +properties:
> +  "#dma-cells":
> +    const: 1
> +
> +  compatible:
> +    const: oxsemi,ox810se-dma
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dma
> +      - const: sgdma
> +
> +  interrupts:
> +    maxItems: 5

Need to define what each one is.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: dma
> +      - const: sgdma
> +
> +  dma-channels: true

Constraints on number of channels?

> +
> +  oxsemi,targets-types:
> +    description:
> +      Table with allowed memory ranges and memory type associated.
> +    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> +    minItems: 4
> +    items:
> +      items:
> +        - description:
> +            The first cell defines the memory range start address
> +        - description:
> +            The first cell defines the memory range end address
> +        - description:
> +            The third cell represents memory type, 0 for SATA,
> +            1 for DPE RX, 2 for DPE TX, 5 for AUDIO TX, 6 for AUDIO RX,
> +            15 for DRAM MEMORY.
> +          enum: [ 0, 1, 2, 5, 6, 15 ]
> +
> +required:
> +  - "#dma-cells"
> +  - dma-channels
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - reset-names
> +  - oxsemi,targets-types
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dma: dma-controller@600000 {

Drop unused labels.

> +        compatible = "oxsemi,ox810se-dma";
> +        reg = <0x600000 0x100000>, <0xc00000 0x100000>;
> +        reg-names = "dma", "sgdma";
> +        interrupts = <13>, <14>, <15>, <16>, <20>;
> +        clocks = <&stdclk 1>;
> +        resets = <&reset 8>, <&reset 24>;
> +        reset-names = "dma", "sgdma";
> +
> +        /* Encodes the authorized memory types */
> +        oxsemi,targets-types =
> +            <0x45900000 0x45a00000 0>,  /* SATA */
> +            <0x42000000 0x43000000 0>,  /* SATA DATA */
> +            <0x48000000 0x58000000 15>, /* DDR */
> +            <0x58000000 0x58020000 15>; /* SRAM */
> +
> +        #dma-cells = <1>;
> +        dma-channels = <5>;
> +    };
> +...
> -- 
> 2.25.1
> 
> 


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#161): https://groups.io/g/linux-oxnas/message/161
Mute This Topic: https://groups.io/mt/88190965/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


