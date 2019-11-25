Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C36C432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17BF120740
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZjjmW6eE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17BF120740
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXTxWA8xREIX0AdvCNkc6ZVunaFPHm9eDA8e5OGByV8=; b=ZjjmW6eETRq4eL
	o/DGyZISKSVTYyMtmJqAdH5edarECSQKMGyM/mYb+k7RDDqL3Tz6YII33CJTn6EM39PPZ27OJw2Un
	iYQe9gZcbA9YhJPtRY7T6nlEJZf6cUvq1ykJvXuwsqC8GbOggDjkfnKhbUFZXpnTMwiHF8Q4PQPGM
	+cXHuwscpA+zcL+FxrXabHaHqlpPZZDdHvgdkI5K3nqz+5NYWl+/u3CHHjqe1b5zlTJdBpqCtuYN1
	JCFnQHNRvEO/IA6d4ayOSmi0wMQONib8uKOHyLjgkL4nL9LadHga5l5/Lyy+5N5lUf8lK1iXc/HOg
	eJEIBynNqf+VrpWPYS6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZCdx-0006Ou-Iv; Mon, 25 Nov 2019 11:35:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZCdt-0006ON-LJ
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 11:34:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CD9E328FBE9;
 Mon, 25 Nov 2019 11:34:55 +0000 (GMT)
Date: Mon, 25 Nov 2019 12:34:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191125123452.7c2549dd@collabora.com>
In-Reply-To: <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_033457_964105_1F30B105 
X-CRM114-Status: GOOD (  33.42  )
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

On Mon, 25 Nov 2019 11:19:44 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> > > > > 
> > > > > I based in all version and tried to pass everything to master.c file.  
> > > > 
> > > > I'm not sure what that means, but okay.
> > > >   
> > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > driver want to access to the bus but I believe we can discuss that after.  
> > > > 
> > > > That's kind of a basic feature when talking about mastership handover,
> > > > but sure, we can discuss it after your RFC has been posted.  
> > > 
> > > I need to test if the time that device.c request the mastership and the 
> > > controller has effectively the ownership of the bus is short enough to 
> > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > housekeeping of bus takeover.
> > >   
> > > > 
> > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > away all of the work done by Przemek, especially since Przemek was the
> > > > first one to post a patchset and he never really said he didn't
> > > > want or didn't have time to continue working on this task (not even
> > > > mentioning the time I spent reviewing those patches...).
> > > > 
> > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > but be aware that it's not how we usually do: the person that posts a
> > > > patchset first leads the thing (of course, it's even better if there's
> > > > some kind of coordination before the patch is posted).  
> > > 
> > > Honestly it looks like I'm competing on this which is not the case.
> > > I just pointed out my concerns about this adoption because I see several 
> > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > master code and integrate in your solution.
> > >   
> > 
> > Can you point me to the version of the patch your changes are based on?
> > And also, can you tell me what issues you faced? I would like to check
> > if they are already adressed in my code.  
> 
> I used v3 and v4. From v5, I found useful the switch case (request, 
> deliver, handoff, takeover) in hc side.
> 
> I didn't hardly test how device.c request mastership but I suspect it 
> won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> not be the master yet.

I'm pretty sure we solved that already (that's what
i3c_master_acquire_bus_ownership() calls are supposed to take care of).
Can you be a bit more specific? What makes you think the master might
not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
called?

> 
> >   
> > > As I said previous for I3C spec 1.1 secondary master received a big 
> > > improvement due the misunderstanding published in 1.0 spec. I don't know 
> > > any other protocol that implement such kind of feature and for this is 
> > > from far the most complex feature to implement in SO based systems from 
> > > i3c spec.
> > >   
> > > > 
> > > > BTW, you mentioned working on a lot of different topics, but most of
> > > > them were left unfinished (userspace i3cdev interface, I3C slave
> > > > framework/API, ...).  
> > > 
> > > The i3cdev does what we discuss during the proposal of i3c subsystem and 
> > > only expose i3c device without device driver yet I'm not happy with 
> > > transfer struct.
> > > For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> > > need of a tool for ccc (but for testing purposes it would help a lot).
> > >   
> > > > Any plans to post RFCs on those aspects anytime
> > > > soon? I mean, there's plenty of topics to work on, and I'd really prefer
> > > > that each developer work on a different topic instead of duplicating the
> > > > effort...
> > > > 
> > > > Regards,
> > > > 
> > > > Boris  
> > > 
> > > Best regards,
> > > Vitor Soares
> > > 
> > >   
> > 
> > -- 
> > -- 
> > Regards,
> > Przemyslaw Gaj  
> 
> Again sorry for the delay. I will try to send this soon.

Can you please share what you have now (even if it's not finished) so
Przemek can start looking at it?

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
