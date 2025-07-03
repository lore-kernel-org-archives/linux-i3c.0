Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071D7C83F03
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNcZREmYFXyxgMCYW2huMjDmWnb7KscDah937GWQ8zs=; b=OFlVnW5NXsK4c+
	MM4AbE7jG1orSYcsPtS3osTLMJgjab1lsjPPCdgxCtUFlIW8wZVFLEo2vXA+HRMF3uEiRNONhag7A
	AXdYXoKBAYIsux5GuCourAK2/A8ANrqTn+8l5Nrh4iGuAUjmSt7Lw6OiQi2fKKOx7zPwpRGXxPryB
	Sl7ZiD3EDcu2/TL/4WD5jBb7tnqeXPGBzJ4AOxySZLELd89hDVc4cMlue3/oby5eVniowP1kfpwlN
	k3pNx7+NCoKYB/wgj02bDxXhQj6nBF01FWiiHnhvQGySunVwPv3kEfztebU+EwWLqoZhdZIw7wuTf
	wdU+JtlTgBioj2b7HQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTY1-0000000Cr5U-38MR;
	Thu, 03 Jul 2025 23:40:57 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXT5T-0000000Co84-1Qoa
	for linux-i3c@lists.infradead.org;
	Thu, 03 Jul 2025 23:11:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4C9843195;
	Thu,  3 Jul 2025 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751584282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r5ISSWEuWdEs+QXp5Y0A1oYBYgvtwsywibJIh3bKZM4=;
	b=RL23FrHPPMt4Rz7CeAAEsqSvMHQkGck0LsXQLcA3wUnsCIWr+y2o/hEYYAfhV7/MI0IGqp
	gOYPeTynnzxkgtVwGVEDku632ZEcfDi2R1iwi0wo/ZcjZ05uPbCbIKv1PE3Wa8znHyTrFU
	2CiuJJVV5qx2Io8jdf/p7tqzQDe/GznCM04d+Kpr9pGQ49+pr0zY1pPZLrqJ1uSOZGov/r
	mGHXlAboz/qmYe1TqObRzZi0iNXo+QbEao8bdSBFK7zNzu5EFX+GVzwyfrNrZFaZemvBbb
	fkj/M7IrAakd2AkvdKG1cOIe+SKQTJsplbLkE7jW4JsZwsy2aonndNLwcDKkJg==
Date: Fri, 4 Jul 2025 01:11:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 0/4] i3c: use adapter timeout value for I2C transfers
Message-ID: <175158426783.795206.16864239289735661443.b4-ty@bootlin.com>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphhgrghjsegtrgguvghntggvrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_161128_134280_A9123882 
X-CRM114-Status: UNSURE (   8.17  )
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

On Wed, 04 Jun 2025 12:18:26 +0200, Wolfram Sang wrote:
> All I3C adapters so far use a timeout of 1 second for I2C transfers. I2C
> adapters have their own timeout value which can be changed by userspace
> if desired. Use it for I2C transfers. The default is 1Hz, so the default
> behaviour is unchanged.
> 
> Found while finalizing the RFC for the upcoming Renesas I3C driver.
> Looking forward to comments, tests...
> 
> [...]

Applied, thanks!

[1/4] i3c: dw: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/1b84691e7870
[2/4] i3c: master: cdns: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/be27ed672878
[3/4] i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/c0a90eb55a69
[4/4] i3c: master: svc: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/a747e01adad2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
