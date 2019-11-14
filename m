Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080BFC432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 12:32:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD762070E
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 12:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbYKdUgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD762070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX8TfmBVC5YPXGhPnMwBPePDK4VuxF7yOoWQ5aSxfsg=; b=hbYKdUgZxrbzj9
	jvC1spCh3BGBPJ2as2fNH9RBd/qDROJ3pW8os7oEA5E2B8DNuDEWHNjUpc3sx1ZwYZWSl/q0+qtvk
	RuI8fCHGw2Tp0uYimfrQFQomvY0jY3DnuM9VuBqCywn+DdmYjPhBEpZvzoo6DK5fcx6bPjRSPWzTV
	Gwk21sWZ26CBYIon/h3Uz8Pa7Trf7Zjts7YvvP2zXVNyjVfsPsgBE4SEEXCIYjYNlk5sdr5GHfEQd
	g5L1eGGsIt58WaJVjTJB9fQS9ckx/VffS4iCl2MVoyRsZCiruF19h6VvKPeP3KBljttqKtPXoq/N2
	conw3fUdMWIEgbWD/QQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVEIS-0002mN-Do; Thu, 14 Nov 2019 12:32:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVEIP-0002lh-Gn
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 12:32:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5B79A291728;
 Thu, 14 Nov 2019 12:32:17 +0000 (GMT)
Date: Thu, 14 Nov 2019 13:32:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191114133214.0b6ecc0a@collabora.com>
In-Reply-To: <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_043221_686062_27385911 
X-CRM114-Status: GOOD (  20.48  )
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

Hi Vitor,

On Thu, 14 Nov 2019 11:56:00 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi,
> 
> From: Przemyslaw Gaj <pgaj@cadence.com>
> Date: Thu, Nov 14, 2019 at 06:10:12
> 
> > Hi Vitor,
> > 
> > The 11/12/2019 08:41, Boris Brezillon wrote:  
> > > 
> > > Hi Vitor,
> > > 
> > > On Mon, 11 Nov 2019 12:30:45 +0000
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >   
> > > > Hi Boris and Przemek,
> > > > 
> > > > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > > > to address during the takeover of the bus.  
> > > 
> > > Okay. Would you mind sharing a branch with this material so Przemek and
> > > I can have a look at it?  
> > 
> > So, Vitor, can you share your changes? Can you tell me what you had to
> > change to make it work? Also, which patch version is this based on?  
> 
> I'm closing a task and after that I will prepare the RFC.

Okay, can we have an estimate? Are we talking about days or weeks?

> 
> I based in all version and tried to pass everything to master.c file.

I'm not sure what that means, but okay.

> Right now my challenge it to trigger mastership request when a device 
> driver want to access to the bus but I believe we can discuss that after.

That's kind of a basic feature when talking about mastership handover,
but sure, we can discuss it after your RFC has been posted.

Note that I'm not super happy to have to go back to square 1 and throw
away all of the work done by Przemek, especially since Przemek was the
first one to post a patchset and he never really said he didn't
want or didn't have time to continue working on this task (not even
mentioning the time I spent reviewing those patches...).

If Przemek is fine with this situation I'm okay making an exception,
but be aware that it's not how we usually do: the person that posts a
patchset first leads the thing (of course, it's even better if there's
some kind of coordination before the patch is posted).

BTW, you mentioned working on a lot of different topics, but most of
them were left unfinished (userspace i3cdev interface, I3C slave
framework/API, ...). Any plans to post RFCs on those aspects anytime
soon? I mean, there's plenty of topics to work on, and I'd really prefer
that each developer work on a different topic instead of duplicating the
effort...

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
