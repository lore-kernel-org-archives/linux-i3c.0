Return-Path: <SRS0=cIL5=PX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B66C43387
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jan 2019 21:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2AB120866
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jan 2019 21:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M5iSwOnz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbxsfZ+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2AB120866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlDOXfRb1yiAp4RrUjbCOQb9xO78D43cPNNf8s5seAI=; b=M5iSwOnzUz1vj6
	GUOItGMmqDobyUFLsetARnm8AGLqPGPAujRzZfo0HiNQLLUPrAcfqWOkoxGVE+5rkSfdJw4BJducU
	z3Tfh9SHoBdKyEjD5MsOgAlQPP7h9VYLQ8YBhSDb4cZWosBc+Y1CcxGMLbK+Di+tMWrO4KwFLK2pn
	9tkBoz8P54/ZI4crs9Wd2p/cbjv/9rZf4gxXUr88o1SFBf49JgXdlcOXn/uvvRwuzTlnHB9mqUvSR
	UttaInrywb3E3YsEIWnQn19h2BVdp+38hlSCsfBOtrZRvVbMjwk47jRoS3f/ZiPC5WfiYW9oWLAnM
	Nw3ZmdbTZ4k54Wb/jvAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjVyK-0003mK-4X; Tue, 15 Jan 2019 21:10:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjVyG-0003Q5-H2
 for linux-i3c@lists.infradead.org; Tue, 15 Jan 2019 21:10:06 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C59D205C9;
 Tue, 15 Jan 2019 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547586603;
 bh=jn+hGGxOpWvO4eOx9VncO/2WUYR/OdJb7mwiGAMDULE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UbxsfZ+Mc1ijheXFY0WiMBkeFW3ovue4qc+xtbWzD28wlKV8rFoU3WWpBRJQio+xk
 7itETzhXriazqBc9EeOsXgLTdYAUfdP2vLwB/Dk8i585PA9CoFTc5ijULrqeKrWr2q
 /2yQq7JcuEgMss/xE7k/JrvYd+BnBJ/iQk798OCg=
Date: Tue, 15 Jan 2019 22:09:53 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v2 1/3] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190115220953.400d06e7@bbrezillon>
In-Reply-To: <1eca82e2d7bbff19597b78a3ce1ad62273015529.1547227861.git.pgaj@cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
 <1eca82e2d7bbff19597b78a3ce1ad62273015529.1547227861.git.pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_131004_633732_5E0AC33B 
X-CRM114-Status: GOOD (  40.07  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 11 Jan 2019 17:43:35 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch adds support for mastership request to I3C subsystem.
> 
> Mastership event is enabled for all the masters on the I3C bus
> by default.
> 
> Mastership request occurs in the following cases:
> - Mastership is requested automatically after secondary master
> receives mastership ENEC event. This allows secondary masters to
> initialize their bus
> - If above procedure fails for some reason, user can force
> mastership request through sysfs. Of course, mastership event
> still has to be enabled on current master side
> - Mastership is also requested automatically when device driver
> tries to transfer data using master controller in slave mode.
> 
> There is still some limitation:
> - I2C devices are not registered on secondary master side. I2C
> devices received in DEFSLVS CCC command are added to device list
> just to send back this information to the other master controllers
> in case of bus handoff. We can add support for this in the future
> if there is such use case.

Should be pretty easy to find the boardinfo entry matching the info
transmitted through the DEFSLVS frame, and if there's no match, we
simply don't expose the I2C dev.

> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> 
> Changes in v2:
> - Add mastership disable event hook
> - Changed name of mastership enable event hook
> - Add function to test if master owns the bus
> - Removed op_mode
> - Changed parameter of i3c_master_get_accmst_locked, no need to
>   pass full i3c_device_info
> - Removed redundant DEFSLVS command before GETACCMST
> - Add i3c_master_bus_takeover function. There is a need to lock
>   the bus before adding devices and no matter of the controller
>   devices have to be added after mastership takeover.
> - Add device registration during initialization on secondary master
>   side. Devices received by DEFSLVS (if occured). If not, device
>   initialization is deffered untill next mastership request.
> ---
>  drivers/i3c/master.c       | 256 ++++++++++++++++++++++++++++++++++++++++++---
>  include/linux/i3c/master.h |  29 ++++-
>  2 files changed, 270 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 68d6553..320d905 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -339,6 +339,37 @@ static int i3c_device_probe(struct device *dev)
>  	return driver->probe(i3cdev);
>  }
>  
> +static void i3c_master_enable_mr_events(struct i3c_dev_desc *i3cdev)

Do we have a good reason for enabling MR events on a per-device basis?
I guess we could limit the MR requests to a sub-set of the available
secondary masters, but I don't see a use for that right now. What we
actually need is a way to accept/reject MR requests globally.

> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(i3cdev);
> +
> +	if (!i3cdev)
> +		return;
> +
> +	if (!master->ops->enable_mr_events)
> +		return;
> +
> +	if (master->ops->enable_mr_events(i3cdev))
> +		dev_warn(&master->dev,
> +			 "Failed to enable mastership for device: %d%llx",
> +			 master->bus.id, i3cdev->info.pid);
> +}
> +
> +static void i3c_master_disable_mr_events(struct i3c_dev_desc *i3cdev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(i3cdev);
> +
> +	if (!i3cdev)
> +		return;
> +
> +	if (!master->ops->disable_mr_events)
> +		return;
> +
> +	if (master->ops->disable_mr_events(i3cdev))
> +		dev_warn(&master->dev,
> +			 "Failed to disable mastership for device: %d%llx",
> +			 master->bus.id, i3cdev->info.pid);
> +}

Missing blank line.

>  static int i3c_device_remove(struct device *dev)
>  {
>  	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
> @@ -351,6 +382,9 @@ static int i3c_device_remove(struct device *dev)
>  
>  	i3c_device_free_ibi(i3cdev);
>  
> +	if (I3C_BCR_DEVICE_ROLE(i3cdev->desc->info.bcr) == I3C_BCR_I3C_MASTER)
> +		i3c_master_disable_mr_events(i3cdev->desc);
> +
>  	return ret;
>  }
>  
> @@ -460,6 +494,26 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
>  	return 0;
>  }
>  
> +static int i3c_master_request_mastership(struct i3c_master_controller *master)

Looks like you always call this function with the lock held. Please add
a _lock suffix to make that clear.

> +{
> +	if (WARN_ON(master->init_done &&
> +	    !rwsem_is_locked(&master->bus.lock)))
> +		return -EINVAL;
> +
> +	if (!master->ops->request_mastership)
> +		return -ENOTSUPP;
> +
> +	if (master->ops->request_mastership(master))
> +		return -EIO;

Please propagate the ret code returned by ->request_mastership()
instead of EIO.

> +
> +	return 0;
> +}
> +
> +static bool i3c_master_owns_bus(struct i3c_master_controller *master)
> +{
> +	return master->bus.cur_master == master->this;
> +}
> +
>  static const char * const i3c_bus_mode_strings[] = {
>  	[I3C_BUS_MODE_PURE] = "pure",
>  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> @@ -491,8 +545,19 @@ static ssize_t current_master_show(struct device *dev,
>  				   char *buf)
>  {
>  	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	struct i3c_master_controller *master;
>  	ssize_t ret;
>  
> +	if (!i3cbus->cur_master) {
> +		master = container_of(i3cbus,
> +				      struct i3c_master_controller, bus);
> +		i3c_bus_normaluse_lock(i3cbus);

I think we should acquire the lock in maintenance mode here.

> +		ret = i3c_master_request_mastership(master);
> +		if (ret)
> +			return sprintf(buf, "unknown\n");

We should restore ownership back to the initial bus owner, or simply
return unknown when ->cur_master is NULL instead of trying to acquire
the bus.

> +		i3c_bus_normaluse_unlock(i3cbus);
> +	}
> +
>  	i3c_bus_normaluse_lock(i3cbus);
>  	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
>  		      i3cbus->cur_master->info.pid);
> @@ -663,6 +728,12 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  		    !rwsem_is_locked(&master->bus.lock)))
>  		return -EINVAL;
>  
> +	if (!i3c_master_owns_bus(master)) {
> +		ret = i3c_master_request_mastership(master);
> +		if (ret)
> +			return ret;
> +	}

As I said above, I think bus ownership should be requested in
maintenance mode, which means it has to be done before entering this
function. You can probably start acquiring the lock in write (AKA
maintenance) mode and downgrade it to read (AKA normal) mode before we
start sending the frame (CCC, SDR, I2C or HDR). 

> +
>  	if (!master->ops->send_ccc_cmd)
>  		return -ENOTSUPP;
>  
> @@ -1491,6 +1562,46 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  }
>  
>  /**
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
> +

Remove this blank line.

> +	if (ret)
> +		return ret;
> +
> +	if (dest.payload.len != sizeof(*accmst))
> +		return -EIO;
> +

Missing i3c_ccc_cmd_dest_cleanup().

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);
> +
> +/**
>   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
>   * @master: master doing the DAA
>   *
> @@ -1554,12 +1665,9 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  	struct i3c_dev_desc *i3cdev;
>  	int ret;
>  
> -	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> -		return -EINVAL;
> -
> -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> -	    master->secondary)
> -		return -EINVAL;
> +	if (!master->secondary)
> +		if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> +			return -EINVAL;
>  
>  	if (master->this)
>  		return -EINVAL;
> @@ -1569,7 +1677,8 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  		return PTR_ERR(i3cdev);
>  
>  	master->this = i3cdev;
> -	master->bus.cur_master = master->this;
> +	if (!master->secondary)
> +		master->bus.cur_master = master->this;
>  
>  	ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  	if (ret)
> @@ -1727,6 +1836,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	}
>  
>  	/*
> +	 * Don't reset addresses if this is secondary master.

When is the bitmap initialization happening then? I really think
secondary master init should happen early on and be limited to SW-side
object initialization. We can have a separate function to do that, and
maybe a separate register function too
(i3c_{main,secondary}_master_register()).

> +	 * Secondary masters can't do DAA.
> +	 */
> +	if (master->secondary)
> +		return 0;
> +
> +	/*
>  	 * Reset all dynamic address that may have been assigned before
>  	 * (assigned by the bootloader for example).
>  	 */
> @@ -1789,6 +1905,44 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  	return NULL;
>  }
>  
> +int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
> +			   struct i2c_dev_boardinfo *info)
> +{
> +	enum i3c_addr_slot_status status;
> +	struct device *dev = &master->dev;
> +	struct i2c_dev_boardinfo *boardinfo;
> +	struct i2c_dev_desc *i2cdev;
> +	int ret;
> +
> +	status = i3c_bus_get_addr_slot_status(&master->bus,
> +					      info->base.addr);
> +	if (status != I3C_ADDR_SLOT_FREE)
> +		return -EBUSY;
> +
> +	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
> +	if (!boardinfo)
> +		return -ENOMEM;

I don't think you should allocate the boardinfo here since you're
missing important info like, which device this is.

> +
> +	i3c_bus_set_addr_slot_status(&master->bus,
> +				     info->base.addr,
> +				     I3C_ADDR_SLOT_I2C_DEV);

The only thing you can do when the I2C dev is added by a master is
reserve the address in the I2C/I3C address space and search in the list
of boardinfo definitions (those extracted from the DT for instance) if
you have one that matches the LVR+I2C-address props. If there's match,
you can allocate and attach the i2c dev, otherwise the I2C address is
just reserved and no devices are exposed.

> +
> +	boardinfo->base.addr = info->base.addr;
> +	boardinfo->lvr = info->lvr;
> +
> +	i2cdev = i3c_master_alloc_i2c_dev(master, boardinfo);
> +	if (IS_ERR(i2cdev))
> +		return PTR_ERR(i2cdev);
> +
> +	ret = i3c_master_attach_i2c_dev(master, i2cdev);
> +	if (ret) {
> +		i3c_master_free_i2c_dev(i2cdev);
> +		return ret;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev);
> +
>  /**
>   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
>   * @master: master used to send frames on the bus
> @@ -1832,6 +1986,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_free_dev;
>  
> +	if (I3C_BCR_DEVICE_ROLE(newdev->info.bcr) == I3C_BCR_I3C_MASTER)
> +		i3c_master_enable_mr_events(newdev);
> +
>  	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>  	if (olddev) {
>  		newdev->boardinfo = olddev->boardinfo;
> @@ -2103,6 +2260,12 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  	}
>  
>  	i3c_bus_normaluse_lock(&master->bus);
> +	if (!i3c_master_owns_bus(master)) {
> +		ret = i3c_master_request_mastership(master);
> +		if (ret)
> +			return ret;
> +	}
> +

Same comment as above: this should be done in maintenance mode.

>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>  	if (!dev)
>  		ret = -ENOENT;
> @@ -2390,18 +2553,44 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  	     !ops->recycle_ibi_slot))
>  		return -EINVAL;
>  
> +	if (ops->request_mastership &&
> +	    (!ops->update_devs || !ops->enable_mr_events ||
> +	     !ops->disable_mr_events))
> +		return -EINVAL;
> +
>  	return 0;
>  }
>  
>  /**
> + * i3c_master_bus_takeover() - register new I3C devices on bus takeover
> + * @master: master used to send frames on the bus
> + *
> + * This function is useful when devices were not added
> + * during initialization or when new device joined the bus
> + * which was under control of different master.
> + */
> +void i3c_master_bus_takeover(struct i3c_master_controller *master)
> +{
> +	i3c_bus_maintenance_lock(&master->bus);
> +	master->ops->update_devs(master);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	/*
> +	 * We can register I3C devices received from master by DEFSLVS.
> +	 */
> +	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_master_register_new_i3c_devs(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
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
> @@ -2424,10 +2613,6 @@ int i3c_master_register(struct i3c_master_controller *master,
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
> @@ -2497,6 +2682,16 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		goto err_del_dev;
>  
>  	/*
> +	 * Try to attach devices received by DEFSLVS.
> +	 * Secondary masters can't do DAA.
> +	 */
> +	if (master->secondary) {
> +		i3c_bus_normaluse_lock(&master->bus);
> +		master->ops->update_devs(master);
> +		i3c_bus_normaluse_unlock(&master->bus);
> +	}
> +
> +	/*
>  	 * We're done initializing the bus and the controller, we can now
>  	 * register I3C devices dicovered during the initial DAA.
>  	 */
> @@ -2521,6 +2716,32 @@ int i3c_master_register(struct i3c_master_controller *master,
>  EXPORT_SYMBOL_GPL(i3c_master_register);
>  
>  /**
> + * i3c_master_mastership_ack() - performs operations before bus handover.
> + * @master: master used to send frames on the bus
> + * @addr: I3C device address
> + *
> + * Basically, it sends DEFSLVS command to ensure new master is taking
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
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
> +
> +
> +/**
>   * i3c_master_unregister() - unregister an I3C master
>   * @master: master used to send frames on the bus
>   *
> @@ -2544,6 +2765,7 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  				 int nxfers)
>  {
>  	struct i3c_master_controller *master;
> +	int ret;
>  
>  	if (!dev)
>  		return -ENOENT;
> @@ -2552,6 +2774,12 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  	if (!master || !xfers)
>  		return -EINVAL;
>  
> +	if (!i3c_master_owns_bus(master)) {
> +		ret = i3c_master_request_mastership(master);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (!master->ops->priv_xfers)
>  		return -ENOTSUPP;
>  
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f13fd8b..16e7995 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -418,6 +418,21 @@ struct i3c_bus {
>   *		      for a future IBI
>   *		      This method is mandatory only if ->request_ibi is not
>   *		      NULL.
> + * @update_devs: updates device list. Called after bus takeover. Secondary
> + *               master can't perform DAA procedure. This function allows to
> + *               update devices received from previous bus owner in DEFSLVS
> + *               command. Useful also when new device joins the bus controlled
> + *               by secondary master, main master will be able to add
> + *               this device after mastership takeover.

Do we really need this hook? AFAIU, this is only called from the master
controller's work which is responsible with mastership handover, so
this can be done entirely from the master driver without requiring help
from the framework (just need to do it with the maintenance lock held).
Am I missing something?

> + * @request_mastership: requests bus mastership. By default called by secondary
> + *                      master after ENEC CCC is received and when devices were
> + *                      not fully initialized yet. Mastership is also requested
> + *                      when device driver wants to transfer data using master
> + *                      in slave mode.

			   ...using a master which is currently
			   operating in slave mode.

> + * @enable_mr_events: enable the Mastership event for specified device.
> + *                    Mastership does not require handler. Mastership is enabled
> + *                    for all masters by default.
> + * @disable_mr_events: disable the Mastership event for specified device.

Unless you have a good reason for having a per-device granularity, I'd
recommend adding hooks that disable/enable MR globally. We can later
add fine grained control if needed.

>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -445,6 +460,10 @@ struct i3c_master_controller_ops {
>  	int (*disable_ibi)(struct i3c_dev_desc *dev);
>  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
>  				 struct i3c_ibi_slot *slot);
> +	void (*update_devs)(struct i3c_master_controller *master);
> +	int (*request_mastership)(struct i3c_master_controller *master);
> +	int (*enable_mr_events)(struct i3c_dev_desc *dev);
> +	int (*disable_mr_events)(struct i3c_dev_desc *dev);
>  };
>  
>  /**
> @@ -523,7 +542,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
>  
>  int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  			     u8 start_addr);
> -
> +int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
> +			   struct i2c_dev_boardinfo *info);
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> @@ -536,6 +556,13 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			const struct i3c_master_controller_ops *ops,
>  			bool secondary);
>  int i3c_master_unregister(struct i3c_master_controller *master);
> +int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> +				 u8 addr);
> +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> +			      u8 addr);
> +void i3c_secondary_master_events_enabled(struct i3c_master_controller *master,
> +					 u8 evts);
> +void i3c_master_bus_takeover(struct i3c_master_controller *master);
>  
>  /**
>   * i3c_dev_get_master_data() - get master private data attached to an I3C


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
