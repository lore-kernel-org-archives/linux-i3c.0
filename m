Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8902AD68BDA
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Dec 2025 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0diHe3Ji8yHtPo1rNTSwqkOm+8ZFcmmw1UbI1XegAU=; b=shG8ZxXsAIDE8c
	6ol/GNImMdZ61LIkXI6BjExRszAHdb5IBgliIHHRELbNKDNspNfUTQxlmtmp+32Cfz0HJ8jVS3mUQ
	xmLrIS/6ER4wcF7orhZr7piQn3T4kReJwvGKwdrUqPxY26S75amTn1aDBl5EFWfHXurbgUWVBnrL+
	j0eqHV35qD3/JgTQhcp14SJdRJWi6GYf6x7MVfFqD8jy10aQYhge8rVgS0nDixa0sFzvXJ0NX/wJT
	rSrenopV8y9F+ZY1gGZt24Qg8PO01K9XZzFQYqqju6ePtP4AHY3OtXIRq7zuOHnVxUY9vgkTvm8wU
	PNHp+LhIfGPTXiHp4EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAxw-00000008CUf-19ZF;
	Thu, 18 Dec 2025 10:10:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAxs-00000008CUH-1QFZ
	for linux-i3c@lists.infradead.org;
	Thu, 18 Dec 2025 10:10:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5140C1A5AC;
	Thu, 18 Dec 2025 10:10:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FAC9606B6;
	Thu, 18 Dec 2025 10:10:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3913E102F0B35;
	Thu, 18 Dec 2025 11:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766052628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=aO3u3ejVDuiMShV21LEf8qEp3E0KkHu3ersORiBehYo=;
	b=Gljlr9qDSS1/Gj4pw5zXrFzy1YL53sD3GN1zjdWZjbGON7nln+uq/9x/2PpstZcxSrQuR1
	3dnOrS0pBZaf3eg8tgbsv/begC9SAbs4lplOOY9uOAqsLP7+9d1HsFe6771y7BLPwJFZkn
	a/4OMdYCRBemi+S6g0tINiOJutdcrtBGUWJy33bBZASENhXnWvaqkrriXNjfzmHdvlzxs5
	yCckCm6VciJKjrIBhsHmABBIJ+84V0bUNbt1NKnH1J5J/ra1g9J5oWDyCFJUp47xm1OeNs
	v+uzDWcDm6jwem6XE0h2vycLVqofp7iahE05saicu4FG3IWB98rWtJ7e77xD1A==
Date: Thu, 18 Dec 2025 11:10:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, linux@roeck-us.net,
	Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v11 6/6] iio: magnetometer: Add mmc5633 sensor
Message-ID: <202512181010210ddb2a03@mail.local>
References: <20251106-i3c_ddr-v11-0-33a6a66ed095@nxp.com>
 <20251106-i3c_ddr-v11-6-33a6a66ed095@nxp.com>
 <20251109135728.223d3857@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251109135728.223d3857@jic23-huawei>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_021032_934909_89D9933F 
X-CRM114-Status: GOOD (  16.59  )
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

On 09/11/2025 13:57:28+0000, Jonathan Cameron wrote:
> On Thu, 06 Nov 2025 12:36:05 -0500
> Frank Li <Frank.Li@nxp.com> wrote:
> 
> > Add mmc5633 sensor basic support.
> > - Support read 20 bits X/Y/Z magnetic.
> > - Support I3C HDR mode to send start measurememt command.
> > - Support I3C HDR mode to read all sensors data by one command.
> > 
> > Co-developed-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Co-developed-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> > Signed-off-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v11
> > - add andy shevchenak's reviewed by tag
> > - use unsigned int for regmap
> > - compact mmc5633_read_avail arg list to few lines
> > - move check condition to one line for read_poll_timeout()
> > - leave i3c_xfer as size 1 array to align existed code style in kernel
> > tree, git grep -r i3c_priv_xfer drivers/, leave to jonathan to do decide.
> I don't feel strongly either way, so fine with just having it as
> you have it here.
> 
> I'm assuming there will either be an immutable branch that I can
> pick up to get the i3c changes, or that we'll split this across cycles
> (so i3c bit goes in this cycle, driver next).
> 
> So I'll keep an eye open for how that part merges if everyone is happy
> with it.  Feel free to poke me if I look like I missed it.

I guess you have seen the resend by now but I took the i3c patches quite
late in the previous cycle so I didn't bother creating an immutable
branch. Feel free to review and apply v12 when you have time.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
