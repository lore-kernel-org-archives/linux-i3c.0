Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188FCC87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1s4xjVfACObflah/TiNfKQ5ApT6j7ZJ2GJPmWP49aY=; b=h2T3NLTuJG6BWs
	pRSWfwKvitfxTSzDu7pmPenNjjL38ITytAyZ8U9I4jb5KWDOLrP/UuGTnnetGbiK+MD5QzJ60H/4U
	Bku2uShFFGxDbWhGrqBkdTZ8ZUjmL5zmUEAuKlBEvKI9Ae4pzpNcMrZwwt7AC+vPC0mzlCkeUl3uM
	V9rUz02hQTtCIDUte34QTEa+mdMer2JxsTAxuHzALJLbGRBMljRy4FCdyXxZtC3Ki5B9mSuUUGFnx
	XFuvtzE3YqIUXccL4vuv0gJE3WZDVvOlM74CHypeVPGackIVsX7CAYY+do2IurGB4Wg4QGkZk2lwM
	mZPMwHHcN2liBgMMEGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPK-00000002cKq-3ERk;
	Wed, 30 Jul 2025 23:40:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPH-00000002cJA-35P8
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 23:40:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C06B64338A;
	Wed, 30 Jul 2025 23:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753918821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYJ0/uSV52d3ObZ28JInnZr4F1z0KhVK08QGNJys/XQ=;
	b=QvvVjQn1B62ZegMNDD5gWRe/aLZcVjD4JX22IBUOd4ZzFDYUiK6GxKKfLjNgCRmRX+hott
	vswY+rXjW/v5Kr1JAvSjQVLCrFKsSpNUGtG7oKFgDxdx5MlN18FtlxP3nuPHRNVD/WpDnP
	/2G1TiZZNeoFjormZL2Avg1DhF4jTxvGLxFzX1H0mxWVP7SjAe7f75dJSA0DBfNuZQBgOz
	VRX8xLql9YPruILOZDf+GDsFqpzyyc6e3dQP7h03iTFyaMeSrp0XZPeVr+g6UcbyiM5iE3
	gq0iHcxN1+oeG8ihzP7pY30vhU88sIeoKKMA/BXNmLVdSxb0uJIeEm0QMvrgzw==
Date: Thu, 31 Jul 2025 01:40:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Jorge Marques <jorge.marques@analog.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add helper methods i3c_writel_fifo() and
 i3c_readl_fifo()
Message-ID: <175391871291.1768453.6107982035925873578.b4-ty@bootlin.com>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehpghgrjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehjohhrghgvrdhmr
 ghrqhhuvghssegrnhgrlhhoghdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_164023_901084_839CA9DD 
X-CRM114-Status: UNSURE (   9.56  )
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

On Tue, 24 Jun 2025 11:06:03 +0200, Jorge Marques wrote:
> The I3C abstraction expects u8 buffers, but some controllers operate with
> a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> reading or writing outside the buffer bounds, use 32-bit accesses where
> possible and apply memcpy for any remaining bytes.
> 
> Add two auxiliary methods to include/linux/i3c/master.h and use in the dw
> and cdns i3c controller drivers. The adi and renesas controller drivers
> will also use these methods.
> 
> [...]

Applied, thanks!

[1/3] i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
      https://git.kernel.org/abelloni/c/733b439375b4
[2/3] i3c: master: cdns: Use i3c_writel_fifo() and i3c_readl_fifo()
      https://git.kernel.org/abelloni/c/c20d3fa70491
[3/3] i3c: master: dw: Use i3c_writel_fifo() and i3c_readl_fifo()
      https://git.kernel.org/abelloni/c/6e055b1fb2fc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
