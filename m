Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF45C5CFC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 05:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfmkrjjDy//lEKS672TKw6LP0GEDoKAFRN5dl9OfX5g=; b=3QLRAWy92Uuf6R
	uh8WHgshRSNaJASpU+FhUqK/0A5k1HN1M/qFvzJdMnfKRpOaBL8GB40/T5sbnl3Pizs1dIkwAuKWY
	+TJuMDX+9t8hugbwK0fLqoXoPgPHUqBzjTpJwEXcjchh8N/p7lZOgs+Hsiz5X5wT+GuEu2N2BBQoL
	NpcjW/S+5rKndpTLuTRyUSp7H+5gmsSpjQlw+Ib7pP8EaFYRp7+++3Yt3Qlv8y5llxewzMIBaH4of
	bEm7QkfEtozgOdZaYJIUeQU5jLEGtHP9YcPndeDcnCVuU2nDg9Ru2lt1ZH6Irlr8QMzMLhbkWDS53
	OfLzTAChMKBNUUdQRn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujLu-00000001vfV-3Y1k;
	Fri, 14 Aug 2026 04:17:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujLt-00000001vfK-0ySm
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 04:17:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B483600AD;
	Fri, 14 Aug 2026 04:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB5E1F000E9;
	Fri, 14 Aug 2026 04:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786681022;
	bh=eMPNbZ2+sfD8wiOkvzFUaemfh6XAPCq/65D4BdyAuuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=an/o12SfKRAainHgonXGDpwMhxrdvbkrMt9LxnVMEwehwZ5E4mbyuWU33ZjIG+cOU
	 s4AOjRu3q8suOvWsRxZR0dQfKykUDm7FyrvCHZ2Pvy5ZBYvybGoPXacuz5KvrI4I/U
	 0lNEq0x0PJRjyy3cRrwW+xgSp1Mh0W1GuyniYdT6w1xX7Co6Xw4AzV3CLH6qC+i+MP
	 eSdTA9icR8IAbowodAJ/+6FEaDZ+rKgb/qD0qinByPBPg7IcbhQLt1s95gv7sjpb5G
	 8MSK2TXfpgzPpRUdudiM3kmT3PbVhujqPzwdmih4YQ3Xrd9JN2IZcNwzFPN/mkhkOi
	 oGuNeMhRGcqzw==
Date: Fri, 14 Aug 2026 11:57:24 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: make struct dw_i3c_cmd smaller
Message-ID: <an6SJAnIl_wdTPNA@xhacker>
References: <20260813044603.22425-1-jszhang@kernel.org>
 <an4rSDgJtDvudtmY@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <an4rSDgJtDvudtmY@lizhi-Precision-Tower-5810>
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

On Thu, Aug 13, 2026 at 04:38:32PM -0400, Frank Li wrote:
> On Thu, Aug 13, 2026 at 12:46:03PM +0800, Jisheng Zhang wrote:
> > The dw_i3c_cmd is dynamically allocated, make it smaller. For example
> > on 64bit platforms, we reduce the size from 48 bytes to 32 bytes.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 6ba84a97765f..d6f84f0f4c2d 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -247,10 +247,10 @@ struct dw_i3c_cmd {
> >  	u32 cmd_lo;
> >  	u32 cmd_hi;
> >  	u16 tx_len;
> > -	const void *tx_buf;
> >  	u16 rx_len;
> 
> only switch rx_len and tx_buf should be enough. otherwise there are data
> pad after u8 error.

If we keep the error at the end of the struct, there's still padding
after the u8 error.
There's no big difference between current sol and only switch rx_len and
tx_buf on 32bit platforms. But on 64bit platforms, the current version
makes use of the pad to store the error, thus saves 8 byte more.

Thanks
> 
> Frank
> 
> > -	void *rx_buf;
> >  	u8 error;
> > +	const void *tx_buf;
> > +	void *rx_buf;
> >  };
> >
> >  struct dw_i3c_xfer {
> > --
> > 2.51.0
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
