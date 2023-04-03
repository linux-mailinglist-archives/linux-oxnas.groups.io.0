Return-Path: <bounce+16102+235+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695F6E4166
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:08 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id hjAkYY1809624xFuIX9g8duL; Mon, 17 Apr 2023 00:42:06 -0700
X-Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.127])
 by mx.groups.io with SMTP id smtpd.web10.74975.1680537332127688679
 for <linux-oxnas@groups.io>;
 Mon, 03 Apr 2023 08:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWe594003AkZmy1vwknqhEtyaXWhINyqdaBpoecM5OOMk0N17R7s0t9KolodtPjvaiNGdXmB195MkjwSCiKmS8QXdRpgOVWCsACBkcyr87cwBvURNQkYHaz1H7ttlrY14k2SWSyc5aR48qE5NQq4R/05H+IFR8yyB5BRRWo5FH+d0f5suNcVMqWbBSID6woD8eXt1HYZK31Pq4Qrg6o0qlfzqX0x+7VE2bN3ht7S7X7ZxDi3SfzAeXAoaBZr8wZe5u101JgfS1vBkGAE5rx9wbw4H/13ToW5APhHNyhSkS0uAvMAbZH0l6lgciGbWI2hjCy7bkq5Ay886e0voQbNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+YVYTGo2pr2JuszrU+NBVUV4x9UUygJDzD3MpMj8JE=;
 b=WLHbNqUa1ia1mummG5jxzqDIjbfiUC20qICKttrh5LPtmSBamlkrTOt0+HBwK8SF9z6EfI30nc5oKIkfzCB0+AHpWvFieHnmPweLv2Q5ModfTqGAmnFwqdpS8QevoJt9bS5vmOoHpqL0ZumUkGS9yZyIMyFrlkGQE51DbXkDmB4RM1BSQ8wHQ2C1IMGJAgVolnQYJTqmLFtMvDMgKOl7861zMoCtDS4tU1zlNo0GQMgTZghEUSZhqkV+THvPoagIcepzaeoPchWfTwqKQqV4xu2bOhWlbC2wRr9QutEZQg1tBGUIXFpNmdXY7l0ZI4JX8+eBJ9OHo0deKie4UsvPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
X-Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH2PR13MB3719.namprd13.prod.outlook.com (2603:10b6:610:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:55:30 +0000
X-Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::c506:5243:557e:82cb%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 15:55:30 +0000
Date: Mon, 3 Apr 2023 17:55:20 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Subject: Re: [linux-oxnas] [PATCH net-next 01/11] net: stmmac: Make stmmac_pltfr_remove() return void
Message-ID: <ZCr26P9DGZFZy3Vq@corigine.com>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM0PR02CA0197.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::34) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH2PR13MB3719:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cc14f8-0c86-4f96-a3d3-08db345bd974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: 
	WDBP7MA6GGybR5O+n+MWC64viQtZhUZ6TchTFeP5Ztpeqb2dhVKRWElVLRXBMohaOnL/B+AYrs+QQ4gM1vTmgf87VamsfFtXQpBd766KGpXMHjXM72DjW1DBR4Ikg/U6OsMkBtO9UqhLAE91JAlwbEr5MNB9QuAE6fja+PgV74F7vLtXS8NgZGQxiEG5Afz6PuTa8byJJNJDQwqKLpAjoqus/VHhkXS6npla17SL4F2uDQaGtpcnHRzGVIgiAW9P7FjYgekcVo1mfv/z0rCng+3RRu+6yQDCtvPXtpF6Do8j2tQNXmBrQ9Sn+wsv2sK/xL056OerYhxsXUfb5EHFEgyWTg+Rfg3bjhBLRJZCpxzZQpcUvFbVkT+5udUTWF3mir7b6XV3N4qmSoseeebN23D+GrCPzWUngxMb7rOjhI9q4FxbEfWxJpqtahMz9VoKvq3fosQ/SzFGjtUVNRqNdohgYLF5Ri8iFXZ863q8nhBxsqv89cU+8fagkgx0xXduRROLPlaJkgVvQl4mZLR96ZVKhOOua3dfFHuo0D7/A7K9hPf0srFyKJJ6EXG0XtYK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BhKCixoL6PiGkpTEEqKkdu95YjVmsvubYillhmHHl3F6PWwE6sk5oouFz81O?=
 =?us-ascii?Q?KyMuTcGUkfKEX9r1V8raOonEX3i7vV79jVJ5MinpIj6AQ1SPt1zQ7wSvlFT5?=
 =?us-ascii?Q?jVVlRMm2aCWNMQYSk07XXyYZuBWHc98HcBfcBTWutfB74IEYc1h1Hy3WBpKA?=
 =?us-ascii?Q?E4KpPgYBZQ//UNgIn4pXT2shQOMv5riN/AIyNjQnA71jwD3z8PMkOq+gPrg4?=
 =?us-ascii?Q?ooYamt3p/XXjdPpaO6aX7FugJZSy37uUKlkl01/Jc4WMa9TmXqLTVO3UKoz6?=
 =?us-ascii?Q?zy70cPC7hbXrIONMfRlG9ajBMjOgPkmheoSd5HULpe+68ypLLpRq8oYC7aD0?=
 =?us-ascii?Q?q7cCiAtFgsKrgvAtOIGosvThvYXRNAj6/teOuc8+gvEDm/Z6L0e8HkzsNGBf?=
 =?us-ascii?Q?NlTLZ0X5PnRhFkJskJq49YE/xsuuzMw8sHYodTfg0Cjjon0l8QzLIv+NyeGV?=
 =?us-ascii?Q?ek2sBqTxRFZhnjjIFp4sIZvUEwdk+q+avL+vmpnhlw15nP5lgNbA7rT59AAy?=
 =?us-ascii?Q?eEYECEaOWtaBJb6EUPGar6E7YybD/xrK6p5xSrbKGjsPnTYkeluus8P+S0yl?=
 =?us-ascii?Q?fAEiCciRTmIpJphnTatHGyMc4F3xR2Uxc0z6ltKxoP6l4cw788HNv8mTwkt+?=
 =?us-ascii?Q?grJ4X+/R6n15dR+qzwiEcT8Q0qZKIG/2qG5ZQ7rmF3AmtuwK1dYRxFeCf4CD?=
 =?us-ascii?Q?yotnlbffy0nlrwa2FpCbwnbMe8rlyg6LO+/CyFysJIVuNgN21vxOSU+m2H0y?=
 =?us-ascii?Q?DPyccpgORiE10QQbhK/Ak11+TfWDtfvWj4D9KmH+4v0bbJZmqJIAonwOYO8p?=
 =?us-ascii?Q?Lklgvpndbxx/4XXoQVyFY0PPM6iWy2ZDi/2ZPcwjFrMBEp+taiA0xjXpqnAr?=
 =?us-ascii?Q?49k+E6/kdW+OXb/jiN37VVwz1PRNCsvyXbOW3q4keoxbjQr1oZveoOPxAjDN?=
 =?us-ascii?Q?rE5LJPQgJht8FxSb52nefcqaQ4bwYuNo8KUTEU9/8KDzpUHWmgG6rPKjy5ky?=
 =?us-ascii?Q?nsCkakk6SUTAvssgFEeOsb1g34PPqjzqq1jtwzLSa1bcwi0+/J6HlTaYO9w1?=
 =?us-ascii?Q?1fyGs1A0i4BsE7xoLh3JgVI+BNlBHNyyXEom6Gx2XQergDD3C3h2Bn3qFWo0?=
 =?us-ascii?Q?/97qMcUzIITPyn3bh5qxWpl0S/mbqMy2+HzCbbguVUuux33xPRtKf+4qxBPs?=
 =?us-ascii?Q?JfwRqm+kszOjDnzztSVjpOTZnZuuE4iWTHO2eaLse/mqgOGk6eEtcJIDRVRx?=
 =?us-ascii?Q?w2YY5mCsQcVj1GFzr3dD7JQMRs8Jhm07UpPTty4HJnX+Ri3seCd7Tj6LD2Ov?=
 =?us-ascii?Q?7CfbkFosH7x24sC5KMJA9kK2SoAQ8CngoiRjdfsEYRSTPRUmuuvvmxHHePPx?=
 =?us-ascii?Q?8VAGXavkOjztdO/HZW9mjm/zQBnTvCXRkk/Ecojf1TDvQzaZTQeBGPto4Ht1?=
 =?us-ascii?Q?Oz8okss2iGOfXH1vgxKfcl2nIiM1bVFpw30fyRN7Bir9P4PiLnmeYj89zrT0?=
 =?us-ascii?Q?Yffm/jb8IkCoaqUGxVIE9YIZwgafbMjkUwz8euh8MZBHnSSHmyeNgUH+7ZdY?=
 =?us-ascii?Q?fRoA+CpCq97JVNC3yuknNWQx0muDqt2vyyfKbaBzSknOf1kCa/bbSK/zo65h?=
 =?us-ascii?Q?FFYynrkjy0SkGPgbg9x73kAEGq1PAuCv47dHxdec2sv7kGDUz4i7cza3UuM9?=
 =?us-ascii?Q?/Twlrg=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cc14f8-0c86-4f96-a3d3-08db345bd974
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:55:30.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi9ouKvLIseYSWu+x4/dzhuaT4Kd3OVKmu3Yn7inqxlbAOfeIqnoTDZyBnyWeY9OITutOt71PTxLoBlQP+UZRyicvCOPgS/BGQYNhSem74I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3719
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,simon.horman@corigine.com
X-Gm-Message-State: m7kId4YH0RHramqNBVCtH7XXx1808289AA=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717326;
 bh=vrzj9yie9ghi8Em2WtHlKf8j6QjGBt1wnLpLRx3xL+M=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=kvNlMZG0bhlciBGgV5jfV5gxfBKTONld0YVZhrySf79QYeU+YSkD7H04NEivaQGfjdC
 cdKRGRTYjEAvOCSjMN5jdTtjPj0ZV91LPRSFgMYirZfT7adAGhETjXjQLsmYubRzCqsEA
 xt+wVIhFOs45wzfYCE6K/MQ8GCLLLCiiPUI=

On Sun, Apr 02, 2023 at 04:30:15PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
>=20
> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Simon Horman <simon.horman@corigine.com>



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#235): https://groups.io/g/linux-oxnas/message/235
Mute This Topic: https://groups.io/mt/98314476/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


