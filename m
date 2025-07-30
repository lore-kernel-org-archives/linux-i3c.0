Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796E1C87FC9
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbHWSlAWfn18EfA91hGChBM609fCojcebVWauQzDB3M=; b=MXdMtWOgKe6Pej
	oQGv3tduXlkbohzKGo3QxJmttEXGkT4tKT+jGfBR3zzQiQ+pbFBqTOyt6CO0/CUp92KOzuneGgbpH
	7FwtIC23X5PWsLm0Y5FcnxC3iMs6yNQwXNWTTejjf71aFjhlYIh4L9w+6uZUniFkItY+aQBnHHjXm
	bMvyjmemj5ZZCu/ZNsI1GAypVx4dK4oj4MnrtBb4weUlyN3QEF/8kTcSvqTpewTQVmyOF9uRV2tZx
	18Z5WuUkkSVa69Rh/o19IXK4ctnwN8XrswC5b4h3cKlBcYmzXoIvtudvnYKFQ2hYjDbbD6gFcsuZy
	lPVmk5AZ4YKXwlNzxpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGP8-00000002cGc-0n0B;
	Wed, 30 Jul 2025 23:40:14 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGP5-00000002cGD-2ZQq
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 23:40:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D050343848;
	Wed, 30 Jul 2025 23:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753918806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B3bdQJx5RZs/LsiSuUfK/7GfgsqTy9SxRpZPG3z++wA=;
	b=JptZENrur7SVay8s00tLbl9Nq8AfOPw8Dj4alkaSWUntmSZtPimcx7FlLlnnD7e4IAkSxc
	ew4CedYr2zWenqUCQYMqcxyzRwUiIbgjBZ70RjbOe382GoouRSCEOcBcUcZlQDJHxNwZNo
	olVmhc7F2z1t/9lCKJyYJodCQ/Dr0P+VIXc5e/lnqwNEeaMStmyFXmW1Q0HwPzeK9IZ3H0
	Gkk5czgrrE8QIF1o9B1PPn3RzJKFiLMUUyWul1y040J/I9IgJokFMh9ekqVjs7YgbKtwYq
	nNmITnSpMqf9TkMy0or3JWtLaJkCPktTP7JYPT3NTTNP44zD14cT3O3BCOinxg==
Date: Thu, 31 Jul 2025 01:40:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix module_i3c_i2c_driver() with I3C=n
Message-ID: <175391871296.1768453.9315319722911667776.b4-ty@bootlin.com>
References: <20250725090609.2456262-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725090609.2456262-1-arnd@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsr
 dhnvghtpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_164012_166948_3D4E59CA 
X-CRM114-Status: UNSURE (   9.28  )
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

On Fri, 25 Jul 2025 11:06:03 +0200, Arnd Bergmann wrote:
> When CONFIG_I3C is disabled and the i3c_i2c_driver_register() happens
> to not be inlined, any driver calling it still references the i3c_driver
> instance, which then causes a link failure:
> 
> x86_64-linux-ld: drivers/hwmon/lm75.o: in function `lm75_i3c_reg_read':
> lm75.c:(.text+0xc61): undefined reference to `i3cdev_to_dev'
> x86_64-linux-ld: lm75.c:(.text+0xd25): undefined reference to `i3c_device_do_priv_xfers'
> x86_64-linux-ld: lm75.c:(.text+0xdd8): undefined reference to `i3c_device_do_priv_xfers'
> 
> [...]

Applied, thanks!

[1/1] i3c: fix module_i3c_i2c_driver() with I3C=n
      https://git.kernel.org/abelloni/c/5523a466e905

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
