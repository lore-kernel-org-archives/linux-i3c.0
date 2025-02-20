Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C633C021B3
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODvj9TNVw64NguFo8VYxE/idkfJTqFzUqOQ3BZ5pBYs=; b=FesgKKgXzXGP8I
	YddKbIo8Gwa1z7+ZA9wEhCEhF8yqzTNv0179MqNL9zXtJPR4lG/eDsWuz76FErm0M6gHeJgh9DpyP
	lnjkHlC21v3pCjhajOiBIIiJp1DpWIT+zzKG+ga0rPWhgw/g97yCzmwYU0qAY2y4e3/+wD4UBoGaQ
	hfpq2LUr2Mct6lB7yNdkELh9Uhqtrydfuf+vnYMYthkbstVVqK5pYZfdrbbj4hG5Ru/dDKIXouhWz
	3AvJbwFwInsBpoZgYW7qKBjaoICL4pqz52rbxjeOTBaSfvp77eDg47Tz9Ep2iNj7ucfuEMosuPlX4
	GHVqlj6qpCsn1DB/I3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEjK-000000035gt-1Qel;
	Thu, 20 Feb 2025 22:09:14 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEjG-000000035fv-3vFx
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 22:09:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE6F14432B;
	Thu, 20 Feb 2025 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740089345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=prYd9WYZKRHGS7LV54FbDr3RFy3sG6mO4TKryM0mPTE=;
	b=nG2X6ttG2gFqoWgw90E+46IJ6zyYa0GDlWpG35te7uJGnK/ygE2fjZnQ9w0pWHKZrBfMgJ
	grYczvgO7TsnAsMX4nLrWsYPDNg3uPcW0g6GIoSaFpvaVSvdfaWdoDGsIP9qU5uHLqaWZU
	sjtIgmrWH0znlyhOYO4ckXyT8ayEkh/ZmMJbzWH4Z49I7HioVsfV1NI1Dhao4SLmoVvASi
	XfbJfhU7IrMdsWcOHyQjEupLXMDc3cdbHLBiezMZxcPkB+2I/csnA8MQ4JcjnUUlVspr9N
	FJ7+mquFpTjLBpVWLS+Ewe9cwR0nz2tG709MhWSZaE4B5A/xmDzTv9IGo8OIzQ==
Date: Thu, 20 Feb 2025 23:09:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: pgaj@cadence.com, miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com,
	xiaopei01@kylinos.cn, Guruvendra.Punugupati@amd.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com, Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <174008931866.597348.5955807457393482145.b4-ty@bootlin.com>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgfehteevtedvteelleefffekhfdthfelgeefueelgeeuueeggfehheelvdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehpghgrjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhto
 heptghonhhorhdrtghulhhhrghnvgesshhilhhvrggtohdrtghomhdprhgtphhtthhopegrnhhikhgvthhmrghurhihrgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepufhhhigrmhdqshhunhgurghrrdfuqdhksegrmhgurdgtohhmpdhrtghpthhtohepjhgrrhhkkhhordhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopeigihgrohhpvghitddusehkhihlihhnohhsrdgtnh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_140911_603701_0B80A341 
X-CRM114-Status: UNSURE (   7.23  )
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

On Tue, 04 Feb 2025 17:17:01 +0800, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.
> 
> [...]

Applied, thanks!

[1/2] i3c: Remove the const qualifier from i2c_msg pointer in i2c_xfers API
      https://git.kernel.org/abelloni/c/6866c91f8c23
[2/2] i3c: mipi-i3c-hci: Use I2C DMA-safe api
      https://git.kernel.org/abelloni/c/effed5dac8f8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
