Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D9DC3600C
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+wb5NKFaoN+cPPMdYJOnZlORmiHpUV3rZBzNKLYGlE=; b=xtDFeJrtQXT0+5
	uEdH8ZbqefS9i87Tgi0Awj/xNtC6piRiLl2TPaibfPB+DtdNCJfYcho7vnIk9Vs7VZ0czEZN0ongY
	hPdnagtxmQaAOPtjh4CNGd5R4bY5RAXxEtz9E+N4mJChxmdbQ0g3uwXolItht1OcvmAIp0HcnYeV7
	y1viy8mEbf+YQ+3YMNkYA52P+umf782WPioMbZkTRMpmr8wThqbS7d6MnFRyOHU13suJFKxG8/o5Q
	0MxUaon0IQ/GX9dV0XifAjcfmKfHG0dgw+EAdKXnMf/Fxo3OxXIPB74Azgwfi+FiD5wShibIj7ygv
	WAOCpPoTiw1S01h/tllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBeu-0000000HXfq-31xT;
	Mon, 31 Mar 2025 09:42:20 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBer-0000000HXfE-2mqy
	for linux-i3c@lists.infradead.org;
	Mon, 31 Mar 2025 09:42:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75B9C43153;
	Mon, 31 Mar 2025 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743414133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oJlbKcu3BPrvGN6++gGbM96T4lZujRmQWOCuEpWY8PM=;
	b=brPQQZiIRHAFrQRdFOwGad/WmZbW6LmF082D/MDBeDVs6Au+x27/C4OCTB58rXH4NyaTMS
	mliCvFRicL7XJzllaZcEDBAzeGxhQ/PxduigyF2Q7bzqw3Al+XbznJL44/0WFMrXMhQei4
	/pUA+cMntQY6XZCmATXB/vOAgc99/q599dydTqVpRGF424o6zPKh9J087EG2/aFVybPWD4
	2x8JRC0noMpuUfXZhvx7eZShCfiM/RnpqYZe+B0gDNb4zDGbYfCX0m0UsWEplkS/xpXveu
	NNkjsbCtSm6a57E7TuGS43uvpB9qwlF92N2O/tF7yUUPfuVBbtxZKqNeuAsAWw==
Date: Mon, 31 Mar 2025 11:42:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] i3c: master: Drop duplicate check before calling
 OF APIs
Message-ID: <174341411812.1099775.9355586066348391329.b4-ty@bootlin.com>
References: <20250321193044.457649-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321193044.457649-1-andriy.shevchenko@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesv
 hhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_024218_140025_387C1D3F 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, 21 Mar 2025 21:30:06 +0200, Andy Shevchenko wrote:
> OF APIs are usually NULL-aware and returns an error in case when
> device node is not present or supported. We already have a check
> for the returned value, no need to check for the parameter.
> 
> 

Applied, thanks!

[1/1] i3c: master: Drop duplicate check before calling OF APIs
      https://git.kernel.org/abelloni/c/465e5486aa5e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
