Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC1C83030
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Jul 2025 23:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7d93m0lBmTtAe9UsvVfQLFgq99H3QR4pgfG1k0msMSo=; b=NMF+fOQuXVCzqK
	OQ20jdQ7uhdlpKtzIEISiQmNeo8TNgrj1qJ3hVnbccrqWoy7Z7gXXH68neziDhay9Gcff6nShbyNa
	RxHVPAoM4VKSVRfhho1m3nW5oawNuZi71Urkom3/CHfEZK/pmvPi8o6FPkX9QFBvUUaIsJ9/A3f/j
	76baoPCgtfhQxWGGkUNMMhrTraQmY68+NpKSpFky7iPioMou0oNBjnxEKgaCSMEVzC0K1Wl9k0J/G
	7b2zLSVgEmespW2vZNCzYXGXiOYqvQucvDUuzNjp8TO99+B/jAZ8QQ35+4QrA47hJqcBUCyzv6Wqp
	iEYzZCkXADE3Uot+TEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTmV-0000000CtSx-1yks;
	Thu, 03 Jul 2025 23:55:55 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTM9-0000000CpVT-0CDw
	for linux-i3c@lists.infradead.org;
	Thu, 03 Jul 2025 23:28:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69356430B7;
	Thu,  3 Jul 2025 23:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751585317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7d0brPbclfVvmiKtaziyku2vNZvGQFEoR2ZrzBEdP7w=;
	b=ADyP8H3o1cDtAapxe6yXn4hdE4CJqGlxnxD/1wdxH/D/wT/Qcs/qLE8Ddcp7h1klnF4xDC
	OzA44LbbYusBg7d2bwnAmc/PDwHROCZRviLoU7A9a5yvl7lSQuy4zBojPoi80tni+VCwRQ
	f8L7kLw2Momb2iefF441EjLqgdx2nsrHuwmJGVwXgmwt/cbTO+24ZBHQAXjlqNVCtMvb8c
	8KADMTPf3whPjzF6UOc/5NgOp33B5coUbewzcFItCkSG/lS2kpgAzT7QEmQ+oIZsVv+viP
	JJCnuXM5SRo3BDBhTYlNEGgY4ThOA0OceG5tcB/AVHNT4upBOzBMwYpInwcYRw==
Date: Fri, 4 Jul 2025 01:28:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i3c: add patchwork entry to MAINTAINERS
Message-ID: <175158531029.798391.9914694024578950180.b4-ty@bootlin.com>
References: <20250605094757.8655-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250605094757.8655-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutdfgheetveetvdetleelfeffkefhtdfhleegfeeuleegueeugefgheehledvgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162841_231933_8A7734B8 
X-CRM114-Status: UNSURE (   4.75  )
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

On Thu, 05 Jun 2025 11:47:58 +0200, Wolfram Sang wrote:
> 


Applied, thanks!

[1/1] i3c: add patchwork entry to MAINTAINERS
      https://git.kernel.org/abelloni/c/4f5ee6405f8b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
