Return-Path: <SRS0=Bw26=B5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F060C433E1
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2020 08:12:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC93207BB
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2020 08:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5dav6Eh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC93207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T2oEgyMHbqMR/Zi+f7+rif9oSJjvO3lCkVyfwHNquS0=; b=U5dav6Eh2qo5JHS5xsOptxuL8
	t7GTob1+gZ8AVu2xgiPfosuo2QFrFgvpf3UJNJb0q4tA1VCrmIseJXzRz+bvb+mwpAnSqjYMTOUeN
	jr85i9qQssAVqXE36QFKXE3k5NQALmDQJCpFNw8LFZb9w6g/eXt719rLENPMlJ2OTMkCvMGk3Z6Zd
	1j0g+IdWeLU7Bs9sGCNhbWRUJUcGaK08fgKcBJxIQeNOplBvZt5JdXwaCZEeU6LRXR3BSVndVGzLG
	+cImJt6NbjL28r+s10pzUFhuZZsq4/TAq1SPFGZN3NTFpNKbVKCEIspSLemxtQY6tZxPdj7gfG6si
	p3qd7oAig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8JDD-0007K2-5h
	for linux-i3c@archiver.kernel.org; Wed, 19 Aug 2020 08:12:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8JDA-0007JK-CJ
 for linux-i3c@lists.infradead.org; Wed, 19 Aug 2020 08:12:45 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DA7632996DD;
 Wed, 19 Aug 2020 09:12:41 +0100 (BST)
Date: Wed, 19 Aug 2020 10:12:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v2 2/2] i3c: master: fix for SETDASA and DAA process
Message-ID: <20200819101238.760d4e90@collabora.com>
In-Reply-To: <1590053581-803-1-git-send-email-pthombar@cadence.com>
References: <1590053467-32079-1-git-send-email-pthombar@cadence.com>
 <1590053581-803-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_041244_624974_B92F5864 
X-CRM114-Status: GOOD (  36.37  )
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
Cc: mparab@cadence.com, bbrezillon@kernel.org, praneeth@ti.com,
 linux-kernel@vger.kernel.org, vitor.soares@synopsys.com, pgaj@cadence.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Parshuram,

Sorry for the late reply :-/.

On Thu, 21 May 2020 11:33:01 +0200
Parshuram Thombare <pthombar@cadence.com> wrote:

> This patch fix following issue.
> Controller slots blocked for devices with static_addr
> but no init_dyn_addr may limit the number of I3C devices
> on the bus which gets dynamic address in DAA. So
> instead of attaching all the devices with static_addr,
> now we only attach the devices which successfully
> complete SETDASA. For remaining devices with init_dyn_addr,
> i3c_master_add_i3c_dev_locked() will try to set requested
> dynamic address after DAA.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  drivers/i3c/master.c | 119 ++++++++++++++++++++++++++-----------------
>  1 file changed, 71 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3d995f247cb7..5e0438ecf95c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1426,33 +1426,57 @@ static void i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>  		master->ops->detach_i2c_dev(dev);
>  }
>  
> -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> +static int i3c_master_pre_assign_dyn_addr(struct i3c_master_controller *master,
> +					  struct i3c_dev_boardinfo *boardinfo)
>  {
> -	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +	struct i3c_device_info info = {
> +		.static_addr = boardinfo->static_addr,
> +	};
> +	struct i3c_dev_desc *i3cdev;
>  	int ret;
>  
> -	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
> -	    !dev->boardinfo->static_addr)
> -		return;
> +	/*
> +	 * We anyway don't attach devices which are not addressable

You can drop the anyway.

> +	 * (no static_addr and dyn_addr) and devices with static_addr
> +	 * but no init_dyn_addr will participate in DAA.
> +	 */
> +	if (!boardinfo->static_addr || !boardinfo->init_dyn_addr)
> +		return -EINVAL;

If we consider this as an error, we should probably check that before
calling i3c_master_pre_assign_dyn_addr() in i3c_master_bus_init().

>  
> -	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
> -					dev->boardinfo->init_dyn_addr);
> +	i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> +	if (IS_ERR(i3cdev))
> +		return -ENOMEM;
> +
> +	i3cdev->boardinfo = boardinfo;
> +
> +	ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  	if (ret)
> -		return;
> +		goto err_attach;
>  
> -	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
> -	ret = i3c_master_reattach_i3c_dev(dev, 0);
> +	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> +					i3cdev->boardinfo->init_dyn_addr);
> +	if (ret)
> +		goto err_setdasa;
> +
> +	i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
> +	ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
>  	if (ret)
>  		goto err_rstdaa;
>  
> -	ret = i3c_master_retrieve_dev_info(dev);
> +	ret = i3c_master_retrieve_dev_info(i3cdev);
>  	if (ret)
>  		goto err_rstdaa;
>  
> -	return;
> +	return 0;
>  
>  err_rstdaa:
> -	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> +	i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
> +err_setdasa:
> +	i3c_master_detach_i3c_dev(i3cdev);
> +err_attach:
> +	i3c_master_free_i3c_dev(i3cdev);
> +
> +	return ret;
>  }
>  
>  static void
> @@ -1619,8 +1643,8 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
>   * This function is following all initialisation steps described in the I3C
>   * specification:
>   *
> - * 1. Attach I2C and statically defined I3C devs to the master so that the
> - *    master can fill its internal device table appropriately
> + * 1. Attach I2C devs to the master so that the master can fill its internal
> + *    device table appropriately
>   *
>   * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
>   *    the master controller. That's usually where the bus mode is selected
> @@ -1633,7 +1657,8 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
>   * 4. Disable all slave events.
>   *
>   * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> - *    devices that have a static address
> + *    devices that have a static address and attach corresponding statically
> + *    defined I3C devices to the master.

					     and attach them to the
					     master if
	  the dynamic address assignment succeeds

>   *
>   * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
>   *    remaining I3C devices
> @@ -1647,7 +1672,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> -	struct i3c_dev_desc *i3cdev;
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
> @@ -1679,34 +1703,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  			goto err_detach_devs;
>  		}
>  	}
> -	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> -		struct i3c_device_info info = {
> -			.static_addr = i3cboardinfo->static_addr,
> -		};
> -
> -		if (i3cboardinfo->init_dyn_addr) {
> -			status = i3c_bus_get_addr_slot_status(&master->bus,
> -						i3cboardinfo->init_dyn_addr);
> -			if (status != I3C_ADDR_SLOT_FREE) {
> -				ret = -EBUSY;
> -				goto err_detach_devs;
> -			}
> -		}
> -
> -		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> -		if (IS_ERR(i3cdev)) {
> -			ret = PTR_ERR(i3cdev);
> -			goto err_detach_devs;
> -		}
> -
> -		i3cdev->boardinfo = i3cboardinfo;
> -
> -		ret = i3c_master_attach_i3c_dev(master, i3cdev);
> -		if (ret) {
> -			i3c_master_free_i3c_dev(i3cdev);
> -			goto err_detach_devs;
> -		}
> -	}
>  
>  	/*
>  	 * Now execute the controller specific ->bus_init() routine, which
> @@ -1744,10 +1740,26 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  
>  	/*
>  	 * Pre-assign dynamic address and retrieve device information if
> -	 * needed.
> +	 * needed. And reserve the init_dyn_addr in case of failure, to retry
> +	 * setting the requested address after DAA is done in
> +	 * i3c_master_add_i3c_dev_locked().
>  	 */
> -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> -		i3c_master_pre_assign_dyn_addr(i3cdev);
> +	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> +		ret = i3c_master_pre_assign_dyn_addr(master, i3cboardinfo);
> +		if (!ret ||  !i3cboardinfo->init_dyn_addr)
> +			continue;
> +
> +		ret = i3c_bus_get_addr_slot_status(&master->bus,
> +						   i3cboardinfo->init_dyn_addr);
> +		if (ret != I3C_ADDR_SLOT_FREE) {
> +			ret = -EBUSY;
> +			goto err_rstdaa;
> +		}
> +
> +		i3c_bus_set_addr_slot_status(&master->bus,
> +					     i3cboardinfo->init_dyn_addr,
> +					     I3C_ADDR_SLOT_I3C_DEV);
> +	}
>  
>  	ret = i3c_master_do_daa(master);
>  	if (ret)
> @@ -1780,6 +1792,7 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
>  {
>  	struct i3c_master_controller *master = i3cdev->common.master;
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> +	u8 init_dyn_addr;
>  
>  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
>  		if (i3cdev->info.pid != i3cboardinfo->pid)
> @@ -1787,6 +1800,16 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
>  
>  		i3cdev->boardinfo = i3cboardinfo;
>  		i3cdev->info.static_addr = i3cboardinfo->static_addr;
> +		init_dyn_addr = i3cboardinfo->init_dyn_addr;
> +		/*
> +		 * Free reserved init_dyn_addr so that attach can
> +		 * get it before trying setnewda.
> +		 */
> +		if (i3cboardinfo->init_dyn_addr)
> +			i3c_bus_set_addr_slot_status(&master->bus,
> +						     init_dyn_addr,
> +						     I3C_ADDR_SLOT_FREE);

Hm, it's a bit more complicated. I don't think we can unconditionally
release the init_dyn_addr here. Say you have a device that's been
assigned its init_dyn_addr, and userspace decided to re-assign a new
one (the feature is not available yet, but I thought about letting
userspace write to the dyn_addr sysfs entry and wire that to a SETDA).
The init_dyn_addr can now be re-assigned to a different device. After
some time the device ends up resetting and thus lose its DA. A new DAA
is issued to re-discover it, but you want this device to be assigned its
last known address not the init address. And when
i3c_master_attach_boardinfo() is called on this new device, you release
a slot that's no longer yours.

That was the rational behind the "address slots are attached to i3cdevs
not boardinfo". Maybe we should have another list where we keep i3c
devs that have not been discovered yet but have boardinfo attached to
them. This way we can reserve dynamic addresses without blocking a
slot in the master device table.

> +
>  		return;
>  	}
>  }


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
