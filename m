Return-Path: <bounce+16102+320+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783C77B430
	for <lists+linux-oxnas@lfdr.de>; Mon, 14 Aug 2023 10:32:38 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=Ml2JzaS7ZhVWBAaj4lLEdaZaiSY8fBKTc/baD4AtUXI=;
 c=relaxed/simple; d=groups.io;
 h=Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:Reply-To:Organization:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Language:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1692001956; v=1;
 b=LtzvBqmAd8pvzZB/HnOxwuW8ev82moDAxfWm6kssWRM2HhVvUzw4JyFo5HMOsbGvCbUbz5M/
 NtLcvJkjjuMBx2jmlNxuWpRyFME4FA8kB62GsfvkBXLnn+UiTfNIcsunzEoRIMUlS5OTQVYc0YV
 /jcS/4BojRlk57hV5uGjEFs0=
X-Received: by 127.0.0.2 with SMTP id DHSAYY1809624xLXgqbLzWl0; Mon, 14 Aug 2023 01:32:36 -0700
X-Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.103111.1692001955990361521
 for <linux-oxnas@groups.io>;
 Mon, 14 Aug 2023 01:32:36 -0700
X-Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3197808bb08so505551f8f.2
        for <linux-oxnas@groups.io>; Mon, 14 Aug 2023 01:32:35 -0700 (PDT)
X-Gm-Message-State: 4KVP71TMjLzQwWLnocay8ujbx1808289AA=
X-Google-Smtp-Source: AGHT+IFpw2UevV0b66D8HHVQNNr1pcT09ia8HTpKoynucTBVV5Nx3qd0Lh17y+eOCUKa/X7KaevLbQ==
X-Received: by 2002:adf:e288:0:b0:319:6288:e4dd with SMTP id v8-20020adfe288000000b003196288e4ddmr4689591wri.71.1692001954294;
        Mon, 14 Aug 2023 01:32:34 -0700 (PDT)
X-Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id i5-20020adff305000000b0031980294e9fsm16538wro.116.2023.08.14.01.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:32:33 -0700 (PDT)
Message-ID: <3f91bb89-bf7b-d967-a302-2a8e1b0c3b01@linaro.org>
Date: Mon, 14 Aug 2023 10:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Subject: [linux-oxnas] [PULL] final oxnas removal for 6.6
To: soc@kernel.org, arm@kernel.org
Cc: linux-oxnas@groups.io, linux-arm-kernel@lists.infradead.org
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Organization: Linaro Developer Services
Precedence: Bulk
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/plugh>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull this PR to remove all the remaining files for OXNAS support.

The other patches have been merged by the respective maintainers, Mark acke=
d
for routing the irq-versatile changes via a SoC PR.

Thanks,
Neil

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5=
:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/narmstrong/linux-oxnas.g=
it tags/oxnas-final-for-6.6

for you to fetch changes up to b1627ad5f457c8cea08bb2ab6b24d1c0381fbe30:

   MAINTAINERS: remove OXNAS entry (2023-08-14 10:26:56 +0200)

----------------------------------------------------------------
Final OXNAS removal PR for v6.6:
- Remove irq-versatile-fpga compatible entry
- Mark irq-versatile-fpga oxnas compatible as deprecated
- Remove OXNAS maintainers entry

----------------------------------------------------------------
Neil Armstrong (3):
       irqchip: irq-versatile-fpga: remove obsolete oxnas compatible
       dt-bindings: interrupt-controller: arm,versatile-fpga-irq: mark oxna=
s compatible as deprecated
       MAINTAINERS: remove OXNAS entry

  .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt   |  4 +++-
  MAINTAINERS                                                    | 10 -----=
-----
  drivers/irqchip/irq-versatile-fpga.c                           |  1 -
  3 files changed, 3 insertions(+), 12 deletions(-)


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#320): https://groups.io/g/linux-oxnas/message/320
Mute This Topic: https://groups.io/mt/100733083/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


