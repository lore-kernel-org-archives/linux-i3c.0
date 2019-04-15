Return-Path: <SRS0=HC+M=SR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D1FC10F0E
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 13:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F72120674
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Apr 2019 13:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRYoq/WS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F72120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNDToOGVXR+D0HOuUWhyUAdLn5zF6fhwTGRlt44uEiQ=; b=PRYoq/WSAF6iW7
	A7aaRPAuYMdcu1JOSG+yjAGsNkHpUp1XnPvPool2GTFtnedknSw6YCNnUnew3cLTii0j4E9Zf1kT+
	O6SwzRYp/3e+VLDQB94xc9f01odvzOKyGJHat5iSz9yAXhlrAsybCciaFaGO+vtGykpiAuVmJn6wF
	0fS1GLoDxRebpMnQ39SD36HwC/eAa/YokZhFaxZznwWwG8odKEPXU8DE9z7Sb+szrnftfbCFkkbMw
	paINdUE09myUZsQIFUrXqBYuvwnxR6YvvS8m+/diVai3llQ+nlrtZEJOE1VwULUXve9fV1ufVfZ03
	HmBCUxw2bnu8e2hFponA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG1Lh-00053h-2s; Mon, 15 Apr 2019 13:08:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG1Le-00053G-7H
 for linux-i3c@lists.infradead.org; Mon, 15 Apr 2019 13:08:36 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DE7D6260703;
 Mon, 15 Apr 2019 14:08:29 +0100 (BST)
Date: Mon, 15 Apr 2019 15:08:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190415150826.168fa0c3@collabora.com>
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350A614688@DE02WEMBXB.internal.synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
 <20190409152028.GA8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
 <20190410065339.GB8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6131C9@DE02WEMBXB.internal.synopsys.com>
 <20190410123603.0ef10c19@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A614581@DE02WEMBXB.internal.synopsys.com>
 <20190412165719.0cd91421@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A614688@DE02WEMBXB.internal.synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_060834_528629_B4811938 
X-CRM114-Status: GOOD (  47.48  )
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

Hi Vitor,

On Mon, 15 Apr 2019 12:02:02 +0000
Vitor Soares <vitor.soares@synopsys.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Fri, Apr 12, 
> 2019 at 15:57:19
> 
> > On Fri, 12 Apr 2019 14:28:26 +0000
> > Vitor Soares <vitor.soares@synopsys.com> wrote:
> >   
> > > > > What if the slave is a secondary master? In your opinion what should be 
> > > > > the flow?    
> > > > 
> > > > i3c_slave_regiter(&ctrl->slave);
> > > > i3c_master_regiter(&ctrl->master);
> > > > 
> > > > The order is arbitrary, and those might actually be called from
> > > > different path if it makes more sense. I'm just pointing out that
> > > > registering a slave and registering a master are 2 different things,
> > > > and the master side of the framework should probably not automate slave
> > > > registration, at least not until we have a better idea of what the
> > > > slave API will look like.    
> > > 
> > > We need to understand better your point.
> > > 
> > > The secondary master can have both roles and even not implementing all 
> > > slave function it is a slave when is not a master.
> > > For me still keep the idea:
> > > 
> > >         bus
> > >          / \
> > >        /     \
> > > slave    master
> > > 
> > > and just one role is active at time.
> > > 
> > > I didn't get why the bus shouldn't be instantiated for slave. Can you 
> > > explain?  
> > 
> > Because, from a SW PoV, pure slave devices don't care about the bus
> > concept. Do you have use cases where you'd need to know what bus the
> > slave is connected to?
> >   
> 
> In device model I expect that the slave is under a bus.

Attached to a bus_type, maybe, under an I3C bus object, I'm not
convinced.

> You may not need 
> to know the bus topologies and the devices connect but at least we might 
> need to know the bus is alive.

Yes, AFAICT, the slave status (and potentially the I3C dynamic address)
are the only thing an I3C slave controller driver might need.

> 
> The I2C subsystem implement that and it is working.

But is it needed? That's what I'm questioning here. What would you put
in the bus object if the only thing you know about it is that the slave
controller is present on the bus. Does it make sense to re-use the same
logic/struct for the slave case?
Maybe my feeling about this problem is wrong, but as usual, I don't see
a real use case expressed or a PoC that shows me why you'd need to have
an i3c_bus attached to the slave. So it's hard to say who's right/wrong.
If you come up with an RFC for the slave API we'll have something
concrete to discuss about. Until this happens, I'd like to close this
topic. And of course, I'd appreciate that we keep focusing on the
mastership handover/secondary master case without thinking too much
about how things will be impacted by the slave API.

> 
> I still don't understand your position, is there any other reasons?

My position is: I don't see the point of adding complex concepts to
something that's otherwise way simpler than managing an I3C bus. You can
prove me wrong with a detailed example, or even better, a patch series
adding the slave API plus a reference driver to show how it's supposed
to work :P.

> 
> > AFAICT, all you can do is reply to master requests (probably with some
> > predefined messages, like values stored in a regmap or data queued in
> > a FIFO).  
> 
> We can list it:
>   - RX/TX SDR data
>   - RX/TX HDR data
>   - SIR
>   - HJ
>   - MR (case of sec master)

Yes, but that case falls in the I3C master API.

>   - CCC 
>   - and perhaps timing control.
> 
> >   
> > > 
> > > In any case we will need a common point to switch the roles.  
> > 
> > We'd need a way to relinquish bus ownership, that's all. When the
> > master is not the current master, it automatically becomes a slave, and
> > if it has any "I3C slave" profile registered, it can reply to requests
> > coming from the current master.  
> 
> This is too abstract to me. Can you point a current example? Because for 
> me we need a common layer for both master slave structures.

We need to share a few things (CCC defs and probably other things,
but I don't know which ones yet), yes, but I don't think the i3c_bus
struct is one of them.

I also don't know what the slave API will look like, and that's
actually something someone (you??) should work on before having
advanced discussions about what has to be shared between the
master/slave layers.

> 
> >   
> > > > > > > > > In this way you are able to add DEFSLVS even before the HC has enable MR       
> > > > > > > > events like it is done      
> > > > > > > > > with dt devices.      
> > > > > > > > 
> > > > > > > > I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> > > > > > > > from
> > > > > > > > current master right after ENTDAA. Could you please explain?      
> > > > > > > 
> > > > > > > So the current master receive an hot join and send the DEFSLVS, when do you
> > > > > > > add them to the bus? Will you go for the all process to get all dev info and so on?
> > > > > > >       
> > > > > > 
> > > > > > When current master receives an hot-join, do ENTDAA to enumerate device which
> > > > > > joined the bus and then sends DEFSLVS. This data is stored in secondary master
> > > > > > controller and if secondary master can request mastership, collects all
> > > > > > required informations and adds the devices. It has to collect PID, DEFSLVS does
> > > > > > not provide this information.      
> > > > > 
> > > > > I see now. You need to take care here because when the secondary master 
> > > > > add the i3c_dev it might change the address.
> > > > > This is one of the reasons I would prefer a dedicated function to add the 
> > > > > DEFSLVS.    
> > > > 
> > > > IIRC, Cadence IP is parsing DEFSLVS in HW, and the device table is
> > > > automatically filled based on that. We should only add the DEFSLVS
> > > > parsing helper once we start seeing a need for it (probably when adding
> > > > secondary slave support since you seem to insist on this aspect :-)).    
> > > 
> > > For me the subsystem should hold and handle all this information. Anyway, 
> > > this information is received and needed before the mastership takeover.  
> > 
> > It is, and we already have a bunch of helpers to add new devices. Maybe
> > we need a few more, I'm just saying that forging a DEFSLVS frame to then
> > pass it to the core is not the right solution IMO. 
> > If you need an helper
> > that automatically parses a DEFSLVS frame and add the new devices, then
> > fine, add this helper to the framework and use it in your driver, but
> > don't force other drivers to use this method.  
> 
> This is not based in a need. I can also add the devices one by one.
> If I have everything available why not send it straight away to the 
> subsystem and let it do the management?

This is exactly what I recommend you to do: provide an helper that will
automate that, but don't force other drivers to use this helper. Since
the Cadence driver will not use this helper, it should not be
introduced in this patch series, that's all I said.

> But ok, I understand your point and I can do the helper to parse the 
> DEFSLVS.
> 
> Another question:
>   How do we know what is the main master in case we want to send back the 
> bus mastership?

There's a ->cur_master field in struct i3c_bus. It should be updated
when the bus owner changes. Not sure exactly how other masters can be
informed about that, but those doing the handshake know about the
change, that's for sure.

> 
> >   
> > > Basically I want to avoid to put this type of logistics in HC driver 
> > > layer and call the maintenance_lock.  
> > 
> > And yet, I don't think forging a DEFSLVS frame is the right way to
> > provide the kind of abstraction you're talking about.   
> 
> Can you explain?

I keep explaining you that reconstructing a fake DEFSLVS frame just for
the sake of having all drivers use the helper you want to add is not a
good idea.

To sum-up one last time: adding the
i3c_master_parse_defslvs_and_add_devs() helper is fine, forcing all
drivers to use it is not. Is that clear enough?

> 
> > Note that I said
> > a few things should be provided as helpers in my review.
> >   
> > > 
> > > I'm insisting because it seems that I have a different use case to 
> > > address and I don't see how this fit on it.  
> > 
> > Can you be more specific, because we don't know about your use cases.  
> 
> According to the spec the sec master may have all function of a Main 
> master and may have all function of a slave.

So you're back to the master/slave dual role thing?

> 
> The implementation should made with this in mind and I'm asking 
> flexibility for that. 

What you're asking for is the opposite of flexibility, and most
importantly it's based on assumptions about something that has not been
fully designed yet: the I3C slave API.

So let's have a plan for this discussion to actually lead to something
useful:

1/ propose an RFC for the slave API + a reference driver
2/ think about how dual role devs can implement both interfaces and the
things they need to share

See, we keep discussing #2 while #1 is not even ready yet, and it's
definitely a pre-requisite to #2. So please work #1 first.

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
