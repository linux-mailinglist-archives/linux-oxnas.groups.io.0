Return-Path: <bounce+16102+120+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E594053D6
	for <lists+linux-oxnas@lfdr.de>; Thu,  9 Sep 2021 15:22:59 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 50poYY1809624x904bDTlKGH; Thu, 09 Sep 2021 06:22:58 -0700
X-Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.5665.1630713950304554432
 for <linux-oxnas@groups.io>;
 Fri, 03 Sep 2021 17:05:50 -0700
X-Received: by mail-yb1-f202.google.com with SMTP id r15-20020a056902154f00b00598b87f197cso939027ybu.13
        for <linux-oxnas@groups.io>; Fri, 03 Sep 2021 17:05:50 -0700 (PDT)
X-Gm-Message-State: q8S8erfYOCEB2lDLoq7l5yYPx1808289AA=
X-Google-Smtp-Source: ABdhPJxmH19nPmNYfApQCzFJa101DpD5Gzo0XYSrXU/wL13p/J/9TjYYqd+ffs7ankEM4mjnReGAXwID7O4vqfQ=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:a25:b9cf:: with SMTP id
 y15mr2035451ybj.110.1630713949404; Fri, 03 Sep 2021 17:05:49 -0700 (PDT)
Date: Fri,  3 Sep 2021 17:05:41 -0700
In-Reply-To: <20210904000543.2019010-1-saravanak@google.com>
Message-Id: <20210904000543.2019010-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
Subject: [linux-oxnas] [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
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
 q=dns/txt; s=20140610; t=1631193778;
 bh=kte6YJYRivRt308/mgH/4SeUkAN9T5m9z7p6HMthVB0=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Xwe1GcIHieCJwH9xflR3EtPX8zfw+VE0ESyjBiSvZK+VNSeL7AotH6hJLqKnL6SmXl9
 guI5P7UWal/OQUrHVO2SDDUj7tnpmTB7DdWor5zGuzsCwJ/LVvnA1zFLvVpVKrJNQyuN9
 Trzv50N44Atb938wALYFF65RBX2h1iw5WS0=

fw_devlink could end up creating device links for bus only devices.
However, bus only devices don't get probed and can block probe() or
sync_state() [1] call backs of other devices. To avoid this, probe these
devices using the simple-pm-bus driver.

However, there are instances of devices that are not simple buses (they
get probed by their specific drivers) that also list the "simple-bus"
(or other bus only compatible strings) in their compatible property to
automatically populate their child devices. We still want these devices
to get probed by their specific drivers. So, we make sure this driver
only probes devices that are only buses.

[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Saravana Kannan <saravanak@google.com>
---
 drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 01a3d0cd08ed..3e086a9f34cb 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -13,11 +13,26 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-
 static int simple_pm_bus_probe(struct platform_device *pdev)
 {
-	const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
-	struct device_node *np = pdev->dev.of_node;
+	const struct device *dev = &pdev->dev;
+	const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
+	struct device_node *np = dev->of_node;
+	const struct of_device_id *match;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+
+	/*
+	 * These are transparent bus devices (not simple-pm-bus matches) that
+	 * have their child nodes populated automatically.  So, don't need to
+	 * do anything more.
+	 */
+	if (match && match->data) {
+		if (of_property_match_string(np, "compatible", match->compatible) == 0)
+			return 0;
+		else
+			return -ENODEV;
+	}
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
@@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static int simple_pm_bus_remove(struct platform_device *pdev)
 {
+	const void *data = of_device_get_match_data(&pdev->dev);
+
+	if (data)
+		return 0;
+
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
+#define ONLY_BUS	((void *) 1) /* Match if the device is only a bus. */
+
 static const struct of_device_id simple_pm_bus_of_match[] = {
 	{ .compatible = "simple-pm-bus", },
+	{ .compatible = "simple-bus",	.data = ONLY_BUS },
+	{ .compatible = "simple-mfd",	.data = ONLY_BUS },
+	{ .compatible = "isa",		.data = ONLY_BUS },
+	{ .compatible = "arm,amba-bus",	.data = ONLY_BUS },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
-- 
2.33.0.153.gba50c8fa24-goog



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#120): https://groups.io/g/linux-oxnas/message/120
Mute This Topic: https://groups.io/mt/85483780/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


