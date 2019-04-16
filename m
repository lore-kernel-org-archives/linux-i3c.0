Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D464C10F14
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 05:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CCE02075B
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 05:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7bb0v4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CCE02075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sxIJYjHIxgJJbAC7+asFHoW01GFizTHaZoVAqWuMX8=; b=f7bb0v4O3pcZBG
	n+hDNY316oa2/dA0l9uYYQRlys97Mk8PsZ3S+JF4W7yh2wT+LkV4QJDkB8lDSISTipQ9iCCxP5USP
	aOC2DPGWsBySl3jOQ6FDokFfwh+k++4HfNFhrber78oqT1IJ12bUQPVYwhxJ8EEVzVLTZQ8nC9d0P
	ROfezs0jty+mNUFkZThvMtR7YyKtI4jRO2YKDaF6CwnaWthKiSA8m5hdp2XdUrnApkzk7nhIAALfH
	+3RbncBfYzcsP3KFW1vUKPajnDCppPI/0RYcLgHSrf0iXl8tvkzS7WWaO/DMQrFAa1TjqyNfrXci5
	EgURLlhKymBZ4PMBLSrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGGzZ-00087R-R7; Tue, 16 Apr 2019 05:50:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGGzX-00086w-66
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 05:50:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9762A260FF2;
 Tue, 16 Apr 2019 06:50:44 +0100 (BST)
Date: Tue, 16 Apr 2019 07:50:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH 1/3] i3c: fix i2c and i3c scl rate by bus mode
Message-ID: <20190416075041.22f8e849@collabora.com>
In-Reply-To: <05fdeea79db83970e9ecb0d7045b4dd98f206f06.1555350118.git.vitor.soares@synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
 <05fdeea79db83970e9ecb0d7045b4dd98f206f06.1555350118.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_225047_497235_BAF925F4 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 15 Apr 2019 20:46:41 +0200
Vitor Soares <vitor.soares@synopsys.com> wrote:

> Currently in case of mixed slow bus topologie and all i2c devices
> support FM+ speed, the i3c subsystem limite the SCL to FM speed.

"
Currently the I3C framework limits SCL frequency to FM speed when
dealing with a mixed slow bus, even if all I2C devices are FM+ capable.
"

> Also in case on mixed slow bus mode the max speed for both
> i2c or i3c transfers is FM or FM+.

Looks like you're basically repeating what you said above.

> 
> This patch fix the definition of i2c and i3c scl rate based on bus

	     ^fixes					      on the bus

> topologie and LVR[4] if no user input.

  ^topology		^if the rate is not already specified by the user.

> In case of mixed slow mode the i3c scl rate is overridden.

							   ^ with the max
I2C rate.

> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <stable@vger.kernel.org>
> Cc: <linux-kernel@vger.kernel.org>
> ---
>  drivers/i3c/master.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 909c2ad..1c4a86a 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -564,20 +564,30 @@ static const struct device_type i3c_masterdev_type = {
>  	.groups	= i3c_masterdev_groups,
>  };
>  
> -int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode)
> +int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
> +		     unsigned long i2c_scl_rate)


Can we rename the last arg into max_i2c_scl_rate?

>  {
>  	i3cbus->mode = mode;
>  
> -	if (!i3cbus->scl_rate.i3c)
> -		i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> -
> -	if (!i3cbus->scl_rate.i2c) {
> -		if (i3cbus->mode == I3C_BUS_MODE_MIXED_SLOW)
> -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> -		else
> -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> +	switch (i3cbus->mode) {
> +	case I3C_BUS_MODE_PURE:
> +		if (!i3cbus->scl_rate.i3c)
> +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +		break;
> +	case I3C_BUS_MODE_MIXED_FAST:
> +		if (!i3cbus->scl_rate.i3c)
> +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +		if (!i3cbus->scl_rate.i2c)
> +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> +		break;
> +	case I3C_BUS_MODE_MIXED_SLOW:
> +		if (!i3cbus->scl_rate.i2c)
> +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> +		i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;

Maybe we should do

		if (!i3cbus->scl_rate.i3c ||
		    i3cbus->scl_rate.i3c > i3cbus->scl_rate.i2c)
			i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;
					   
Just in case the I3C rate forced by the user is lower than the max I2C
rate.

The patch looks good otherwise.

> +		break;
> +	default:
> +		return -EINVAL;
>  	}
> -
>  	/*
>  	 * I3C/I2C frequency may have been overridden, check that user-provided
>  	 * values are not exceeding max possible frequency.
> @@ -1980,9 +1990,6 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	/* LVR is encoded in reg[2]. */
>  	boardinfo->lvr = reg[2];
>  
> -	if (boardinfo->lvr & I3C_LVR_I2C_FM_MODE)
> -		master->bus.scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> -
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
>  	of_node_get(node);
>  
> @@ -2432,6 +2439,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			const struct i3c_master_controller_ops *ops,
>  			bool secondary)
>  {
> +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
>  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
>  	struct i2c_dev_boardinfo *i2cbi;
> @@ -2481,9 +2489,12 @@ int i3c_master_register(struct i3c_master_controller *master,
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
