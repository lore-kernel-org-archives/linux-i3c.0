Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A08C87FC9
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGco2kT24jRZP3AX9SxlOkByBk4Uh4clNoo4gKWC9Qo=; b=ouM0xcYJuoFZ1t
	nC/QnmLOI96MWzrqVT6ecNE/7HLdZ0RNMODv4//LNw5v3MAbAYNVoMDooNwCtWJOsCbJbJ/pWNhgR
	xcmCWFKVAtwWmpkLIMwsuALzXpoKHrE9bCsNTC7h2Q/w6+FKqrVzeFK4eSNZp7d80MpMAsqtaSI1c
	LkkhkCCUNNK+PuXm4GEj3xFQhXzbvHz9O2MJzcpKOUg8wJMcK9FOTxt6CguRCOdYYXCA4ghyl7fLI
	N3S3iBb7DX/xq7JKnes3BkbzGFXYhrzPrQGVSczr3Xa3swZR2e/FDQb5Pq5AlpMMG8ymZnOVQwOYK
	kaKsw4No/B0qa/7x8EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPV-00000002cPJ-1FUx;
	Wed, 30 Jul 2025 23:40:37 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPR-00000002cMf-3e2i
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 23:40:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB44E43287;
	Wed, 30 Jul 2025 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753918831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPK/+tRkFipPm1Q2/+R8GymrzprSbCpGJgSCzBqoOnc=;
	b=hycS7UcXFFaptgyCz6rW8VURqgJyAT/XPynfcrGpWBk34tHz0A4p8rGzGBugVta8kcBXCy
	m1t0BRAEE4b8LEuMZ1uA4I7lxgFZZyTeELSJ/ug2dL4QOPmmh7FYlMr4ILyPGvb0AAy4ig
	OJHa8PuZgSXChA5eexicjcFFethbPOwrJ6jrp12yJhFSDysR2cay+XMyZ1NUG1fzqwQr9h
	FchnNPa6znn1OWO8Ou8W6ey+HA8MkLmnelkL7g681qKHoavYVVzLeOneT1uiSxTNBT85Yk
	GbCkQ3e6jKp/ruQtEh++A4kudzkEiT9DW5eHVXI22a3KFN7+LBayg/yxSUjDGQ==
Date: Thu, 31 Jul 2025 01:40:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] i3c: master: cdns: Simplify handling clocks in probe()
Message-ID: <175391871294.1768453.10875050210045855745.b4-ty@bootlin.com>
References: <20250713152411.74917-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250713152411.74917-2-krzysztof.kozlowski@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelledvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgfehteevtedvteelleefffekhfdthfelgeefueelgeeuueeggfehheelvdegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeduvgeffeemfhelvdelmeehvggskeemuddugeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeduvgeffeemfhelvdelmeehvggskeemuddugeefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepphhgrghjsegtrgguvghntggvrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheft
 geslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_164034_055256_3D1A967D 
X-CRM114-Status: UNSURE (   7.38  )
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

On Sun, 13 Jul 2025 17:24:12 +0200, Krzysztof Kozlowski wrote:
> The two clocks, driver is getting, are not being disabled/re-enabled
> during runtime of the device.  Eliminate one variable in state struct,
> all error paths and a lot of code from probe() and remove() by using
> devm_clk_get_enabled().
> 
> 

Applied, thanks!

[1/1] i3c: master: cdns: Simplify handling clocks in probe()
      https://git.kernel.org/abelloni/c/da9b54708ddf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
