Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11150C47077
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jan 2024 20:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKj8G95CuNRPEvKuxKLyWMOKic3dp+3OXHF0Btv73BI=; b=mweX8E3rHOa5fY
	mOD3ud7uwiURAGjyGewiTttebKmpzxwMM68atwYtS8mRT2FTSsjgI6BOocgCg+wo4k7cMkAyWslBE
	Trx8YvqbC3Gt0s3qCBFhrabVcnV7DT8/1SxKzAhUxKMAhgE5Mwv7J3Adv4aLXfuMcYl/vCzm5gO5y
	H4bONiNSz+U1DmQwGYllhwI+8sSIMdwhC4f9+2ZyWnpebm7sc6KpSUdvU0I6wGezn8GzJOl1r1MMg
	hg+wO9pfnSmtKqdVcIuOGDRdcofetNEMbbhw9aPuWUC4jmRhpwqxaftLJjL+1AJv0GkJZh1MB0DHL
	GCD5K1ykb4XVudPw8RoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPq4w-00DSTY-0y;
	Tue, 16 Jan 2024 20:30:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPq4s-00DSSX-2T
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jan 2024 20:30:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a2eb5c4dad6so10016266b.1
        for <linux-i3c@lists.infradead.org>; Tue, 16 Jan 2024 12:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705437027; x=1706041827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTXhmBHw2EA0caAaydvwAT6rwYI/NJUX8jAJJV8Sy00=;
        b=gyWDkzc1N7Lc7NI1ZeKKBNvcuOo8xAuLPXvpHID+5B2IteZjfEDQKGGllg9tbN1TaH
         XqXg4UShnbzmBY+h/ViQBmaI6TQx0LYldR0cldzJaxFJsVC2yzKJjek+LntPzM0tcG2X
         Siba40sMnGPVX/Jo7LSlIcu2s/KRDk71sRSSnn6OMQ3GV5hHq3HjKCCak379JSzfDQGE
         nb7GmJTdz6ObKj3XWt70hi9+Tj33+KS5xkN3AZHQgFGm0Z+5S/X0kKjjDyoqLXsuRLQ1
         8fUOG1Ybn2b/+QWg5ZVo8KUpA5OdG8ff7e0TL5iP86pbt8uafCPj5LbFM4udutCyetRS
         LMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705437027; x=1706041827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTXhmBHw2EA0caAaydvwAT6rwYI/NJUX8jAJJV8Sy00=;
        b=K38dmvSV/XhFSOMnEjhiWdErlJvWXYz71YWim+JDOPG4uqhbnXqcoTGkGP3zCwMy/t
         9ATzesAFtcgEwF6CXmasgxVavKT+DFDD4V7p3PeK0JXeITw8XXHqm1I/AZVvtnyh3Q6W
         FGcOs8X7t2E+aJf+JWqxfkFQ0eDYglEHI57xg4FrISXquBf1FE4d4gtK5I4Y2mvnnS69
         3OfSvOPMpxVl7GVUJTDNOcU6i8js/1CYliNfuGuk/dFfqqg0mZzVakPMfTz+osOecM0z
         zn3grurdREZNaASKTGf4ZQzFcuNeW+McdAioKI6UjLU6tjpk9HlW2gHB7Q6HRq5OafcQ
         n1QQ==
X-Gm-Message-State: AOJu0YyiIp/S1I2a6uVl5jqnfLXQ5TJT1T00CExT72VbYpUhwQVWF5+x
	TG0/Htu/B8gQY84fG1aa1qT+FuLhuzGf9w==
X-Google-Smtp-Source: AGHT+IHFuFzFMM2bM2UjSx6fFyIc5tvQ1xs4HEI2FsjCRLD6pEYz+/oaXtUkDCaPFFhcoVD1Rw+sOw==
X-Received: by 2002:a17:907:c24b:b0:a2d:d3a0:c9e6 with SMTP id tj11-20020a170907c24b00b00a2dd3a0c9e6mr2489729ejc.46.1705437026927;
        Tue, 16 Jan 2024 12:30:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id wb1-20020a170907d50100b00a2cd86caa73sm5541237ejc.121.2024.01.16.12.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 12:30:26 -0800 (PST)
Message-ID: <4a9ed1ca-cd13-4b61-af06-a3d7935aeeee@linaro.org>
Date: Tue, 16 Jan 2024 21:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-target-v1
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, robh@kernel.org,
 alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 gregkh@linuxfoundation.org, imx@lists.linux.dev, jirislaby@kernel.org,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 miquel.raynal@bootlin.com, zbigniew.lukwinski@linux.intel.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <ZaFjaWCA6k+tiCSJ@lizhi-Precision-Tower-5810>
 <ZaWLCrWJEMtFx8cR@lizhi-Precision-Tower-5810>
 <1b628901-7f71-4c97-9a16-723912988417@linaro.org>
 <ZaXqCoCHPWER94Hh@lizhi-Precision-Tower-5810>
 <d45e31c4-914e-4cea-a145-9775b6f516ab@linaro.org>
 <20240116-bleach-herbicide-48d636967134@wendy>
 <3199c245-3d2d-49e8-951e-2b059de4d683@linaro.org>
 <20240116-achiness-thievish-10a12b3c08cd@wendy>
 <Zaa+cLGVVDSB5MYr@lizhi-Precision-Tower-5810>
 <20240116-retract-conclude-c47a7fc8cb21@spud>
 <ZabVSYgq1Mz3LPpC@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZabVSYgq1Mz3LPpC@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_123030_862735_B6C64299 
X-CRM114-Status: GOOD (  14.35  )
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

On 16/01/2024 20:13, Frank Li wrote:
> On Tue, Jan 16, 2024 at 06:23:09PM +0000, Conor Dooley wrote:
>> On Tue, Jan 16, 2024 at 12:35:44PM -0500, Frank Li wrote:
>>> On Tue, Jan 16, 2024 at 09:48:08AM +0000, Conor Dooley wrote:
>>>> On Tue, Jan 16, 2024 at 10:33:48AM +0100, Krzysztof Kozlowski wrote:
>>>>> On 16/01/2024 10:30, Conor Dooley wrote:
>>>>>> On Tue, Jan 16, 2024 at 08:24:20AM +0100, Krzysztof Kozlowski wrote:
>>>>>>> On 16/01/2024 03:29, Frank Li wrote:
>>>>>>>>>> 	Patches were accepted after discussion, what you ponit to. So I
>>>>>>>>>> think everyone agree on the name 'silvaco,i3c-master-v1'.
>>>>>>>>>> 	I plan send next version to fix auto build error. Any additional
>>>>>>>>>> comments about this?
>>>>>>>>>
>>>>>>>>> I still do not see how did you address Rob's comment and his point is
>>>>>>>>> valid. You just did not reply to it.
>>>>>>>>
>>>>>>>> See https://lore.kernel.org/imx/ZXCiaKfMYYShoiXK@lizhi-Precision-Tower-5810/
>>>>>>>
>>>>>>> First of all, that's not the answer to Rob's email, but some other
>>>>>>> thread which is 99% ignored by Rob (unless he has filters for
>>>>>>> "@Rob"...). Therefore no, it does not count as valid answer.
>>>>>>>
>>>>>>> Second, explanation does not make sense. There is no argument granting
>>>>>>> you exception from SoC specific compatibles.
>>>>>>
>>>>>> The patch could have been applied two months ago had Frank done as
>>>>>> was requested (multiple times). I don't understand the resistance
>>>>>> towards doing so given the process has taken way way longer as a result.
>>>>>
>>>>> I think that Rob's comment was just skipped and original master binding
>>>>> was merged without addressing it. I don't want to repeat the same
>>>>> process for the "target". Indeed I could point this earlier... if I only
>>>>> knew that Rob pointed out that issue.
>>>>
>>>> Oh I think I got confused here. The context for this mail led me to
>>>> think that this was still trying to push the i3c-master-v1 stuff through
>>>> and I was commenting on my frustration with the resistance to applying
>>>> the feedback received. I didn't realise that this was for another
>>>> patch adding a target.
>>>>
>>>> I think you already said it, but NAK to adding any more compatibles here
>>>> until the soc-specific compatible that was asked for for the imx93 is
>>>> added.
>>>
>>> Is it okay for 'silvaco,i3c-target-imx93'?

No, because imx93 is product of NXP, not Silvaco.

You need regular SoC-block compatibles, just like we have for all other
snps, dwc and cdns.


Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
