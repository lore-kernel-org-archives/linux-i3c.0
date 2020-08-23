Return-Path: <SRS0=A1g0=CB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBCEC433DF
	for <linux-i3c@archiver.kernel.org>; Sun, 23 Aug 2020 10:14:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2322072D
	for <linux-i3c@archiver.kernel.org>; Sun, 23 Aug 2020 10:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WXP7IBq4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D2322072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pBMWYCWQxKDFIZ7YDm6hZBSy7n0Gl8pbtaH3hy+7XlA=; b=WXP7IBq4pyJSAUbg3QVedjCXj
	zwT704r47Sae6cuWNg91ZP0vjL0OCDthYsRSmNs3OTaewjjOeg3SolrnphPAlwvacjkjOLQ78ZPDe
	aVVEGAlvag6L9LapUbb37Y0Fr1UkzhdetgflRluGLV3LLYy8GII2GiSv1Vqk5CQjDCUipF5rVNNTv
	tzvQmNxqGZCG6H7/57dCSbIuJxzDHuly0058gddXMoXClukmwZoh1Jvt+xlpwNtlDPRk2OkeOF4vp
	Sk1TfB8iGl1njrt8aqX6mVW7EZu593Vrprz2UKWrB4zpQlim68bvMP5e+Fuu3IekAbpETF3f0SiSm
	OvFxBu7AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9n1M-0002ih-3c
	for linux-i3c@archiver.kernel.org; Sun, 23 Aug 2020 10:14:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9n1I-0002iI-J9
 for linux-i3c@lists.infradead.org; Sun, 23 Aug 2020 10:14:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9D17429C09F;
 Sun, 23 Aug 2020 11:14:32 +0100 (BST)
Date: Sun, 23 Aug 2020 12:14:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Thombare <pthombar@cadence.com>, <bbrezillon@kernel.org>,
 mparab@cadence.com, praneeth@ti.com, pgaj@cadence.com
Subject: Re: [PATCH v4] i3c: master: fix for SETDASA and DAA process
Message-ID: <20200823121430.272d97f9@collabora.com>
In-Reply-To: <20200823115918.7dd868e0@collabora.com>
References: <1598001195-18511-1-git-send-email-pthombar@cadence.com>
 <20200823115918.7dd868e0@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_061437_431556_BE4EB42D 
X-CRM114-Status: GOOD (  31.40  )
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
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sun, 23 Aug 2020 11:59:18 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:


> > -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> > +static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
> > +					  struct i3c_dev_boardinfo *boardinfo)
> >  {
> > -	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> > +	struct i3c_device_info info = {
> > +		.static_addr = boardinfo->static_addr,
> > +	};
> > +	struct i3c_dev_desc *i3cdev;
> >  	int ret;
> >  
> > -	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
> > -	    !dev->boardinfo->static_addr)
> > -		return;
> > +	i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> > +	if (IS_ERR(i3cdev))
> > +		return -ENOMEM;
> >  
> > -	ret = i3c_master_setdasa_locked(master, dev->info.static_addr,
> > -					dev->boardinfo->init_dyn_addr);
> > +	i3cdev->boardinfo = boardinfo;
> > +
> > +	ret = i3c_master_attach_i3c_dev(master, i3cdev);
> >  	if (ret)
> > -		return;
> > +		goto err_attach;
> > +
> > +	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> > +					i3cdev->boardinfo->init_dyn_addr);
> > +	if (ret)
> > +		goto err_setdasa;
> >  
> > -	dev->info.dyn_addr = dev->boardinfo->init_dyn_addr;
> > -	ret = i3c_master_reattach_i3c_dev(dev, 0);
> > +	i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
> > +	ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
> >  	if (ret)
> >  		goto err_rstdaa;
> >  
> > -	ret = i3c_master_retrieve_dev_info(dev);
> > +	ret = i3c_master_retrieve_dev_info(i3cdev);
> >  	if (ret)
> >  		goto err_rstdaa;
> >  
> > -	return;
> > +	return 0;
> >  
> >  err_rstdaa:
> > -	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> > +	i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
> > +err_setdasa:

Let's be consistent with the rest of the framework. Labels don't encode
what the error is but what's expected to be undone. IOW, this one
should be err_detach_dev

> > +	i3c_master_detach_i3c_dev(i3cdev);
> > +err_attach:

and this one err_free_dev.

> > +	i3c_master_free_i3c_dev(i3cdev);
> > +
> > +	return ret;
> >  }
> >  
> >  static void
> > @@ -1619,8 +1637,8 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
> >   * This function is following all initialisation steps described in the I3C
> >   * specification:
> >   *
> > - * 1. Attach I2C and statically defined I3C devs to the master so that the
> > - *    master can fill its internal device table appropriately
> > + * 1. Attach I2C devs to the master so that the master can fill its internal
> > + *    device table appropriately
> >   *
> >   * 2. Call &i3c_master_controller_ops->bus_init() method to initialize
> >   *    the master controller. That's usually where the bus mode is selected
> > @@ -1633,10 +1651,14 @@ static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
> >   * 4. Disable all slave events.
> >   *
> >   * 5. Pre-assign dynamic addresses requested by the FW with SETDASA for I3C
> > - *    devices that have a static address
> > + *    devices that have a static address and attach corresponding statically
> > + *    defined I3C devices to the master. If only init_dyn_addr is available
> > + *    or if SETDASA fails, reserve those init_dyn_addr to be used later to set
> > + *    address using SETNEWDA after DAA.

I'd re-order this to match what really happens: first reserve slots for
devices that have an init_dyn_addr defined, then try to create+attach
devices that also have a static address defined.

> >   *
> >   * 6. Do a DAA (Dynamic Address Assignment) to assign dynamic addresses to all
> > - *    remaining I3C devices
> > + *    remaining I3C devices and attach them to the master if the dynamic address
> > + *    assignment succeeds

Can we move that change to a separate patch?

> >   *
> >   * Once this is done, all I3C and I2C devices should be usable.
> >   *
> > @@ -1647,7 +1669,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  	enum i3c_addr_slot_status status;
> >  	struct i2c_dev_boardinfo *i2cboardinfo;
> >  	struct i3c_dev_boardinfo *i3cboardinfo;
> > -	struct i3c_dev_desc *i3cdev;
> >  	struct i2c_dev_desc *i2cdev;
> >  	int ret;
> >  
> > @@ -1679,34 +1700,6 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  			goto err_detach_devs;
> >  		}
> >  	}
> > -	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > -		struct i3c_device_info info = {
> > -			.static_addr = i3cboardinfo->static_addr,
> > -		};
> > -
> > -		if (i3cboardinfo->init_dyn_addr) {
> > -			status = i3c_bus_get_addr_slot_status(&master->bus,
> > -						i3cboardinfo->init_dyn_addr);
> > -			if (status != I3C_ADDR_SLOT_FREE) {
> > -				ret = -EBUSY;
> > -				goto err_detach_devs;
> > -			}
> > -		}
> > -
> > -		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> > -		if (IS_ERR(i3cdev)) {
> > -			ret = PTR_ERR(i3cdev);
> > -			goto err_detach_devs;
> > -		}
> > -
> > -		i3cdev->boardinfo = i3cboardinfo;
> > -
> > -		ret = i3c_master_attach_i3c_dev(master, i3cdev);
> > -		if (ret) {
> > -			i3c_master_free_i3c_dev(i3cdev);
> > -			goto err_detach_devs;
> > -		}
> > -	}
> >  
> >  	/*
> >  	 * Now execute the controller specific ->bus_init() routine, which
> > @@ -1744,10 +1737,33 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> >  
> >  	/*
> >  	 * Pre-assign dynamic address and retrieve device information if
> > -	 * needed.
> > +	 * needed. And reserve the init_dyn_addr in case of failure, to retry
> > +	 * setting the requested address after DAA is done in
> > +	 * i3c_master_add_i3c_dev_locked().

That's no longer accurate: init_dyn_addr are reserved up-front and
device creation is only attempted if the device has a static address.

> >  	 */
> > -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> > -		i3c_master_pre_assign_dyn_addr(i3cdev);
> > +	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > +		/*
> > +		 * We don't attach devices which are not addressable
> > +		 * (no static_addr and dyn_addr) and devices with static_addr
> > +		 * but no init_dyn_addr will participate in DAA.
> > +		 */  
> 
> The above comment should be split:
> 
> 		/*
> 		 * We don't reserve a dynamic address for devices that
> 		 * don't explicitly request one.
> 		 */
> 
> > +		if (!i3cboardinfo->init_dyn_addr)
> > +			continue;
> > +
> > +		ret = i3c_bus_get_addr_slot_status(&master->bus,
> > +						   i3cboardinfo->init_dyn_addr);
> > +		if (ret != I3C_ADDR_SLOT_FREE) {
> > +			ret = -EBUSY;
> > +			goto err_rstdaa;
> > +		}
> > +
> > +		i3c_bus_set_addr_slot_status(&master->bus,
> > +					     i3cboardinfo->init_dyn_addr,
> > +					     I3C_ADDR_SLOT_I3C_DEV);
> > +  
> 		/*
> 		 * Only try to create/attach devices that have a static
> 		 * address. Other devices will be created/attached when
> 		 * DAA happens, and the requested dynamic address will
> 		 * be set using SETNEWDA once those devices become
> 		 * addressable.
> 		 */
> > +		if (i3cboardinfo->static_addr)
> > +			i3c_master_early_i3c_dev_add(master, i3cboardinfo);
> > +	}
> >  
> >  	ret = i3c_master_do_daa(master);
> >  	if (ret)  
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
