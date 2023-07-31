Return-Path: <bounce+16102+311+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E647699C1
	for <lists+linux-oxnas@lfdr.de>; Mon, 31 Jul 2023 16:41:28 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=lsIuBHlLrO+aX4qn2zbKoKaAX4d5360AdcRXloBlpgA=;
 c=relaxed/simple; d=groups.io;
 h=X-Received:X-Received:X-Received:X-Gm-Message-State:X-Google-Smtp-Source:X-Received:X-Received:From:Subject:Date:Message-Id:MIME-Version:X-B4-Tracking:To:Cc:X-Developer-Signature:X-Developer-Key:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Reply-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1690814487; v=1;
 b=Db0OYBJ548V2DNzeHYHJdaUkC/1iQNrqeQ2igfvzLaTNOqBFMVzxfr8AA4V6KpjLus5VbfVg
 L7WVU7FL6myj6MTbEXUVQ15ATbS888Ovs3cigAcTumyoreCkW/ItqXq4s+rl/P2wTeXxNgGfMl2
 XJ/Ps3rkF1BvKODv6k/V18Gs=
X-Received: by 127.0.0.2 with SMTP id NBC8YY1809624xsxUdeJVfIQ; Mon, 31 Jul 2023 07:41:27 -0700
X-Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9418.1690814486425796562
 for <linux-oxnas@groups.io>;
 Mon, 31 Jul 2023 07:41:26 -0700
X-Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso51345365e9.1
        for <linux-oxnas@groups.io>; Mon, 31 Jul 2023 07:41:26 -0700 (PDT)
X-Gm-Message-State: NEWtvRzESf72ov2JxAZxNzEyx1808289AA=
X-Google-Smtp-Source: APBJJlGYgAWdED1OMLeik9Hplb9eRIiHr1G3kcLMz3RzCktxRnJWE2r8PIDKupXpqeHCscu8gcYwXA==
X-Received: by 2002:adf:f990:0:b0:314:1a09:6e71 with SMTP id f16-20020adff990000000b003141a096e71mr17470wrr.53.1690814484575;
        Mon, 31 Jul 2023 07:41:24 -0700 (PDT)
X-Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm13257372wrn.52.2023.07.31.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:41:24 -0700 (PDT)
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Subject: [linux-oxnas] [PATCH net-next v3 0/2] net: ethernet: dwmac: oxnas glue removal
Date: Mon, 31 Jul 2023 16:41:09 +0200
Message-Id: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAXIx2QC/43OTQrCMBAF4KtI1o40CdaflfcQF5NmYgM1KZM0V
 KR3N3QjbsTlmwffm5dIxJ6SOG9egqn45GOoQW83ousx3Am8rVmoRulGawk5jr6DOAdMMI0pM+E
 DmB6xEGCr6GRPrSMiUQWDicAwhq6vRpiGoR5HJufndfIqAmUINGdxq03vU478XH8pcu3/mi0SG
 tgbuz86K62V7jL4gBx3ke8rXNQHa3XzG1MVc6ZFoy3h8dB9YcuyvAEJPvCHMwEAAA==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Daniel Golle <daniel@makrotopia.org>, Andy Shevchenko <andy@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EGhiweLDmR0vbL0c7DXnBhobF+uKXvCF8L5qcGZ2JkY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkx8gSrdIKH4E3PYyJ7kgGPfv2zB1PqlPEI4wclQcj
 8CQJ6aqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMfIEgAKCRB33NvayMhJ0YaXD/
 0apuCDXxe1YAYbDlWbvRhWL1ZiBafPZUn7bjMUNUaNlRgSDYKNNxpBz4Txhv6Dl2xnzzjCgOnSNZlv
 TI1iYTyvjYXxphVNv/KEbZjewvJsFHsqydu9ChjdONrSebX1geFyJl5lxcHgefaABCTAWDGm6Q+jmF
 OfFZ8+l0O+3QRCxxNleaZNcCHPMB+wNQBLkhbd1J9YcV7rs9Bup1xUQAXqYGqcDlLKi4serEwZp7Wj
 vagAAvSnQ9J1ZXMOSSWj4royyI+fkBumpUYtczIzONxsP7BNsQeJG7fnJ5GkennftqrT6hzIu+Vm/Y
 pPvdM+WgJROdGzwWxZxDOoI4MZZtyxq357qocRGyfG0j81Xp77zfX1XL94hCuT92hr1asLmPiyAi6+
 LJbYj6x5KAQ3H+7A4FcLJbzCdgSloAGUwx2YBZE7AJYbr6Hl39S09V0Wv0rDwYOskm0iJj2ELYkSZr
 XNIrZvICAh1LRvVS3owjBc0A4t4u8A4eZ+QtZgdS8i5Ex0MuWpvGees9KGCDUhooYMGFUJiy5U9w3J
 bSQIec8+986xNY8wvTykHWr08X6M1NCLxRThJNY5kW3LQhn1d3hd683397PtLG07A1mHsu87DDOznM
 7jB5tLRHfapCqps3EG7sjwW2YPraTZrsS05Rq58CHp/H1GOuCsRr3sMVfOXQ==
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

This patchset only removes net changes, and is derived from:
https://lore.kernel.org/r/20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3d=
ea87c@linaro.org

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Removed applied changes
- Added Andy's tags
- Reduced for net
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
Neil Armstrong (2):
      net: stmmac: dwmac-oxnas: remove obsolete dwmac glue driver
      dt-bindings: net: oxnas-dwmac: remove obsolete bindings

 .../devicetree/bindings/net/oxnas-dwmac.txt        |  41 ----
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 -
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c  | 244 -----------------=
----
 4 files changed, 297 deletions(-)
---
base-commit: ec89391563792edd11d138a853901bce76d11f44
change-id: 20230331-topic-oxnas-upstream-remove-a62e9d96feee

Best regards,
--=20
Neil Armstrong <neil.armstrong@linaro.org>



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#311): https://groups.io/g/linux-oxnas/message/311
Mute This Topic: https://groups.io/mt/100462872/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


