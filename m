Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_MIXED_ES,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF7EC65BAE
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 13:50:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454B32080F
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 13:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X5F+B68i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGszVItJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454B32080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40aOVs8rESLLmMeBfjSELeCmXEaaMk3qDf9A4E75JNM=; b=X5F+B68i39IMkK
	0WlCXBwVBsuKnQI0fqptPpRUKjn045E5wCDLH7sYPgJhRuWD5Lng7mzXocyIDr21uxUWBZGaQr1Ze
	MOn/wepheU3uv0eyZ/SJvXMHJuQYyNFIOTWZxxOU+aZYC/DUWPyQlbaAK5ySHY2OcUG7RLfzQGDFG
	fvmAO01rJovuIdAoEflGDN3w44AxOJ6rsvByrlrmDEZOBh31cWcYsF42Y49O9q5dwie9CHzpO3Bgu
	mF5wO4BT7KG73i3mGTEtzCiGqMcwdINJy3YieZcDxWQUoLIwA6v+5KQYFrDXhWEGNwfyhL5DRF91j
	Ku11SlaqUpcgnBm0/iRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXRO0-0005sn-Sf; Thu, 13 Dec 2018 13:50:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXRNs-0005h9-1G
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 13:50:43 +0000
Received: from bbrezillon (aaubervilliers-681-1-89-7.w90-88.abo.wanadoo.fr
 [90.88.30.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB4F620849;
 Thu, 13 Dec 2018 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544709025;
 bh=wXQs+cWEnCxHjtLCIYj+sWqBDtwumR3lDQfs8O4cuf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cGszVItJjNA/QzmPw9VJAliq/eQh/+YsdO1TiW+B74G+kVdCILVZIWazau+rozG/4
 VuauOZHcn7mhUmz5E81uEJFbn0IvydzG/mxFY7XBPVY3omlWnBMZrNSuit7uLfE9UQ
 kKX8f0oX1UeJOoQ3f7NBBcw6UBCMUkNA7qEk1/jc=
Date: Thu, 13 Dec 2018 14:50:20 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 1/2] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20181213145020.124cb103@bbrezillon>
In-Reply-To: <68ffa8026fb3cc32415058861ece07f158b00647.1544703840.git.pgaj@cadence.com>
References: <cover.1544703840.git.pgaj@cadence.com>
 <68ffa8026fb3cc32415058861ece07f158b00647.1544703840.git.pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_055036_118802_BD4174DA 
X-CRM114-Status: GOOD (  42.27  )
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

On Thu, 13 Dec 2018 12:28:00 +0000
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

I guess this only happens when the secondary master received a DEFSLVS
packet, right?

> - If above procedure fails for some reason, user can force
> mastership request through sysfs. Of course, mastership event
> still has to be enabled on current master side

Sounds like a good idea.

> - Mastership is also requested automatically when device driver
> tries to transfer data using master controller in slave mode.

And that too.

> 
> There is still some limitation:
> - I2C devices are not registered on secondary master side. I2C
> devices received in DEFSLVS CCC command are added to device list
> just to send back this information to the other master controllers
> in case of bus handoff. We can add support for this in the future
> if there is such use case.

I2C devices must be described under the bus represented by the
secondary master for that to work properly (we need a way to bind
devices to drivers). So, it's probably a good thing to discard (or
leave them inactive) any devices that do not have a i2c_board_info entry
on the secondary master side.

> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/master.c       | 260 ++++++++++++++++++++++++++++++++++++++++++---
>  include/linux/i3c/master.h |  43 +++++++-
>  2 files changed, 289 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 68d6553..e98b600 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -460,6 +460,15 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
>  	return 0;
>  }
>  
> +static int i3c_master_request_mastership(struct i3c_master_controller *master)
> +{
> +	if (!master->ops->request_mastership)
> +		return -ENOTSUPP;

Please add a blank line here

> +	if (master->ops->request_mastership(master))
> +		return -EIO;

and here.

> +	return 0;
> +}
> +
>  static const char * const i3c_bus_mode_strings[] = {
>  	[I3C_BUS_MODE_PURE] = "pure",
>  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> @@ -491,8 +500,15 @@ static ssize_t current_master_show(struct device *dev,
>  				   char *buf)
>  {
>  	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +	struct i3c_master_controller *master;
>  	ssize_t ret;
>  
> +	if (!i3cbus->cur_master) {
> +		master = container_of(i3cbus, struct i3c_master_controller, bus);
> +		if (i3c_master_request_mastership(master))
> +			return sprintf(buf, "unknown\n");
> +	}

Hm, why is that needed? When you are a secondary master ->cur_master
should be set to the i3c_dev_desc representing the main master at init
time.

> +
>  	i3c_bus_normaluse_lock(i3cbus);
>  	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
>  		      i3cbus->cur_master->info.pid);
> @@ -659,6 +675,11 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	if (!cmd || !master)
>  		return -EINVAL;
>  
> +	if (master->op_mode == I3C_SLAVE_MODE) {
> +		if (i3c_master_request_mastership(master))
> +			return -EIO;
> +	}
> +

This shouldn't be needed either. if i3cbus->cur_master != master->this,
that means the master is operating in slave mode.

>  	if (WARN_ON(master->init_done &&
>  		    !rwsem_is_locked(&master->bus.lock)))
>  		return -EINVAL;
> @@ -1371,6 +1392,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  						      dev->info.dyn_addr);
>  		if (status != I3C_ADDR_SLOT_FREE)
>  			return -EBUSY;
> +

Drop this change (or make it part of a separate patch fixing coding
style issues).

>  		i3c_bus_set_addr_slot_status(&master->bus,
>  					     dev->info.dyn_addr,
>  					     I3C_ADDR_SLOT_I3C_DEV);
> @@ -1491,6 +1513,46 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  }
>  
>  /**
> + * i3c_master_get_accmst_locked() - send a GETACCMST CCC command
> + * @master: master used to send frames on the bus
> + * @info: I3C device information

Maybe you can simply pass the dynamic address instead of the full
device_info struct.

> + *
> + * Send a GETACCMST CCC command.
> + *
> + * This should be called if the curent master acknowledges bus takeover.

I really thought this would be all automated by the master IP, but
apparently it's not :-).

> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 in case of success, a positive I3C error code if the error is
> + * one of the official Mx error codes, and a negative error code otherwise.
> + */
> +int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> +				 const struct i3c_device_info *info)
> +{
> +	struct i3c_ccc_getaccmst *accmst;
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	accmst = i3c_ccc_cmd_dest_init(&dest, info->dyn_addr, sizeof(*accmst));
> +	if (!accmst)
> +		return -ENOMEM;
> +
> +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> +
> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (dest.payload.len != sizeof(*accmst))
> +		return -EIO;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);
> +
> +/**
>   * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
>   * @master: master doing the DAA
>   *
> @@ -1554,11 +1616,8 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  	struct i3c_dev_desc *i3cdev;
>  	int ret;
>  
> -	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> -		return -EINVAL;
> -
> -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> -	    master->secondary)
> +	if (master->op_mode == I3C_MASTER_MODE &&
> +	    !i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))

Please place this test in a separate if branch, as they are not really
related.

>  		return -EINVAL;
>  
>  	if (master->this)
> @@ -1569,7 +1628,8 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  		return PTR_ERR(i3cdev);
>  
>  	master->this = i3cdev;
> -	master->bus.cur_master = master->this;
> +	if (master->op_mode == I3C_MASTER_MODE)
> +		master->bus.cur_master = master->this;

When you hare a secondary master, you should make ->cur_master point to
an i3c_dev_desc describing the current/main master. Should be possible
thanks to the DEFSLVS info.

>  
>  	ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  	if (ret)
> @@ -1727,6 +1787,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	}
>  
>  	/*
> +	 * Don't reset addresses if this is secondary master.
> +	 * Secondary masters can't do DAA.
> +	 */

Hm, I'm not sure how that's supposed to work. What if the secondary
master was initialized by the bootloader. Don't you need to reset
something and maybe trigger a MSTREQ+DAA or a HotJoin?

> +	if (master->secondary)
> +		return 0;

Add a blank like here.

> +	/*
>  	 * Reset all dynamic address that may have been assigned before
>  	 * (assigned by the bootloader for example).
>  	 */
> @@ -1738,6 +1804,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
>  				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
>  				      I3C_CCC_EVENT_HJ);
> +

Drop this blank line.

>  	if (ret && ret != I3C_ERROR_M2)
>  		goto err_bus_cleanup;
>  
> @@ -1789,6 +1856,44 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
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
> +
> +	i3c_bus_set_addr_slot_status(&master->bus,
> +				     info->base.addr,
> +				     I3C_ADDR_SLOT_I2C_DEV);
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
> @@ -1832,6 +1937,15 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_free_dev;
>  
> +	if (I3C_BCR_DEVICE_ROLE(newdev->info.bcr) == I3C_BCR_I3C_MASTER &&
> +	    master->ops->enable_mastership) {
> +		if (master->ops->enable_mastership(newdev)) {
> +			dev_warn(&master->dev,
> +				 "Failed to enable mastership for device: %d%llx",
> +				 master->bus.id, newdev->info.pid);
> +		}
> +	}
> +
>  	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>  	if (olddev) {
>  		newdev->boardinfo = olddev->boardinfo;
> @@ -2102,6 +2216,11 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  			return -ENOTSUPP;
>  	}
>  
> +	if (master->op_mode == I3C_SLAVE_MODE) {
> +		if (i3c_master_request_mastership(master))

Shouldn't this be called with the lock held?

Oh, and we might have a race here if the master gains bus ownership and
looses it just after that and before it was able to the transfer. I
think we should:

1/ send a GETACCMST
2/ disable MR EVENTS
3/ do the I3C/I2C transfers
4/ enable MR EVENTS

1 and 2 should be sent in the same transaction to avoid cases where
another master tries to acquire the bus, or if that's not possible, the
master that just gained ownership of the bus should reject any incoming
MR until DISEC(MR) has been sent.



> +			return -EIO;
> +	}
> +
>  	i3c_bus_normaluse_lock(&master->bus);
>  	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
>  	if (!dev)
> @@ -2393,15 +2512,31 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  	return 0;
>  }
>  
> +static void i3c_master_bus_takeover(struct work_struct *work)
> +{
> +	struct i3c_master_controller *master;
> +
> +	master = container_of(work, struct i3c_master_controller, mastership);
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	master->ops->update_devs(master);
> +	i3c_bus_maintenance_unlock(&master->bus);

Blank like here please.

> +	/*
> +	 * We can register I3C devices received from master by DEFSLVS.
> +	 */
> +	master->init_done = true;

I think this should be set before that, in the i3c_master_register()
function. When a secondary master is initialized, it should populate
the dev list based on a previous DEFSLVS frame it has received before
the ->probe() call, or just start with an empty list.

> +	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_master_register_new_i3c_devs(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +}
> +
>  /**
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
> @@ -2424,10 +2559,6 @@ int i3c_master_register(struct i3c_master_controller *master,
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
> @@ -2439,6 +2570,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	master->dev.release = i3c_masterdev_release;
>  	master->ops = ops;
>  	master->secondary = secondary;
> +	master->op_mode = secondary ? I3C_SLAVE_MODE : I3C_MASTER_MODE;
>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>  
> @@ -2497,6 +2629,13 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		goto err_del_dev;
>  
>  	/*
> +	 * We can stop here. Devices will be attached after bus takeover.
> +	 * Secondary masters can't do DAA.
> +	 */
> +	if (master->secondary)
> +		return 0;

See, I don't think we should stop here. We should provide a hook to let
secondary slaves populate the dev list based on data they might have
received before that.

> +
> +	/*
>  	 * We're done initializing the bus and the controller, we can now
>  	 * register I3C devices dicovered during the initial DAA.
>  	 */
> @@ -2521,6 +2660,95 @@ int i3c_master_register(struct i3c_master_controller *master,
>  EXPORT_SYMBOL_GPL(i3c_master_register);
>  
>  /**
> + * i3c_master_switch_operation_mode() - changes operation mode of the controller
> + * @master: master used to send frames on the bus
> + * @new_master: the device that takes control of the bus
> + * @op_mode: the master new operation mode
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> +				     struct i3c_dev_desc *new_master,
> +				     enum i3c_op_mode new_op_mode)
> +{
> +	if (master->op_mode == new_op_mode)
> +		return -EEXIST;
> +
> +	master->op_mode = new_op_mode;
> +
> +	if (new_op_mode == I3C_SLAVE_MODE) {
> +		master->bus.cur_master = new_master;
> +	} else {
> +		master->bus.cur_master = master->this;

This is done too early. You should update cur->master only after the
GETACCMST operation succeeds.

> +		INIT_WORK(&master->mastership, i3c_master_bus_takeover);

INIT_WORK() should be called once at init time, not everytime you
switch from one mode to another.

> +		queue_work(master->wq, &master->mastership);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_switch_operation_mode);
> +
> +/**
> + * i3c_master_mastership_ack() - performs operations before bus handover.
> + * @master: master used to send frames on the bus
> + * @info: I3C device information
> + *
> + * Basically, it sends DEFSLVS command to ensure new master is taking
> + * the bus with complete list of devices and then acknowledges bus takeover.
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> +			      const struct i3c_device_info *info)
> +{
> +	int ret;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret = i3c_master_defslvs_locked(master);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +	if (ret)
> +		return ret;
> +

Hm, this should have been sent during DAA, no need to do it again here,
right?

> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret = i3c_master_get_accmst_locked(master, info);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +	if (ret)
> +		return ret;

Hm, will this really work? I thought the mastership handover procedure
had to be done atomically (using Sr between each transfer to avoid
external interruptions). I might be wrong though (need to read the
spec to refresh my memory).

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
> +
> +static void i3c_secondary_master_bus_init(struct work_struct *work)
> +{
> +	struct i3c_master_controller *master;
> +
> +	master = container_of(work, struct i3c_master_controller, mastership);
> +
> +	if (i3c_master_request_mastership(master))
> +		dev_err(&master->dev, "Mastership failed.");
> +}
> +
> +/**
> + * i3c_secondary_master_events_enabled() - event from current master
> + * @master: master used to send frames on the bus
> + * @evts: enabled events
> + *
> + * This function allows to perform required operations after current
> + * master enables particular events on the bus.
> + */
> +void i3c_secondary_master_events_enabled(struct i3c_master_controller *master,
> +					 u8 evts)
> +{
> +	if ((evts & I3C_CCC_EVENT_MR) &&
> +	    !master->init_done) {
> +		INIT_WORK(&master->mastership, i3c_secondary_master_bus_init);
> +		queue_work(master->wq, &master->mastership);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(i3c_secondary_master_events_enabled);

Hm, so you're trying to standardize events handling. I had initially
left that to the driver as it's likely to be controller specific.

> +
> +/**
>   * i3c_master_unregister() - unregister an I3C master
>   * @master: master used to send frames on the bus
>   *
> @@ -2552,6 +2780,11 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  	if (!master || !xfers)
>  		return -EINVAL;
>  
> +	if (master->op_mode == I3C_SLAVE_MODE) {
> +		if (i3c_master_request_mastership(master))
> +			return -EIO;
> +	}
> +
>  	if (!master->ops->priv_xfers)
>  		return -ENOTSUPP;
>  
> @@ -2657,5 +2890,6 @@ static void __exit i3c_exit(void)
>  module_exit(i3c_exit);
>  
>  MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
> +MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");

Please do that in a separate patch.

>  MODULE_DESCRIPTION("I3C core");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f13fd8b..ada956a 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -282,6 +282,16 @@ enum i3c_addr_slot_status {
>  };
>  
>  /**
> + * enum i3c_op_mode - I3C controller operation mode
> + * @I3C_SLAVE_MODE: I3C controller operates in slave mode
> + * @I3C_MASTER_MODE: I3C controller operates in master mode
> + */
> +enum i3c_op_mode {
> +	I3C_SLAVE_MODE,
> +	I3C_MASTER_MODE
> +};
> +
> +/**
>   * struct i3c_bus - I3C bus object
>   * @cur_master: I3C master currently driving the bus. Since I3C is multi-master
>   *		this can change over the time. Will be used to let a master
> @@ -418,6 +428,20 @@ struct i3c_bus {
>   *		      for a future IBI
>   *		      This method is mandatory only if ->request_ibi is not
>   *		      NULL.
> + * @update_devs: updates device list. Called after bus takeover. Secondary
> + *               master can't perform DAA procedure.

Is that really true? Can you point me to the relevant section in the
spec describing this constraint?

>		     This function allows to
> + *               update devices received from previous bus owner in DEFSLVS
> + *               command. Useful also when new device joins the bus controlled
> + *               by secondary master, main master will be able to add
> + *               this device after mastership takeover.
> + * @request_mastership: requests bus mastership. By default called by secondary
> + *                      master after ENEC CCC is received and when devices were
> + *                      not fully initialized yet. Mastership is also requested
> + *                      when device driver wants to transfer data using master
> + *                      in slave mode.
> + * @enable_mastership: enable the Mastership for specified device. Mastership
> + *                     does not require handler. Mastership is enabled for all
> + *                     masters by default.

Maybe ->enable_mr_events() (->enable_mastership() is just unclear to
me). Oh, and if you have an enable function you should have a disable
one too.

>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -445,6 +469,9 @@ struct i3c_master_controller_ops {
>  	int (*disable_ibi)(struct i3c_dev_desc *dev);
>  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
>  				 struct i3c_ibi_slot *slot);
> +	void (*update_devs)(struct i3c_master_controller *master);
> +	int (*request_mastership)(struct i3c_master_controller *master);
> +	int (*enable_mastership)(struct i3c_dev_desc *dev);
>  };
>  
>  /**
> @@ -458,6 +485,7 @@ struct i3c_master_controller_ops {
>   * @ops: master operations. See &struct i3c_master_controller_ops
>   * @secondary: true if the master is a secondary master
>   * @init_done: true when the bus initialization is done
> + * @op_mode: controller operation mode

As said earlier, I don't think this is needed. Just check ->cur_master
to know whether the master owns the bus or not.

>   * @boardinfo.i3c: list of I3C  boardinfo objects
>   * @boardinfo.i2c: list of I2C boardinfo objects
>   * @boardinfo: board-level information attached to devices connected on the bus
> @@ -467,6 +495,7 @@ struct i3c_master_controller_ops {
>   *	in a thread context. Typical examples are Hot Join processing which
>   *	requires taking the bus lock in maintenance, which in turn, can only
>   *	be done from a sleep-able context
> + * @mastership: work for switching operation mode after bus takeover

How about mr_work or something like that. mastership is a bit
ambiguous, and it's not really clear that it's representing a work
object.

>   *
>   * A &struct i3c_master_controller has to be registered to the I3C subsystem
>   * through i3c_master_register(). None of &struct i3c_master_controller fields
> @@ -480,12 +509,14 @@ struct i3c_master_controller {
>  	const struct i3c_master_controller_ops *ops;
>  	unsigned int secondary : 1;
>  	unsigned int init_done : 1;
> +	enum i3c_op_mode op_mode;
>  	struct {
>  		struct list_head i3c;
>  		struct list_head i2c;
>  	} boardinfo;
>  	struct i3c_bus bus;
>  	struct workqueue_struct *wq;
> +	struct work_struct mastership;
>  };
>  
>  /**
> @@ -523,7 +554,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
>  
>  int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  			     u8 start_addr);
> -
> +int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
> +			   struct i2c_dev_boardinfo *info);
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> @@ -536,6 +568,15 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			const struct i3c_master_controller_ops *ops,
>  			bool secondary);
>  int i3c_master_unregister(struct i3c_master_controller *master);
> +int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
> +				 const struct i3c_device_info *info);
> +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> +				     struct i3c_dev_desc *new_master,
> +				     enum i3c_op_mode new_op_mode);
> +int i3c_master_mastership_ack(struct i3c_master_controller *master,
> +			      const struct i3c_device_info *info);
> +void i3c_secondary_master_events_enabled(struct i3c_master_controller *master,
> +					 u8 evts);
>  
>  /**
>   * i3c_dev_get_master_data() - get master private data attached to an I3C


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
