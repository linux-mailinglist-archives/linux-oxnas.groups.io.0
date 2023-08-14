Return-Path: <bounce+16102+315+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B37577B3AF
	for <lists+linux-oxnas@lfdr.de>; Mon, 14 Aug 2023 10:16:49 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=CIqjqgVL+R2OFx6xfrhtD84KKNLfHeuBbPFnK+punbA=;
 c=relaxed/simple; d=groups.io;
 h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Reply-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1692001007; v=1;
 b=DxUPX2mA6DA7a4BNMSI044ZSynvDa+4QeFDN8xB18JMpdN25LEypKJV5eknqrHSPq6v+HmrG
 kIYikNErGUg5pXQwEIv2FplxEq8J6eb2sUghKcbkmbr799zVf4Ib7mqhHR3Mp98aCjAN4GYMxgN
 BGKGGuTRg6pC6oUqEQ5mSEXI=
X-Received: by 127.0.0.2 with SMTP id lESLYY1809624xWzkwCBqaKg; Mon, 14 Aug 2023 01:16:47 -0700
X-Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.103236.1692001006978250769
 for <linux-oxnas@groups.io>;
 Mon, 14 Aug 2023 01:16:47 -0700
X-Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31963263938so1995623f8f.2
        for <linux-oxnas@groups.io>; Mon, 14 Aug 2023 01:16:46 -0700 (PDT)
X-Gm-Message-State: SfdtVp4sYJ0BNQHDlRwk55cWx1808289AA=
X-Google-Smtp-Source: AGHT+IHtsrQFTxvyDoKJq0zJhTadqcM+XG7I+k33MHdMnKAw7Jjir0xPCJuUc09N6AgAGh0jgp8xRQ==
X-Received: by 2002:a5d:4448:0:b0:317:f537:748d with SMTP id x8-20020a5d4448000000b00317f537748dmr5220459wrr.64.1692001005329;
        Mon, 14 Aug 2023 01:16:45 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d4281000000b00317a29af4b2sm13542994wrq.68.2023.08.14.01.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:16:44 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Subject: [linux-oxnas] [PATCH v3 0/3] pinctrl: oxnas support removal
Date: Mon, 14 Aug 2023 10:16:36 +0200
Message-Id: <20230814-topic-oxnas-upstream-remove-v3-0-04a0c5cdda52@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOTi2WQC/43OwQ7CIBAE0F8xnF1TIFbryf8wHpayWJIWmqUSj
 em/S3sxXozHmcObeYlE7CmJ0+YlmLJPPoYS9HYj2g7DjcDbkoWqlK60ljDF0bcQHwET3Mc0MeE
 ATEPMBFgramxTOyISRTCYCAxjaLtihHvfl3Jkcv6xTl6uJXc+TZGf64Msl/a/sSyhgr2x+6Oz0
 lrpzr0PyHEX+SYWOKsPVuvqN6YK5kyNRlvC46H9wuZ5fgMPKRwuKQEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Daniel Golle <daniel@makrotopia.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2278;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=svL6aI+Ivh8BepAtDKpiDrwHSHdF9+dU0wkSJh9amZ0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk2eLqbnzULI5saow0fVSkLtRpOAARsRIwaipWDhVx
 lsLLaj6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZNni6gAKCRB33NvayMhJ0cmvEA
 CvB0XkWPo2+wZVpZSUMFe6ciE43WkhMmHVwX30myPEwI4x0DUu81GxN1KDeMCIIf6gvbSNQhf4jhux
 Pa5rErjAnLfNSMU2x8B/RJ/ENNjzU8RALcgV5Pl915uoCHTOwxw3JqDhQ6SYtA2rGcQpCCoyHVrghj
 JRvWtnJbE5gSRtA2nnFyiUyTVQZnLl2BdBkxXVTW8cvgi/oXnVxbKvVdJSelWpMfSbwkwBde+3PBvm
 DadHl6Z35P/rZzQhPwMQmQg4u8mxvRpQKfvpdkdOq7L40qJZq8zQXp3S93+POeFcSgkRy/E6kZecU5
 plgKiyRUXDl/PgGSzECnCAAVqXJfPD4elh9ukb0YgdKRdLo0KVWUZoBXh5/mmBmQp7x3upVF9RJeg+
 NobaW8Z5h1OLSi2NpYMatz/qAtm551wWVTWn0YEncwE7dC2v6F3MzL19mbxxoj6vFdwYwmnbNXDDaW
 4VbxNV2r6utPtXxaB7FWngH5ugU1hn3ufZbojuKukVVepzsFmcIJmJqWc2Xsw2IrYEIvi8YRSF2Dwd
 Hedc0ksfNGBKzoOt5SOr+H2ckOYss+L8j09/iZmtLBQICJcsLH5bwrswVKmRno59Pq/vaR/6wxWb5g
 5yhQWrzswT9b4eb3zaomgEryjl0Tbrme0H4Mgmim+a5NKx+OKQRbCgL63iwg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: Bulk
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/plugh>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

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

It has been a fun time adding support for this architecture, but it's time
to get over!

This patchset only removes pinctrl/gpio code, and is derived from:
https://lore.kernel.org/r/20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3d=
ea87c@linaro.org

---
Changes in v3:
- Removed applied patches
- Added Andy's tags
- Reduced for pinctrl, rebased on pinctrl devel branch
- Link to v2: https://lore.kernel.org/r/20230630-topic-oxnas-upstream-remov=
e-v2-0-fb6ab3dea87c@linaro.org

Changes in v2:
- s/maintainance/maintenance/
- added acked/review tags
- dropped already applied patches
- drop RFC
- Link to v1: https://lore.kernel.org/r/20230331-topic-oxnas-upstream-remov=
e-v1-0-5bd58fd1dd1f@linaro.org

---
Neil Armstrong (3):
      pinctrl: pinctrl-oxnas: remove obsolete pinctrl driver
      dt-bindings: pinctrl: oxnas,pinctrl: remove obsolete bindings
      dt-bindings: gpio: gpio_oxnas: remove obsolete bindings

 .../devicetree/bindings/gpio/gpio_oxnas.txt        |   47 -
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  |   56 -
 drivers/pinctrl/Kconfig                            |   11 -
 drivers/pinctrl/Makefile                           |    1 -
 drivers/pinctrl/pinctrl-oxnas.c                    | 1291 ----------------=
----
 5 files changed, 1406 deletions(-)
---
base-commit: c9b2572f488c3ed3974a0ff6885bb059b1751c86
change-id: 20230331-topic-oxnas-upstream-remove-a62e9d96feee

Best regards,
--=20
Neil Armstrong <neil.armstrong@linaro.org>



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#315): https://groups.io/g/linux-oxnas/message/315
Mute This Topic: https://groups.io/mt/100732978/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


