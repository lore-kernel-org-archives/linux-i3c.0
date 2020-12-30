Return-Path: <SRS0=m2/A=GC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1718C433DB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Dec 2020 22:00:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF3B207A1
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Dec 2020 22:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF3B207A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cpYEBO2nBoSxfBz0RIUaGlvqB1cgWoXUi5W5hm5LwqY=; b=VrOl1oUDmV/P19s6fMnB7LLNk
	BpDxtJJZzN7UlWEi25vqUyrpCQ1AfOyS8Gc3b1RHOm2xnlUYy4Sj+27Oo6CJGIr5aQBFgbfMVJoJY
	MrOsWXIb9qBttooU7W5FyPxIzsVn+WpwpU8G8m8gAWq1AaHzWAPIj07iBvRKR4bZXIABxydNqrNon
	hd+s8c+J1tGeVMRImOQCTynP6anlcQX48spYdHYLhUW8bqm0swkl0XVclEh7LUKguofEd1NZt0xX/
	aW6pV5TYQVKX69lwTNMw9DTyOiB8qO24f0H4Ql8oleYH9mSa4VhW4JokELbp9xcVW25vnbD6EV//A
	mYYqvBbLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kujWR-00059E-US; Wed, 30 Dec 2020 22:00:47 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kujWP-00058k-Af
 for linux-i3c@lists.infradead.org; Wed, 30 Dec 2020 22:00:46 +0000
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 93C3420000A;
 Wed, 30 Dec 2020 22:00:39 +0000 (UTC)
Date: Wed, 30 Dec 2020 23:00:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: re-fix __maybe_unused attribute
Message-ID: <20201230220038.GC110311@piout.net>
References: <20201230154304.598900-1-arnd@kernel.org>
 <orno9ppp-no44-4rp5-s6-58n46rsps045@onlyvoer.pbz>
 <20201230214053.GB110311@piout.net>
 <20201230214321.GA1961980@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230214321.GA1961980@ubuntu-m3-large-x86>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_170045_482863_FC565B50 
X-CRM114-Status: GOOD (  19.51  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>, clang-built-linux@googlegroups.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 30/12/2020 14:43:21-0700, Nathan Chancellor wrote:
> On Wed, Dec 30, 2020 at 10:40:53PM +0100, Alexandre Belloni wrote:
> > On 30/12/2020 16:23:56-0500, Nicolas Pitre wrote:
> > > On Wed, 30 Dec 2020, Arnd Bergmann wrote:
> > > 
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > 
> > > > clang warns because the added __maybe_unused attribute is in
> > > > the wrong place:
> > > > 
> > > > drivers/i3c/master/mipi-i3c-hci/core.c:780:21: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
> > > > static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
> > > >                     ^
> > > > include/linux/compiler_attributes.h:267:56: note: expanded
> > > > 
> > > > Fixes: 95393f3e07ab ("i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > Acked-by: Nicolas Pitre <npitre@baylibre.com>
> > > 
> > > This might be the 3rd patch from 3 different people fixing the same 
> > > thing. Looks like I3C maintainer is on vacation. Please feel free to 
> > > send this trivial fix upstream some other way.
> > > 
> > 
> > Isn't it already upstream?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=95393f3e07ab53855b91881692a4a5b52dcdc03c
> 
> This patch is fixing that one, the attribute was added between the
> struct type, causing a new warning for clang.
> 

Ah yes, even after reading that 3 times, I got it wrong.

> I sent a fix for this earlier too, I do not care which one goes in as
> long as one does so:
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> 

I was going to review and apply yours now that I have access to the i3c
repo. I must admit I didn't have a look at i3c patches until now and the
holiday season is not helping.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
