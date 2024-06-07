Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9D8C27C53
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Jun 2024 05:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fz7flF0dsCsskFd+JkAtrjhvg9rtjdt9q42LZ2RzCz0=; b=e2chhC1JD1cF4E
	J2ySe1MHrLupE3G1HSPIC9Jsrd0mC8yorMiAKR9e0XX6Ikn84u+R7CiuOGpr5LvYfDIJfn2wjz/SH
	7gyClsMULMrXVqP5sPDBeUeu3kz+8Hr3Uakj2ASnw03X1JnITaiAGlY5CURmFv00lIh96PXcmF3DV
	Vv53jtJVx/MrVNvvx97PRcf2mahenTbqdx97K8n2yEpbsb3NLQ/JopDMTjrC8EkD5yHe9gSFIK/Bd
	J3Jml1H1Drno2PUMfpBOMexqux65USw4a1fowXcgtUrQ46i38EZFilFDY6/NDSLumda1qEwKMB0dU
	RTE8s658jc+GfvThxsYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRsq-0000000CSYk-2pMN;
	Fri, 07 Jun 2024 05:11:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRsm-0000000CSXR-49mq
	for linux-i3c@lists.infradead.org;
	Fri, 07 Jun 2024 05:11:22 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 207D620075;
	Fri,  7 Jun 2024 13:11:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717737078;
	bh=pmFxTJwyxuLxhl3FWXaWxR15Gy9I8J8ELzbL7Dosd7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ORj/CHANTj6LVHMbmVPFkoCJDPADQuuzkKTuy8WDc1sLBYFZczYrGNk5zMzvjUDfR
	 hEzzKBO6DGbt/bFXcMbu+kjeskzDwdttS4ctRizjrfD6/6v0HAqEB1H5RNEUdARtf8
	 LYQC8J3xUrHYH+gPswyYomkSPkvC4odehsENPRKQytpJ6MpCm34g7P/7xAYwHya4Cc
	 3LOkELAPzAdHgi8nyBdhM1Olswg2c15HMzV2sg4B4rVG1mSr8tdhu0CemB6uDvqsw3
	 vrk5YG9VHh9CVEtmZIGSK3SdjkkN8BEnicG2Y312tlmylJBUaYgm8ihhERFgu0VtvL
	 tQ4vvEWi4PYeg==
Message-ID: <3decb5293cb8fb2e8725600a8c5c930c32178602.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Fix IBI intr signal programming
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Aniket ." <aniketmaurya@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley
	 <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Jun 2024 13:11:16 +0800
In-Reply-To: <CAMmmMt3u=DB5onXdayMN5ZHvCmdnam4wOo0hKizve4K0LnZLZQ@mail.gmail.com>
References: <20240606124816.723630-1-aniketmaurya@google.com>
	 <3c6c319f3aaa60428fd28f4d95c71dc9a8150081.camel@codeconstruct.com.au>
	 <CAMmmMt3u=DB5onXdayMN5ZHvCmdnam4wOo0hKizve4K0LnZLZQ@mail.gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_221121_250327_6B91F4AD 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Aniket,

> > I think we're OK in this case (just not reading the value out of the
> > SIR_REQ_REJECT register), but any thoughts on adding corresponding
> > switches in the driver so we can support those configurations? These
> > would be represented as DT config of the specific hardware instance - at
> > the most granular, just by the specific compatible string.
> 
> We can go with some DT quirk, but I don't see the strong need to do this
> here.

Oh definitely - the behaviour here doesn't need any special handling
that would warrant a quirk/etc.

This is more for handling IP configuration options we may see in future.
For example, I believe support for target/secondary mode is entirely
optional too.

> > Could we use the SIR mask for this, but just read it from a field in the
> > struct dw_i3c_master, instead of IBI_SIR_REQ_REJECT?
> > 
> > This would mean that there's no possibility of the counter going out of
> > sync from the SIR settings - say, on underflow if we get a spurious
> > disable.
> 
> Yes, we can keep a SW SIR mask instead of a counter. It would replace
> all the places where we read IBI_SIR_REQ_REJECT.
> Both methods are okay, but if you think the mask might come in handy in
> some situations rather than just the count, we can go with that.
> Let me know your thoughts on this.

I think keeping the mask value locally would be best. this means we

 1) cannot get the counter and mask out of sync; and
 2) don't need to do a read-modify-write on a register that is only
    updated by the driver.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
