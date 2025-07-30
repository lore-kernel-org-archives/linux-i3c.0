Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF244C87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2+RIKmnCtjuykYkNH3f0Ql4VXRub66fjXxdtrJyE/0=; b=VOoy0cGmYhzDKJ
	HxZnLMBH9hK6Y0aH9ekwdIuEc+/HZQ2mwNb2bsllT7IyQ5sqLKtZzXRC5/JkDV1EXoVZzGv9gJ7GJ
	fXsUAWNiuPnUT40v+B4qJtxArsA7DOUYkJcqNo0QD+mJPQ4Vu2taZFSljS4yoV8d2bCWidQPrX0vv
	6yNcDGjdI4HrWNMGvg2jXGaWmyGUuWe6O+lCrKqqbzZI4ZhbRtscKo6ZfyHT9oGIRRlQhKC2TOm9X
	JH1/hNcZ9z1jZCQ9ZDgi+n6zX4NsAyxXIIX9K4hRIvG6qJD6/UCHcZJT4WEL1QGcEs5Et4VnXI1Q1
	quU7w/p2r9eBxzFZB5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPD-00000002cIH-21pT;
	Wed, 30 Jul 2025 23:40:19 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPB-00000002cGk-04lj
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 23:40:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A12F44952;
	Wed, 30 Jul 2025 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753918814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/7P0dyH/pOtJmRxErXBoF32ZKspF76xArSucRBMQX6Q=;
	b=WSbJN+7kF+EAffJb9AgMj5S8tFRIJr9rN7MCbaa9eOtm7O8Qmxas39cbOWWTxRu8erQfE6
	WtlOqdkLdQJPn38dEji+ngx1CINBce4Nu5/ePX2yT576o8zHHSIv9LcNI1rYAjCS37/EI6
	TU4cvpdkHcKpZsXgXUyPC05X/nrqmThoKDL5il6vU36kAfJUy3bZV3/UGIojDPFjXlW6Ju
	sct7hidh1uGWAy4uAStSgPdJIrxpghEvkB6h2VRmInyw7XTlF1ELW65PAvD7B23yuIZb1S
	ygjJv3xTeaEag6RBdBSbof9XxkQoUKmNYo69lDlrEFi7p/TxMX4nAPdGairdaQ==
Date: Thu, 31 Jul 2025 01:40:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux i3c <linux-i3c@lists.infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] i3c: Fix i3c_device_do_priv_xfers() kernel-doc
 indentation
Message-ID: <175391871293.1768453.17733730454995814545.b4-ty@bootlin.com>
References: <20250702040424.18577-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702040424.18577-1-bagasdotme@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelledvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfr
 hgruggvrggurdhorhhgpdhrtghpthhtohepsggrghgrshguohhtmhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_164017_212305_708A0362 
X-CRM114-Status: UNSURE (   7.33  )
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

On Wed, 02 Jul 2025 11:04:24 +0700, Bagas Sanjaya wrote:
> Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
> value list:
> 
> Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]
> 
> Format the list as bullet list to fix the warning.
> 
> [...]

Applied, thanks!

[1/1] i3c: Fix i3c_device_do_priv_xfers() kernel-doc indentation
      https://git.kernel.org/abelloni/c/ba12d5f11d52

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
