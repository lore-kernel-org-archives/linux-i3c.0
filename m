Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BF9E77188
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jan 2025 22:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keSREYsUHnovVo2VgwXQ4LzH+tEm7Y/6Pnpr95o55Eo=; b=fB4ddECtugZf0c
	RCXF9H1dS/B6pDwDnT11UlZ+L3YC9Iz6Cd2A54eOF3vUJyahq2A2M/U8cmX9gxycvSsExqZHYF0/k
	IV5P1FRBttHMg6yljKzBhPo+rhYDwtxWNZwGVGeKyTOWePDzI4Sxd9DFkzsEdgjI8062tpklV1AOv
	NyZCR+YYGWehX0SEGm/dN3+evPziFIbDZ831ZU1sZX84yjfxdHMmPCwmvtKN2ZibOG7YQAbJcwjsU
	KWVQY/CMfa5KL28VIDc08pg5vhyA6L/YhBZW1TPZq4YRC9u/IYIq1RJD/+Ab9t66+3rq2nhR4IW5k
	cv7sgVSvBChwfrPL90bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpqA-0000000E62b-2r08;
	Fri, 03 Jan 2025 22:08:22 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpq7-0000000E61J-22vZ
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 22:08:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9394D1BF204;
	Fri,  3 Jan 2025 22:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735942094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=irMDM0JUlpCpSS+0kb/gACrbTtN6P2IcjloSLLPs7Ps=;
	b=l+b/DWj+Q1rR8GiaCRUQ4ShDAtqTlQDN3CWSDhiu/8/Mzn8a5B9vDe8+YEVM+sYCS5fbMl
	zV4XUzeocDvpTM5pO7mwWP7c/Pty45SVFd7DyedcpDUekINduvxWvdw2DJgxEB70tl6UqN
	Cef2F6HHa1dmXT8Uwf4c8HVUHtf4IAElyvxffjviSbS/Onv1dbinbRL7Kma8L0KKqolfAG
	uWAopZbPcL5WpNso8zZX/HGYfMf+shuW5RhyI1rSNqguRToru+cIiVi7d1yAab4th0NS1m
	Qdty2Uw3c0Dp3LMyGLsTSgo+cVP5gvVzKWhZLN2nQl+TUHRRsdiWO06LGQCSsA==
Date: Fri, 3 Jan 2025 23:08:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <20250103220812962589a9@mail.local>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
 <Z3ZWt0Whyppr6GKX@shikoro>
 <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
 <Z3ZdjRQa0nF1IYaU@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z3ZdjRQa0nF1IYaU@shikoro>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_140819_791705_607E27A2 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On 02/01/2025 10:34:05+0100, Wolfram Sang wrote:
> 
> > Let's add more bike-shedding in 2025 ;-)
> 
> Yaaay... :/
> 
> > There's also a general dislike for the ternary operator (BTW, I do
> > agree it has its uses), especially if one of the paths is a no-op,
> > like ORing with zero.
> 
> Well, let's see what Alexandre's view is on this. I'll switch to that.
> 

I'm fine with the ternary operator.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
