Return-Path: <bounce+16102+164+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id CA37D4C6528
	for <lists+linux-oxnas@lfdr.de>; Mon, 28 Feb 2022 10:00:31 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id nsgoYY1809624xY8UsGxyUrg; Mon, 28 Feb 2022 01:00:29 -0800
X-Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.17845.1646038827240656954
 for <linux-oxnas@groups.io>;
 Mon, 28 Feb 2022 01:00:28 -0800
X-Received: by mail-wr1-f50.google.com with SMTP id d17so14189978wrc.9
        for <linux-oxnas@groups.io>; Mon, 28 Feb 2022 01:00:26 -0800 (PST)
X-Gm-Message-State: 9rJ8ylw39EsV9USAvFCVLq6hx1808289AA=
X-Google-Smtp-Source: ABdhPJwU8NEjIMff5919wlS+clhon3+HVP5ZyPM44A0GhFvTUZVS7uEb34T1bi70ESGYlMPWwb2S9g==
X-Received: by 2002:a05:6000:1565:b0:1ea:6673:c0b5 with SMTP id 5-20020a056000156500b001ea6673c0b5mr14629400wrz.469.1646038825203;
        Mon, 28 Feb 2022 01:00:25 -0800 (PST)
X-Received: from ?IPV6:2001:861:44c0:66c0:6431:1dc7:b58f:6282? ([2001:861:44c0:66c0:6431:1dc7:b58f:6282])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c1d0200b0037cdeb03977sm11700549wms.18.2022.02.28.01.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:00:24 -0800 (PST)
Message-ID: <530fd72c-e28a-4d5e-cb8d-8b3fbc1df89a@baylibre.com>
Date: Mon, 28 Feb 2022 10:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: "Neil Armstrong" <narmstrong@baylibre.com>
Subject: [linux-oxnas] [PULL] oxnas DT for 5.18
To: soc@kernel.org, arm@kernel.org
Cc: linux-oxnas@groups.io, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1646038829;
 bh=+WatnqyC/cgu5tt2yzpdm231O0oLKVq9+r6ZVAYMSsk=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=errek+lyiFdF4tGB0qZlDUxYty0nmfxQGrFeyx+Y7qBIQOmMEDMbcC5CGdgretYaQA8
 GJSc4GrcTq7XQ0jBSBtjY2y4fzM/3+72HQzcPNyLmP9ZoOKEtojkJTmaX0MV5WY2XZm1E
 PXboqGCveQEWkB+QQSFHO+IKq8N5BbjLjpI=

Hi,

Please pull this single change enabling ethernet on the OX810SE based board=
.

Neil

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07=
:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/narmstrong/linux-oxnas.g=
it tags/oxnas-arm-soc-dt-for-5.18

for you to fetch changes up to b88ffa66d530ba01ec64b1f5eeb74f8b8ce61d7f:

   ARM: dts: ox810se: Add Ethernet support (2022-01-25 18:03:04 +0100)

----------------------------------------------------------------
- Add Ethernet node for OX810SE base board

----------------------------------------------------------------
Neil Armstrong (1):
       ARM: dts: ox810se: Add Ethernet support

  arch/arm/boot/dts/ox810se-wd-mbwe.dts |  4 ++++
  arch/arm/boot/dts/ox810se.dtsi        | 18 ++++++++++++++++++
  2 files changed, 22 insertions(+)


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#164): https://groups.io/g/linux-oxnas/message/164
Mute This Topic: https://groups.io/mt/89446957/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


