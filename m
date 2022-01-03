Return-Path: <bounce+16102+143+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E08483674
	for <lists+linux-oxnas@lfdr.de>; Mon,  3 Jan 2022 18:56:46 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id tMIKYY1809624xp6qUNO7GZu; Mon, 03 Jan 2022 09:56:44 -0800
X-Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.32108.1641232602271203450
 for <linux-oxnas@groups.io>;
 Mon, 03 Jan 2022 09:56:42 -0800
X-Received: by mail-wm1-f50.google.com with SMTP id k66-20020a1ca145000000b00345fa984108so260730wme.2
        for <linux-oxnas@groups.io>; Mon, 03 Jan 2022 09:56:41 -0800 (PST)
X-Gm-Message-State: khnzLJ2opwP6G7ZCSf1WPrqux1808289AA=
X-Google-Smtp-Source: ABdhPJxLb2ZC1xXpCfFP6Tqr5DY5BlCu/MTHXlOBRaDiFcQM3Abd5EiKgwYAYFl7qmLi4DwRApdIRA==
X-Received: by 2002:a05:600c:acf:: with SMTP id c15mr37063822wmr.7.1641232600541;
        Mon, 03 Jan 2022 09:56:40 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
        by smtp.gmail.com with ESMTPSA id f13sm35763228wri.51.2022.01.03.09.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:56:40 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: davem@davemloft.net
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io,
	linux-kernel@vger.kernel.org
Subject: [linux-oxnas] [PATCH 0/3] ARM: ox810se: Add Ethernet support
Date: Mon,  3 Jan 2022 18:56:35 +0100
Message-Id: <20220103175638.89625-1-narmstrong@baylibre.com>
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
 bh=58xQEyHs3FwbUe9A9cG9K8MO3MdvJmbLZrhvxS8HwSc=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=mXkwrihh8+SKeC56dDbH5At1JaBkBEzh7B/V/reUbdUzOHoWSYWsgJ4nyVDU9MXvSbW
 qK9k7zf4I0Tlqw0qNSWBif+ZJeIPudXOorlfQQlxHem9uVJ7IDLWODcQVmLJ2p8CKWb8j
 meUrKW78U2eOY50zoLtQCC4JRIxQ50toTmA=

This adds support for the Synopsys DWMAC controller found in the
OX820SE SoC, by using almost the same glue code as the OX820.

Neil Armstrong (3):
  dt-bindings: net: oxnas-dwmac: Add bindings for OX810SE
  net: stmmac: dwmac-oxnas: Add support for OX810SE
  ARM: dts: ox810se: Add Ethernet support

 .../devicetree/bindings/net/oxnas-dwmac.txt   |  3 +
 arch/arm/boot/dts/ox810se-wd-mbwe.dts         |  4 +
 arch/arm/boot/dts/ox810se.dtsi                | 18 ++++
 .../net/ethernet/stmicro/stmmac/dwmac-oxnas.c | 92 ++++++++++++++-----
 4 files changed, 95 insertions(+), 22 deletions(-)

-- 
2.25.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#143): https://groups.io/g/linux-oxnas/message/143
Mute This Topic: https://groups.io/mt/88117936/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


