Return-Path: <bounce+16102+57+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from web01.groups.io (web01.groups.io [66.175.222.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4D7A8B9
	for <lists+linux-oxnas@lfdr.de>; Tue, 30 Jul 2019 14:38:41 +0200 (CEST)
X-Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk [172.104.155.198])
 by groups.io with SMTP; Tue, 30 Jul 2019 05:34:29 -0700
X-Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
	by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <broonie@sirena.org.uk>)
	id 1hsRKk-0007Qu-Ca; Tue, 30 Jul 2019 12:34:26 +0000
X-Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
	id 8BEEC2742D06; Tue, 30 Jul 2019 13:34:25 +0100 (BST)
Date: Tue, 30 Jul 2019 13:34:25 +0100
From: Mark Brown <broonie@kernel.org>
To: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>
Cc: kernel-build-reports@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
	linux-oxnas@groups.io
Subject: Re: [linux-oxnas] next/master boot: 265 boots: 17 failed, 184 passed with 64 offline (next-20190730)
Message-ID: <20190730123425.GB4264@sirena.org.uk>
References: <5d403574.1c69fb81.14163.65d3@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <5d403574.1c69fb81.14163.65d3@mx.google.com>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: Bulk
List-Unsubscribe: <https://groups.io/g/linux-oxnas/unsub>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,broonie@kernel.org
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1564490319;
 bh=ndcfCsU9y3RlifdXBKACbafHymLfdCg1FCRyDzTMAqI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=AJAZ831mFbfD0FLUFkG7iqre1kTR6ytK8LHKp5ZLjl3JcQrH11NY8M8rNINEoVRZF3v
 TUsi2JvFjen9VobqCq+BIS2NdNfI4mYM76lI9x6126Swb439CWmFA5XFzcraUUz8tNy5w
 f27SnppXcSuw5BFv+EJCwXzcRkX4P1VjLVI=

--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 05:17:56AM -0700, kernelci.org bot wrote:

> Boot Failures Detected:
>=20
> arm:
>     oxnas_v6_defconfig:
>         gcc-8:
>             ox820-cloudengines-pogoplug-series-3: 1 failed lab

For some time now -next and mainline have been failing to boot on
Pogoplug 3 with the oxnas_v6_defconfig, the kernel seems to start fine
but fails to parse the ramdisk it's passed:

08:50:02.086589  <6>[    7.719854] IP-Config: Complete:
08:50:02.087213  <6>[    7.723330]      device=3Deth0, hwaddr=3D0a:a2:89:2=
7:10:1b, ipaddr=3D10.201.4.144, mask=3D255.255.0.0, gw=3D10.201.0.1
08:50:02.087413  <6>[    7.733409]      host=3D10.201.4.144, domain=3D, ni=
s-domain=3D(none)
08:50:02.088056  <6>[    7.739499]      bootserver=3D10.201.1.1, rootserve=
r=3D10.201.1.1, rootpath=3D
08:50:02.088248  <6>[    7.739504]      nameserver0=3D10.201.1.1
08:50:02.129966  <5>[    7.752025] RAMDISK: Couldn't find valid RAM disk i=
mage starting at 0.
08:50:02.130381  <4>[    7.759616] List of all partitions:
08:50:02.131333  <4>[    7.763363] 0100           65536 ram0=20

Possibly an issue with the ramdisk getting overwritten or something?

Full details for today's -next can be seen here:

	https://kernelci.org/boot/id/5d4004bb59b51489d631b28d/

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.

View/Reply Online (#57): https://groups.io/g/linux-oxnas/message/57
Mute This Topic: https://groups.io/mt/32653331/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub  [lists+linux-oxnas@lfd=
r.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AOVAACgkQJNaLcl1U
h9ALMgf/UsXvdF4Sayi9hNUwwm0wCOJ9dB1n8L76v9DjPI1cN8MvrF+3M3HS7M7S
6jNyB7dFoxrMILacFV4Co45NcBMF+ZgeJjPcWDHpF/vwj0XsV8d2C9aIvdLpqdVy
Jh65+wIkFnTPWhrjTzFUxAlWclv/6i7ZBBe42oC79SInfsieyNH5V1OMoO01XI7i
CyTqDXmbQL72Nmp2r5jCi/SwrC5Sh1xYWVFynDoyGVZieOr8oQOIsRyaDzqAj+nc
Zqw0nmzkVJzkBYqqSs+P4IaD5BKrWUwiofTMspxnAPXt8X5K57GfXvgswGxBNvhE
4ut4elXlKKD4+AwZAiwwAe05rE3iCA==
=+oW9
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
