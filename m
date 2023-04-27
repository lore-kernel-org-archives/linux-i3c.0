Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C3CC77B73
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Apr 2023 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMUG6+GWcFXAaYpJrNjr18MIardXhcCE4VJ3LN8mEnk=; b=AEOQECeXYjo2m4
	qxx2ykHIFRG/TDRlIclo/8J/5sMFpJT9ZVgAuiKA1fwBoErl4rANRewAKb5aUxZOZ5mGENTJCCXcJ
	mHmXjemtqtdqeAtbkBxXSa6YKXl6mRAZPTe25vXGVjtQmyrK9NezEkGRO0EFxhVRqef8mYxlACEDT
	PD8uxcC/5o9HGxi8BmbSHJVs817WuGC076C3sO3WF0bNO6Wjn4MtX81uUDPVqCa8OMy97zRvRQmAY
	XmpjgfTWyoBXVTgGV4dhIeqLs2FyM1DsuIryAK4awI4rr6GVOQ4YkA2MVs7tykJJp1e+tzj0+yslu
	Ck7gbswF/X7mIe3IH6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psADB-007iAd-0F;
	Thu, 27 Apr 2023 22:35:37 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psAD7-007i9k-2i
	for linux-i3c@lists.infradead.org;
	Thu, 27 Apr 2023 22:35:35 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98E911C0004;
	Thu, 27 Apr 2023 22:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682634928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GodQHLqiMUka8aBwC4PW0Cc9LtT5Y/pZ8lR3R4GHg8g=;
	b=dWkMUb8dXSLjrZUSCyBLGG48ZaV77AMPumT5z2pRSqdFeq1dCAnWhNbPPi/t4V5ghxaObb
	Vu0fPtQF6Ec+ebOBONPDomQRiXVgki78Ry/OtTxQ8M9TEzPh5LiZRobBoLP9Syu4YL7siI
	DaLup/0//IXU7NQM+xuwk1lr/lo3YkHKCUFxShl7F6YvgvuQncz2GBQDCVa6Q0njRFbvMs
	DwWAwGDsQCsadq131yk70xFCte6MAzp6pr8GXHYFUO7HoPoIfa/Z3/kQbNkEk/qq7hC4w4
	os3vrdHi46L3NnQtwCIpkDEVHU16lBTQ9yEYHeA5OlBzJ0ikWPFKWbEkCCnM8A==
Date: Fri, 28 Apr 2023 00:35:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>, Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 0/5] i3c: dw,ast2600: Add In-Band Interrupt support
Message-ID: <202304272235234c8f3955@mail.local>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1680161823.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_153534_185132_787F2B12 
X-CRM114-Status: GOOD (  13.84  )
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

I'm sorry about the late reply, I've been super busy this month. I'm
happy to take this series but it doesn't apply on top of v3 of your
other series. I guess this will have to wait for the next release.

On 30/03/2023 15:50:31+0800, Jeremy Kerr wrote:
> This series implements In-Band Interrupt (IBI) support for the ast2600
> i3c driver, by adding the required generic code in the dw driver, then
> enabling that (with a required hardware workaround) in the ast2600
> driver.
> 
> As always: comments, queries etc. are most welcome.
> 
> Cheers,
> 
> 
> Jeremy
> 
> Jeremy Kerr (5):
>   i3c: dw: Create a generic fifo read function
>   i3c: dw: Turn DAT array entry into a struct
>   i3c: dw: Add support for in-band interrupts
>   i3c: dw: Add a platform facility for IBI PEC workarounds
>   i3c: ast2600: enable IBI support
> 
>  drivers/i3c/master/ast2600-i3c-master.c |  21 ++
>  drivers/i3c/master/dw-i3c-master.c      | 336 ++++++++++++++++++++++--
>  drivers/i3c/master/dw-i3c-master.h      |  32 ++-
>  3 files changed, 370 insertions(+), 19 deletions(-)
> 
> -- 
> 2.39.2
> 
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
