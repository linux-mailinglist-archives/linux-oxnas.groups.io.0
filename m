Return-Path: <bounce+16102+69+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F518C35E
	for <lists+linux-oxnas@lfdr.de>; Thu, 19 Mar 2020 23:56:47 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id MrL8YY1809624xNzUUY6sKE5; Thu, 19 Mar 2020 15:56:46 -0700
X-Received: from fudo.makrotopia.org (fudo.makrotopia.org [185.142.180.71])
 by mx.groups.io with SMTP id smtpd.web10.1278.1584658605027936832
 for <linux-oxnas@groups.io>;
 Thu, 19 Mar 2020 15:56:45 -0700
X-Received: from local
	by fudo.makrotopia.org with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.92.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1jF45g-0001mq-OQ; Thu, 19 Mar 2020 23:56:41 +0100
Date: Thu, 19 Mar 2020 22:56:27 +0000
From: "Daniel Golle" <daniel@makrotopia.org>
To: linux-oxnas@groups.io, mans0n@gorani.run
Subject: Re: [linux-oxnas] [PATCH v2] irqchip/versatile-fpga: Handle chained IRQs properly
Message-ID: <20200319225627.GA1337@makrotopia.org>
References: <002b72cab9896fa5ac76a52e0cb503ff@kernel.org>
 <20200319023448.1479701-1-mans0n@gorani.run>
MIME-Version: 1.0
In-Reply-To: <20200319023448.1479701-1-mans0n@gorani.run>
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,daniel@makrotopia.org
X-Gm-Message-State: niqvPHJrq6XQezVOZ3snGFSTx1808289AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584658606;
 bh=OTx39nS9CijkzhHhcoRgMxnjqUy50tM86ltrA1gItGw=;
 h=Content-Type:Date:From:Reply-To:Subject:To;
 b=RZSOJcOzNZfBgwWErDFejhcY7jS5j0A5Py1uW3liBTLFbYogIy5OA5O7whwFtMR/w1S
 m25TmfL+ZoaLvQZ8kscTHgYP8FAxnOjKciQecLBv3vMzvT7HuXjmTt9msN6yK/Gfb9Ob4
 e6qIW+3FAxwVypgqAa8+258gSfs7GUtuHuo=

Hi Sungbo,

I've imported your patch to openwrt master and will backport for
Linux 4.14 to also have it in the 19.07 release branch.
Thanks for your efforts and congratulations to your first upstream fix!

Once the OpenWrt buildbot[1] gets to it, we'll have snapshot images[2]
including the fix.

[1]: http://buildbot.openwrt.org/master/images/builders/oxnas%2Fox820
[2]: http://downloads.openwrt.org/snapshots/targets/oxnas/ox820/

On Thu, Mar 19, 2020 at 11:34:48AM +0900, Sungbo Eo wrote:
> Enclose the chained handler with chained_irq_{enter,exit}(), so that the
> muxed interrupts get properly acked.
> 
> This patch also fixes a reboot bug on OX820 SoC, where the jiffies timer
> interrupt is never acked. The kernel waits a clock tick forever in
> calibrate_delay_converge(), which leads to a boot hang.
> 
> Fixes: c41b16f8c9d9 ("ARM: integrator/versatile: consolidate FPGA IRQ handling code")
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> ---
> v2: moved readl below chained_irq_enter()
>     added Fixes tag
> 
>  drivers/irqchip/irq-versatile-fpga.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
> index 928858dada75..70e2cfff8175 100644
> --- a/drivers/irqchip/irq-versatile-fpga.c
> +++ b/drivers/irqchip/irq-versatile-fpga.c
> @@ -6,6 +6,7 @@
>  #include <linux/irq.h>
>  #include <linux/io.h>
>  #include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
>  #include <linux/irqchip/versatile-fpga.h>
>  #include <linux/irqdomain.h>
>  #include <linux/module.h>
> @@ -68,12 +69,16 @@ static void fpga_irq_unmask(struct irq_data *d)
>  
>  static void fpga_irq_handle(struct irq_desc *desc)
>  {
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
>  	struct fpga_irq_data *f = irq_desc_get_handler_data(desc);
> -	u32 status = readl(f->base + IRQ_STATUS);
> +	u32 status;
> +
> +	chained_irq_enter(chip, desc);
>  
> +	status = readl(f->base + IRQ_STATUS);
>  	if (status == 0) {
>  		do_bad_IRQ(desc);
> -		return;
> +		goto out;
>  	}
>  
>  	do {
> @@ -82,6 +87,9 @@ static void fpga_irq_handle(struct irq_desc *desc)
>  		status &= ~(1 << irq);
>  		generic_handle_irq(irq_find_mapping(f->domain, irq));
>  	} while (status);
> +
> +out:
> +	chained_irq_exit(chip, desc);
>  }
>  
>  /*
> -- 
> 2.25.1
> 
> 
> 
> 

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#69): https://groups.io/g/linux-oxnas/message/69
Mute This Topic: https://groups.io/mt/72077983/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

