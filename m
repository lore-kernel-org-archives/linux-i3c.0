Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938A2C71130
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jul 2025 21:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HyNGbwHNM0T0QApElx8FOdat/RRqnk0Vx45uLlzalI=; b=yP8UE69nTuk1A5
	uxlDxudqs0cPKoNxnHQNcyYW/vImx+n41YaXH4fbX2s0T1e0EAI9PQdLHVcYcE1BeHoQMbjoLRNVR
	2UDwuvd25CkKyv3tBFR93woInrXbElgrhURKd8h1ZCGaUAhlnlbO+ruAgXS8h5pTVlH2AYZe5BOdn
	jGhPH6l+mY+a77AOO0DzAmeR52mKJDV7U+0ftfeX2JulfGCbhyGRAAn+lKa9cigp0Io2+ZPCOQB6K
	IOhvgdHvEALQ5Oek/TP3mHR4YxfPunY4nLhwVNBmgT+8wc/u4rP1LIbT10zur2rTFhlXDAZd8nONw
	3RC9xtRCVP8XjetweO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYtSb-00000003duY-1YMS;
	Mon, 07 Jul 2025 21:33:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYtSZ-00000003dtp-29er
	for linux-i3c@lists.infradead.org;
	Mon, 07 Jul 2025 21:33:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AAF9443A6;
	Mon,  7 Jul 2025 21:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751923988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wF9T5KF4a/pfoXzVVeDt5eIL0fx4LrdhEcNot282U3Y=;
	b=eF1H789LWdKyEC+U+X7xJH7w2yel2GEAmOnEuf8a4nzwwxmI0pSQtW8j1kitjfKMTa+dWG
	wqs9NS3AXLcMLEy1qc35jR4atw7u1+AXlMDvUM2aNZG8KNI4iTFfRHa53HD6An3lVLDYDW
	bSqu5Dk4/toAlrl7Z9lg2GXPYdxB7BKLORupUUleb1VfiC01vX24i3zJ+DGJnxVgRYktfl
	f85iD5WHdfYdvSvbVhoGlSwQ+93JLOig7Yd55spUMq8ePoMIFWxJY+XoRRcVLskR3KcKZC
	z5DhJMkVFlDM91F9aaDg+Lq/8AHuV0xvXCYZZnUHXDqG3lfe9hQYoxY4rBKjcg==
Date: Mon, 7 Jul 2025 23:33:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v3 0/3] i3c: replace ENOTSUPP with SUSV4-compliant
 EOPNOTSUPP
Message-ID: <175192395159.1512350.10952477252278524810.b4-ty@bootlin.com>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehpghgrjhestggruggvnhgtvgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_143311_698180_54DC5B13 
X-CRM114-Status: UNSURE (   8.56  )
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

On Sat, 28 Jun 2025 21:20:27 +0200, Wolfram Sang wrote:
> Changes since v2:
> 
> * updated commit message again
> 
> This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
> code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
> probably will get one. So, let's convert these error codes now, before
> it will be forgotten in the future, and they could slip through to
> applications.
> 
> [...]

Applied, thanks!

[1/3] i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      https://git.kernel.org/abelloni/c/d10a4c323883
[2/3] i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      https://git.kernel.org/abelloni/c/566aebedee37
[3/3] i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
      https://git.kernel.org/abelloni/c/8d53c0d645e3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
