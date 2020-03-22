Return-Path: <bounce+16102+76+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA718F68B
	for <lists+linux-oxnas@lfdr.de>; Mon, 23 Mar 2020 15:07:39 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id pDrXYY1809624xEIe2aLDIMT; Mon, 23 Mar 2020 07:07:37 -0700
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.27488.1584877871880952753
 for <linux-oxnas@groups.io>;
 Sun, 22 Mar 2020 04:51:11 -0700
X-Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4178F20732;
	Sun, 22 Mar 2020 11:51:11 +0000 (UTC)
X-Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <maz@kernel.org>)
	id 1jFz8H-00Efyv-IX; Sun, 22 Mar 2020 11:51:09 +0000
MIME-Version: 1.0
Date: Sun, 22 Mar 2020 11:51:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sungbo Eo <mans0n@gorani.run>, linux-oxnas@groups.io, Thomas Gleixner
 <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Neil
 Armstrong <narmstrong@baylibre.com>, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Apply clear-mask earlier
In-Reply-To: <CACRpkdYvoVF_q1Re_v_sJCYVDOhte0NpdU91UtYB2SpHH60-jg@mail.gmail.com>
References: <20200321133842.2408823-1-mans0n@gorani.run>
 <CACRpkdYvoVF_q1Re_v_sJCYVDOhte0NpdU91UtYB2SpHH60-jg@mail.gmail.com>
Message-ID: <b333772bbc3037c47060cf1af1fff3e8@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, mans0n@gorani.run, linux-oxnas@groups.io, tglx@linutronix.de, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, narmstrong@baylibre.com, daniel@makrotopia.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,maz@kernel.org
X-Gm-Message-State: PXmPqVskv9uJ7TdEPXa94SiMx1808289AA=
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584972457;
 bh=42m33XNLU7AlC7zNxyOOtPoyLZZATRqjiBPQRP2QYI4=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=i/TtSmhOwEJ7QxKvsY8dmc6KgVrEbe8Nign8/wFJgHPFW5RiRBumk+spaQG8oivOK3Q
 NzSYu7dt46ZDg9VCP5V6h1zJKTwLaOyDq4vH55yT2gR3nttM5a/oyUo47ZtqyVSY46qOs
 A6jgRqeOU7+NcBjcWnC7Dy9ohAR5wLozorQ=

On 2020-03-22 11:45, Linus Walleij wrote:
> On Sat, Mar 21, 2020 at 2:40 PM Sungbo Eo <mans0n@gorani.run> wrote:
> 
>> Clear its own IRQs before the parent IRQ get enabled, so that the
>> remaining IRQs do not accidentally interrupt the parent IRQ 
>> controller.
>> 
>> This patch also fixes a reboot bug on OX820 SoC, where the remaining
>> rps-timer IRQ raises a GIC interrupt that is left pending. After that,
>> the rps-timer IRQ is cleared during driver initialization, and there's
>> no IRQ left in rps-irq when local_irq_enable() is called, which evokes
>> an error message "unexpected IRQ trap".
>> 
>> Fixes: bdd272cbb97a ("irqchip: versatile FPGA: support cascaded 
>> interrupts from DT")
>> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Cc: Daniel Golle <daniel@makrotopia.org>
> 
> Good catch!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Marc: Cc stable?

Sure, I'll add that.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#76): https://groups.io/g/linux-oxnas/message/76
Mute This Topic: https://groups.io/mt/72451155/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

