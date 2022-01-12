Return-Path: <bounce+16102+163+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id A528B48DB85
	for <lists+linux-oxnas@lfdr.de>; Thu, 13 Jan 2022 17:18:01 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id uRHOYY1809624xxoAKe4HyDr; Thu, 13 Jan 2022 08:18:00 -0800
X-Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mx.groups.io with SMTP id smtpd.web09.445.1642008995042086908
 for <linux-oxnas@groups.io>;
 Wed, 12 Jan 2022 09:36:35 -0800
X-Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD212B81EA5;
	Wed, 12 Jan 2022 17:36:32 +0000 (UTC)
X-Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209A0C36AEB;
	Wed, 12 Jan 2022 17:36:31 +0000 (UTC)
Date: Wed, 12 Jan 2022 09:36:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [linux-oxnas] [PATCH v2 0/3] ARM: ox810se: Add Ethernet support
Message-ID: <20220112093629.03ffcb65@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
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
X-Gm-Message-State: accZgNS8OUFHAhmkS66MBVqvx1808289AA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1642090680;
 bh=FkUS42oNkzBxnP0fZ1owQjrhL09ehfecFSaSAFQVfJE=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=LAT1UkYLWQ+4eVyMkf3W04VtF7p/+ZchcPefAfB9hD2qcBXZj5XDJnoBZDff2EQJpSb
 PVtsfnvzOLTYAxVXx+YjEN+C+nX4TTXMKHTjw0o8/1HQER/iPBzUId2G5deLoARa0Dyg6
 16vEgLMGMh5T1bjfghc1xvxSzh7kqMG2eGI=

On Tue,  4 Jan 2022 15:56:43 +0100 Neil Armstrong wrote:
> This adds support for the Synopsys DWMAC controller found in the
> OX820SE SoC, by using almost the same glue code as the OX820.

Alright, patches 1 and 2 are in net and on their way to 5.17. Thanks!


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#163): https://groups.io/g/linux-oxnas/message/163
Mute This Topic: https://groups.io/mt/88191071/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


