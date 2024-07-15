Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E4BC3DA4B
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Jul 2024 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqKRFoR0VRyB6MHOEwxt7waIoD7u7yoMCRK6onEwqHY=; b=CMGsP9j4fDoedR
	L+qQ+JAkwAHumMw0w+gZTpfdTTSRitIn+Wgpe/6WSVV1xzYTSa8TNAVKZyprApf43tI+eIxmfqDSg
	AoY8BVVQpxMzgZwQKrwzirvQyBescb4/0RbBPeXmJM3JQKkCJ4+l1w7WRH+CNpXjWlY3HvUkCKxSQ
	rOmaqw4aCqfvtGIGBUcby5j9CdeFAz6KGQUkY6vlhApH5nIrE1GNEPvFMhPGO4Xt/WksJerwuadN+
	Gxn3J9qjONdIga6zn1PDoTul5DUnP1SJajZITQCVxLHZWpOPGlf68o1lt7X5JoJ7J9ta5MtnJW7Wm
	2f4/EIkkkIynpduoydUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTTYB-00000008VqP-0FAF;
	Mon, 15 Jul 2024 21:48:03 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTTY6-00000008Vpc-3PwG
	for linux-i3c@lists.infradead.org;
	Mon, 15 Jul 2024 21:48:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A512FF803;
	Mon, 15 Jul 2024 21:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721080075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zZWHkYAhmm9sap+J3m50GOaykeOKhvg1nFAevKjiahE=;
	b=EO2E4WTbupa83xHEnq53afDnng5ZMjRjBt0Fja4Ee/I8H8GQDkax7ZNMYiodBEW3627ytD
	ldADDuGtYQofJIfLimQHDfKQP21dps3igSPrrzRamSzxoX+IFLNZ325+T0AU5xnTBlQyWD
	2PwTiQJayzq9gNOSHF/XJEwhsoJuRWhgcXk0CPAgE8NxfjB+w5zjBDI46EgK0/RQQg/H+0
	dN3gExhzkGY8hMGVqjU8ilqQ72PLy6Iwl24o84EuxeP9wNCiRHplE8aWhkDfBwCcvB2wiF
	nZ1Cwbr7BtyJlDEy493sSxE480atHkOwu1gSb8bHPiIZmMJpzvpCTdcgBTMFAQ==
Date: Mon, 15 Jul 2024 23:47:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	vamshigajjela@google.com
Subject: Re: [PATCH 0/3] i3c: dw: Add support for power management
Message-ID: <172108005329.1453338.15447064873136258175.b4-ty@bootlin.com>
References: <20240708062103.3296587-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708062103.3296587-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_144759_968785_6974FC14 
X-CRM114-Status: UNSURE (   8.83  )
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

On Mon, 08 Jul 2024 06:21:00 +0000, Aniket wrote:
> These patches add pm support for the dw i3c controller.
> Controller registers that can be lost are saved and restored during resume.
> Clocks, resets and pads are put in their relevant state during suspend and resume.
> For runtime pm, power is resumed and later suspended for the xfer/IBI APIs.
> 
> Aniket (3):
>   i3c: dw: Save timing registers and other values
>   i3c: dw: Add some functions for reusability
>   i3c: dw: Add power management support
> 
> [...]

Applied, thanks!

[1/3] i3c: dw: Save timing registers and other values
      https://git.kernel.org/abelloni/c/e88def6d757d
[2/3] i3c: dw: Add some functions for reusability
      https://git.kernel.org/abelloni/c/2ab158e0ab28
[3/3] i3c: dw: Add power management support
      https://git.kernel.org/abelloni/c/56e697d7dc6d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
