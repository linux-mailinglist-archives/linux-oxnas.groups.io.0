Return-Path: <bounce+16102+228+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9696D3E31
	for <lists+linux-oxnas@lfdr.de>; Mon,  3 Apr 2023 09:42:27 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id ZfafYY1809624xSjL4adDnpp; Mon, 03 Apr 2023 00:42:25 -0700
X-Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.64563.1680507745011105589
 for <linux-oxnas@groups.io>;
 Mon, 03 Apr 2023 00:42:25 -0700
X-Received: by mail-wr1-f54.google.com with SMTP id q19so25189997wrc.5
        for <linux-oxnas@groups.io>; Mon, 03 Apr 2023 00:42:24 -0700 (PDT)
X-Gm-Message-State: aJkZam0BRhGNhXARWwdcJZKEx1808289AA=
X-Google-Smtp-Source: AKy350Y2SmJ+IW9vBUcivgJfKUmWg0WDTKG2/7r/sec9GgkoKMkY1oon4b+qU67Bf3lJCYfPVdSGIw==
X-Received: by 2002:adf:f18c:0:b0:2c5:5687:5ed5 with SMTP id h12-20020adff18c000000b002c556875ed5mr25697439wro.18.1680507743417;
        Mon, 03 Apr 2023 00:42:23 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002e62384d17dsm8180482wrr.21.2023.04.03.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:42:23 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Subject: [linux-oxnas] [PATCH RFC v2 0/4] ARM: oxnas support removal
Date: Mon, 03 Apr 2023 09:42:17 +0200
Message-Id: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFmDKmQC/42OQQqDMBBFryKz7hQTUWpXhUIP0G1xEc1EA5rIR
 INFvHuDJ+jy/Q///R0CsaUA92wHpmiD9S6BvGTQDcr1hFYnBpnLIi8KgYufbYd+cyrgOoeFSU3
 INPlIqCpJta4rQ0SQFloVCFtWrhvShlvHMYUzk7HbqfzA+/WEJoWDDYvn73kjirP6yxgF5li2u
 rwZLbQW5jFap9hfPffQHMfxA9FgyG3hAAAA
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Golle <daniel@makrotopia.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680507745;
 bh=SgNBBkyvUTaUF/m4yANQBjtFUorzbWzIokIUTH0J3RI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=EWm7KwVJhRpj3BmmV4hpVkt8axEYiIrePZrYEXzQ7GPxqUpjahl5bSua1BRm0DknaJD
 nnq4qbr+HojUWlf4aHWwYWwYk1N7Nrpzh3sgcL5gHieQxUW8AjXa83cKBBTKYCXyn3dLU
 9kHxqf+qiJaZ/PifsouoXlosN4Cf/v1uOSw=

With [1] removing MPCore SMP support, this makes the OX820 barely usable,
associated with a clear lack of maintainance, development and migration to
dt-schema it's clear that Linux support for OX810 and OX820 should be remov=
ed.

In addition, the OX810 hasn't been booted for years and isn't even present
in an ARM config file.

For the OX820, lack of USB and SATA support makes the platform not usable
in the current Linux support and relies on off-tree drivers hacked from the
vendor (defunct for years) sources.

The last users are in the OpenWRT distribution, and today's removal means
support will still be in stable 6.1 LTS kernel until end of 2026.

If someone wants to take over the development even with lack of SMP, I'll
be happy to hand off maintainance.

The plan is to apply the first 4 patches first, then the drivers
followed by bindings. Finally the MAINTAINANCE entry can be removed.

I'm not sure about the process of bindings removal, but perhaps the binding=
s
should be marked as deprecated first then removed later on ?

It has been a fun time adding support for this architecture, but it's time
to get over!

[1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Only keep first 4 patches for v6.4, the rest will be done later split per=
 subsystem
- Link to v1: https://lore.kernel.org/r/20230331-topic-oxnas-upstream-remov=
e-v1-0-5bd58fd1dd1f@linaro.org

---
Neil Armstrong (4):
      ARM: dts: oxnas: remove obsolete device tree files
      ARM: oxnas: remove OXNAS support
      ARM: configs: remove oxnas_v6_defconfig
      dt-bindings: arm: oxnas: remove obsolete bindings

 Documentation/devicetree/bindings/arm/oxnas.txt    |  14 -
 arch/arm/Kconfig                                   |   2 -
 arch/arm/Makefile                                  |   1 -
 arch/arm/boot/dts/Makefile                         |   3 -
 arch/arm/boot/dts/ox810se-wd-mbwe.dts              | 115 -------
 arch/arm/boot/dts/ox810se.dtsi                     | 357 -----------------=
----
 .../dts/ox820-cloudengines-pogoplug-series-3.dts   |  93 ------
 arch/arm/boot/dts/ox820.dtsi                       | 299 -----------------
 arch/arm/configs/oxnas_v6_defconfig                |  92 ------
 arch/arm/mach-oxnas/Kconfig                        |  38 ---
 arch/arm/mach-oxnas/Makefile                       |   2 -
 arch/arm/mach-oxnas/headsmp.S                      |  23 --
 arch/arm/mach-oxnas/platsmp.c                      |  96 ------
 13 files changed, 1135 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230331-topic-oxnas-upstream-remove-a62e9d96feee

Best regards,
--=20
Neil Armstrong <neil.armstrong@linaro.org>



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#228): https://groups.io/g/linux-oxnas/message/228
Mute This Topic: https://groups.io/mt/98030323/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


