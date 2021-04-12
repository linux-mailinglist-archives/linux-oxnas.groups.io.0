Return-Path: <bounce+16102+102+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 042EA365B67
	for <lists+linux-oxnas@lfdr.de>; Tue, 20 Apr 2021 16:45:34 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 4EkPYY1809624xYCVAp0am2b; Tue, 20 Apr 2021 07:45:33 -0700
X-Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by mx.groups.io with SMTP id smtpd.web09.704.1618249669212491016
 for <linux-oxnas@groups.io>;
 Mon, 12 Apr 2021 10:47:49 -0700
X-Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id B82E42224F;
	Mon, 12 Apr 2021 19:47:45 +0200 (CEST)
From: Michael Walle <michael@walle.cc>
To: ath9k-devel@qca.qualcomm.com,
	UNGLinuxDriver@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-amlogic@lists.infradead.org,
	linux-oxnas@groups.io,
	linux-omap@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Chris Snook <chris.snook@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vadym Kochan <vkochan@marvell.com>,
	Taras Chornyi <tchornyi@marvell.com>,
	Mirko Lindner <mlindner@marvell.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Byungho An <bh74.an@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Wingman Kwok <w-kwok2@ti.com>,
	Murali Karicheri <m-karicheri2@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Helmut Schaa <helmut.schaa@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Michael Walle <michael@walle.cc>
Subject: [linux-oxnas] [PATCH net-next v4 2/2] of: net: fix of_get_mac_addr_nvmem() for non-platform devices
Date: Mon, 12 Apr 2021 19:47:18 +0200
Message-Id: <20210412174718.17382-3-michael@walle.cc>
In-Reply-To: <20210412174718.17382-1-michael@walle.cc>
References: <20210412174718.17382-1-michael@walle.cc>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,michael@walle.cc
X-Gm-Message-State: mEWqm5n5UJY5DMIke5gcLNoex1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1618929933;
 bh=t/90BJ/8BV7EqF/27Ok07bhn9+5kyLLk6O1k2atI+aM=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=n/AUVKWUTgJtseeN87jYDvBUkpyO/42H4GFw0XrWBpuGjbt1iVXRf6y4Mhfr1/oXAVg
 AATYOBko4Tf6lD7P0YrZv0AX+b5ff6n9Jsn/kxYQd80RppmxBJx1azEI2Sm3Q5CqESNCd
 uSdnJdCvxIQRbBi0VRgDtpVy7ugPZqE41xA=

of_get_mac_address() already supports fetching the MAC address by an
nvmem provider. But until now, it was just working for platform devices.
Esp. it was not working for DSA ports and PCI devices. It gets more
common that PCI devices have a device tree binding since SoCs contain
integrated root complexes.

Use the nvmem of_* binding to fetch the nvmem cells by a struct
device_node. We still have to try to read the cell by device first
because there might be a nvmem_cell_lookup associated with that device.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/of/of_net.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index cb77b774bf76..dbac3a172a11 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -11,6 +11,7 @@
 #include <linux/phy.h>
 #include <linux/export.h>
 #include <linux/device.h>
+#include <linux/nvmem-consumer.h>
=20
 /**
  * of_get_phy_mode - Get phy mode for given device_node
@@ -59,15 +60,39 @@ static int of_get_mac_addr(struct device_node *np, co=
nst char *name, u8 *addr)
 static int of_get_mac_addr_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev =3D of_find_device_by_node(np);
+	struct nvmem_cell *cell;
+	const void *mac;
+	size_t len;
 	int ret;
=20
-	if (!pdev)
-		return -ENODEV;
+	/* Try lookup by device first, there might be a nvmem_cell_lookup
+	 * associated with a given device.
+	 */
+	if (pdev) {
+		ret =3D nvmem_get_mac_address(&pdev->dev, addr);
+		put_device(&pdev->dev);
+		return ret;
+	}
+
+	cell =3D of_nvmem_cell_get(np, "mac-address");
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	mac =3D nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(mac))
+		return PTR_ERR(mac);
+
+	if (len !=3D ETH_ALEN || !is_valid_ether_addr(mac)) {
+		kfree(mac);
+		return -EINVAL;
+	}
=20
-	ret =3D nvmem_get_mac_address(&pdev->dev, addr);
-	put_device(&pdev->dev);
+	memcpy(addr, mac, ETH_ALEN);
+	kfree(mac);
=20
-	return ret;
+	return 0;
 }
=20
 /**
--=20
2.20.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#102): https://groups.io/g/linux-oxnas/message/102
Mute This Topic: https://groups.io/mt/82236156/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


