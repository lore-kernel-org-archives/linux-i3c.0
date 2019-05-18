Return-Path: <SRS0=BgCw=TS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC44C04AAF
	for <linux-i3c@archiver.kernel.org>; Sat, 18 May 2019 07:34:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F4C2087E
	for <linux-i3c@archiver.kernel.org>; Sat, 18 May 2019 07:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DtN11xG6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F4C2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7JAanEFqQS8LoXk6no5hIbdMtfCQVrm7kN+t+1JaBk=; b=DtN11xG6RRN8Os
	k2XXSlds5xQ0pitxt/O/37u/eCWw9LhKmO6FKjN3l4s9SaEKW6cT0jYU2BhSy4OtoDTgSKvaVgDws
	+8EY3+60XfMUbVUL85wZ5cS1v6ST7Yp8fjGraszXUSAgxy8bcNugbfqFaewXRgYWMHhvEQxdl4Vfo
	zfDGgpxJLxi3GWREya5qfQww2KXVAaKKkDDVeAnN43KUSEZK+rLOugGkjZmbTLSgXwK9ImUCiOyeQ
	W4czAzuFvsDjSutKBrwUtBGU+T9uLMHwY1mO/i5f04wPQACZa0tgCBa74OPLKiCZEZkSX0QAzLIp6
	BdcmntP+cp79zp4vHL8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRtrO-0003Aj-3Y; Sat, 18 May 2019 07:34:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRtrL-00039C-LH
 for linux-i3c@lists.infradead.org; Sat, 18 May 2019 07:34:25 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C8E7280AB5;
 Sat, 18 May 2019 08:34:18 +0100 (BST)
Date: Sat, 18 May 2019 09:34:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v4 4/6] i3c: master: cdns: add support for mastership
 request to Cadence I3C master driver.
Message-ID: <20190518093414.4033dd2b@collabora.com>
In-Reply-To: <20190429103639.GA19777@global.cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-5-pgaj@cadence.com>
 <20190330164409.45e6edfb@collabora.com>
 <20190429103639.GA19777@global.cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190518_003423_956336_9380332A 
X-CRM114-Status: GOOD (  30.54  )
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

On Mon, 29 Apr 2019 11:36:42 +0100
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> Hi Boris,
> 
> I'm sorry for my late response. I hope you remember this thread :-)

Unfortunately not :-/, and it's now my turn to apologize for the late
reply.

> I'm implementing this and have some questions.
> 
> The 03/30/2019 16:44, Boris Brezillon wrote:
> > >  
> > > @@ -1274,9 +1353,32 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
> > >  
> > >  	cdns_i3c_master_enable(master);
> > >  
> > > +	if (m->secondary) {
> > > +		i3c_bus_maintenance_lock(&master->base.bus);
> > > +		cdns_i3c_master_update_devs(&master->base);
> > > +		i3c_bus_maintenance_unlock(&master->base.bus);
> > > +	}  
> > 
> > Okay, I changed my mind on this solution (it's not the first time that
> > happens, and unfortunately won't be the last time either :-)). I think
> > I don't like the idea of exposing the i3c_bus_maintenance_unlock/lock()
> > functions in the end.  
> 
> Ok :-)
> 
> > 
> > I'd like to reconsider what you initially proposed: having an  
> > ->update_devs() hook that is called by the core, except I'd call it
> > ->populate_bus().  
> 
> Ok, we can back to previous approach.
> 
> > 
> > BTW, there's still something that's unclear to me. You seem to populate
> > the bus here and also when acquiring bus ownership. Is this correct?  
> 
> Yes, this is correct. I'm doing this here to register all the devices received
> by DEFSLVS on master initialization time. I'm also populating new devices when
> acquiring the bus because some device could join the bus dynamically and we
> want to register this new devices on our side also.

Hm, I don't get that part. I thought we were supposed to add devices as
soon as we know about them. In case of HJ and assuming your master is
not currently owning the bus, the active master should send you a
DEFSLVS which should serve as a trigger for registering new devs on all
non active masters. Since registering new devices will trigger a
mastership handover to query devs info (PID + other stuff) we should be
all good, right?

> 
> > I'd expect it to be 'partially' populated at bus-init+defslvs time,
> > which would trigger a mastership request if I3C devices are present (as
> > we need to send a GETPID to know more about I3C devs).  
> 
> So, you want to allocate and attach devices and then, when possible get devices
> info and register them? I mean when mastership request is possible. If not,
> just leave devices allocated and register them when ENEC(MR) received, correct?

Kind of, yes. We can probably just have a "want_to_acquire_bus" flag
set, and the partially registered/discovered devices present in the
master list would be registered automatically every time the master
acquires bus ownership. This way we can re-use this logic for any
operation that requires the master to own the bus to do something
specific.

> 
> Previously, I allocated and registered all the devices after successful
> mastership request. Which way is better in your opinion?

That's a solution too, but it feels like a lot of generic code is
open-coded in the driver if we do it this way. I know I'm the one who
suggested this approach, but now that I see the code, I realize I was
wrong (sorry about that).

> 
> >
> > Also, what happens if i3c_master_add_i3c_dev_locked() fails? You
> > don't seem to handle that case at all.  
> 
> For now, I just skipped it silently.

We should at least print an error/warning.

> 
> >   
> > > +
> > > +static void cdns_i3c_master_mastership_takeover(struct cdns_i3c_master *master)
> > > +{
> > > +	if (master->base.init_done) {  
> > 
> > Can this really happen that init_done is not set when you reach this
> > point.  
> 
> Yes, it was possible. Mastership was taken but master wasn't registered yet.
> With new approach I think this won't happen.

One more reason to switch to the new approach.

> 
> >   
> > > +		i3c_bus_maintenance_lock(&master->base.bus);
> > > +		cdns_i3c_master_update_devs(&master->base);
> > > +		i3c_bus_maintenance_unlock(&master->base.bus);
> > > +
> > > +		i3c_master_register_new_devs(&master->base);  
> > 
> > The core will somehow be informed that this master now owns the bus, so
> > it can call i3c_master_register_new_devs() for us, right?  
> 
> I think it can. I'm sure it worked like that before. When HC driver changed
> cur_master, new devices were populated.
> 
> > 
> > But as said above, I'm not even sure this is correct to do it from
> > here. I'd expect this to happen at DEFSLVS or BUS init time.
> >   
> 
> Ok. New(Previous) approach allows that.
> 

Ok, good.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
