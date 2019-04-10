Return-Path: <SRS0=MhNy=SM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEAFC10F11
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 10:36:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC9620830
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 10:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfT5A4XI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC9620830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPSvVbsSj//uqFbOHOe9beQzoEez4ZB57tfxrUa6RpI=; b=kfT5A4XIe8vBCT
	4hyKTbWIQdOZ404YsS5MpcS6Nd9Z7ckNPyS5aJU4lsNmHuPvniCuaTA59FRBAz439p0CCjckumLlO
	Fl/3EP2kW5GOngMAb0lVh92ohy2MFQiv4MdQfn903x6VHiLhGtm1xBaMX7VZzRq8WWjtvnVQXrcOb
	vAW5QQF06RDA8/C1iJ/s8lBm7jzKq1Mji3SYKbTILUS9yFlrksu7hxWuqaxl6ENZohE5K12mwnmFd
	AN78ssxgD+GsGA0/hIBHTIF8LuiitT0jjUmIlbZZfDU5apnSDTe2YCs05G2zqnbKouRFi8IB9fkT1
	KSqQkQHp8S/oMnxk3Yiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEAaT-0002oI-TV; Wed, 10 Apr 2019 10:36:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEAaQ-0002nq-1N
 for linux-i3c@lists.infradead.org; Wed, 10 Apr 2019 10:36:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C40A0260667;
 Wed, 10 Apr 2019 11:36:06 +0100 (BST)
Date: Wed, 10 Apr 2019 12:36:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190410123603.0ef10c19@collabora.com>
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350A6131C9@DE02WEMBXB.internal.synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
 <20190409152028.GA8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
 <20190410065339.GB8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6131C9@DE02WEMBXB.internal.synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_033610_360161_B64F7FE3 
X-CRM114-Status: GOOD (  32.04  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "agolec@cadence.com" <agolec@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 10 Apr 2019 10:05:33 +0000
Vitor Soares <vitor.soares@synopsys.com> wrote:


> > > > >   
> > > > > > > @@ -2504,9 +2745,11 @@ int i3c_master_register(struct   
> > > > i3c_master_controller   
> > > > > > *master,  
> > > > > > >  	 * register I3C devices dicovered during the initial DAA.
> > > > > > >  	 */
> > > > > > >  	master->init_done = true;
> > > > > > > -	i3c_bus_normaluse_lock(&master->bus);
> > > > > > > -	i3c_master_register_new_i3c_devs(master);
> > > > > > > -	i3c_bus_normaluse_unlock(&master->bus);
> > > > > > > +	i3c_master_register_new_devs(master);
> > > > > > > +
> > > > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > > > +	i3c_master_enable_mr_events(master);  
> > > > > 
> > > > > Why are you enabling MR events here? As a standard function this might case   
> > > > issues  
> > > > > because the master can support ENEC/DISEC commands but not multi-master   
> > > > typologies.
> > > > 
> > > > I enable it at the end of master registration to be sure that current master 
> > > > is
> > > > ready for bus mastership relinquish. If controller does not support secondary
> > > > master role it can just do nothing with it.  
> > > 
> > > I think it isn't good idea to have this here because you are forcing HC driver to
> > > verify it. If it is to be done in subsystem side probably it is better to have a
> > > master/slave functionalities structure.  
> > 
> > If multi-master topology is not supported, request_mastership() hook won't be
> > implemented and also you will not implement enable/disable_mr_events() hooks.
> > You don't have to verify it in the driver.  
> 
> In that case we will need a driver for each role/set of available 
> features and duplicate the code otherwise this need to be checked in HC 
> side.

Not really, just 2 set of ops, one with the hooks set and another one
with the hooks left unassigned (NULL). But I guess we can also add
a caps field where we'd list i3c master caps (secondary master,
supports MR, ...).

> 
> >   
> > >   
> > > >   
> > > > >   
> > > > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > > >  
> > > > > > >  	return 0;
> > > > > > >  
> > > > > > > @@ -2524,6 +2767,30 @@ int i3c_master_register(struct   
> > > > i3c_master_controller   
> > > > > > *master,  
> > > > > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > > > >    
> > > > > 
> > > > > I'm thinking if isn't better to instantiate the bus apart and them register   
> > > > the secondary master.
> > > > 
> > > > It looked like that before but we decided to register everything or nothing.  
> > > 
> > > I see your point, but for the future, slave implementation, we can have a
> > > function to instantiate just the bus and another for master or slave.
> > >   
> > 
> > We can go the same way with slave, and register bus and slave at once. If this
> > is the case.  

The slave framework isn't there yet, and I don't think we should expose
the bus concept to slave drivers anyway. If a master can act both as a
slave (I mean a slave that can do more than just send MR requests)  and
a master (secondary), the driver should register to both framework.

> 
> What if the slave is a secondary master? In your opinion what should be 
> the flow?

i3c_slave_regiter(&ctrl->slave);
i3c_master_regiter(&ctrl->master);

The order is arbitrary, and those might actually be called from
different path if it makes more sense. I'm just pointing out that
registering a slave and registering a master are 2 different things,
and the master side of the framework should probably not automate slave
registration, at least not until we have a better idea of what the
slave API will look like.

> 
> >   
> > > >   
> > > > > In this way you are able to add DEFSLVS even before the HC has enable MR   
> > > > events like it is done  
> > > > > with dt devices.  
> > > > 
> > > > I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> > > > from
> > > > current master right after ENTDAA. Could you please explain?  
> > > 
> > > So the current master receive an hot join and send the DEFSLVS, when do you
> > > add them to the bus? Will you go for the all process to get all dev info and so on?
> > >   
> > 
> > When current master receives an hot-join, do ENTDAA to enumerate device which
> > joined the bus and then sends DEFSLVS. This data is stored in secondary master
> > controller and if secondary master can request mastership, collects all
> > required informations and adds the devices. It has to collect PID, DEFSLVS does
> > not provide this information.  
> 
> I see now. You need to take care here because when the secondary master 
> add the i3c_dev it might change the address.
> This is one of the reasons I would prefer a dedicated function to add the 
> DEFSLVS.

IIRC, Cadence IP is parsing DEFSLVS in HW, and the device table is
automatically filled based on that. We should only add the DEFSLVS
parsing helper once we start seeing a need for it (probably when adding
secondary slave support since you seem to insist on this aspect :-)).

> 
> Another point is what happen if the current master received MR request 
> during this registration?

You mean when registering the primary I3C master? The driver should
take care of disabling MR interrupts and if possible reject all
incoming MR. MR should only be re-enabled when ->enable_mr_events() is
called by the core.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
