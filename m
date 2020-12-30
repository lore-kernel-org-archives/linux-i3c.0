Return-Path: <SRS0=m2/A=GC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C078CC433DB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Dec 2020 21:41:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE4372074D
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Dec 2020 21:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE4372074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TQrty2S+aVNPj1y0aioXVtQZkyEgNYJL1htAAkxmjtg=; b=DLCDdkBu7Uck511+ex4Q9Oc3a
	krvIAbYhDSzZBDIXf2NhyKp6mSuM3VFPlSR7A7xNwmo+U54vcXnoYxQ/U5s7KXo2PtABVu7Dtgx4x
	ZBnDAFSLDnDW75ZrdC/AEfPWQz6GbChv6GDtnPfogMkpIpz/gLuT0sHzcCqurZuEDhcpkkLyc/Byw
	TD/NhNzBOOvp2waAeO5TtNdvrS2UHpvdjtTwX6Lll1KxyJvO9gIPZpy379e9Y3mzTec73Va190FT5
	3zejDd2i5xTlnwjxmepFpCorJdhRBwhiCsct818piniO5ZIbl8Hu7wzkEd8rEi/OWDxxsensmqYoE
	ulVU14AIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kujDJ-0004Gb-V5; Wed, 30 Dec 2020 21:41:02 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kujDH-0004GA-EI
 for linux-i3c@lists.infradead.org; Wed, 30 Dec 2020 21:41:01 +0000
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4CC4860003;
 Wed, 30 Dec 2020 21:40:54 +0000 (UTC)
Date: Wed, 30 Dec 2020 22:40:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nicolas Pitre <npitre@baylibre.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: re-fix __maybe_unused attribute
Message-ID: <20201230214053.GB110311@piout.net>
References: <20201230154304.598900-1-arnd@kernel.org>
 <orno9ppp-no44-4rp5-s6-58n46rsps045@onlyvoer.pbz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <orno9ppp-no44-4rp5-s6-58n46rsps045@onlyvoer.pbz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_164059_586190_4A0C15E8 
X-CRM114-Status: GOOD (  13.20  )
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
 clang-built-linux@googlegroups.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 30/12/2020 16:23:56-0500, Nicolas Pitre wrote:
> On Wed, 30 Dec 2020, Arnd Bergmann wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > clang warns because the added __maybe_unused attribute is in
> > the wrong place:
> > 
> > drivers/i3c/master/mipi-i3c-hci/core.c:780:21: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
> > static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
> >                     ^
> > include/linux/compiler_attributes.h:267:56: note: expanded
> > 
> > Fixes: 95393f3e07ab ("i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Acked-by: Nicolas Pitre <npitre@baylibre.com>
> 
> This might be the 3rd patch from 3 different people fixing the same 
> thing. Looks like I3C maintainer is on vacation. Please feel free to 
> send this trivial fix upstream some other way.
> 

Isn't it already upstream?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=95393f3e07ab53855b91881692a4a5b52dcdc03c

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
