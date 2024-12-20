Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E18DE7718C
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Dec 2024 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Er4a5EtWWhF65mCd52ivDRXNjaq9KR38Q/UDnXk9Qg=; b=yQVJAdMMa/j5SA
	qYQ+Pn+wr/hgBBagykd5qBztZkOUyipvVZuS06bH4qzuRia4caIKp4UKXHlXmmQhS1XYYgb85zVd6
	h9kAJEEgIAL1TrB3RDl8rEDQUlvvtRGwHYzmkBn3HTtfu6/GeU/MIT+sXLyFIYD9YAGyq1hDO0+75
	aLbR84i1cZCkh7+x6LnfSzSepc2u5cVh5rB2NrzVQkcSXuk/1/ChPIxp2f43LPexd6ZmAvSUz2g5W
	XcFrJzPaCeFDXLpE46YN2rvKx7aGb5+TTxXDmaOW26eueNUgnliVPqGoUnB5QON4uqP4+B7aKABal
	M3WK+TnsWoPEloRIH7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOes0-00000005JU5-07Iu;
	Fri, 20 Dec 2024 15:24:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOerx-00000005JTN-1Q7z
	for linux-i3c@lists.infradead.org;
	Fri, 20 Dec 2024 15:24:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21670dce0a7so24248505ad.1
        for <linux-i3c@lists.infradead.org>; Fri, 20 Dec 2024 07:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734708288; x=1735313088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vaPwXdSGxTikOreprKI54nLBPwiu4ErSEtGhCrMqEGo=;
        b=YNMnMkUeRYBENulMeVnOyRUN/5UBPQtT12XkusV787nydn8DpLgHkLLI1Fas+5O+kx
         5ZlOr09TYQbd347sWEadG7kbgRdMwU3Ymfv2bZ5RZzE2wr6RAIG9ydlCXN9qFhfE+r9u
         ut6avyxQ5TGrS++ajZG+UoejyI0UgUrkpu5xWFx7l8y294QHURvLWv5yWOxC9olBL24H
         FrdyiPMa8mwgBBjMT1AVv6W+3ko5rU0cFAo7JCw0zUjKsS57mCB5pjB7ds/m1oNaVdt1
         GDPaaExyjCQWQq6Jhf0X4GNLvvwyzZCSrr0NONnosaeSre6yPgW6CqSqAiA5MxrOGAhh
         ZUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708288; x=1735313088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaPwXdSGxTikOreprKI54nLBPwiu4ErSEtGhCrMqEGo=;
        b=JOcocstf3ieaEZHleNFR7SH7UA+DosEEmaRtZks6wJ9aexCQm+7+0kDlMyHJK28BZH
         HTagGNCfcu0dShIyXSrDikQ1Tq4bN9p1C59Pa3F1A8bQYqIQwtG1toCLhjWOnGmvtH9D
         FbSIerEYDSmgoyxGqkme4UWKx+t1Jm4+VmcVndQjX7WT4BjJuIDWAiPYWLAaPx7Vep31
         nzOJCiXE6yDMHE2pvafQ86L5zQlAHT/RUPHat721z36V2/xl5kKk9hHfpLJUJWsFs4No
         QaSNgKWfNSizEIpuTKozjlUvcTgXYC84hmLF+G18d5Oqtqjm1p3TSeJUBf8e6+W1BOoD
         4yUA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1GU5vCgDPr752HGpr4MSJlQwYWHrv6JQntp3+sENC1N56HxUGA8Svy/YSUimLQ6Ef+CoVICoLLE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoDDxBgz7shqHNdW9O7oCMl5EZzyQp/E+xgOub3gjnNchCTf5b
	SuXowMv6TAY4/Xpjj0O9JhDXNoazzqopy2A1xjo9JyxO30dYz3lw
X-Gm-Gg: ASbGncvfumikYyC3gIuiBRg0MnyOTB60Nid61+vYoKg2UGOQFeV6KMKOjwlQ66+QLAv
	moR+r6smhX8khiT0zkVFQJEwslGxyjYrEKhhjrlptD1GXxl1TkIX3g2QXAKLrTTrT31wsZWMVe2
	QEs40oKcNZ11hXuTXCn4OWbePd0lLMjs57AkM7mQ+9njsFCbnORKTaO3kedbrS9elqUJDqg2kyi
	Dx4RbfUvrqU5lm330CRJiHtE5vMTNjkEeIHiWcD61tlzJdmaLEkIAh2yMnKqqo3J8k+/y5p7kwm
	0wFe92ehsT8N+QEmHtc/shuVvZyH4A==
X-Google-Smtp-Source: AGHT+IFc0tDBQIExTRgAU/UOyXBBhZH4Q7YMr6TicyInb9pCbsMo+HAPau1++hfyct8bVkzFIedrww==
X-Received: by 2002:a17:902:cf0e:b0:216:3dc5:1230 with SMTP id d9443c01a7336-219e6f13cb9mr51010145ad.42.1734708288133;
        Fri, 20 Dec 2024 07:24:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962defsm30344895ad.57.2024.12.20.07.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 07:24:47 -0800 (PST)
Message-ID: <d1d5cfa4-b2b0-470f-a9aa-88f7b1266e5f@roeck-us.net>
Date: Fri, 20 Dec 2024 07:24:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT RESEND 2/5] hwmon: (spd5118) Use generic parity
 calculation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>, linux-i3c@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
 <20241220113335.17937-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241220113335.17937-3-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_072449_385882_6FFB17AA 
X-CRM114-Status: GOOD (  15.09  )
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

On 12/20/24 03:33, Wolfram Sang wrote:
> Make use of the new generic helper for calculating the parity.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

I just noticed I replied to the original version, so here it is again:

For the record:

Acked-by: Guenter Roeck <linux@roeck-us.net>

I don't care about the function name, so please retain the tags if/when
changing it.

Thanks,
Guenter

> ---
>   drivers/hwmon/spd5118.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 6cee48a3e5c3..07ab3a47b00c 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>   	}
>   }
>   
> -static inline bool spd5118_parity8(u8 w)
> -{
> -	w ^= w >> 4;
> -	return (0x6996 >> (w & 0xf)) & 1;
> -}
> -
>   /*
>    * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
>    * Vendor IDs 0 and 0x7f are invalid.
> @@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
>    */
>   static bool spd5118_vendor_valid(u8 bank, u8 id)
>   {
> -	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
> +	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
>   		return false;
>   
>   	id &= 0x7f;


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
