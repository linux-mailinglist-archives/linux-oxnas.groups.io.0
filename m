Return-Path: <bounce+16102+253+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 942196FCB08
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:18:05 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id SUHLYY1809624xKSJF3IA45u; Tue, 09 May 2023 09:18:04 -0700
X-Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
 by mx.groups.io with SMTP id smtpd.web10.123680.1683015327936190051
 for <linux-oxnas@groups.io>;
 Tue, 02 May 2023 01:15:28 -0700
X-Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 0A58D5803C3;
	Tue,  2 May 2023 04:15:27 -0400 (EDT)
X-Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 02 May 2023 04:15:27 -0400
X-ME-Sender: <xms:nsZQZGG99LYs7t6dhgAngkbsv9osgUeFMS5nCv0_eqkMW790xp5pVg>
    <xme:nsZQZHXku8NWvKl4XxdR48yR-0RVaLsU5fwZmJq18kazWD7vv8gAEIoPKVDAKkTuy
    5prPVni2U8mfnd5sN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedviecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfgjeev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nsZQZAK8fS_X5YYcPQ8tmCY5TK5FJ7gjlJsS0RCSCVoEK-Zwdrq3Yw>
    <xmx:nsZQZAFFLoJhNSVEvLGVyQfmt0zeZphfcdHG8-tw9pYY47GFwhKrNA>
    <xmx:nsZQZMUL4rbP96pvZI76ZCUHun2qRq8vNtMGMdc-nT5M5xb0isYJ2g>
    <xmx:n8ZQZPq1o7msWppgt2EUHhnFGcmwGcb09Ud671-g5_97NEtVzT49Eg>
Feedback-ID: i56a14606:Fastmail
X-Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1C690B60086; Tue,  2 May 2023 04:15:26 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
In-Reply-To: 
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Date: Tue, 02 May 2023 10:15:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>
Cc: "Christian Marangi" <ansuelsmth@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [linux-oxnas] [RFC PATCH 0/1] Categorize ARM dts directory
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,arnd@arndb.de
X-Gm-Message-State: 2yQz7VTiX1gEll3m1ySjNktfx1808289AA=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649084;
 bh=+XaLiu+zmswPPheeyhXvO1YFScFJ0c0xVEzE5Szt8oM=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=wYHOzNhmr9XNgBDAi9EoZ2rCTXz31vy0DKhkjU0/XNR73u3wGRFHgFVunm8IbRfVO6k
 Zch1kPmc5/vUN5Ua3YpJ0Pw47DSOwUBdMGNPKIyhT9+9X3crbWX3Q7BSHOhNDER8dWyW0
 LIOUhrhLfTJ6T8lKplPFvR6k4oRmH+xlJTs=

On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
> On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
>
>> Does your script also cater for .dts files not matching any pattern,
>> but including a .dtsi file that does match a pattern?
>
> I assume I built everything after moving, but maybe not...
>
> That's all just "details". First, we need agreement on a) moving
> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> been stuck on a) for being 'too much churn'.

Sorry for missing most of the discussion last week. The script sounds
fine to me, the only reason I didn't want to do this in the past is that
we had the plan to move platforms out of the kernel tree to an external
repository and I wanted to do this platform at a time and also only move
each one once. I don't think that is going to happen anytime soon now,
so let's just do your script.

Can you send me the script and/or a pull request of the resulting
tree based on my soc/dt branch? Everything is merged upstream,
and I think git-merge would handle the remaining merges with any
other changes in mainline.

        Arnd


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#253): https://groups.io/g/linux-oxnas/message/253
Mute This Topic: https://groups.io/mt/98658732/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


