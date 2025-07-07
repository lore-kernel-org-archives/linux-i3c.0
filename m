Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2A1C71130
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jul 2025 21:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJ8wWY/6mR0+dX9wVyfQb69iEh5Dt5MSkm1TUGOMDlQ=; b=iFE6k2D1VrOpeh
	ixChDuTvmD650+L9ksUcEOzSshQjvzGKkZqglO50sm+pomKg/lODRzJ1vYkrkD9ACSe909To8Vr59
	BDHo61jgf1pk1iy7ZxUrxzdFgPGg/oRcI3Ny5gCl05+CBHVRwGuyGcOISI0lfV1H+vcfetyFLLbIs
	gCCXMgdYG4Fe3SmylKIEySUEjGqy3VWHs3kpLsaovQ4rAwzWxI9AfbDGoCcjHHCmeu6b/DfZGuQ3Q
	4+OaKrqZFk+P7XYU9SB8w4u0boJhU2KWyADwGEO+zA99ERjz1wFIhZdTaUsmAYYNlya/2o0/ckM52
	fcsZAZhF/4vM6x/x8RNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYtSU-00000003dsz-0Fa0;
	Mon, 07 Jul 2025 21:33:06 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYtSR-00000003dro-1ic9
	for linux-i3c@lists.infradead.org;
	Mon, 07 Jul 2025 21:33:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC08A44509;
	Mon,  7 Jul 2025 21:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751923981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBweJfa20t+uTrC0Tbt2Zt8JsHqgLKvN87CrpIsBHwo=;
	b=hPJqPQwYTrlyIjfRu11e+URVh3HjuvfevQZ3QnX3ZjzAKE0g2BN4uSn0TNG6XcL/PyM/48
	FIQ0YqO6PxdRHrS/07ZkYJVCl3WQlzc47/tDBhCkcHHqdeBjxC9LtVtYQJ61/vkW/5OqAB
	H6XwyY5mgFHHHLFn9hC/p5tF1rg0q+3MDSaQatWiekLhvFzUo5vfjCUaheFQpjVC6934Bz
	3Oudi6cfV/uFGxS4QfjlLhdCuUTJW90ZuomkVAZyyCHyBDPARrUC+kFm9y8vYvplEcoEWW
	O+EjFylu+pkFNx9RYcmDZY8vE7GluH+zhTJKIc9Tw6Sf1FGBEpoFe4SGJeVDVA==
Date: Mon, 7 Jul 2025 23:33:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2] i3c: don't fail if GETHDRCAP is unsupported
Message-ID: <175192395158.1512350.481879161267562741.b4-ty@bootlin.com>
References: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_143303_592212_57B03E90 
X-CRM114-Status: GOOD (  10.15  )
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

On Fri, 04 Jul 2025 22:44:32 +0200, Wolfram Sang wrote:
> 'I3C_BCR_HDR_CAP' is still spec v1.0 and has been renamed to 'advanced
> capabilities' in v1.1 onwards. The ST pressure sensor LPS22DF does not
> have HDR, but has the 'advanced cap' bit set. The core still wants to
> get additional information using the CCC 'GETHDRCAP' (or GETCAPS in v1.1
> onwards). Not all controllers support this CCC and will notify the upper
> layers about it. For instantiating the device, we can ignore this
> unsupported CCC as standard communication will work. Without this patch,
> the device will not be instantiated at all.
> 
> [...]

Applied, thanks!

[1/1] i3c: don't fail if GETHDRCAP is unsupported
      https://git.kernel.org/abelloni/c/447270cdb41b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
