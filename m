Return-Path: <SRS0=wpU+=WI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233D4C31E40
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Aug 2019 14:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A7E20679
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Aug 2019 14:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZaXf9YPU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A7E20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SifXlWkDxgjcAUbIW+nGXKGbsQALSpReYNfqTmOpYCo=; b=ZaXf9YPUD942pI
	Dx5ox4KkphhdGKEaNvLjYgp95Q/KiiTboXikzv22bBjBdc9NTOOJ4A0zF0Cxwmf/pK0pYyzDQhPgN
	quTcHfAX5E0wR2+YgqkFRMi1fPG427J025KBwsg6//0hZkgvolZ11NLoBuEuzBz1ALAZ3eTL2PxX3
	FT10uCF+0nr5+7y2s6G7KcAAeVwa1MwzzKNf4MXhKZGnpAIKAbengFrGlgXVp8hLSFHvb2pBGaKfK
	rZXFc82yI8AO9cDhndDNe7FMp/CiB8QmhMo8UjO/mKWr5YfAYSoutQgyS0/2kUfNAtpJW2HmatSK1
	1ezHag0PVjLK4KMZrwIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxBjZ-0003Hh-GR; Mon, 12 Aug 2019 14:55:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxBjV-0003Gp-NK
 for linux-i3c@lists.infradead.org; Mon, 12 Aug 2019 14:55:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8F88228A1B0;
 Mon, 12 Aug 2019 15:55:34 +0100 (BST)
Date: Mon, 12 Aug 2019 16:55:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190812165531.28a38c78@collabora.com>
In-Reply-To: <SN6PR12MB26550DA8761E71DDAABED36FAED30@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-5-git-send-email-pgaj@cadence.com>
 <SN6PR12MB2655AA801F30D1C237C18CFAAEF00@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190711052440.GA13386@global.cadence.com>
 <SN6PR12MB2655B1D9B6F0135E84FC6D0DAEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712101042.GA4728@global.cadence.com>
 <SN6PR12MB2655A1F005B691E4E98B282CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190811121738.71b55bb1@collabora.com>
 <SN6PR12MB26550DA8761E71DDAABED36FAED30@SN6PR12MB2655.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_075538_025717_7ED75C63 
X-CRM114-Status: GOOD (  53.37  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>,
 "agolec@cadence.com" <agolec@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

On Mon, 12 Aug 2019 13:55:34 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> > > > > > I need to inform subsystem that there are new
> > > > > > device (if any).
> > > > > > I remember we talkad about that already, you have access to
> > > > > > DEFSLVS information directly, correct?    
> > > > > 
> > > > > I can process it in the HC driver, but my point is that I want to rely it 
> > > > > to the subsystem the bus population with the function already present.
> > > > >     
> > > > 
> > > > So, do you want to pack those informations back to i3c_ccc_defslvs and pass to
> > > > the subsystem?    
> > > 
> > > Not necessary. It can be passed addr, bcr, dcr and lvr. 
> > > 
> > > In the subsystem I think it should be a list of i3c_ccc_defslvs that 
> > > holds DEFSLVS information.  
> > 
> > Sorry, I don't get what you mean here. Why would we want a list of
> > i3c_ccc_defslvs objects when i3c_ccc_defslvs already stores an
> > array of devices. I guess you meant a list of struct i3c_ccc_dev_desc
> > objects.  
> 
> I'm using a list with i3c_ccc_dev_desc objects to hold the DEFSLVS. When 
> secondary master to get the bus ownership I initialize those devices and 
> after I clean the list.

Okay, sounds reasonable.

> IMO we should avoid initializing devices when having device drivers 
> trying to talk with the bus.

This initialization has to happen at some point, even if drivers keep
doing transfers on the bus, but I guess we can try delaying that a bit
until all already queued transfers have been issued.

> > > > > > > > +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
> > > > > > > > +    
> > > > > > > 
> > > > > > > What do you think to pass this logic to master.c?
> > > > > > >     
> > > > > > 
> > > > > > Isn't it there?    
> > > > > 
> > > > > I meant make it static and remove its call from device.c.  
> > 
> > Can you be more specific? Where would you move the
> > i3c_master_acquire_bus_ownership() call? Note that we already
> > considered different options and the solution proposed here was the
> > cleanest race-free one.  
> 
> Did you consider to pass it to i3c_dev_do_priv_xfers_locked()?

Yes.

> Can you help me to understand the drawbacks?

Because then this function can't be used from inside the framework,
when the master already owns the bus. For i3c_dev_do_priv_xfers_locked()
that's not a problem, because we shouldn't use it inside master.c, but
that's an issue for IBI related functions
(i3c_dev_{enable,request,free}_ibi_locked()).


> > > > > > > 
> > > > > > > It is not clear to me what you expect with these functions. Do you want 
> > > > > > > to enable MR from all devices? Just some of them? How do you decide which 
> > > > > > > secondary masters are allow earn the bus ownership?
> > > > > > >     
> > > > > > 
> > > > > > We discussed this also. For now, we enable ENEC for all masters on the bus, we
> > > > > > can change it later if needed.     
> > > > > 
> > > > > I would say to expand the current ibi framework to accommodate MR and    
> > > > 
> > > > Can you tell something more here? What benefits you see    
> > > 
> > > Just starting with the name. IBI stands for In Band Interrupt which can 
> > > be MR, HJ or SIR.
> > > 
> > > Also the concept is the same, let say you are registering a SIR w/out 
> > > data but in fact it is a MR.  
> > 
> > No, it's not from a SW PoV. IBI are events I3C device drivers can
> > register a handler for, MR and HJ events are things the HC drivers are
> > expected to handle, and that's a big difference. While re-using the IBI
> > API to handle them should be doable I don't think it will make things
> > simpler.
> >   
> 
> In that case we need to rename the functions with slave interrupt request 
> (SIR) in mind.

I'm fine changing ibi for sir. Can you send a patch doing that?

> 
> > >   
> > > >     
> > > > > also add platform entry to allow secondary masters on the bus.    
> > > > 
> > > > This is something we can consider, to select devices which can request
> > > > mastership. But I don't see the problem adding that later also.    
> > >   
> > 
> > Fully agree with that, that's still something we can consider
> > restricting afterwards. Remember that I3C is still not widely deployed
> > and we only have 2 controller drivers so far, so patching them should be
> > fairly easy if we decide to change the interface.  
> 
> I think is too premature have a secondary master implementation. For now, 
> I would say this is only good for testing purposes.

I don't think that's a problem, as long as we're not afraid of changing
things afterward. Keeping this implementation out-of-tree does not help
either since it forces potential users to apply the patches (or even
worse, re-implement the whole thing if they don't notice people have
already worked on the feature).


> > > > > > > > +/**
> > > > > > > > + * i3c_master_bus_takeover() - register new I3C devices on bus takeover
> > > > > > > > + * @master: master used to send frames on the bus
> > > > > > > > + *
> > > > > > > > + * This function is useful when devices were not added
> > > > > > > > + * during initialization or when new device joined the bus
> > > > > > > > + * which wasn't under our control.
> > > > > > > > + */
> > > > > > > > +void i3c_master_bus_takeover(struct i3c_master_controller *master)
> > > > > > > > +{
> > > > > > > > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	master->want_to_acquire_bus = false;    
> > > > > > > 
> > > > > > > Can you explain the usage of this variable?
> > > > > > >     
> > > > > > 
> > > > > > The idea of this was to let HC know that we want to acquire the bus after
> > > > > > ENEC(MR) received in slave mode.    
> > > > > 
> > > > > With the logic that I proposed you don't need this. When received ENEC 
> > > > > you will try to get the bus ownership if HC not fully initialized or have 
> > > > > DEFSLVS to add, otherwise you don't need to get the bus ownership.    
> > > > 
> > > > In case devices on the bus are the same, I agree. But please consider the case
> > > > when slave joins the bus (Hot-Join) and MR event is disabled for now, our
> > > > secondary master receives DEFSLVS, we add that device to the subsystem but
> > > > cannot request mastership yet. We need a flag to indicate that we should
> > > > request mastership on next ENEC(MR). It doesn't make sense to request
> > > > mastership every time when ENEC(MR) is received.    
> > > 
> > > At least I think you can give a mean for the flag name, otherwise it is 
> > > not clear why sec master want bus ownership.  
> > 
> > Well, I guess the idea was to use the same flag for any kind of
> > deferred MR requests. Not sure the reason for this MR request is really
> > important since the same set of actions will be done anyway. Do you have
> > a use case where we need to know the reason of a MR? If that's the
> > case, or if we want to know it for debug purpose, I'd recommend adding
> > extra flags to express that while keeping the want_to_acquire_bus one.  
> 
> In my case, I don't need such a flag.
> For now, I do MR when having Sec. Master to initialize, DEFSLVS to add or 
> clients wanting transfer data.

Okay.


> > > > > > > >  /**
> > > > > > > > + * i3c_secondary_master_register() - register an secondary I3C master
> > > > > > > > + * @master: master used to send frames on the bus
> > > > > > > > + * @info: master info, describes this device
> > > > > > > > + *
> > > > > > > > + * This function takes care of everything for you:
> > > > > > > > + *
> > > > > > > > + * - updates this master info
> > > > > > > > + * - registers the I2C adapter
> > > > > > > > + * - if possible, populates the bus with devices received by DEFSLVS
> > > > > > > > + *   command
> > > > > > > > + *
> > > > > > > > + * Return: 0 in case of success, a negative error code otherwise.
> > > > > > > > + */
> > > > > > > > +int i3c_secondary_master_register(struct i3c_master_controller *master,
> > > > > > > > +				  struct i3c_device_info *info)
> > > > > > > > +{
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	ret = i3c_master_set_info(master, info, master->secondary);
> > > > > > > > +	if (ret)
> > > > > > > > +		return ret;
> > > > > > > > +
> > > > > > > > +	ret = master->ops->bus_init(master);
> > > > > > > > +	if (ret)
> > > > > > > > +		return ret;    
> > > > > > > 
> > > > > > > At this point you don't have enough information to do the bus 
> > > > > > > initialization.
> > > > > > >     
> > > > > > 
> > > > > > Actually, current ->bus_init() implementations (in CDNS and DW) does not
> > > > > > initialize the bus. We are just setting the mode, configuring some init values
> > > > > > in the registers and enabling the core. Maybe we should rename it?    
> > > > > 
> > > > > The name for me its ok. My point was that when you call 
> > > > > i3c_secondary_master_register() in CDNS you don't have yet DEFSLVS 
> > > > > information.    
> > > > 
> > > > It depends. When current master did not initialize the bus yet, this is true.
> > > > But when master and the bus are already initialized, I have DEFSLVS. Different
> > > > story is that devices aren't added to the subsystem yet. So what I have do in
> > > > that case is to enable to let HC operate and populate the bus later (using    
> > > > ->populate_bus() hook)    
> > > 
> > > Ahh I didn't see, you are calling it in two different places. Does it 
> > > make sense?
> > > 
> > > It is more logical to do the secondary_master_register() after get the 
> > > bus ownership (just need the first time), otherwise the HC is just a 
> > > slave.  
> > 
> > I think we've tried that approach, and I wasn't happy with the end
> > result. Don't remember the exact reason, but it was something related
> > to extra complexity related to init/registration steps in HC drivers.
> > You can look at my previous reviews if you want more details.  
> 
> I tested both cases and doing secondary_master_register() after get the 
> bus ownership I was able to reuse more code.

Fine, then post the code or push it somewhere so we can review it.

> 
> >   
> > > > > > > 
> > > > > > > In generally I found this intrusive for the current eco system.
> > > > > > > 
> > > > > > > I propose the following:
> > > > > > > 1 - Keep the function i3c_master_register() as is and go out before     
> > > > > > 
> > > > > > We had that version previously. We decided to split it.    
> > > > > 
> > > > > You just need to split the secondary master part from it. So you can go 
> > > > > out before i3c_master_bus_init() and keep the same function.    
> > > > 
> > > > We discussed that with Boris and we decided to split this function in this
> > > > version to make things clear.    
> > > 
> > > My proposal isn't to much different with the advantage that it not broke 
> > > the existing code.  
> > 
> > How do we break existing code? Can you please be more specific when you
> > make such statements so we can fix the problems. And no, keeping kernel
> > APIs/interfaces stable has never been our goal. Actually, it's quite the
> > opposite: the I3C subsystem is new, and if we see some of the initial
> > functions/interfaces/hooks do not apply well to some of the new
> > features we want to support, we should fix them, instead of trying to
> > workaround them.  
> 
> I wasn't able to apply the patch directly and I based my comments on the 
> tests that I made.
> During the process I didn't feel the need to work around anything (on 
> current API) to implement secondary master.

Sorry, didn't notice the DW driver was not patched in this series,
which is wrong. I guess that's what you meant when you said it was
breaking existing implems. Przemek, if you send a new version please
make sure to patch the DW driver to take API changes into account. Also
noticed that patch 4 breaks bisectability (users of the API should be
patched along with the API changes).

> 
> The secondary master is probably the most advanced feature in I3C and 
> since beginning I'm complaining that it just fit your use case.

I don't think it fits only 'my use case' since I personally have no
particular use case to support.

> Even now, I don't see clear how to fit slave API in this use case.

Slave API is completely orthogonal. All we need is a way for secondary
slaves to switch between slave and master roles, which I guess is
something HW specific anyway. In any case, secondary masters that want
to expose real features (by real I mean something more than just MR
support, like a GPIO controller, a sensor of whatever feature that can
be implemented by a slave-only device) will still have to register both
a slave and a master controller (we could add a wrapper registering
both, but that's just a detail). Each role will use a different set of
APIs/interfaces.

> In beginning when we started this secondary master topic, I pointed out 
> the i2c multi master approach and you the OTG from USB. So far I don't 
> see neither approach being used and we trying to reinvent the wheel.

Re-using what? You can't re-use the I2C or USB logic, simply because
none of them directly apply to I3C. What I said was that, conceptually,
I3C slave support would be something closer to USB gadgets than I2C
slaves, which has to do with how devices are exposed on the bus. The
concepts of BCR/DCR and PID look similar to the USB class, vendor and
product ID concepts and those are things that will be exposed by I3C
slave blocks so other masters on the bus can know what those slaves are
capable of and the standard interface (if any) they support.

> 
> Anyway I will try to come-up with a RFC based on what you are currently 
> working yet it is only for testing.
> Maybe we can split secondary master feature in phases:
>   - Sec Master initialization
>   - Mastership request
>   - Mastership deliver
>   - Mastership handoff
>   - Mastership takeover 
>   - Register DEFSLVS
>   - Restore SIR request from slaves
>   - Handle I3C device driver clients transfers on sec master side
> 
> It will be easier to follow the patches.

Well, if you can split it like that and keep bisectability intact
(that means each step in the series has to compile and work correctly),
then why not. In any case, please share the code you have so we can
discuss the implementation.

Thanks,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
