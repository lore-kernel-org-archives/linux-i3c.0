Return-Path: <SRS0=2ljA=X5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48A1ECE58E
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2019 20:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD87222C4
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2019 20:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fobQmR93"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD87222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzy9fJoVRwa2ZEiXCX5vXUtdwEZ/o2PtdM8kV6AVFsA=; b=fobQmR939rjBGk
	GGYFsK+RreyOzHgupX5To5hxa/QgEbpFhlMgJ0uKgT8p2xFr6rcSChg86vW/yhIT1Myz7zipdOvcC
	DkSv6SEa8itTM2znHubhRISqFFAa1hgWQy8ouHogpx9sI+FC7Qm18L28f7oH6u1rbNRDD58HJhWrY
	5wryV48BDOwNdL944RgfAQBAKoeTPscvuQzPz0ICxOqbq7IajIYrcQpRBslXarz3IwTIsehu+1cFm
	wp/zN62LO3E5YVnKm6cZ9ta4Sa8G4oSPjyxl5mt2WILVujF8sblRhKKo8rVHyZsMJ0UyHGKcjbseM
	yqsYGcez7YYvnt8Nx6Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGUFS-0002Zc-Es; Fri, 04 Oct 2019 20:32:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG5x2-000544-67
 for linux-i3c@lists.infradead.org; Thu, 03 Oct 2019 18:35:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id DD9C028ECEA
Date: Thu, 3 Oct 2019 20:35:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 2/5] i3c: master: make sure ->boardinfo is
 initialized in add_i3c_dev_locked()
Message-ID: <20191003203536.218a3cd8@collabora.com>
In-Reply-To: <CH2PR12MB42162C4459E31D85FD60FB79AE9F0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
 <ed18fd927b5759a6a1edb351113ceca615283189.1567608245.git.vitor.soares@synopsys.com>
 <20191003162943.4a0d0274@collabora.com>
 <CH2PR12MB42162C4459E31D85FD60FB79AE9F0@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_113544_489339_49C8F47D 
X-CRM114-Status: GOOD (  33.35  )
X-Mailman-Approved-At: Fri, 04 Oct 2019 13:32:20 -0700
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "pgaj@cadence.com" <pgaj@cadence.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 3 Oct 2019 17:37:40 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi Boris,
> 
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Thu, Oct 03, 2019 at 15:29:43
> 
> > On Thu,  5 Sep 2019 12:00:35 +0200
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >   
> > > The newdev->boardinfo assignment was missing in
> > > i3c_master_add_i3c_dev_locked() and hence the ->of_node info isn't
> > > propagated to i3c_dev_desc.
> > > 
> > > Fix this by trying to initialize device i3c_dev_boardinfo if available.
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > ---
> > > Change in v3:
> > >   - None
> > > 
> > > Changes in v2:
> > >   - Change commit message
> > >   - Change i3c_master_search_i3c_boardinfo(newdev) to
> > >   i3c_master_init_i3c_dev_boardinfo(newdev)
> > >   - Add fixes, stable tags
> > > 
> > >  /**
> > >   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> > >   * @master: master used to send frames on the bus
> > > @@ -1818,8 +1834,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > >  				  u8 addr)
> > >  {
> > >  	struct i3c_device_info info = { .dyn_addr = addr };
> > > -	struct i3c_dev_desc *newdev, *olddev;
> > >  	u8 old_dyn_addr = addr, expected_dyn_addr;
> > > +	enum i3c_addr_slot_status addrstatus;
> > > +	struct i3c_dev_desc *newdev, *olddev;
> > >  	struct i3c_ibi_setup ibireq = { };
> > >  	bool enable_ibi = false;
> > >  	int ret;
> > > @@ -1878,6 +1895,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > >  	if (ret)
> > >  		goto err_detach_dev;
> > >  
> > > +	i3c_master_init_i3c_dev_boardinfo(newdev);
> > > +
> > >  	/*
> > >  	 * Depending on our previous state, the expected dynamic address might
> > >  	 * differ:
> > > @@ -1895,7 +1914,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> > >  	else
> > >  		expected_dyn_addr = newdev->info.dyn_addr;
> > >  
> > > -	if (newdev->info.dyn_addr != expected_dyn_addr) {
> > > +	addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
> > > +						  expected_dyn_addr);
> > > +
> > > +	if (newdev->info.dyn_addr != expected_dyn_addr &&
> > > +	    addrstatus == I3C_ADDR_SLOT_FREE) {  
> > 
> > First, this change shouldn't be part of this patch, since the commit
> > message only mentions the boardinfo init stuff,  
> 
> This is not an issue, I can create a patch just for boardinfo init fix.
> 
> > not the extra 'is slot
> > free check'.  
> 
> Even ignoring patch 1, it is necessary to check if the slot is free 
> because if SETDASA fails the boardinfo->init_dyn_addr can be assigned to 
> another device. That's why we need to check if expected_dyn_addr is free.

Correct. I thought we were already pre-reserving the init_addr (as
described here [1]), but it looks like the code is buggy. That's
probably something we should fix  (we should reserve ->init_i3c_addr
here [2], not ->dyn_addr).

> 
> > Plus, I want the fix to be backported so we should avoid
> > any unneeded deps.
> > 
> > But even with those 2 things addressed, I'm still convinced the
> > 'free desc when device is not reachable' change you do in patch 1 is
> > not that great,   
> 
> If I'm doing wrong I really appreciate you tell me the reason.

I just think it's easier to keep track of things (like reserved
addresses) if the descriptor stays around even if the device is not yet
accessible.

> 
> > and the fact that you can't pre-reserve the address to
> > make sure no one uses it until the device had a chance to show up tends
> > to prove me right.  
> 
> This is a different corner case and I though we agreed that the framework 
> doesn't provide guarantees to assign boardinfo->init_dyn_addr [1].

Well, it doesn't, but we should try hard to not use addresses that
have been requested by a device.

> 
> Yet, I don't disagree with the idea of pre-reserve the 
> boardinfo->init_dyn_addr.
> I can do this but we need to align how it should be done.

Keep the device around even if SETDASA fails and make sure the
->init_dyn_addr is reserved. It's how it was supposed to work, there's
just a bug in the logic.

> 
> > 
> > Can we please do what I suggest and solve the "not enough dev slots"
> > problem later on (if we really have to).  
> 
> I have this use case where the HC has only 4 slot for 4 devices. 
> Sometimes the one or more devices can be sleeping and when they trigger 
> HJ there is no space in HC.

Let's address that separately please. I want to solve one problem at a
time.

[1]https://elixir.bootlin.com/linux/latest/source/drivers/i3c/master.c#L1330
[2]https://elixir.bootlin.com/linux/latest/source/drivers/i3c/master.c#L1307

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
