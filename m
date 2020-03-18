Return-Path: <bounce+16102+64+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701418A202
	for <lists+linux-oxnas@lfdr.de>; Wed, 18 Mar 2020 18:58:20 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id VuaFYY1809624xqCooetzjrr; Wed, 18 Mar 2020 10:58:19 -0700
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.265.1584553689294099754
 for <linux-oxnas@groups.io>;
 Wed, 18 Mar 2020 10:48:09 -0700
X-Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ACB6B20752;
	Wed, 18 Mar 2020 17:48:08 +0000 (UTC)
X-Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <maz@kernel.org>)
	id 1jEcnX-00Dhie-06; Wed, 18 Mar 2020 17:48:07 +0000
MIME-Version: 1.0
Date: Wed, 18 Mar 2020 17:48:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-oxnas@groups.io, Linus Walleij <linus.walleij@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil
 Armstrong <narmstrong@baylibre.com>
Subject: Re: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Handle chained IRQs properly
In-Reply-To: <20200318170904.1461278-1-mans0n@gorani.run>
References: <20200318170904.1461278-1-mans0n@gorani.run>
Message-ID: <112cdab389aa9cc30189c7aec0baded2@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mans0n@gorani.run, linux-oxnas@groups.io, linus.walleij@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, narmstrong@baylibre.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,maz@kernel.org
X-Gm-Message-State: OxJ1ai7hZhdx7ISf4zN2rFatx1808289AA=
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584554299;
 bh=cQk+e9pndOeEZOAChJbWQPvObnmDGF3ByZXmb2PyWbA=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=QLZHJ6YJKJU8zzjtW7U6GcFriPI+bNNQz13RIfSkpjLs4YJF4f6vbf++d0VH3ItyN1D
 XG3BKITAIsacphqR7bFSCDimKBlHcX3HMwX5yuL0+Nn3taKudV2ILcbpnJBSHLBQA3qtO
 jT9JW9OpY/sMBtlO9DFKWmZ6tiRGk/jO2zM=

Hi Sungbo,

On 2020-03-18 17:09, Sungbo Eo wrote:
> Enclose the chained handler with chained_irq_{enter,exit}(), so that 
> the
> muxed interrupts get properly acked.
> 
> This patch also fixes a reboot bug on OX820 SoC, where the jiffies 
> timer
> interrupt is never acked. The kernel waits a clock tick forever in
> calibrate_delay_converge(), which leads to a boot hang.

Nice catch.

> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/irqchip/irq-versatile-fpga.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-versatile-fpga.c
> b/drivers/irqchip/irq-versatile-fpga.c
> index 928858dada75..08faab2fec3e 100644
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
> @@ -68,12 +69,15 @@ static void fpga_irq_unmask(struct irq_data *d)
> 
>  static void fpga_irq_handle(struct irq_desc *desc)
>  {
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
>  	struct fpga_irq_data *f = irq_desc_get_handler_data(desc);
>  	u32 status = readl(f->base + IRQ_STATUS);
> 
> +	chained_irq_enter(chip, desc);
> +

It's probably not a big deal, but I'm not fond of starting talking to
the muxing irqchip before having done the chained_irq_enter() call.

Moving that read here would probably be safer.

>  	if (status == 0) {
>  		do_bad_IRQ(desc);
> -		return;
> +		goto out;
>  	}
> 
>  	do {
> @@ -82,6 +86,9 @@ static void fpga_irq_handle(struct irq_desc *desc)
>  		status &= ~(1 << irq);
>  		generic_handle_irq(irq_find_mapping(f->domain, irq));
>  	} while (status);
> +
> +out:
> +	chained_irq_exit(chip, desc);
>  }
> 
>  /*

Otherwise looks good. If you send it again with the above fixed
and a Fixes: tag, I'll queue it.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#64): https://groups.io/g/linux-oxnas/message/64
Mute This Topic: https://groups.io/mt/72055400/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

