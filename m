Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F499C04AB5
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD4920665
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 14:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IVp6vzoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD4920665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjwbpILDz9R5U8c1CGV3H18q9llfBpStP7ct4uazuoU=; b=IVp6vzoOnQCqnF
	8PWRjl2nCjjittWG1/e+mVcXTsoT73c3N1T0UUcIipamWqTGAPpChkXmGS/61ru1aG5R7zUeYZwnX
	4arn66Ng3MYu7YDHG7Egx7SUdz4XO73HPUoUilQxj02ZENjp/KMKEQp963J/wVP7X9P3QI2ULgQJs
	WUcNHC8e31d9s3hHfJvlrzkHGpasn/2C64czRW+vtclNl066A3PyeoAxen7uR9RRxtEhPQKynxIZz
	7OZR8RmRLas1WnhOVZLgmAip9y4EewuTKl8kmF/Quo1X+3j4T2338DzwZfaexylPAqe0+M8PAk0nB
	XAi4HCuOT34PFbcPxBIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYtEE-0000vD-Eg; Thu, 06 Jun 2019 14:18:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYtEA-0000uA-Ff
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 14:18:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CE789284BB4;
 Thu,  6 Jun 2019 15:18:47 +0100 (BST)
Date: Thu, 6 Jun 2019 16:18:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 1/3] i3c: fix i2c and i3c scl rate by bus mode
Message-ID: <20190606161844.4a6b759c@collabora.com>
In-Reply-To: <47de89f2335930df0ed6903be9afe6de4f46e503.1559821228.git.vitor.soares@synopsys.com>
References: <cover.1559821227.git.vitor.soares@synopsys.com>
 <47de89f2335930df0ed6903be9afe6de4f46e503.1559821228.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_071850_789424_868DEA76 
X-CRM114-Status: GOOD (  19.85  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Joao.Pinto@synopsys.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu,  6 Jun 2019 16:00:01 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Currently the I3C framework limits SCL frequency to FM speed when
> dealing with a mixed slow bus, even if all I2C devices are FM+ capable.
> 
> The core was also not accounting for I3C speed limitations when
> operating in mixed slow mode and was erroneously using FM+ speed as the
> max I2C speed when operating in mixed fast mode.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <stable@vger.kernel.org>
> Cc: <linux-kernel@vger.kernel.org>
> ---
> Changes in v2:
>   Enhance commit message
>   Add dev_warn() in case user-defined i2c rate doesn't match LVR constraint
>   Add dev_warn() in case user-defined i3c rate lower than i2c rate.
> 
>  drivers/i3c/master.c | 61 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52..8cd5824 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -91,6 +91,12 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
>  	up_read(&bus->lock);
>  }
>  
> +static struct i3c_master_controller *
> +i3c_bus_to_i3c_master(struct i3c_bus *i3cbus)
> +{
> +	return container_of(i3cbus, struct i3c_master_controller, bus);
> +}
> +
>  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
>  {
>  	return container_of(dev, struct i3c_master_controller, dev);
> @@ -565,20 +571,48 @@ static const struct device_type i3c_masterdev_type = {
>  	.groups	= i3c_masterdev_groups,
>  };
>  
> -int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode)
> +int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
> +		     unsigned long max_i2c_scl_rate)
>  {
> -	i3cbus->mode = mode;
>  
> -	if (!i3cbus->scl_rate.i3c)
> -		i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +	struct i3c_master_controller *master = i3c_bus_to_i3c_master(i3cbus);
>  
> -	if (!i3cbus->scl_rate.i2c) {
> -		if (i3cbus->mode == I3C_BUS_MODE_MIXED_SLOW)
> -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> -		else
> -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> +	i3cbus->mode = mode;
> +
> +	switch (i3cbus->mode) {
> +	case I3C_BUS_MODE_PURE:
> +		if (!i3cbus->scl_rate.i3c)
> +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +		break;
> +	case I3C_BUS_MODE_MIXED_FAST:
> +		if (!i3cbus->scl_rate.i3c)
> +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +		if (!i3cbus->scl_rate.i2c)
> +			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
> +		break;
> +	case I3C_BUS_MODE_MIXED_SLOW:
> +		if (!i3cbus->scl_rate.i2c)
> +			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
> +		if (!i3cbus->scl_rate.i3c ||
> +		    i3cbus->scl_rate.i3c > i3cbus->scl_rate.i2c)
> +			i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;
> +		break;
> +	default:
> +		return -EINVAL;
>  	}
>  
> +	if (i3cbus->scl_rate.i3c < i3cbus->scl_rate.i2c)
> +		dev_warn(&master->dev,
> +			 "i3c-scl-hz=%ld lower than i2c-scl-hz=%ld\n",
> +			 i3cbus->scl_rate.i3c, i3cbus->scl_rate.i2c);
> +
> +	if (i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_SCL_RATE &&
> +	    i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_PLUS_SCL_RATE &&
> +	    i3cbus->mode != I3C_BUS_MODE_PURE)

If you are so strict, there's clearly no point exposing an i2c-scl-hz
property. I'm still not convinced having an i2c rate that's slower than
what the I2C/I3C spec defines as the *typical* rate is a bad thing, just
like I'm not convinced having an I3C rate that's slower than the I2C
one is a problem (it's definitely a weird situation, but there's nothing
preventing that in the spec).

> +		dev_warn(&master->dev,
> +			 "i2c-scl-hz=%ld not defined according MIPI I3C spec\n"
> +			 , i3cbus->scl_rate.i2c);

The comma should be on the previous line.

> +
>  	/*
>  	 * I3C/I2C frequency may have been overridden, check that user-provided
>  	 * values are not exceeding max possible frequency.
> @@ -1966,9 +2000,6 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	/* LVR is encoded in reg[2]. */
>  	boardinfo->lvr = reg[2];
>  
> -	if (boardinfo->lvr & I3C_LVR_I2C_FM_MODE)
> -		master->bus.scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> -
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
>  	of_node_get(node);
>  
> @@ -2417,6 +2448,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			const struct i3c_master_controller_ops *ops,
>  			bool secondary)
>  {
> +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
>  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
>  	struct i2c_dev_boardinfo *i2cbi;
> @@ -2466,9 +2498,12 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			ret = -EINVAL;
>  			goto err_put_dev;
>  		}
> +
> +		if (i2cbi->lvr & I3C_LVR_I2C_FM_MODE)
> +			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
>  	}
>  
> -	ret = i3c_bus_set_mode(i3cbus, mode);
> +	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
>  	if (ret)
>  		goto err_put_dev;
>  


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
