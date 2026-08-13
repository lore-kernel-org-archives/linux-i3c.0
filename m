Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C924C5B572
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Aug 2026 05:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bChNVIOXH9fIRm+rtBxE+8BStA+WOe93S8dcyFQSJI=; b=qhe7KfnHQkEn2E
	+fShpz0nE72zPgqjjf4gDG070qT5TzgvPEfrRvMHMql4Upvv6AJJ67FQ63+nDei2l59eOjdQ/e70/
	rPV3vQ/z3vY/79hvq20l1ZH3Kac+MH/PRREAZYkBJVp+LWyXP7xPq+mI6OvQoDX09uKRZLh8mCUva
	W64AmnARpOgtanckq5Fh5AAXqRyKCOpRvZUyagpPEtJnBgJWVZ6sQJJtaVDMMoMbw9kdTvEQi9Rfq
	HtvY1L6mdOEAdfVa0x7sInuuPh6j0PrParlrmF3oljItAbuidU+972zeekDYwb1jdqk+LZGFhjhvB
	VtPkGJGsMPseVJkbigFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNnC-0000000HOpc-4B7Q;
	Thu, 13 Aug 2026 05:15:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNnB-0000000HOpN-3tfN
	for linux-i3c@lists.infradead.org;
	Thu, 13 Aug 2026 05:15:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10EE9600AF;
	Thu, 13 Aug 2026 05:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1C61F000E9;
	Thu, 13 Aug 2026 05:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786598148;
	bh=WKuvTnxNoz0vSgFictYA5xVedVGpl4eFCS3zf+hHlCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h+zpEqvVEqES2fAcvIQe5fa2Xkt8z/G0H2kCSMdLYQahVfkQxaKm/oHFV4FqP8sbR
	 VKHgYw43QdKAH/+TycoCdPjrIdfCqH9aAkJ0BV+n5LEciN2PG6Kope9A3j3vMR9ZlX
	 yle678XrFfinkKvQ3Sw6+YS7jyOfbHudIm/c/sbypiU9mcguSVdW13ZaN1GJCtK34O
	 c57sutHMUpl0cnLuuKG9LLd6a+xY5uSjRLY/XmAeds3MGspJuXCemkqn/UtC7v5feh
	 mpc2PTxLe8/lffNj2cRwQXjk+P/Fzqg2ccBKdmsD++L9aMX7iLJwiAxc1B//6LEqQX
	 IWiVNFyBsfuGg==
Date: Thu, 13 Aug 2026 12:56:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: reduce do_daa time if there's no client
Message-ID: <an1OaevoSHlA8U1n@xhacker>
References: <20260803140307.12665-1-jszhang@kernel.org>
 <anOXjxCRfW4qfPaM@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <anOXjxCRfW4qfPaM@lizhi-Precision-Tower-5810>
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

On Wed, Aug 05, 2026 at 04:05:35PM -0400, Frank Li wrote:
> On Mon, Aug 03, 2026 at 10:03:07PM +0800, Jisheng Zhang wrote:
> > If there's no client, wait for completion will timeout, then there's no
> > need to add i3c dev at all. This can save boot time by ~6s if there's
> > no client connected to the i3c interface.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 0625587f1527..18ebf304029a 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -885,8 +885,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
> >  		      COMMAND_PORT_ROC;
> >
> >  	dw_i3c_master_enqueue_xfer(master, xfer);
> > -	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > +	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT)) {
> >  		dw_i3c_master_dequeue_xfer(master, xfer);
> > +		goto rpm_out;
> 
> not sure why save 6s. timeout already happen, does register i3c device
> takes 6s?

sorry, typo, s/6/4
For example if the maxdev == 4, when there's no i3c device connected, the
max cmd->rx_len = 0 after timeout, then newdevs = 0xf, then go through
the i3c_master_add_i3c_dev_locked(), each take ~1s, so adds up to 4s

> 
> And if do_daa find 3 devices, then timeout, you skip register found 3
> devices.

It's the addr assign cmd timeout, so if 3 devices respond, the addr
assign cmd won't timeout.

> 
> Frank
> 
> > +	}
> >
> >  	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> >  	newdevs &= ~olddevs;
> > --
> > 2.53.0
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
