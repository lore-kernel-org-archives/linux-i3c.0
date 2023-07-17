Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70545C001DE
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jul 2023 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTyouVEXG+muWThUAfwW8NzIjzYHPXJlQT9sNn6LD4g=; b=aJraSJgwhzNbNr
	54cch0FhKH5W063jAj0gQ5kyPuG5623yxlu6VP8ppe5zFUvCOZes5IasA6Fh/+/jnEtKZ38Hi4QsM
	89cuSxuxC5APZbombcyNnvi2Ljnk0lkr2RudZ//P6fQMbg3mbpWN3mfeXNPo7di8kGS4pVn4E/w+m
	i4VoOD/1yTxAXeL3HW07Pr+GpqSExdfQvUohe6KEhFpKy1ptPqZztn8yBCKx3XUT6ATkgxlMv1/4X
	H+qpbKTQTdaQuZLxwX/gsCAl3P/+UQubBQl2UGOO/4OwF0Rxztvt2GfyxZUeLZGX7WJModY8Sp8F/
	atU5h6ccL+2C7vre7bxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHaD-0033LG-2A;
	Mon, 17 Jul 2023 06:19:45 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHaA-0033IK-2o
	for linux-i3c@lists.infradead.org;
	Mon, 17 Jul 2023 06:19:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977e0fbd742so564231066b.2
        for <linux-i3c@lists.infradead.org>; Sun, 16 Jul 2023 23:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689574780; x=1692166780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B980zBwLvj4rtQ6N+4vP5VbTnvVlJSdED2QfjPo3mK0=;
        b=ml3nAAFrIO4+vXIZ7tajyVURVldVB49rTImgZXD76Sd6H4kDO+eloC+2YiELHdzYol
         WkrUIEGRzL8ZUHHfYvcQ3j1MLT960VrQtS1KaQnxIDCLhnnvCKPzXnPUGxNQwkVTkhHP
         yBOEWYWLw0rivY8Gip93wq3Lw12MxL8CLXpudaic7k//bez6NDX6HLEazOIqd5GFuCsD
         TVRoamKRvZsU/k4EQTumjsAbkvhR3cw6PWYfArJ0w9YALRVxPHGywPdkxxSo5TOj36lc
         hAjXGZgz4fOkTIYVsHXoy90Yst4L5n1RiZ7KkzOmDT7/Ywbr22gF7yV3YF58bLhl78ie
         0u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574780; x=1692166780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B980zBwLvj4rtQ6N+4vP5VbTnvVlJSdED2QfjPo3mK0=;
        b=fzGc/f4CkoqtQcTwg9qk1nJ4IzQH6kOEonnJZvvJiCbOo+5t9eH/ozQjH7JdvOKNvY
         kBEOVS3Cfz+gZ8TPVidUnxVunRXuD5GgWgXblJhj117+ipCfypHuNduBjuwemMXaNWOA
         DjJvexTC4q9+IMeUL6txZzgHx2sqjJwZylYfAE+K6HcvqEcVHZ/R0WE5/MOC6WD0LAjf
         3gBdyD3EFvcsGSXTgmufS/j6AHDQ0tFr05ENoPCB85AlJS9wBgIXMX9mC7W31hjHNGu2
         TpD87WK4u1N4AUoCGPLKs8Gx5IATvPu+IsQHhGKj9JeQRUxrxcFa7URRSG24l35m8W7t
         6w/w==
X-Gm-Message-State: ABy/qLaJACY0vxx73yqn7Nq4YqA9XdsKx9BDVEYEf12RV1EhkYGbb+O3
	J0LODqODzp2LiK0KIJGQIlzKFg==
X-Google-Smtp-Source: APBJJlEwZvOZFx9jGjKzTSquavLLMGpfSvcqz9eU7eg6dlZXcBSsj/oLHuzFIs4w1OrikNKIVtKqsg==
X-Received: by 2002:a17:907:1186:b0:991:e12e:9858 with SMTP id uz6-20020a170907118600b00991e12e9858mr9809390ejb.64.1689574780367;
        Sun, 16 Jul 2023 23:19:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lf16-20020a170907175000b00993928e4d1bsm8710466ejc.24.2023.07.16.23.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 23:19:39 -0700 (PDT)
Message-ID: <793b6cc7-f939-a889-1e4c-6ed8ff857e5d@linaro.org>
Date: Mon, 17 Jul 2023 08:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: i3c: Add mctp-controller
 property
Content-Language: en-US
To: Matt Johnston <matt@codeconstruct.com.au>, linux-i3c@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230717040638.1292536-1-matt@codeconstruct.com.au>
 <20230717040638.1292536-2-matt@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717040638.1292536-2-matt@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_231942_938710_68558D77 
X-CRM114-Status: GOOD (  11.28  )
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

On 17/07/2023 06:06, Matt Johnston wrote:
> This property is used to describe a I3C bus with attached MCTP I3C
> target devices.
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> ---
> 
> v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
