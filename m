Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3E7CCFA1A
	for <linux-i3c@archiver.kernel.org>; Sun,  9 Nov 2025 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+F2N1yxAE3ECalWg/VPJh0APRCVJmQEnPbrYYoat3ls=; b=b3OPFfgQ25xu66
	e8uMc9XeZ9kDNCL2+drEzL4RpZwZjpQBMbvoo83bxE8yxUFH9jVzTGhp3OHeapYWJ0UEfIcShWcDA
	ZEHj2j/C3WAJt8c/Zf78mdrFWzLTiSmXcPRa/0zM3weNdDK+pckFXNF1n315LFB8mthSoKCbtA1yw
	HFCGUqCT7BfVucYzU7vfDwTbGfipVjUQyc48gdxV7NwhNNW+5QVMnca+pahE8y+2KTZ+9vY+JPPr/
	h9nYz9GlLOT3lNiOuZS1TQCs8xcXhoBVV/yu9/U349L167EBqVi7MTUAWBhbieSLGxAg+4A54ng8l
	YdrYcPNlMURTCHaFOlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5vJ-000000043Hw-2m72;
	Sun, 09 Nov 2025 13:57:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5vG-000000043H4-274K
	for linux-i3c@lists.infradead.org;
	Sun, 09 Nov 2025 13:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B905140B01;
	Sun,  9 Nov 2025 13:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4CBC4CEFB;
	Sun,  9 Nov 2025 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762696657;
	bh=sqCExe7TvzBIlrizfDnjeq9qTbAz4DDhCt3BiP31r3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aCF42VMgrNTEJSwJI9nVyj1xVoa9C8Ec+DDNCfCCVvK2K2Hb02oAAdYyEU/c+N7Yo
	 0WTZXStAS8Ac9tB1HMeeA55W61N7L1JuQlzfSuk3o4zaA/JdY8BVk2TYEMW3AqerZL
	 /Cn0lzdAzictXV6gHm+jrUTcl1Rf1J/N3RCfdI/NeLle9maxwPjcOlj04S4XyJ0IIK
	 6nk/7EceagZuwTL6FFJN3Pta384gOpOjA0T3wwM5KVL9ROaUxXKBCHyKTBzLRviK4D
	 wQ6a+wdYk0EoOlMG9kiPpDHSomklmr/jSd0Z6a2yu6jJQQnILF7KOOThgrIq1sbX0i
	 WGiAHXPaayIzA==
Date: Sun, 9 Nov 2025 13:57:28 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
 devicetree@vger.kernel.org, linux@roeck-us.net, Carlos Song
 <carlos.song@nxp.com>, Adrian Fluturel <fluturel.adrian@gmail.com>, Andy
 Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v11 6/6] iio: magnetometer: Add mmc5633 sensor
Message-ID: <20251109135728.223d3857@jic23-huawei>
In-Reply-To: <20251106-i3c_ddr-v11-6-33a6a66ed095@nxp.com>
References: <20251106-i3c_ddr-v11-0-33a6a66ed095@nxp.com>
	<20251106-i3c_ddr-v11-6-33a6a66ed095@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_055738_603974_72C1D932 
X-CRM114-Status: GOOD (  10.45  )
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

On Thu, 06 Nov 2025 12:36:05 -0500
Frank Li <Frank.Li@nxp.com> wrote:

> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.
> 
> Co-developed-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Co-developed-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> Signed-off-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v11
> - add andy shevchenak's reviewed by tag
> - use unsigned int for regmap
> - compact mmc5633_read_avail arg list to few lines
> - move check condition to one line for read_poll_timeout()
> - leave i3c_xfer as size 1 array to align existed code style in kernel
> tree, git grep -r i3c_priv_xfer drivers/, leave to jonathan to do decide.
I don't feel strongly either way, so fine with just having it as
you have it here.

I'm assuming there will either be an immutable branch that I can
pick up to get the i3c changes, or that we'll split this across cycles
(so i3c bit goes in this cycle, driver next).

So I'll keep an eye open for how that part merges if everyone is happy
with it.  Feel free to poke me if I look like I missed it.

Jonathan

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
