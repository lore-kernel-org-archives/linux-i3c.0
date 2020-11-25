Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EE4C5519F
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF6C5208B8
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Peek5BHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF6C5208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mF2XZtxbvvylpo+0hMC6Vos6dsrSln7Q/5Syew4r4jw=; b=Peek5BHZS61KVM/45uyR5vnbw
	X/fz+4FmgbDjrQH6+5KC62seHNLSPFKZr1VaA8i3wx2Yicm0UFg+xSQavnrffOzHNsf54hJxvQw9v
	HFV+/uqVnhRJxp68meRcw3isSU9TcqofzbJgu9W8UOf44f3E/SeHFD28OuLmreXah/DFtiuPzbEB6
	JD8EcT3FjnXH12doEs/ZHkUq/dAGewaVl7P2UKKlt2SzgZT6Eob3rf6VvyLND0ATlPRieCtVUUs7E
	++UANajHKjJINwRpfKPi07DE6kaykK7Dd4/WQul2NYV16pFzXkYG7zwEyoN6GzXfGsb9fkdNGuY65
	KCgc934VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrYI-0006cB-28; Wed, 25 Nov 2020 09:57:30 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khrK5-00059R-UJ
 for linux-i3c@lists.infradead.org; Wed, 25 Nov 2020 09:42:51 +0000
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7626624001B;
 Wed, 25 Nov 2020 09:42:46 +0000 (UTC)
Date: Wed, 25 Nov 2020 10:42:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] i3c: Resign from my maintainer role
Message-ID: <20201125094246.GW348979@piout.net>
References: <20201123092753.38304-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123092753.38304-1-boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_044250_078848_C41DE4DE 
X-CRM114-Status: GOOD (  15.91  )
X-Mailman-Approved-At: Wed, 25 Nov 2020 04:56:57 -0500
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

Hello,

On 23/11/2020 10:27:53+0100, Boris Brezillon wrote:
> I simply don't have time to maintainer the I3C subsystem anymore.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> If anyone is interested in taking over (ideally someone with a korg
> account, so the transition can be done as smootly as possible), please
> let me know and I'll make that happen.

I'll take the maintenance, can you add me in v2 so you don't have to
change the status to orphan?

> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e73636b75f29..8510f13a713c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8333,9 +8333,8 @@ F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
>  F:	drivers/i3c/master/dw*
>  
>  I3C SUBSYSTEM
> -M:	Boris Brezillon <bbrezillon@kernel.org>
>  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
> -S:	Maintained
> +S:	Orphan
>  C:	irc://chat.freenode.net/linux-i3c
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
>  F:	Documentation/ABI/testing/sysfs-bus-i3c
> -- 
> 2.26.2
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
