Return-Path: <SRS0=RbR2=7C=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C86C433E0
	for <linux-i3c@archiver.kernel.org>; Wed, 20 May 2020 08:59:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C3D2075F
	for <linux-i3c@archiver.kernel.org>; Wed, 20 May 2020 08:59:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c2iPxjwY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C3D2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9q0SHjaAjWQY3/NkJkWye+nZ3kpugcAZ6vsr304Q/CM=; b=c2iPxjwYch+NIU
	paYgvNbZf6eh3Phsl2Q9rmWnpQ0Xc8NoOoyQLegMFvUunMjS2MpenZQ0CP6tr0xgut2lKo70iO29y
	J8jUyWoQRs/unuADEWoCQmE4B0BoGCK3af0f/xi4GvPyFtExV5lch/LyEH1RNMXl+ZVHMcz5CaB9N
	eSn8TFfpof1wupM8qa7TTehT6B72S8vkhO8lSMIjtgN51q+shHwiTFnUCrGGRv+DVzjYG+8bdrM7L
	YjKDDQ+bCUWqKP5fQJuQE/luTfm6Q4yLqXYmNgKPvzgASbG+blOLFI/o9Q2emH1hwPF1d/jfkrCR3
	mL6KekOioXR1b4qXOgAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbKZ7-0000Q6-IN; Wed, 20 May 2020 08:59:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbKZ4-0000KO-1G
 for linux-i3c@lists.infradead.org; Wed, 20 May 2020 08:59:04 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4E5B2A29CA;
 Wed, 20 May 2020 09:58:58 +0100 (BST)
Date: Wed, 20 May 2020 10:58:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH] i3c: master: fix for SETDASA and DAA process
Message-ID: <20200520105855.71db98d1@collabora.com>
In-Reply-To: <1589473809-16708-1-git-send-email-pthombar@cadence.com>
References: <1589473809-16708-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_015902_347693_44886AE2 
X-CRM114-Status: GOOD (  30.29  )
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

On Thu, 14 May 2020 18:30:09 +0200
Parshuram Thombare <pthombar@cadence.com> wrote:

> This patch fix following issues.
> 1. Controller slots blocked for devices with static_addr
>    but no init_dyn_addr may limit the number of I3C devices
>    on the bus which gets dynamic address in DAA. So
>    instead of attaching all the devices with static_addr,
>    now we only attach the devices which successfully
>    complete SETDASA. Remaining devices are handled in DAA.
> 2. Since we alreay handled devices with init_dyn_addr, removed
>    it's handling from i3c_master_add_i3c_dev_locked().
>    Now only case handled is devices already with dyn_addr
>    participated in DAA, and again got new dyn_addr with an
>    extra slot in the master controller.

I don't get that one.

> 3. Removed unnecessary i3c_master_reattach_i3c_dev() from
>    i3c_master_add_i3c_dev_locked(), right away after finding
>    if duplicate device exists in the I3C list.
>    In case of different new and old dyn_addr
>    i3c_master_reattach_i3c_dev() will fail which is wrong,
>    and in case of same dyn_addr it doesn't add anything new.

I think we should fix re-attach instead, which is what we discussed
with Przemek if I remember correctly.

> 

Can you please split the patch accordingly (one fix per commit)?

> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  drivers/i3c/master.c | 111 ++++++++++++++++++-------------------------
>  1 file changed, 46 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52121fe..f1d929b58549 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1375,6 +1375,11 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  		i3c_bus_set_addr_slot_status(&master->bus,
>  					     dev->info.dyn_addr,
>  					     I3C_ADDR_SLOT_I3C_DEV);
> +
> +		if (old_dyn_addr)
> +			i3c_bus_set_addr_slot_status(&master->bus,
> +						     old_dyn_addr,
> +						     I3C_ADDR_SLOT_FREE);
>  	}
>  
>  	if (master->ops->reattach_i3c_dev) {
> @@ -1426,33 +1431,52 @@ static void i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>  		master->ops->detach_i2c_dev(dev);
>  }
>  
> -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> +static void i3c_master_pre_assign_dyn_addr(struct i3c_master_controller *master,
> +					   struct i3c_dev_boardinfo *boardinfo)
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
> +	/*
> +	 * We anyway don't attach devices which are not addressable
> +	 * (no static_addr and dyn_addr) and devices with static_addr
> +	 * but no init_dyn_addr will participate in DAA.
> +	 */
> +	if (!boardinfo->static_addr || !boardinfo->init_dyn_addr)
> +		return;
> +
> +	i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> +	if (IS_ERR(i3cdev))
>  		return;
>  
> -	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
> -					dev->boardinfo->init_dyn_addr);
> +	i3cdev->boardinfo = boardinfo;
> +
> +	ret = i3c_master_attach_i3c_dev(master, i3cdev);
>  	if (ret)
>  		return;
>  
> -	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
> -	ret = i3c_master_reattach_i3c_dev(dev, 0);
> +	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> +					i3cdev->boardinfo->init_dyn_addr);
>  	if (ret)
> -		goto err_rstdaa;
> +		goto err_setdasa;
>  
> -	ret = i3c_master_retrieve_dev_info(dev);
> +	i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
> +	ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
>  	if (ret)
>  		goto err_rstdaa;
>  
> -	return;
> +	ret = i3c_master_retrieve_dev_info(i3cdev);
> +	if (ret)
> +		goto err_rstdaa;
>  
>  err_rstdaa:
> -	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> +	i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
> +err_setdasa:
> +	i3c_master_detach_i3c_dev(i3cdev);
> +	i3c_master_free_i3c_dev(i3cdev);
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
> @@ -1647,7 +1671,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> -	struct i3c_dev_desc *i3cdev;
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
>  
> @@ -1679,34 +1702,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
> @@ -1746,8 +1741,8 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>  	 * Pre-assign dynamic address and retrieve device information if
>  	 * needed.
>  	 */
> -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> -		i3c_master_pre_assign_dyn_addr(i3cdev);
> +	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node)
> +		i3c_master_pre_assign_dyn_addr(master, i3cboardinfo);
>  
>  	ret = i3c_master_do_daa(master);
>  	if (ret)
> @@ -1811,7 +1806,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  {
>  	struct i3c_device_info info = { .dyn_addr = addr };
>  	struct i3c_dev_desc *newdev, *olddev;
> -	u8 old_dyn_addr = addr, expected_dyn_addr;
> +	u8 old_dyn_addr = addr;
>  	struct i3c_ibi_setup ibireq = { };
>  	bool enable_ibi = false;
>  	int ret;
> @@ -1866,39 +1861,25 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  		i3c_master_free_i3c_dev(olddev);
>  	}
>  
> -	ret = i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
> -	if (ret)
> -		goto err_detach_dev;
> -
>  	/*
>  	 * Depending on our previous state, the expected dynamic address might
>  	 * differ:
>  	 * - if the device already had a dynamic address assigned, let's try to
> -	 *   re-apply this one
> -	 * - if the device did not have a dynamic address and the firmware
> -	 *   requested a specific address, pick this one
> +	 *   re-apply this one. Device with dyn_addr participated in DAA ?
>  	 * - in any other case, keep the address automatically assigned by the
>  	 *   master
>  	 */
> -	if (old_dyn_addr && old_dyn_addr != newdev->info.dyn_addr)
> -		expected_dyn_addr = old_dyn_addr;
> -	else if (newdev->boardinfo && newdev->boardinfo->init_dyn_addr)
> -		expected_dyn_addr = newdev->boardinfo->init_dyn_addr;
> -	else
> -		expected_dyn_addr = newdev->info.dyn_addr;
> -
> -	if (newdev->info.dyn_addr != expected_dyn_addr) {
> +	if (old_dyn_addr && old_dyn_addr != newdev->info.dyn_addr) {
>  		/*
>  		 * Try to apply the expected dynamic address. If it fails, keep
>  		 * the address assigned by the master.
>  		 */
>  		ret = i3c_master_setnewda_locked(master,
>  						 newdev->info.dyn_addr,
> -						 expected_dyn_addr);
> +						 old_dyn_addr);
>  		if (!ret) {
> -			old_dyn_addr = newdev->info.dyn_addr;
> -			newdev->info.dyn_addr = expected_dyn_addr;
> -			i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
> +			newdev->info.dyn_addr = old_dyn_addr;
> +			i3c_master_reattach_i3c_dev(newdev, addr);
>  		} else {
>  			dev_err(&master->dev,
>  				"Failed to assign reserved/old address to device %d%llx",


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
