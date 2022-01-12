Return-Path: <bounce+16102+162+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F248DB84
	for <lists+linux-oxnas@lfdr.de>; Thu, 13 Jan 2022 17:17:59 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id dSJHYY1809624xlw6herznTa; Thu, 13 Jan 2022 08:17:57 -0800
X-Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.17208.1641950601438380356
 for <linux-oxnas@groups.io>;
 Tue, 11 Jan 2022 17:23:21 -0800
X-Received: by mail-oi1-f172.google.com with SMTP id q186so1455169oih.8
        for <linux-oxnas@groups.io>; Tue, 11 Jan 2022 17:23:21 -0800 (PST)
X-Gm-Message-State: yYzfGZinpGhzXhf5WUvvkdvLx1808289AA=
X-Google-Smtp-Source: ABdhPJz3OGkvxE+9XqiM4meX43ZOgmHHNq1PF75N5oI15zV1jOqEICl/ICvu+8fgEYTPOB0FQ8HhxA==
X-Received: by 2002:aca:702:: with SMTP id 2mr3763222oih.44.1641950600806;
        Tue, 11 Jan 2022 17:23:20 -0800 (PST)
X-Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n21sm2270531oov.33.2022.01.11.17.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 17:23:19 -0800 (PST)
X-Received: (nullmailer pid 3858676 invoked by uid 1000);
	Wed, 12 Jan 2022 01:23:19 -0000
Date: Tue, 11 Jan 2022 19:23:19 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-oxnas@groups.io, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [linux-oxnas] [PATCH net-next v2 1/3] dt-bindings: net: oxnas-dwmac: Add bindings for OX810SE
Message-ID: <Yd4th9QfJO62KkQC@robh.at.kernel.org>
References: <20220104145646.135877-1-narmstrong@baylibre.com>
 <20220104145646.135877-2-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220104145646.135877-2-narmstrong@baylibre.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,robh@kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1642090677;
 bh=kqFQi6DsvcAUifrZ9WDjRXRzdcheA361mutyg6C+9hg=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=ahH8k82cqzmXJNhrJM2fbWUePDK3wUcs6t2/Date12mpWRVQLX1JH7gopuEiiJp04SU
 ywOsZCcLzZtN1spVsGAuv5sWoH/DD1mPfHfOlLQRbZHmPDS3EPWgQlPZZB42tm6pIrnxg
 eHmvc/nK9VCe0JA75UALzzBtYZ0iMWEH6bw=

On Tue, 04 Jan 2022 15:56:44 +0100, Neil Armstrong wrote:
> Add SoC specific bindings for OX810SE support.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/net/oxnas-dwmac.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#162): https://groups.io/g/linux-oxnas/message/162
Mute This Topic: https://groups.io/mt/88191072/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


