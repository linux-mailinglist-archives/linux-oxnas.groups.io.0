Return-Path: <bounce+16102+175+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9625400A7
	for <lists+linux-oxnas@lfdr.de>; Tue,  7 Jun 2022 16:03:31 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id jFepYY1809624xTLvegBYbC3; Tue, 07 Jun 2022 07:03:30 -0700
X-Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mx.groups.io with SMTP id smtpd.web09.7892.1654091949822932738
 for <linux-oxnas@groups.io>;
 Wed, 01 Jun 2022 06:59:10 -0700
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AE2FBCE1C2E;
	Wed,  1 Jun 2022 13:59:06 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418B9C3411F;
	Wed,  1 Jun 2022 13:59:05 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-oxnas@groups.io,
	devicetree@vger.kernel.org
Subject: [linux-oxnas] [PATCH AUTOSEL 5.4 02/20] ARM: dts: ox820: align interrupt controller node name with dtschema
Date: Wed,  1 Jun 2022 09:58:44 -0400
Message-Id: <20220601135902.2004823-2-sashal@kernel.org>
In-Reply-To: <20220601135902.2004823-1-sashal@kernel.org>
References: <20220601135902.2004823-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,sashal@kernel.org
X-Gm-Message-State: p41ufSY6SykWHW1nlPLrNLGEx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1654610610;
 bh=MElWSNORwBMuIQClbvI15S9vHl+BM4miYPfW/iMNmd4=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=lPWWvPZhMgo2hnWu1eOJ032zgmqQvDdoh1mDYKqHvlZGzH/7bOdsMLnP0AZqdDNZpEl
 tZAbvIPw/vDlbmpNFnQG6v46ILcEaapg+qyKxAAbDtRPZI7dSbEy4LZntwF4PSJjmgmnZ
 xFbRHfXg+IOaewymXirPX+6PflbBdubyP5k=

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit fbcd5ad7a419ad40644a0bb8b4152bc660172d8a ]

Fixes dtbs_check warnings like:

  gic@1000: $nodename:0: 'gic@1000' does not match '^interrupt-controller=
(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20220317115705.450427-1-krzysztof.kozlows=
ki@canonical.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/ox820.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
index 90846a7655b4..dde4364892bf 100644
--- a/arch/arm/boot/dts/ox820.dtsi
+++ b/arch/arm/boot/dts/ox820.dtsi
@@ -287,7 +287,7 @@ local-timer@600 {
 				clocks =3D <&armclk>;
 			};
=20
-			gic: gic@1000 {
+			gic: interrupt-controller@1000 {
 				compatible =3D "arm,arm11mp-gic";
 				interrupt-controller;
 				#interrupt-cells =3D <3>;
--=20
2.35.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#175): https://groups.io/g/linux-oxnas/message/175
Mute This Topic: https://groups.io/mt/91601151/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


