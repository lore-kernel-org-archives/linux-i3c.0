Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB356C54754
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKzV7IYkJ7JSrYbBPif6lkGVBk/yd7ESbh17GGs6S+0=; b=3Zo9DXDf8qGubB
	u36MYtIYfkH4JYS+bzbl6STVfvnT1zCKhJNwoSe4ukwvACKkbV26sw2EKwukElriRcq1lUIxYcZwR
	AIWum3tKvuGpXcks6g6P188cxLQxSa8bXzjYW/+UXK2wO7zJIvofvS/EoBjMAcEUVeg6ksTt7anXV
	D+aS1oOQ1gzE7yxHNTsoMau2P6/en2QiCCxNvGNJ1DB47z/brZ6zxB9Yc3QPyFm0WSpfcTASpy+Sb
	kZKLeQGG9jxEVeTw2FRc4vedWs41rR2y01EMiz9rrKRBwMXJhpkxB7MOW2x01LDEe1jaulgg9Mx8A
	roFVPqaLpeP24OGeN3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlU-000000008Ik-0t8k;
	Thu, 15 May 2025 09:20:32 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aOX-00000008DOf-3HRk
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 18:43:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-72c27166ab3so10234a34.1
        for <linux-i3c@lists.infradead.org>; Wed, 09 Apr 2025 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744224208; x=1744829008; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yUFP4lEaxI/UXTQ8hF09KRKSpAvq6LdwMQOtlQ6n0zQ=;
        b=iPUN/r4R7ZucE9H5oTMypeZM8KDC4ORN6xMfPtv2XP2QndJm47BH3Z3cBq8ZMFAdNf
         yGUtRQQLWOX75wy55pPl7OguNPAa+oYVKDUR7Pp7XFqLA0MzB0t14GYMoM0XSoPPfiFb
         XJz89gnkenCqkA8bAWgdW7dGBG4pxR7Man8nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224208; x=1744829008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUFP4lEaxI/UXTQ8hF09KRKSpAvq6LdwMQOtlQ6n0zQ=;
        b=JM+9S02hKHSbS1TxZHJmcItbq7dyffUUvYj/OYG5pXmj/DN+vt4iCv+qL6a2X6RjIk
         vtHsEhK8/Pi0ucEjKjo6FB7uACRuajwtRZ9d20flzd5YqQKBiVAAiY+ij+nOdoLnURDl
         eyu67RljtOwM9O+/6F59t2pQ67kCVoGv5+Vat2OtdcJYjXmjuxLZtnoUb2Dgg5aH5scd
         q6oJLGv2sZF4hpFfYjWxiYdthrvY05++rV8Vg/bjlDemr9wUtEdiqqKw0O7eSUsTj/NN
         u+Waddlxqwc7Kpld74EfN0pkHfUpBEYVpw5I1rJ2x9hKYpvvfQt86J+O7e/N07VoC31l
         Gauw==
X-Forwarded-Encrypted: i=1; AJvYcCWLnZ+k0vqvVs0teKf2AGmZ61d5rF5ut+ZOXQJyW42pJ6Qg3YhFKPF6wx00LD2S4N7YaShEhU8yIw8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPq9fgKZK65T2mgZH69SDW1h6LuYuZBoigpXtHktJgKPJEzQV
	vE1M6B4UlQrFOH43+6OwM3inGW9hVpimDgNZc4yhV9y5D+WMzOCL8MOAcmGuTA==
X-Gm-Gg: ASbGncurUuPtW1fO21M6GSVvR4vwnhJIv9SgfbxzE5VMobUkZUviXEIjWBMG7kgUkQg
	azkfEK11OmcSC22rDWhJGsCrUPzLpxZN9iw2IOnKjXYMBU/VN3ZX6A2Q4qfv8GTETKsnNj5ebx1
	vUaZvectof4PCaSluTXFA6WvzH/Wyabs/oNURUHbcEq+3cNtsvk64R8eJQXS2aI++ACSiZGHek2
	Fcbd+gjg2dk2rSwQvhDY3p5DpVIifqoIfTfb/3q2W2TVzXhEdSdaIUA/qcr7IQOMZPbHv1rtMx/
	SyUS8OrC/3zKm5jfmzHRb3Fyip4zvsB4snPafZ1OHerZgwp/4h6jVXxqO1H1nTvcSxyOkii8oJX
	Ivohh0p5helREbJjP
X-Google-Smtp-Source: AGHT+IF+btWX9Vo26E5xa94gpnRIcQR2MzTl8AHguTxH8TEW16aEw9TQysoZkDfa3NYurrnfcDnCXQ==
X-Received: by 2002:a05:6830:6019:b0:72b:87bd:ad47 with SMTP id 46e09a7af769-72e7baae198mr27677a34.3.1744224208126;
        Wed, 09 Apr 2025 11:43:28 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096cd3764sm325488fac.31.2025.04.09.11.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:43:27 -0700 (PDT)
Message-ID: <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
Date: Wed, 9 Apr 2025 20:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, jdelvare@suse.com,
 linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250409154356.423512-4-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_114329_862368_800A0091 
X-CRM114-Status: GOOD (  11.57  )
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

On 4/9/2025 5:43 PM, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
> index 65281d40c681..15b515b95956 100644
> --- a/drivers/media/pci/cx18/cx18-av-vbi.c
> +++ b/drivers/media/pci/cx18/cx18-av-vbi.c

[...]

> @@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
>   		break;
>   	case 6:
>   		sdid = V4L2_SLICED_CAPTION_525;
> -		err = !odd_parity(p[0]) || !odd_parity(p[1]);
> +		err = !parity_odd(p[0]) || !parity_odd(p[1]);

No need to call parity_odd() twice here. Instead you could do:

		err = !parity_odd(p[0] ^ p[1]);

This is orthogonal to the change to parity_odd() though. More specific 
to the new parity_odd() you can now do following as parity_odd() 
argument is u64:

		err = !parity_odd(*(u16 *)p);

Regards,
Arend


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
