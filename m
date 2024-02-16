Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B9C48BEB
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Feb 2024 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7d0dKDFwQoPVPh+J/Vx6r+CsI4NlbSVBW/JYhMWx7hQ=; b=gnV1W7LiWZ/q6X
	f12FObwqC9ilXzrK1gK6ql5UVZ9DJDS9FP/cjIuvAGjQdfKhYteorUbMMB22diHblWe26s6ow4EY/
	8Nn0wD6vrgz0YD6NQ8qB0o/Uo4d9Iqd8BOaZxVKIQyLrEIQ0wxFYrU3j7sxgkKe7h3rJ7okicExpI
	jqCInDuiYqoxgLEBxn0bRU6f4fG67AY9q9Glgh434rQXbJy4AB1ZnHfr/yWvHyvUTnP/NRHYIoOGe
	EcWDN4q6odu75nmWmJ4op37Cnt3mMOg1SEVQUxGQG15jft48VYb4PXJI5NaOmOLUIYPMxL7SRNuQ1
	pC+Eqw+qk+7L1BigycPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawMK-000000028yr-1uqI;
	Fri, 16 Feb 2024 11:26:24 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawMI-000000028vv-0cA2
	for linux-i3c@lists.infradead.org;
	Fri, 16 Feb 2024 11:26:23 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso3034752a12.3
        for <linux-i3c@lists.infradead.org>; Fri, 16 Feb 2024 03:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708082775; x=1708687575; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93OYLg4q0oHjxuDIEvks7Wy0CY8KY785GXCxGC4pQbw=;
        b=oqyr9e16EBjRap8luqxzlgH6qH1MRQGjxp/wv29Bs64tr2ECp68uO21PrwDE5lkg3q
         P6P67jjchCoeoWeAfcDNfnrn5Bash6Y8wj5a+azD3J3xAJUYre+J7a+eYAoUvcIkYlV3
         5ofh31V7decIi2HfHlD7cgSQWUGl/VBbPeXDFl7etD/UmsA+dmKKitDSRisGHas1hSG1
         ktLBhqPdJ8o01h8lcUj1BuKJKAetqcP6EGSz2GgXRjrfcgJQ01hrVGGqcudZSFZZT7ee
         J5YWn7fDBAde6LR8ydL+BQ3MGC6zcdy2nSdqXYS4hIInzQZjThRS5tbszRP/uIHfpJEO
         Fc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082775; x=1708687575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93OYLg4q0oHjxuDIEvks7Wy0CY8KY785GXCxGC4pQbw=;
        b=Z0zj1o6WcPcfUH6fbk5vp1HlAbeAiIPWh6nI93oxCEXc4UHXfLgUsnBm6v+MrT52qo
         bwAp3/WxkFo6QSnXUx+OhkqzwmdCvPzlgU3uO7mfaAwDENPZtZH8gQ5j4jXES+2yT/Q1
         m6ol2dt/QckhZqnp1a1ASP8P+c4dQFNEn9lX/oisQvSKC76dQAWid51k+Q2Jiy54oSCu
         tZLIMmn40dfoOSwtdiY7QoMmbhN9rPV7XbW4FGa0SMw4xD2TfzgYujqPTD1VkwOrWeTO
         ayLuHaD99XiCcNBPi/mNmAUGDcjim/JYXNiXu+Mg+dAa7xye1QlmcR+FOHlLdzbTsMlx
         Y3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVvusv166utlpgfhIRXedPceCMj4cB4UlnVuk+X263QcbL17gcuphhkJHEp/IRs2rAFpMphtiLHWh7Nwqt3ooMlsg0D1KVL9NePL6/1XQ==
X-Gm-Message-State: AOJu0Yz8W0Ck2/ptCUFI5Y+su8oe8iQiiIsmIgaP55mGjwLQwbTb8JPR
	Oavn3XZ//UxFBjfmc174jaLjNBBMzEBQ206nnWE2haHCAuvwLGDOaTlrKeYgndjjwvbnBN5JZ1g
	h
X-Google-Smtp-Source: AGHT+IFGkXTiIVeO0kCYo/eseWcxXwAGaGEaJNstXMzh/oBCux1zMq7ACOjpZD7ZbdLmyF2om9iWiQ==
X-Received: by 2002:a17:906:c457:b0:a3d:ed30:11c8 with SMTP id ck23-20020a170906c45700b00a3ded3011c8mr632398ejb.15.1708082775630;
        Fri, 16 Feb 2024 03:26:15 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a3c7fb8cc74sm1451156ejc.154.2024.02.16.03.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:26:15 -0800 (PST)
Message-ID: <00d6a0d5-6787-4777-8fb2-dcad4304a724@linaro.org>
Date: Fri, 16 Feb 2024 12:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_032622_471144_9290C8CD 
X-CRM114-Status: UNSURE (   7.89  )
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

On 17/01/2024 08:56, Krzysztof Kozlowski wrote:
> Drop the requirement of "-master" suffix in node names because:
> 1. "Master" word is discouraged and MIPI Alliance renamed it to
>    "Controller".
> 2. Some devices can operate in Controller (Master) or Target mode, thus
>    the name is not accurate in such cases.
> 3. Other buses, like I2C controllers, use simple "i2c".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Rob, can you pick this one up? It seems Alexandre did not take it.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
