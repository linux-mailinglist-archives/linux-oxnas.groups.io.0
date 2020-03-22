Return-Path: <bounce+16102+75+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56018F68A
	for <lists+linux-oxnas@lfdr.de>; Mon, 23 Mar 2020 15:07:39 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id BKaQYY1809624xwnIyecASyx; Mon, 23 Mar 2020 07:07:37 -0700
X-Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.27344.1584877541921086988
 for <linux-oxnas@groups.io>;
 Sun, 22 Mar 2020 04:45:42 -0700
X-Received: by mail-lj1-f196.google.com with SMTP id w4so11340580lji.11
        for <linux-oxnas@groups.io>; Sun, 22 Mar 2020 04:45:41 -0700 (PDT)
X-Gm-Message-State: kvca71YjHZgPodvwGp9GtdBhx1808289AA=
X-Google-Smtp-Source: ADFU+vtz8JnRQjucKNvAZ8vvh9L8MfwrXSOVPk5erRyANVzjEGlUnxBNNGaucWacBWN8eUzf6lDDsJ8zv+51Z7tWzlw=
X-Received: by 2002:a2e:8ecf:: with SMTP id e15mr11158856ljl.223.1584877540117;
 Sun, 22 Mar 2020 04:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200321133842.2408823-1-mans0n@gorani.run>
In-Reply-To: <20200321133842.2408823-1-mans0n@gorani.run>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Mar 2020 12:45:29 +0100
Message-ID: <CACRpkdYvoVF_q1Re_v_sJCYVDOhte0NpdU91UtYB2SpHH60-jg@mail.gmail.com>
Subject: Re: [linux-oxnas] [PATCH] irqchip/versatile-fpga: Apply clear-mask earlier
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-oxnas@groups.io, Thomas Gleixner <tglx@linutronix.de>, 
	Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
	Daniel Golle <daniel@makrotopia.org>
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1584972457;
 bh=fy+AQ5GCvxQOqLylifmbOV4RMbsa36zaQp27vqCWVGU=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=Mf59M11N5p7NcZ2yin+sf6ZiaBFeSr4n/vnB8v6YQb1v1VgPYuqtBvLKo0lQ/7Pdt/M
 oU5KKdtjD8i5Wclih7TmhXQw7EN3OKGHAI/HErclfu7Zp+uyk2cIAGR3a64hk/okKtU7+
 ouSlZBn6vtY/gGPYaR58OCsGszvDy9lh0Dg=

On Sat, Mar 21, 2020 at 2:40 PM Sungbo Eo <mans0n@gorani.run> wrote:

> Clear its own IRQs before the parent IRQ get enabled, so that the
> remaining IRQs do not accidentally interrupt the parent IRQ controller.
>
> This patch also fixes a reboot bug on OX820 SoC, where the remaining
> rps-timer IRQ raises a GIC interrupt that is left pending. After that,
> the rps-timer IRQ is cleared during driver initialization, and there's
> no IRQ left in rps-irq when local_irq_enable() is called, which evokes
> an error message "unexpected IRQ trap".
>
> Fixes: bdd272cbb97a ("irqchip: versatile FPGA: support cascaded interrupts from DT")
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Daniel Golle <daniel@makrotopia.org>

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Marc: Cc stable?

Yours,
Linus Walleij

-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#75): https://groups.io/g/linux-oxnas/message/75
Mute This Topic: https://groups.io/mt/72451155/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-

