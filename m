Return-Path: <bounce+16102+68+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73018BBA9
	for <lists+linux-oxnas@lfdr.de>; Thu, 19 Mar 2020 16:54:04 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id vNtHYY1809624xXUaMGX2azL; Thu, 19 Mar 2020 08:54:03 -0700
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.7814.1584607501045614589
 for <linux-oxnas@groups.io>;
 Thu, 19 Mar 2020 01:45:01 -0700
X-Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 48F9120724;
	Thu, 19 Mar 2020 08:45:00 +0000 (UTC)
X-Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <maz@kernel.org>)
	id 1jEqnS-00Dsyj-Cb; Thu, 19 Mar 2020 08:44:58 +0000
MIME-Version: 1.0
Date: Thu, 19 Mar 2020 08:44:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: Sungbo Eo <mans0n@gorani.run>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-oxnas@groups.io, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [linux-oxnas] [PATCH v2] irqchip/versatile-fpga: Handle chained IRQs properly
In-Reply-To: <20200319023448.1479701-1-mans0n@gorani.run>
References: <002b72cab9896fa5ac76a52e0cb503ff@kernel.org>
 <20200319023448.1479701-1-mans0n@gorani.run>
Message-ID: <f0a4acfaf5da72cbfc2670fcb5b71fc6@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mans0n@gorani.run, linus.walleij@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-oxnas@groups.io, narmstrong@baylibre.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,maz@kernel.org
X-Gm-Message-State: viAnv4AP6T4cTzawjJJHyNTcx1808289AA=
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584633243;
 bh=1hlB5LHs3ChHFZ2VqxfhxeVc7cPxfBpeJKeCOx0OCgQ=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=aOqPLQIGCuFIOsIHYRv/IdCAeB/d8yYUmlxLqQ05H7qgrgwooExYC4Oorz8/Y5fTxqg
 evUbCjZwDAZPsZ/zqfwJSi0+kGyvGA6mVW6HASmd4H4Y/R+bTONRLhABDBFuVYM24ATR9
 dD262S30SBQBYkQTw/1yety2SVZXdq01duQ=

On 2020-03-19 02:34, Sungbo Eo wrote:
> Enclose the chained handler with chained_irq_{enter,exit}(), so that 
> the
> muxed interrupts get properly acked.
> 
> This patch also fixes a reboot bug on OX820 SoC, where the jiffies 
> timer
> interrupt is never acked. The kernel waits a clock tick forever in
> calibrate_delay_converge(), which leads to a boot hang.
> 
> Fixes: c41b16f8c9d9 ("ARM: integrator/versatile: consolidate FPGA IRQ
> handling code")
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> ---
> v2: moved readl below chained_irq_enter()
>     added Fixes tag
> 
>  drivers/irqchip/irq-versatile-fpga.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Queued for 5.7.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#68): https://groups.io/g/linux-oxnas/message/68
Mute This Topic: https://groups.io/mt/72077983/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

