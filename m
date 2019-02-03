Return-Path: <SRS0=KGHu=QK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E616C169C4
	for <linux-i3c@archiver.kernel.org>; Sun,  3 Feb 2019 17:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3584220815
	for <linux-i3c@archiver.kernel.org>; Sun,  3 Feb 2019 17:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCLvahI5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="crzzZZsB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3584220815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gHn7g1c8LyD4vBRw0bXfrTlHxMYJQrs5Qcvp0M60FE=; b=gCLvahI5Wjog4M
	nOsuIQljyDBDhkgqLwVKas/YDonLYolR1ZvPSDLOnqPwA5pcG7uzj3+AQ+jtyEhg6udr6wL/9bBn/
	dVqwkr87D5U8cW/+3r/I43svtLxwmjzwJnNycuo/NCrjUDjEHkNLEfEOHaoDw+ilVt0SHKtVsCmc1
	j/+HvuWl8rpB3GcMbQJH9SQs3lZqH5VZczqWIlOnwELCyDpgXb1OzdlxqCA/wEv1cFywyWD6J/1NE
	AciA9IEv4Ksngfa8qvSCZpBtjU3huxT+waXzFMCO8gXdNzAiOIbilYveZM4I6ChqZqyMvdh4cl3IQ
	7KZ1L6cNVspJ6rzrhV7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqLee-0005oO-Oe; Sun, 03 Feb 2019 17:34:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqLeb-0005nz-4k
 for linux-i3c@lists.infradead.org; Sun, 03 Feb 2019 17:34:02 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08B7E20815;
 Sun,  3 Feb 2019 17:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549215239;
 bh=rkYoWb23bNrgQUY7q5UmwL9/AcG2pKg/YY6R1iv5O8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=crzzZZsBH5uLpv+zrx9dSWooBbkE4QThJNsBNs60exnlB2b0z7SWmBe94A4mIX3bo
 2No3tR45jWezZtrDohl6hr/UQqmRjFiUgQBSbPXN55FaasK+M0buHR8Wep3fUn3eZf
 qwXDZ0mH73yhfr5mQRpQGGKV8P4vMHIJW8/uHgG8=
Date: Sun, 3 Feb 2019 18:33:51 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: i3c application
Message-ID: <20190203183351.20882145@bbrezillon>
In-Reply-To: <002b01d4baa3$a36667a0$ea3336e0$@aspeedtech.com>
References: <f778a542ef6647069681ed4a4d35c907@TWMBX02.aspeed.com>
 <20190129143021.475588a7@bbrezillon>
 <002b01d4baa3$a36667a0$ea3336e0$@aspeedtech.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_093401_205204_2B6AD8C7 
X-CRM114-Status: GOOD (  20.52  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 'Vitor Soares' <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Ryan,

On Sat, 2 Feb 2019 03:01:51 +0000
Ryan Chen <ryan_chen@aspeedtech.com> wrote:

> Hello Boris,
> 		Thanks a lot.
> 
> >+Vitor who started a discussion around i3c-tools and the associate
> > kernel <-> userspace interface.  
> 
> Does there have open source repo in internet? 

AFAICT there's nothing implemented yet, we just started discussing it.

> 
> 
> > Hi all,
> > 	I just work with I3C, does there have any application like i2c-tools  
> I can used?
> 
> >No, but I'll ask the same question I already asked Vitor: what would you  
> use i3c-tools for? What should it contain? I'm not against the idea, but I'd
> like to delimit the scope of the userspace >interface.
> 
> 
> Sure, it definitely a user space application.
> I will connect with some i3c device or have loop back interact. I3c master
> <-> i3c slave 

Sorry, I don't get it. I don't know what you mean by loop back. I also
don't see why you absolutely need a user-space app to interact with a
device when you can develop a simple driver running in kernel space,
and I see no answers to these questions in your reply.


> 
> > 	Or any Linux i3c application I can have i3c slave and master loop  
> test? 
> 
> >>Not sure I get this request correctly. Are you talking about a dummy slave  
> driver that would return any data it receives to the TX queue so that the
> next read request coming from the >>master returns what the master wrote in
> its previous write access?
> 
> 
> >>If that's what you have in mind, then it's definitely not supported.
> >>But before we even consider doing that, we should first introduce the  
> concept of I3C slave controller and then decide how we want to expose slave
> features. Note that Vitor and I disagree >>on the solution: I think we
> should mimic the USB gadget approach (where you can attach a generic profile
> to any USB device controller), and Vitor thinks slave IPs should have their
> >>profile/feature-set hardcoded in the driver (which works fine for  
> hardcoded slave IPs, but is not that great if the slave block is generic).
> 
> Thanks, if I can refer from with I3c-tools, I can start for i3c-master and
> i3c slave dummy test.

As I already said above, there's no i3c-tools yet, and there won't be
until we are clear on what this project should contain and what the
kernel <-> userspace interface should look like.

Can we have a more detailed description of your use case please?

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
