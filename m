Return-Path: <bounce+16102+321+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F9477DB31
	for <lists+linux-oxnas@lfdr.de>; Wed, 16 Aug 2023 09:36:20 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=WkLJ/R1agGtpUXoIASTFQduVzusZmulSfJkCwdREppQ=;
 c=relaxed/simple; d=groups.io;
 h=Message-ID:Date:MIME-Version:User-Agent:Reply-To:To:Cc:From:Subject:Autocrypt:Organization:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:List-Unsubscribe-Post:List-Unsubscribe:Content-Language:Content-Type:Content-Transfer-Encoding;
 s=20140610; t=1692171378; v=1;
 b=irDBX7XvR55z9bUnysoRUpoNaZZsWUzSqmgwQJIsaykvLfmze/+VLdiT+SSeKzlmsl0YLbrZ
 ftnhc4NjN55SPU5a6cEQ6v+etd1WOkKggA4U0prFa0ApcAnq6nBOneyVBzpYb5lMEmaE/47/MFL
 dn4mIfDGfFvOsOWjFHlI3muo=
X-Received: by 127.0.0.2 with SMTP id 4gH5YY1809624xvubbc5XFwt; Wed, 16 Aug 2023 00:36:18 -0700
X-Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.155794.1692171377608455291
 for <linux-oxnas@groups.io>;
 Wed, 16 Aug 2023 00:36:18 -0700
X-Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso58616055e9.0
        for <linux-oxnas@groups.io>; Wed, 16 Aug 2023 00:36:17 -0700 (PDT)
X-Gm-Message-State: o6bfQ8uFOkTxyXAbbORy8Mpdx1808289AA=
X-Google-Smtp-Source: AGHT+IHUtfOeK4lw9OBhuMUzkSmWLND4TqqwpqGHAhIPHORtbdpA3VF36VLOYwLzgm1JnBVgn8JnqQ==
X-Received: by 2002:a05:600c:b58:b0:3fb:ac9c:e6f with SMTP id k24-20020a05600c0b5800b003fbac9c0e6fmr665309wmr.38.1692171375452;
        Wed, 16 Aug 2023 00:36:15 -0700 (PDT)
X-Received: from ?IPV6:2a01:e0a:982:cbb0:60eb:1b42:890:194? ([2a01:e0a:982:cbb0:60eb:1b42:890:194])
        by smtp.gmail.com with ESMTPSA id c6-20020a7bc846000000b003fe0a0e03fcsm22837334wml.12.2023.08.16.00.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 00:36:14 -0700 (PDT)
Message-ID: <8ec6b604-f1b8-4178-8bb4-9cd504f381ca@linaro.org>
Date: Wed, 16 Aug 2023 09:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: linux-oxnas@groups.io,neil.armstrong@linaro.org
To: "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Cc: Daniel Golle <daniel@makrotopia.org>,
 open list <linux-kernel@vger.kernel.org>
From: "Neil Armstrong" <neil.armstrong@linaro.org>
Subject: [linux-oxnas] Final removal of Linux Oxnas support
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
Precedence: Bulk
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <https://groups.io/g/linux-oxnas/leave/3934443/1808289/401299499/plugh>
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi All,

If you followed the recent events, the complete Oxnas support will be remov=
ed from mainline
Linux tree in v6.6 following DT & arch-arm removal in v6.4.

The Oxnas support will still be present in the current LTS kernels, and I'l=
l be
happy to help if someone wants to revive the oxnas support somehow.

Finally, huge thanks to Daniel who kept Oxnas alive in Openwrt based on my
mainline work !

I will leave the oxnas mainling-list and the kernel.org git tree alive for
a while.

Thanks,
Neil
--=20
Neil Armstrong <neil.armstrong@linaro.org>
Senior Software Engineer - Linaro Developer Services
https://linaro.org/services


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#321): https://groups.io/g/linux-oxnas/message/321
Mute This Topic: https://groups.io/mt/100775177/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/leave/3934443/1808289/40129949=
9/xyzzy [lists+linux-oxnas@lfdr.de]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


