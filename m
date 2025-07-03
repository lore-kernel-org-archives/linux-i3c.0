Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3EBC83030
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK9OcT1dW496wwG539Z9W+gpo+o2R2mRUkI+0k9F+g4=; b=ZpvH/kBUPwlTzZ
	p78yEUUAXp1FHzwVKGdo+VgJq1z5WdM7Wuhs9gWRc9S8VsJFp9asFFkQBrM4kGGMZQvARzkNyubVg
	46IQ0sA/xoJkaj12AAOUUWSODBrZOyXDRlfyu6yr2Famnyn7eKA/sy0YEAxDsHzWXyQ1oHJWqXowW
	evlQq/xgFDyKbK8sdqjsisbOTShbaVq4fsieiwr54S15TVYApzWumP125kafEaCwKFvL006EszBbG
	DKIQnaUDCP7AahI00uLeKO2AtS2SlN3Y6L0juAK/KyzD5o1KWpoaVIHik1TqcbnOHG63R2AsZkP/M
	QhbHZ3y5HeLWSp+I7DBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTY2-0000000Cr7Y-3rJT;
	Thu, 03 Jul 2025 23:40:58 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTHw-0000000Corn-2kOl
	for linux-i3c@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0138C432D3;
	Thu,  3 Jul 2025 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751585058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IzHZz3REpQe6+TxlvDO5PuSOOf9kHVQFez8f/Q4aQGQ=;
	b=VL3q21pOtiNokjilR+zFIGrVJxpN67xVti/M4JDwuuEFt1WoXLzrowKYTgFcq98xlSkpfK
	IhxWxre0P3a116sNpWc+YTQ7rwlz9kvmwAw1SgweN38P4/st38SSpacWwX1Ta57IW3vmOj
	p7EK+h/BcuAcffiuwbgJ0T3hLt9H6t88umewwj+RAz1m+3hBg0JkC2JSmOtI73HtESJSPs
	2iOGF1j5FPBvv4HIowyMrrhtL1K2o71Jaz0KsNEe4eLdJJHEStI2yZ2fOOrtilocE39yjW
	7AnfjyuM7h6oBMZVN+pSCiK4PjI3Qv3ccaLggZmHqwe8GQ1naGqkXBNx0q1ZLw==
Date: Fri, 4 Jul 2025 01:24:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jorge Marques <jorge.marques@analog.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Initialize ret in i3c_i2c_notifier_call()
Message-ID: <175158504911.797604.18214189738603124144.b4-ty@bootlin.com>
References: <20250622-i3c-master-ret-uninitialized-v1-1-aabb5625c932@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250622-i3c-master-ret-uninitialized-v1-1-aabb5625c932@analog.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghssegrnhgrlhhoghdrtghomhdprhgtp
 hhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162420_819983_DBAB5EE4 
X-CRM114-Status: UNSURE (   4.84  )
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

On Sun, 22 Jun 2025 12:11:07 +0200, Jorge Marques wrote:
> Set ret to -EINVAL if i3c_i2c_notifier_call() receives an invalid
> action, resolving uninitialized warning.
> 
> 

Applied, thanks!

[1/1] i3c: master: Initialize ret in i3c_i2c_notifier_call()
      https://git.kernel.org/abelloni/c/290ce8b2d074

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
