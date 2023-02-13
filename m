Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26A8C64ED9
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RG026HR2KT8uOfNzjeMZWQ9tYhXH+O+wNCXL3F4twsM=; b=TuLrb5tdh8rBda
	9jyaZJMlvoj+rWH99Ffbr4apTmwxu4ZoAWYD1tXnIS8233WhUe++PHrKBS+AOUqQ91xtY7LDvnxwf
	Y05r1mD+gbD5F3ZHBgfqiGF8O6YkS1BFsWEX36u4i8mZ5nu2UH7SzcFZ+jHiLdwmVBWqD4P1Krjlt
	hpdVwqw2X9hhNjGK5gv5K/hLaI5LKdFbFWvtWi5i6mK0nmTGqnk8scs2g9qJiU9zi1Br40ze1kQlA
	JwWHGr4+gmMJB8ep8wq3QjHUh3D+ijUP8mVDgUW+qTZknKxdN5Vq15hgNrbMUf74AIQWnlQFZispJ
	g7zSLi0YW5pSUCmtiNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWF1-00E8pP-2M; Mon, 13 Feb 2023 10:39:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVF6-00DuWl-CM
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 09:35:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso2338499wms.2
        for <linux-i3c@lists.infradead.org>; Mon, 13 Feb 2023 01:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gmgucw7ArcE1rVHBJg9HjFw2E1lAyLd9N9iv88RjGQE=;
        b=ClAtuvBeysiK4DiEo6LMV3dTn1HCCdUhBXbF5Ye+aVaPFpxD9yHzuKfl1cOzH1Dbu+
         DeUNqql54iNavpEAhMFhIQEUhW785AX9d3ge/8WbagLLx4/zs6eSWZFYOGjLPErFQCoJ
         AQNJIOlNEqi+KerCvb/Hz15ePbUcm4ZpUpwB/QIkheyJ0uYQBfoaYdObvaXQM5Zmsu7B
         H6ur1q3icdwV2C2qt9qtlQL5zAsXwFjnfWkRt/Gv99w7POcqPZMeLU7F59zHUivodIfs
         +uBaMZUyd0EmdS7DEC6YC2735WGR+iRt6AhhdqOWpHXTFfu0eab4f97qwOArJyMDJYHl
         ekvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmgucw7ArcE1rVHBJg9HjFw2E1lAyLd9N9iv88RjGQE=;
        b=oOHwdYoD7TJQDpo9tbOGIyVPuQpvElE00jy7zXfFJn1c+U2ZNPy5fACh9QxcvK7ltV
         ysJY4qksngemuIOoNu8XwtKKII5Q8DVTGtelsXeyB0fythLzfaBxDL70zEBxwIhz+7Cj
         gsG1uz9C+yNaVxrvwRbktk57qsPbbac9YzJlQ1SbgNqozkAur0sBJEDxgaZThExCgRao
         /ilqnRB22hmUbQEO7Crrpte0VH4oq5+9Ak3JPg77EdD6mPjz5BeaZTUIg9Q7BBcX9Gdt
         O+JLxP9tXMx2DBCSiSwBIJ7wPxLU6TqG7JbBHf5+ntLeLEOOpUtx8tcV4BnLP2IuXyoZ
         6MmA==
X-Gm-Message-State: AO0yUKVjg1154xp89fQR1ypb88kPpkYks/4SXV7rjWndybKlmMKGP3XX
	V8HJDo+pa7hRxO9TRUt2HvTZ0ancQabIScJW
X-Google-Smtp-Source: AK7set8t1hWdwz4+lb2JgagXmy8pG7Dx7iXEOWfMIit4rR4uri5IsmUt3xVOuYZuZ7mMxX4PXm7AsQ==
X-Received: by 2002:a05:600c:3b92:b0:3df:eedf:df1c with SMTP id n18-20020a05600c3b9200b003dfeedfdf1cmr22437691wms.38.1676280919784;
        Mon, 13 Feb 2023 01:35:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003e11f280b8bsm11265977wmo.44.2023.02.13.01.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:35:19 -0800 (PST)
Message-ID: <71aeb3da-13a1-1c79-9fe6-f5c23d398394@linaro.org>
Date: Mon, 13 Feb 2023 10:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
 <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
 <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_013524_482244_733B76CA 
X-CRM114-Status: GOOD (  14.79  )
X-Mailman-Approved-At: Mon, 13 Feb 2023 02:39:18 -0800
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

On 13/02/2023 10:21, Jeremy Kerr wrote:
> Hi Krzysztof,
> 
>> You should clearly communicate that driver is coming...
> 
> OK.
> 
>> Anyway binding comes with the driver, otherwise how can we check that
>> you actually implemented it?
> 
> I'll include this with the driver once we're past the RFC reviews.
> 
>> Please send patches, not RFC. RFC means you are uncertain this is even
>> correct and you ask for generic discussion.
> 
> Yes, that's essentially what I'm looking for with this change -
> particularly with the pullup config, which (as you say) could arguably
> be a pinctrl config instead.

Depends, there was just a short sentence. If this is external resistor
on the board, why this device needs such property (and none of other
devices need...)? If this is internal pull up of I3C (and there is no
other pin configuration possible, no other pins), it looks reasonable to
me to have it here. But I am all guessing it...


Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
