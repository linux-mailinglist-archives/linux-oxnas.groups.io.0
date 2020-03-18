Return-Path: <bounce+16102+66+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2918BBA6
	for <lists+linux-oxnas@lfdr.de>; Thu, 19 Mar 2020 16:54:04 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id NLB2YY1809624xoyJhQfP7xK; Thu, 19 Mar 2020 08:54:03 -0700
X-Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.2321.1584558668042429017
 for <linux-oxnas@groups.io>;
 Wed, 18 Mar 2020 12:11:08 -0700
X-Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6795320768;
	Wed, 18 Mar 2020 19:11:07 +0000 (UTC)
X-Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <maz@kernel.org>)
	id 1jEe5p-00Diha-NV; Wed, 18 Mar 2020 19:11:05 +0000
MIME-Version: 1.0
Date: Wed, 18 Mar 2020 19:11:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-oxnas@groups.io, Linus Walleij <linus.walleij@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil
 Armstrong <narmstrong@baylibre.com>
Subject: Re: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Handle chained IRQs properly
In-Reply-To: <bdb90bd8-ede1-63d5-816c-57f6bf0417a4@gorani.run>
References: <20200318170904.1461278-1-mans0n@gorani.run>
 <112cdab389aa9cc30189c7aec0baded2@kernel.org>
 <bdb90bd8-ede1-63d5-816c-57f6bf0417a4@gorani.run>
Message-ID: <002b72cab9896fa5ac76a52e0cb503ff@kernel.org>
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
X-Gm-Message-State: 5il8LugSA8y3qYWpTy3AFQMKx1808289AA=
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584633243;
 bh=LuibXgUHDXoAOktqbpsDq6kOVIIM9TT2ybRx688VKJU=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Q91ShSK1B72rw952KmWgZS36kusWyIDZ/joqaJurr9MJ6sWkTBrLUXuGbAhTiow3N9K
 VrNtq4EesIaxFP0ZdAql4mhHatgqP0URwSZyTWOm9DvkcIW5QKYbmDDT1U8+6NuZlEuPj
 UCxtyN1m2/Z31tJQk5DWBJdEKQ3UfRHqHMY=

On 2020-03-18 18:20, Sungbo Eo wrote:
> Hi Marc,
>=20
> On 2020-03-19 02:48, Marc Zyngier wrote:
>> Hi Sungbo,
>>=20
>> On 2020-03-18 17:09, Sungbo Eo wrote:
>>> Enclose the chained handler with chained_irq_{enter,exit}(), so that=
=20
>>> the
>>> muxed interrupts get properly acked.
>>>=20
>>> This patch also fixes a reboot bug on OX820 SoC, where the jiffies=20
>>> timer
>>> interrupt is never acked. The kernel waits a clock tick forever in
>>> calibrate_delay_converge(), which leads to a boot hang.
>>=20
>> Nice catch.
>>=20
>>>=20
>>> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>> =C2=A0drivers/irqchip/irq-versatile-fpga.c | 9 ++++++++-
>>> =C2=A01 file changed, 8 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/irqchip/irq-versatile-fpga.c
>>> b/drivers/irqchip/irq-versatile-fpga.c
>>> index 928858dada75..08faab2fec3e 100644
>>> --- a/drivers/irqchip/irq-versatile-fpga.c
>>> +++ b/drivers/irqchip/irq-versatile-fpga.c
>>> @@ -6,6 +6,7 @@
>>> =C2=A0#include <linux/irq.h>
>>> =C2=A0#include <linux/io.h>
>>> =C2=A0#include <linux/irqchip.h>
>>> +#include <linux/irqchip/chained_irq.h>
>>> =C2=A0#include <linux/irqchip/versatile-fpga.h>
>>> =C2=A0#include <linux/irqdomain.h>
>>> =C2=A0#include <linux/module.h>
>>> @@ -68,12 +69,15 @@ static void fpga_irq_unmask(struct irq_data *d)
>>>=20
>>> =C2=A0static void fpga_irq_handle(struct irq_desc *desc)
>>> =C2=A0{
>>> +=C2=A0=C2=A0=C2=A0 struct irq_chip *chip =3D irq_desc_get_chip(desc);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct fpga_irq_data *f =3D irq_desc_get_hand=
ler_data(desc);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 u32 status =3D readl(f->base + IRQ_STATUS);
>>>=20
>>> +=C2=A0=C2=A0=C2=A0 chained_irq_enter(chip, desc);
>>> +
>>=20
>> It's probably not a big deal, but I'm not fond of starting talking to
>> the muxing irqchip before having done the chained_irq_enter() call.
>>=20
>> Moving that read here would probably be safer.
>=20
> Oops, I missed it. Thanks for pointing it out.
>=20
>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0 if (status =3D=3D 0) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_bad_IRQ(desc);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0 do {
>>> @@ -82,6 +86,9 @@ static void fpga_irq_handle(struct irq_desc *desc)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status &=3D ~(1 << ir=
q);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic_handle_irq(ir=
q_find_mapping(f->domain, irq));
>>> =C2=A0=C2=A0=C2=A0=C2=A0 } while (status);
>>> +
>>> +out:
>>> +=C2=A0=C2=A0=C2=A0 chained_irq_exit(chip, desc);
>>> =C2=A0}
>>>=20
>>> =C2=A0/*
>>=20
>> Otherwise looks good. If you send it again with the above fixed
>> and a Fixes: tag, I'll queue it.
>=20
> It seems the handler had been broken from the very beginning. Could
> you give me a hint on how the tag should be like?

Indeed, it has been broken forever. I'm tempted to say:

Fixes: c41b16f8c9d9d ("ARM: integrator/versatile: consolidate FPGA IRQ=20
handling code")

even if it probably predates the introduction of the chained_irq_enter()=
=20
helpers.
This will ensure this gets backported to older kernels...

Thanks,

         M.
--=20
Jazz is not dead. It just smells funny...

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#66): https://groups.io/g/linux-oxnas/message/66
Mute This Topic: https://groups.io/mt/72055400/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfd=
r.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

