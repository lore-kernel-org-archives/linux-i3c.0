Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5565CC83F1A
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Jul 2025 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHMnXNahAsYBQBorRoeYpbLF7M5SNLtGaQUq6hCXFYQ=; b=2P2rZsLb5fxzU+
	5IQ3UmPU9jmYDrY2onujtuvRHNIjXErLf2TPBiUKm8jP2greluH3delLx92D+DwzG4t94gSuo626I
	GvCC5p366qm/ufXazbwTLC0fyxcnkn739Sqi5r848TSlpcuS2khYvMR2PvHk/44TDK0fLnyJxgsBC
	njW1/aUCrCk4CfRNCEuq8lHVtXmOUVqke9ZoSLZbEp8UNXlnJPGlzXMF6AuFC+jHrdKIYils4au7P
	CQcCbg1XFmXZmPYZz+4iH3NoWiW8Nkgf4CA8L6iR3NTSt0D764S63Xg8tP/ISB0jwlIeCVyTbIqz6
	yK/RQ81sO04y6L6FXJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKpb-00000002bMj-0GGR;
	Mon, 14 Jul 2025 15:11:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKMT-00000002VV2-1TlO
	for linux-i3c@lists.infradead.org;
	Mon, 14 Jul 2025 14:40:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4536c6b2506so541745e9.0
        for <linux-i3c@lists.infradead.org>; Mon, 14 Jul 2025 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752504056; x=1753108856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=83mP6l1iA2hcAoEVcKK7xAWQf3cJP6s75bC7pATme9U=;
        b=WZU7KmulH4o3izDkLH0ezjGE0HTTGr1KIGWKZWHzABIF8llsdG1QOcqy6Ubdylmx4R
         cc8aMeux9laOriYdxD5pB+Yx2nCieF1dEdEVIjlvQSoBmosRz9+nNVUBePm3va7KSLfm
         0+VoixdgLOmkBdbCwOpFSN3KSmIiDLih467oRCZXVzJ7UNZFg0ZENda2mOw7yM0rsoOa
         GoNdf3nbfxNvNKrZV84flRh7dVBKtVrL45/nNOMqiYMbs9Z+b1t3kLonkaAnwz6rNHok
         0kVzoGDdHmYIJ2Sj3J198yXEJaaRnNumwNUXSmzOb9odlKjXaRiGNYvZZWUbcdcUESpA
         nhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504056; x=1753108856;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83mP6l1iA2hcAoEVcKK7xAWQf3cJP6s75bC7pATme9U=;
        b=JL/+i7VMG2Fr9gaEPjZQn56CftZxfO9WT8UueHBARsgiG8b9XgT3gUA/SInPWeItnQ
         WTStitO47bzCiJ2aHLkd/GOY3xKH/POJV0J8niYlQBvWchCaEswTYTLDFCepSFZ7QN5Z
         T3yplk0E8xCJutNDhChygkkfbVTUyis5k3N0ew3YbokGoWuGMUFcCHRtXGKP7pzXfkAn
         yM76MFzuYn6TMkOptPRfpx9yEGo40VZLLPFdWL1fnqRhHBJN5ZIvBbNnlQDZoKyzTfgW
         pPLl9pfZUr948oKiwj2iieUODNPu5xXg3dUcGCZZRHV2l0PpvVlCj/3fZvnvy8tvi88x
         /AtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUydbhpe1X7CO27rtbYsRRS+wF2ZwX8/AYT9Zprlz10TIXWwBKkdAxIh1qRsjWl1DYGtTGy8y1JG88=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfkHO3bhCEE/eF05b1UMBiqgbWyRFL6YihdyVc+E2jJ3FmKg8q
	A10gsx2s7wAG5SZ0NcrtbZyx6acGl0Oz5HlxswiuVv6H56DX2zH6AcYR05dGXnUfQUQ=
X-Gm-Gg: ASbGncsRksK4YJP5wLIDZynqhbCfAmepKAAGgISQDERk/tWRvIXPw1FBVm4KWRSky4D
	yS0BlmivcJf4TfS+hE3DBBE+jUeXl1FZIvNryPvgBdokuKlDhNBqAEGk6cckL6LdZLgAdhalIdY
	J1INEqn0FREk9M7aZqte/CloxB1lR4n9QcgkFYnq4GBdsoDGscyPeTC8oOfXVXLXa5+wKa25CxG
	5OG+br60wvAjXofyFKDcZw4uoCPv5+W00owU1BdttoNXLVF6jEl2RRZZ7DzGv5q9lEtA1EBV70y
	ryx0NYvJ7pb5DfehzKinyl/rus9ga/mbhmSU06cQz7yC3shTJhr32Do0zLl55+UDj6DgmxQZ2n7
	E+LMrhi7joKJ+ToP3D+BEzjvOetltFhs4OWT+PKTi7IAJIovEwG8c
X-Google-Smtp-Source: AGHT+IF/6VLR+s+RRZQkaP+/wGIfCuQAfLZweR0sCDTX1mOmUud28cvHC26ApEa2AAxHWg7MFRtFOg==
X-Received: by 2002:a05:6000:659:10b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3b5f1893c29mr2997763f8f.13.1752504055681;
        Mon, 14 Jul 2025 07:40:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d5easm12473850f8f.48.2025.07.14.07.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:40:55 -0700 (PDT)
Message-ID: <f9157fbf-09a1-41e5-b5f2-902ca20b870d@linaro.org>
Date: Mon, 14 Jul 2025 16:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: cdns: Simplify handling clocks in probe()
To: Frank Li <Frank.li@nxp.com>
Cc: =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250713152411.74917-2-krzysztof.kozlowski@linaro.org>
 <aHUQ7Ge97/glY+s7@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aHUQ7Ge97/glY+s7@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_074057_405798_D98F513E 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 14/07/2025 16:15, Frank Li wrote:
> On Sun, Jul 13, 2025 at 05:24:12PM +0200, Krzysztof Kozlowski wrote:
>> The two clocks, driver is getting, are not being disabled/re-enabled
>> during runtime of the device.  Eliminate one variable in state struct,
>> all error paths and a lot of code from probe() and remove() by using
>> devm_clk_get_enabled().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/i3c/master/i3c-master-cdns.c | 51 +++++++---------------------
>>  1 file changed, 12 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
>> index 449e85d7ba87..cc504b58013a 100644
>> --- a/drivers/i3c/master/i3c-master-cdns.c
>> +++ b/drivers/i3c/master/i3c-master-cdns.c
>> @@ -412,7 +412,6 @@ struct cdns_i3c_master {
>>  	} xferqueue;
>>  	void __iomem *regs;
>>  	struct clk *sysclk;
>> -	struct clk *pclk;
>>  	struct cdns_i3c_master_caps caps;
>>  	unsigned long i3c_scl_lim;
>>  	const struct cdns_i3c_data *devdata;
>> @@ -1566,6 +1565,7 @@ MODULE_DEVICE_TABLE(of, cdns_i3c_master_of_ids);
>>  static int cdns_i3c_master_probe(struct platform_device *pdev)
>>  {
>>  	struct cdns_i3c_master *master;
>> +	struct clk *pclk;
>>  	int ret, irq;
>>  	u32 val;
>>
>> @@ -1581,11 +1581,11 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>>  	if (IS_ERR(master->regs))
>>  		return PTR_ERR(master->regs);
>>
>> -	master->pclk = devm_clk_get(&pdev->dev, "pclk");
>> -	if (IS_ERR(master->pclk))
>> -		return PTR_ERR(master->pclk);
>> +	pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
>> +	if (IS_ERR(pclk))
>> +		return PTR_ERR(pclk);
>>
>> -	master->sysclk = devm_clk_get(&pdev->dev, "sysclk");
>> +	master->sysclk = devm_clk_get_enabled(&pdev->dev, "sysclk");
> 
> Can you use devm_clk_bulk_get_all_enabled() to simpilfy futher?

Instead of asking redundant question check yourself. On a first glance
it cannot, because it won't be simpler - you still need individual
clock. But if you find it possible which is not visible on first glance,
make a proposal instead of just random drive by comments.

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
