Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F13C021B2
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zOjqbZz1Zv5y+9uIWvKASjS5Zj6LemB0I7NadXq8Y0=; b=LrXqtOGlSAVrm/
	SsC6VhmY/YA44iLGEgFy5IGTvG5eaNAJA7e5WpaX79nV/0yIW8wR4wJYoE1K17p7lvVlnjgMNor0d
	sGuJMyH9jZcFZg9ZSBr5yfdFRCtcwN47zmTJT5iBeuAH+2R0Tmajtipm2pZTAeIo7KFC7OqBCgHia
	LGh8aTxJRDkTFJnP1sG3IKLQTgtZH9QL2KWt7WYGb+l+p3+6rePGMXwSKl3O4pQVHZ1NmVHqW63mZ
	qVmGZStY5zGJQWet5EJU0VEnX6ONSSq8LHCzkhHapMLed/oOvHD4etO2L+5w1cZmnjI80QhKD+6QL
	WcTQXJviImDeeTSGcGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEwc-000000038Dp-16Jv;
	Thu, 20 Feb 2025 22:22:58 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEwC-00000003875-2s36
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 22:22:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 915BF4431D;
	Thu, 20 Feb 2025 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740090151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5s5UwLG6TyX2xyddRb3emz94Dnuso5d43K0ObrbLrs=;
	b=lF9PdIdfHxNQEwF/p7RZ97QSp71uS5MXfmHhos5q6lR+DXfbL6sv0el0r8ruXrxu57uc+r
	7Ucs8MUReNcZcJMUi1xHX3DkO5Zj8S6fEIonO+lLD1ITYGFY/XqhEEKCnEYK7BlGP2Y+Ud
	Fl4on8SlfKE5IP43Sih9aUkjAXz7xHuqqEiEF6Ys/w+ro+5UES98LTg3t/oGpMK+OXSub3
	g942dbXxXHuOChNRkg/veGNKqRGknGnr4PfrBOzK7pEvI2f6HE6UrJSRlBKMMSEBm+KBw5
	WrajnYtAVXVJBpKXFglIwSUPk5YtBpFAzl/q+aLNfEX+d61od8zFQdwd4KccjA==
Date: Thu, 20 Feb 2025 23:22:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: arnd@arndb.de, bbrezillon@kernel.org, boris.brezillon@collabora.com,
	conor.culhane@silvaco.com, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
	pthombar@cadence.com
Subject: Re: [PATCH v2 1/1] MAINTAINERS: I3C: Add Frank Li as nxp I3C
 controller driver maintainer
Message-ID: <20250220222230954f57c1@mail.local>
References: <20240815141609.4089406-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240815141609.4089406-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjeekudeludefudfftdeuleejheeuueevfefhhffguefhheejkeejhfffhfetueenucffohhmrghinhepfhhrvggvnhhouggvrdhnvghtpdhinhhfrhgruggvrggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdpr
 hgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghorhhishdrsghrvgiiihhllhhonhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegtohhnohhrrdgtuhhlhhgrnhgvsehsihhlvhgrtghordgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_142232_852032_F860DC21 
X-CRM114-Status: GOOD (  14.88  )
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

On 15/08/2024 10:16:09-0400, Frank Li wrote:
> Add Frank Li as NXP i3c controller driver as maintainer and add mail list
> imx@lists.linux.dev for it.
> 
> Add Frank Li as I3C subsystem reviewer.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied now.


> ---
> Change from v1 to v2
> - Added to exist item
> 
> Recently, I submit many i3c related patches and become familiar with i3c
> protocol. So add me as svc-i3c-master.c maintainer.
> 
> I reviewed other i3c patches. So add me as i3c subsystem reviewer.
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b96899a78890..077e37eb018ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10708,6 +10708,7 @@ F:	drivers/i3c/master/dw*
>  
>  I3C SUBSYSTEM
>  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
> +R:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  C:	irc://chat.freenode.net/linux-i3c
> @@ -20961,8 +20962,10 @@ F:	drivers/video/fbdev/sm712*
>  
>  SILVACO I3C DUAL-ROLE MASTER
>  M:	Miquel Raynal <miquel.raynal@bootlin.com>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Conor Culhane <conor.culhane@silvaco.com>
>  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
> +L:	imx@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
>  F:	drivers/i3c/master/svc-i3c-master.c
> -- 
> 2.34.1
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
