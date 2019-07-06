Return-Path: <SRS0=Ce++=VD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B8AC5B578
	for <linux-i3c@archiver.kernel.org>; Sat,  6 Jul 2019 09:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF2421670
	for <linux-i3c@archiver.kernel.org>; Sat,  6 Jul 2019 09:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tT1ipfZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF2421670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHYPTLIbVWhsPhjuOQ58E6O83kdOOcl/Q8DJ/pCL1Dc=; b=tT1ipfZVzSu/Xv
	BeqShyfIDDATSkuXQHozPLS16tX+hf+/Ru6RynmoyPouCWPgXbTh59O+/wVy3B+tj0hS0lsP1YKl0
	GFs0tvuLR6CHxCJD9coNnG+u5Imi21IWQy7qwPFqZGNgRgU1JIbIhXXpMtaYDawZ3dNbMrG6DDlc9
	/7jpqQMunJg6dglafaBnoq1xSi4vIuaHwTBwuYtTDXsUhFd5OF8mOqZwN+5YADeTQQAqs6HrPyt8u
	AmcuwJlMVoEup9M6ZaQXw0mhTDUO47ZZdcm8DkDdhE0beF0p2VxeNQeeqnhodtDF9uLvqbKFz25Dk
	rc7AJ/pJ/SGLV9EtTsWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjgYK-0002ld-Lg; Sat, 06 Jul 2019 09:00:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjgYG-0002lE-Qo
 for linux-i3c@lists.infradead.org; Sat, 06 Jul 2019 09:00:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 45C9828A2C2;
 Sat,  6 Jul 2019 10:00:09 +0100 (BST)
Date: Sat, 6 Jul 2019 11:00:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190706110006.767571b8@collabora.com>
In-Reply-To: <1561236905-8901-5-git-send-email-pgaj@cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-5-git-send-email-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190706_020013_138576_96C8878A 
X-CRM114-Status: GOOD (  28.45  )
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
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, 22 Jun 2019 21:55:02 +0100
Przemyslaw Gaj <pgaj@cadence.com> wrote:


> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 86b7b44..cdfc5bf 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
>  
>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> +void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> +void i3c_bus_maintenance_unlock(struct i3c_bus *bus);

I don't think you need to expose the maintenance lock helpers, looks
like they're only used in master.c.

> +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
> +
>  
>  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  				 struct i3c_priv_xfer *xfers,
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index cbace14..3b44e66 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -93,6 +93,18 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
>  	up_read(&bus->lock);
>  }
>  
> +/*
> + * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
> + * operation
> + *
> + * Should be called when a maintenance operation is done and normal
> + * operation is planned. See i3c_bus_maintenance_lock() and
> + * i3c_bus_normaluse_lock() for more details.
> + */
> +static void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)
> +{
> +	downgrade_write(&bus->lock);
> +}

Missing blank line.

>  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
>  {
>  	return container_of(dev, struct i3c_master_controller, dev);
> @@ -341,6 +353,22 @@ static int i3c_device_probe(struct device *dev)
>  	return driver->probe(i3cdev);
>  }
>  
> +static int
> +i3c_master_enable_mr_events_locked(struct i3c_master_controller *master)
> +{
> +	if (!master->ops->enable_mr_events)
> +		return -ENOTSUPP;
> +
> +	return master->ops->enable_mr_events(master);
> +}
> +
> +static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
> +{
> +	if (!master->ops->disable_mr_events)
> +		return;
> +
> +	master->ops->disable_mr_events(master);
> +}

Missing blank line.

>  static int i3c_device_remove(struct device *dev)
>  {
>  	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> @@ -462,6 +490,42 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
>  	return 0;
>  }
>  
> +static int
> +i3c_master_request_mastership_locked(struct i3c_master_controller *master)
> +{
> +	if (WARN_ON(master->init_done &&
> +	    !rwsem_is_locked(&master->bus.lock)))

Hm, that looks suspicious. The lock should be held even if ->init_done
is false. Can you explain the difference between init_done
and !init_done?

> +		return -EINVAL;
> +
> +	if (!master->ops->request_mastership)
> +		return -ENOTSUPP;
> +
> +	return master->ops->request_mastership(master);
> +}
> +
> +static int i3c_master_owns_bus(struct i3c_master_controller *master)
> +{
> +	return (master->bus.cur_master == master->this);
> +}
> +
> +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master)
> +{
> +	int ret;
> +
> +	if (!i3c_master_owns_bus(master)) {
> +		i3c_bus_normaluse_unlock(&master->bus);
> +		i3c_bus_maintenance_lock(&master->bus);
> +
> +		ret = i3c_master_request_mastership_locked(master);
> +		if (ret) {
> +			i3c_bus_maintenance_unlock(&master->bus);
> +			return ret;
> +		}
> +		i3c_bus_downgrade_maintenance_lock(&master->bus);
> +	}

I think this block deserves a comment: the lock/unlock dance is far
from obvious.

> +
> +	return 0;
> +}
>  static const char * const i3c_bus_mode_strings[] = {
>  	[I3C_BUS_MODE_PURE] = "pure",
>  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> @@ -636,6 +700,22 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
>  	return dev;
>  }
>  
> +static struct i2c_dev_desc *
> +i3c_master_alloc_i2c_dev_no_boardinfo(struct i3c_master_controller *master,
> +				      u16 addr, u8 lvr)
> +{
> +	struct i2c_dev_desc *dev;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->common.master = master;
> +	dev->addr = addr;
> +	dev->lvr = lvr;
> +
> +	return dev;
> +}
>  static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
>  				   u16 payloadlen)
>  {
> @@ -705,6 +785,8 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
>  	struct i2c_dev_desc *dev;
>  
>  	i3c_bus_for_each_i2cdev(&master->bus, dev) {
> +		if (!dev->boardinfo)
> +			continue;

Blank line here, please.

>  		if (dev->boardinfo->base.addr == addr)
>  			return dev;
>  	}
> @@ -1478,7 +1560,8 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  		return;
>  
>  	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> -		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
> +		if (desc->dev || !desc->info.dyn_addr ||
> +		    desc == master->this || !desc->info.pid)

Does the new logic trigger a case where pid == 0? The check looks good
anyway, but I'd rather have it in a separate commit unless you have a
good explanation on why this couldn't happen before this patch.

>  			continue;
>  
>  		desc->dev = kzalloc(sizeof(*desc->dev), GFP_KERNEL);
> @@ -1504,6 +1587,69 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  	}
>  }
>  
> +static struct i2c_dev_boardinfo *
> +i3c_master_find_i2c_boardinfo(const struct i3c_master_controller *master,
> +			      u16 addr, u8 lvr)
> +{
> +	struct i2c_dev_boardinfo *i2cboardinfo;
> +
> +	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
> +		if (i2cboardinfo->base.addr == addr &&
> +		    i2cboardinfo->lvr == lvr)
> +			return i2cboardinfo;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void
> +i3c_master_register_new_i2c_devs(struct i3c_master_controller *master)
> +{
> +	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
> +	struct i2c_dev_desc *i2cdev;
> +
> +	if (!master->init_done)
> +		return;
> +
> +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> +

You can drop this blank line.

> +		if (i2cdev->dev)
> +			continue;
> +

Add a comment explaining why.

> +		if (!i2cdev->boardinfo)
> +			continue;
> +
> +		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> +	}
> +}
> +
> +static int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> +					u8 addr)
> +{
> +	struct i3c_ccc_getaccmst *accmst;
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
> +	if (!accmst)
> +		return -ENOMEM;
> +
> +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> +
> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (dest.payload.len != sizeof(*accmst))
> +		ret = -EIO;
> +
> +out:
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);

Add a blank line here (please run checkpatch --strict, it should
complain about such coding style issues).

>  /**
>   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
>   * @master: master doing the DAA
> @@ -1548,10 +1694,6 @@ static int i3c_master_set_info(struct i3c_master_controller *master,
>  	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
>  		return -EINVAL;
>  
> -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> -	    master->secondary)
> -		return -EINVAL;
> -
>  	if (master->this)
>  		return -EINVAL;
>  
> @@ -1560,7 +1702,8 @@ static int i3c_master_set_info(struct i3c_master_controller *master,
>  		return PTR_ERR(i3cdev);
>  
>  	master->this = i3cdev;
> -	master->bus.cur_master = master->this;
> +	if (!secondary)
> +		master->bus.cur_master = master->this;
>  
>  	ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  	if (ret)
> @@ -1601,37 +1744,7 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
>  	}
>  }
>  

[...]

> +/**
> + * i3c_master_bus_init() - initialize an I3C bus
> + * @master: main master initializing the bus
> + *
> + * This function is following all initialisation steps described in the I3C
> + * specification:
> + *
> + * 1. Attach I2C and statically defined I3C devs to the master so that the
> + *    master can fill its internal device table appropriately
> + *
> + * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> + *    the master controller. That's usually where the bus mode is selected
> + *    (pure bus or mixed fast/slow bus)
> + *
> + * 3. Instruct all devices on the bus to drop their dynamic address. This is
> + *    particularly important when the bus was previously configured by someone
> + *    else (for example the bootloader)
> + *
> + * 4. Disable all slave events.
> + *
> + * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> + *    devices that have a static address
> + *
> + * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> + *    remaining I3C devices
> + *
> + * Once this is done, all I3C and I2C devices should be usable.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +static int i3c_master_bus_init(struct i3c_master_controller *master)
> +{
> +	struct i3c_dev_desc *i3cdev;
> +	int ret;
> +
> +	/*
> +	 * First attach all devices with static definitions provided by the
> +	 * FW.
> +	 */
> +	ret = i3c_master_attach_static_devs(master);
> +	if (ret)
> +		goto err_detach_devs;
>  	/*
>  	 * Now execute the controller specific ->bus_init() routine, which
>  	 * might configure its internal logic to match the bus limitations.
> @@ -1780,45 +1926,76 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  }

The i3c_master_attach_static_devs() split can be done in a separate
commit. Please try to split things as much as possible to ease review.

>  
>  /**
> - * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> - * @master: master used to send frames on the bus
> - * @addr: I3C slave dynamic address assigned to the device
> + * i3c_master_add_i2c_dev_locked() - add an I2C slave to the bus
> + * @master: master used to register I2C device
> + * @addr: I2C device address
> + * @lvr: legacy virtual register value
>   *
> - * This function is instantiating an I3C device object and adding it to the
> - * I3C device list. All device information are automatically retrieved using
> - * standard CCC commands.
> - *
> - * The I3C device object is returned in case the master wants to attach
> - * private data to it using i3c_dev_set_master_data().
> + * This function is instantiating an I2C device object and adding it to the
> + * I2C device list.
>   *
>   * This function must be called with the bus lock held in write mode.
>   *
>   * Return: a 0 in case of success, an negative error code otherwise.
>   */
> -int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> -				  u8 addr)
> +int i3c_master_add_i2c_dev_locked(struct i3c_master_controller *master,
> +				  u16 addr, u8 lvr)
>  {
> -	struct i3c_device_info info = { .dyn_addr = addr };
> -	struct i3c_dev_desc *newdev, *olddev;
> -	u8 old_dyn_addr = addr, expected_dyn_addr;
> -	struct i3c_ibi_setup ibireq = { };
> -	bool enable_ibi = false;
> +	enum i3c_addr_slot_status status;
> +	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
>  	if (!master)
>  		return -EINVAL;
>  
> -	newdev = i3c_master_alloc_i3c_dev(master, &info);
> -	if (IS_ERR(newdev))
> -		return PTR_ERR(newdev);
> +	status = i3c_bus_get_addr_slot_status(&master->bus,
> +					      addr);
> +	if (status != I3C_ADDR_SLOT_FREE)
> +		return -EBUSY;
>  
> -	ret = i3c_master_attach_i3c_dev(master, newdev);
> -	if (ret)
> +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> +				     I3C_ADDR_SLOT_I2C_DEV);
> +
> +	i2cdev = i3c_master_alloc_i2c_dev_no_boardinfo(master, addr, lvr);
> +
> +	if (IS_ERR(i2cdev)) {
> +		ret = PTR_ERR(i2cdev);
> +		goto err_free_dev;
> +	}
> +
> +	i2cdev->boardinfo = i3c_master_find_i2c_boardinfo(master, addr, lvr);
> +
> +	ret = i3c_master_attach_i2c_dev(master, i2cdev);
> +
> +	if (ret) {
> +		ret = PTR_ERR(i2cdev);
>  		goto err_free_dev;
> +	}
> +
> +	return 0;
> +
> +err_free_dev:
> +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> +				     I3C_ADDR_SLOT_FREE);
> +	i3c_master_free_i2c_dev(i2cdev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev_locked);

Same here.

> +
> +static int
> +i3c_master_retrieve_info_and_reuse(struct i3c_master_controller *master,
> +				   struct i3c_dev_desc *newdev)
> +{
> +	struct i3c_dev_desc *olddev;
> +	u8 old_dyn_addr = newdev->info.dyn_addr, expected_dyn_addr;
> +	struct i3c_ibi_setup ibireq = { };
> +	bool enable_ibi = false;
> +	int ret;
>  
>  	ret = i3c_master_retrieve_dev_info(newdev);
>  	if (ret)
> -		goto err_detach_dev;
> +		return ret;
>  
>  	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>  	if (olddev) {
> @@ -1857,7 +2034,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  
>  	ret = i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
>  	if (ret)
> -		goto err_detach_dev;
> +		return ret;
>  
>  	/*
>  	 * Depending on our previous state, the expected dynamic address might
> @@ -1920,6 +2097,50 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	}
>  
>  	return 0;
> +}
> +
> +/**
> + * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> + * @master: master used to send frames on the bus
> + * @addr: I3C slave dynamic address assigned to the device
> + *
> + * This function is instantiating an I3C device object and adding it to the
> + * I3C device list. All device information are automatically retrieved using
> + * standard CCC commands.
> + *
> + * The I3C device object is returned in case the master wants to attach
> + * private data to it using i3c_dev_set_master_data().
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> +				  u8 addr)
> +{
> +	struct i3c_device_info info = { .dyn_addr = addr };
> +	struct i3c_dev_desc *newdev;
> +	int ret;
> +
> +	if (!master)
> +		return -EINVAL;
> +
> +	newdev = i3c_master_alloc_i3c_dev(master, &info);
> +	if (IS_ERR(newdev))
> +		return PTR_ERR(newdev);
> +
> +	ret = i3c_master_attach_i3c_dev(master, newdev);
> +	if (ret)
> +		goto err_free_dev;
> +
> +	if (i3c_master_owns_bus(master)) {
> +		ret = i3c_master_retrieve_info_and_reuse(master, newdev);
> +		if (ret)
> +			goto err_detach_dev;
> +	} else
> +		master->want_to_acquire_bus = true;

Please add curly braces.

> +
> +	return 0;
>  
>  err_detach_dev:
>  	if (newdev->dev && newdev->dev->desc)
> @@ -2101,11 +2322,15 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  	}
>  
>  	i3c_bus_normaluse_lock(&master->bus);
> +	ret = i3c_master_acquire_bus_ownership(master);
> +	if (ret)
> +		goto err_unlock_bus;
>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>  	if (!dev)
>  		ret = -ENOENT;
>  	else
>  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(&master->bus);
>  
>  	return ret ? ret : nxfers;
> @@ -2144,9 +2369,12 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	 * We silently ignore failures here. The bus should keep working
>  	 * correctly even if one or more i2c devices are not registered.
>  	 */
> -	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
> +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> +		if (!i2cdev->boardinfo)
> +			continue;
>  		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
>  
> +	}
>  	return 0;
>  }

[...]

>  /**
>   * i3c_master_init() - initializes all the structures required by I3C master
>   * @master: master used to send frames on the bus
> @@ -2417,9 +2712,6 @@ int i3c_master_init(struct i3c_master_controller *master,
>  	struct i2c_dev_boardinfo *i2cbi;
>  	int ret;
>  
> -	/* We do not support secondary masters yet. */
> -	if (secondary)
> -		return -ENOTSUPP;
>  
>  	ret = i3c_master_check_ops(ops);
>  	if (ret)
> @@ -2432,6 +2724,7 @@ int i3c_master_init(struct i3c_master_controller *master,
>  	master->dev.release = i3c_masterdev_release;
>  	master->ops = ops;
>  	master->secondary = secondary;
> +	master->want_to_acquire_bus = secondary;

Why do we need to set it to true here? Actually, I'm not even sure you
need that variable. Looks like it's only ever set, nothing reads it.

>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>  
> @@ -2488,6 +2781,92 @@ void i3c_master_cleanup(struct i3c_master_controller *master)
>  EXPORT_SYMBOL_GPL(i3c_master_cleanup);
>  

Overall, I like this version much better than the previous ones. Still
need some refinements though (and more documentation/comments to explain
how that works).


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
