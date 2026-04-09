Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BD3F31E21
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Apr 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfz5is6Zh8tt3t23Fn5AhLeLrU2Pc0lzIV5zO9Sflpk=; b=ssf1UySr6UYKDB0KhFDYrabEID
	GpBstf/CDWW6cfz0nIzkr8x3CJF96fx0qPSXcySUTOHmUFAMqzITZlar73TeoWJHUCFMazQz7SfRW
	lbzcjHti/jIOF+ngsS875eqjTlYH/IttpsxXFvI3t4HyMkcziuSGkybUX+2uGO1uwS6HPEPonsW9g
	y5jZU6KDyy5ZJCmBm2CHQUDZObgbv7ngh0Z2uS+aogUmMDV+JsDrReBmCffLIOiPkbdExmgLRsElu
	Epvgsy5ckQU3UCY/uum9SJpbMAsxbL/8ezzZsoPOTWfF4SbDwDqxpNelkCbQWOOGbIVncGVhSdK4S
	Jk74jggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAq6N-0000000AeUC-0hXD;
	Thu, 09 Apr 2026 14:11:23 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAq6J-0000000AeQP-1FmV
	for linux-i3c@lists.infradead.org;
	Thu, 09 Apr 2026 14:11:20 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-12c2575ff49so1482169c88.1
        for <linux-i3c@lists.infradead.org>; Thu, 09 Apr 2026 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775743870; x=1776348670; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iBWvy/3k/KSqMZVabRNYGr2KZN8bRWRMbJnLKam4a1I=;
        b=DgKsEZlAzBwe/wqxshBiijH3ueQ3fRz1bqc4PZNo1yLMNJT6v3rlqIoWyeCTtCWDAK
         +3DvrXw4HjdAqtjI7zm6dPd5/H5Y4SJkem/cqB5+AMVdmt+hSihGkD+7RFc73b6/MUxW
         89enNIs9SUA0Xgkd1tHizmP4KT0rQTE3ljC3IRcHbyC9wLbNvFMr60RGn5Ijy2H3bJPj
         tPg9ipREM75sIDTYlj4bD2YkEYAFkj6Sm+73HxMM5A26fAFWI/gVeO9OBFePe1RuTeVw
         oKDSWxgnKlCNdVFc2N3ALfk/NP10OAZjJ+MirpMnXsJ6d+bhaGg5HcYGQ4YEIW13M1om
         YKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775743870; x=1776348670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iBWvy/3k/KSqMZVabRNYGr2KZN8bRWRMbJnLKam4a1I=;
        b=JxQcZbWFF5uo4ovEmoNEU23pW5yCoIlW96cf6Wpz7uxvNqickTCdhezu9se8knB+C7
         ajUU3aO/zgoFjAmFow1vVOkJ3swk9sT9zQN/XuoNfS0WoIVGLLWM4sN/xKWhhcuahqiU
         Xzu20GX18d4TuBpKZlYeZR6RTl91/StC+jsE93DII/9jO89Crn/HJ3sAPRYQ1FBshint
         4U5n8ZMbC6SpglS2AQxPxDIuwPebGE9kMGJSpbtbLrIlMIZ0wbmq8RzLZOmCzKxi06pt
         bQrUqGVldaNcg639E1T6PTKGKdzgS6AWTg7SfFnVSsbW7tj8oKAuLU1CNSRsuC04o0LB
         3z3g==
X-Forwarded-Encrypted: i=1; AJvYcCUPKozvE2sMzOzkeNfbFWrrGsqY/2QPRCYtM64oRBFtoggA4xpz0HxPwhbIbmpKHuuudlhOi7NuGuw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5RI3mPWqgxTj8wOMez4ZIrLCuYf6fcg+jwo17upvR0o0GOwcu
	GqebwoXSNcd209DkZ6/OYuYjfJ4cSBlnLKioOZGByN3yGy9queHoTQ5c
X-Gm-Gg: AeBDietHbeHi/K/56Nt4TPx1BS4+BtbHru1E0D+9AmPUnUpWIKwhUH+tQA9c1fxwMmn
	Wh4i7tzHoa1kUcOrHbU7/eg2lF7+2VHDJ6dB3ZdAM6KKgnEWPyDUYLyETqHVIpyptRJtwOS2yWa
	SI2AG6oFMCMMacvWux4XjDDImnA1bk2GfhgUG0FvQan46fIRM+zUc0RuXR7wekwXBJHAJsl4vEJ
	f2zyCMGApGaJJMpGOiI7FboEhj7xZT8yU3063AtYOCWYXysnfH151XXvpLt2fTht4efcixw7ldf
	VeO3hrap943+z8cQK8NOZ7mF/4ZmfSHblOfo+V0hCC4EQjJgM5ef8w2zll77VZPTO4IkQMIwMbr
	x8JA4zWBWq9+tGOVbIGS2rrBQo30yXMdNQkaa9O7bgyUXLQoKct1fD4oqdOy8RUAf+n1xdXkqFl
	iecLfglrgrRdUxkqXMnp1KscIshG2mNjHy2n0ahTZE+rrt0aMu5h23hdRyHAEDmEEViHAq+Imd
X-Received: by 2002:a05:7022:3d0b:b0:12a:6fbb:3353 with SMTP id a92af1059eb24-12bfb6e8cd5mr14610433c88.3.1775743870201;
        Thu, 09 Apr 2026 07:11:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm24752869c88.2.2026.04.09.07.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 07:11:09 -0700 (PDT)
Message-ID: <56c69966-797b-4f5a-b24f-2409b3cf5e30@roeck-us.net>
Date: Thu, 9 Apr 2026 07:11:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] hwmon: spd5118: Remove 16-bit addressing
To: Akhil R <akhilrajeev@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-12-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260409105747.48158-12-akhilrajeev@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_071119_349512_C406845C 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On 4/9/26 03:57, Akhil R wrote:
> The intent of introducing 16-bit addressing was to support I3C, but it
> turns out to be that I3C do not require to read the Legacy Mode register
> nor any specific encoding for page translation. The testing of 16-bit
> code was limited and there are no known users for this feature. Remove
> the sections which are there to support 16-bit addressing and prepare the
> driver to support I3C appropriately.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Guenter Roeck <linux@roeck-us.net>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
