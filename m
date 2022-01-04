Return-Path: <bounce+16102+158+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B865487593
	for <lists+linux-oxnas@lfdr.de>; Fri,  7 Jan 2022 11:33:17 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id nu5jYY1809624xX9dGUUWANQ; Fri, 07 Jan 2022 02:33:15 -0800
X-Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web09.2358.1641269200687581927
 for <linux-oxnas@groups.io>;
 Mon, 03 Jan 2022 20:06:40 -0800
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7755D61074;
	Tue,  4 Jan 2022 04:06:39 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AECC36AE3;
	Tue,  4 Jan 2022 04:06:38 +0000 (UTC)
Date: Mon, 3 Jan 2022 20:06:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
 linux-kernel@vger.kernel.org
Subject: Re: [linux-oxnas] [PATCH 0/3] ARM: ox810se: Add Ethernet support
Message-ID: <20220103200637.0b9d7e4f@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
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
Reply-To: linux-oxnas@groups.io,kuba@kernel.org
X-Gm-Message-State: esY3wXZ4qZVgEdm2GKlR3g8bx1808289AA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1641551595;
 bh=tXCDEazjy1OjJdE/We3RYGA+QKs4GbQ408wAYIPIKBw=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Fr/7N4Jh6SIzLfztaqvQK7Gw0IqMxuQTExG9fYAKE95y1AG4YhY0RlkSvrROwxUdNMt
 6VbiQK/gygwdckdcEisPnXKRBVuEXEL+vjNgeLwoBKIexuc0VhOcRtT40mmYsg2AjNnzQ
 ZtO2+qWxedaRsbmHMpeEomNUOKp2vTBOFzs=

On Mon,  3 Jan 2022 18:56:35 +0100 Neil Armstrong wrote:
> This adds support for the Synopsys DWMAC controller found in the
> OX820SE SoC, by using almost the same glue code as the OX820.
>=20
> Neil Armstrong (3):
>   dt-bindings: net: oxnas-dwmac: Add bindings for OX810SE
>   net: stmmac: dwmac-oxnas: Add support for OX810SE
>   ARM: dts: ox810se: Add Ethernet support

Judging by the subject tag on patches 1 and 2 and To: I presume you
intend this series to be merged via net-next? Can you please repost
with patch 3 CCed to netdev as well? It didn't register in patchwork.


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#158): https://groups.io/g/linux-oxnas/message/158
Mute This Topic: https://groups.io/mt/88117936/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


