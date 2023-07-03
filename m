Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97427C30654
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcvjG/T2Yhx4USFk1sUp9J4g61os01ymBvgZXbInJFU=; b=FmBnA3jWE7QbTZ
	2h0KG8xIgrEu2dYevLC4xVoxFmz1ujKc7w6cJissYcEKCR5j3aaiL8aYUB8U/5BEWkL/RmMZY5E4s
	f/AYpnP4Wzn+Jm6ShILQl8tbk9EMARZcRTUSSY5Knv73t4SDNiaQfQ8aiYyYZ7YRNVGn9++6ToF3U
	H3rqLNZKKA/060dd0ckY4WVgj63t4ZKb6mLY4/D3g4Lhhh9V6mWYTJWyyHUYY0uwLisv2dB/tPIwq
	NFhIG6FSgR8EbiIljh3OdR3JU2y9z/7qzbPYbVTlxlXUIbvJQkNkmld5KRZIOwj7vlfopdNvLbpu6
	hRtF80hKdemXpOraUozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQLL-00BPEn-0Z;
	Mon, 03 Jul 2023 20:40:19 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGKLi-00Ajgm-1B
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 14:16:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9891c73e0fbso813048166b.1
        for <linux-i3c@lists.infradead.org>; Mon, 03 Jul 2023 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688393774; x=1690985774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YZZJzbwFN4n03zshXK/J7TJjDtnSZkH39pK/RDg/Cu8=;
        b=NDAvG1Uq9mqFT4vdanvxRFxPwqRPt1DYfERUMqUxx1QMnZlj9AwlXAVeC+kMmYFfK1
         kcta0tNxQRlDOAyrM6V5RoCakvaO5Myehpsd6W1ps4oxm3n5IXLhZeZqjANJ9aUAVSjt
         iTKUjtaMOYsIKA+x959dguBWKV9iUOW3+Web6fUfRQoZP/3gmsowr5mWCpOVz8sxddWf
         5oSrxONL99T7s+WgUEo/Nw0aZJ/Ma/iV6NEFFqNPZF8zT8dOwcMDQX8NHlu0m5fmCPPr
         uxEdpSwinLaRn01b7LGOFHvnYgSgVZayJZDQtQKEfJPCsK5To0OknozzxbGje1svGbQY
         yoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688393774; x=1690985774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZZJzbwFN4n03zshXK/J7TJjDtnSZkH39pK/RDg/Cu8=;
        b=MtLxydAu7Q51G2aI2AEwkBviUOLrPngKK4jeeKercsm1QL1xD7obFLl4atXjbPOK4e
         e/lpSNW6195nZp/2s9DGDlV7rOEDuHly3lTu0vldXOo2X+fKitR2QIVe+sGPditkq24s
         BdxNY1PvV4GaQGRbTBWp5ICv/hp5Uug0vMDj5YyBIEo9L5CRiEsK7fqiDe625zaKZM/P
         3cYb5yQrW5NIlQVp/FXikdXr5GltdpNAGOsvlZCBVsAb6IauU5qJJtG9cPEi43YdFW3S
         myVBbds308bQMvKy/V9CPKdVWyrzQkcwmHqBT0R8GfQhZVPFMcuX2Ik8SyIKWiLlkxZG
         gEtQ==
X-Gm-Message-State: AC+VfDyu9acHNzXeIwOjJ7Ycqj8Rbk5EXoIMLyyLacyI9HUpkYp60JMm
	dzflyrPyWm+RaFBxj6XXv2cxRw==
X-Google-Smtp-Source: ACHHUZ749XOz+TzH+Pgvlma0DNoLLiZLUWSy8ZcmVUnssJhoqQyIBCOCh6Ux9aU6w2XG4KQmsC7txQ==
X-Received: by 2002:a17:907:60d5:b0:98d:f2c9:a1eb with SMTP id hv21-20020a17090760d500b0098df2c9a1ebmr14827554ejc.24.1688393774502;
        Mon, 03 Jul 2023 07:16:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id la25-20020a170906ad9900b00992e14af9c3sm4821934ejb.143.2023.07.03.07.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:16:14 -0700 (PDT)
Message-ID: <7b8e0f70-a6d2-16e4-5615-004b930298c5@linaro.org>
Date: Mon, 3 Jul 2023 16:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: i3c: Add mctp-controller property
Content-Language: en-US
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
 <20230703053048.275709-2-matt@codeconstruct.com.au>
 <CAGE=qrrqE3Vj1Bs+cC51gKPDmsqMTyHEAJhsrGCyS_jYKf42Gw@mail.gmail.com>
 <d29fc42c04f2e1142b0a196ef7df2d74335cec2e.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d29fc42c04f2e1142b0a196ef7df2d74335cec2e.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_071618_423010_4967D630 
X-CRM114-Status: GOOD (  19.94  )
X-Mailman-Approved-At: Mon, 03 Jul 2023 13:40:17 -0700
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

On 03/07/2023 10:14, Matt Johnston wrote:
> On Mon, 2023-07-03 at 09:15 +0200, Krzysztof Kozlowski wrote:
>> On Mon, 3 Jul 2023 at 07:31, Matt Johnston <matt@codeconstruct.com.au> wrote:
>>>
>>> This property is used to describe a I3C bus with attached MCTP I3C
>>> target devices.
>>>
>>> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
>>> ---
>>>  Documentation/devicetree/bindings/i3c/i3c.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>>> index fdb4212149e7..08731e2484f2 100644
>>> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>>> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>>> @@ -55,6 +55,10 @@ properties:
>>>
>>>        May not be supported by all controllers.
>>>
>>> +  mctp-controller:
>>> +    description: |
>>> +      Indicates that this bus hosts MCTP-over-I3C target devices.
>>
>> I have doubts you actually tested it - there is no type/ref. Also,
>> your description is a bit different than existing from dtschema. Why?
>> Aren't these the same things?
> 
> (sorry my reply minutes ago was somehow an old draft, please ignore)
> 
> Ah, I'll add 
> $ref: /schemas/types.yaml#/definitions/flag

Although does not matter, but use the same as in dtschema.
type: boolean

> 
> Testing with 
>   make dtbs_check DT_SCHEMA_FILES=trivial-devices.yaml
> I don't see any warnings, and neither after adding mctp-controller to a .dts
> (out of tree) and testing with
>   make CHECK_DTBS=y DT_SCHEMA_FILES=i3c.yaml aspeed-test.dtb
> 
> Should that pick it up?
> 
> For the description, do you mean it differs to the other properties in
> i3c.yaml, or something else?

It differs than existing mctp-controller property. If this was on
purpose, please share a bit more why. If not, maybe use the same
description?

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
