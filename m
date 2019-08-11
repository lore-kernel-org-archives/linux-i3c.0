Return-Path: <SRS0=6ajW=WH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7726FC433FF
	for <linux-i3c@archiver.kernel.org>; Sun, 11 Aug 2019 10:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F6F92085B
	for <linux-i3c@archiver.kernel.org>; Sun, 11 Aug 2019 10:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFa6jOCY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F6F92085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FR8EtlVUg/bVfURPRtAUVtU2Yo/0zhKBlMq0S6tVrP0=; b=oFa6jOCYm2fLVD
	eFpcIsnx9ztaMsKhcEa4NmRK9Ht8NhAQbHA8InjIdBRqwUEGMemGk6b4LtIm7aPO0TbEMX6XVyRHq
	qrapVmcwq/MGwFpL1aVBG7IYnv+RZNOC0ccCTNAaQzzdKWGnzFJtYQeylP6HnAG5/hnJmE20wr6bB
	kqOMHm24YdFlygAC4mFVIKkSYNroEgEFL51Ex1tHX+QOlMhutyUcYdyqHDs2s848F2x8W9cixI0bQ
	UcnbNXUKDXzy6YcN1bwlJdvi+mX5BMchR1240HSqY3GsYbFiqYX0EPJJd7miVF+XitwTFF+DBAHcV
	yseXF+QThJYnnmAmGs0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwkv8-0004r9-Ot; Sun, 11 Aug 2019 10:17:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwkv5-0004qj-1f
 for linux-i3c@lists.infradead.org; Sun, 11 Aug 2019 10:17:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0B518274F9B;
 Sun, 11 Aug 2019 11:17:42 +0100 (BST)
Date: Sun, 11 Aug 2019 12:17:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>, Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190811121738.71b55bb1@collabora.com>
In-Reply-To: <SN6PR12MB2655A1F005B691E4E98B282CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-5-git-send-email-pgaj@cadence.com>
 <SN6PR12MB2655AA801F30D1C237C18CFAAEF00@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190711052440.GA13386@global.cadence.com>
 <SN6PR12MB2655B1D9B6F0135E84FC6D0DAEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712101042.GA4728@global.cadence.com>
 <SN6PR12MB2655A1F005B691E4E98B282CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190811_031747_360807_0C4D6A2B 
X-CRM114-Status: GOOD (  44.98  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "agolec@cadence.com" <agolec@cadence.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Przemek, Vitor,

Sorry for the late reply.

On Fri, 12 Jul 2019 11:28:36 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> > > > > > ---
> > > > > > 
> > > > > > Main changes between v4 and v5:
> > > > > > - Add function to test if master owns the bus
> > > > > > - Add i3c_secondary_master_register() function
> > > > > > - Add populate_bus() hook to populate the bus after mastership takeover  
> > > > > 
> > > > > For me this task is for the sub-system not the host controller.
> > > > >   
> > > > 
> > > > I'm not sure where device information is stored in DW controller but in CDNS
> > > > controller DEFSLVS frame is processed in the device and the only thing I got is
> > > > information that DEFSLVS came in.   
> > > 
> > > When you receive this notification you can add the device to subsystem to 
> > > be initialized later when get bus ownership.  
> > 
> > I added this hook mostly because we have to lock the bus during devices
> > addition. If we pass DEFSLVS devices information to the system in some
> > structure, we should be ok. We can lock the bus in the framework and register
> > all the devices. But I still don't feel this is good solution, I'll have to
> > do the job once again which HW did before  
> 
> Your HW just fill a table with the DEFSLVS data and you still have to 
> access, retrieve the information and attached to the controller (same 
> approach as DAA).
> 
> If all these management is passed to the subsystem it will be more easy 
> to maintain and HC agonistic.
> 
> > 
> > @Boris, what do you think about that?

If there's nothing HW specific in ->populate_bus(), then yes, it makes
sense to have it done in the core based on information extracted from
the DEFSLVS frame.

> >   
> > >   
> > > > I need to inform subsystem that there are new
> > > > device (if any).
> > > > I remember we talkad about that already, you have access to
> > > > DEFSLVS information directly, correct?  
> > > 
> > > I can process it in the HC driver, but my point is that I want to rely it 
> > > to the subsystem the bus population with the function already present.
> > >   
> > 
> > So, do you want to pack those informations back to i3c_ccc_defslvs and pass to
> > the subsystem?  
> 
> Not necessary. It can be passed addr, bcr, dcr and lvr. 
> 
> In the subsystem I think it should be a list of i3c_ccc_defslvs that 
> holds DEFSLVS information.

Sorry, I don't get what you mean here. Why would we want a list of
i3c_ccc_defslvs objects when i3c_ccc_defslvs already stores an
array of devices. I guess you meant a list of struct i3c_ccc_dev_desc
objects.

> 
> >   
> > > >   
> > > > > > - Rework device information retrieval to allow adding partialy discovered
> > > > > > devices
> > > > > > 
> > > > > > Main changes between v3 and v4:
> > > > > > - Add i3c_master_acquire_bus_ownership to acquire the bus
> > > > > > - Refactored the code
> > > > > > 
> > > > > > Main changes between v2 and v3:
> > > > > > - Add i3c_bus_downgrade_maintenance_lock() for downgrading the bus
> > > > > > lock from maintenance to normal use
> > > > > > - Add additional fields to i2c_dev_desc for DEFSLVS purpose (addr, lvr)
> > > > > > - Add i3c_master_register_new_i2c_devs() function to register I2C devices
> > > > > > - Reworked I2C devices registration on secondary master side
> > > > > > 
> > > > > > Changes in v2:
> > > > > > - Add mastership disable event hook
> > > > > > - Changed name of mastership enable event hook
> > > > > > - Add function to test if master owns the bus
> > > > > > - Removed op_mode
> > > > > > - Changed parameter of i3c_master_get_accmst_locked, no need to
> > > > > > pass full i3c_device_info
> > > > > > - Changed name of mastership enable event hook
> > > > > > - Add function to test if master owns the bus
> > > > > > - Removed op_mode
> > > > > > - Changed parameter of i3c_master_get_accmst_locked, no need to
> > > > > > pass full i3c_device_info
> > > > > > - Removed redundant DEFSLVS command before GETACCMST
> > > > > > - Add i3c_master_bus_takeover function. There is a need to lock
> > > > > > the bus before adding devices and no matter of the controller
> > > > > > devices have to be added after mastership takeover.
> > > > > > - Add device registration during initialization on secondary master
> > > > > > side. Devices received by DEFSLVS (if occured). If not, device
> > > > > > initialization is deffered untill next mastership request.
> > > > > > ---
> > > > > >  drivers/i3c/device.c       |  26 ++
> > > > > >  drivers/i3c/internals.h    |   4 +
> > > > > >  drivers/i3c/master.c       | 588 ++++++++++++++++++++++++++++++++++++++-------
> > > > > >  include/linux/i3c/master.h |  34 ++-
> > > > > >  4 files changed, 563 insertions(+), 89 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > > > > > index 69cc040..b60f637 100644
> > > > > > --- a/drivers/i3c/device.c
> > > > > > +++ b/drivers/i3c/device.c
> > > > > > @@ -43,7 +43,13 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > > >  	}
> > > > > >  
> > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > +	if (ret)
> > > > > > +		goto err_unlock_bus;
> > > > > > +
> > > > > >  	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> > > > > > +
> > > > > > +err_unlock_bus:
> > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > >  
> > > > > >  	return ret;
> > > > > > @@ -114,11 +120,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
> > > > > >  	int ret = -ENOENT;
> > > > > >  
> > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > +	if (ret)
> > > > > > +		goto err_unlock_bus;
> > > > > > +
> > > > > >  	if (dev->desc) {
> > > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > > >  		ret = i3c_dev_enable_ibi_locked(dev->desc);
> > > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > > >  	}
> > > > > > +
> > > > > > +err_unlock_bus:
> > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > >  
> > > > > >  	return ret;
> > > > > > @@ -145,11 +157,17 @@ int i3c_device_request_ibi(struct i3c_device *dev,
> > > > > >  		return -EINVAL;
> > > > > >  
> > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > +	if (ret)
> > > > > > +		goto err_unlock_bus;
> > > > > > +
> > > > > >  	if (dev->desc) {
> > > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > > >  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
> > > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > > >  	}
> > > > > > +
> > > > > > +err_unlock_bus:
> > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > >  
> > > > > >  	return ret;
> > > > > > @@ -166,12 +184,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
> > > > > >   */
> > > > > >  void i3c_device_free_ibi(struct i3c_device *dev)
> > > > > >  {
> > > > > > +	int ret;
> > > > > > +
> > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > +	if (ret)
> > > > > > +		goto err_unlock_bus;
> > > > > > +
> > > > > >  	if (dev->desc) {
> > > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > > >  		i3c_dev_free_ibi_locked(dev->desc);
> > > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > > >  	}
> > > > > > +
> > > > > > +err_unlock_bus:
> > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(i3c_device_free_ibi);
> > > > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > > > index 86b7b44..cdfc5bf 100644
> > > > > > --- a/drivers/i3c/internals.h
> > > > > > +++ b/drivers/i3c/internals.h
> > > > > > @@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
> > > > > >  
> > > > > >  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
> > > > > >  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> > > > > > +void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> > > > > > +void i3c_bus_maintenance_unlock(struct i3c_bus *bus);  
> > > > > 
> > > > > These function are static.
> > > > >   
> > > > 
> > > > I forgot to revert that change to previous state.
> > > >   
> > > > > > +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
> > > > > > +  
> > > > > 
> > > > > What do you think to pass this logic to master.c?
> > > > >   
> > > > 
> > > > Isn't it there?  
> > > 
> > > I meant make it static and remove its call from device.c.

Can you be more specific? Where would you move the
i3c_master_acquire_bus_ownership() call? Note that we already
considered different options and the solution proposed here was the
cleanest race-free one.

> > >   
> > > >   
> > > > > >  
> > > > > >  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > > > > >  				 struct i3c_priv_xfer *xfers,
> > > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > > index cbace14..3b44e66 100644
> > > > > > --- a/drivers/i3c/master.c
> > > > > > +++ b/drivers/i3c/master.c
> > > > > > @@ -93,6 +93,18 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
> > > > > >  	up_read(&bus->lock);
> > > > > >  }
> > > > > >  
> > > > > > +/*
> > > > > > + * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
> > > > > > + * operation
> > > > > > + *
> > > > > > + * Should be called when a maintenance operation is done and normal
> > > > > > + * operation is planned. See i3c_bus_maintenance_lock() and
> > > > > > + * i3c_bus_normaluse_lock() for more details.
> > > > > > + */
> > > > > > +static void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)
> > > > > > +{
> > > > > > +	downgrade_write(&bus->lock);
> > > > > > +}
> > > > > >  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
> > > > > >  {
> > > > > >  	return container_of(dev, struct i3c_master_controller, dev);
> > > > > > @@ -341,6 +353,22 @@ static int i3c_device_probe(struct device *dev)
> > > > > >  	return driver->probe(i3cdev);
> > > > > >  }
> > > > > >  
> > > > > > +static int
> > > > > > +i3c_master_enable_mr_events_locked(struct i3c_master_controller *master)
> > > > > > +{
> > > > > > +	if (!master->ops->enable_mr_events)
> > > > > > +		return -ENOTSUPP;
> > > > > > +
> > > > > > +	return master->ops->enable_mr_events(master);
> > > > > > +}
> > > > > > +
> > > > > > +static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
> > > > > > +{
> > > > > > +	if (!master->ops->disable_mr_events)
> > > > > > +		return;
> > > > > > +
> > > > > > +	master->ops->disable_mr_events(master);
> > > > > > +}  
> > > > > 
> > > > > Add new line.
> > > > > 
> > > > > It is not clear to me what you expect with these functions. Do you want 
> > > > > to enable MR from all devices? Just some of them? How do you decide which 
> > > > > secondary masters are allow earn the bus ownership?
> > > > >   
> > > > 
> > > > We discussed this also. For now, we enable ENEC for all masters on the bus, we
> > > > can change it later if needed.   
> > > 
> > > I would say to expand the current ibi framework to accommodate MR and  
> > 
> > Can you tell something more here? What benefits you see  
> 
> Just starting with the name. IBI stands for In Band Interrupt which can 
> be MR, HJ or SIR.
> 
> Also the concept is the same, let say you are registering a SIR w/out 
> data but in fact it is a MR.

No, it's not from a SW PoV. IBI are events I3C device drivers can
register a handler for, MR and HJ events are things the HC drivers are
expected to handle, and that's a big difference. While re-using the IBI
API to handle them should be doable I don't think it will make things
simpler.

> 
> >   
> > > also add platform entry to allow secondary masters on the bus.  
> > 
> > This is something we can consider, to select devices which can request
> > mastership. But I don't see the problem adding that later also.  
> 

Fully agree with that, that's still something we can consider
restricting afterwards. Remember that I3C is still not widely deployed
and we only have 2 controller drivers so far, so patching them should be
fairly easy if we decide to change the interface.

> 
> 
> >   
> > >   
> > > > Also, priority level is encoded in slave address
> > > > so current master will give the control to the master with lower address first.
> > > > It shouldn't be a problem.  
> > > 
> > > You can have security issues and the devices on the bus might not be 
> > > prepared to work in multi-master environment.  
> > 
> > I don't get it, can you explan what do you mean? Which devices might not be
> > prapared to work in multi-master environment, slaves? Key feature of I3C is
> > multi-master capability. Mastership request should also be transparent for pure
> > slaves on the bus. Of course, secondary masters should work in multi-master
> > configuration  
> 
> So you are probing the same hw device on two different systems. This mean 
> that in system A you can have the configuration A and in system B the 
> configuration B.
> How will you deal with this?

That's certainly something we should take care of, by restoring
previous device configs every time a bus handover happens. It will
probably involve some kind of collaboration between the core and device
drivers, because part of the configuration (everything that's set
through private SDR transfers) is only known by device users. The core
can take care of restoring IBIs config though.


> > > > > > +/**
> > > > > > + * i3c_master_bus_takeover() - register new I3C devices on bus takeover
> > > > > > + * @master: master used to send frames on the bus
> > > > > > + *
> > > > > > + * This function is useful when devices were not added
> > > > > > + * during initialization or when new device joined the bus
> > > > > > + * which wasn't under our control.
> > > > > > + */
> > > > > > +void i3c_master_bus_takeover(struct i3c_master_controller *master)
> > > > > > +{
> > > > > > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	master->want_to_acquire_bus = false;  
> > > > > 
> > > > > Can you explain the usage of this variable?
> > > > >   
> > > > 
> > > > The idea of this was to let HC know that we want to acquire the bus after
> > > > ENEC(MR) received in slave mode.  
> > > 
> > > With the logic that I proposed you don't need this. When received ENEC 
> > > you will try to get the bus ownership if HC not fully initialized or have 
> > > DEFSLVS to add, otherwise you don't need to get the bus ownership.  
> > 
> > In case devices on the bus are the same, I agree. But please consider the case
> > when slave joins the bus (Hot-Join) and MR event is disabled for now, our
> > secondary master receives DEFSLVS, we add that device to the subsystem but
> > cannot request mastership yet. We need a flag to indicate that we should
> > request mastership on next ENEC(MR). It doesn't make sense to request
> > mastership every time when ENEC(MR) is received.  
> 
> At least I think you can give a mean for the flag name, otherwise it is 
> not clear why sec master want bus ownership.

Well, I guess the idea was to use the same flag for any kind of
deferred MR requests. Not sure the reason for this MR request is really
important since the same set of actions will be done anyway. Do you have
a use case where we need to know the reason of a MR? If that's the
case, or if we want to know it for debug purpose, I'd recommend adding
extra flags to express that while keeping the want_to_acquire_bus one.

> 
> >   
> > >   
> > > >   
> > > > > > +
> > > > > > +	if (!master->init_done)
> > > > > > +		return;
> > > > > > +
> > > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > > +	master->ops->populate_bus(master);
> > > > > > +
> > > > > > +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> > > > > > +				 common.node) {
> > > > > > +		if (i3cdev->info.pid)
> > > > > > +			continue;
> > > > > > +
> > > > > > +		ret = i3c_master_retrieve_info_and_reuse(master, i3cdev);
> > > > > > +		if (ret) {
> > > > > > +			if (i3cdev->dev && i3cdev->dev->desc)
> > > > > > +				i3cdev->dev->desc = NULL;
> > > > > > +
> > > > > > +			i3c_master_detach_i3c_dev(i3cdev);
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * If current master finished bus initialization properly, we can
> > > > > > +	 * enable Mastership event.
> > > > > > +	 */
> > > > > > +	ret = i3c_master_enable_mr_events_locked(master);
> > > > > > +	if (ret)
> > > > > > +		dev_warn(&master->dev, "ENEC(MR) failed (ret = %i)", ret);
> > > > > > +
> > > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > > +
> > > > > > +	i3c_master_register_new_devs(master);
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
> > > > > > +
> > > > > >  /**
> > > > > >   * i3c_master_init() - initializes all the structures required by I3C master
> > > > > >   * @master: master used to send frames on the bus
> > > > > > @@ -2417,9 +2712,6 @@ int i3c_master_init(struct i3c_master_controller *master,
> > > > > >  	struct i2c_dev_boardinfo *i2cbi;
> > > > > >  	int ret;
> > > > > >  
> > > > > > -	/* We do not support secondary masters yet. */
> > > > > > -	if (secondary)
> > > > > > -		return -ENOTSUPP;
> > > > > >  
> > > > > >  	ret = i3c_master_check_ops(ops);
> > > > > >  	if (ret)
> > > > > > @@ -2432,6 +2724,7 @@ int i3c_master_init(struct i3c_master_controller *master,
> > > > > >  	master->dev.release = i3c_masterdev_release;
> > > > > >  	master->ops = ops;
> > > > > >  	master->secondary = secondary;
> > > > > > +	master->want_to_acquire_bus = secondary;
> > > > > >  	INIT_LIST_HEAD(&master->boardinfo.i2c);
> > > > > >  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> > > > > >  
> > > > > > @@ -2488,6 +2781,92 @@ void i3c_master_cleanup(struct i3c_master_controller *master)
> > > > > >  EXPORT_SYMBOL_GPL(i3c_master_cleanup);
> > > > > >  
> > > > > >  /**
> > > > > > + * i3c_secondary_master_register() - register an secondary I3C master
> > > > > > + * @master: master used to send frames on the bus
> > > > > > + * @info: master info, describes this device
> > > > > > + *
> > > > > > + * This function takes care of everything for you:
> > > > > > + *
> > > > > > + * - updates this master info
> > > > > > + * - registers the I2C adapter
> > > > > > + * - if possible, populates the bus with devices received by DEFSLVS
> > > > > > + *   command
> > > > > > + *
> > > > > > + * Return: 0 in case of success, a negative error code otherwise.
> > > > > > + */
> > > > > > +int i3c_secondary_master_register(struct i3c_master_controller *master,
> > > > > > +				  struct i3c_device_info *info)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret = i3c_master_set_info(master, info, master->secondary);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	ret = master->ops->bus_init(master);
> > > > > > +	if (ret)
> > > > > > +		return ret;  
> > > > > 
> > > > > At this point you don't have enough information to do the bus 
> > > > > initialization.
> > > > >   
> > > > 
> > > > Actually, current ->bus_init() implementations (in CDNS and DW) does not
> > > > initialize the bus. We are just setting the mode, configuring some init values
> > > > in the registers and enabling the core. Maybe we should rename it?  
> > > 
> > > The name for me its ok. My point was that when you call 
> > > i3c_secondary_master_register() in CDNS you don't have yet DEFSLVS 
> > > information.  
> > 
> > It depends. When current master did not initialize the bus yet, this is true.
> > But when master and the bus are already initialized, I have DEFSLVS. Different
> > story is that devices aren't added to the subsystem yet. So what I have do in
> > that case is to enable to let HC operate and populate the bus later (using  
> > ->populate_bus() hook)  
> 
> Ahh I didn't see, you are calling it in two different places. Does it 
> make sense?
> 
> It is more logical to do the secondary_master_register() after get the 
> bus ownership (just need the first time), otherwise the HC is just a 
> slave.

I think we've tried that approach, and I wasn't happy with the end
result. Don't remember the exact reason, but it was something related
to extra complexity related to init/registration steps in HC drivers.
You can look at my previous reviews if you want more details.

> > > > > 
> > > > > In generally I found this intrusive for the current eco system.
> > > > > 
> > > > > I propose the following:
> > > > > 1 - Keep the function i3c_master_register() as is and go out before   
> > > > 
> > > > We had that version previously. We decided to split it.  
> > > 
> > > You just need to split the secondary master part from it. So you can go 
> > > out before i3c_master_bus_init() and keep the same function.  
> > 
> > We discussed that with Boris and we decided to split this function in this
> > version to make things clear.  
> 
> My proposal isn't to much different with the advantage that it not broke 
> the existing code.

How do we break existing code? Can you please be more specific when you
make such statements so we can fix the problems. And no, keeping kernel
APIs/interfaces stable has never been our goal. Actually, it's quite the
opposite: the I3C subsystem is new, and if we see some of the initial
functions/interfaces/hooks do not apply well to some of the new
features we want to support, we should fix them, instead of trying to
workaround them.

> 
> >   
> > > 
> > > Them use i3c_secondary_master_register() when received DEFSLVS or ENEC 
> > > MR.  
> > 
> > It is also possible that our controller received DA and DEFSLVS even before
> > master registration. We should try to register that, this is something I'm
> > testing in my scenarios.  
> 
> That shouldn't be a problem. You receive DA and them DEFSLVS.
> 
> Add DEFSLVS to the system and try to be current master.
> 
> If you get the ownership, do:
> 	i3c_secondary_master_register()
> 	retrieve defslvs info and add them to the system.

That's not so simple. You have cases where the DEFLSLVS CCC has been
received before the driver was loaded. In that case you should call
i3c_secondary_master_register() in the probe path. It's this extra
complexity about when to call i3c_secondary_master_register() (and
other init steps related to that) that I was complaining about with
this approach.

> 
> After this you will see everything in /sys/bus/i3c/devices
> 
> If you don't get the ownership, it is ok because HC is just a slave.
> 
> I would try to da all management task in subsystem.

Again, please be more specific in your proposals. It's easy to come up
with some high-level suggestions like "you should be able to do it this
way", but unless you've actually tried you can't tell if that's possible
or cleaner. I wish you had taken part to the discussion when it started
and had followed the evolution of the patch series, this way you'd
realized that we tried some of the things you suggest here and decided
to do it differently because the end result was not so great.

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
