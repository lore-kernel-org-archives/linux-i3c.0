Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452D8C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 14:50:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1348420715
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 14:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qnk6qsJT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1348420715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcVoZvJgb6TF6Ask6Q/02Jxges/K/NRAgoVFP3OVUL0=; b=Qnk6qsJT9UQKqQ
	NCn71f1eM8TZt3SBV8MFdT5u8WLCtCUSL+fUkLwDDw2Unqx5hnc00GgkOcwO89F/E6KYDDT6KiRfB
	LPcq8SON15Oq57eZi7uuQAelR+jm5LQn0KYeK0I6KTmK7LhjenBrWfG3egZbzCNQSxqEKQTcjcyhY
	CYgYEQRN89IVLd1Yg5IgJ+XoaZSvyM2pDYXdLmvsyjkmXlEBf/PlFU23k9RGhsI+InCJl7cEM85p6
	FT31cQFom8+Vsm4sbW9dS+UWNCTBatwnNIaTBOhlVBqtEX64LD/JXCxLCo/iC3m44IINB60SCqvbP
	pu919ssP73XmpLs5gE0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVGRz-0004C1-N7; Thu, 14 Nov 2019 14:50:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVGRs-0002pi-E1
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 14:50:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C81812918CC;
 Thu, 14 Nov 2019 14:50:11 +0000 (GMT)
Date: Thu, 14 Nov 2019 15:50:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191114155008.6551459c@collabora.com>
In-Reply-To: <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_065016_967144_45ED6812 
X-CRM114-Status: GOOD (  32.11  )
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

On Thu, 14 Nov 2019 14:17:38 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Thu, Nov 14, 2019 at 12:32:14
> 
> > Hi Vitor,
> > 
> > On Thu, 14 Nov 2019 11:56:00 +0000
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >   
> > > Hi,
> > > 
> > > From: Przemyslaw Gaj <pgaj@cadence.com>
> > > Date: Thu, Nov 14, 2019 at 06:10:12
> > >   
> > > > Hi Vitor,
> > > > 
> > > > The 11/12/2019 08:41, Boris Brezillon wrote:    
> > > > > 
> > > > > Hi Vitor,
> > > > > 
> > > > > On Mon, 11 Nov 2019 12:30:45 +0000
> > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > >     
> > > > > > Hi Boris and Przemek,
> > > > > > 
> > > > > > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > > > > > to address during the takeover of the bus.    
> > > > > 
> > > > > Okay. Would you mind sharing a branch with this material so Przemek and
> > > > > I can have a look at it?    
> > > > 
> > > > So, Vitor, can you share your changes? Can you tell me what you had to
> > > > change to make it work? Also, which patch version is this based on?    
> > > 
> > > I'm closing a task and after that I will prepare the RFC.  
> > 
> > Okay, can we have an estimate? Are we talking about days or weeks?  
> 
> I will prioritize it for next week.

Great!

> 
> >   
> > > 
> > > I based in all version and tried to pass everything to master.c file.  
> > 
> > I'm not sure what that means, but okay.
> >   
> > > Right now my challenge it to trigger mastership request when a device 
> > > driver want to access to the bus but I believe we can discuss that after.  
> > 
> > That's kind of a basic feature when talking about mastership handover,
> > but sure, we can discuss it after your RFC has been posted.  
> 
> I need to test if the time that device.c request the mastership and the 
> controller has effectively the ownership of the bus is short enough to 
> call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> housekeeping of bus takeover.

We sorted that out in Przemek series already. Please base your work on
what Przemek did (or at least look at it carefully), otherwise we're
going to re-do/re-review the same things we did a few months back.

> 
> > 
> > Note that I'm not super happy to have to go back to square 1 and throw
> > away all of the work done by Przemek, especially since Przemek was the
> > first one to post a patchset and he never really said he didn't
> > want or didn't have time to continue working on this task (not even
> > mentioning the time I spent reviewing those patches...).
> > 
> > If Przemek is fine with this situation I'm okay making an exception,
> > but be aware that it's not how we usually do: the person that posts a
> > patchset first leads the thing (of course, it's even better if there's
> > some kind of coordination before the patch is posted).  
> 
> Honestly it looks like I'm competing on this which is not the case.
> I just pointed out my concerns about this adoption because I see several 
> issues on it.

Couldn't these problems/limitations be addressed in the existing
implementation instead of re-implementing everything?

> The point is, at the end you can pick some parts of my sec 
> master code and integrate in your solution.

I wish you had tried to modify what Przemek started instead of starting
from scratch... Now someone will have to do the integration, but let's
move on. Please post an RFC (or a public branch) as soon as possible,
even if it's incomplete. It can even be something that doesn't compile.
The idea being to check what's missing/wrong in Przemek implementation
and see how we can merge the two.

> 
> As I said previous for I3C spec 1.1 secondary master received a big 
> improvement due the misunderstanding published in 1.0 spec.

Okay, I can't tell. Version 1.0 was already pretty clear to me with
regard to mastership handover.

> I don't know 
> any other protocol that implement such kind of feature and for this is 
> from far the most complex feature to implement in SO based systems from 
> i3c spec.

That's where the fun is, isn't it? :P

> 
> > 
> > BTW, you mentioned working on a lot of different topics, but most of
> > them were left unfinished (userspace i3cdev interface, I3C slave
> > framework/API, ...).  
> 
> The i3cdev does what we discuss during the proposal of i3c subsystem and 
> only expose i3c device without device driver yet I'm not happy with 
> transfer struct.
> For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> need of a tool for ccc (but for testing purposes it would help a lot).

What about the I3C slave controller API/framework? Would be interesting
to have someone work on that topic, and you seemed to be worried about
how it would interact with masters that expose a real slave profile, so
looking at it would be a good starting point IMHO.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
