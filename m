Return-Path: <SRS0=cSKn=QE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB879C282C8
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 12:09:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB63214DA
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 12:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNg8J7FN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpeQAuJX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAB63214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jh58IgPYoX/XFQxeoDkt87ZuZrOVowYW9TzKTFDxO4M=; b=KNg8J7FNzckKsQ
	DP+NzQvULh7QKKv77x8UpcqZ+mtWdRGWuGvN/+xfRvRt+A22fkco+9y2mHI1A37Wr263kdqb+KazW
	DsFh5Z5LmQJhwKAZvbG/wuCPfLu0oQp73Vq/TqVud5VoTggK54soPMLoeV7nSOtwP+efLFKVFMV8U
	paGhqkcLoC3wC8Z+33nC6y1M1QDgNhs1UGfWgtWeXzAB8AX2Wk/SeHYDtZKonbppI/6PyXjlYIpud
	db0jMP2TMm/ipAkHJba03gEzI2keviBvbp0uqol1eRBvigLEE4npSogOe9UYOqKvIux3H3oFTVw2G
	jdYEut8r5XJJjTDHpMZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go5jF-0005YA-DB; Mon, 28 Jan 2019 12:09:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go5io-0005BI-QH
 for linux-i3c@lists.infradead.org; Mon, 28 Jan 2019 12:09:11 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7470C214DA;
 Mon, 28 Jan 2019 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548677342;
 bh=re94BtNWNRqvzARMkDlikGujPzpikTdMq70pFgCvHKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dpeQAuJXY9ee8vXjVqTNH/KoISfiy9CCMF2LenR3FAVM01VLtisnKYVMzuYnIdQWe
 OHbIP0sNjvDRtxHMWyiBJtQoiREJRZ/LT6dCsvvkfAxFIOWru3hXW6NYAIVW2MIgcJ
 JI8+pAOj+mbLSzuVMwSLTOxAOqjwZPqimCjy5hN4=
Date: Mon, 28 Jan 2019 13:08:54 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v2 1/3] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190128130854.5b0728e0@bbrezillon>
In-Reply-To: <20190128103714.GA619@global.cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
 <1eca82e2d7bbff19597b78a3ce1ad62273015529.1547227861.git.pgaj@cadence.com>
 <20190115220953.400d06e7@bbrezillon>
 <20190128103714.GA619@global.cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_040903_489730_6BC12EDB 
X-CRM114-Status: GOOD (  23.27  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 28 Jan 2019 10:37:15 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> The 01/15/2019 22:09, Boris Brezillon wrote:
> > EXTERNAL MAIL
> > 
> >   
> > > @@ -1727,6 +1836,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
> > >  	}
> > >  
> > >  	/*
> > > +	 * Don't reset addresses if this is secondary master.  
> > 
> > When is the bitmap initialization happening then? I really think  
> 
> What do you mean bitmap? Are you asking about slot statuses?

Yes.

> 
> > secondary master init should happen early on and be limited to SW-side
> > object initialization. We can have a separate function to do that, and
> > maybe a separate register function too
> > (i3c_{main,secondary}_master_register()).  
> 
> Ok, I get it. Because of lack of information at secondary master init time, I
> decided to register devices with full information. PID is blocking me. I'll try
> to separate register routines.

I was talking about master registration, not i3c devices (slaves
connected to the master) registration.

> 
> >   
> > > +	 * Secondary masters can't do DAA.
> > > +	 */
> > > +	if (master->secondary)
> > > +		return 0;
> > > +
> > > +	/*
> > >  	 * Reset all dynamic address that may have been assigned before
> > >  	 * (assigned by the bootloader for example).
> > >  	 */
> > > index f13fd8b..16e7995 100644
> > > --- a/include/linux/i3c/master.h
> > > +++ b/include/linux/i3c/master.h
> > > @@ -418,6 +418,21 @@ struct i3c_bus {
> > >   *		      for a future IBI
> > >   *		      This method is mandatory only if ->request_ibi is not
> > >   *		      NULL.
> > > + * @update_devs: updates device list. Called after bus takeover. Secondary
> > > + *               master can't perform DAA procedure. This function allows to
> > > + *               update devices received from previous bus owner in DEFSLVS
> > > + *               command. Useful also when new device joins the bus controlled
> > > + *               by secondary master, main master will be able to add
> > > + *               this device after mastership takeover.  
> > 
> > Do we really need this hook? AFAIU, this is only called from the master
> > controller's work which is responsible with mastership handover, so
> > this can be done entirely from the master driver without requiring help
> > from the framework (just need to do it with the maintenance lock held).
> > Am I missing something?
> >  
> 
> Actually, I use this hook at secondary master init time (in framework) to
> register devices which could be received by DEFSLVS command.

Hm, so you're considering the case where DEFSLVS has been received
before the secondary master was registered. Can't you just add those
drivers from the ->bus_init() implementation? I mean, you know when
you're acting as a secondary master, so it shouldn't be hard to have
one ->bus_init() per master type (secondary vs main) and in the
secondary master ->bus_init() add devices reported by the previous
DEFSLVS frame.

> I can register
> those devices in the driver. Separate secondary_master_register routine should
> help in this case.

Yes, having separate register functions should make things clearer and
allow you to customize each patch (for instance, no DAA in case of a
secondary master).

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
