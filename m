Return-Path: <bounce+16102+159+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 271CB48D44C
	for <lists+linux-oxnas@lfdr.de>; Thu, 13 Jan 2022 10:12:42 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id nhF2YY1809624xiOzCb7NuCE; Thu, 13 Jan 2022 01:12:41 -0800
X-Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.6448.1642065158569506457
 for <linux-oxnas@groups.io>;
 Thu, 13 Jan 2022 01:12:39 -0800
X-Received: by mail-wm1-f49.google.com with SMTP id d18-20020a05600c251200b0034974323cfaso4989887wma.4
        for <linux-oxnas@groups.io>; Thu, 13 Jan 2022 01:12:37 -0800 (PST)
X-Gm-Message-State: vnALYwXjiwzVGmmHCu5TEEo3x1808289AA=
X-Google-Smtp-Source: ABdhPJwwuk0lJd2q9B0XQRjlxLNr4+VHWmnHeE+pxSHGCjPezBRiTpnT1tTjk942qIhQTg+waquDYw==
X-Received: by 2002:a05:600c:3d93:: with SMTP id bi19mr60037wmb.50.1642065156503;
        Thu, 13 Jan 2022 01:12:36 -0800 (PST)
X-Received: from localhost.localdomain ([2001:861:44c0:66c0:bece:ab45:7469:4195])
        by smtp.gmail.com with ESMTPSA id m15sm2135702wmq.6.2022.01.13.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 01:12:36 -0800 (PST)
From: "Neil Armstrong" <narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	kuba@kernel.org,
	davem@davemloft.net
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-oxnas@groups.io,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [linux-oxnas] [PATCH v2 0/3] ARM: ox810se: Add Ethernet support
Date: Thu, 13 Jan 2022 10:12:34 +0100
Message-Id: <164206502761.1011244.11952182860924885505.b4-ty@baylibre.com>
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
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1642065161;
 bh=F9Q3cFD1A1MSGPoyy4L6efqKxggq4AZpZNe5KLixhDk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=RiN2LRmKUC0RxkXLIxJG4519IbXHAGi0T4j40Ijl4ctI7u5Sc3t334sGe1Lvffn40j+
 27n6d4iDqj0qnGUGOFP+9b8KhQsRz5ZekKRZZVDlX+YXzPJyX45QxaP71hMCMG6EfVdab
 Zlehe1j9ahQlvNyA4YHHoWZQg8eO06YRWQA=

Hi,

On Tue, 4 Jan 2022 15:56:43 +0100, Neil Armstrong wrote:
> This adds support for the Synopsys DWMAC controller found in the
> OX820SE SoC, by using almost the same glue code as the OX820.
> 
> Patch 1 & 2 are for net branch, patch 3 will be queued to arm-soc.
> 
> Changes since v1:
> - correctly update value read from register
> - add proper tag on patch 3 for arm-soc tree
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/narmstrong/linux-oxnas.git (v5.18/dt)

[3/3] ARM: dts: ox810se: Add Ethernet support
      https://git.kernel.org/narmstrong/linux-oxnas/c/ae552c33f6edad1097dec7a5543314d35d413b3e

-- 
Neil


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#159): https://groups.io/g/linux-oxnas/message/159
Mute This Topic: https://groups.io/mt/88191071/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


