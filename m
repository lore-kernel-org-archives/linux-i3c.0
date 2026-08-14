Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13644C5CFCF
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 04:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nN/keMRinGvwhX+u0IKcFI5X1xYmXh25CTjUtQVsv/g=; b=0Y9jSFgIPE11eQ
	mDSnGasd+jsLUhyf0+KxSUtZNSp/c5UC+Qj6rfcTnRiw0QfnSwr7zgZmEOm5268ZqYthba/mP2glo
	tbvfXF32PbkipbDKvjTRghWsLgZQDvxrQ38mXgdy0EQkLBVMFuDr0kOU6LDErU/U/1JWmToM+HYnw
	R6YsZ6ZsyxOoZDbAnhBwWYUS2EJf5JeeDAga4QIJesMpB42wHfVNIgAJITeIbtQsksk6m/It//tEJ
	TjvNsm/2R3wciIWBGbtFTAAgN7GnyKWjfRdfuUfzmWZtVuCoBMKQAl4aBfsPZd2R/YTBZhRyGOJmB
	RIQCTB+Q9qoCvDIvkwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujHB-00000001vVw-1RJc;
	Fri, 14 Aug 2026 04:12:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujH4-00000001vVp-1jxn
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 04:12:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98B1F600AD;
	Fri, 14 Aug 2026 04:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB221F000E9;
	Fri, 14 Aug 2026 04:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786680725;
	bh=Pni2X7y+Tl1FfQx/53ybaNDthZKqMBIr5x/5GnEArvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oJgcMB5E6D53C4E8DyZLR7rjpSN7ii3C1pNPkdGArdUWdcCOHyybJYJYN3t71o5P8
	 dgrDIG59kcrma10ODEyjeq0JY9Ye3jvQh+KCbhprzl9J/PWz2XmlAfO9NXOJCeCT0O
	 onUrCIL6Z7dItZebV+RiVqpZDrtMthXNJ4j9TI8e9PDYjRq2WqhzSaJYnR6k/P7lQu
	 TuiBJZtiboV7fgqA3EaE15x+w2hQCL37A2XWZqRMXWUCEHPUlnM0ixFguZVm9/Yf+1
	 cgNBIWCXkjZBH43tU4tEI/QSWkEw2yXwAIwjCudtwiuPlPY0ccHedlQb49BRUuxYP3
	 2UukKnxqtorog==
Date: Fri, 14 Aug 2026 11:52:27 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: reduce do_daa time if there's no client
Message-ID: <an6Q-3PjC-f3QHKl@xhacker>
References: <20260803140307.12665-1-jszhang@kernel.org>
 <anOXjxCRfW4qfPaM@lizhi-Precision-Tower-5810>
 <an1OaevoSHlA8U1n@xhacker>
 <an4szPcr_GFmcSFw@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <an4szPcr_GFmcSFw@lizhi-Precision-Tower-5810>
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

On Thu, Aug 13, 2026 at 04:45:00PM -0400, Frank Li wrote:
> On Thu, Aug 13, 2026 at 12:56:09PM +0800, Jisheng Zhang wrote:
> > On Wed, Aug 05, 2026 at 04:05:35PM -0400, Frank Li wrote:
> > > On Mon, Aug 03, 2026 at 10:03:07PM +0800, Jisheng Zhang wrote:
> > > > If there's no client, wait for completion will timeout, then there's no
> > > > need to add i3c dev at all. This can save boot time by ~6s if there's
> > > > no client connected to the i3c interface.
> > > >
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > ---
> > > >  drivers/i3c/master/dw-i3c-master.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > > > index 0625587f1527..18ebf304029a 100644
> > > > --- a/drivers/i3c/master/dw-i3c-master.c
> > > > +++ b/drivers/i3c/master/dw-i3c-master.c
> > > > @@ -885,8 +885,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
> > > >  		      COMMAND_PORT_ROC;
> > > >
> > > >  	dw_i3c_master_enqueue_xfer(master, xfer);
> > > > -	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > > > +	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT)) {
> > > >  		dw_i3c_master_dequeue_xfer(master, xfer);
> > > > +		goto rpm_out;
> > >
> > > not sure why save 6s. timeout already happen, does register i3c device
> > > takes 6s?
> >
> > sorry, typo, s/6/4
> > For example if the maxdev == 4, when there's no i3c device connected, the
> > max cmd->rx_len = 0 after timeout, then newdevs = 0xf, then go through
> > the i3c_master_add_i3c_dev_locked(), each take ~1s, so adds up to 4s
> 
> 
> https://lore.kernel.org/linux-i3c/20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com/
> 
> Need fix newdevs, it should be 0, not 0xf.

Aha, this method also works. Let me cook a new version

Thanks a lot
> 
> Frank
> 
> >
> > >
> > > And if do_daa find 3 devices, then timeout, you skip register found 3
> > > devices.
> >
> > It's the addr assign cmd timeout, so if 3 devices respond, the addr
> > assign cmd won't timeout.
> >
> > >
> > > Frank
> > >
> > > > +	}
> > > >
> > > >  	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> > > >  	newdevs &= ~olddevs;
> > > > --
> > > > 2.53.0
> > > >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
