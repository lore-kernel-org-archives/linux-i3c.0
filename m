Return-Path: <SRS0=korR=B6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A66FC433E1
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 14:48:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B35F2075E
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 14:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XaYB5TKT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B35F2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jwMhvDW/NUAZiAeKfXIDO806Ha92bIADhpeluh//ml8=; b=XaYB5TKTIVBXcx5AKNj1YBVN9
	MKaCjJgSxfYz5/VmiV3MnTS/itNYggMfUYpYSTuv/RGEJszsThbkwS01HNZrZHxvz6EcAOJNbjDBh
	6R0gpGHa9Tra1aaEiojIXgqWTomd1SO+otGUXWE9HXihKf7rzrrx4yPwEBnTgntemE6wKh+/TL0hm
	tSGXTjdEwEWkrt0ecAFqLPm/969+DH8OLiUHPKbZBOBKEfArPQWsUg5zswphzMfPbxPBfr/hpLO2h
	rMaooXNbvKG8k7fzaBawCH//GlDOqeXnjYExj3+iqSLlnRbvAB2JYxileFaBz6/vzp9f5wZgjNuIv
	BfINOacLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8lrg-0007FH-GL
	for linux-i3c@archiver.kernel.org; Thu, 20 Aug 2020 14:48:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8lrd-0007ET-Iu
 for linux-i3c@lists.infradead.org; Thu, 20 Aug 2020 14:48:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A93C29AAD2;
 Thu, 20 Aug 2020 15:48:24 +0100 (BST)
Date: Thu, 20 Aug 2020 16:48:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v3] i3c: master: fix for SETDASA and DAA process
Message-ID: <20200820164820.4fec97b3@collabora.com>
In-Reply-To: <1597930706-15744-1-git-send-email-pthombar@cadence.com>
References: <1597930706-15744-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_104825_828241_3534DFF1 
X-CRM114-Status: GOOD (  36.64  )
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

On Thu, 20 Aug 2020 15:38:26 +0200
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

Hm, not sure that qualifies as a fix. The current implementation was
correct, it was just reserving a slot in the device table for devices
that didn't have an init address or on which SETDASA failed.

> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
> Changes between v2 and v3 are:
> 1. Keeping init_dyn_addr reserved.
> 2. Code refactoring and changes in comments.
> 
> Changes between v1 and v2 are:
> 1. Added boardinfo attach fix.
> 2. Removed reattach issue related fix.
> 3. Reserve init_dyn_addr initially, so that it will not
>    be used in DAA and  attempt can be made to set those
>    firmware requested dynamic address after DAA.
> ---
>  drivers/i3c/master.c |  115 ++++++++++++++++++++++++++++----------------------
>  1 files changed, 65 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3d995f2..24543d8 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1367,7 +1367,9 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  	enum i3c_addr_slot_status status;
>  	int ret;
>  
> -	if (dev->info.dyn_addr != old_dyn_addr) {
> +	if (dev->info.dyn_addr != old_dyn_addr &&
> +	    (!dev->boardinfo ||
> +	     dev->info.dyn_addr != dev->boardinfo->init_dyn_addr)) {
>  		status = i3c_bus_get_addr_slot_status(&master->bus,
>  						      dev->info.dyn_addr);
>  		if (status != I3C_ADDR_SLOT_FREE)
> @@ -1426,33 +1428,49 @@ static void i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>  		master->ops->detach_i2c_dev(dev);
>  }
>  
> -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> +static int i3c_master_pre_assign_dyn_addr(struct i3c_master_controller *master,
> +					  struct i3c_dev_boardinfo *boardinfo)

That function now does more than just assigning a dynamic address: it
also creates the i3c_dev_desc. It should be renamed accordingly
(i3c_master_early_i3c_dev_add() maybe).

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
> +	i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> +	if (IS_ERR(i3cdev))
> +		return -ENOMEM;
> +
> +	i3cdev->boardinfo = boardinfo;
>  
> -	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
> -					dev->boardinfo->init_dyn_addr);
> +	ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  	if (ret)
> -		return;
> +		goto err_attach;
> +
> +	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> +					i3cdev->boardinfo->init_dyn_addr);
> +	if (ret)
> +		goto err_setdasa;
>  
> -	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
> -	ret = i3c_master_reattach_i3c_dev(dev, 0);
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
> @@ -1619,8 +1637,8 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
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
> @@ -1633,10 +1651,14 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
>   * 4. Disable all slave events.
>   *
>   * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> - *    devices that have a static address
> + *    devices that have a static address and attach corresponding statically
> + *    defined I3C devices to the master. If only init_dyn_addr is available
> + *    or if SETDASA fails, reserve those init_dyn_addr to be used later to set
> + *    address using SETNEWDA after DAA.
>   *
>   * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> - *    remaining I3C devices
> + *    remaining I3C devices and attach them to the master if the dynamic address
> + *    assignment succeeds
>   *
>   * Once this is done, all I3C and I2C devices should be usable.
>   *
> @@ -1647,7 +1669,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> -	struct i3c_dev_desc *i3cdev;
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
> @@ -1679,34 +1700,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
> @@ -1744,10 +1737,32 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
> +		/*
> +		 * We don't attach devices which are not addressable
> +		 * (no static_addr and dyn_addr) and devices with static_addr
> +		 * but no init_dyn_addr will participate in DAA.
> +		 */
> +		if (!i3cboardinfo->init_dyn_addr ||
> +		    (i3cboardinfo->static_addr &&
> +		     !i3c_master_pre_assign_dyn_addr(master, i3cboardinfo)))
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

You should reserve the address before calling
i3c_master_pre_assign_dyn_addr():

		/*
		 * We don't attach devices which are not addressable
		 * (no static_addr and dyn_addr) and devices with
		 * static_addr but no init_dyn_addr will participate in DAA.
		 */
		if (!i3cboardinfo->init_dyn_addr ||
		    !i3cboardinfo->static_addr)
			continue;

		ret = i3c_bus_get_addr_slot_status(&master->bus,
						   i3cboardinfo->init_dyn_addr);
		if (ret != I3C_ADDR_SLOT_FREE) {
			ret = -EBUSY;
			goto err_rstdaa;
		}

		i3c_bus_set_addr_slot_status(&master->bus,
					     i3cboardinfo->init_dyn_addr,
					     I3C_ADDR_SLOT_I3C_DEV);

		i3c_master_pre_assign_dyn_addr(master, i3cboardinfo);

> +	}
>  
>  	ret = i3c_master_do_daa(master);
>  	if (ret)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
