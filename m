Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAFEEB28D6
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Feb 2026 08:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VDjMtSi7CZcIpuWENPIisUyJS80TcFEh2NeNKDxsOHo=; b=o7UPKWZha0zL9wAZl3AuU2cBkB
	wXEByuQtAFxNBkNIhnWZ+z4ZjWi3Zoqr8VkHhEB9iAcypo6nx25NmyWYGOlQMX7kD/4ejMVxn9g6U
	crGnpgR6cHksorUA1XalOda9GBhbbRrZ9vRZ5JH/Cafv9WLxYZRjupApdfAvKP7t2wU38V9mdSH9S
	7x7fsxF1UWivlyPJA33Mn9xdsN5kz4mD4DnKZsc9SBtA3qBiiUhVf9Cz3FwXt6LNTYM7OiK3CEM9q
	Lv9o5/AgC5+vxt894DEhqGJH22pIBOC4OQhV2zPqp4X97r+1QWBkv8beoj5Agx6/A4ChgqcouOTq8
	1Y/CDH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH6U-0000000B1nC-31bk;
	Fri, 06 Feb 2026 08:22:14 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH6Q-0000000B1mo-0YBh
	for linux-i3c@lists.infradead.org;
	Fri, 06 Feb 2026 08:22:11 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id ABEB4EC0218;
	Fri,  6 Feb 2026 03:22:05 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 06 Feb 2026 03:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770366125;
	 x=1770452525; bh=QM8lN0ZijwEypD2bYQjHjlWA62vBMiJ2Qc21XQUpg0w=; b=
	QuBVsouWaYEP9pP4vTnG+HCJ1o0D2ptOyQ3azLmLbFYLj+IsY+3H/R0tLWkhjKwV
	xWERgphmY8cbD+73sC8NT5/r+NaOnIXpmkhCSOBii5sLlZ7Z7W6kNg6IfUuHeZ3x
	ORilE/Ee68p0ZEtzeTvU+YIZ0sfLIqeGKmgAZO1MfqPcP7HMNdD8BYkoWkWrBaJu
	OfOXIncHtMUFjjs2xXIr9tsiji6GqJsJ9HGvUvJV46XIzO9e8+0z7+TZVeKrT/dI
	Smtk70HnixzpmctzKqjab+UfcC6i2YTl6iU+TscXI977k7PWmYHq7wTwozbUEreC
	O+FVxRtCwNIZJZxHlRhI/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770366125; x=
	1770452525; bh=QM8lN0ZijwEypD2bYQjHjlWA62vBMiJ2Qc21XQUpg0w=; b=e
	9j8E5N7J/iXrNFFxPiUp+u3IIznFlz0HADBu3e/P4H37/pGWwMlhc/Dp7FngQOrU
	QFJuxcpqGN8kDX889gVfuZBncuDrm2IpB+2vSXd3bJAxMWVNcdaJs7a2kOCEycgU
	ubv0nbs9dFpGOiQTsrmc4gxbB6Va9yKWNpHDg2tsIRK9k71c9Jpo0wkwKV5VyuEe
	IW//DqMAD3DiKzSCY+2/mgZSGWB9ZDgDio28AZKe1OAbJVYYkoUFSGarfqbl4aFz
	MjWuQ7SdeI2LMSrWNSnFjK0R6AkHgjJx1MGWQzdtEwUOcMV0YjBPoieNwvw+pB6S
	RWWqBz9ASTg+q9mmOU7yg==
X-ME-Sender: <xms:raSFaUqz_PAh3iNIFeC9jF78tH4dc5XDe51XzLZLrKNU7ByBsYlBXw>
    <xme:raSFaVemc_TQ3aa9aoG0nfv3nqCF338vW_AsyJ3aYXwHIQQ9pkZTf1Z4Z58-2xZAr
    QmdpWnHvdRyhhMtf5hcz27uCXVdTcgzwm3z77jY1OlH1fAuJBWBMWc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtg
    homhdprhgtphhtthhopehjohhnrghthhgrnhdrtggrmhgvrhhonheshhhurgifvghirdgt
    ohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjih
    gtvdefsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkh
    dquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhiihhosehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:raSFaQIxWHKD70uZ9pKQkOx-sBJDCyWkx5kaR5yP20InZgObPrdKCg>
    <xmx:raSFaTOr4QXxUt3NA6f_XlXaX1E3xWH4DiwwxznK29R50T7ZG_HVDw>
    <xmx:raSFabWOB6o3IKz_4DMr0kAXmLp6nITsX9CephKNXsa1-BUVLZYy2g>
    <xmx:raSFaZnYTI0qUt62pc2HBSewdjFgqI3NVafwRmaH5RSE4pL1SUA4uA>
    <xmx:raSFaX3KuwbQ7QIbAwLPDogc_Hyl7Bptob10PVgjn3lOJ7Sq9uOre_TV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0F0BC700065; Fri,  6 Feb 2026 03:22:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A62Mc5cPnZB7
Date: Fri, 06 Feb 2026 09:21:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jonathan Cameron" <jic23@kernel.org>,
 "Guenter Roeck" <linux@roeck-us.net>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Jonathan Cameron" <jonathan.cameron@huawei.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 linux-iio@vger.kernel.org
Message-Id: <879b9cb2-95f3-464f-b300-ff8a8065b451@app.fastmail.com>
In-Reply-To: <20260205201126.66995e9e@jic23-huawei>
References: <20260204164216.544409-1-arnd@kernel.org>
 <b2fdaf5f-62b3-4695-aa89-b674aabefffb@roeck-us.net>
 <20260205201126.66995e9e@jic23-huawei>
Subject: Re: [PATCH] [v3, apply after -rc1] i3c: simplify combined i3c/i2c dependencies
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_002210_628372_2A548A31 
X-CRM114-Status: GOOD (  13.93  )
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

On Thu, Feb 5, 2026, at 21:11, Jonathan Cameron wrote:
> On Wed, 4 Feb 2026 10:15:56 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
>> On 2/4/26 08:41, Arnd Bergmann wrote:
>> > From: Arnd Bergmann <arnd@arndb.de>
>> > 
>> > All combined i2c/i3c drivers appear to suffer from the same link
>> > time problem when CONFIG_I3C is set to 'm':
>> > 
>> > arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
>> > mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'
>> > 
>> > This was previously fixed every time by marking individual
>> > drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
>> > tedious and is somewhat confusing.
>> > 
>> > Add a Kconfig symbol 'I3C_OR_I2C' to help replace those dependencies,
>> > and use this in all the existing drivers that had already fixed it
>> > as well as the new mmc5633 driver.
>> > 
>> > Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")
>
> I think can drop the Fixes tag now given there is a fix in between for
> the original issue.

Right, my mistake. 

    Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
