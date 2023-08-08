Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E225BC001B0
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Aug 2023 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBurwPrNfL3eSqJsLm5UEIXMRuZ9BSrRzKRZSqnRuSI=; b=lga7+l51A9598m
	XJ+s0LliMsQcSFYPNpapPKgYn1oKxaxFHbvM300MtM44Aq+sjfpEZULQeh0pnm9SoknQ25tvd5Hhb
	+iBwgOSJVxhRYdWHWPPH4zmtFRNZrqj2W74OhtFXPcFFVvrPhxTLVsBKxTvprcSPQIBri51TsBYb3
	Tlbb6UO6lxFJClgQM5jBiZ9N9uTEOCZcFsglzXffCkMEptnfZIdO1zKJbskDLT5Ig8+cdcvOEz0lx
	EhFy5JOZo96ltL1Bp208qPZaKikY9f7ghr1WsfnVhELvKa+c6p5k1ADEqJjvOQlJ5WrmxlGDWMwYr
	sPAs7lmnkuXaTtIZpYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTP7a-002s6Q-0z;
	Tue, 08 Aug 2023 15:59:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTP7X-002s5R-1O
	for linux-i3c@lists.infradead.org;
	Tue, 08 Aug 2023 15:59:44 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bc512526cso850349366b.1
        for <linux-i3c@lists.infradead.org>; Tue, 08 Aug 2023 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510381; x=1692115181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMxa/gVKuibvIVWmpuZpFEwzt5/SE/hyALHDnspMprc=;
        b=APBgrt3C3itVlNbiO6kRKj9GJylAzpbSRWqWoH7imhPKP4364nZOfJjIuU8NP4tW0+
         OBLn3dRTQvbr9xaTZLE3Eq+Dk9FIxUOKTqZgKCdE//N/HNdbee9Xk3SJq128K9pBzgf3
         q39fkzthJTV1YTeBceTrvWDiINhKaUeM895bXJHwlQbVKgF7ps3Pc+I0mOQZmbX0p6rC
         UhFf6hfUn3sHjnR5yGJ19swURzA172Uc0IZ4508FtCASzqMUb+G3CMQHhb6SdLAJ02Mj
         4iXzIHqztOevMtzQP3xdoVamuz3EZVkcJigPVlGX/FG/X3DRViYo3lp97lIktNvSD4Ib
         jwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510381; x=1692115181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMxa/gVKuibvIVWmpuZpFEwzt5/SE/hyALHDnspMprc=;
        b=Eh/wzsBjxWHHqun0yBz93LI8p5Whv8VKp68vq6IqVb8bTERnZVNnExb83pL27/q3mw
         u1gPL4NSHK9DwUFL6sFb/PcBmEZPk3vGOPj8cR7W5VzOt0B/s7yfDnrC97TlzQVt+3Cb
         oMRP5Vy/K531OTY/zrvK5RYk4/Locs/qT0EtRdMsbjZg9nN96Ru9tzbOHSQrxGD6lkUo
         NpUpCNGpI/RDeHdoK0XJF1JTBZL1KpcToBSNhN7NlZECucyq7Lyp/ziDqiOfCE73ectP
         6xtMq7nf04tKb8B/zIwDTV3+3MG03HQjkmfgQnW7cEvMS21exc7haPvqd6hosJjTEJ05
         HaTA==
X-Gm-Message-State: AOJu0YzFb0w0fcRlQBs2UAMpGfmrbWpzeTj6GGcerAeRQeig5LqvAehz
	a68dwdacSRB9aTM1gL2kkmkJiKu8UaXVxTKJJL0=
X-Google-Smtp-Source: AGHT+IHhsovjxambnGZbWubCZ75bBFP/uvpp7zDOuVqUVK6QAMMeX03Ka2xjCi2S22J1Wto5SIwDqA==
X-Received: by 2002:a17:907:2c75:b0:99b:4378:a5ab with SMTP id ib21-20020a1709072c7500b0099b4378a5abmr9603548ejc.74.1691510381238;
        Tue, 08 Aug 2023 08:59:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id bn10-20020a170906c0ca00b00992b0745548sm6886811ejb.152.2023.08.08.08.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 08:59:40 -0700 (PDT)
Message-ID: <49edf46a-b35c-1135-c500-2382a453e58d@linaro.org>
Date: Tue, 8 Aug 2023 17:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: i3c: ast2600: Add resets and reset-names
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>, jk@codeconstruct.com.au,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@aj.id.au, p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
 <20230808154241.749641-3-dylan_hung@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808154241.749641-3-dylan_hung@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_085943_471520_2D9D3802 
X-CRM114-Status: GOOD (  16.55  )
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

On 08/08/2023 17:42, Dylan Hung wrote:
> Add two reset lines to the AST2600 I3C controller:
> - core_rst: the reset line of the controller itself
> - global_rst: the reset line of the I3C global register block. Since all
> six I3C controllers in AST2600 share this global register block, the
> driver needs to handle this carefully. Generally, this reset line should
> only need to be de-asserted.

The commit msg does not explain why this is now required.

> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
>  .../devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> index fcc3dbff9c9a..3166d6f3a39c 100644
> --- a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> @@ -23,7 +23,12 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    maxItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: core_rst
> +      - const: global_rst
>  

Drop "_rst" suffixes from both.

>    interrupts:
>      maxItems: 1
> @@ -48,6 +53,8 @@ required:
>    - compatible
>    - reg
>    - clocks
> +  - resets
> +  - reset-names


Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
