Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6C7C4706C
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jan 2024 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvP8+e1aegmoi1S0EpCoAnWZqXjuAnVUgwtn9dRMYWQ=; b=XPHLs/94QjqS2j
	S7IccKrU/k7tbPOIWGNErrGcH20FFhYqI6x7UXXoS4wrD97FwqVZEB+LHHd+VwhmbIgoBzwYG/cbe
	a/TIAw8v/oDXnmA0yfAEHY1aFsma4TyYQ2kjgweEtjjaMScKfdB6FEhM8sa8UouMDF1MCYVIigzoV
	pbgMlnnwNzswNQLX49FzFlZcVeLvfefKlC6uw/hKfI5rqzAbNSo29HaEvo1fy4TqSsb6X26k3I33l
	SwIod4fPFErVityJE9h+1pH7YAd+fEk8hTCQo+B5XudS86kXKfoA64+znA5RrXhUf/LkMIp6tQc9u
	eQk0IB9p+bdFg5JZPfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJxP-003FF7-1s;
	Fri, 12 Jan 2024 16:00:31 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJxH-003F96-27
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jan 2024 16:00:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3368ac0f74dso4517241f8f.0
        for <linux-i3c@lists.infradead.org>; Fri, 12 Jan 2024 08:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705075221; x=1705680021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KNSnE31mUWTtAu62zxte7+wGFbNxIAXcVNWvFpXarq8=;
        b=xD0f5ifVU+1Zf/fSqT5cZMx6+k9JzBJXFJV4Z7Y7dCbsTjp9jaHgw/So+Rq0d7/9V8
         QgFiZIfN0GIfqYJPVuvDeU5EVCfW+ynkYZoQFUZ69ugHDzZp3YI5Z7W1l2WeZ3YnFFOt
         z1ddUrYSZFg25ZDS9ERBt5piuWzsxujh+lB9Nr429PgC/6VEyxXuETqw5TyDHwr60+rh
         HVcVLNKP5NNWe8GEnEBLELMnzzVrBjkWP9jx60pTN5a3uaTY4I8+ozIJCL20sS+G/oNo
         xyw6AIsPG/aptWtSXOR69DHMvbaWLS+jRGqwxTQnFC6lWa3YC2Dyp+dqzxbjgXzS/Ckb
         7CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705075221; x=1705680021;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNSnE31mUWTtAu62zxte7+wGFbNxIAXcVNWvFpXarq8=;
        b=Mlo0kY1LTvHmM2SwycD0I9+AWKyaFQ7TgaEyI9x/xOj/1QvSUiu8bN/blb0v8Q6xRQ
         5a71gFN8apQlw1hOfx8ZqUX0+kENrs9zr62Nik+roLiLWgPhNVe8R8e7FD6H6ecWvfpd
         I3r2IkHYw26pP1ujivAe2b/6cKxZh64V2VbO4hQyF8m9lIYx7VS8OoBVHAqbcCzwxXEk
         89622xRL0E5RwOMhs7H9GaTWqgshX0Ijisw7vMVCIuVLLJaeHMN9uUiQ3luI4L3kJv4g
         kep3vqoPCNBllz7Q8mTfJHXyc/bHZOC7/I30TkyLgtuSbULEs//mAMNZF8Emp3kiYVjC
         Clsw==
X-Gm-Message-State: AOJu0Yxs0KWyvF1JOMkJWHc9FnB64NHY7TrbhrnuniEngQe6NevB/dd0
	OE+H7F4OIVnoJ7ouGdlYimamiGtjVkpQjA==
X-Google-Smtp-Source: AGHT+IG0t8vwy4/T+jnfap/4JzmpTGUHJHK3NjF9tz0RjHW21dsfZTqkn2BSN+XKUADqV25rHt7bjA==
X-Received: by 2002:adf:e8c6:0:b0:336:1182:6475 with SMTP id k6-20020adfe8c6000000b0033611826475mr875372wrn.34.1705075221351;
        Fri, 12 Jan 2024 08:00:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id b6-20020adfee86000000b00337478efa4fsm4200905wro.60.2024.01.12.08.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 08:00:20 -0800 (PST)
Message-ID: <a1e673be-9c4e-4bbc-abe6-56466f8a01ad@linaro.org>
Date: Fri, 12 Jan 2024 17:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-target-v1
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, alexandre.belloni@bootlin.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 jirislaby@kernel.org, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 miquel.raynal@bootlin.com, zbigniew.lukwinski@linux.intel.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20240110175221.2335480-1-Frank.Li@nxp.com>
 <20240110175221.2335480-3-Frank.Li@nxp.com>
 <3c0be658-e7a6-4231-b206-86ffb47e0cb2@linaro.org>
 <ZaFbbeQrC7o2dchO@lizhi-Precision-Tower-5810>
 <e3b9aa63-25a5-41cc-9eb7-6e7d1eacb136@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e3b9aa63-25a5-41cc-9eb7-6e7d1eacb136@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_080023_697502_6BFE746F 
X-CRM114-Status: GOOD (  14.59  )
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

On 12/01/2024 16:50, Krzysztof Kozlowski wrote:
> On 12/01/2024 16:31, Frank Li wrote:
>> I review previous comments. The previous RFC patches and I just want I3C
>> expert review to check if there are comments about whole software
>> architecture. Of course, thank you for your comments about "slave".
>>
>> Go back this binding doc problem. 
>>
>>   "No, it's the same device.
>>
>>    Anyway, this was not tested.
>>
>>    Please use scripts/get_maintainers.pl to get a list of necessary people
>>    and lists to CC. It might happen, that command when run on an older
>>    kernel, gives you outdated entries. Therefore please be sure you base
>>    your patches on recent Linux kernel.
>>
>>    You missed at least devicetree list (maybe more), so this won't be
>>    tested by automated tooling. Performing review on untested code might be
>>    a waste of time, thus I will skip this patch entirely till you follow
>>    the process allowing the patch to be tested.
>>
>>    Please kindly resend and include all necessary To/Cc entries.
>>    "
>>
>> It is the same devices, work at difference mode (master  and target).
>> what's do you want to change to?
>>
>> Copy to new file like pci/pci-ep? all context is the same, except for
>> compatible string. 
>>
> 
> Apologies, I mixed up a bit patches, so this was not obvious. I meant
> this comment:
> 
> https://lore.kernel.org/all/20231017201404.GA2570433-robh@kernel.org/
> 
> There is no indication in your commit msg that these concerns were
> addressed.

And here:

https://lore.kernel.org/all/6110c58a-8003-4889-9a4b-6a7d1821c00e@linaro.org/

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
