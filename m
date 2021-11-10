Return-Path: <bounce+16102+136+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BC45D63F
	for <lists+linux-oxnas@lfdr.de>; Thu, 25 Nov 2021 09:35:51 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id j2IdYY1809624xxFMr7lmEth; Thu, 25 Nov 2021 00:35:50 -0800
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.10948.1636546585283479792
 for <linux-oxnas@groups.io>;
 Wed, 10 Nov 2021 04:16:25 -0800
X-Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B97761247;
	Wed, 10 Nov 2021 12:16:20 +0000 (UTC)
Date: Wed, 10 Nov 2021 14:16:18 +0200
From: Abel Vesa <abelvesa@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [linux-oxnas] [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
Message-ID: <YYu4EglV7SBZU2Iy@ryzen>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
MIME-Version: 1.0
In-Reply-To: <20210929000735.585237-2-saravanak@google.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,abelvesa@kernel.org
X-Gm-Message-State: QWODzZt3Bh4ochbHFMSkFQPzx1808289AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1637829350;
 bh=oAGXX8ZRvX9uh8UvAZt9yYaeRK11gbsdRuT/nz0YYW4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=myBTPcpfooyMyPU0dzhyX2vlqk8H1IgIrO9qLaySqXsM/et/E5MLm9eXqmkfnWgN+jS
 xS6efBSb2OWvBKspFojQ+2ft6Q+hN8jA2R4tke/KSiFBCFYFkGmWmQZsJLTtQ0rokyPXi
 vb/G2ZYjvPvJzkF0394xITtZSQfKKd2JHZo=

On 21-09-28 17:07:33, Saravana Kannan wrote:
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
> 
> However, there are instances of devices that are not simple buses (they get
> probed by their specific drivers) that also list the "simple-bus" (or other
> bus only compatible strings) in their compatible property to automatically
> populate their child devices. We still want these devices to get probed by
> their specific drivers. So, we make sure this driver only probes devices
> that are only buses.
> 
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 01a3d0cd08ed..6b8d6257ed8a 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -13,11 +13,36 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
> -
>  static int simple_pm_bus_probe(struct platform_device *pdev)
>  {
> -	const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> -	struct device_node *np = pdev->dev.of_node;
> +	const struct device *dev = &pdev->dev;
> +	const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> +	struct device_node *np = dev->of_node;
> +	const struct of_device_id *match;
> +
> +	/*
> +	 * Allow user to use driver_override to bind this driver to a
> +	 * transparent bus device which has a different compatible string
> +	 * that's not listed in simple_pm_bus_of_match. We don't want to do any
> +	 * of the simple-pm-bus tasks for these devices, so return early.
> +	 */
> +	if (pdev->driver_override)
> +		return 0;
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	/*
> +	 * These are transparent bus devices (not simple-pm-bus matches) that
> +	 * have their child nodes populated automatically.  So, don't need to
> +	 * do anything more. We only match with the device if this driver is
> +	 * the most specific match because we don't want to incorrectly bind to
> +	 * a device that has a more specific driver.
> +	 */
> +	if (match && match->data) {
> +		if (of_property_match_string(np, "compatible", match->compatible) == 0)
> +			return 0;
> +		else
> +			return -ENODEV;
> +	}

This change is breaking the expected behavior for the already existent
simple-bus nodes. All the simple-bus compatibles should be replaced now
to simple-pm-bus. In my case, on some i.MX8 platforms, without the
devlink, the devices suspend sequence changes (and even breaks).

To avoid breaking the already existent simple-bus nodes, maybe the logic
should've been reversed: keep the simple-bus as is and add another
compatible, IDK, something like simple-trasnparent-bus, or something.

>  
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
>  
> @@ -31,14 +56,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>  
>  static int simple_pm_bus_remove(struct platform_device *pdev)
>  {
> +	const void *data = of_device_get_match_data(&pdev->dev);
> +
> +	if (pdev->driver_override || data)
> +		return 0;
> +
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
>  
>  	pm_runtime_disable(&pdev->dev);
>  	return 0;
>  }
>  
> +#define ONLY_BUS	((void *) 1) /* Match if the device is only a bus. */
> +
>  static const struct of_device_id simple_pm_bus_of_match[] = {
>  	{ .compatible = "simple-pm-bus", },
> +	{ .compatible = "simple-bus",	.data = ONLY_BUS },
> +	{ .compatible = "simple-mfd",	.data = ONLY_BUS },
> +	{ .compatible = "isa",		.data = ONLY_BUS },
> +	{ .compatible = "arm,amba-bus",	.data = ONLY_BUS },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> -- 
> 2.33.0.685.g46640cef36-goog
>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#136): https://groups.io/g/linux-oxnas/message/136
Mute This Topic: https://groups.io/mt/87298933/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


