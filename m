Return-Path: <SRS0=GBB+=SB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F76C43381
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 15:06:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F686218A3
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 15:06:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVZSwYA2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F686218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vckvulTbSbm/OCAcfPl9GX0TXrL1cEHW5Xunkojdtms=; b=uVZSwYA2fXVfQg
	AsjfKTjf3r85zqZmjM2DrqILrUZzZ3Qmim6vrRo7n75o+qa5Q8ewDCGIHdYeDXppU0ak3HQS3UncR
	0Z2jErkSh6x5KQduhr9ren3rYEPXQhDoEa1XOGX71vKwTZ6JXeN90EzbRNz6tAK0Yv0TDMqxAgGUR
	rOxGetsU+JLMcgOuurfrfizuwRhYEiA+ddoFPnt3xUbRwZsq1ulgLHFaJP18yxgekSNqDkoy+Bn0U
	Gj3xx1OJcvx6taTbCmnk2mVbfahg8BftSPwGfmhOntxkWN5cXFxKTxQxzZ2bRG5psl8ziOHXGMsX5
	I+b/KbI1AOPw+kAohf5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAFZL-0006ro-0n; Sat, 30 Mar 2019 15:06:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAFZG-0006rM-Ge
 for linux-i3c@lists.infradead.org; Sat, 30 Mar 2019 15:06:49 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D07EB2811DC;
 Sat, 30 Mar 2019 15:06:42 +0000 (GMT)
Date: Sat, 30 Mar 2019 16:06:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190330160639.5daeafe5@collabora.com>
In-Reply-To: <20190310135843.21154-4-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_080646_823458_A91F8A9E 
X-CRM114-Status: GOOD (  34.42  )
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
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Przemek,

Sorry for the late review.

On Sun, 10 Mar 2019 13:58:40 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch adds support for mastership request to I3C subsystem.
> 
> Mastership event is enabled globally.
> 
> Mastership is requested automatically when device driver
> tries to transfer data using master controller in slave mode.
> 
> There is still some limitation:
> - I2C devices are registered on secondary master side if boardinfo
> entry matching the info transmitted through the DEFSLVS frame.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> ---
> 
> Main changes between v3 and v4:
> - Add i3c_master_acquire_bus_ownership to acquire the bus
> - Refactored the code
> 
> Main changes between v2 and v3:
> - Add i3c_bus_downgrade_maintenance_lock() for downgrading the bus
> lock from maintenance to normal use
> - Add additional fields to i2c_dev_desc for DEFSLVS purpose (addr, lvr)
> - Add i3c_master_register_new_i2c_devs() function to register I2C devices
> - Reworked I2C devices registration on secondary master side
> 
> Changes in v2:
> - Add mastership disable event hook
> - Changed name of mastership enable event hook
> - Add function to test if master owns the bus
> - Add function to test if master owns the bus
> - Removed op_mode
> - Changed parameter of i3c_master_get_accmst_locked, no need to
> pass full i3c_device_info
> - Changed name of mastership enable event hook
> - Add function to test if master owns the bus
> - Removed op_mode
> - Changed parameter of i3c_master_get_accmst_locked, no need to
> pass full i3c_device_info
> - Removed redundant DEFSLVS command before GETACCMST
> - Add i3c_master_bus_takeover function. There is a need to lock
> the bus before adding devices and no matter of the controller
> devices have to be added after mastership takeover.
> - Add device registration during initialization on secondary master
> side. Devices received by DEFSLVS (if occured). If not, device
> initialization is deffered untill next mastership request.
> ---
>  drivers/i3c/device.c       |  26 +++
>  drivers/i3c/internals.h    |   4 +
>  drivers/i3c/master.c       | 417 +++++++++++++++++++++++++++++++++++++--------
>  include/linux/i3c/master.h |  17 ++
>  4 files changed, 391 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 69cc040..b60f637 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -43,7 +43,13 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  	}
>  
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  
>  	return ret;
> @@ -114,11 +120,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
>  	int ret = -ENOENT;
>  
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		ret = i3c_dev_enable_ibi_locked(dev->desc);
>  		mutex_unlock(&dev->desc->ibi_lock);
>  	}
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  
>  	return ret;
> @@ -145,11 +157,17 @@ int i3c_device_request_ibi(struct i3c_device *dev,
>  		return -EINVAL;
>  
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
>  		mutex_unlock(&dev->desc->ibi_lock);
>  	}
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  
>  	return ret;
> @@ -166,12 +184,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
>   */
>  void i3c_device_free_ibi(struct i3c_device *dev)
>  {
> +	int ret;
> +
>  	i3c_bus_normaluse_lock(dev->bus);
> +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	if (dev->desc) {
>  		mutex_lock(&dev->desc->ibi_lock);
>  		i3c_dev_free_ibi_locked(dev->desc);
>  		mutex_unlock(&dev->desc->ibi_lock);
>  	}
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(dev->bus);
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_free_ibi);
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 86b7b44..929ca6b 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
>  
>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> +void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus);
> +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
> +int i3c_master_request_mastership_locked(struct i3c_master_controller *master);
> +
>  
>  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  				 struct i3c_priv_xfer *xfers,
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index aea4309..7a84158 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -93,6 +93,20 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
>  	up_read(&bus->lock);
>  }
>  
> +/**
> + * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
> + * operation
> + * @bus: I3C bus to downgrade the lock on
> + *
> + * Should be called when a maintenance operation is done and normal
> + * operation is planned. See i3c_bus_maintenance_lock() and
> + * i3c_bus_normaluse_lock() for more details.
> + */
> +void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)

This function is only used in this file, please make it static and
don't expose it in internals.h. Also, the comment above the function
should not be part of the doc, as its supposed to be a private
function. Just make it a normal comment (/* instead of /**) and don't
document the input param.

> +{
> +	downgrade_write(&bus->lock);
> +}
> +
>  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
>  {
>  	return container_of(dev, struct i3c_master_controller, dev);
> @@ -341,6 +355,22 @@ static int i3c_device_probe(struct device *dev)
>  	return driver->probe(i3cdev);
>  }
>  
> +static void i3c_master_enable_mr_events(struct i3c_master_controller *master)
> +{
> +	if (!master->ops->enable_mr_events)
> +		return;
> +
> +	master->ops->enable_mr_events(master);
> +}
> +
> +static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
> +{
> +	if (!master->ops->disable_mr_events)
> +		return;
> +
> +	master->ops->disable_mr_events(master);
> +}
> +
>  static int i3c_device_remove(struct device *dev)
>  {
>  	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> @@ -462,6 +492,36 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
>  	return 0;
>  }
>  
> +int i3c_master_request_mastership_locked(struct i3c_master_controller *master)
> +{
> +	if (WARN_ON(master->init_done &&
> +	    !rwsem_is_locked(&master->bus.lock)))
> +		return -EINVAL;
> +
> +	if (!master->ops->request_mastership)
> +		return -ENOTSUPP;
> +
> +	return master->ops->request_mastership(master);
> +}

Same goes for this function. Please make it private.

> +
> +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master)
> +{
> +	int ret;
> +
> +	if (master->bus.cur_master != master->this) {
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
> +	return 0;
> +}
> +
>  static const char * const i3c_bus_mode_strings[] = {
>  	[I3C_BUS_MODE_PURE] = "pure",
>  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> @@ -620,6 +680,25 @@ i3c_master_alloc_i2c_dev(struct i3c_master_controller *master,
>  
>  	dev->common.master = master;
>  	dev->boardinfo = boardinfo;
> +	dev->addr = boardinfo->base.addr;
> +	dev->lvr = boardinfo->lvr;
> +
> +	return dev;
> +}

This code should be part of patch 1.

> +
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
>  
>  	return dev;
>  }
> @@ -693,6 +772,9 @@ i3c_master_find_i2c_dev_by_addr(const struct i3c_master_controller *master,
>  	struct i2c_dev_desc *dev;
>  
>  	i3c_bus_for_each_i2cdev(&master->bus, dev) {
> +		if (!dev->boardinfo)
> +			continue;
> +
>  		if (dev->boardinfo->base.addr == addr)
>  			return dev;
>  	}
> @@ -939,8 +1021,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master)
>  
>  	desc = defslvs->slaves;
>  	i3c_bus_for_each_i2cdev(bus, i2cdev) {
> -		desc->lvr = i2cdev->boardinfo->lvr;
> -		desc->static_addr = i2cdev->boardinfo->base.addr << 1;
> +		desc->lvr = i2cdev->lvr;
> +		desc->static_addr = i2cdev->addr << 1;
>  		desc++;
>  	}
>  
> @@ -1492,6 +1574,83 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
> +		if (i2cdev->dev)
> +			continue;
> +
> +		if (!i2cdev->boardinfo)
> +			continue;
> +
> +		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> +	}
> +}
> +
> +/**
> + * i3c_master_get_accmst_locked() - send a GETACCMST CCC command
> + * @master: master used to send frames on the bus
> + * @info: I3C device information
> + *
> + * Send a GETACCMST CCC command.
> + *
> + * This should be called if the curent master acknowledges bus takeover.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 in case of success, a positive I3C error code if the error is
> + * one of the official Mx error codes, and a negative error code otherwise.
> + */
> +int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> +				 u8 addr)

Looks like you call the i3c_master_mastership_ack() wrapper in the
cadence driver, so please keep this function private.

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
> +
>  /**
>   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
>   * @master: master doing the DAA
> @@ -1559,10 +1718,6 @@ int i3c_master_set_info(struct i3c_master_controller *master,
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
> @@ -1607,43 +1762,13 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
>  				 common.node) {
>  		i3c_master_detach_i2c_dev(i2cdev);
>  		i3c_bus_set_addr_slot_status(&master->bus,
> -					i2cdev->boardinfo->base.addr,
> -					I3C_ADDR_SLOT_FREE);
> +					     i2cdev->addr,
> +					     I3C_ADDR_SLOT_FREE);

Should be part of patch 1.

>  		i3c_master_free_i2c_dev(i2cdev);
>  	}
>  }
>  
> -/**
> - * i3c_master_bus_init() - initialize an I3C bus
> - * @master: main master initializing the bus
> - *
> - * This function is following all initialisation steps described in the I3C
> - * specification:
> - *
> - * 1. Attach I2C and statically defined I3C devs to the master so that the
> - *    master can fill its internal device table appropriately
> - *
> - * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> - *    the master controller. That's usually where the bus mode is selected
> - *    (pure bus or mixed fast/slow bus)
> - *
> - * 3. Instruct all devices on the bus to drop their dynamic address. This is
> - *    particularly important when the bus was previously configured by someone
> - *    else (for example the bootloader)
> - *
> - * 4. Disable all slave events.
> - *
> - * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> - *    devices that have a static address
> - *
> - * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> - *    remaining I3C devices
> - *
> - * Once this is done, all I3C and I2C devices should be usable.
> - *
> - * Return: a 0 in case of success, an negative error code otherwise.
> - */
> -static int i3c_master_bus_init(struct i3c_master_controller *master)
> +static int i3c_master_attach_static_devs(struct i3c_master_controller *master)
>  {
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
> @@ -1652,32 +1777,24 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
> -	/*
> -	 * First attach all devices with static definitions provided by the
> -	 * FW.
> -	 */
>  	list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node) {
>  		status = i3c_bus_get_addr_slot_status(&master->bus,
>  						      i2cboardinfo->base.addr);
> -		if (status != I3C_ADDR_SLOT_FREE) {
> -			ret = -EBUSY;
> -			goto err_detach_devs;
> -		}
> +		if (status != I3C_ADDR_SLOT_FREE)
> +			return -EBUSY;
>  
>  		i3c_bus_set_addr_slot_status(&master->bus,
>  					     i2cboardinfo->base.addr,
>  					     I3C_ADDR_SLOT_I2C_DEV);
>  
>  		i2cdev = i3c_master_alloc_i2c_dev(master, i2cboardinfo);
> -		if (IS_ERR(i2cdev)) {
> -			ret = PTR_ERR(i2cdev);
> -			goto err_detach_devs;
> -		}
> +		if (IS_ERR(i2cdev))
> +			return PTR_ERR(i2cdev);
>  
>  		ret = i3c_master_attach_i2c_dev(master, i2cdev);
>  		if (ret) {
>  			i3c_master_free_i2c_dev(i2cdev);
> -			goto err_detach_devs;
> +			return ret;
>  		}
>  	}
>  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> @@ -1687,28 +1804,71 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  
>  		if (i3cboardinfo->init_dyn_addr) {
>  			status = i3c_bus_get_addr_slot_status(&master->bus,
> -						i3cboardinfo->init_dyn_addr);
> -			if (status != I3C_ADDR_SLOT_FREE) {
> -				ret = -EBUSY;
> -				goto err_detach_devs;
> -			}
> +							      i3cboardinfo->init_dyn_addr);
> +			if (status != I3C_ADDR_SLOT_FREE)
> +				return -EBUSY;
>  		}
>  
>  		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> -		if (IS_ERR(i3cdev)) {
> -			ret = PTR_ERR(i3cdev);
> -			goto err_detach_devs;
> -		}
> +		if (IS_ERR(i3cdev))
> +			return PTR_ERR(i3cdev);
>  
>  		i3cdev->boardinfo = i3cboardinfo;
>  
>  		ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  		if (ret) {
>  			i3c_master_free_i3c_dev(i3cdev);
> -			goto err_detach_devs;
> +			return ret;
>  		}
>  	}
>  
> +	return 0;
> +}
> +
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
> +	if (!master->secondary) {
> +		ret = i3c_master_attach_static_devs(master);
> +		if (ret)
> +			goto err_detach_devs;
> +	}
>  	/*
>  	 * Now execute the controller specific ->bus_init() routine, which
>  	 * might configure its internal logic to match the bus limitations.
> @@ -1729,6 +1889,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	}
>  
>  	/*
> +	 * Don't reset addresses if this is secondary master.
> +	 * Secondary masters can't do DAA.
> +	 */
> +	if (master->secondary)
> +		return 0;
> +
> +	/*
>  	 * Reset all dynamic address that may have been assigned before
>  	 * (assigned by the bootloader for example).
>  	 */
> @@ -1791,6 +1958,49 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  	return NULL;
>  }
>  
> +int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
> +			   u16 addr, u8 lvr)

Documentation is missing for this function. And I guess the lock must
be held, so please suffix it with _locked.

> +{
> +	enum i3c_addr_slot_status status;
> +	struct i2c_dev_desc *i2cdev;
> +	int ret;
> +
> +	if (!master)
> +		return -EINVAL;
> +
> +	status = i3c_bus_get_addr_slot_status(&master->bus,
> +					      addr);
> +	if (status != I3C_ADDR_SLOT_FREE)
> +		return -EBUSY;
> +
> +	i3c_bus_set_addr_slot_status(&master->bus, addr,
> +				     I3C_ADDR_SLOT_I2C_DEV);
> +
> +	i2cdev = i3c_master_alloc_i2c_dev_no_boardinfo(master, addr, lvr);
> +	if (IS_ERR(i2cdev)) {
> +		ret = PTR_ERR(i2cdev);
> +		goto err_free_dev;
> +	}
> +
> +	i2cdev->boardinfo = i3c_master_find_i2c_boardinfo(master, addr, lvr);
> +
> +	ret = i3c_master_attach_i2c_dev(master, i2cdev);
> +	if (ret) {
> +		ret = PTR_ERR(i2cdev);
> +		goto err_free_dev;
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
> +EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev);
> +
>  /**
>   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
>   * @master: master used to send frames on the bus
> @@ -2113,11 +2323,17 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  	}
>  
>  	i3c_bus_normaluse_lock(&master->bus);
> +	ret = i3c_master_acquire_bus_ownership(master);
> +	if (ret)
> +		goto err_unlock_bus;
> +
>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>  	if (!dev)
>  		ret = -ENOENT;
>  	else
>  		ret = master->ops->i2c_xfers(dev, xfers, nxfers);
> +
> +err_unlock_bus:
>  	i3c_bus_normaluse_unlock(&master->bus);
>  
>  	return ret ? ret : nxfers;
> @@ -2151,8 +2367,12 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	 * We silently ignore failures here. The bus should keep working
>  	 * correctly even if one or more i2c devices are not registered.
>  	 */
> -	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
> +	i3c_bus_for_each_i2cdev(&master->bus, i2cdev) {
> +		if (!i2cdev->boardinfo)
> +			continue;
> +
>  		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
> +	}
>  
>  	return 0;
>  }
> @@ -2393,18 +2613,43 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  	     !ops->recycle_ibi_slot))
>  		return -EINVAL;
>  
> +	if (ops->request_mastership &&
> +	    (!ops->enable_mr_events || !ops->disable_mr_events))
> +		return -EINVAL;

Can you maybe add a comment explaining why ->enable/disable_mr_events()
are required?

> +
>  	return 0;
>  }
>  
>  /**
> + * i3c_master_register_new_devs() - register new devices
> + * @master: master used to send frames on the bus
> + *
> + * This function is useful when devices were not added
> + * during initialization or when new device joined the bus
> + * which was under control of different master.
> + */
> +void i3c_master_register_new_devs(struct i3c_master_controller *master)
> +{
> +	/*
> +	 * We can register I3C devices received from master by DEFSLVS.
> +	 */
> +	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_master_register_new_i3c_devs(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +
> +	i3c_bus_normaluse_lock(&master->bus);

Why do you release+take the lock here? Can't you keep it?

> +	i3c_master_register_new_i2c_devs(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_register_new_devs);
> +
> +/**
>   * i3c_master_register() - register an I3C master
>   * @master: master used to send frames on the bus
>   * @parent: the parent device (the one that provides this I3C master
>   *	    controller)
>   * @ops: the master controller operations
> - * @secondary: true if you are registering a secondary master. Will return
> - *	       -ENOTSUPP if set to true since secondary masters are not yet
> - *	       supported
> + * @secondary: true if you are registering a secondary master.
>   *
>   * This function takes care of everything for you:
>   *
> @@ -2427,10 +2672,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	struct i2c_dev_boardinfo *i2cbi;
>  	int ret;
>  
> -	/* We do not support secondary masters yet. */
> -	if (secondary)
> -		return -ENOTSUPP;
> -
>  	ret = i3c_master_check_ops(ops);
>  	if (ret)
>  		return ret;
> @@ -2504,9 +2745,11 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	 * register I3C devices dicovered during the initial DAA.
>  	 */
>  	master->init_done = true;
> -	i3c_bus_normaluse_lock(&master->bus);
> -	i3c_master_register_new_i3c_devs(master);
> -	i3c_bus_normaluse_unlock(&master->bus);
> +	i3c_master_register_new_devs(master);
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	i3c_master_enable_mr_events(master);

i3c_master_enable_mr_events() should be suffixed with _locked. And
please add a comment explaining why you enable MR events here.

> +	i3c_bus_maintenance_unlock(&master->bus);
>  
>  	return 0;
>  
> @@ -2524,6 +2767,30 @@ int i3c_master_register(struct i3c_master_controller *master,
>  EXPORT_SYMBOL_GPL(i3c_master_register);
>  
>  /**
> + * i3c_master_mastership_ack() - performs operations before bus handover.
> + * @master: master used to send frames on the bus
> + * @addr: I3C device address
> + *
> + * Basically, it sends DEFSLVS command to ensure new master is taking

Are you sure of that? It seems to only send GETACCMST, and DEFSLVS has
probably been sent early, when the secondary master was discovered
(during DAA).

> + * the bus with complete list of devices and then acknowledges bus takeover.
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> +			      u8 addr)
> +{
> +	int ret;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret = i3c_master_get_accmst_locked(master, addr);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
> +
> +
> +/**
>   * i3c_master_unregister() - unregister an I3C master
>   * @master: master used to send frames on the bus
>   *
> @@ -2533,6 +2800,10 @@ EXPORT_SYMBOL_GPL(i3c_master_register);
>   */
>  int i3c_master_unregister(struct i3c_master_controller *master)
>  {
> +	i3c_bus_maintenance_lock(&master->bus);
> +	i3c_master_disable_mr_events(master);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
>  	i3c_master_i2c_adapter_cleanup(master);
>  	i3c_master_unregister_i3c_devs(master);
>  	i3c_master_bus_cleanup(master);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 42bb215..f32afd3 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -421,6 +421,12 @@ struct i3c_bus {
>   *		      for a future IBI
>   *		      This method is mandatory only if ->request_ibi is not
>   *		      NULL.
> + * @request_mastership: requests bus mastership. Mastership is requested
> + *                      automatically when device driver wants to transfer
> + *                      data using master in slave mode.

				      ^ a master that does not currently
				      owns the bus

> + * @enable_mr_events: enable the Mastership event.
> + *                    Mastership does not require handler.

I don't understand this comment. Also, I think it deserves some extra
details, like what drivers are supposed to do here (send ENEC(MR) +
possibly enable auto-ack?)

> + * @disable_mr_events: disable the Mastership event.

Same here, we need extra details.

>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -447,6 +453,10 @@ struct i3c_master_controller_ops {
>  	int (*disable_ibi)(struct i3c_dev_desc *dev);
>  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
>  				 struct i3c_ibi_slot *slot);
> +	void (*update_devs)(struct i3c_master_controller *master);

This one is no longer used AFAICS.

> +	int (*request_mastership)(struct i3c_master_controller *master);
> +	int (*enable_mr_events)(struct i3c_master_controller *master);
> +	int (*disable_mr_events)(struct i3c_master_controller *master);
>  };
>  
>  /**
> @@ -526,6 +536,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
>  int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  			     u8 start_addr);
>  
> +int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
> +			   u16 addr, u8 lvr);
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> @@ -538,6 +550,11 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			const struct i3c_master_controller_ops *ops,
>  			bool secondary);
>  int i3c_master_unregister(struct i3c_master_controller *master);
> +int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> +				 u8 addr);
> +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> +			      u8 addr);
> +void i3c_master_register_new_devs(struct i3c_master_controller *master);
>  
>  /**
>   * i3c_dev_get_master_data() - get master private data attached to an I3C


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
