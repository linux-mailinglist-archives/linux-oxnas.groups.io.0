Return-Path: <bounce+16102+208+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D99D6D1D36
	for <lists+linux-oxnas@lfdr.de>; Fri, 31 Mar 2023 11:55:28 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id 8D28YY1809624x3oyEycHqDj; Fri, 31 Mar 2023 02:55:27 -0700
X-Received: from FRA01-MR2-obe.outbound.protection.outlook.com (FRA01-MR2-obe.outbound.protection.outlook.com [40.107.9.85])
 by mx.groups.io with SMTP id smtpd.web10.33975.1679921797282283747
 for <linux-oxnas@groups.io>;
 Mon, 27 Mar 2023 05:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjqmBfIPLlgIhDqxSqtvRIbyYfpdIIm/Af67LexT7ayq6GclhfHm79N6Mamv3gqod5wO8jAjiHgJ9tUowTO2OL7xVTHB7VWb/nkUFzXcnMmk1Gz3tJLzll4sW17We+gjkntE1DpjnTlon3W7oeajmIGpZSOJYjfenwDFqm2vb+ZkV3eF7u4rQJ34YnIGRyJZ+oGhK1QDcH1uJ7s1VMirOwbocaLh6aln4+R/DOphe6G2ZBuKB8/gFt9HVLaxcXAuVDyNDXuKMzTYCNXd8B/pgenWWyAkK+qSuy6W+I6OVxMG3CZUhoVc81s3tJa/FEreercGZT+Y+jqpiNL/sx4TRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVvzJ8c3OeTDYtC3Bdo3EwgLzgZiH5nog31XPUOl6aE=;
 b=faYxJr2yQsVA6xfvtDhiWgFQqQypX0lDgF6s3QgjN+utpidgAhiC9n0x6++FEF0NmWMl6fJ5+A16pJSYpiuiARfmvd3owDCfSTT1bAQ7oXfw8XGAbBMy9yJXZfiYLrmAjpNXryDoLknKOWUZLvEVb36j9J3z35jax+28nBiNGPt8/NH4cX3AhP0hK3Ow+4a8jzYTsHODs6a6SJ+A+mx8HQDAlFDdffcannmOZC7Ud3qQYm8Rz/2X22Ej1E7b54dVHoYOfeE6gygLiEaGpIxd/nhOMW8JMVvm/nTL3ly/fPIYyg7jdLfBSBnaikcm0EvNF215asfiA3U/z8N+u+P4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
X-Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1972.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 12:56:34 +0000
X-Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%5]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 12:56:34 +0000
From: "Christophe Leroy via groups.io" <christophe.leroy=csgroup.eu@groups.io>
To: Arnd Bergmann <arnd@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
	<guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, Stafford
 Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller"
	<davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig
	<hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>, "linux-snps-arc@lists.infradead.org"
	<linux-snps-arc@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-oxnas@groups.io"
	<linux-oxnas@groups.io>, "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>, "linux-hexagon@vger.kernel.org"
	<linux-hexagon@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org"
	<linux-m68k@lists.linux-m68k.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-openrisc@vger.kernel.org"
	<linux-openrisc@vger.kernel.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "linux-xtensa@linux-xtensa.org"
	<linux-xtensa@linux-xtensa.org>
Subject: Re: [linux-oxnas] [PATCH 06/21] powerpc: dma-mapping: minimize for_cpu flushing
Thread-Topic: [PATCH 06/21] powerpc: dma-mapping: minimize for_cpu flushing
Thread-Index: AQHZYKW9d2G2JK/q8UmVnlxcCSHhtq8OldGA
Date: Mon, 27 Mar 2023 12:56:33 +0000
Message-ID: <52eef604-085e-acf9-f3ee-41ba9d8441d2@csgroup.eu>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-7-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-7-arnd@kernel.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1972:EE_
x-ms-office365-filtering-correlation-id: d0867b8d-c8c3-4f43-5db7-08db2ec2b18b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 
 qjio6wuLg07Oepj6Kj2xS+iD8Q/IEIN8JXzCHiVet4cNX/nMkmuKnyQARLEQyWvJ8hUz/vGnJprBgzyLFlpdocHFrRYEYjHna5V7r7Cw0sRSovRuPnsOTo8NqSCzvXrLZVKrQp9ZsA10JCwfGJEZm0BE0OTrTsptHdD1a2GH4Pz2VEwHAHtrKd+lhz2SMOXbjIs3RH/b8NIEk00eFcSN99Wcsmrgfq/LsynXZcSfbA1+AUJ+Ry8rCfIiKAKSuun6m8IVPiu5hCT4jXkxwp5p0KBigw5Cp661XmteGxA/HayFxqqStb+1EY7XuGsccIigC3xthioXS1pG40ga4QW3UZtEq/tO4IeCzinAPG79NIKSFXeFpBeRW2K7oN1cbobezP3alz1f65Ttnz+tUuhl3bpFGshmLKzaSx9YN0wQKwLNtr8PUDxor6jTGS3e3ITrbRxZ1T9mulnOrBsh9YPuq3UeARfKuFZINRpDtEbBqCNlmj7Rxe5nd4ZepxBAzlwxTxKgekf1XQqjgptIutTNFjo/dKpjFirkCCRqP1lwsskOXbXFkmYxB3Qnwi75XGKoTGFd3Udvy4qlV7mxLbgwnNi+HI6I7rNY9xgVmCCFDdWrYT/ytIcH2r2N07XXgO2BATtbMphtRfQqgjM4pNMQzjcN2hC+6AmPm3Rc+qU/9seOKrp0TaTc8XrEbmRB9Ued
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U21Pd3llNUJFYVFRL2dWWlA3NFdyRjRhT2cwRXFCMnVMUmlmdXJPeVVPVVRD?=
 =?utf-8?B?bzRpc2FsZmpac2NkOWxzL3NIUW84U05lTk9XdEdpS2tlaXo2Vm9kRE0vdjFQ?=
 =?utf-8?B?L2FCbEVTVStiaGtFVlhQTmdUcG5zZVkwS1J2YTJ2ZTJPRTd1dUlRNUJmUlNx?=
 =?utf-8?B?R2d5NkoydXFEcVdQWTh1MXlHTkJVM3cyWnJ4bjd3SS8rMHJzcW80ZklHcjNR?=
 =?utf-8?B?SmJhNmRJNFBJTlMyb3U1QnRpSWhJcVpsQVp4YkNuVmFxUlZYemcwUkZVNUo3?=
 =?utf-8?B?ZE5tZFcrLzFMaEJxNGZVeTRBeHFiQVpYVjN2NThPaHhXOGZ6Q3h5bE9UQi9w?=
 =?utf-8?B?UnFRalM0b0ZnQTVsckRNaWtNZWJIZHArdEhmMm1BOHdtYVMwdGpnUUVSNkZG?=
 =?utf-8?B?cEZ0NTFWV3BUV1dxNE5jcUl3ejhrZmdPY0cwRVRzcHhQS2krVUJTYXJ1ZFQ2?=
 =?utf-8?B?WEVRc2o0aGd2YzZ5VnQ3TGg2ZTkxMXVEcngwUDdDWGFQNXp5YzM4OW5PZjJM?=
 =?utf-8?B?dlpFazVUWjRJa2NVTEI4NlFPTElPMENpSlZ6clJGMDB5bUE2VWlVY0g0bXJi?=
 =?utf-8?B?RDMrYWk5NnM3em9lRkZrYUo5cncrSU53TENpazRnWVpDS0dtTWJQVm01WkNZ?=
 =?utf-8?B?MnRKUzNjSG0rNS9xMjU0LzdIRjN6QkhCaGpBSkFhVitnM0FuVnRuQm50cnc0?=
 =?utf-8?B?dU1IMVlsZE8yem5mdU9MSUhzUUhOVU1TTy9JcWpnWjF2UFRsV0FXNFIzUkNS?=
 =?utf-8?B?ZGlydUViTDJaRlRiR0dGNlNWMHhFVWJjRVZaWUJlR0hDN3VJd3N6UXBnMVZZ?=
 =?utf-8?B?RGQyUnBMZitmNlEwMlNpTEh5UmM3WmliakFoODV4NDFnaFhha3VhbEtuSEFS?=
 =?utf-8?B?MzNZMDlYQys0dG1RUk5tbEZtWW5SR0QvZXUrS2R3MmF0MkJwbEJRNUx3VFpl?=
 =?utf-8?B?TFl1bUI2bS9tOElxRmo5RW45cXdOc0U4cGJEODZjYjFDZGZRWXZoOXNCRDVZ?=
 =?utf-8?B?TmZpeUhGM29CVnFhN0MyS1lFSWFPK2hpRGpOakVnSW5FS01sdmJxTTJYWHZK?=
 =?utf-8?B?NUJHVlJMQnhQdTNKSC9rWnpBU2RSQy9sc3dHMUM1cGVheFJrdE5BMTZrUllS?=
 =?utf-8?B?MCt5WWFIM1ZIbWxxSGJLZjV5Nk13Y1FJTmdOZHUxNkFjU2lrdnk0WjdTOG5K?=
 =?utf-8?B?TFJZUHZkakVtY3VRZTJORUtkdUYrSWxWOWtBSHJ1YzZ5YjlQM3hxSjJicHNM?=
 =?utf-8?B?UGdVRXRrVTFlK3RZVlNCa01ZUG9nb2hMeXJWM1ZjcDR5TDRnZ043anRFc25T?=
 =?utf-8?B?aXVjelpRV2hwdStaMlh6T0FZM1VQZEFMcW82SHBhUjBKT1lEaXdHVTZVdnRV?=
 =?utf-8?B?Vk5uL2VDSmZ3ZCtKSFN5eWt1aUd5Y0duZHZLbENOV08wdXB3bHl4cEgvYk1S?=
 =?utf-8?B?R213N1MxOUJYUis5TlFjYktPK21Oam9kN2l0TGwxOU9oMkZySmEwaEpGa2kr?=
 =?utf-8?B?aVo4ZE5wSHJnNEgzRHFLV3hScCsvTW5rWDJlbWpHVll0SitXWFc1ZWRITlo2?=
 =?utf-8?B?ZDdFazRvZVZrU2QyQlE2S2lIOUp3OUFDOVR1azJ1ZXpZVHRtNWFrUjhKRElz?=
 =?utf-8?B?MDNjUm5JdktVQ20wb0RCNko2RVRGUFBYOVlxM3RtL2lBTDdOWXpEVWwwaHJK?=
 =?utf-8?B?VUcwK1VHMkh6MitucSs1b0oxU1VraEJINmNLcW84ZWpyR2VvblRiTW1MbUts?=
 =?utf-8?B?M2RqKyt6VzREaDNDWmNOQm1RK3YzWkZOSk1vRW5SUFJ1ODhNS1VsdlFIRmNv?=
 =?utf-8?B?aTBmZUFnNTFSS25JVzc0VVdMeVBiVnVUdHFVMWZ5UkFsd0NIZDR3YmpzWllt?=
 =?utf-8?B?ZjBleEo2eFk1TGtUdFQrMnVLcGVFMjJGWVo4c3NlOElybDcwVFFMZWpLbXgz?=
 =?utf-8?B?clN4aWdpWmJhWTIzVFlrODZKcFdpaDVMeVhCcTF1Z0NydjhWUlFRay85SEpN?=
 =?utf-8?B?b1J3UCtlVGlxVC9iLzZHdkFmTmdxVzZ4THBuRm9JUGY5eENqK3BYQ3lreTcr?=
 =?utf-8?B?bWgyOCtqZjg4QzNhdG9DcnJzM0hvV0szeEFMRXZsVFh0MU5QYTlUcURiVWZw?=
 =?utf-8?Q?GJgmr+ipC3mu5/Cenhiq6K5rg?=
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d0867b8d-c8c3-4f43-5db7-08db2ec2b18b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 12:56:33.9768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/JhzXlD5xibvtsdaXaFhi05JmtVLGd1bnHgCsgst3MB/N2to3U1PBItQxXGO42CAkqUHP3pmpQwW5EyOdmbUVM/ROM8FMpf8kL2F8tpFO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1972
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,christophe.leroy@csgroup.eu
X-Gm-Message-State: F6VUeA8gYTQV0WSpoo4rx4R7x1808289AA=
Content-Language: fr-FR
Content-Type: text/plain; charset="utf-8"
Content-ID: <5815D0CB14B71F41946F2AF708C5275A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1680256527;
 bh=ZTbd9qvC62Q63mzFGQ0Fiuvzcj7UmX97BbvBeUjg2es=;
 h=CC:Content-Type:Date:From:Reply-To:Subject:To;
 b=Qrr+oOKWZFuJoaNDeHw7jklkKP3eAUqO51MpqVx3dbss7lLzsS7GebRcQItzk2CeGrS
 nVhdpT6fGXXIs6XfNrqvd4n7G6t95fNYiUCHZ3b7hiu2G2MRQR2EH8a+5Hd3e8fh8BzWJ
 ZYAoixS0r5hgjv2r0y/mlUxDXJLrN1MmDms=

DQoNCkxlIDI3LzAzLzIwMjMgw6AgMTQ6MTMsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IFRoZSBwb3dlcnBjIGRt
YV9zeW5jXypfZm9yX2NwdSgpIHZhcmlhbnRzIGRvIG1vcmUgZmx1c2hlcyB0aGFuIG9uIG90aGVy
DQo+IGFyY2hpdGVjdHVyZXMuIFJlZHVjZSBpdCB0byB3aGF0IGV2ZXJ5b25lIGVsc2UgZG9lczoN
Cj4gDQo+ICAgLSBObyBmbHVzaCBpcyBuZWVkZWQgYWZ0ZXIgZGF0YSBoYXMgYmVlbiBzZW50IHRv
IGEgZGV2aWNlDQo+IA0KPiAgIC0gV2hlbiBkYXRhIGhhcyBiZWVuIHJlY2VpdmVkIGZyb20gYSBk
ZXZpY2UsIHRoZSBjYWNoZSBvbmx5IG5lZWRzIHRvDQo+ICAgICBiZSBpbnZhbGlkYXRlZCB0byBj
bGVhciBvdXQgY2FjaGUgbGluZXMgdGhhdCB3ZXJlIHNwZWN1bGF0aXZlbHkNCj4gICAgIHByZWZl
dGNoZWQuDQo+IA0KPiBJbiBwYXJ0aWN1bGFyLCB0aGUgc2Vjb25kIGZsdXNoaW5nIG9mIHBhcnRp
YWwgY2FjaGUgbGluZXMgb2YgYmlkaXJlY3Rpb25hbA0KPiBidWZmZXJzIGlzIGFjdGl2ZWx5IGhh
cm1mdWwgLS0gaWYgYSBzaW5nbGUgY2FjaGUgbGluZSBpcyB3cml0dGVuIGJ5IGJvdGgNCj4gdGhl
IENQVSBhbmQgdGhlIGRldmljZSwgZmx1c2hpbmcgaXQgYWdhaW4gZG9lcyBub3QgbWFpbnRhaW4g
Y29oZXJlbmN5DQo+IGJ1dCBpbnN0ZWFkIG92ZXJ3cml0ZSB0aGUgZGF0YSB0aGF0IHdhcyBqdXN0
IHJlY2VpdmVkIGZyb20gdGhlIGRldmljZS4NCg0KSHVtIC4uLi4uIFdobyBpcyByaWdodCA/DQoN
ClRoYXQgYmVoYXZpb3VyIHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAwM2Q3MDYxN2I4YTcgKCJw
b3dlcnBjOiBQcmV2ZW50IA0KbWVtb3J5IGNvcnJ1cHRpb24gZHVlIHRvIGNhY2hlIGludmFsaWRh
dGlvbiBvZiB1bmFsaWduZWQgRE1BIGJ1ZmZlciIpDQoNCkkgdGhpbmsgeW91ciBjb21taXQgbG9n
IHNob3VsZCBleHBsYWluIHdoeSB0aGF0IGNvbW1pdCB3YXMgd3JvbmcsIGFuZCANCm1heWJlIHNh
eSB0aGF0IHlvdXIgcGF0Y2ggaXMgYSByZXZlcnQgb2YgdGhhdCBjb21taXQgPw0KDQpDaHJpc3Rv
cGhlDQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL21tL2RtYS1ub25jb2hlcmVudC5jIHwgMTggKysr
Ky0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2RtYS1ub25j
b2hlcmVudC5jIGIvYXJjaC9wb3dlcnBjL21tL2RtYS1ub25jb2hlcmVudC5jDQo+IGluZGV4IGYx
MDg2OWQyN2RlNS4uZTEwOGNhY2Y4NzdmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0v
ZG1hLW5vbmNvaGVyZW50LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2RtYS1ub25jb2hlcmVu
dC5jDQo+IEBAIC0xMzIsMjEgKzEzMiwxMSBAQCB2b2lkIGFyY2hfc3luY19kbWFfZm9yX2NwdShw
aHlzX2FkZHJfdCBwYWRkciwgc2l6ZV90IHNpemUsDQo+ICAgCXN3aXRjaCAoZGlyZWN0aW9uKSB7
DQo+ICAgCWNhc2UgRE1BX05PTkU6DQo+ICAgCQlCVUcoKTsNCj4gLQljYXNlIERNQV9GUk9NX0RF
VklDRToNCj4gLQkJLyoNCj4gLQkJICogaW52YWxpZGF0ZSBvbmx5IHdoZW4gY2FjaGUtbGluZSBh
bGlnbmVkIG90aGVyd2lzZSB0aGVyZSBpcw0KPiAtCQkgKiB0aGUgcG90ZW50aWFsIGZvciBkaXNj
YXJkaW5nIHVuY29tbWl0dGVkIGRhdGEgZnJvbSB0aGUgY2FjaGUNCj4gLQkJICovDQo+IC0JCWlm
ICgoc3RhcnQgfCBlbmQpICYgKEwxX0NBQ0hFX0JZVEVTIC0gMSkpDQo+IC0JCQlfX2RtYV9waHlz
X29wKHN0YXJ0LCBlbmQsIERNQV9DQUNIRV9GTFVTSCk7DQo+IC0JCWVsc2UNCj4gLQkJCV9fZG1h
X3BoeXNfb3Aoc3RhcnQsIGVuZCwgRE1BX0NBQ0hFX0lOVkFMKTsNCj4gLQkJYnJlYWs7DQo+IC0J
Y2FzZSBETUFfVE9fREVWSUNFOgkJLyogd3JpdGViYWNrIG9ubHkgKi8NCj4gLQkJX19kbWFfcGh5
c19vcChzdGFydCwgZW5kLCBETUFfQ0FDSEVfQ0xFQU4pOw0KPiArCWNhc2UgRE1BX1RPX0RFVklD
RToNCj4gICAJCWJyZWFrOw0KPiAtCWNhc2UgRE1BX0JJRElSRUNUSU9OQUw6CS8qIHdyaXRlYmFj
ayBhbmQgaW52YWxpZGF0ZSAqLw0KPiAtCQlfX2RtYV9waHlzX29wKHN0YXJ0LCBlbmQsIERNQV9D
QUNIRV9GTFVTSCk7DQo+ICsJY2FzZSBETUFfRlJPTV9ERVZJQ0U6DQo+ICsJY2FzZSBETUFfQklE
SVJFQ1RJT05BTDoNCj4gKwkJX19kbWFfcGh5c19vcChzdGFydCwgZW5kLCBETUFfQ0FDSEVfSU5W
QUwpOw0KPiAgIAkJYnJlYWs7DQo+ICAgCX0NCj4gICB9DQoNCgotPS09LT0tPS09LT0tPS09LT0t
PS09LQpHcm91cHMuaW8gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuClZpZXcvUmVwbHkgT25saW5lICgjMjA4KTogaHR0cHM6Ly9ncm91cHMuaW8vZy9s
aW51eC1veG5hcy9tZXNzYWdlLzIwOApNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vZ3JvdXBzLmlv
L210Lzk3OTcwMDk4LzE4MDgyODkKR3JvdXAgT3duZXI6IGxpbnV4LW94bmFzK293bmVyQGdyb3Vw
cy5pbwpVbnN1YnNjcmliZTogaHR0cHM6Ly9ncm91cHMuaW8vZy9saW51eC1veG5hcy91bnN1YiBb
bGlzdHMrbGludXgtb3huYXNAbGZkci5kZV0KLT0tPS09LT0tPS09LT0tPS09LT0tPS0KCg0K
