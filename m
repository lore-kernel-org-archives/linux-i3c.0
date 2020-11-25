Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9ABC5519F
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:53:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B048D206B5
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXZMSw8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B048D206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l3iW4IeLLYJXJxkfsS49i8mlUq5zqn5prqjwGbC04ns=; b=hXZMSw8JkNtSs0YUB0BPp9ZI1
	Aw3TidCR0YwFZ93nyQIIN9YArWGgbGWvfp/c/FYoKO5y0+UTJm4UsOzn03tR5xVsma5BSqpqLbdVN
	ZP7cHYoxEwLxjKSIbnoaPlNXnsoTcZjk0ixPF+cqbxSzCiu4rE9bRcgHSkneJjnpWX1gPGuFNnUbv
	JWAzGsqhvNDp3ezpzIkTJrXyXkTcYUkkncbLQ604laFyESlSxwWWqAVy763PrzteWTLbJXZnQiVbc
	1g8mBMn9GmG36EZ2qOClNJZvu9NyZQMqQkijH7hDeb3OadRsAmloqp7dOJrINjnyGBmsbgite0J5g
	8umQvbXfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrUD-0006Br-9K; Wed, 25 Nov 2020 09:53:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khrUB-0006BV-Ub
 for linux-i3c@lists.infradead.org; Wed, 25 Nov 2020 09:53:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 09ED01F4541E;
 Wed, 25 Nov 2020 09:53:09 +0000 (GMT)
Date: Wed, 25 Nov 2020 10:53:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c: Resign from my maintainer role
Message-ID: <20201125105303.214df50a@collabora.com>
In-Reply-To: <20201125094246.GW348979@piout.net>
References: <20201123092753.38304-1-boris.brezillon@collabora.com>
 <20201125094246.GW348979@piout.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_045316_089207_0BB4F388 
X-CRM114-Status: GOOD (  20.19  )
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
Cc: linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 25 Nov 2020 10:42:46 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hello,
> 
> On 23/11/2020 10:27:53+0100, Boris Brezillon wrote:
> > I simply don't have time to maintainer the I3C subsystem anymore.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > If anyone is interested in taking over (ideally someone with a korg
> > account, so the transition can be done as smootly as possible), please
> > let me know and I'll make that happen.  
> 
> I'll take the maintenance, can you add me in v2 so you don't have to
> change the status to orphan?

Sure thing. Thanks for stepping up.

> 
> > ---
> >  MAINTAINERS | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e73636b75f29..8510f13a713c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8333,9 +8333,8 @@ F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> >  F:	drivers/i3c/master/dw*
> >  
> >  I3C SUBSYSTEM
> > -M:	Boris Brezillon <bbrezillon@kernel.org>
> >  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
> > -S:	Maintained
> > +S:	Orphan
> >  C:	irc://chat.freenode.net/linux-i3c
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
> >  F:	Documentation/ABI/testing/sysfs-bus-i3c
> > -- 
> > 2.26.2
> >   
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
