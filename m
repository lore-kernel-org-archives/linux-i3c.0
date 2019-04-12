Return-Path: <SRS0=TOMy=SO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE8C10F0E
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Apr 2019 14:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5665B2083E
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Apr 2019 14:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BTdPvZhm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5665B2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpGhdySQuZ5iVE4z41Jn9flk9VdxtEebTf8Fq/5MuZs=; b=BTdPvZhmSQgTXE
	ffabXVY6lpUUSL8AlHwcqankpo8+QpcDJI19Tbq86owsYa4ydKXCNRdCZsq4ROoK89GqRq+/v2rHW
	PoqOhYCmSmu8LVZwt4E0MITt4mKHyliJYe80mZTgcBvMRqb/QMnXBC9/RNcc/TrbDPK23N8m3QmBc
	C7ArvpmTci9xoMAahgVd70re2rAwAsm5YLa7RumK6y6KziGSP04hMucrORlwOic1JAxK7ROkTLRqH
	2ZBs4M3RyAYCSpEOw4e+kPmYrbEMfbqqLjoNwcpjF1W5CkjE+WlAnaWoQOUehxcpX1aoiC5j+niq1
	JzFMYxAR5YM4rLexuAuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExcO-0006kZ-Sh; Fri, 12 Apr 2019 14:57:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExcL-0006kC-B9
 for linux-i3c@lists.infradead.org; Fri, 12 Apr 2019 14:57:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C950B260A21;
 Fri, 12 Apr 2019 15:57:22 +0100 (BST)
Date: Fri, 12 Apr 2019 16:57:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190412165719.0cd91421@collabora.com>
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350A614581@DE02WEMBXB.internal.synopsys.com>
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
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_075725_645653_B31AB385 
X-CRM114-Status: GOOD (  30.87  )
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

On Fri, 12 Apr 2019 14:28:26 +0000
Vitor Soares <vitor.soares@synopsys.com> wrote:

> > > What if the slave is a secondary master? In your opinion what should be 
> > > the flow?  
> > 
> > i3c_slave_regiter(&ctrl->slave);
> > i3c_master_regiter(&ctrl->master);
> > 
> > The order is arbitrary, and those might actually be called from
> > different path if it makes more sense. I'm just pointing out that
> > registering a slave and registering a master are 2 different things,
> > and the master side of the framework should probably not automate slave
> > registration, at least not until we have a better idea of what the
> > slave API will look like.  
> 
> We need to understand better your point.
> 
> The secondary master can have both roles and even not implementing all 
> slave function it is a slave when is not a master.
> For me still keep the idea:
> 
>         bus
>          / \
>        /     \
> slave    master
> 
> and just one role is active at time.
> 
> I didn't get why the bus shouldn't be instantiated for slave. Can you 
> explain?

Because, from a SW PoV, pure slave devices don't care about the bus
concept. Do you have use cases where you'd need to know what bus the
slave is connected to?

AFAICT, all you can do is reply to master requests (probably with some
predefined messages, like values stored in a regmap or data queued in
a FIFO).

> 
> In any case we will need a common point to switch the roles.

We'd need a way to relinquish bus ownership, that's all. When the
master is not the current master, it automatically becomes a slave, and
if it has any "I3C slave" profile registered, it can reply to requests
coming from the current master.

> > > > > > > In this way you are able to add DEFSLVS even before the HC has enable MR     
> > > > > > events like it is done    
> > > > > > > with dt devices.    
> > > > > > 
> > > > > > I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> > > > > > from
> > > > > > current master right after ENTDAA. Could you please explain?    
> > > > > 
> > > > > So the current master receive an hot join and send the DEFSLVS, when do you
> > > > > add them to the bus? Will you go for the all process to get all dev info and so on?
> > > > >     
> > > > 
> > > > When current master receives an hot-join, do ENTDAA to enumerate device which
> > > > joined the bus and then sends DEFSLVS. This data is stored in secondary master
> > > > controller and if secondary master can request mastership, collects all
> > > > required informations and adds the devices. It has to collect PID, DEFSLVS does
> > > > not provide this information.    
> > > 
> > > I see now. You need to take care here because when the secondary master 
> > > add the i3c_dev it might change the address.
> > > This is one of the reasons I would prefer a dedicated function to add the 
> > > DEFSLVS.  
> > 
> > IIRC, Cadence IP is parsing DEFSLVS in HW, and the device table is
> > automatically filled based on that. We should only add the DEFSLVS
> > parsing helper once we start seeing a need for it (probably when adding
> > secondary slave support since you seem to insist on this aspect :-)).  
> 
> For me the subsystem should hold and handle all this information. Anyway, 
> this information is received and needed before the mastership takeover.

It is, and we already have a bunch of helpers to add new devices. Maybe
we need a few more, I'm just saying that forging a DEFSLVS frame to then
pass it to the core is not the right solution IMO. If you need an helper
that automatically parses a DEFSLVS frame and add the new devices, then
fine, add this helper to the framework and use it in your driver, but
don't force other drivers to use this method.

> Basically I want to avoid to put this type of logistics in HC driver 
> layer and call the maintenance_lock.

And yet, I don't think forging a DEFSLVS frame is the right way to
provide the kind of abstraction you're talking about. Note that I said
a few things should be provided as helpers in my review.

> 
> I'm insisting because it seems that I have a different use case to 
> address and I don't see how this fit on it.

Can you be more specific, because we don't know about your use cases.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
