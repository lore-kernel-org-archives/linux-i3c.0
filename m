Return-Path: <SRS0=RUID=6A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C51FC2BB85
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2020 12:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF4C20767
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2020 12:03:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nM1t2AMN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bingham-xyz.20150623.gappssmtp.com header.i=@bingham-xyz.20150623.gappssmtp.com header.b="m9HUIq5H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF4C20767
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bingham.xyz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NronLHK9i85bN/7G427xcD3mCiPQ8GndijiqbfP5SI=; b=nM1t2AMNgZl3Kr
	Pbv264twosF+1SrDozPNg73vQo7RiKDLJ9KhElNEgJ/lY3qwiOIjRRu9YpxjH7gkQSXsuNmnRNSYR
	JYFrctGaF8MWQZVo8x+p9xfvauskySiICT1HD0NK8KTXoHmJ7YZyF+K3a3K7HVnZfQJYuwPkZLhTf
	H1puCmckMg+gcrFgeMGk2NdrJa/XR1e2bw/FvQQpU0rqpoKzopHM7swzTHbDXqnGqX9DiEQ01w5O5
	rHb+ExwBoohqoSnyIXGFk8OA0+3cu2fpXachLQD2L/QiiSGp/spQpd/WlsTZDGt2EhwD88uYNR1rI
	5spJ5rKeMiTs0wqTFncA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP3Ec-0004wR-KG; Thu, 16 Apr 2020 12:03:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOdAg-0002QZ-AJ
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:13:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id j2so17987399wrs.9
 for <linux-i3c@lists.infradead.org>; Wed, 15 Apr 2020 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LkJy1QzawqhjFU7Ju2mePtspWxjtg9KAS6B4M0eMNdU=;
 b=m9HUIq5H+oLIX2WC1BdZc/+CaqnS09MKSv702r41ixSbnu6dII7McQQOZnDsxKkm8j
 5atEvh0mJi2JmQV8o6X9KZ9sY14Ei8LNscSoOLiD5uYV8Gx86FZFW4HviHRGDB+NJHPP
 +se3bh/MfXbs5bu1nS8ujaKCM1Rg8q2c+O3XOFLVL9Un5bVs4IrWLL5Iw6X4ZXSN/vKu
 KbRanE8tCncfNTQ9jFOwu6Hgtw8p5zSVHQ4+lMODAbYutEURV3PHfKhX9VgXZsWGl12G
 vwYqIBxkkvvsbjjwsc7RUSgcppwdYO2CIEI+uhY0BWFGwu1GM8nm3ioMITveHTRSlVpB
 C0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LkJy1QzawqhjFU7Ju2mePtspWxjtg9KAS6B4M0eMNdU=;
 b=LDVZyjuxUh3PJCZybNV+nJbE71q6O3fW0l0XZiJ0/2mzhDUmsCppbNIKVLHB07pvll
 /XKL5aF01NAbIqRgAXP8OMsYlNY5V0u9YaMnyRq9GpJTqhBXNeQZv1dJ6B3LAemHEM2t
 BbYHnZCwyCT3OuSdynLsw+hwoJASbVML93zXvM6Q+Wx/ACHzA5FSFC7eBS4BNlANqS35
 hRTywx8e82gNnTnmOPmkibguTnpoItIk7O2ScS+iDiOgzljcunY/xxKoEVGENQzSpL8K
 rAGZKNZnegHkmbTrFSxyTMoGCPBdAW9V30jS+CZ5Hma3RoOz9RaLYgwZ35Pzp0f7gQEG
 OLrw==
X-Gm-Message-State: AGi0PuYJnR/gdbe7eQqtfde5l3vFc0ZfIn9JTa2M3iyRXIduFxEue7HW
 nm0mtwtl+edMqFZ+Dm/tBpokIFUr1wkiZA==
X-Google-Smtp-Source: APiQypLXLpjm+jS1Epc7+Y97OpuX6dRuEM1+IHfEN7ZGnv4H1zPYyEbLzHb4vQSNVrR6FJ3J1/N5Og==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr28118889wrw.307.1586938399681; 
 Wed, 15 Apr 2020 01:13:19 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
 by smtp.gmail.com with ESMTPSA id v1sm17867775wrv.19.2020.04.15.01.13.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 01:13:18 -0700 (PDT)
Subject: Re: [RFC PATCH v2 3/6] i2c: of: remove superfluous parameter from
 exported function
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-4-wsa+renesas@sang-engineering.com>
From: Kieran Bingham <kieran@bingham.xyz>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <24725e14-232c-49be-3b11-dc8afe685c43@bingham.xyz>
Date: Wed, 15 Apr 2020 09:13:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-4-wsa+renesas@sang-engineering.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_011322_421939_FFC3D88F 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
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
> 'dev' is only used for printing an error message. However, that
> information is not needed because '%pOF' fully describes the location of
> the error. Drop the 'dev' and remove the superfluous parameter.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/i2c/i2c-core-of.c | 7 +++----
>  drivers/i3c/master.c      | 2 +-
>  include/linux/i2c.h       | 6 ++----
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index d8d111ad6c85..710704cd583e 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -19,8 +19,7 @@
>  
>  #include "i2c-core.h"
>  
> -int of_i2c_get_board_info(struct device *dev, struct device_node *node,
> -			  struct i2c_board_info *info)
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
>  {
>  	u32 addr;
>  	int ret;
> @@ -29,7 +28,7 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>  
>  	ret = of_property_read_u32(node, "reg", &addr);
>  	if (ret) {
> -		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
> +		pr_err("of_i2c: invalid reg on %pOF\n", node);
>  		return ret;
>  	}
>  
> @@ -69,7 +68,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>  
>  	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
>  
> -	ret = of_i2c_get_board_info(&adap->dev, node, &info);
> +	ret = of_i2c_get_board_info(node, &info);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f8f896fa0c3..cc0549a9fc64 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1943,7 +1943,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	if (!boardinfo)
>  		return -ENOMEM;
>  
> -	ret = of_i2c_get_board_info(dev, node, &boardinfo->base);
> +	ret = of_i2c_get_board_info(node, &boardinfo->base);
>  	if (ret)
>  		return ret;
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f834687989f7..d84aaf0d83d5 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -942,8 +942,7 @@ const struct of_device_id
>  *i2c_of_match_device(const struct of_device_id *matches,
>  		     struct i2c_client *client);
>  
> -int of_i2c_get_board_info(struct device *dev, struct device_node *node,
> -			  struct i2c_board_info *info);
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info);
>  
>  #else
>  
> @@ -969,8 +968,7 @@ static inline const struct of_device_id
>  	return NULL;
>  }
>  
> -static inline int of_i2c_get_board_info(struct device *dev,
> -					struct device_node *node,
> +static inline int of_i2c_get_board_info(struct device_node *node,
>  					struct i2c_board_info *info)
>  {
>  	return -ENOTSUPP;
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
