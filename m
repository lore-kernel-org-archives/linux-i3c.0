Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80774C54FB3
	for <linux-i3c@archiver.kernel.org>; Sat, 24 May 2025 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aNZ6ec5ujahUzVxgn1Yk2IcVJv9ADWDFQ9Z49lSCQc=; b=1PVEb2MzcW0vDv
	xt122d+fDPGk9Yzbj5El2DQ1if/FdQPwO507PW239hpkxy5utYbRQ7jUlzZafxSa/W6dVt9pu0EdT
	BzAege6/JQ6AVNhEpj5ci9ZVYLWzq32e8Z62EYTbRwPoVi7+6c8mqX5S2h8KbUs2PZSWxWNC1N9kv
	FUTloIfY3mtIdodrD64SvlwRcV4gW6cvu6AQC+VhQEi66qg88JoHdLfFfaRRpiZ3gjWClbDg89xHc
	A7Ia/LmeS7o9/eA+GwZx1A5DYfbzWRH9F2rmbbGenGQFNV163zHwuFH5MrhkPBa2Cs9msx3Xnw4qV
	yfXC9rbOKZAUe1BWsSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIvru-00000006GKT-0YFZ;
	Sat, 24 May 2025 20:53:22 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIvpw-00000006GDR-0fNt
	for linux-i3c@lists.infradead.org;
	Sat, 24 May 2025 20:51:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD0FF44395;
	Sat, 24 May 2025 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748119877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tev4I7axldqOJyE6k/x5JIQl8PwYpJDfk3A9gUlwqNE=;
	b=BEhr6zcf8zg81bLnGA3BfqnhbHMIREPiDUOqGrfcqHEpqzj3seQNk2CS3rJkTnAhiGLdEg
	MBRb4uA2oCPHS2UIIOW+MNkKaRIYUcnLntgsSlqWFRqHuIqhFDaPwfBU1eLc/hPnIJEklU
	nCuO3x7k2SiMOlMg6e6v8Jm9o3HNs7tur9h5BpSEYDf97RZMIpioQEZgiZ39yaGr4i1RTB
	IPgIh/jQaUiX2Bc3+cG2I6mtK4W8/5byquaKHudNTefRtSo5kMM++JIwdRrCioeoZf3CuF
	QQJIjSx5OBiBLICngfLgOzDK5jGCQBp0TXrpGR+8ls41owT17k9NcswvsSwQCQ==
Date: Sat, 24 May 2025 22:51:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: controllers do not need to depend on I3C
Message-ID: <174811981014.1255947.11041838527327968781.b4-ty@bootlin.com>
References: <20250506075247.1545-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250506075247.1545-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdejtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsr
 gdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_135120_324448_EE2BFF26 
X-CRM114-Status: UNSURE (   7.02  )
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

On Tue, 06 May 2025 09:52:11 +0200, Wolfram Sang wrote:
> The Kconfig file for controller drivers is only sourced if the I3C
> symbol is enabled. No need to check for that in individual drivers.
> 
> 

Applied, thanks!

[1/1] i3c: controllers do not need to depend on I3C
      https://git.kernel.org/abelloni/c/00286d7d643d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
