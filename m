Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB23C5475C
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Date:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXac5PpzOksELIWpqKbxY9znQwcSbvVIKROC6dPG05k=; b=kJdBlR3vgA4oNb
	RTPMrxhnaHznOD1HFA3cDlTMkDEI3Pw8SKvVTT01Ox3AmrgXLSzJq7n9TdGpxH8h3bZhk9ATvlZ9F
	FTHeIhkq2DxWCufK6oCKnkRLOAr9f+P6a4/neWwdfJFTq/KPLDiZ6TAQM3SjclG0eT0qUiL8qDLhY
	JkVLfmladYwL18Wd4EdPIWX3KmcyH2WfeJh2mEzWy5jsei6uu/Yk1j4/Zl/mbb4KLVKHuKk2WR06A
	LzTzxDG6KG/q/vxjSyRYP/BbDvBIW+Sl/k0Dd952iP7JZrADDfsrJErB3lhTRtEvSyZuaXCJftmOq
	KZojsJpLujiyZNBUGIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlX-000000008Ms-0vwQ;
	Thu, 15 May 2025 09:20:35 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kAB-00000009FeN-0j50
	for linux-i3c@lists.infradead.org;
	Thu, 10 Apr 2025 05:09:20 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-601e3f2cee1so200718eaf.2
        for <linux-i3c@lists.infradead.org>; Wed, 09 Apr 2025 22:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744261757; x=1744866557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G16oVcschOk1bCBWwdD3ZsJUcsex2zjDzFXRZC7O9eo=;
        b=bTezc2QKtdq3GOWrybi50OtrZ1hXPGEbx1gt4p/0L8Ke0mZxwKp7J5xLcO7OZbOHvZ
         0oxbYgHNkdmGNkQOpcKYnOcq0QFYoOe6kGsgvyNeZntYd360beG21a4DufSaS4Hco6jI
         gLC8F32k5W1COxW1TGksMk38b3z+vGMBmL1sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744261757; x=1744866557;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G16oVcschOk1bCBWwdD3ZsJUcsex2zjDzFXRZC7O9eo=;
        b=sVlcd0UW6+F0PSihsGN/NKVOy59C2ARCISb4qKhk3J3zba8mq5YFSHJzLHaJzB3KCI
         PeXGNIsc8QBcKpmge1B+uX6DPWmGxFCHgGsV1ZI4/5sRXARWqidy8+QGx84/zs/vvlT2
         Ak3bVvDNXImN4c9GTV30qIiPkU+24ZOGhG+i6vgZRuXhnzzZ/N9x1KFTMBVW1t8FWc7J
         kzGy9bp+9lfepP0IbY0+8ouHYcgyHFAZ/95oVOwqkWdGVZAB/DFlsxCNMTX2JvZhi6Yp
         rVRPSgYkzzvf82hEhPy8kfPCbldP8E/xetdr4H19aJkFlN7N7xTMpuN/12GbljqAoU3s
         g2+w==
X-Forwarded-Encrypted: i=1; AJvYcCVlKcK7jTFTNnkmo3pFEWtBhY3xaIaQFWuqgdsm+LAd54Ybvg4R0+xSGdb78NIiWN7QXCbrpx4obIE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0dpRVX7zILx5WwdMnOoEGFwyuZUHxzeSSC+Jda5Z8RpnEEYFe
	IFCC1kV4hLUEi7zkAJYt2skLNGTApvQRnNqln66b5M3EPLipB3xSHneNODae9g==
X-Gm-Gg: ASbGncuy4cXO2YCKaUmjMDt8NE0AZNjy1ap5raNtfHqTA+/7yj3905KodTNwAUeuapr
	OmNZ02vDnsx2Y0oKdyKVJ4aj8zIsLzEYbIHoZKKX+Nr5WtLOeQL+aVhTpkGhxUtUADtQ5LtpeyL
	eidU7WnrzPAMFVldEgIef4qw7WqV5JLT2k/hMo/pKvtpie783UIRpT2T2o8qz0laQ+xesVNsCkl
	aluxUL14Ldr4CYEQsto6ojqUII3DaFuKnTruBVBQGIsdu3L9nO9vXPxGmmQGfMrsBKZVdhQVQ03
	sH4/h8zxobEfFv7PjfmwyP4qm1T2tBn+D1x2vJQR32vJJczaxs4arhBn0b6nqpbX6gqdvwkjdei
	P5jU=
X-Google-Smtp-Source: AGHT+IHf2dIBsgMwlqUxzHqfg0izmCh/XeIh4+y37IHWa4xRZwCt6+2s0H2VCnvp55v7eCTsGxhXjQ==
X-Received: by 2002:a05:6871:3320:b0:27b:61df:2160 with SMTP id 586e51a60fabf-2d0b383616dmr840067fac.31.1744261757422;
        Wed, 09 Apr 2025 22:09:17 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096cd3764sm534917fac.31.2025.04.09.22.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 22:09:16 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>, "Kuan-Wei Chiu" <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, <parthiban.veerasooran@microchip.com>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>, <jdelvare@suse.com>, <linux@roeck-us.net>, <alexandre.belloni@bootlin.com>, <pgaj@cadence.com>
CC: <hpa@zytor.com>, <alistair@popple.id.au>, <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, <oss-drivers@corigine.com>, <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, <Frank.Li@nxp.com>, <linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>, <david.laight.linux@gmail.com>, <andrew.cooper3@citrix.com>, "Yu-Chun Lin" <eleanor15x@gmail.com>
Date: Thu, 10 Apr 2025 07:08:58 +0200
Message-ID: <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity_odd()
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_220919_242990_470FA300 
X-CRM114-Status: UNSURE (   7.29  )
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

On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:

> On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>>
>> This is orthogonal to the change to parity_odd() though. More specific
>> to the new parity_odd() you can now do following as parity_odd()
>> argument is u64:
>>
>> err = !parity_odd(*(u16 *)p);
>
> Can it though? Need to be careful with alignment with that, I'd think.

My bad. You are absolutely right.

Gr. AvS
>



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
