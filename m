Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C244CC02193
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2025 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=106fjio6tP/0rltWviW/1FWipTfT5IX65YXgDvEuN1w=; b=SH0IHajf89vUWb
	GNHj2UCaaXfGfF1GU1CEiyUGsYeqR5LAnnn/O/QUeyeSdkelbR6MbowoFLRmNqB8Uvf7dq0mQKwQs
	bjSf0Jyor6l1HAfId10VO+aTr3pjhVFZOzfepzwg9wBhVuOxBcpXXK3OrhdgUsmlFDchZ2FmsmRYr
	x7FyCPZN6HLDolj7bf2swwYr5me/9nz3cyAYQ/DhpQxb/HrE14xDTBpWAtre1s9/tAxfmaVRXZlX1
	xzsW1PknmpFzN5x99RAwqIHBOFhr4lmLsfw0YgqTVth3Xk4rN5Hg2fKjDgUl3Wr3egNVVQn+ix0UT
	XLjrf5Crrb2myxCF/d0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMEJ-000000011Jq-1piu;
	Tue, 04 Feb 2025 16:56:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfME6-000000011Ec-3P4U
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 16:56:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 445A244417;
	Tue,  4 Feb 2025 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738688179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yISyECt6ebMIFMXO+V2Q2GFUBfI2I/MCGAr0MqWb81Y=;
	b=WPCEQvnNqsA999cq4xjvpIt1sR/ohh8NNx+sl36igxrh+OXlSfYrzITu6MwvIDScuuUxgC
	9qysoQFadYkIJlRVAX2Wk14KSi9lg3fFhyZrewSQ0LUfnX2G1oinknIBBO6LL/Aq3mc3Sr
	aazYCOPoCiMkYM7gFtJUt7n/34lDJoBQnJo9tocfpWc1q3LUqZKPcfrcNnQk/eXCWFI1l9
	5AhBflI1N0DPgaLiACb6BcCMDhlVaaej+HOnMcw97MVvhufxF54I/nQ6qKxv3aK2R8DK1X
	Tg9avsjgNuKzh5oG5+DpOcaXAmrZsl1PNx5fArQ5o0ZTWmOCTojhuZIBqfEEmQ==
Date: Tue, 4 Feb 2025 17:56:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
	"pgaj@cadence.com" <pgaj@cadence.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"aniketmaurya@google.com" <aniketmaurya@google.com>,
	"Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>,
	"Guruvendra.Punugupati@amd.com" <Guruvendra.Punugupati@amd.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <2025020416561726c9efa0@mail.local>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
 <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <f05fb969-0632-48a6-afcd-c526c8568d4b@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f05fb969-0632-48a6-afcd-c526c8568d4b@t-8ch.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduvefhvdehlefgieelfeetudeugfehgfeugfekleejueefueettdffueetiedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheplhhinhhugiesfigvihhsshhstghhuhhhrdhnvghtpdhrtghpthhtohepsghilhhlhigpthhsrghisegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhop
 ehpghgrjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrtghulhhhrghnvgesshhilhhvrggtohdrtghomhdprhgtphhtthhopegrnhhikhgvthhmrghurhihrgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepufhhhigrmhdqshhunhgurghrrdfuqdhksegrmhgurdgtohhmpdhrtghpthhtohepjhgrrhhkkhhordhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_085642_977101_92247D76 
X-CRM114-Status: GOOD (  18.51  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 04/02/2025 17:50:14+0100, Thomas Wei=DFschuh wrote:
> Hi Billy,
> =

> On 2025-02-04 10:09:31+0000, Billy Tsai wrote:
> > > On 2025-02-04 17:17:01+0800, Billy Tsai wrote:
> > > > The change is necessary to enable the use of the
> > > > `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> > > > `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` fun=
ction
> > > > ensures safe handling of I2C messages when using DMA, making it ess=
ential
> > > > for scenarios where DMA transfers are involved. By removing the `co=
nst`
> > > > qualifier, this patch allows drivers to prepare and manage DMA-safe
> > > > buffers directly.
> > =

> > > This is missing a changelog to v1 of the series.
> > =

> > > Also I asked before why it is not possible to change the signature of
> > > i2c_get_dma_safe_msg_buf() to accept 'const struct i2c_msg *' [0].
> > > That looks like the nicer solution to me.
> =

> > The i2c_get_dma_safe_msg_buf() function has existed for a long time,
> > but I do not know the original reason why it declares struct i2c_msg *
> > without const.
> =

> I would guess that nobody ever cared before.
> =

> > However, I believe this is because the
> > i2c_put_dma_safe_msg_buf() function modifies the buffer data, so for
> > consistency, it is declared without const.
> =

> IMO that's a weak argument.
> Maybe the maintainers have a preference?
> =


I guess Wolfram will be the one have the preference, I'm fine using the
existing API as-is.

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
