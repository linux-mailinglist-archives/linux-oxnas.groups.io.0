Return-Path: <bounce+16102+65+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A992518BBA7
	for <lists+linux-oxnas@lfdr.de>; Thu, 19 Mar 2020 16:54:04 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id vA1rYY1809624x4lAgZ4xzEq; Thu, 19 Mar 2020 08:54:03 -0700
X-Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [91.198.250.253])
 by mx.groups.io with SMTP id smtpd.web10.1080.1584555629038016155
 for <linux-oxnas@groups.io>;
 Wed, 18 Mar 2020 11:20:29 -0700
X-Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-u-204.mailbox.org (Postfix) with ESMTPS id 48jJHZ6lt0zQlG0;
	Wed, 18 Mar 2020 19:20:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
X-Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
	with ESMTP id U7p6m9PGs4Mx; Wed, 18 Mar 2020 19:20:24 +0100 (CET)
Subject: Re: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Handle chained IRQs properly
To: Marc Zyngier <maz@kernel.org>
Cc: linux-oxnas@groups.io, Linus Walleij <linus.walleij@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
References: <20200318170904.1461278-1-mans0n@gorani.run>
 <112cdab389aa9cc30189c7aec0baded2@kernel.org>
From: Sungbo Eo <mans0n@gorani.run>
Message-ID: <bdb90bd8-ede1-63d5-816c-57f6bf0417a4@gorani.run>
Date: Thu, 19 Mar 2020 03:20:13 +0900
MIME-Version: 1.0
In-Reply-To: <112cdab389aa9cc30189c7aec0baded2@kernel.org>
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,mans0n@gorani.run
X-Gm-Message-State: CEIfWsmYwXOSr9gWRomJUylXx1808289AA=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584633243;
 bh=kjB/ugCNLKRJ0+BZCZBK1nkxODTTL099MaeHDuN6d/A=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=bvWQWCMdLWZqN30orlgjkLDw6Ly9CPPV95xsj4u6oTg4wAG68EoCWxZH32n/luctTLs
 2gHXo3jgBb7zrbVXzs4ZtYTdjqM4x7CKIAwyetk/qmesR4UWxmbzwJQI8quX3JF1rhbG8
 Pq+SvnuhE1+kyrihF6EmZbwr9rHh1HGDQ9c=

Hi Marc,

On 2020-03-19 02:48, Marc Zyngier wrote:
> Hi Sungbo,
>=20
> On 2020-03-18 17:09, Sungbo Eo wrote:
>> Enclose the chained handler with chained_irq_{enter,exit}(), so that th=
e
>> muxed interrupts get properly acked.
>>
>> This patch also fixes a reboot bug on OX820 SoC, where the jiffies time=
r
>> interrupt is never acked. The kernel waits a clock tick forever in
>> calibrate_delay_converge(), which leads to a boot hang.
>=20
> Nice catch.
>=20
>>
>> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>> =C2=A0drivers/irqchip/irq-versatile-fpga.c | 9 ++++++++-
>> =C2=A01 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-versatile-fpga.c
>> b/drivers/irqchip/irq-versatile-fpga.c
>> index 928858dada75..08faab2fec3e 100644
>> --- a/drivers/irqchip/irq-versatile-fpga.c
>> +++ b/drivers/irqchip/irq-versatile-fpga.c
>> @@ -6,6 +6,7 @@
>> =C2=A0#include <linux/irq.h>
>> =C2=A0#include <linux/io.h>
>> =C2=A0#include <linux/irqchip.h>
>> +#include <linux/irqchip/chained_irq.h>
>> =C2=A0#include <linux/irqchip/versatile-fpga.h>
>> =C2=A0#include <linux/irqdomain.h>
>> =C2=A0#include <linux/module.h>
>> @@ -68,12 +69,15 @@ static void fpga_irq_unmask(struct irq_data *d)
>>
>> =C2=A0static void fpga_irq_handle(struct irq_desc *desc)
>> =C2=A0{
>> +=C2=A0=C2=A0=C2=A0 struct irq_chip *chip =3D irq_desc_get_chip(desc);
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct fpga_irq_data *f =3D irq_desc_get_handl=
er_data(desc);
>> =C2=A0=C2=A0=C2=A0=C2=A0 u32 status =3D readl(f->base + IRQ_STATUS);
>>
>> +=C2=A0=C2=A0=C2=A0 chained_irq_enter(chip, desc);
>> +
>=20
> It's probably not a big deal, but I'm not fond of starting talking to
> the muxing irqchip before having done the chained_irq_enter() call.
>=20
> Moving that read here would probably be safer.

Oops, I missed it. Thanks for pointing it out.

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (status =3D=3D 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_bad_IRQ(desc);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 do {
>> @@ -82,6 +86,9 @@ static void fpga_irq_handle(struct irq_desc *desc)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status &=3D ~(1 << irq=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic_handle_irq(irq=
_find_mapping(f->domain, irq));
>> =C2=A0=C2=A0=C2=A0=C2=A0 } while (status);
>> +
>> +out:
>> +=C2=A0=C2=A0=C2=A0 chained_irq_exit(chip, desc);
>> =C2=A0}
>>
>> =C2=A0/*
>=20
> Otherwise looks good. If you send it again with the above fixed
> and a Fixes: tag, I'll queue it.

It seems the handler had been broken from the very beginning. Could you=20
give me a hint on how the tag should be like?

Thanks.

>=20
> Thanks,
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M.

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#65): https://groups.io/g/linux-oxnas/message/65
Mute This Topic: https://groups.io/mt/72055400/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfd=
r.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

