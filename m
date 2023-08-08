Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB90DC001B0
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Aug 2023 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY7QODjG8uBcHHN1J/nM/hyV8kICmMpoOqB+RDiPsCg=; b=gwW3DIdhZ/10Nk
	EXyUoNTCFKxX0Lmy3CSlTKx2j0McN0POZvuLZxQDheleh/L8lNKEnE1I91AVY7FI3xVEZLateG9k1
	WpwANx1Njy4rmtYEJTLNw+1o0TnNjhv1ivamBsAdz/lNuv99IZVbX5cCsPcnml3rw26LcYru8qSxs
	qPUL90KPuXS0YdZvoY6otZuDMXE5zkGk1kQRWPkSALzve7/tWHaSGYhJsnLRny+NVIozQxbYotPrp
	8QNTNvx2sDoK5m70jKGehXBrtYMa1PEu10r6Hew5l6dZOmbrROiLgBsOUe1Jo4qg4tqX82dSIOmx3
	KZsGSAYFa2PALiZZuY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTP7x-002sBa-1m;
	Tue, 08 Aug 2023 16:00:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTP7u-002sAQ-3A
	for linux-i3c@lists.infradead.org;
	Tue, 08 Aug 2023 16:00:08 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe1344b707so9166964e87.1
        for <linux-i3c@lists.infradead.org>; Tue, 08 Aug 2023 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510404; x=1692115204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RE7wtMExHdhFwKLLqjqt4LfjR7+37ThDsOcCDy3qTQQ=;
        b=PwDjsnZPpEOON21XmhMp+u0sisjWLyBSPad9QxaLPGHW7nSgAhPQ1LjU8UOwI1vfor
         45ifcbnWH1NYoLzcAuTvGv4NZkjNtXLa5B6BV17UibKiSQyTh8i/wDL3p27vY8Fzo7LU
         2DEQiC1nO0B/mkA/afSZBymtADJ2geddDbPz+lpTZHxbRYPlKJt/uJyqkdm0ZOS0AgRE
         dqIS/yf3dlUwkL0lvfcDs237LoV3SHlzAVxCBlRku/R4G1vjxTgUuTCzfA7xkw1lOL54
         7mdiOer0rm7E2e6f1jzUu1hGB8TrtXdhr+55sG74Fhwm+KDUGQGjkteDF4AXRAFFw/fg
         sv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510404; x=1692115204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RE7wtMExHdhFwKLLqjqt4LfjR7+37ThDsOcCDy3qTQQ=;
        b=BAM10UsCbId25+5R0+w/2Phniib8FUKhrNaaR1fQNWpwqqjU/G+Pl5ISKxerPznFnB
         N3u5elpzJn5uc7QwUNZ39f0Xg+NL3LRJOV+uRAdYi2qOARyXUxFC+NzzEXaBEky8XV3x
         xDzMuzQqCJnpTfifnCWxPUdyYIzt7pGK4cVGLWl7SY/DhYWNsS6LKgN3gtKuFRMzXZk9
         JKR/59BXG2mY7zwUaxmFhhmo0e/0Ll473FzY80UrGFe+1IzfCCVhj7i/C/T5ZG7DBwfB
         dCL4ot8ksnxHybr0VjOx0TbLgTefrD3/qCXa0cCTKQ+S0wQZh2lfkTQ4BRvngMFqLOQh
         6TSA==
X-Gm-Message-State: AOJu0Yy5CTsJsS2K0ve/4p6rJKsQRHK/yrnuof3VPm30AC4o/y3QRMVp
	wFAZ9EZlxMaJ9SOAB+lZukW8KDHrlvVCKONWdhw=
X-Google-Smtp-Source: AGHT+IHbksfzqPLdhw5/yCLJTbCZEOgLAM2KQI/YGEb2WX3hUJsxDJkD4J/0HYLK1y1YsVgSMdIzhA==
X-Received: by 2002:ac2:4850:0:b0:4fe:56d8:631d with SMTP id 16-20020ac24850000000b004fe56d8631dmr8327458lfy.25.1691510404500;
        Tue, 08 Aug 2023 09:00:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id j18-20020aa7c0d2000000b0052239012c65sm6837797edp.82.2023.08.08.09.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 09:00:03 -0700 (PDT)
Message-ID: <f85df327-c321-8c1e-2043-c60210fbed56@linaro.org>
Date: Tue, 8 Aug 2023 18:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] i3c: ast2600: Add reset deassertion for global
 registers
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>, jk@codeconstruct.com.au,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@aj.id.au, p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
 <20230808154241.749641-4-dylan_hung@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808154241.749641-4-dylan_hung@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_090007_027310_C4CBE40B 
X-CRM114-Status: GOOD (  15.01  )
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
> Add missing reset deassertion of the I3C global control registers.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
>  drivers/i3c/master/ast2600-i3c-master.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
> index 09ed19d489e9..5d9d060134e0 100644
> --- a/drivers/i3c/master/ast2600-i3c-master.c
> +++ b/drivers/i3c/master/ast2600-i3c-master.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/reset.h>
>  
>  #include "dw-i3c-master.h"
>  
> @@ -128,6 +129,7 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct of_phandle_args gspec;
>  	struct ast2600_i3c *i3c;
> +	struct reset_control *rst;
>  	int rc;
>  
>  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> @@ -156,6 +158,13 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "invalid sda-pullup value %d\n",
>  			i3c->sda_pullup);
>  
> +	rst = devm_reset_control_get_shared(&pdev->dev, "global_rst");
> +	if (IS_ERR(rst)) {
> +		dev_err(&pdev->dev, "missing of invalid reset entry");
> +		return PTR_ERR(rst);

return dev_err_probe

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
