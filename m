Return-Path: <bounce+16102+101+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C15365B68
	for <lists+linux-oxnas@lfdr.de>; Tue, 20 Apr 2021 16:45:36 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id hTu8YY1809624xOxMxBWg7Gm; Tue, 20 Apr 2021 07:45:35 -0700
X-Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by mx.groups.io with SMTP id smtpd.web10.767.1618249665830615713
 for <linux-oxnas@groups.io>;
 Mon, 12 Apr 2021 10:47:49 -0700
X-Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 0C67F22249;
	Mon, 12 Apr 2021 19:47:25 +0200 (CEST)
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
Subject: [linux-oxnas] [PATCH net-next v4 0/2] of: net: support non-platform devices in of_get_mac_address()
Date: Mon, 12 Apr 2021 19:47:16 +0200
Message-Id: <20210412174718.17382-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,michael@walle.cc
X-Gm-Message-State: 7mcUxpHVjxsxLQKCaIu55C5yx1808289AA=
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1618929935;
 bh=1rLYFQMt+yFmPTk/dLyFCW0WsOO30y0yH8cJErhOp98=;
 h=Cc:Date:From:Reply-To:Subject:To;
 b=BelF58DbLLYhPqxyj9ZH6v2KJ1lX/i64HOAxDud3TZ8h8I63LkHQ5sibv/xIqRk/7S9
 HxvtX05iH66qyIlaZaVd27ryh9Uc5i3+rbicuGbm/2nl8ugkOL2vmMNwhwJRFh2ovQVrg
 3fg0OM6X71rM7h0wiJlOERCbawGwnvmxDj0=

of_get_mac_address() is commonly used to fetch the MAC address
from the device tree. It also supports reading it from a NVMEM
provider. But the latter is only possible for platform devices,
because only platform devices are searched for a matching device
node.

Add a second method to fetch the NVMEM cell by a device tree node
instead of a "struct device".

Moreover, the NVMEM subsystem will return dynamically allocated
data which has to be freed after use. Currently, this is handled
by allocating a device resource manged buffer to store the MAC
address. of_get_mac_address() then returns a pointer to this
buffer. Without a device, this trick is not possible anymore.
Thus, change the of_get_mac_address() API to have the caller
supply a buffer.

It was considered to use the network device to attach the buffer
to, but then the order matters and netdev_register() has to be
called before of_get_mac_address(). No driver does it this way.

changes since v3:
 - use memcpy() instead of ether_addr_copy() where appropriate.
   Sometimes the destination is on the stack, thus the 2 byte
   alignment requrement is not met.
 - fix "return PTR_ERR(mac_addr)" as found by Dan Carpenter
 - changed subject of patch 2/2, as suggested by Florian Fainelli

changes since v2:
 - fixed of_get_mac_addr_nvmem() signature, which was accidentially
   fixed in patch 2/2 again

changes since v1:
 - fixed stmmac_probe_config_dt() for !CONFIG_OF
 - added missing queue in patch subject

Michael Walle (2):
  of: net: pass the dst buffer to of_get_mac_address()
  of: net: fix of_get_mac_addr_nvmem() for non-platform devices

 arch/arm/mach-mvebu/kirkwood.c                |  3 +-
 arch/powerpc/sysdev/tsi108_dev.c              |  5 +-
 drivers/net/ethernet/aeroflex/greth.c         |  6 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c   | 10 +--
 drivers/net/ethernet/altera/altera_tse_main.c |  7 +-
 drivers/net/ethernet/arc/emac_main.c          |  8 +-
 drivers/net/ethernet/atheros/ag71xx.c         |  7 +-
 drivers/net/ethernet/broadcom/bcm4908_enet.c  |  7 +-
 drivers/net/ethernet/broadcom/bcmsysport.c    |  7 +-
 drivers/net/ethernet/broadcom/bgmac-bcma.c    | 10 +--
 .../net/ethernet/broadcom/bgmac-platform.c    | 11 ++-
 drivers/net/ethernet/cadence/macb_main.c      | 11 +--
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  |  8 +-
 .../net/ethernet/cavium/thunder/thunder_bgx.c |  5 +-
 drivers/net/ethernet/davicom/dm9000.c         | 10 +--
 drivers/net/ethernet/ethoc.c                  |  6 +-
 drivers/net/ethernet/ezchip/nps_enet.c        |  7 +-
 drivers/net/ethernet/freescale/fec_main.c     |  7 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c  |  7 +-
 drivers/net/ethernet/freescale/fman/mac.c     |  9 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c |  5 +-
 drivers/net/ethernet/freescale/gianfar.c      |  8 +-
 drivers/net/ethernet/freescale/ucc_geth.c     |  5 +-
 drivers/net/ethernet/hisilicon/hisi_femac.c   |  7 +-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c |  7 +-
 drivers/net/ethernet/lantiq_xrx200.c          |  7 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c    |  5 +-
 drivers/net/ethernet/marvell/mvneta.c         |  6 +-
 .../ethernet/marvell/prestera/prestera_main.c | 11 +--
 drivers/net/ethernet/marvell/pxa168_eth.c     |  9 +-
 drivers/net/ethernet/marvell/sky2.c           |  8 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 11 +--
 drivers/net/ethernet/micrel/ks8851_common.c   |  7 +-
 drivers/net/ethernet/microchip/lan743x_main.c |  5 +-
 drivers/net/ethernet/nxp/lpc_eth.c            |  4 +-
 drivers/net/ethernet/qualcomm/qca_spi.c       | 10 +--
 drivers/net/ethernet/qualcomm/qca_uart.c      |  9 +-
 drivers/net/ethernet/renesas/ravb_main.c      | 12 +--
 drivers/net/ethernet/renesas/sh_eth.c         |  5 +-
 .../ethernet/samsung/sxgbe/sxgbe_platform.c   | 13 +--
 drivers/net/ethernet/socionext/sni_ave.c      | 10 +--
 .../ethernet/stmicro/stmmac/dwmac-anarion.c   |  2 +-
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-generic.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |  2 +-
 .../stmicro/stmmac/dwmac-intel-plat.c         |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson.c |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-oxnas.c |  2 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 14 +--
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  2 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      | 19 ++---
 drivers/net/ethernet/ti/cpsw.c                |  7 +-
 drivers/net/ethernet/ti/cpsw_new.c            |  7 +-
 drivers/net/ethernet/ti/davinci_emac.c        |  8 +-
 drivers/net/ethernet/ti/netcp_core.c          |  7 +-
 drivers/net/ethernet/wiznet/w5100-spi.c       |  8 +-
 drivers/net/ethernet/wiznet/w5100.c           |  2 +-
 drivers/net/ethernet/xilinx/ll_temac_main.c   |  8 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 15 ++--
 drivers/net/ethernet/xilinx/xilinx_emaclite.c |  8 +-
 drivers/net/wireless/ath/ath9k/init.c         |  5 +-
 drivers/net/wireless/mediatek/mt76/eeprom.c   |  9 +-
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    |  6 +-
 drivers/of/of_net.c                           | 85 ++++++++++++-------
 drivers/staging/octeon/ethernet.c             | 10 +--
 drivers/staging/wfx/main.c                    |  7 +-
 include/linux/of_net.h                        |  6 +-
 include/net/dsa.h                             |  2 +-
 net/dsa/dsa2.c                                |  2 +-
 net/dsa/slave.c                               |  2 +-
 net/ethernet/eth.c                            | 11 +--
 85 files changed, 243 insertions(+), 364 deletions(-)

--=20
2.20.1



-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#101): https://groups.io/g/linux-oxnas/message/101
Mute This Topic: https://groups.io/mt/82236155/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


