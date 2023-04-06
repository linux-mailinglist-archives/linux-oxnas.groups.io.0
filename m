Return-Path: <bounce+16102+241+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9456E416A
	for <lists+linux-oxnas@lfdr.de>; Mon, 17 Apr 2023 09:42:12 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id xJsxYY1809624xKZLNUwrHWM; Mon, 17 Apr 2023 00:42:10 -0700
X-Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
 by mx.groups.io with SMTP id smtpd.web10.154113.1680772691734488743
 for <linux-oxnas@groups.io>;
 Thu, 06 Apr 2023 02:18:12 -0700
X-Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3368nKfZ013296;
	Thu, 6 Apr 2023 02:17:42 -0700
X-Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkv99pdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 02:17:42 -0700
X-Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5703D400D9;
	Thu,  6 Apr 2023 09:17:37 +0000 (UTC)
X-Received: from o365relay-in.synopsys.com (unknown [10.4.161.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8D2A7A005C;
	Thu,  6 Apr 2023 09:17:27 +0000 (UTC)
X-Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 76E58A10A5;
	Thu,  6 Apr 2023 09:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ1eFJHMY/DH4aKXA/08jlkSGg780mSUuRCUjwRkNBzQLysC6+9Yvpf8PhxJl0JhGwXLfBo1Pd2bwk7DdGuaD4Gjrwho7xk3o31N1ZO0vstO3EeMiwzM2c8GPMQayv0/GN0RzCCZCkRlo26kRbfEJTWMnCdzLBADcyBE6F5K3/UJ/OB/zzq/pZhc2YrLWJW0Vvfe3Ytvg0QqbdgQntSRRsNJoZ7OWcgJXCk7V0KyAWBq35dTiYSQs4R0xytF9Ks1Rt0WHfwOei+bpUWnVaf4Wo2e4t63sQa6nsV2oP+AgmcelYDSReSiJs1qNC+P9qFTq7yDfbydhh06LYkspZ87MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd2cDNip62Ji14ds4OdoQBlo1z5VlqewCRbyiVCpDNg=;
 b=k+Va1emzHPh4RvJhUHpbBVvOeWw+Bn56luo8qOhg9FxzFPdmtIVuISBIOlaGWsV8HVogV9TWEwQt0WjXU9bZaaVBq84WajXzIVD8LZ7L28xdjzVq0rkOXs15BDRIJdxDafVKM96V8jHn+Q4m7+RK72bzYELaq6ERjXAbxgTY4fhvyp/nFlOfkk22aZS1UGjs7xFPlD356QtimL0rI7E5ekykmbxWP8V+wXIJ1DDRQjdUN/FmS81EAytoemILEl0EMOGbyHdXG4Um166q1ly3BuTpFNJdLuKro2zau/hHqm+Y5wHU+dmPshsfyRDj/HulaXNXw5X0mWUtFi7QyhEOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
X-Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 09:01:16 +0000
X-Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::16ef:a4:a1eb:6c6]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::16ef:a4:a1eb:6c6%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 09:01:16 +0000
X-SNPS-Relay: synopsys.com
From: "Shahab Vahedi via groups.io" <Shahab.Vahedi=synopsys.com@groups.io>
To: Vineet Gupta <vgupta@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Subject: Re: [linux-oxnas] [PATCH 13/21] arc: dma-mapping: skip invalidating before bidirectional DMA
Thread-Topic: [PATCH 13/21] arc: dma-mapping: skip invalidating before
 bidirectional DMA
Thread-Index: AQHZZS+qm3aBT5RvZkOaPbJNwNvoFq8eAmCA
Date: Thu, 6 Apr 2023 09:01:15 +0000
Message-ID: <ba0c6b04-cb7d-87ba-a435-919a910282dd@synopsys.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-14-arnd@kernel.org>
 <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
In-Reply-To: <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR12MB2782:EE_|IA0PR12MB7578:EE_
x-ms-office365-filtering-correlation-id: 22efacb0-170a-4f0f-093c-08db367d7a70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 
 NnmimPU9GZ6EYXyazcy8nOgwG+Vt2m+dhgjF0hK6aCH3uNjqXMu/ReiRzsweamhLzfUWH9VPlDsFdp45Y9w48YXJzM05XWRdPz+PS1qARAIuVP1qymKSvvjGX8y8l1xE9jWVr+0By4ym804SNpPv8+QyDUSNkRrs+TgtpwdN9sNXFALWpF3NBdF5HT6SUEAGqanoywKUiHcec/13nLjpZyDzNot4niWW5UxaANoPJS6XeX8CFuYZqYAlHS8co/JM1KjteBxFlbBBiE59arZb94dM+NESal+WihK1DCcxNW2DR5qFabboSSVG7EOY6aIRDvrT8TaC+SvcURLWrPd9Jq4Qo+Nt/y2bhQgdGc7ZQoVGqJR9jHkd9z3ANS9doutBUC9mnEIY5RTh8LxSRux/h+s3FlRrz54d/Vkpjc4oqqbLv5ua3xVk69cIJvAX787zX7ArPoLgh9wzZELYPoQ2id9OaBSjoYlagZoyi/BbpwgzSGvV+KHzu9Z11vLZAVKj5SUb+WY1Fu9J4wAqHNYidciinHRk9PoMGQ65RGNSRxrlsON8ULy6k8h3XOsuVIGHIF/sq4eozfe9Lz5TF9eNmIvYy0MA7PRlRT/04/KSdzylqgqtPYaZmhhcwyClfhCdCXeRSdYbIlB0IucJDW4KuA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RUFJRUxRMlE3NkcraFZVbXRvdjd2MWs1U2orZlg2Z1o0dFlrZmtrNlh2aW9L?=
 =?utf-8?B?dW1TWlZyV3hSNDlIekFlUnRGRDZzK092NmlySUphM2VsTVNhZDZHWjd3OXho?=
 =?utf-8?B?ZDRsZ2JHV0lQdUVOYW14THpGZnoyYy9adTRyYkZ4cWVoNzZaMmZaVk9Xc3BI?=
 =?utf-8?B?YjAxRnRrcW5jWjk4NEhBS0M5RmJac3dUT3E0TFczaHRpSFlzM1l5cHpyU2xp?=
 =?utf-8?B?Y09seEk0VHNOb3pMbkxEbFRTczd6aU40ZWpXWVJmeEN0ZS9FY1I3RkgxLzJr?=
 =?utf-8?B?UWZNOEpRN0FyNWRBVUc1eTVYa1ptd3VKNTNMS3VtajVXbXpncGgwUXRWN0hu?=
 =?utf-8?B?S2k5MlNLZGpnTThLUUY4dDZZdHJrelRsOU1TbUN0V2NUMVlpU1VINUhKY1VR?=
 =?utf-8?B?RFcyVlpYdVBnbUJ5Y1g5YTNYbk1YQThWeTVLem5QUUxmWEIya2c2RmdnK0Rj?=
 =?utf-8?B?T1ZqQSsvaGwyMmlkYVVTQ2FFbXZFbTRESEszSDB3QS9mY1BjMmpnMkpsTVla?=
 =?utf-8?B?STd3MzhWbkNJc3V5Y3ZjbU1KeldrZmRIRzRtUnVNdTJEREVHb1Z4NCtQVEs0?=
 =?utf-8?B?dUdOcDBrM1VOd2dSb0VDWE1pS1pRUmgvSlowSEhycFJZMW5HRml5Y2pJNVNU?=
 =?utf-8?B?bVJTY1kraFl6Mm9SeGhEaWErYWVidTFLbjJ3L2htbEtUZlJFWkdlQVZNRTRH?=
 =?utf-8?B?UlR3Qlc0R0paNnYxamNPMWJweFBoWTVKYk9HNDk2VVJUK1FzMzN0Mkpra0lP?=
 =?utf-8?B?b1RvdzdXUDQrQkxYKzlKcTdrOW13SWFlMXZhSjg2eGt3VjUzUXU4N3czZlBz?=
 =?utf-8?B?YlZ4Zk9WYTIyZ0JES2Y1K0hzR0tVVTQ2TnMxWmIvakZEbHpoTGpVL2FHYkd5?=
 =?utf-8?B?N1ovdDZYTklwOTJUeU9Bck81MDJWSUVKdS8xL1pWTnV5aHNMcWQ1dXFja0Zm?=
 =?utf-8?B?eDE3S085M2RYbEZsSkVuRS9ZMlFMWjA4N3FEeUEvWHhhSzZTd1hqWGt4TWU0?=
 =?utf-8?B?cXRDOUk5MkRwYkUzU2tjL1dVenR6Z0k4MGpYSDJHMUNsOExEamdGZEZMUklB?=
 =?utf-8?B?TmRFMEdWNG1CLzczdkd5aUxQaTcza2VodTBlUmFNMnlhWWhBRysvemR4MTJX?=
 =?utf-8?B?am1Pc2VpMEh1ajE0ei9mYUpubDd4a1k4ZW5sOG9kNlA3KzM4Y25KKzZmTktZ?=
 =?utf-8?B?RlBsK2JVc2VUNWhSekYyclNzYTVlYzVlV0lSSVR0WU8wcHlsVUd3ZW91ZnpM?=
 =?utf-8?B?UFVINHNJTFVWMG12YmRjTDdBRTZmM3pEZmlMWnZsTlJaTFhJUFdXZHYrZXpv?=
 =?utf-8?B?T3hUR0o2R09vNkRDTGUyeDJKSGhReUl5WlhKdHJCOU1ka3p4Z05rVVFxeGZY?=
 =?utf-8?B?VHhHdEtiQTVCRFR5Z21jQXNDRlh2T1ZRWjcxdXlUK21GbHplTnhUME5DRE53?=
 =?utf-8?B?ZjExekY5a1BvdU1mTHpzSWhpbitzQk9vSm1Lc1dOdGZlUEpqczB0YTFzQWhx?=
 =?utf-8?B?c05Dck4wQS9RM0pHRUNNejJvUndhWkt5NnhoeFVOUmFzK3lOK3dQdHB0VnM5?=
 =?utf-8?B?am9jcWxJSDFUY2ZVMWpSSEJyZ0xGV01jK3o1cXV6UjZNNFAwckdGamhwTG5E?=
 =?utf-8?B?YndET0svVFgxRnZ2UWJkait0cjQ1dkZNcHdoWmM4NzBDOWlmRVovcTB0Vy9K?=
 =?utf-8?B?aE0wUFNWOVdYWUFWc01TWE50VmxsRTFWRThnVWM2T0lDcWdPSXBTTEVxbjhP?=
 =?utf-8?B?Y1JhMkxTRE1rZ1hiM3U1M3hKeG5PYktmTWFURzM4Y3VvUXkrQjZKQTF4U3BI?=
 =?utf-8?B?MXZtaExFUUJwWTdlYW5OeUxsNXRrVFdaby9Lb290U1VaZ2IvaE03YkJCSXk5?=
 =?utf-8?B?bHREZFYxRlNpMlU0OTN0Y1VqR08rM3dNaDRSbXZvY0M1Y1Z0cFRKNURmOWZo?=
 =?utf-8?B?V29YbjJaYUVxaGlFL2FxTDhPVS9SMVc4aFp0RHFrbFZodmJCd2NIM1poNEpZ?=
 =?utf-8?B?VHhhUUdQQ2VPbEgzZWttaFVObjc5cGtrU2ZvWGhoTkdkREY4eDBvdlAveVVP?=
 =?utf-8?B?WHRvZDN5SFVMUk9BK0kxMUxOYXRQQ0hwUndEOWhkMG52OWxSV1JScVBoTEk1?=
 =?utf-8?Q?fWBk=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?NWJEbmpDR3pwQTRTb3RQYWM1S2Z2YnJ1L3pLeFUzVzRJQmFBUHRyd0JZMmhX?=
 =?utf-8?B?d1ZlaTkyaGpIMytxVXAxK090N1VVU2dBQ0VOTVlkbUtlb0dYQ3lGUlVZdVFx?=
 =?utf-8?B?NFdMWDZnazJNcHk0TENIL0dGYk90eWRucU1Yem9wdldlWHZ2L1ZxMW5XNUow?=
 =?utf-8?B?TUlxNlNHaXJKdnJVMUgwaEpaRlVSV3YwYnRlejJjVVova2RCejNJQXZxNTBo?=
 =?utf-8?B?aU84VldxRWZaYSsvYUNLL3IxQ2gydHV1QzdWYno5UExQRWY3UUdTcmt4YVlL?=
 =?utf-8?B?MTV3MW43cWpTVHIxbllRdXFRRTluODBwMEhCUzIvLzdaMzR1cDYvd29icU5w?=
 =?utf-8?B?RitvOWMrR2FHZGFya2xCanMweEVTdFU4WElpT1hzZVkwVjNBakk0dnN4SnVW?=
 =?utf-8?B?WU9JTU5FSHhMZ0FTUlZreDZPbUJhNno1VTZBNmtiYmZRWUx6eXcyQ2c5Zy9I?=
 =?utf-8?B?T0tMSHFjVUZpcU41Q0RyUUtIK1JaYzg0NTJMMHdYUkxpV21VQmxzUklmdUVp?=
 =?utf-8?B?MndRT2pIaTY2bEkxT0RsYTZiQTRaOVVjZkdhcnk3Q2c0SGRFeG9FeVJ1TUJZ?=
 =?utf-8?B?Q3FwUUNFM1BWTkdjSWoxaTducEhaNGw1NTdEOHc2NWFGZVVTcms3YU5xVks4?=
 =?utf-8?B?RGdRZlNUK1ZleEhlWnUwU2tZdFZjNVFic2pPK09wYTRxRGVOWjdZd1VsQ0tk?=
 =?utf-8?B?KzBrNTAreTlRVUVUWTl5dHhMTGxtQkxTOEdPenowelN0YUxmWkxWRFJDaTRT?=
 =?utf-8?B?dWpkbW9tTE45ZjM3WStQSDhjQ1FGMzJaYzNKQ2s5d3BDaHhUbi9FTCtNUXBx?=
 =?utf-8?B?alB6K1lSNGN1eVM3NU9VSUhjYkcrc1lmV2pIWnpUU1VoaVN0M3RHdkJSbjdG?=
 =?utf-8?B?bzZPbjJxQ3ZZc25WMFFmUjA3WVRQV1k4RjlOUEZDcDBIRGVVYXZsOGxiY3dz?=
 =?utf-8?B?YmNobXhhRzF6VG90cEZLSmZ4YitMNUtaMkwwaTFKbkdvTEVFK1gvY1FqRCt6?=
 =?utf-8?B?NVVDMlYrTkFHVFB4T0w2UmdhUHJqZU11OXhEWW9zT3M1K0J0Mi9BMTB3ZTR4?=
 =?utf-8?B?dWtCYy9FcUtkcDloQkRMR0FmT0VvZG1HYnhFdTZRenl4M1RiZlJvbXFFZ0ZX?=
 =?utf-8?B?WHJrYnlSaHZsVGYyQ2x5WmYyWU01b1RuVHNKUkdJSndGcVlVNjkwQUdsQTNM?=
 =?utf-8?B?ZTR2MDdITm5TSGs4MkpmdDVodWFPZmVsdmJZQzdmWGxvYStjM1dtdThTNTE5?=
 =?utf-8?B?b3BGK3k4Wjk2M1F1M1RvS0ppS2k5bm4vZC9XVTJIU0lyZlJVZjZ2VE03eHlE?=
 =?utf-8?B?bEd5cGFPUG9reEZKN3F6UVdaeWQvSmxUQzd1NkxtSHdJNXJxaVFMM3Bzelhp?=
 =?utf-8?B?Sk1IaEM1LytkczRhK0lNUktNblFvUXF4TjJaOW5qb2VMZndFdTFVN2FodGxy?=
 =?utf-8?B?M002L01YcGFBc3FDVTA1ZFI0WENZNHdNL1RxaFFGaUc0cVczT0hzRVFMbmJK?=
 =?utf-8?B?UmRqb2xHWmdYUnFBMzdqYW5JbmttNEFTUmZDWjN6QVJnTVU1OVBwd3pqdUla?=
 =?utf-8?B?dHBKNGVFUnBLUnFHazBPZU5ObEd0ZFpLS3F2N0EvTE91QUdzRXlwaXpybFJZ?=
 =?utf-8?B?SlQxUk9qK0RacUZqQXpVSkZwMCt0TVEvK1lMdGNSbWZZRTJ6blJkMDZtUVlE?=
 =?utf-8?B?THBDZXRIR0RKWWVSdFRLMG5aMHZwMnFESXk0d2RiSHdMZFROclFCT1dEcjd4?=
 =?utf-8?B?eFBjeERNdVEwVG1rVk1TazRPdjlBbEJyK1V5NEVRQnlQZUJ2MUN1cUFLbUNC?=
 =?utf-8?B?NExzT1pkYnhNei8vYzl2dDhPRHlJQituY2E5NUhPMEhScVJUUXE2enhkMjdV?=
 =?utf-8?B?eWZHZlluS2FCRnVvd2M2MU5xT25KeEZnbldKZXROK3c1dHVzUVcxK202VVNL?=
 =?utf-8?B?cFBFK0J0cHhCSDU0WjVGSjd1T2J2dmk4aUIvMW0zaDdVYm9XaGRJTGdPd3Ew?=
 =?utf-8?B?ZWR6eVc5MHNsMzVwTkg5dVMwM1dVWDdPV3VzSHVocDNOSDkydFY1V0UxWWlk?=
 =?utf-8?B?ZXJyYTRQZElSSm9Kd3NoMUp4djZkVUl5dmo3Q29MaCtVUk1JekFLUkEzby9m?=
 =?utf-8?B?Z05wRGtUMGpXYTB5U2tHZkpXaUdEeFFvLzNueXBiNUdLTFZkdU81Y0hudDlu?=
 =?utf-8?B?RE9zR0xNMzlkT2dqME1mTENWcm5DYk82Z1lRTmlUYWYrUkFNY2FGc1JiUkI4?=
 =?utf-8?B?NGxUOGFhQmd5QU0yV0Q5SUkvSWk5anAzNWtQYU5pSS9Ud0VQV3A1NWZmYVps?=
 =?utf-8?Q?eiAcpfecQDkpH8VFwz?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22efacb0-170a-4f0f-093c-08db367d7a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 09:01:15.5598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHTvlNEEQL68pnEq0PaEV19eWv1GbacwWhZLqWw6OJiotK+v/9rDYy7w+gfmgaDZwx2+YikJH1KY4EVsExIU5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578
X-Proofpoint-ORIG-GUID: IIHrJvd3sIW9EzNXzM6FziAEVd8hDR2w
X-Proofpoint-GUID: IIHrJvd3sIW9EzNXzM6FziAEVd8hDR2w
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,Shahab.Vahedi@synopsys.com
X-Gm-Message-State: AOitK3OyguQeMfAkzoYHQxVmx1808289AA=
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <449DE09BAE01DB419F0D7A0AFD51E943@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1681717330;
 bh=3D2ehvfPyEAg+5QJoUbYE6ALjTTT1esRE19upbAhkxo=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=lT6gxIJVESggm80AM0Wava1XwEx9fyyzX2pMR2xfOp+edo3IF/3thjbtR/vK0oKJr42
 zJW5ntpRJApG/qqcCAuYt4r456R0usDFEybuMhhUIYasyt+Tvfuj87DKu2CmX/+Ldxgs3
 9Vk7c1QR0TuwUW1MbYUuyAEt5nU6ebWDpjU=

T24gNC8yLzIzIDA4OjUyLCBWaW5lZXQgR3VwdGEgd3JvdGU6DQo+IENDIFNoYWhhYg0KPiANCj4g
T24gMy8yNy8yMyAxNzo0MywgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4+IEZyb206IEFybmQgQmVy
Z21hbm48YXJuZEBhcm5kYi5kZT4NCj4+DQo+PiBTb21lIGFyY2hpdGVjdHVyZXMgdGhhdCBuZWVk
IHRvIGludmFsaWRhdGUgYnVmZmVycyBhZnRlciBiaWRpcmVjdGlvbmFsDQo+PiBETUEgYmVjYXVz
ZSBvZiBzcGVjdWxhdGl2ZSBwcmVmZXRjaGluZyBvbmx5IGRvIGEgc2ltcGxlciB3cml0ZWJhY2sN
Cj4+IGJlZm9yZSB0aGF0IERNQSwgd2hpbGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IG5lZWQg
dG8gZG8gdGhlIHNlY29uZA0KPj4gaW52YWxpZGF0ZSB0ZW5kIHRvIGhhdmUgYSBjb21iaW5lZCB3
cml0ZWJhY2sraW52YWxpZGF0ZSBiZWZvcmUgdGhlDQo+PiBETUEuDQo+Pg0KPj4gYXJjIGlzIG9u
ZSBvZiB0aGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvZXMgYm90aCwgd2hpY2ggc2VlbXMgdW5uZWNl
c3NhcnkuDQo+Pg0KPj4gQ2hhbmdlIGl0IHRvIGJlaGF2ZSBsaWtlIGFybS9hcm02NC94dGVuc2Eg
aW5zdGVhZCwgYW5kIHVzZSBqdXN0IGENCj4+IHdyaXRlYmFjayBiZWZvcmUgdGhlIERNQSB3aGVu
IHdlIGRvIHRoZSBpbnZhbGlkYXRlIGFmdGVyd2FyZHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
QXJuZCBCZXJnbWFubjxhcm5kQGFybmRiLmRlPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFZpbmVldCBH
dXB0YSA8dmd1cHRhQGtlcm5lbC5vcmc+DQo+IA0KPiBTaGFoYWIgY2FuIHlvdSBnaXZlIHRoaXMg
YSBzcGluIG9uIGhzZGsgLSBydW4gZ2xpYmMgdGVzdHN1aXRlIG92ZXIgc3NoDQo+IGFuZCBtYWtl
IHN1cmUgbm90aGluZyBzdHJhbmdlIGhhcHBlbnMuDQo+IA0KPiBUaHgsDQo+IC1WaW5lZXQNCg0K
VGVzdGVkLWJ5OiBTaGFoYWIgVmFoZWRpIDxzaGFoYWJAc3lub3BzeXMuY29tPg0KDQpObyByZWdy
ZXNzaW9uIHdhcyBvYnNlcnZlZCBmb3IgdGhlIEFSQyB0YXJnZXQgYmVmb3JlIGFuZCBhZnRlciBh
cHBseWluZw0KdGhlc2UgMjEgcGF0Y2hlcy4gVGhlIHRlc3QgZW52aXJvbm1lbnQgYW5kIGl0cyBz
dW1tYXJ5IGZvbGxvdy4NCg0KYm9hcmQ6ICBBUkMgSFNESw0KYmFzZTogICByZXBvOiAgIGxpbnV4
LW5leHQNCiAgICAgICAgdGFnOiAgICBuZXh0LTIwMjMwNDAzDQogICAgICAgIGNvbW1pdDogMzFi
ZDM1YjY2MjQ5IEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDIzMDQwMw0KaG90
Zml4OiBuZXQ6IHN0bW1hYzogY2hlY2sgZndub2RlIGZvciBwaHkgZGV2aWNlIGJlZm9yZSBzY2Fu
bmluZyBmb3IgcGh5IFsxXQ0KZ2xpYmM6ICAyLjM3DQoNClN1bW1hcnkgb2YgdGVzdCByZXN1bHRz
Og0KICAgICAyMCBGQUlMDQogICA0MjI3IFBBU1MNCiAgICAgMzggVU5TVVBQT1JURUQNCiAgICAg
MTYgWEZBSUwNCiAgICAgIDIgWFBBU1MNCg0KWzFdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjMwNDA1MDkzOTQ1LjM1NDk0OTEtMS1taWNoYWVsLndlaS5ob25nLnNpdEBpbnRlbC5j
b20vI3INCg0KLS0gDQpTaGFoYWINCg0KDQoKLT0tPS09LT0tPS09LT0tPS09LT0tPS0KR3JvdXBz
LmlvIExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgpW
aWV3L1JlcGx5IE9ubGluZSAoIzI0MSk6IGh0dHBzOi8vZ3JvdXBzLmlvL2cvbGludXgtb3huYXMv
bWVzc2FnZS8yNDEKTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2dyb3Vwcy5pby9tdC85Nzk3MDEw
NS8xODA4Mjg5Ckdyb3VwIE93bmVyOiBsaW51eC1veG5hcytvd25lckBncm91cHMuaW8KVW5zdWJz
Y3JpYmU6IGh0dHBzOi8vZ3JvdXBzLmlvL2cvbGludXgtb3huYXMvdW5zdWIgW2xpc3RzK2xpbnV4
LW94bmFzQGxmZHIuZGVdCi09LT0tPS09LT0tPS09LT0tPS09LT0tCgoNCg==
