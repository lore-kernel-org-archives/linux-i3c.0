Return-Path: <SRS0=rn8d=6Z=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EAEC54E8D
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2020 15:44:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCD9206A3
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2020 15:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UstahoZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCD9206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q68KPBbc4jEnAQ/gCTShAZjpzzjFUMWtT/UD2UollYk=; b=UstahoZBCqj12s
	X6WBksabwZ+mf1/V6xYULaG/EjudxuDVfB5Rw+cllvernvwX22r9zSAT9F7uSZ7RoDyqI4dhJNoms
	oDKdTaNnMf9U2F/ooIwjYY80kMq0Fe40HkL7WunmxYDjhtUwZeoC+jkujTLz4vhzLdQO7GgRi7GiB
	14a/jkJjUIwbTB+MLsuh1c05s+V50VKkcFTJFP1yp/rusmqlC6nyF/3ngC3qBHZvXK92uLLjF0LiJ
	KN+Mk0qsyUGIq23RnpusRUTGuCyYd+qiGhQGgKJr9ye8zWl1/kOjCAwLX9aBjPNMAYE9+FaJOVx2g
	qqCGc44SFG21HBbRWy4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAbm-0005Ft-Tt; Mon, 11 May 2020 15:44:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAbk-0005FC-5B
 for linux-i3c@lists.infradead.org; Mon, 11 May 2020 15:44:45 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B36BB2A0A4B;
 Mon, 11 May 2020 16:44:40 +0100 (BST)
Date: Mon, 11 May 2020 17:44:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v7 2/7] i3c: master: use i3c_master_register only for
 main master
Message-ID: <20200511174437.1a886231@collabora.com>
In-Reply-To: <1589202785-6174-1-git-send-email-pthombar@cadence.com>
References: <1589202702-4879-1-git-send-email-pthombar@cadence.com>
 <1589202785-6174-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_084444_462609_F89053C2 
X-CRM114-Status: GOOD (  20.40  )
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
Cc: mparab@cadence.com, bbrezillon@kernel.org, praneeth@ti.com,
 linux-kernel@vger.kernel.org, vitor.soares@synopsys.com, pgaj@cadence.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 11 May 2020 15:13:05 +0200
Parshuram Thombare <pthombar@cadence.com> wrote:

> Removed last argument 'secondary' and refactored
> i3c_master_register to move code that can be common
> to i3c_secondary_master_register to separate function
> i3c_master_init.
> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  drivers/i3c/master.c                 | 69 +++++++++++++++++-----------
>  drivers/i3c/master/dw-i3c-master.c   |  2 +-
>  drivers/i3c/master/i3c-master-cdns.c |  2 +-
>  include/linux/i3c/master.h           |  3 +-
>  4 files changed, 46 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52121fe..ba07a7d49633 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2391,31 +2391,10 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  	return 0;
>  }
>  
> -/**
> - * i3c_master_register() - register an I3C master
> - * @master: master used to send frames on the bus
> - * @parent: the parent device (the one that provides this I3C master
> - *	    controller)
> - * @ops: the master controller operations
> - * @secondary: true if you are registering a secondary master. Will return
> - *	       -ENOTSUPP if set to true since secondary masters are not yet
> - *	       supported
> - *
> - * This function takes care of everything for you:
> - *
> - * - creates and initializes the I3C bus
> - * - populates the bus with static I2C devs if @parent->of_node is not
> - *   NULL
> - * - registers all I3C devices added by the controller during bus
> - *   initialization
> - * - registers the I2C adapter and all I2C devices
> - *
> - * Return: 0 in case of success, a negative error code otherwise.
> - */
> -int i3c_master_register(struct i3c_master_controller *master,
> -			struct device *parent,
> -			const struct i3c_master_controller_ops *ops,
> -			bool secondary)
> +static int i3c_master_init(struct i3c_master_controller *master,
> +			   struct device *parent,
> +			   const struct i3c_master_controller_ops *ops,
> +			   bool secondary)
>  {
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
>  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
> @@ -2482,6 +2461,45 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_put_dev;
>  
> +	return 0;
> +
> +err_put_dev:
> +	put_device(&master->dev);
> +
> +	return ret;
> +}
> +
> +/**
> + * i3c_master_register() - register an I3C master

The function should be renamed and the doc updated to reflect the fact
that it only works for primary masters:

i3c_primary_master_register() - register a primary I3C master

> + * @master: master used to send frames on the bus
> + * @parent: the parent device (the one that provides this I3C master
> + *	    controller)
> + * @ops: the master controller operations
> + * @secondary: true if you are registering a secondary master. Will return
> + *	       -ENOTSUPP if set to true since secondary masters are not yet
> + *	       supported

This argument no longer exists.

> + *
> + * This function takes care of everything for you:
> + *
> + * - creates and initializes the I3C bus
> + * - populates the bus with static I2C devs if @parent->of_node is not
> + *   NULL
> + * - registers all I3C devices added by the controller during bus
> + *   initialization
> + * - registers the I2C adapter and all I2C devices
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_master_register(struct i3c_master_controller *master,
> +			struct device *parent,
> +			const struct i3c_master_controller_ops *ops)
> +{
> +	int ret;
> +
> +	ret = i3c_master_init(master, parent, ops, false);
> +	if (ret)
> +		return ret;
> +
>  	ret = device_add(&master->dev);
>  	if (ret)
>  		goto err_cleanup_bus;
> @@ -2511,7 +2529,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>  err_cleanup_bus:
>  	i3c_master_bus_cleanup(master);
>  
> -err_put_dev:
>  	put_device(&master->dev);
>  
>  	return ret;
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1d83c97431c7..5d5a8a90ec06 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1158,7 +1158,7 @@ static int dw_i3c_probe(struct platform_device *pdev)
>  	master->free_pos = GENMASK(master->maxdevs - 1, 0);
>  
>  	ret = i3c_master_register(&master->base, &pdev->dev,
> -				  &dw_mipi_i3c_ops, false);
> +				  &dw_mipi_i3c_ops);
>  	if (ret)
>  		goto err_assert_rst;
>  
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 8889a4fdb454..ed4f43807f9e 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1615,7 +1615,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
>  
>  	ret = i3c_master_register(&master->base, &pdev->dev,
> -				  &cdns_i3c_master_ops, false);
> +				  &cdns_i3c_master_ops);
>  	if (ret)
>  		goto err_disable_sysclk;
>  
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f13fd8b1dd79..f5ba82c390bc 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -533,8 +533,7 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  
>  int i3c_master_register(struct i3c_master_controller *master,
>  			struct device *parent,
> -			const struct i3c_master_controller_ops *ops,
> -			bool secondary);
> +			const struct i3c_master_controller_ops *ops);
>  int i3c_master_unregister(struct i3c_master_controller *master);
>  
>  /**


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
