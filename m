Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A05BEB64DD
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Jul 2023 21:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5Y7NAaCAApyPWCl5IEs5Kk5a50U06/XK+DzPPvLCaE=; b=kiKKWHBWMgW6La
	OkoEOn5Zcv9921FMbOa94GczyLEDEZ6JuBZTEohU2njEcyyjftEXM7VxO3ciFYj4BH9GBl93vohbm
	oDjFagUhlfo85JHPgEa6PcsqzvLyZzQA9Q7hTH1Kjc5IV4jIs+D4flOA0yUowuy+cnO8rV7ILA/aT
	lKNaRb1GT3QTv0pGiYyYHoBQT15YBY71oCHf5QZWykjr/hsj6vhiEMHfKnjVaEgIZo6rCjsGmfcqw
	wX6w2thmvLc8Fogbf7RaltkX3q3dsDtyMImwVZBVyak1ouezdT5p22Fl3U90tm0x7kpXwctatTyE9
	QiuIpmaSZLCJQZZJ75kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8Sz-000bjw-1Z;
	Thu, 27 Jul 2023 21:24:13 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8Sv-000bj9-2x
	for linux-i3c@lists.infradead.org;
	Thu, 27 Jul 2023 21:24:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91CBF1C0005;
	Thu, 27 Jul 2023 21:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690493045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ORG5dgngYFtAHPnQ7QoUeAEsgIr39oZ6NJsu8Dq7mTE=;
	b=JfdcVMrkwF8LPNEFSZlrmHDMYc44jjXYx8n4Dkili5JJjEx6z1mK2kDcn/SC17urFbpDVD
	vtGurY2uGg9NmQub4ZHVnhkxmFQPibHcVsjj2Z0a+qkm/XhXB+RdQmiksZoL/PIxKGgzDG
	muG1X1bTY1s+y3MiZh2kN2l9smQtNJKaSppuSTbWR5TUBvb986xYoAdbU9frWHB96oQghO
	GWjAtCkt4cduhkJ3+KwexJpPHPoEAAjaIyLXEsoGiIsKnipakulHwyl06kRABQGOw8F8yf
	SiGKuc73yWop4E94rjQNfOKYbJf90Go5cPKtPmp54IPyhFrIFspJibmB7s9tXw==
Date: Thu, 27 Jul 2023 23:24:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Explicitly include correct DT includes
Message-ID: <169049302660.636147.12256189755653244870.b4-ty@bootlin.com>
References: <20230714174623.4057784-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714174623.4057784-1-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_142410_103437_7380F108 
X-CRM114-Status: UNSURE (   8.17  )
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


On Fri, 14 Jul 2023 11:46:23 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] i3c: Explicitly include correct DT includes
      commit: 574ca75f8d2935053872aa1b15d8ba24bfb5e51c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
