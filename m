Return-Path: <SRS0=qFpp=CX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440A3C2D0E3
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7CE4217BA
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P3DGBu4E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ai0UuHTn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7CE4217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ienGy1eXoE6gPj2Y577ZHR+QqRtrXik2anBs7lSaHM=; b=P3DGBu4Ee0ZMUCKdoKLPjLDOc
	wwKsFrzQc1JmwJpBb7AruGxtQ+gCzSBHXp5IN2YrP6UfvZua1HgyRiCaXo4cYdxGgohMuC2tiLH91
	shSN3RTtpmXFk3WjwXC6uQpHxm9GURg0W2/R2zi6OeZZgDL2zYRLq2bvkUKKg4ensSAoOc9Vze5fB
	R0Fq9NUfO4ct44fDzrAQH0ejRXvc8WJsUwUKIgZRsu/oOK0WDuA2W+6DvqPLNRIAwF84+1BXCOF9V
	pV5mg0mQp7bRMmYluEtqWA4GvLGLk0OjJv+JSrQ4IDaRRAOMzhLo6XDbg/XqWwP3U386jRjFSSqVU
	htYHVR1pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHiVr-0007qa-Qq
	for linux-i3c@archiver.kernel.org; Mon, 14 Sep 2020 07:02:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCJNL-0001Vv-GO; Sun, 30 Aug 2020 09:11:48 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E151207BB;
 Sun, 30 Aug 2020 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598778705;
 bh=BWklOV6bppJJ3A+SKZXddiVUDib6q31F3dsVGTSMtbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ai0UuHTnZlo4wf/I5Ov08/TrKTmcZtSZYe3sSmtFPMekal3JdcbUjzjqFbnUO+Xal
 3yu7jLxoRUMmC3+CDPYPEQ3UI5NZnEfFVp9S1Y2s6awOmfdpwE/crUJIFWSu1iADuB
 /HLt1Sk8k3z7Ye5JS2yTFeHHb/XaDjL5nXdJ7wQA=
Date: Sun, 30 Aug 2020 11:11:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Subject: Re: sysfs output without newlines
Message-ID: <20200830091142.GC112265@kroah.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_051147_696778_EE71217B 
X-CRM114-Status: GOOD (  14.88  )
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:02:53 -0400
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-mmc@vger.kernel.org,
 Kai =?iso-8859-1?Q?M=E4kisara?= <Kai.Makisara@kolumbus.fi>,
 LKML <linux-kernel@vger.kernel.org>, Pete Zaitcev <zaitcev@redhat.com>,
 linux-i3c@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-scsi@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Alex Dewar <alex.dewar90@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, linux-edac@vger.kernel.org,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 platform-driver-x86@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Alex Dubov <oakad@yahoo.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Denis Efremov <efremov@linux.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Darren Hart <dvhart@infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 York Sun <york.sun@nxp.com>, Kalle Valo <kvalo@codeaurora.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Tony Luck <tony.luck@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Brezillon <bbrezillon@kernel.org>, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, Douglas Miller <dougmill@linux.ibm.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-spi@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, James Morse <james.morse@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, Aug 29, 2020 at 11:23:43AM -0700, Joe Perches wrote:
> While doing an investigation for a possible treewide conversion of
> sysfs output using sprintf/snprintf/scnprintf, I discovered
> several instances of sysfs output without terminating newlines.
> 
> It seems likely all of these should have newline terminations
> or have the \n\r termination changed to a single newline.
> 
> Anyone have any objection to patches adding newlines to these
> in their original forms using sprintf/snprintf/scnprintf?

No objection for me, patches for my subsystems will be gladly taken.

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
