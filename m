Return-Path: <SRS0=aOv0=FI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BE8C433FE
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Dec 2020 04:42:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E094B22509
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Dec 2020 04:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E094B22509
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rll2uhpFJ7idN8QW31CEfgVYS9QZm/6iKmRNUT3Ornc=; b=s62O7QYT0L/ixc8lN/gyIKiz3
	8ZYcO9bzyGmcH56GifB+/n9MHNWGuKNZ9fKEmPt743G3pzjWILP6g8y53Kkrjc4CKTRo9zvZwpI3v
	CD46iFjoGbo6b0FluR+kCc25ckkHVBb4l5OvTfRK6Ao0Ja7ZYtmyt+dI20b4iSut+pfu9JHEUzaA5
	9XRLpDOb3Y57aA1w5PAtuO2+OEl/zg/QubRjAXjrqnYhE+DlATWV7OAg950T3esk3kcgz3n7+crcW
	ucRfRcZ727K0x+hpXfEmEksIuNKQMPVu+B+d0P6GeWtzedorh4KydOLru4QsWbknhEWxX8i/Cq0Fe
	DajxfWElg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl2v4-0006bb-Rv; Fri, 04 Dec 2020 04:42:10 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl2v2-0006bA-6J
 for linux-i3c@lists.infradead.org; Fri, 04 Dec 2020 04:42:09 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id AC6BD103E2E;
 Thu,  3 Dec 2020 23:42:06 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=L/O62gQN7CGhqxHxvnU12bfvozc=; b=acy7MK
 OUFByGsiSbTjnYlRN2ZmaLixRx/rCDqK7FvRaUiPbEPFCEAnf2XCTIrtOhOapQPx
 gciOgCTg3r1Hc51EunIQw1AsQSOtxIEt1oJf+6iQhIQvnPS+H04K6v5MR077GAge
 7bLyXHFJiq96pYMhoH+anWO2K/VDU4Um3ouv0=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id A4F14103E2D;
 Thu,  3 Dec 2020 23:42:06 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=7JgJuVjwh3CFtZR8kqIaiFoY87sTzfmcyvs0jSlA37k=;
 b=ynpY5QYBsvgC29Wfo0+4B33kMrfMWPENKFtwqYv3ETdGAni4wn8ccsn6J35RgLMANtO8qW7Yy7Z73WtvLppm3IIQPXVHAlMZe7ZV8XbTnLcrvkUpxGNx98IeMQBGKscfcoHn550J4IDRQYb/EJq8wjKc+CUqBe3KCM3xBq9mSuI=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 8A5D2103E29;
 Thu,  3 Dec 2020 23:42:03 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id D734D2DA0639;
 Thu,  3 Dec 2020 23:42:01 -0500 (EST)
Date: Thu, 3 Dec 2020 23:42:01 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v10 3/7] i3c: master: add i3c_secondary_master_register
In-Reply-To: <1606717090-3847-1-git-send-email-pthombar@cadence.com>
Message-ID: <sq1q9262-8q61-7qop-9ps2-q5o6qo5q3p63@syhkavp.arg>
References: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
 <1606717090-3847-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 0E257364-35EB-11EB-ACCB-E43E2BB96649-78420484!pb-smtp20.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_234208_513646_4B8B4EF9 
X-CRM114-Status: GOOD (  30.63  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mparab@cadence.com, alexandre.belloni@bootlin.com, praneeth@ti.com,
 linux-kernel@vger.kernel.org, vitor.soares@synopsys.com, slongerbeam@gmail.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 30 Nov 2020, Parshuram Thombare wrote:

> add i3c_secondary_master_register which is used
> to register secondary masters.

I'm not sure about the logic here. Why would the secondary master 
initialize the bus? If you make a distinction between primary and 
secondary, then the primary should be the owner of the bus and it should 
have enumerated it already. You should populate the bus structure with 
info provided by the primary master not from DT?


> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  drivers/i3c/master.c       |  154 +++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/i3c/master.h |    3 +
>  2 files changed, 156 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 56e8fe4..af0630a 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1797,6 +1797,90 @@ static int i3c_primary_master_bus_init(struct i3c_master_controller *master)
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
> + *
> + * Once this is done, I2C devices should be usable.
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
> @@ -2514,7 +2598,10 @@ static int i3c_master_init(struct i3c_master_controller *master,
>  		goto err_put_dev;
>  	}
>  
> -	ret = i3c_primary_master_bus_init(master);
> +	if (secondary)
> +		ret = i3c_secondary_master_bus_init(master);
> +	else
> +		ret = i3c_primary_master_bus_init(master);
>  	if (ret)
>  		goto err_destroy_wq;
>  
> @@ -2595,6 +2682,71 @@ int i3c_primary_master_register(struct i3c_master_controller *master,
>  EXPORT_SYMBOL_GPL(i3c_primary_master_register);
>  
>  /**
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
> +/**
>   * i3c_master_unregister() - unregister an I3C master
>   * @master: master used to send frames on the bus
>   *
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index e543f68..e186d53 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -541,6 +541,9 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  int i3c_primary_master_register(struct i3c_master_controller *master,
>  				struct device *parent,
>  				const struct i3c_master_controller_ops *ops);
> +int i3c_secondary_master_register(struct i3c_master_controller *master,
> +				  struct device *parent,
> +				  const struct i3c_master_controller_ops *ops);
>  int i3c_master_unregister(struct i3c_master_controller *master);
>  
>  /**
> -- 
> 1.7.1
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
