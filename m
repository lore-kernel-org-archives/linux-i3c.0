Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E36E77188
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jan 2025 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1dF1hHNXRXpfyDqqw+IaRPWgKaz50Cc33KoaXKTX6g=; b=LuhbM9pEt5z/rM
	vOztGcL0yQFBe8BxRSxEgGFAzb7BU+q5y3qlKmCsM52rojdWL3ZIXJDwOn653A2WNwjZZnn8DZQps
	y65/EvSdK5Z/QXjBMf56NOZEZ1blbsRd7h6WGfY2Fvgm9uSr1dHpX0LHV13b0jnes0rJ8aUAqj7Fv
	IqCNhRUmcz6/e76w+O3hbfa3EhI5idyu1trbHCjVoMq82NvnRxzDbzxocWB91HOQ8/myf2y4tgNfe
	FjGtsZvLohXmx/hsoRIm2nx3Re580FdUX5r/ACIthKlJ26itHNKBOcPogtQ3MO8YB55RPw2IZ2BpD
	isEyWKWMiPL9ytrIJNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpt8-0000000E6KU-0zBH;
	Fri, 03 Jan 2025 22:11:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpt4-0000000E6Js-1vh7
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 22:11:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99E77240003;
	Fri,  3 Jan 2025 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735942278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GaSREVRzVYthKaZE68U4n8LRcINBttytqwCKxG8ViTM=;
	b=m1hFBvpWXs73YbT5FbJt1hzxAPgE8ZVrKXtPs1bBzlFUsqZ+lZHRQX0zKPY6ShSBA33M94
	nCxVfxjM17TQIfeh8I0ZTsjdcoHWusCnifqQQkD7FNdDq+gY+MI7UPHAy4RuRC1/PLgbXW
	plqeNMtf/1nHQsr4wWynzN8RNOtlMhJntzpH6OdRLp/V7y+EhqL4meHpiyaT250GDJn3qS
	m2vRCXxR66jEw3eNN+mVFwAA+dp31daWFqYpfrJo8AC+IvXl5qzZoZ0B7ZMqujNpFwosFg
	U4LXIYARXZCr4y7LByWSLdz+GbsUUBSwIoBslGph0yVY2dkoV4n1gMMg50iE/w==
Date: Fri, 3 Jan 2025 23:11:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <20250103221117bb066057@mail.local>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_141122_764688_07B1F245 
X-CRM114-Status: GOOD (  22.56  )
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

On 29/12/2024 11:12:28+0100, Wolfram Sang wrote:
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
> * added tag from Guenter (thanks!)
> * rebased to 6.13-rc4
> 
> Old coverletter follows:
> 
> I am currently working on upstreaming another I3C controller driver. As
> many others, it needs to ensure odd parity for a dynamically assigned
> address. The BSP version of the driver implemented a custom parity
> algorithm. Wondering why we don't have a generic helper for this in the
> kernel, I found that many I3C controller drivers all implement their
> version of handling parity.
> 
> So, I sent out an RFC[1] moving the efficient implementation of the
> SPD5118 driver to a generic location. The series was well received, but
> the path for upstream was not clear. Because I need the implementation
> for my I3C controller driver and I3C is a prominent user of this new
> function, I got the idea of converting the existing I3C drivers and
> resend the series, suggesting this all goes upstream via I3C.
> 
> Is this acceptable? The non-I3C patches have all the tags they need,
> only the I3C patches would need testing on hardware.
> 
> A build-tested (incl. build-bots) branch is here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i3c/get_parity
> 
> Looking forward to comments...
> 
> [1] https://lore.kernel.org/all/20241214085833.8695-1-wsa+renesas@sang-engineering.com/
> 

I'll apply the series once you get some agreement on the function name.
I don't care to much but the _odd suggestion seems wise to me.

> 
> 
> Wolfram Sang (5):
>   bitops: add generic parity calculation for u8
>   hwmon: (spd5118) Use generic parity calculation
>   i3c: dw: use get_parity8 helper instead of open coding it
>   i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
>   i3c: cdns: use get_parity8 helper instead of open coding it
> 
>  drivers/hwmon/spd5118.c                  |  8 +-----
>  drivers/i3c/master/dw-i3c-master.c       | 14 +++--------
>  drivers/i3c/master/i3c-master-cdns.c     |  3 +--
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +--------
>  include/linux/bitops.h                   | 31 ++++++++++++++++++++++++
>  5 files changed, 37 insertions(+), 30 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
