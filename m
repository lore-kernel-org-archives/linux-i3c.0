Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E59C55174
	for <linux-i3c@archiver.kernel.org>; Sat,  8 Aug 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igFbWjmCp07vIa7ilSJoswYhWQN4cyyHdEntwzwlZ5E=; b=H3CtFC5hKbApVb
	3E+KT2lOma+d/ecbJqvfzZ0VSQaned38K8OgZQxlyaKmz/kFCb9WLjb1YNd35KF2VRtzNH2fRZmHH
	h5lbXNsZekxEXMK+1z9e04w0JtR5TUNxmaZOmRv8ZdjAje9CHSzdLjHkova17oFKNbOOSYxNKvQ2Z
	x0AXOTEOAOkIqZWRBQiVbjFZtP1SGSYsjCc0qFh3/SoYe4cTIBl7h17XMmht7Ij/nFZR0HI+kGhdk
	tOcAtejO0UqL3oA6KCyPFPjhJ+9Po0v0XiEh7iH+xX0FU9voy6Ccx1a3IufISz4rQSSf99eLx/A7m
	+cjsfCQY7KNw6Ux0rm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgmY-00000009NKH-1sjC;
	Sat, 08 Aug 2026 13:08:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgmU-00000009NJJ-1G3p
	for linux-i3c@lists.infradead.org;
	Sat, 08 Aug 2026 13:08:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 250131A14DD;
	Sat,  8 Aug 2026 13:08:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE4EF6045E;
	Sat,  8 Aug 2026 13:08:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4624211C484AF;
	Sat,  8 Aug 2026 15:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786194475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ClGEAPMJrUrIAPf3I4J7siyiOrLD1L2Dp/wz05pGPJM=;
	b=Vf8gTwkHq6yQajcRFlm+fSn+kLxl8YAnX3+QoVivp8YugpNiQuLprPFY0RKx0Z4rIEC+sh
	A0xu3gKObPE2BUbcyZ4nYmftKZ6YTNlNli0Qb6Jlzdz2GOi5PNp+/5DtFRoNs+7Aqai+bw
	ID13oTWQxwsIJSKQhgd64sECxqNMBAfMk684IdUiFHVnH/9PMgipv06icQ3j221jgLck10
	HtQH1UKa1NFObu++mIXJUCd2sqrsWV9Ji+cSZfdyVbC4gApjyTGVqbuNfXsOuY+DckFy0K
	Sqfe+Jf4S3egLOz7z+O2U1sn+duUDVPFU10ihjN5MTzLH/WhxLedSHyJg98K6g==
Date: Sat, 8 Aug 2026 15:07:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Frank.Li@nxp.com,
	akhilrajeev@nvidia.com, mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH V5 07/14] i3c: master: Fix potential UAF in
 i3c_device_match()
Message-ID: <2026080813075281786283@mail.local>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-8-adrian.hunter@intel.com>
 <anY1dU59JIvV-6BB@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <anY1dU59JIvV-6BB@lizhi-Precision-Tower-5810>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_060806_497177_43714363 
X-CRM114-Status: GOOD (  28.69  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 07/08/2026 15:43:49-0400, Frank Li wrote:
> On Fri, Aug 07, 2026 at 05:56:31PM +0300, Adrian Hunter wrote:
> > i3c_device_match() dereferences i3cdev->desc without holding the bus
> > normal-use lock.  Since the descriptor pointer can be replaced
> > concurrently, the dereference can race with descriptor replacement and
> > result in a use-after-free.
> >
> > Protect access to i3cdev->desc with the normal-use lock.  While the lock
> > is held, the descriptor is guaranteed to remain valid, so the NULL check
> > is also unnecessary and can be removed.
> >
> > This change depends on "i3c: master: Fix recursive locking during device
> 
> Remove "This change",  just depend on ...
> 
> > registration".  Prior to that change, taking the normal-use lock in
> > i3c_device_match() could recurse on bus->lock during device
> > registration.
> >
> > This fixes "i3c: master: match I3C device through DT and ACPI".
> 
> It should be fixes tag, but this patch still not in linus tree yet, not
> sure how alex handle this.
> 

I've added the Fixes tag, this works as long as the tree isn't rebased
before send the PR to Linus.

> Alex:
> 	Maybe rebase i3c tree,
> 
> move "i3c: master: Fix recursive locking during device" before
> "i3c: master: match I3C device through DT and ACPI"
> 
> Then squash this into "i3c: master: match I3C device through DT and ACPI"
> 
> Or simple ignore "this fixes ..." sentense.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Frank
> 
> >
> > Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> > ---
> >
> >
> > Changes in V4 and V5:
> >
> > 	None
> >
> > Changes in V3:
> >
> > 	New patch
> >
> >
> >  drivers/i3c/master.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index ee771ac0b203..83e04a2c202a 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -347,8 +347,10 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
> >  	i3cdev = dev_to_i3cdev(dev);
> >  	i3cdrv = drv_to_i3cdrv(drv);
> >
> > -	if (i3cdev->desc && i3cdev->desc->boardinfo)
> > +	i3c_bus_normaluse_lock(i3cdev->bus);
> > +	if (i3cdev->desc->boardinfo)
> >  		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
> > +	i3c_bus_normaluse_unlock(i3cdev->bus);
> >
> >  	/*
> >  	 * SETAASA-based devices need not always have a matching ID since
> > --
> > 2.53.0
> >
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
