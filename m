Return-Path: <SRS0=RUID=6A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DC6C2BB55
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2020 12:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5A1206E9
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2020 12:03:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="saqpAiQ8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bingham-xyz.20150623.gappssmtp.com header.i=@bingham-xyz.20150623.gappssmtp.com header.b="WEm8jhqd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5A1206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bingham.xyz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XGnrdvgk07B6aM907b5YREZFJvYViVLzL2aM+hwBkU=; b=saqpAiQ86vKlDF
	Avn0zsgk39stPtEHcpbrkMqyjYbkajT1aDcFCtDe+GdB2yFnmo0BzE2tbJKj6gzPy5ziyDxf9ETWo
	y490+5c7w23SFsBLfA+snQWmmfO2Qh1h7EvYWVoGAyMkIfSuNY/3Q0IhwyEW7o7x3DITBm9zDG0HE
	TiI+jrHxd2skcnlpt/BJ4zzWgbr3Rz3uTDODmb5p+oGr+h8UmRGn89koBHd5Rkwx5rLn8yY8BNFvb
	AVx7pDLMcETOxGRubLySAN0yfPRBBKgjlkXT/zsoZoRGvFpT7tn+zuGqSqKtKST55XpILImaLI34L
	Q4NLna9SEYNcRpaxRXeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP3Ec-0004wo-Sh; Thu, 16 Apr 2020 12:03:10 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOdiy-0004VQ-7k
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:48:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id u13so17619761wrp.3
 for <linux-i3c@lists.infradead.org>; Wed, 15 Apr 2020 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EV5cZQCkbQanB0lPQS10XkYLf15qJlxPNzHeKA7zsLw=;
 b=WEm8jhqdU1woAxVuZBEqvWaqlQkGFqXgT0EEeizN/GYrDU8HzSam3p5Bh0bKFdPIUV
 3E3T9OEkaeu2Lq6dG5A2NxKCHa/dRd7m6cYtQC6DU+grEEb9y1YcSXKqCwHA6VuVeb5a
 xOk7Lf6NIj7aQF6KYpKp1Juxn/bCnifH//THfrr0HVIiTaEfVGaupdRS554jdY3C/FRa
 94KD8mtj5A5WJlxMl36ainFivi0yCJ8l7ZdwWNHKx0nvq9sgBaa+oFU0IhZmYktEhu++
 k05ptqfH8j3mLQbrbM1h/2CieyAjHdYIME2g9eQyH4fJ++zhwNb/Htd5j8YT/n8DZ5AW
 0JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EV5cZQCkbQanB0lPQS10XkYLf15qJlxPNzHeKA7zsLw=;
 b=nZ+X1bKaTCFaRMo7pvYrpHR5P1Z76kl2N6r0fCw10fGvL42GN53DCDQEcwAmMjxjTq
 T41ElZ6R2SW9Of1mmx8W9xqBSbV7+1e8wzBVVsB3grPneaW0xSt8oepdZn4c3Ti7M614
 IGiux6IGpRymHVHqREkALZvSWNSmPU+3yhTmQ1BIe2iEd5kDqbvL3Iy6WrYX3AKxP9qF
 u/Iz8puzj0gZJ1D5y15hCU0pKsUOCfaoLrZEVIvDt2arbpdhDOD6ExwI/YJMPKil4Wgt
 zjvWQBQGgLK4VNABo016G1HmKRmlNSZ7tEW7tZae11xLxL0tbdaQhRVxY5AM3hn1iAYg
 FEpQ==
X-Gm-Message-State: AGi0PuZvClYPi8hP+r4xdD3pxus8wxcAQz/tWR+tABo1c0yLmSut7oyD
 dX6DHvfaCjzHcDrIon8VS58gAA==
X-Google-Smtp-Source: APiQypJ1QuWXon39j7rg9O4EUM0G25LnqKPwxKa/minvpBY5w+Ttpn13mJtxU3cCUWEm65PHXRdisg==
X-Received: by 2002:a5d:6645:: with SMTP id f5mr29429303wrw.280.1586940526517; 
 Wed, 15 Apr 2020 01:48:46 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
 by smtp.gmail.com with ESMTPSA id i25sm21874124wml.43.2020.04.15.01.48.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 01:48:45 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
From: Kieran Bingham <kieran@bingham.xyz>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <74aa4084-588f-1b6f-2256-44588c48edf6@bingham.xyz>
Date: Wed, 15 Apr 2020 09:48:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_014848_279365_6B55C58C 
X-CRM114-Status: GOOD (  26.08  )
X-Mailman-Approved-At: Thu, 16 Apr 2020 05:03:09 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Wolfram,

On 18/03/2020 15:00, Wolfram Sang wrote:
> Sometimes, we have unknown devices in a system and still want to block
> their address. For that, we allow DT nodes with only a 'reg' property.
> These devices will be bound to the "dummy" driver but with the name
> "reserved". That way, we can distinguish them and even hand them over to
> the "dummy" driver later when they are really requested using
> i2c_new_ancillary_device().

Oh how I long to be able to give these 'identifiable names' within the
system, but that will probably mess up all the driver matching and
binding, so would be quite tricky perhaps.

But I like the ability to distinguish the two different types.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 2 --
>  Documentation/devicetree/bindings/i2c/i2c.txt        | 4 +++-
>  drivers/i2c/i2c-core-base.c                          | 1 +
>  drivers/i2c/i2c-core-of.c                            | 8 +++-----
>  drivers/i2c/i2c-core.h                               | 1 +
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 6b25a80ae8d3..fc8ea27934b3 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -50,7 +50,6 @@ Examples:
>  		reg-io-width = <1>;	/* 8 bit read/write */
>  
>  		dummy@60 {
> -			compatible = "dummy";
>  			reg = <0x60>;
>  		};
>  	};
> @@ -68,7 +67,6 @@ or
>  		reg-io-width = <1>;	/* 8 bit read/write */
>  
>  		dummy@60 {
> -			compatible = "dummy";
>  			reg = <0x60>;
>  		};
>  	};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 9a53df4243c6..989b315e09dc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -21,7 +21,9 @@ flags can be attached to the address. I2C_TEN_BIT_ADDRESS is used to mark a 10
>  bit address. It is needed to avoid the ambiguity between e.g. a 7 bit address
>  of 0x50 and a 10 bit address of 0x050 which, in theory, can be on the same bus.
>  Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we listen to
> -be devices ourselves.
> +be devices ourselves. The 'reg' property of a child is required. The
> +'compatible' property is not. Empty 'compatible' child entries can be used to
> +describe unknown devices or addresses which shall be blocked for other reasons.
>  
>  Optional properties
>  -------------------
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 3d7b8a00a7d9..84464e439df5 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -854,6 +854,7 @@ EXPORT_SYMBOL_GPL(i2c_unregister_device);
>  
>  static const struct i2c_device_id dummy_id[] = {
>  	{ I2C_DUMMY_DRV_NAME, 0 },
> +	{ I2C_RESERVED_DRV_NAME, 0 },
>  	{ },
>  };
>  
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 6787c1f71483..d8d111ad6c85 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -27,17 +27,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>  
>  	memset(info, 0, sizeof(*info));
>  
> -	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
> -		dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
> -		return -EINVAL;
> -	}
> -
>  	ret = of_property_read_u32(node, "reg", &addr);
>  	if (ret) {
>  		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
>  		return ret;
>  	}
>  
> +	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
> +		strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
> +
>  	if (addr & I2C_TEN_BIT_ADDRESS) {
>  		addr &= ~I2C_TEN_BIT_ADDRESS;
>  		info->flags |= I2C_CLIENT_TEN;
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index fb89fabf84d3..77b3a925ed95 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -23,6 +23,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
>  			       unsigned int num_resources);
>  
>  #define I2C_DUMMY_DRV_NAME "dummy"
> +#define I2C_RESERVED_DRV_NAME "reserved"
>  
>  /*
>   * We only allow atomic transfers for very late communication, e.g. to send
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
