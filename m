Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9A3C2D0CD
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwbL6JzgKxSuERW8vCx93sjqqm5Pfv5pm+rCFPZE1ic=; b=ZkkAyy/jmnd4hY
	HIOcFxtawZLEfo+ZdMNNW5Zsfn5v++FTKSDrPIgkYzaveGzTE8GFUCbAqsZhrgXjBBt3PRdSu48Jh
	h/uZfQvPUfdsW6a2rlfjTvIqpN5KHd3XCZjiUPiuTdu27Ppt1ZdB4g8tmWzJ0DYFqx1p7Dg/UYRz8
	cWGxuneFtXVqQ87OCMyvA58e/jFhuTuC9i/mTL7NYNbLwyO7KCQDpQyjTjnypYWvU4swVtTL6a4gz
	06Rzq+PZiQsxIQtF4Blwjkh6ZYk7GruXm6/TYXaeVYxt3cdUpBQhPYfMQgiDZi5zu1YXWDb29hYN5
	KBEYieM5RusQxPr3rizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVZK-00000000GWM-3iif;
	Thu, 15 May 2025 10:12:02 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVA5-00000000CyZ-1fV1
	for linux-i3c@lists.infradead.org;
	Thu, 15 May 2025 09:45:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1641543977;
	Thu, 15 May 2025 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747302353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QowtIMJkO//Zy72PfaBPBtVZYIcSovqZZ8Yjl8WvlqI=;
	b=prgxuYol9M+HpNbZ8T9h7wcrCOk+4AS833xJie2xPCP+SZWW00fUQnWJLbUqwppYLN2UjS
	/gke8paQfwJD07qDtfbYmiVj3ZzxjRHJ9Z/mAiU4v/36LH28DJjWk0zufZ84SW5u7yBhsU
	c0wrYkShxZtD/++w3jGymBavcZ4Y1ihm33Nei3qPzrY7JP9yO4xYLvpAhRXGM9p4HRmu24
	epDVijuxwnjydV1KlCF92G+PVD8R3/zZwbUSKo+UowJoHyAKdaTwzbn7gMKLSQu9IvtwvM
	NKzZLelF1+w13c8uYP0m0b2cdTn1RGuTWUJiMJGJJpiKeO0XfFDZjD1nV72iyw==
Date: Thu, 15 May 2025 11:45:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/5] i3c: mipi-i3c-hci: Allow only relevant
 INTR_STATUS bit updates
Message-ID: <174730228204.1307590.17878462961499587911.b4-ty@bootlin.com>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtdgumegvgeekjeemgedugehfmeeftdgvfeemiegtvddumeehrggurgemfhehsgemleefgegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdgumegvgeekjeemgedugehfmeeftdgvfeemiegtvddumeehrggurgemfhehsgemleefgegvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjrghrkhhkohdrnhhikhhulhgrs
 ehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_024557_732785_57E92BDA 
X-CRM114-Status: UNSURE (   7.58  )
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

On Wed, 09 Apr 2025 17:03:57 +0300, Jarkko Nikula wrote:
> Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
> reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
> current driver code and not needed in DMA transfers.
> 
> PIO transfers with v0.5 would require changes to both
> core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.
> 
> [...]

Applied, thanks!

[1/5] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS bit updates
      https://git.kernel.org/abelloni/c/eeeec6c5475e
[2/5] i3c: mipi-i3c-hci: Fix handling status of i3c_hci_irq_handler()
      https://git.kernel.org/abelloni/c/279c24021b83
[3/5] i3c: mipi-i3c-hci: Clear INTR_STATUS unconditionally
      https://git.kernel.org/abelloni/c/a7035a8ee966
[4/5] i3c: mipi-i3c-hci: Change name of INTR_STATUS bit 11
      https://git.kernel.org/abelloni/c/7479d2675c50
[5/5] i3c: mipi-i3c-hci: Move unexpected INTR_STATUS print before IO handler
      https://git.kernel.org/abelloni/c/bd916806632d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
