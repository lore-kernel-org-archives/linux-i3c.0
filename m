Return-Path: <SRS0=ixSD=QF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4789C169C4
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Jan 2019 13:30:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F3C2147A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Jan 2019 13:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="llsLAZcu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpQeS4bN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F3C2147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpGT6pmxnrZuNtZ88D2Xt0Qv/fSaNpOGLuWhscYAB54=; b=llsLAZcuDq8B28
	qpvPNvPfx+mC7Rd6urEpVwM38x7cIgh//wy5fd8O9n1GugrrPKFuiV5pOI8TdjZBkH4zaa7YCpwdg
	pSTaPR6RsRkAg7NOqrm3EjEZaOE5pf0mcTR6oIdyZpeXz0L3f4vMZOF4aQuI2hGkoj5HpuOrb/kuQ
	+DhyMJo5ZMHxqngWxFZOJowHzCIvwEu89tRcYuIaq+YX99cnNCXNqeIitujbyeYKA/6D/fnLtzZR9
	ydQ8FzN6pwoPebNAuC9SdLZipGWgPebromG5qVOYN2nHdZ0wKd/yiuaWn7qyYEUbuV6BO9V+aXDHx
	6SVQ2ngppDytRHcPlr9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goTTH-00082p-Ve; Tue, 29 Jan 2019 13:30:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goTTE-00082B-Bs
 for linux-i3c@lists.infradead.org; Tue, 29 Jan 2019 13:30:33 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB7A521473;
 Tue, 29 Jan 2019 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548768631;
 bh=6DyDWCBBUu07HHbOVvKDTyidVNrd/n+EayPksrCUgM0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YpQeS4bNx2Me0f2wxNYPJuAigtMNVbmFirjxRPhcbTtPte1p+Oc5MHPW1X9qnFyfs
 msLP6eNUOJQ48ZjJMHmhkVsgrgdgjWe4MD5FI8tAKpMhrfftQad++aPCyqGQxHNVOK
 H5TDsDUsUMnq+WPm8gScCK64DTe5F53ih4dgu7Dc=
Date: Tue, 29 Jan 2019 14:30:21 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: i3c application
Message-ID: <20190129143021.475588a7@bbrezillon>
In-Reply-To: <f778a542ef6647069681ed4a4d35c907@TWMBX02.aspeed.com>
References: <f778a542ef6647069681ed4a4d35c907@TWMBX02.aspeed.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_053032_429169_B5CF5A45 
X-CRM114-Status: GOOD (  12.67  )
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
 Vitor Soares <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

+Vitor who started a discussion around i3c-tools and the associate
kernel <-> userspace interface.

Hi Ryan,

On Tue, 29 Jan 2019 00:54:05 +0000
Ryan Chen <ryan_chen@aspeedtech.com> wrote:

> Hi all,
> 	I just work with I3C, does there have any application like i2c-tools I can used?

No, but I'll ask the same question I already asked Vitor: what would
you use i3c-tools for? What should it contain? I'm not against the
idea, but I'd like to delimit the scope of the userspace interface.

> 	Or any Linux i3c application I can have i3c slave and master loop test? 

Not sure I get this request correctly. Are you talking about a dummy
slave driver that would return any data it receives to the TX queue
so that the next read request coming from the master returns what the
master wrote in its previous write access?

If that's what you have in mind, then it's definitely not supported.
But before we even consider doing that, we should first introduce the
concept of I3C slave controller and then decide how we want to expose
slave features. Note that Vitor and I disagree on the solution: I think
we should mimic the USB gadget approach (where you can attach a generic
profile to any USB device controller), and Vitor thinks slave IPs
should have their profile/feature-set hardcoded in the driver (which
works fine for hardcoded slave IPs, but is not that great if the slave
block is generic).

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
