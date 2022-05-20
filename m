Return-Path: <bounce+16102+169+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 5216A530C7B
	for <lists+linux-oxnas@lfdr.de>; Mon, 23 May 2022 12:03:16 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id sXlGYY1809624xizhoToQYzK; Mon, 23 May 2022 03:03:14 -0700
X-Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.9.1653058361166376940
 for <linux-oxnas@groups.io>;
 Fri, 20 May 2022 07:52:41 -0700
X-Received: by mail-lj1-f182.google.com with SMTP id g16so9958058lja.3
        for <linux-oxnas@groups.io>; Fri, 20 May 2022 07:52:40 -0700 (PDT)
X-Gm-Message-State: 3KfIm1AvSW8eYCawmJxml0Mux1808289AA=
X-Google-Smtp-Source: ABdhPJy5o1vgxnl59wae9iXl1D22FA2IlNVCbZH8udHF3OcZpjC7pAHcsx83XNC+TDl7q0Om5TtICQ==
X-Received: by 2002:a2e:b6cc:0:b0:253:c64f:ed23 with SMTP id m12-20020a2eb6cc000000b00253c64fed23mr5622442ljo.501.1653058359449;
        Fri, 20 May 2022 07:52:39 -0700 (PDT)
X-Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512075300b0047255d21114sm690355lfs.67.2022.05.20.07.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 07:52:38 -0700 (PDT)
Message-ID: <c173a336-1f57-0712-fce4-d6885e343d2f@linaro.org>
Date: Fri, 20 May 2022 16:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [linux-oxnas] [PATCH] clocksource/drivers/oxnas-rps: Fix irq_of_parse_and_map() return value
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io
References: <20220422104101.55754-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422104101.55754-1-krzysztof.kozlowski@linaro.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,krzysztof.kozlowski@linaro.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1653300194;
 bh=0T7oN88m1/oj+olkYVXUMDXi+qp2RoToQZCUC1M2aaE=;
 h=Content-Type:Date:From:Reply-To:Subject:To;
 b=tZ/Iaw+zFjTZz5V6NgNh5WQrYsFIkbtkSNGcrpe9neFlE0O7p+NWtvhVME7Z+lflDeu
 emRlG7+c7pVdiMXNUXbjx+dl8AmrZT6InlGvFfXe5JGx41QTRAgHW1ETPmvHij102Gy73
 2CkcHccDVAjmasWzBW+wfOnvPdbfEokEqbc=

On 22/04/2022 12:41, Krzysztof Kozlowski wrote:
> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>=20
> Fixes: 89355274e1f7 ("clocksource/drivers/oxnas-rps: Add Oxford Semicondu=
ctor RPS Dual Timer")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This was sent a month ago and it is a fix. It also received a review.
Any comments from maintainers? Is it going to be picked up?

Best regards,
Krzysztof


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#169): https://groups.io/g/linux-oxnas/message/169
Mute This Topic: https://groups.io/mt/91284784/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


