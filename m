Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D468C02196
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Feb 2025 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9jjLXSzk72Xf0ZKBxlDm2whcq3purusEnSfswaJRXQ=; b=GgRkV3bqGsc79Q
	zBLAnu0HAaY0+/Dc7R4CuUrL6KWoJu5Y4OCtp4e/3vUusQggfKoFoki+bj+n3jMW5b+CCTa90yzXp
	q+VWxIYgI0MU6NCX1Pmlr1f3cNL17tNjwoRWUQnYY8P/xpt/N142Yj2mtaW0D6uK2QhVfCr3xNx0z
	G2f0nGLSPBnDARWK1GLynb5e8RvGJP6578q2Q9tcDP2wkZtvlDWTTak6vrGgv4kUKINuWu9ghJrJR
	atm4yQBe/oos3A3Q5LFCHSW95+51PseIB4sJYGiD1Txya1VpoMqllX2heKTmPS03TqPOZLM+yjPWR
	H+kOi8TWGFkEkmcec3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL7P-000000097pk-16OQ;
	Fri, 07 Feb 2025 09:57:51 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfM7t-000000010PZ-2iXs
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 16:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738687815;
	bh=Sf3PNexg95sapIEeN1jpmuPLmjmuORMj48u5SXvH3zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ss/DdBOuSN7hk6hl3jkuiofAQMF3jfP8z7cGmp/abgAww20ttNW5Zb42qPZgszyiz
	 GZ+JUZTuJZIeXALmPFYXZkqtfPt5Mis6HFiXCJ2JYjltUJLaaEdyZrlQdz0ZKMjUqn
	 3iltZLlGCJi2/QS3hkbm5ovvp5MDJ2xaJ9gRYbM8=
Date: Tue, 4 Feb 2025 17:50:14 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"pgaj@cadence.com" <pgaj@cadence.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, 
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>, "aniketmaurya@google.com" <aniketmaurya@google.com>, 
	"Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>, "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>, 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, "xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>, 
	"Guruvendra.Punugupati@amd.com" <Guruvendra.Punugupati@amd.com>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <f05fb969-0632-48a6-afcd-c526c8568d4b@t-8ch.de>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
 <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_085017_828277_9450C7FE 
X-CRM114-Status: GOOD (  15.52  )
X-Mailman-Approved-At: Fri, 07 Feb 2025 01:57:50 -0800
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

Hi Billy,

On 2025-02-04 10:09:31+0000, Billy Tsai wrote:
> > On 2025-02-04 17:17:01+0800, Billy Tsai wrote:
> > > The change is necessary to enable the use of the
> > > `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> > > `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> > > ensures safe handling of I2C messages when using DMA, making it essential
> > > for scenarios where DMA transfers are involved. By removing the `const`
> > > qualifier, this patch allows drivers to prepare and manage DMA-safe
> > > buffers directly.
> 
> > This is missing a changelog to v1 of the series.
> 
> > Also I asked before why it is not possible to change the signature of
> > i2c_get_dma_safe_msg_buf() to accept 'const struct i2c_msg *' [0].
> > That looks like the nicer solution to me.

> The i2c_get_dma_safe_msg_buf() function has existed for a long time,
> but I do not know the original reason why it declares struct i2c_msg *
> without const.

I would guess that nobody ever cared before.

> However, I believe this is because the
> i2c_put_dma_safe_msg_buf() function modifies the buffer data, so for
> consistency, it is declared without const.

IMO that's a weak argument.
Maybe the maintainers have a preference?


Thomas

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
