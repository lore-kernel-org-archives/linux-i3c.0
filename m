Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D449C83030
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jul 2025 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7OhXFsYfafZzHFlSLCeMwdAVxkYjEzfZPVKpBhKI3s=; b=iwoq2FnmPgpbFm
	xsG8lnB4GOi39TmVyJrmZGLz79S7QaDI7udiZyo2ZkBFUjOTwtQptnIyN+r2aiCoVmizh+yi2MVoZ
	H0fVw0B6mhKxB0YS9DMAI13golOrCBnutsxH6QLRjPQCgy0ETjYd6+HufeUNQBy/E8hrDo/amoaBR
	pcuBq8/3M7Oewh0Hfqw8MnWNWRhRxtVBwnGWnb0psT0VfGjbiPb4jpmr/9FsOAX2DlWlny6kmfWvN
	L8mlhysiCyOoVlFBNWb9joS1dmbR3MsqebN+Ef+eiNE/eVAqowh9kSqA9/NKfwshOVuPMlMGmW2Ox
	lOTVxtV8LLAw2hcqMBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYtSR-00000003ds8-3Epm;
	Mon, 07 Jul 2025 21:33:03 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYtSO-00000003drW-3rWz
	for linux-i3c@lists.infradead.org;
	Mon, 07 Jul 2025 21:33:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF62544264;
	Mon,  7 Jul 2025 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751923975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ljSPiguxoKwfPYui8PklE/v9l10zHor4jOjap/p6Yc=;
	b=eSsjsyDFSgYeGgTSOiZy6S8577TyRPkfl7+PAunbIjdgnbBgJFlNQJ2eEaqn/ojtTQFXNy
	TEhwEEcijSP8ax88j16AwartQ5M4pYwm61TqqZKiWEnkSnQimTMq2L/bDsoT2zy8dttmkY
	MiDdphO447Lbbj0SrLO+cr5hqTgSga0aj9Ojg3w+okDhS/5jo+UyTHHJ9dMaftN9FmTSdl
	g+fS6+zQfwS3qleMh6uBzmmBD//Mq6uTmt2Td4aooyjRZ2JaywZwJVC4pndB8r954c4GE4
	umRYNCC1wl661ZqDdsYp5YEHCrxzOs8JjNIV7F4lKZuEX9D8Hg7BjSGlrR2VHA==
Date: Mon, 7 Jul 2025 23:32:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: prefix hexadecimal entries in sysfs
Message-ID: <175192395159.1512350.1764310029044120995.b4-ty@bootlin.com>
References: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_143301_458147_2D813794 
X-CRM114-Status: UNSURE (   6.53  )
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

On Mon, 07 Jul 2025 13:54:08 +0200, Wolfram Sang wrote:
> Hexadecimal values in sysfs should be prefixed with '0x' like e.g. PCI
> and SCSI already do it. Also ensure the two digit length since BCR and
> DCR are a byte in size.
> 
> 

Applied, thanks!

[1/1] i3c: prefix hexadecimal entries in sysfs
      https://git.kernel.org/abelloni/c/12aa3e0cb0c6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
