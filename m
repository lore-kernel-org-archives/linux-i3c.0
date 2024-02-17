Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0EBC48BC4
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Feb 2024 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iLsK5aA03iOhQanNJDmtkkYR7c3rE2PwxxF1Nu2yB0=; b=WW3BXEgwRSPvZx
	F0LWBIjw20RFOWSMGKvD0xIOH2m1efid/a3TqkP2vwKMUQBgwmOhMSe3kr3FeKPNiHMKTSUSIp0cH
	hspR6Rm1zN14an3ZwByxcT7Ojdrd9XV3p7nw8p7yWQLidY35PjxKWRID247KB2i5Y/3lL6PYYvmbU
	9Xd1eIx7T7yMLrhemMe1MV9qC43VlhcjyGUSyvk+/cs1YNslsQSnaTL+/pJ/5Joi2PpoDa2GaMsMg
	dieQZgHEbl908IpXs6jhntb1WE/UQGiVtl2hiw9G1wxVMEQJd/p7nYELI+goOAY8otc3TVl52NJ3k
	krhI9jVCjCvV9JV0K8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKxc-00000005lFr-0PiB;
	Sat, 17 Feb 2024 13:42:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKxZ-00000005lF1-2imu
	for linux-i3c@lists.infradead.org;
	Sat, 17 Feb 2024 13:42:30 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-511976c126dso3684568e87.1
        for <linux-i3c@lists.infradead.org>; Sat, 17 Feb 2024 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708177347; x=1708782147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiXDfqGts8feqD9VCLlXe5SRdanfsCFR9TmA/hIZPB4=;
        b=ltqeHMqarC7ixfYhTGr2c2cvmePlU0chW2f8C9aH3L0FoxHpJBdmzShI2OGdH6Qrkn
         CBkq80BUGBDvpRnVNSB7rCWBzf7yXIvv6Ol3v0QunH2idAHIjAMhvLzTiTxoV2WkMb+z
         tkQ1ZNXbPR1JQo1PBxeTDER8aea0e1aJ06WwfuhAoyt7y5PzvJ8hoy4atWauUy6LEbZc
         holO/MwYRPp5W1Qwn4I5Zx8pKOVaHB19ja7bNgVefyqzAz6+jj10VsbqJRudy0NRY/Xn
         tVHkKEfAEqVtnGQbXgglBaoR4r6GrmKL/k2sQUF3QEPXUvvkf6RnitlOss4s1OeWD0lD
         26UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708177347; x=1708782147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiXDfqGts8feqD9VCLlXe5SRdanfsCFR9TmA/hIZPB4=;
        b=tlSrWC/n9NE/UzHt79CYCHd/dUXCqlTMfo9o9yanvfrLDF3UhSzAbKOVNBdAEXNOAC
         UNSnDmVwsFgzaLFkFe8rejIu7tO10QF1VlEFmsS/yy6tVIASBcYCGv3miuaiGXD4ABkE
         uVD5nhFa4n8PpVbprj0sbkObhsVR10Y2eClSoNomfS3/2fACW8gwjutgjG2TFgu59W3U
         gFa/eg5Kn/4frh0HMtvA7m/W9LWrZBBty9xpKk9BcFpL46aqGp8B7nMOwXcnsYOQdZ+W
         Cr/j8GiXbVzAYt6OxzMm+vO5fd59cqUbzDbP9CYEiLHSW/RHqALC8C1E4kHdGS0uHgZJ
         p2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvXpBpJaqQNpXv9sjZHuT9pQiVo9A0RTe2CLUADywUWltgJaSdjUeUQfp6dyCWPzLbVGA0Bdj/hq+4844FUVwklgkJP1f1pT1EXDxlMg==
X-Gm-Message-State: AOJu0YyiHIzs1Dw7Z7vXfirjaF4nogEe5jnitjPMXv4fDa+hwNzTcL4W
	scsF4I/ghOZtO6rFHJH6BCE6Wn+v+XFWU3XfgDi2zAcTNzx0blxkiXkxwRHmd34=
X-Google-Smtp-Source: AGHT+IFpK2zVJudUZocVcrh8tGHfvqGG/t49pxVjyXnHWhUB5Ndv1Ojk419TIBq8YEYSkzFVybqGLA==
X-Received: by 2002:a05:6512:2c0e:b0:512:a637:9462 with SMTP id dx14-20020a0565122c0e00b00512a6379462mr792588lfb.16.1708177347296;
        Sat, 17 Feb 2024 05:42:27 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056176e95a88sm893979edb.32.2024.02.17.05.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 05:42:26 -0800 (PST)
Message-ID: <4b34c495-4aaa-4dd3-b7b0-b9d54baf9338@linaro.org>
Date: Sat, 17 Feb 2024 14:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Culhane <conor.culhane@silvaco.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
 <00d6a0d5-6787-4777-8fb2-dcad4304a724@linaro.org>
 <2024021712422352187ad4@mail.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <2024021712422352187ad4@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_054229_740157_03339815 
X-CRM114-Status: UNSURE (   9.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 17/02/2024 13:42, Alexandre Belloni wrote:
> On 16/02/2024 12:26:12+0100, Krzysztof Kozlowski wrote:
>> On 17/01/2024 08:56, Krzysztof Kozlowski wrote:
>>> Drop the requirement of "-master" suffix in node names because:
>>> 1. "Master" word is discouraged and MIPI Alliance renamed it to
>>>    "Controller".
>>> 2. Some devices can operate in Controller (Master) or Target mode, thus
>>>    the name is not accurate in such cases.
>>> 3. Other buses, like I2C controllers, use simple "i2c".
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>
>> Rob, can you pick this one up? It seems Alexandre did not take it.
>>
> 
> I'll take it but I don't think it is super urgent.

It's not, but it was almost two weeks and we are also getting to end of
applying cycle of some maintainers, so I was going through my pending
stuff. Apologies if this was too pingi-ping.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
