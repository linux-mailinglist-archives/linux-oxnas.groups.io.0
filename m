Return-Path: <bounce+16102+86+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F693309BD
	for <lists+linux-oxnas@lfdr.de>; Mon,  8 Mar 2021 09:51:42 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id oJvzYY1809624xvFeUioqUHg; Mon, 08 Mar 2021 00:51:40 -0800
X-Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.757.1614873843387181126
 for <linux-oxnas@groups.io>;
 Thu, 04 Mar 2021 08:04:04 -0800
X-Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lHqSG-0006UW-Ao; Thu, 04 Mar 2021 17:04:00 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	linux-oxnas@groups.io
Subject: [linux-oxnas] [PATCH] reset: oxnas: replace file name with short description
Date: Thu,  4 Mar 2021 17:03:58 +0100
Message-Id: <20210304160358.21030-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-oxnas@groups.io
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,p.zabel@pengutronix.de
X-Gm-Message-State: kNXbvqSTOgALIwhHNK6N1yhyx1808289AA=
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1615193500;
 bh=rFF6eLKwRMpQ1irHILKxOcx90c/rGH4/NVoCygAxdDg=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=MSMf5tj87ci0+AdVwI20rGMVMntbyk+iN7ckf74nsqbY8yXerKPBGhuST4QlA/ZTN4H
 /Fz6Y/cF2n6ZM09msU4GREVhW6/d+OqrY9JNtM24fbhRB8Bx2TgVhUO2QvA8b3ch8uyjV
 kDm1iISwCaPwHUnOIfNDZA7/nYU2Ko2MjbU=

Fixes a checkpatch warning:

  WARNING: It's generally not useful to have the filename in the file
  #3: FILE: drivers/reset/reset-oxnas.c:3:
  + * drivers/reset/reset-oxnas.c

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-oxnas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-oxnas.c b/drivers/reset/reset-oxnas.c
index c4013165bdda..8209f922dc16 100644
--- a/drivers/reset/reset-oxnas.c
+++ b/drivers/reset/reset-oxnas.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/reset/reset-oxnas.c
+ * Oxford Semiconductor Reset Controller driver
  *
  * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
  * Copyright (C) 2014 Ma Haijun <mahaijuns@gmail.com>
-- 
2.29.2



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#86): https://groups.io/g/linux-oxnas/message/86
Mute This Topic: https://groups.io/mt/81169636/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


