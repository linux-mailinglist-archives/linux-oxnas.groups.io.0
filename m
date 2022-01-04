Return-Path: <bounce+16102+146+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id B99CC483DC0
	for <lists+linux-oxnas@lfdr.de>; Tue,  4 Jan 2022 09:10:36 +0100 (CET)
X-Received: by 127.0.0.2 with SMTP id 5xwqYY1809624xSPDjKHo9PM; Tue, 04 Jan 2022 00:10:34 -0800
X-Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.4019.1641283832882819785
 for <linux-oxnas@groups.io>;
 Tue, 04 Jan 2022 00:10:33 -0800
X-Received: by mail-wm1-f44.google.com with SMTP id c66so22669075wma.5
        for <linux-oxnas@groups.io>; Tue, 04 Jan 2022 00:10:32 -0800 (PST)
X-Gm-Message-State: 5Gx5iMyfPmZ3piC38HUu9aA4x1808289AA=
X-Google-Smtp-Source: ABdhPJzVm6KI+SLycqoUEYxG88WD4gSOy9bPBwev6wkRs2Miuna0OdrNAxJvQoB+x6en4DT9qz+0xA==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr41519598wmj.35.1641283831093;
        Tue, 04 Jan 2022 00:10:31 -0800 (PST)
X-Received: from ?IPv6:2001:861:44c0:66c0:f6da:6ac:481:1df0? ([2001:861:44c0:66c0:f6da:6ac:481:1df0])
        by smtp.gmail.com with ESMTPSA id l16sm42009745wrx.117.2022.01.04.00.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 00:10:30 -0800 (PST)
Subject: Re: [linux-oxnas] [PATCH 0/3] ARM: ox810se: Add Ethernet support
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
 linux-kernel@vger.kernel.org
References: <20220103175638.89625-1-narmstrong@baylibre.com>
 <20220103200637.0b9d7e4f@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: "Neil Armstrong" <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <151bbcee-2f3b-4454-4244-523917cd4900@baylibre.com>
Date: Tue, 4 Jan 2022 09:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103200637.0b9d7e4f@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,narmstrong@baylibre.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1641283834;
 bh=G83Pt81jP2Vbfk7bply1BB4dAomQrLQRHOAidoZlKtc=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=qGRCHId9b8s9aUIAULfR/uFWiiui2k1rkxwvV1ioEkBRN4TwNHZVw3mRAA7fOBCZ3ld
 fN46jAw2w66GJnCDvO5UYV2aHBQPMDjvyxzqxEZdo6nyphMt6iKcl16JnufGHig7pnDSj
 pY3YzaKhC42WHyjGTmnBsxoxDs/c53izZH8=

Hi,

On 04/01/2022 05:06, Jakub Kicinski wrote:
> On Mon,  3 Jan 2022 18:56:35 +0100 Neil Armstrong wrote:
>> This adds support for the Synopsys DWMAC controller found in the
>> OX820SE SoC, by using almost the same glue code as the OX820.
>>
>> Neil Armstrong (3):
>>   dt-bindings: net: oxnas-dwmac: Add bindings for OX810SE
>>   net: stmmac: dwmac-oxnas: Add support for OX810SE
>>   ARM: dts: ox810se: Add Ethernet support
>=20
> Judging by the subject tag on patches 1 and 2 and To: I presume you
> intend this series to be merged via net-next? Can you please repost
> with patch 3 CCed to netdev as well? It didn't register in patchwork.

It was on purpose, I planned to push the DT through arm-soc, sorry it wasn'=
t
explicit in the cover letter.

Neil


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#146): https://groups.io/g/linux-oxnas/message/146
Mute This Topic: https://groups.io/mt/88117936/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.=
de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


