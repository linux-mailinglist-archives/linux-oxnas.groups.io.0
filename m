Return-Path: <bounce+16102+160+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F748DB83
	for <lists+linux-oxnas@lfdr.de>; Thu, 13 Jan 2022 17:17:59 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id XNJfYY1809624xKIAbRf48Kc; Thu, 13 Jan 2022 08:17:57 -0800
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web10.1944.1641612132261977607
 for <linux-oxnas@groups.io>;
 Fri, 07 Jan 2022 19:22:12 -0800
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 38367B827E5;
	Sat,  8 Jan 2022 03:22:04 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59DAC36AE0;
	Sat,  8 Jan 2022 03:22:02 +0000 (UTC)
Date: Fri, 7 Jan 2022 19:22:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [linux-oxnas] [PATCH v2 0/3] ARM: ox810se: Add Ethernet support
Message-ID: <20220107192201.56136f10@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
Reply-To: linux-oxnas@groups.io,kuba@kernel.org
X-Gm-Message-State: 9Y7yn9cCwAZibHfsE4jdR2rMx1808289AA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1642090677;
 bh=G/AM1QavSOWBbDLX3AfzuSzisTJk+nMaeK5UQT1f4lQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=lh+l92Yqxrui3y8+OS58nJdVVmHZH3xlu+5HUMW4W5Zv8xgG48sy8EoR5lzzaVShjrc
 r4pNuWQnjTZ8d1WbznsPBW4pRLrsdPr5KX9Kzq16WyoMdm/CzFABbE8ul5bUOv/8FiMV8
 BM/WeDTxTVtDWilYo9ILjn1qfo1EQAdWkkg=

On Tue,  4 Jan 2022 15:56:43 +0100 Neil Armstrong wrote:
> This adds support for the Synopsys DWMAC controller found in the
> OX820SE SoC, by using almost the same glue code as the OX820.
>=20
> Patch 1 & 2 are for net branch, patch 3 will be queued to arm-soc.
>=20
> Changes since v1:
> - correctly update value read from register
> - add proper tag on patch 3 for arm-soc tree

Waiting for Rob's ack, I just noticed you haven't CCed him directly.
Adding his address now, but not sure if that's enough...


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#160): https://groups.io/g/linux-oxnas/message/160
Mute This Topic: https://groups.io/mt/88191071/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


