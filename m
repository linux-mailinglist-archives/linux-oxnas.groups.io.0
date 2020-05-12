Return-Path: <bounce+16102+84+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3031CF153
	for <lists+linux-oxnas@lfdr.de>; Tue, 12 May 2020 11:17:22 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id GKI8YY1809624xUNiCdLnH6R; Tue, 12 May 2020 02:17:21 -0700
X-Received: from huawei.com (huawei.com [45.249.212.191])
 by mx.groups.io with SMTP id smtpd.web11.7012.1589247513133952832
 for <linux-oxnas@groups.io>;
 Mon, 11 May 2020 18:38:33 -0700
X-Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 70508F53A8D7A8A81B81;
	Tue, 12 May 2020 09:38:28 +0800 (CST)
X-Received: from ubuntu.huawei.com (10.175.100.98) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 09:38:26 +0800
From: Ma Feng <mafeng.ma@huawei.com>
To: <narmstrong@baylibre.com>, <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-oxnas@groups.io>,
	<linux-kernel@vger.kernel.org>
Subject: [linux-oxnas] [PATCH] ARM: oxnas: make ox820_boot_secondary static
Date: Tue, 12 May 2020 09:46:13 +0800
Message-ID: <1589247973-29728-1-git-send-email-mafeng.ma@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.100.98]
X-CFilter-Loop: Reflected
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,mafeng.ma@huawei.com
X-Gm-Message-State: oFktL8wq16U0HFD2Lkym52YZx1808289AA=
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1589275041;
 bh=oA0LZGmzcjU/pQwF9TqAIX+7Rvpv1AMrFxhNf8RfHJY=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=hRWB3zscFd1yxZfIRJOjNdCNtsQKFXwZ8e01WBY68uPPStktRQhGMu87UpoAJFhP6k8
 QKr6OK+2DlbPPl1XV2SOwytB/7V9xQryu7fQvx861TB1YzkOOFt4BVqWM+vH/3kq7Tjnv
 VJpN9AxXR/LzVqLju0v6VGoQd69U1AyRL7k=

Fix sparse warning:

arch/arm/mach-oxnas/platsmp.c:30:12: warning: symbol 'ox820_boot_secondary' was
not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 arch/arm/mach-oxnas/platsmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-oxnas/platsmp.c b/arch/arm/mach-oxnas/platsmp.c
index ab35275..f0a50b9 100644
--- a/arch/arm/mach-oxnas/platsmp.c
+++ b/arch/arm/mach-oxnas/platsmp.c
@@ -27,7 +27,8 @@ static void __iomem *gic_cpu_ctrl;
 #define GIC_CPU_CTRL			0x00
 #define GIC_CPU_CTRL_ENABLE		1

-int __init ox820_boot_secondary(unsigned int cpu, struct task_struct *idle)
+static int __init ox820_boot_secondary(unsigned int cpu,
+		struct task_struct *idle)
 {
 	/*
 	 * Write the address of secondary startup into the
--
2.7.4


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#84): https://groups.io/g/linux-oxnas/message/84
Mute This Topic: https://groups.io/mt/74154564/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

