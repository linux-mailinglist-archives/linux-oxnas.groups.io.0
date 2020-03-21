Return-Path: <bounce+16102+72+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A6518E391
	for <lists+linux-oxnas@lfdr.de>; Sat, 21 Mar 2020 19:03:42 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id bJRvYY1809624xBNj90bGdI8; Sat, 21 Mar 2020 11:03:41 -0700
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.8166.1584799504197914387
 for <linux-oxnas@groups.io>;
 Sat, 21 Mar 2020 07:05:04 -0700
X-Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 916B320757;
	Sat, 21 Mar 2020 14:05:03 +0000 (UTC)
X-Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <maz@kernel.org>)
	id 1jFekH-00EVV7-Sn; Sat, 21 Mar 2020 14:05:02 +0000
MIME-Version: 1.0
Date: Sat, 21 Mar 2020 14:05:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-oxnas@groups.io, Linus Walleij <linus.walleij@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil
 Armstrong <narmstrong@baylibre.com>, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Apply clear-mask earlier
In-Reply-To: <20200321133842.2408823-1-mans0n@gorani.run>
References: <20200321133842.2408823-1-mans0n@gorani.run>
Message-ID: <4c8b67a7912b2863db99ff4e765fdb8b@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mans0n@gorani.run, linux-oxnas@groups.io, linus.walleij@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, narmstrong@baylibre.com, daniel@makrotopia.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,maz@kernel.org
X-Gm-Message-State: WMwKL59L6rHxioBaBBP6aBvex1808289AA=
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584813821;
 bh=9CWMa1GJK+2ZfOXfV1Lu5uMF0MznXb4BtJ1UCQrk1Jc=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=XelDUB16R9p8vxFjdtgLCUrToYAV1B3MO3jsp2J4U5d8+BeBir6Xzt3wANDnpkSp6f3
 oKPxbMzqGkVd1vXcrEoSwgZH8reC9oKrxq1slUnQpKCfCqgzC7jgjW63tZqIC6KRWepVw
 qMeHCX5QaEji5GnBavv4Gva6i9ypjp6ytEc=

On 2020-03-21 13:38, Sungbo Eo wrote:
> Clear its own IRQs before the parent IRQ get enabled, so that the
> remaining IRQs do not accidentally interrupt the parent IRQ controller.
> 
> This patch also fixes a reboot bug on OX820 SoC, where the remaining
> rps-timer IRQ raises a GIC interrupt that is left pending. After that,
> the rps-timer IRQ is cleared during driver initialization, and there's
> no IRQ left in rps-irq when local_irq_enable() is called, which evokes
> an error message "unexpected IRQ trap".
> 
> Fixes: bdd272cbb97a ("irqchip: versatile FPGA: support cascaded
> interrupts from DT")
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/irqchip/irq-versatile-fpga.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-versatile-fpga.c
> b/drivers/irqchip/irq-versatile-fpga.c
> index 70e2cfff8175..f1386733d3bc 100644
> --- a/drivers/irqchip/irq-versatile-fpga.c
> +++ b/drivers/irqchip/irq-versatile-fpga.c
> @@ -212,6 +212,9 @@ int __init fpga_irq_of_init(struct device_node 
> *node,
>  	if (of_property_read_u32(node, "valid-mask", &valid_mask))
>  		valid_mask = 0;
> 
> +	writel(clear_mask, base + IRQ_ENABLE_CLEAR);
> +	writel(clear_mask, base + FIQ_ENABLE_CLEAR);
> +
>  	/* Some chips are cascaded from a parent IRQ */
>  	parent_irq = irq_of_parse_and_map(node, 0);
>  	if (!parent_irq) {
> @@ -221,9 +224,6 @@ int __init fpga_irq_of_init(struct device_node 
> *node,
> 
>  	fpga_irq_init(base, node->name, 0, parent_irq, valid_mask, node);
> 
> -	writel(clear_mask, base + IRQ_ENABLE_CLEAR);
> -	writel(clear_mask, base + FIQ_ENABLE_CLEAR);
> -
>  	/*
>  	 * On Versatile AB/PB, some secondary interrupts have a direct
>  	 * pass-thru to the primary controller for IRQs 20 and 22-31 which 
> need

You're on a roll! ;-) Queued for 5.7.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#72): https://groups.io/g/linux-oxnas/message/72
Mute This Topic: https://groups.io/mt/72451155/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

