Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D4AC021B2
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDsLD9/x2H4H9op9UEmHUmcfrCGyiuSTaXzI7yR6Ics=; b=rgjHgfnAkRu382
	h2sb4ICpRngLp9D964v9wJN4/K/e96td5d5HpAQKwQfqpL8XbtxTHFaFYBNISjQnNI4b91AvwcVg8
	H4NedntDbuBqzxGdtLDitTG/EJoZYK5KC832wwU/Tob5CtrfiHhSZdb6QgpBoCzi6GID12Os2B6Uv
	2dxDEum0iNtZXtVsyQlDO1hS/Sp3zOlSYyERcu5/5oDNFKSeqEhLrEMs0LAHpyUkfAZROPMCzMupL
	M/4LcS9mSiTBETfulgx3xmwa4vzdCP1Rygrfz1NvXUDVd+xUbNevRs37eiUjnJv1gMgaY11IJ3UJs
	M7HuhjGV+NvnYxB/QQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEjV-000000035lc-2clM;
	Thu, 20 Feb 2025 22:09:25 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEjS-000000035ji-3v4f
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 22:09:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E62F843137;
	Thu, 20 Feb 2025 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740089360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XR5kIZpUVnxd7NQva8Zt0gnaC0IasQ2WCr4TJ7Zil3U=;
	b=L19XVOcBHKdvLxCS0Zx5UodskMhTSSsvc+dv4kDB9sXNQ6yMsGw9B4R9q31athnkEHjlpT
	Ml+tFdPj3xrLyvHT3QYTMIhrFtfcMFnL4XwiSuTd3ZrqvUvQIEH5w5AhHHacdx35FMuCn5
	t/sFUZbFYufljky9AHMGCnH5aZ4hTcXZDRSyf/GQtM9esLe/oLUzn+1ilqwdEKqNWggZBo
	yvpfEmC0FXlfoxjJ7WF4VbvswDBzmOVQgF6DVwWKKhOG0U07Vubeb6XA35CyToB50lTEk+
	/Nwk4PXYCvOBTcAAU6T2LcFlMAnDoRPNKqaaQI5TzWVVHcZNqIC4+fDg7AiMuw==
Date: Thu, 20 Feb 2025 23:09:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: I3C: Remove Conor Culhane from Silvaco
 driver maintainer
Message-ID: <174008931864.597348.8655184807057605761.b4-ty@bootlin.com>
References: <20250204161151.2179596-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250204161151.2179596-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrrdgtuhhlhhgrnhgvsehsihhlv
 hgrtghordgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_140923_174506_347CCC44 
X-CRM114-Status: UNSURE (   7.84  )
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

On Tue, 04 Feb 2025 11:11:51 -0500, Frank Li wrote:
> Conor Culhane's email address (conor.culhane@silvaco.com) is no longer
> accessible, and there has been no activity from him on
> https://lore.kernel.org/linux-i3c/ in the past two years.
> 
> To avoid email delivery failure messages when sending patches to the I3C
> mailing list, remove him from the Maintainers section and move him to the
> credits.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: I3C: Remove Conor Culhane from Silvaco driver maintainer
      https://git.kernel.org/abelloni/c/6f61e5dce268

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
