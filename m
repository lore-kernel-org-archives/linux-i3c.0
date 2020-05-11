Return-Path: <SRS0=rn8d=6Z=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA93C47255
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2020 16:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C2D206DB
	for <linux-i3c@archiver.kernel.org>; Mon, 11 May 2020 16:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dcoR8pGZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C2D206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjRCWn56SHLnzdaP/YeUR5OF/tWSzM4dETKIl9jEXSo=; b=dcoR8pGZfXCYkX
	uvlf47HQDgUM1pxQ4QpZgVcXQNr3Wb6b2jDqpexdJpa1rcdFjD2+vgQfF/q9UtKbxSs0pM6kPel7K
	NCamWDeNi+Q1rmRWyrK4WzTIuSp8eWqKrRqEUvJA7kmglaR6wOfX91/vknV1XgPiWzyydItBB4/kK
	GEk1CG5PRovHZWpAWNvdvNc/ZLvgd8yGy3P8oJapMQF3T4/CxbF8vil63wxnfHIIlnQJUkm/1JZ4D
	sQTfCibEYk5do8SaM7GY6auAUQH50O2pyu4U8U4da26gnprFQLvPPYnaOCRm1F2eK4FUVscRmHIW4
	QChroyLsgUd0+k/6v1pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYB4k-0008ML-43; Mon, 11 May 2020 16:14:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYB4g-0008L2-76
 for linux-i3c@lists.infradead.org; Mon, 11 May 2020 16:14:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2494F2A0E1A;
 Mon, 11 May 2020 17:14:35 +0100 (BST)
Date: Mon, 11 May 2020 18:14:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v7 3/7] i3c: master: add i3c_secondary_master_register
Message-ID: <20200511181431.442cdf0b@collabora.com>
In-Reply-To: <1589202833-6908-1-git-send-email-pthombar@cadence.com>
References: <1589202702-4879-1-git-send-email-pthombar@cadence.com>
 <1589202833-6908-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_091438_521155_015BE0E7 
X-CRM114-Status: GOOD (  26.56  )
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

On Mon, 11 May 2020 15:13:53 +0200
Parshuram Thombare <pthombar@cadence.com> wrote:

> add i3c_secondary_master_register which is used
> to register secondary masters.
> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  drivers/i3c/master.c       | 154 ++++++++++++++++++++++++++++++++++++-
>  include/linux/i3c/master.h |   3 +
>  2 files changed, 156 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ba07a7d49633..669bd7e45810 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1768,6 +1768,90 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	return ret;
>  }
>  
> +/**
> + * i3c_secondary_master_bus_init() - initialize an I3C bus for secondary
> + * master
> + * @master: secondary master initializing the bus
> + *
> + * This function does
> + *
> + * 1. Attach I2C devs to the master
> + *
> + * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> + *    the master controller. That's usually where the bus mode is selected
> + *    (pure bus or mixed fast/slow bus)

Can you really select the bus mode without knowing the I3C devices you
have on the bus? Or maybe that's a preliminary initialization which is
then updated when you receive DEFSLVS events.

> + *
> + * Once this is done, I2C devices should be usable.

I suspect you'll have to request bus ownership first, which means
they're not really usable, just registered to the I2C subsystem. This
might lead to a whole bunch of problems when drivers will try to send
messages to the I2C devices and receive ETIMEDOUT/EBUSY errors. We'll
probably need some updates to the I2C framework if we want I2C to play
nicely with bus handover, but I think we can keep that for later. I'd
suggest to forget about I2C for now and mark that as a limitation (no
I2C devs on secondary masters).

> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +static int i3c_secondary_master_bus_init(struct i3c_master_controller *master)
> +{
> +	enum i3c_addr_slot_status status;
> +	struct i2c_dev_boardinfo *i2cboardinfo;
> +	struct i2c_dev_desc *i2cdev;
> +	int ret;
> +
> +	/*
> +	 * First attach all devices with static definitions provided by the
> +	 * FW.
> +	 */
> +	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
> +		status = i3c_bus_get_addr_slot_status(&master->bus,
> +						      i2cboardinfo->base.addr);
> +		if (status != I3C_ADDR_SLOT_FREE) {
> +			ret = -EBUSY;
> +			goto err_detach_devs;
> +		}
> +
> +		i3c_bus_set_addr_slot_status(&master->bus,
> +					     i2cboardinfo->base.addr,
> +					     I3C_ADDR_SLOT_I2C_DEV);
> +
> +		i2cdev = i3c_master_alloc_i2c_dev(master, i2cboardinfo);
> +		if (IS_ERR(i2cdev)) {
> +			ret = PTR_ERR(i2cdev);
> +			goto err_detach_devs;
> +		}
> +
> +		ret = i3c_master_attach_i2c_dev(master, i2cdev);
> +		if (ret) {
> +			i3c_master_free_i2c_dev(i2cdev);
> +			goto err_detach_devs;
> +		}
> +	}
> +
> +	/*
> +	 * Now execute the controller specific ->bus_init() routine, which
> +	 * might configure its internal logic to match the bus limitations.
> +	 */
> +	ret = master->ops->bus_init(master);
> +	if (ret)
> +		goto err_detach_devs;
> +
> +	/*
> +	 * The master device should have been instantiated in ->bus_init(),
> +	 * complain if this was not the case.
> +	 */
> +	if (!master->this) {
> +		dev_err(&master->dev,
> +			"master_set_info() was not called in ->bus_init()\n");
> +		ret = -EINVAL;
> +		goto err_bus_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_bus_cleanup:
> +	if (master->ops->bus_cleanup)
> +		master->ops->bus_cleanup(master);
> +
> +err_detach_devs:
> +	i3c_master_detach_free_devs(master);
> +
> +	return ret;
> +}
> +
>  static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
>  {
>  	if (master->ops->bus_cleanup)
> @@ -2457,7 +2541,10 @@ static int i3c_master_init(struct i3c_master_controller *master,
>  		goto err_put_dev;
>  	}
>  
> -	ret = i3c_master_bus_init(master);
> +	if (secondary)
> +		ret = i3c_secondary_master_bus_init(master);
> +	else
> +		ret = i3c_master_bus_init(master);
>  	if (ret)
>  		goto err_put_dev;
>  
> @@ -2535,6 +2622,71 @@ int i3c_master_register(struct i3c_master_controller *master,
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_register);
>  
> +/**
> + * i3c_secondary_master_register() - register an I3C secondary master
> + * @master: master used to send frames on the bus
> + * @parent: the parent device (the one that provides this I3C master
> + *	    controller)
> + * @ops: the master controller operations
> + *
> + * This function does minimal required initialization for secondary
> + * master, rest functionality like creating and registering I2C
> + * and I3C devices is done in defslvs processing.
> + *
> + *  i3c_secondary_master_register() does following things -
> + * - creates and initializes the I3C bus
> + * - populates the bus with static I2C devs if @parent->of_node is not
> + *   NULL
> + *   initialization
> + * - allocate memory for defslvs_data.devs, which is used to receive
> + *   defslvs list
> + * - create I3C device representing this master
> + * - registers the I2C adapter and all I2C devices
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_secondary_master_register(struct i3c_master_controller *master,
> +				  struct device *parent,
> +				  const struct i3c_master_controller_ops *ops)
> +{
> +	int ret;
> +
> +	ret = i3c_master_init(master, parent, ops, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_add(&master->dev);
> +	if (ret)
> +		goto err_cleanup_bus;
> +
> +	/*
> +	 * Expose our I3C bus as an I2C adapter so that I2C devices are exposed
> +	 * through the I2C subsystem.
> +	 */
> +	ret = i3c_master_i2c_adapter_init(master);
> +	if (ret)
> +		goto err_del_dev;
> +
> +	/*
> +	 * We're done initializing the bus and the controller, we can now
> +	 * register I3C devices from defslvs list.
> +	 */
> +	master->init_done = true;
> +
> +	return 0;
> +
> +err_del_dev:
> +	device_del(&master->dev);
> +
> +err_cleanup_bus:
> +	i3c_master_bus_cleanup(master);
> +
> +	put_device(&master->dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_secondary_master_register);
> +
>  /**
>   * i3c_master_unregister() - unregister an I3C master
>   * @master: master used to send frames on the bus
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f5ba82c390bc..5124ff4831eb 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -534,6 +534,9 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  int i3c_master_register(struct i3c_master_controller *master,
>  			struct device *parent,
>  			const struct i3c_master_controller_ops *ops);
> +int i3c_secondary_master_register(struct i3c_master_controller *master,
> +				  struct device *parent,
> +				  const struct i3c_master_controller_ops *ops);
>  int i3c_master_unregister(struct i3c_master_controller *master);
>  
>  /**


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
