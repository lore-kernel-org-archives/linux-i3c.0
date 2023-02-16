Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382ECC636CC
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMz+PBam1FEJ3+ZAoBBTx87HbY/TCcMQvuauQj9hniE=; b=ShHJ0vkE+6FBmd
	rY9iDNoCqggrCotU+wqtPeQZZ2rF0bC2lRYA5rPZybLFkYvZieCFn1BUgSU44ztmBQ6mnWEb2G/6p
	TFD+art7XqOFIiqAbwtdc4dIApAtV1F5hDHSiakhWF9p5+K60cI34HKxK1gg0NhK+FGndVc9JsiRK
	/Jxu6mlGB4cOnMpXkuD2Rtc0mF2Pk3Ia8+VXL/SUzdV5EBaxtoITyBM3PB7K+xoHO7pvybJmH+RQe
	O6/pE63YLo/Lzs25SXchX+owLMq8CdWHlNv1hTXt8qiZhG77+QCMT76yAxf4mxy1w6Z+WBYv9LQDO
	jntwn3wjQjgEtGlawn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfnz-00AnPv-7v; Thu, 16 Feb 2023 15:04:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfnv-00AnOc-Pd
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 15:04:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id m14so2106796wrg.13
        for <linux-i3c@lists.infradead.org>; Thu, 16 Feb 2023 07:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ4D1e7OsydChicX50RhYW35hCzCmSAMZsBfa+Xta+0=;
        b=SNz8dv5zMWNJuuPbgHGxQDPr/JPYIjY+/Yn3i8jbcWefLvGrtBBslS4YbYeD18sYar
         3vHRciM2MR8NfSDR+NgRzxZ9elZcLE6bzJlPl0pVou0ce9bxWjQjBVTHf58S3N7KTAwf
         ci1Vzxpr3ceLWo7TBeqCnA+x6t/qW1MCN5RekRKn3XbHrZSiayRrVvZt3D0DVxEqOjyd
         zGWRRbL0UrxYQNcLBbJJhwmqlbCGfvtRQfsboU+PI+4Gdmfx9Ny5WQY4kWoSYUZE1r+E
         DELL42Q4JzyosvMCQZnmlXDmyRg0/GpntLP/kDYSynSi6H/9Ftbhp0LStArH8XAwloez
         81nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ4D1e7OsydChicX50RhYW35hCzCmSAMZsBfa+Xta+0=;
        b=pTab/T1WhH4DqZnjlrPpZ7L2n3lSua2C5K3U59/LsU5HNVzE97BIGybqH+haX5QcZ3
         w2kionYWtgbZ1/XQ2FwtWfFLrmcF7L7RlWBNHsEf/6mphTeP1o8mi0U9BuHbtr3JmlN7
         a5t4Uk9jSewmytsrkaryZhRousi5+fT9DrQSpIQo3tZ++ssSgVaY7NiPTDbgntTRuOqJ
         ZzsyEOYhIIhmB+sj+ghB+OGasKM4tZca/LRXx6rS2oxKcTilQ4omtOPT9pV+jQEKoPUi
         xDyrCi4b/5ck9ZHMq4CBw2fWKvDFnspht2AN/S57L6LLC7wA+tTW6RSGpNVGPHOAHCCA
         vvhQ==
X-Gm-Message-State: AO0yUKVCDrYCXYY+AWrluJtsnz6umK010U7E1AiXxPUVopisMj2+pP4f
	8oN9CIttHJJi7K97s7gEx+HMHQ==
X-Google-Smtp-Source: AK7set8vMvgLkfVuOhbBQcIoMKcYBI3CyptMMUKw+8/IdahJJGKA/oBlPMJi1NauBsBuPE9BP4H+ig==
X-Received: by 2002:adf:f888:0:b0:2c3:e993:9d7d with SMTP id u8-20020adff888000000b002c3e9939d7dmr4733394wrp.30.1676559847439;
        Thu, 16 Feb 2023 07:04:07 -0800 (PST)
Received: from [10.35.4.184] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id c4-20020adfe704000000b002c5534db60bsm1714097wrm.71.2023.02.16.07.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 07:04:07 -0800 (PST)
Message-ID: <9b374250-3afc-6277-d1c6-0dac1c682bca@sifive.com>
Date: Thu, 16 Feb 2023 15:04:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/4] i3c: dw: Add platform operations
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vitor Soares <ivitro@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
 <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_070411_862895_235CD888 
X-CRM114-Status: GOOD (  27.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 16/02/2023 07:41, Jeremy Kerr wrote:
> The dw i3c core can be integrated into various SoC devices. Platforms
> that use this core may need a little configuration that is specific to
> that platform.
> 
> Add a little infrastructure to allow platform-specific behaviour: a bit
> of data on struct dw_i3c_master, and two hooks to the probe and init
> calls to enable this.
> 
> A future change will add new platform support that uses these hooks.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 42 +++++++++++++++++++++++++-----
>   1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d73d57362b3b..49b891449222 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -241,6 +241,17 @@ struct dw_i3c_master {
>   	char version[5];
>   	char type[5];
>   	u8 addrs[MAX_DEVS];
> +
> +	/* platform-specific data */
> +	const struct dw_i3c_platform_ops *platform_ops;
> +	union {
> +	} pdata;
> +
> +};
> +
> +struct dw_i3c_platform_ops {
> +	int (*probe)(struct dw_i3c_master *i3c, struct platform_device *pdev);
> +	int (*init)(struct dw_i3c_master *i3c);
>   };

Given the comment below having this and the main probe defined in a 
header so users can just call in and we don't have to change the
main code here every time someone comes up with their own
special way of handing this?

>   struct dw_i3c_i2c_dev_data {
> @@ -612,6 +623,12 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>   	u32 thld_ctrl;
>   	int ret;
>   
> +	if (master->platform_ops && master->platform_ops->init) {
> +		ret = master->platform_ops->init(master);
> +		if (ret)
> +			return ret;
> +	}

I'd rather have a "default" set of ops than have all this checking for
NULL pointers all over the place.

> +
>   	switch (bus->mode) {
>   	case I3C_BUS_MODE_MIXED_FAST:
>   	case I3C_BUS_MODE_MIXED_LIMITED:
> @@ -1128,8 +1145,15 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>   	.i2c_xfers = dw_i3c_master_i2c_xfers,
>   };
>   
> +static const struct of_device_id dw_i3c_master_of_match[] = {
> +	{ .compatible = "snps,dw-i3c-master-1.00a", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> +
>   static int dw_i3c_probe(struct platform_device *pdev)
>   {
> +	const struct of_device_id *match;
>   	struct dw_i3c_master *master;
>   	int ret, irq;
>   
> @@ -1181,6 +1205,18 @@ static int dw_i3c_probe(struct platform_device *pdev)
>   	master->maxdevs = ret >> 16;
>   	master->free_pos = GENMASK(master->maxdevs - 1, 0);
>   
> +	/* match any platform-specific ops */
> +	match = of_match_node(dw_i3c_master_of_match, pdev->dev.of_node);
> +	if (match && match->data)
> +		master->platform_ops = match->data;

I'm sure there's a of_device_get_match_data() which would have
both removed hte need to move the match table around and the
call to of_match_node().

> +
> +	/* platform-specific probe */
> +	if (master->platform_ops && master->platform_ops->probe) {
> +		ret = master->platform_ops->probe(master, pdev);
> +		if (ret)
> +			goto err_assert_rst;
> +	}
> +
>   	ret = i3c_master_register(&master->base, &pdev->dev,
>   				  &dw_mipi_i3c_ops, false);
>   	if (ret)
> @@ -1213,12 +1249,6 @@ static int dw_i3c_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static const struct of_device_id dw_i3c_master_of_match[] = {
> -	{ .compatible = "snps,dw-i3c-master-1.00a", },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> -
>   static struct platform_driver dw_i3c_driver = {
>   	.probe = dw_i3c_probe,
>   	.remove = dw_i3c_remove,


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
