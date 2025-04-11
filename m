Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E76C3ABC9
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Date:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbckYaGwCRWNjAF8jXjyxMKmB0YCjHmOeTafyjFIiOo=; b=c1vkzDc6vYJPia
	CipYDPZc+bqiFy88a1VivxlgLS5oVk56u26038yADkIgfuZsIC9CFpf0hU6ED69yI8DH3Hq+YjczY
	g+is7I4tQIhGjzFphzUYX8ElFF5WrWDJtoRXaTzTwFdnHAYQ/uYOvzJEkdtJwQ5HkQGMcBNDrbFUD
	wl5kHdd8Wdi2aTXlh2tWDQe1fCA4fepyaRDm83Oq2soyC71NmaFiJrvEkYnhLrRWIWPvp4tL7Lbim
	2jDNCzYB3CONjCetB/pY9U/A3eSj9EsIPLkLthrABKXpsCgy2miJojhR9LdSpyqJd9SWPT9hNLgHV
	3OHJGinHETSDxwe64Nww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlY-000000008Pl-3qea;
	Thu, 15 May 2025 09:20:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HoR-0000000ESRt-0y40
	for linux-i3c@lists.infradead.org;
	Fri, 11 Apr 2025 17:05:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2243803b776so32895325ad.0
        for <linux-i3c@lists.infradead.org>; Fri, 11 Apr 2025 10:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744391106; x=1744995906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
        b=Cv2j2HKlOi7R8T0hKwtMjNpayLIvQuAlmi6vRi69ZpATI+spe/wn2HF8Xqmt55q4UI
         N5epNg+wTri8Ed7wtH6bj0gIVrSSqFUS0QLPI0+oiuRrH1XMPnnt8W+Wk5QURpW27hDu
         xGs/TzT7WUV/ss8nbBIEIPziZJMkvRhYj1trA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391106; x=1744995906;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
        b=WADuQGO+OmMUfzSxRstzu5weuYlL/FDzIJHj5Kh1ggxo4++84FquP2fmn5Cn7YnrBG
         WHQFiZssNtM+ZqXA4ZvuPzQT781yFlO31dP7i4gJCrCpzVY0nyOA0HI2Ymny+yvqCjL6
         MFfwB3Uwqpi+pSeUx53WZYfX0z7YIq+tqebst53VKbthu66Vg8aWvZFCR6CqHLvRxwSg
         KdzKtgwEXq84as0Wx0RlyMNehKlXkVDz2kpf2A0GPWZENgxjVCNwnedKJih5MKsm8aRx
         W7jYS5WQ/0UyPLH3XvHtz4Gj3AatmVxm+tywObY91kFX5XfvdPeReM2acw1uh9fucrVv
         1FYw==
X-Forwarded-Encrypted: i=1; AJvYcCWRtsNdhPRb1Sb/R4G7d7hQidBILu7ykKAhXrdq8C5ckqA7J9nMzGpQYHmaQHWNN6xuuiwLAyebP08=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWFtbIcA0beEm0M0eyMZdtZZg5OJ9NChCy5AGsp+Lv1jBpE1nW
	UUNdsvbC0mJq+EXPB6kEfCZiWIpe19VxJKV6UfKA9h60s1fvzpPV9B9SKISqLw==
X-Gm-Gg: ASbGncvgmKB4yri4VP/lhLfBYIGfnLyNkBHfXgHmaLq8/SzSh6wyk/cK+C/WKIZZc5+
	J2VZ5zXmWOySxCuCKgQ5ZCNWSYa9wa+l5vujQZR/kzqc0wHmxQgznZu2nNDz0cEscuTbZP18xzV
	viPgwh+FbNUt/n5b0qxkMKUOGNpIJt7UJfqiJ95MJqLX/1z2sg89z4Lsw748IS1r/hg1hBBl73q
	6LA0mv+OWifFNgEgRPo4LvlQwRQTv0t5QQ2CKLZBkzOi+uB7atxTfK5taGd45l2IzyLM9cetFTL
	Z0X2J+xtB2crpoUMOwL2c/Cemq6p/DyMgQiN9lsS8JM/iJ5DB9DVYsmEaVhYKI7LvOHqTADzNYd
	ksJw=
X-Google-Smtp-Source: AGHT+IFsxw8IYiWvCcCfohL9OR/GeWdiXtYFPHAC7JyqV95Ksyc9aMccKi6WlaMRFkxD3Uw+BXU/BA==
X-Received: by 2002:a17:902:e5cf:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22bea4efe58mr64393975ad.40.1744391105389;
        Fri, 11 Apr 2025 10:05:05 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93aa3sm52081595ad.149.2025.04.11.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:05:04 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>
CC: Johannes Berg <johannes@sipsolutions.net>, <tglx@linutronix.de>, <mingo@redhat.com>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	<jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, 
	<andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, 
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, 
	<dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, 
	<hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
	<vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, 
	<davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, 
	<parthiban.veerasooran@microchip.com>, <gregkh@linuxfoundation.org>, 
	<jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>, 
	<jdelvare@suse.com>, <linux@roeck-us.net>, <alexandre.belloni@bootlin.com>, 
	<pgaj@cadence.com>, <hpa@zytor.com>, <alistair@popple.id.au>, 
	<linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, 
	<jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, 
	<dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, 
	<linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, 
	<oss-drivers@corigine.com>, <netdev@vger.kernel.org>, 
	<linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, 
	<brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, 
	<bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, <Frank.Li@nxp.com>, 
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>, 
	<david.laight.linux@gmail.com>, <andrew.cooper3@citrix.com>, 
	Yu-Chun Lin <eleanor15x@gmail.com>
Date: Fri, 11 Apr 2025 19:04:43 +0200
Message-ID: <19625cf93f8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
 <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity_odd()
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_100507_267051_12BEC395 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:27 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On April 11, 2025 6:37:35 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On Thu, Apr 10, 2025 at 07:08:58AM +0200, Arend Van Spriel wrote:
>> On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>>> On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>>>>
>>>> This is orthogonal to the change to parity_odd() though. More specific
>>>> to the new parity_odd() you can now do following as parity_odd()
>>>> argument is u64:
>>>>
>>>> err = !parity_odd(*(u16 *)p);
>>>
>>> Can it though? Need to be careful with alignment with that, I'd think.
>>
>> My bad. You are absolutely right.
> Then maybe we can still go with:
>
> err = !parity_odd(p[0] ^ p[1]);
>
> I believe this should still be a fairly safe approach?

Yes. Or whatever the name will be ;-)

Regards,
Arend



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
