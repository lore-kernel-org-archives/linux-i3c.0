Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EBECCF9E3
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Nov 2025 22:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yL/a9tn8XKxWbzT59ZC1QVtCQgAV7RGn5As0BeiYqJg=; b=rDDB/GKCzx+33K
	nXfb1HVFCdOZaOkFaceF1aq+ZjG3Rt5UFv8U19EhmZ8T0oLAd7pkJkd4mszCgDZnvm7fR/hmFuJRn
	8E7CenvKFjG/oVPb1U1AFD7ZTy6O/jCNfi0LQ1u+PaS0ejiMDTOnjDRahkyXgC2rpp3h7F5XTfyCD
	gRCqrqrnRIvbZScQkdWmgibJtMRHcG78Cm7/de40PY656Cwtjll+lZtGgsnN/gJGfqT4WOltfbQ0K
	u4yK3HFpmgRf0uQ2hAS3lWJWGFNHswxEjzPuLlzAaqt05s+Zxo3AbZ7aO1RZUtEGEXArHOIn7pv3M
	YBGEYNfPKIQN/lWYSUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIao7-00000006E8Q-44pj;
	Mon, 10 Nov 2025 22:56:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIao4-00000006E7U-2J4I
	for linux-i3c@lists.infradead.org;
	Mon, 10 Nov 2025 22:56:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D8C281A19B3;
	Mon, 10 Nov 2025 22:56:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F06E606F5;
	Mon, 10 Nov 2025 22:56:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97BAA103718E3;
	Mon, 10 Nov 2025 23:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762815370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=N3XlahNel7+bMFIXgUQOE7mTQREs+Hvom8NVkTGqzuA=;
	b=lxDn1Fxj4TCJYAuGyNLBtgZTBKYt7oXgv+9JYBFWhv570AzAsX1mu+MlTAZTjx3Tm2NmeN
	fXns+zAJtHPyttmQdctQF1EhkvESl6FrplijQBuuYuaUguyIGAhUjiDO8pHHWlKSxkFlD2
	lnMidvKJ9vy2pcXBb4v2ffJKQ2vLXDul961IcoMU6nf8HoQIYK/J4cueyrePSkeaNC9szo
	tXDzc+8g36za1mdSFUHn1em56WkeKr+nUTj9LC57+kGP9Zo5X9j3m3YybeMd/6uh6J6Fw2
	29MywZQyprVW2H4hieAM8fI1gEp5QJwHuBHAsUbnKpxsYQjTHh8iFQtdoXfLGA==
Date: Mon, 10 Nov 2025 23:56:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] i3c: master: add WQ_PERCPU to alloc_workqueue users
Message-ID: <202511102256074aa37109@mail.local>
References: <20251107132949.184944-1-marco.crivellari@suse.com>
 <aQ5d1g95N86lXXT2@lizhi-Precision-Tower-5810>
 <20251107222830.oPfVHd-_@linutronix.de>
 <aRIaQOQkbPOFpJM+@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRIaQOQkbPOFpJM+@lizhi-Precision-Tower-5810>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_145617_073243_9B27A5AB 
X-CRM114-Status: GOOD (  19.52  )
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

On 10/11/2025 12:00:48-0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 11:28:30PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2025-11-07 16:00:06 [-0500], Frank Li wrote:
> > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > index d946db75df70..519b98c37ac7 100644
> > > > --- a/drivers/i3c/master.c
> > > > +++ b/drivers/i3c/master.c
> > > > @@ -2925,7 +2925,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > >  	if (ret)
> > > >  		goto err_put_dev;
> > > >
> > > > -	master->wq = alloc_workqueue("%s", 0, 0, dev_name(parent));
> > > > +	master->wq = alloc_workqueue("%s", WQ_PERCPU, 0, dev_name(parent));
> > >
> > > Maybe off topic, I think it is not neccesary to create wq for IBI at all.
> > > it can directly use system_bh_wq, or other wq.
> >
> > Do you really meant system_bh_wq or would system_unbound_wq do the job?
> > The _bh_ one would imply softirq usage, I don't think you want that.
> 
> My major means is that not neccessary to alloc a work queue for IBI. Use
> one of system predefined should be enough. system_unbound_wq is good
> candidate.
> 

I don't agree because you may want to be able to prioritize handling
IBIs vs other work so I believe it makes sense to have a separate
workqueue.

> Your change is also good, let's wait for more reviewer's comments.
> 
> Frank
> 
> >
> > > Frank
> >
> > Sebastian

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
