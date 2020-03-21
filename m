Return-Path: <bounce+16102+70+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E12E118E390
	for <lists+linux-oxnas@lfdr.de>; Sat, 21 Mar 2020 19:03:42 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id uYFnYY1809624xwkPYTsimSR; Sat, 21 Mar 2020 11:03:41 -0700
X-Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [91.198.250.253])
 by mx.groups.io with SMTP id smtpd.web10.8818.1584801587677418194
 for <linux-oxnas@groups.io>;
 Sat, 21 Mar 2020 07:39:48 -0700
X-Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-u-204.mailbox.org (Postfix) with ESMTPS id 48l3FY4BMnzQkJl;
	Sat, 21 Mar 2020 15:39:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
X-Received: from smtp2.mailbox.org ([80.241.60.241])
	by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id exzjPqbLDL-R; Sat, 21 Mar 2020 15:39:42 +0100 (CET)
From: Sungbo Eo <mans0n@gorani.run>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sungbo Eo <mans0n@gorani.run>
Subject: [linux-oxnas] [PATCH] ARM: dts: oxnas: Fix clear-mask property
Date: Sat, 21 Mar 2020 23:36:53 +0900
Message-Id: <20200321143653.2412823-1-mans0n@gorani.run>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,mans0n@gorani.run
X-Gm-Message-State: A2aVCmN1ZkkYoaUDcexUzcNhx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584813821;
 bh=xO+eJuS5/mxd0SCzMZrAbp0A9fnhlR1ImexQJv6zq0U=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=ER2E1EqaDSZzjJSG7qTMyqRCx3GpovDB70eij4jLFQ/QAVQj6QNfoqXDwGgaaiA01BK
 ON7gDZBvLy4v4KIW9UMg6MF+7INSrnN32xGdLjxdxTpwlV4jSnyFij47PB8hlsqy+S/l8
 z6bBtNjUQqKhltYiTnFK9K5zoqD/x972oCo=

Disable all rps-irq interrupts during driver initialization to prevent
an accidental interrupt on GIC.

Fixes: 84316f4ef141 ("ARM: boot: dts: Add Oxford Semiconductor OX810SE dt=
si")
Fixes: 38d4a53733f5 ("ARM: dts: Add support for OX820 and Pogoplug V3")
Signed-off-by: Sungbo Eo <mans0n@gorani.run>
---
 arch/arm/boot/dts/ox810se.dtsi | 4 ++--
 arch/arm/boot/dts/ox820.dtsi   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.d=
tsi
index 9f6c2b660ed3..0755e5864c4a 100644
--- a/arch/arm/boot/dts/ox810se.dtsi
+++ b/arch/arm/boot/dts/ox810se.dtsi
@@ -323,8 +323,8 @@ intc: interrupt-controller@0 {
 					interrupt-controller;
 					reg =3D <0 0x200>;
 					#interrupt-cells =3D <1>;
-					valid-mask =3D <0xFFFFFFFF>;
-					clear-mask =3D <0>;
+					valid-mask =3D <0xffffffff>;
+					clear-mask =3D <0xffffffff>;
 				};
=20
 				timer0: timer@200 {
diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
index c9b327732063..90846a7655b4 100644
--- a/arch/arm/boot/dts/ox820.dtsi
+++ b/arch/arm/boot/dts/ox820.dtsi
@@ -240,8 +240,8 @@ intc: interrupt-controller@0 {
 					reg =3D <0 0x200>;
 					interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 					#interrupt-cells =3D <1>;
-					valid-mask =3D <0xFFFFFFFF>;
-					clear-mask =3D <0>;
+					valid-mask =3D <0xffffffff>;
+					clear-mask =3D <0xffffffff>;
 				};
=20
 				timer0: timer@200 {
--=20
2.25.2


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#70): https://groups.io/g/linux-oxnas/message/70
Mute This Topic: https://groups.io/mt/72451154/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

