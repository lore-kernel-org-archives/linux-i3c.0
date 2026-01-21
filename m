Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFA9C44506
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Jan 2026 20:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Rgy8KHk3DaLtf/0QET+H7jdIRCg4zEVUuhbAE650ug=; b=gyC5yua1ztVeYy
	6ZS3efJCprUMBUOSg66ZPoKf+qrWSCjfAmdTiGh3KVa46mKG4vR4ViRVQy9PhOHg04SjU+0Dfd5q5
	WTjuCn2BCeO1KgFbM7mLRIZjmhJ1KhpQQ/TtnJR8T4AOfWv8bQooqFig7dcCUINuHfBxLClSbstoa
	EoMUUBlIo6Oe8xF+s8PxgmA0cZQHrcdTLv8v9K9CcP6hF7hafZDKp1Tk8Hiyc8hXo5XxBwPopfrG7
	ogw5y26tcHzFQHL8WKd2cXVMJitIoynDagilXqi8pickI0A2zESRggoDWzPeeSt4FkkzWMt4KhbHe
	Bbn48qbWdN9Jgy4hALmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieNG-000000060UR-0Rd2;
	Wed, 21 Jan 2026 20:00:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieNF-000000060TI-1RKo
	for linux-i3c@lists.infradead.org;
	Wed, 21 Jan 2026 20:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD929600AA;
	Wed, 21 Jan 2026 20:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B67C4CEF1;
	Wed, 21 Jan 2026 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025616;
	bh=k5StDB744iuYc5dUgOf9B8d4U2oXZcIkwrLmoQPyQc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r6bCkqg95gGOANpwCMpjZc0i5lfopXO6D/SHW34+RNKjBD53boMfZUzp9TFe8fRey
	 j++ReBuvvT132sI2sZEPvrc9xc5a+tnnU3UbcraEXnuvWYxDB643QW7Xa/I/B5nRor
	 cxREGEZTwKRJYUdtfE2lxVvJuFNDhA2P45fjo3TXMXsT8HApoBGE9OehNLA1di4970
	 j5N8h2d8Bz8HrUHBWokBTjRyc6wJemro+L0h0ub4wraRlwDB9+zi0Koklu9fA9PYwe
	 eNuSSNVackVvcZzgtJBctVlBhqmdMBROTEYNJAq6L+3vqxDFqembzF6SeE0e1iHNIp
	 zTrvkAY7b3/Sw==
Date: Wed, 21 Jan 2026 20:00:09 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, Frank Li
 <Frank.Li@nxp.com>, andriy.shevchenko@intel.com, carlos.song@nxp.com,
 fluturel.adrian@gmail.com, linux-i3c@lists.infradead.org,
 linux-iio@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: Add stub functions when I3C support is
 disabled
Message-ID: <20260121200009.44dfe893@jic23-huawei>
In-Reply-To: <202601202302180c990bfb@mail.local>
References: <20251230145718.4088694-1-Frank.Li@nxp.com>
	<176840281753.1259180.16475027635174872850.b4-ty@bootlin.com>
	<20260115171220.000001b7@huawei.com>
	<202601202302180c990bfb@mail.local>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Wed, 21 Jan 2026 00:02:18 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hello,
> 
> On 15/01/2026 17:12:20+0000, Jonathan Cameron wrote:
> > On Wed, 14 Jan 2026 16:02:06 +0100
> > Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> >   
> > > On Tue, 30 Dec 2025 09:57:18 -0500, Frank Li wrote:  
> > > > When I3C is disabled, unused functions are removed by the linker because
> > > > the driver relies on regmap and no I3C devices are registered, so normal
> > > > I3C paths are never called.
> > > > 
> > > > However, some drivers may still call low-level I3C transfer helpers.
> > > > Provide stub implementations to avoid adding conditional ifdefs everywhere.
> > > > 
> > > > [...]    
> > > 
> > > Applied, thanks!
> > > 
> > > [1/1] i3c: Add stub functions when I3C support is disabled
> > >       https://git.kernel.org/i3c/c/8564f88df202
> > > 
> > > Best regards,
> > >   
> > 
> > Hi Alexandre,
> > 
> > This is going to make for an 'interesting' merge window as I'm getting
> > build failures without that patch.  I don't suppose you'd mind
> > doing an immutable branch? 
> >   
> 
> I just sent it, let me know if this works for you.
> 
Thanks. I've dropped the temp fix and merged that ib.

Looks good.

Jonathan



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
