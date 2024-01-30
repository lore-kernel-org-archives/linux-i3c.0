Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E08C46CD2
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Jan 2024 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeLLKvb5bcJvwUjv+JfqxWZB7w68SSOBZkQYNKZYDkQ=; b=i4rhZxiITRQO7t
	B5jmxJlO/vPJESNwzmJFobARxLGQ4J2bPHwdn0dMmQ/DJjBjmP5pvGQzsfR+oCsUYBIpt5rfGtEuU
	fgLKK4jFCvOfwrrV/bt+Q74tEHr4Y+3NTRXrR9+RVnEh+R+aXf8AECaXTc+ime9E7p0sE5ZdcbNGA
	Yw3yYlFjqzaJAZd+CPee0BKYop3knyVXlXkz99XK7auj7A9Z/WjW5wEcpl3cqOByWVsEd6yziba0l
	G8DG87gaTuKOsRF6v6Jdi6uD/y40em82c+1u0wODq1PHEUKNjbDIflmFXCmRzfl2cPSTv0+ZKGnNB
	2TdV36286velBBPqQ1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjHM-0000000Fer7-43oF;
	Tue, 30 Jan 2024 08:15:36 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjHJ-0000000Feoy-3z2m
	for linux-i3c@lists.infradead.org;
	Tue, 30 Jan 2024 08:15:35 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a350bfcc621so387864066b.0
        for <linux-i3c@lists.infradead.org>; Tue, 30 Jan 2024 00:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706602531; x=1707207331; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhMp7KKsjo07nqB7KZNtEWJ6AL1gedASvjEszHUkpSM=;
        b=o0EK9sqRviN+2hplP5TDZPkgIdQC9x1EjrtDlEUFlbbONiOYmk5Mk7+wnOBnTHH9Bl
         xhz2eP4/hWMJXNk45aYMs4ZzLS54O/ehsbmMraXqiesInrXLOdNzxGbt+BXRKEfWjt6T
         BNct8C5/PMvNeRRGxx/EHCZyGixJG+iG5Vz2mhfmXOYYSDgF17+i3Ay8aFCNToYJRFms
         1JvBKiI9kez0QjxyGodDdmEsnhqjqsM9pj5Gs8jGnRNBQKj8akndUSVFK0lpOuA/MEwN
         f/AcuGGtUlxw5dN1iI+7lBOxSUzm5ARpBQ/HHkEl95QvuzlLq5k9Xx7Ih/w4rclzvr5f
         VMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706602531; x=1707207331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhMp7KKsjo07nqB7KZNtEWJ6AL1gedASvjEszHUkpSM=;
        b=BLyHMV3Khw4P70uW9zPNEcCNNs1niwGEYTN6rmjGX0Z25gLrbQ745Y/6FmuQ+8OrP9
         bChglaeWI36oMvep4i4DamcSYITlcMEcWi677LO7dx/3TikE3XzPsw7PljX7HpXfobcQ
         MK1yePVHtv0P3i6sGOSwVEF44pWclfzI1Vi3z0iI9SU9v8OIdqWm7sGlIcbbtKKBgx62
         9cQhD1oURq9kn/TIvh/xodI+YdfLTonfWuZYJ2PC/Eiu1LHY0p14L1XAyPs2JpA/fdMD
         /FmEoPIa2VQw0CbfNiOFlz+XG6KnC+ed2gUS/yLhbP1J0H62OsmQBmsvntcUaGNIWAEL
         sKWg==
X-Gm-Message-State: AOJu0YzqD728cGSBXP0uaIIUpDxPY93QSJ1pYWEY/bpFYvozhd2Rgd3/
	XUdScGP0ilcgO4ghG5qylBmB+lzrAWhz0yGAYzQxzhK9vzm54pPVAtN+JhQS3qk=
X-Google-Smtp-Source: AGHT+IEbD7LG12p286tpDqgpNwalI+adkVXaHQkutVJ57xIRpsIJJyVzZMK0ChiLS9ACxa9kw8wWkw==
X-Received: by 2002:a17:906:af0c:b0:a35:f647:ccac with SMTP id lx12-20020a170906af0c00b00a35f647ccacmr2198534ejb.44.1706602531368;
        Tue, 30 Jan 2024 00:15:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vw7-20020a170907a70700b00a35e26d86dfsm1410740ejc.201.2024.01.30.00.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 00:15:30 -0800 (PST)
Message-ID: <881d08a4-8bd7-4028-82f2-27bd70aff1e8@linaro.org>
Date: Tue, 30 Jan 2024 09:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: i3c: svc: add proptery mode
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, ilpo.jarvinen@linux.intel.com
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 jirislaby@kernel.org, joe@perches.com, krzysztof.kozlowski+dt@linaro.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, miquel.raynal@bootlin.com, robh@kernel.org,
 zbigniew.lukwinski@linux.intel.com
References: <20240129195321.229867-1-Frank.Li@nxp.com>
 <20240129195321.229867-3-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240129195321.229867-3-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_001534_029978_5410CDF1 
X-CRM114-Status: UNSURE (   6.00  )
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

On 29/01/2024 20:53, Frank Li wrote:
> Add 'mode' property to distinguish between 'controller' and 'target' modes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v3 to v4
>     -fix dtb check error
>     
>     Change from v2 to v3
>         - using 'mode' distringuish master and target mode

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
