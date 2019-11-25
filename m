Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076E9C43215
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D6D2082F
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K2riLjjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D6D2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/jliHw3f7KpVo+dzRvHyMominfja29VmNk7qvENDhM=; b=K2riLjjHUQHs5c
	BZJheEG7sbEoootHfTuCnrzQWSlmPCe1EgVtTXQs4uLLkfeFBJR1nFtyo+ZUJ70NS7Ix6It5AuJzs
	2fWLNb2B8Z2Qh6XT7Q/uCGgPhZ91cdiWsxfgN6aB5UndAQssZhkR0iyhJGOrw8RUU815X6MQdd8UQ
	iP/ott0JEYm7ExkTINKOy/cYZImfzyXDi/9ScvJ4Psk+o+Y6ju+M4OcULEz0kmoxYpDf5YHrBfILr
	f1HRLxs0dUSPhhl/aUtsoz3qTu0Q8xR2tmnmu5Mxdn+u38j9+pIrxnIsBbW3MKpeJziWFY32zojfr
	tv36E6dFK+KFva+deM9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZDNr-0006py-Da; Mon, 25 Nov 2019 12:22:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDNp-0006pN-1c
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 12:22:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E6C9128FC86;
 Mon, 25 Nov 2019 12:22:21 +0000 (GMT)
Date: Mon, 25 Nov 2019 13:22:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191125132219.2e45d084@collabora.com>
In-Reply-To: <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
 <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_042225_355040_7E65CB24 
X-CRM114-Status: GOOD (  32.93  )
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
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 25 Nov 2019 12:03:42 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> From: Przemyslaw Gaj <pgaj@cadence.com>
> Date: Mon, Nov 25, 2019 at 11:55:16
> 
> > The 11/25/2019 11:42, Vitor Soares wrote:  
> > > 
> > > Hi Boris,
> > > 
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > Date: Mon, Nov 25, 2019 at 11:34:52
> > >   
> > > > On Mon, 25 Nov 2019 11:19:44 +0000
> > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > >   
> > > > > > > > > 
> > > > > > > > > I based in all version and tried to pass everything to master.c file.    
> > > > > > > > 
> > > > > > > > I'm not sure what that means, but okay.
> > > > > > > >     
> > > > > > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > > > > > driver want to access to the bus but I believe we can discuss that after.    
> > > > > > > > 
> > > > > > > > That's kind of a basic feature when talking about mastership handover,
> > > > > > > > but sure, we can discuss it after your RFC has been posted.    
> > > > > > > 
> > > > > > > I need to test if the time that device.c request the mastership and the 
> > > > > > > controller has effectively the ownership of the bus is short enough to 
> > > > > > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > > > > > housekeeping of bus takeover.
> > > > > > >     
> > > > > > > > 
> > > > > > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > > > > > away all of the work done by Przemek, especially since Przemek was the
> > > > > > > > first one to post a patchset and he never really said he didn't
> > > > > > > > want or didn't have time to continue working on this task (not even
> > > > > > > > mentioning the time I spent reviewing those patches...).
> > > > > > > > 
> > > > > > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > > > > > but be aware that it's not how we usually do: the person that posts a
> > > > > > > > patchset first leads the thing (of course, it's even better if there's
> > > > > > > > some kind of coordination before the patch is posted).    
> > > > > > > 
> > > > > > > Honestly it looks like I'm competing on this which is not the case.
> > > > > > > I just pointed out my concerns about this adoption because I see several 
> > > > > > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > > > > > master code and integrate in your solution.
> > > > > > >     
> > > > > > 
> > > > > > Can you point me to the version of the patch your changes are based on?
> > > > > > And also, can you tell me what issues you faced? I would like to check
> > > > > > if they are already adressed in my code.    
> > > > > 
> > > > > I used v3 and v4. From v5, I found useful the switch case (request, 
> > > > > deliver, handoff, takeover) in hc side.
> > > > > 
> > > > > I didn't hardly test how device.c request mastership but I suspect it 
> > > > > won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> > > > > not be the master yet.  
> > > > 
> > > > I'm pretty sure we solved that already (that's what
> > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > Can you be a bit more specific? What makes you think the master might
> > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > called?  
> > > 
> > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > secondary master already owns the bus. Main master can ack the MR request 
> > > and not send the CETACCMST immediately.
> > >  
> > 
> > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > status and after I exit from ->request_mastership(), I'm the bus owner.
> > If not, error exit code is returned and we can't make the transfers.
> > Are you able to implement the same behavior?  
> 
> You can assume everyone will do in that way. What happen if you receive a 
> request or an information from current master?

We have this ->request_mastership() method so controllers that have
this logic (MR+wait(GETACCMST) automated can still interface with the
subsystem. If your controller handles the MR/GETACCMST separately, it
shouldn't be hard to implement, and we can even provide an helper if
people end up duplicating the code.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
