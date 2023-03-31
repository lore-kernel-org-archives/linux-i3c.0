Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A91C76196
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Mar 2023 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tO5ce+dhPJP/nNjUxrYsB5ItJXc17zUImSeXXtIRGY0=; b=1ZDse52FA4YbJT
	IZjvP4XU3AkxFj7WJQep73B4+4tTbrosO26UtFnD2Eg0Juv7Qq3ltqrFBXBUEaR0mGQEEmiDMfZO6
	rJi9/GGqUerRx4hovlJKEx4Lu84PmH3BvYh5debEQ+KKYwnKByY5gqveiMu1l64s00i6odX5IhMbD
	/qfNGX76+LmeVUkNV3lMidiXFAhLAj09Pvk02Ry95Lj/NDhM/vg8KwCWrgf4k3yLgU93TcHm0yB+W
	YI/svbwl8S+jY7gMqSAJyBHw/MZ9yspYwwGlE2JleXEqCumspAJxmWnZbf51TcOlNQXuUtqbjATUw
	0H/+NkwMGlKkjA8wRVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Qy-006CST-1X;
	Fri, 31 Mar 2023 07:44:28 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Qv-006CPz-0q
	for linux-i3c@lists.infradead.org;
	Fri, 31 Mar 2023 07:44:27 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0672A20010;
	Fri, 31 Mar 2023 07:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680248659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SDE65/9UMQcVJEA+MrPuDNWDnBd+1E2AaSdY+g9jmkk=;
	b=bxbMf2OIFqouKOHScTviVUqivPdZh176KPQb9VRlmU5Bc9U/A81xFq7Hb6fFKzYRVtnUJl
	J0EqalrRu7ywflqCWsj+kA4VbJ07iLQBGGG9doUYcGZm+lprMtEDZwsjaSQ8LmtFaUgamv
	omquqS173IkTauYZroHrkaxw7Z2+NyH9qgMjv0um21pLnCJUbls1QXYGED+j41mTan5FNG
	NvFHoiidu5RVfPsAltT1x/CHULjdkbQoUl6qqP/E6FXKN2H5w+U0UcRvJhb8Jro0xltnqC
	+k+m0xalKUzviTltWz9zcniMpdcG7A24yv77qllBr+gE/ezZJ1RKZS81+c3TZA==
Date: Fri, 31 Mar 2023 09:44:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Jack Chen <zenghuchen@google.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c
 controller
Message-ID: <202303310744148a8192e9@mail.local>
References: <cover.1680160851.git.jk@codeconstruct.com.au>
 <CALvyBcV9EnwgcuNXF=uUwdQZ=WHjmpinD=s0FkL=KC0OBTwXBA@mail.gmail.com>
 <48906ed40dbf34a28cb9bcc2569d113abd88e409.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48906ed40dbf34a28cb9bcc2569d113abd88e409.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004425_465978_BE1C9B12 
X-CRM114-Status: GOOD (  17.68  )
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

On 31/03/2023 10:33:35+0800, Jeremy Kerr wrote:
> Hi Zenghu,
> 
> > Thanks for the change, especially IBI features in other threads.
> > From my understanding, ASPEED AST2600 is a SoC which uses Synopsys'
> > I3C IP core, and several different registers, especially the pull-up
> > resistor.
> > If so, I am wondering if this is the right place to add
> > ast2600-i3c-master.c, given that all current three xxx-i3c-master.c
> > drivers in this directory are from IP providers directly.
> > What about moving it under ~/driver/soc/?
> 
> It's my understanding that drivers/soc/ is for smaller parts of
> SoC-specific functions, rather than implementing SoC driver instances
> for existing subsystems.
> 
> I'd prefer to keep it with the i3c controller drivers; this means we can
> keep the dw platform API as contained as possible (ie., within
> drivers/i3c/master/). I expect that we will need some coordination of
> changes until we have the platform-specific behaviour mostly described
> (see the IBI series for another hook), and so coordinating changes
> between drivers/soc/ and drivers/i3c/ may make things more complicated
> than necessary.
> 
> There's certainly precedence for this pattern:
> 
>  * the aspeed ethernet mac is provided by the ftgmac100 driver plus some
>    SoC-specific behaviour; that's entirely within drivers/net/
> 
>  * the aspeed VUART device is essentially a 16550 plus extra registers;
>    that's entirely within drivers/tty/
> 

I confirm this has to be in drivers/i3c


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
