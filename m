Return-Path: <bounce+16102+154+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5474843E6
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 15:56:54 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id CfDFYY1809624xQFiyDiQs8f; Tue, 04 Jan 2022 06:56:53 -0800
X-Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.7539.1641308212616924633
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 06:56:52 -0800
X-Received: by mail-wr1-f51.google.com with SMTP id s1so76828078wrg.1
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 06:56:52 -0800 (PST)
X-Gm-Message-State: 5Mz8l0tA7GXo4xdi2fgxq3Jbx1808289AA=
X-Google-Smtp-Source: ABdhPJzGZKFOs4DEcC/6CKGwfstjaCLEUD0B2urzy0Wb63F4ZVqkq++d9906q+a/ZlR7wvNjeeMIIA==
X-Received: by 2002:a5d:5889:: with SMTP id n9mr42818211wrf.476.1641308211178;
        Tue, 04 Jan 2022 06:56:51 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id k10sm19309859wrz.113.2022.01.04.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:56:50 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: netdev@vger.kernel.org,
	linux-oxnas@groups.io,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PATCH v2 0/3] ARM: ox810se: Add Ethernet support
Date: Tue,  4 Jan 2022 15:56:43 +0100
Message-Id: <20220104145646.135877-1-narmstrong@baylibre.com>
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
 q=dns/txt; s=20140610; t=1641308213;
 bh=bN0s4x2KL8pxDwnKEfJB6MfPyylN+FscMS2eOLipFBA=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=BoTJWW8a2SzeVVBLVSul8xtN4KGJ5PNgVMpJY1PoUgASGR6JjNDbwQ4cM+eUHCbyBID
 591XRGSUYdRq0iEJL6Vj/UPFcO6Uu4PiM563BEFgux5LymQsJ8nv+3qXf5QeXuIkCwgJO
 sMkQ6xBIeViSNBWCW9fuwRlZNrzN1BUVedM=

This adds support for the Synopsys DWMAC controller found in the
OX820SE SoC, by using almost the same glue code as the OX820.

Patch 1 & 2 are for net branch, patch 3 will be queued to arm-soc.

Changes since v1:
- correctly update value read from register
- add proper tag on patch 3 for arm-soc tree

Neil Armstrong (3):
  dt-bindings: net: oxnas-dwmac: Add bindings for OX810SE
  net: stmmac: dwmac-oxnas: Add support for OX810SE
  ARM: dts: ox810se: Add Ethernet support

 .../devicetree/bindings/net/oxnas-dwmac.txt   |   3 +
 arch/arm/boot/dts/ox810se-wd-mbwe.dts         |   4 +
 arch/arm/boot/dts/ox810se.dtsi                |  18 +++
 .../net/ethernet/stmicro/stmmac/dwmac-oxnas.c | 115 +++++++++++++-----
 4 files changed, 111 insertions(+), 29 deletions(-)

-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#154): https://groups.io/g/linux-oxnas/message/154
Mute This Topic: https://groups.io/mt/88191071/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


