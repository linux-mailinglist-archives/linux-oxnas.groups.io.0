Return-Path: <bounce+16102+170+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2E530C7C
	for <lists+linux-oxnas@lfdr.de>; Mon, 23 May 2022 12:03:16 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id KsvdYY1809624xkggCe5Bb1h; Mon, 23 May 2022 03:03:14 -0700
X-Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.208.1653060256372288756
 for <linux-oxnas@groups.io>;
 Fri, 20 May 2022 08:24:16 -0700
X-Received: by mail-wm1-f43.google.com with SMTP id v191-20020a1cacc8000000b00397001398c0so6963969wme.5
        for <linux-oxnas@groups.io>; Fri, 20 May 2022 08:24:16 -0700 (PDT)
X-Gm-Message-State: LtpkQnRRacJIQb6oUg8PZe6fx1808289AA=
X-Google-Smtp-Source: ABdhPJxswYN+QYEvZ2RcoFkVNRNx+QLplVtRNFE3GwaNwQwisUDxZOB8JB6q7GIXYtltx8Gu4hDnUA==
X-Received: by 2002:a05:600c:3c8b:b0:397:2db3:97a8 with SMTP id bg11-20020a05600c3c8b00b003972db397a8mr7686344wmb.132.1653060254695;
        Fri, 20 May 2022 08:24:14 -0700 (PDT)
X-Received: from ?IPV6:2a01:e34:ed2f:f020:b8:a290:ff05:e4c4? ([2a01:e34:ed2f:f020:b8:a290:ff05:e4c4])
        by smtp.googlemail.com with ESMTPSA id ay28-20020a05600c1e1c00b003973c4bb19bsm1219838wmb.16.2022.05.20.08.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 08:24:13 -0700 (PDT)
Message-ID: <bda6fded-e925-6969-b6cb-f5f840460a90@linaro.org>
Date: Fri, 20 May 2022 17:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [linux-oxnas] [PATCH] clocksource/drivers/oxnas-rps: Fix irq_of_parse_and_map() return value
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io
References: <20220422104101.55754-1-krzysztof.kozlowski@linaro.org>
 <c173a336-1f57-0712-fce4-d6885e343d2f@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <c173a336-1f57-0712-fce4-d6885e343d2f@linaro.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,daniel.lezcano@linaro.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1653300194;
 bh=42VJZ9w/8ZHnu8pTniIx6uz9Gq79uNf51M3V9wzRcmY=;
 h=Content-Type:Date:From:Reply-To:Subject:To;
 b=BgmXxbW5bc42nJYwO7ejsYEzEM6eoPBBhsE23trmLWPQXnDufgNguqOYwwy8nfz6FaO
 iRoPIi+bLN2GEnOunm4RD0sEk6Ql/dadNLxs5mljXYodDkRp8dSO5J4DMZavpZ4BiW2Cs
 jk3QX9LJVk7aRJ26Dq01aUQxFiakucSYuDU=

On 20/05/2022 16:52, Krzysztof Kozlowski wrote:
> On 22/04/2022 12:41, Krzysztof Kozlowski wrote:
>> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>>
>> Fixes: 89355274e1f7 ("clocksource/drivers/oxnas-rps: Add Oxford Semiconductor RPS Dual Timer")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> This was sent a month ago and it is a fix. It also received a review.
> Any comments from maintainers? Is it going to be picked up?


Applied


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#170): https://groups.io/g/linux-oxnas/message/170
Mute This Topic: https://groups.io/mt/91284784/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


