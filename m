Return-Path: <bounce+16102+119+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FA4053D5
	for <lists+linux-oxnas@lfdr.de>; Thu,  9 Sep 2021 15:22:58 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id BAsSYY1809624xdapnQmXf1F; Thu, 09 Sep 2021 06:22:56 -0700
X-Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
 by mx.groups.io with SMTP id smtpd.web08.5658.1630713947824271185
 for <linux-oxnas@groups.io>;
 Fri, 03 Sep 2021 17:05:48 -0700
X-Received: by mail-qk1-f202.google.com with SMTP id q13-20020a05620a038d00b003d38f784161so2301253qkm.8
        for <linux-oxnas@groups.io>; Fri, 03 Sep 2021 17:05:47 -0700 (PDT)
X-Gm-Message-State: UVwjHY76k6PqKZlmnRWJ06Oxx1808289AA=
X-Google-Smtp-Source: ABdhPJxOh60dMGR+lUVir1U4lfhdWRVMUcj5x6W1LTUnNO5wGwN2dFR8tfzyyVUJVXZoWiFU6/iKXpuDy2rgCWU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:ad4:4905:: with SMTP id
 bh5mr1667186qvb.63.1630713946609; Fri, 03 Sep 2021 17:05:46 -0700 (PDT)
Date: Fri,  3 Sep 2021 17:05:40 -0700
Message-Id: <20210904000543.2019010-1-saravanak@google.com>
Mime-Version: 1.0
Subject: [linux-oxnas] [PATCH v3 0/2] Fix simple-bus issues with fw_devlink
From: "Saravana Kannan via groups.io" <saravanak=google.com@groups.io>
To: Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
Cc: Saravana Kannan <saravanak@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,saravanak@google.com
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1631193776;
 bh=1JlUyKe1aWBizFXhAGK273oDczVomnnMdOGsmUkq4fE=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=r6Q3lGTJy5T5RpCq4gzmhbE6VGRXhj7HhdMTAEPYPBQRzJ9xOV/OwFMAXztw53v7z+V
 iQSyVKQNLS3P5UkqeG+ZXyXmXlpxhUoo8AeRkk4uQ8R4z6FfMWlDbTGq5epOMJ/JbsaYT
 o0z6M61zMMQJ2EvN5h+YIwlNDqyShE+uqUk=

Ulf reported an issue[1] with fw_devlink. This series tries to fix that
issue.

I replicated a similar set up on my end and I confirmed:
- A simple-bus only device is probed.
- Another device listing simple-bus as a 2nd compatible string isn't
  probed.

Ulf, mind testing this?

v1->v2:
- Switched to probing the simple-bus device instead of marking it as
  NEVER_PROBES.

v2->v3:
- Moved all the code into the simple-pm-bus driver
- Addressed Ulf's comment about the remove() code missing a check.

Thanks,
Saravana
[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>

Saravana Kannan (2):
  drivers: bus: simple-pm-bus: Add support for probing simple bus only
    devices
  drivers: bus: Delete CONFIG_SIMPLE_PM_BUS

 arch/arm/configs/multi_v7_defconfig |  1 -
 arch/arm/configs/oxnas_v6_defconfig |  1 -
 arch/arm/configs/shmobile_defconfig |  1 -
 arch/arm/mach-omap2/Kconfig         |  1 -
 arch/arm64/configs/defconfig        |  1 -
 drivers/bus/Kconfig                 | 12 -----------
 drivers/bus/Makefile                |  2 +-
 drivers/bus/simple-pm-bus.c         | 32 ++++++++++++++++++++++++++---
 drivers/soc/canaan/Kconfig          |  1 -
 9 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#119): https://groups.io/g/linux-oxnas/message/119
Mute This Topic: https://groups.io/mt/85483779/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


