Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ACAC5519F
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 10:21:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4E42065E
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 10:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KEW1aB/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4E42065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mu3kfUwg9XeDroFJVqs90orXXDy6NoFgb7QJ0wrSF8Y=; b=KEW1aB/GzXyIC4fapd+48sSHu
	kmnrr8r71lXkFfoWhHdHYi7B8/NhOmNcNC4WH03aPpjbIIpvp/Jo5l1gZaCKMvcRipwxT54NMq7n6
	FoQI+hTXScs0cI+V0N5pMn/XpH8Sr+HsxCoDpCLRkaDmWuOL66db1SanAv+1S8ORorPhTo9UbiaLD
	vqE0QTLfZ3PCOohQRKYvzvA1cXh0d5fAVtOyqj9qK94+e1znysv+YEfzzv4I7C2COjrkZ4YH4B5bw
	vq/g3iZlJbfRnwkloaCKjxWcWkSaFH0QlcJKH4K9Jv3avv5bc6RKSnTH8+wf9+NWYZ5lSHw/eQdAt
	N3p2Q2y3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrvE-0007eX-MA; Wed, 25 Nov 2020 10:21:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khrvB-0007eC-16
 for linux-i3c@lists.infradead.org; Wed, 25 Nov 2020 10:21:10 +0000
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 74543C000D;
 Wed, 25 Nov 2020 10:21:05 +0000 (UTC)
Date: Wed, 25 Nov 2020 11:21:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] i3c: Resign from my maintainer role
Message-ID: <20201125102105.GY348979@piout.net>
References: <20201125101643.461658-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125101643.461658-1-boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_052109_783441_435368DA 
X-CRM114-Status: GOOD (  15.80  )
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

On 25/11/2020 11:16:43+0100, Boris Brezillon wrote:
> I simply don't have time to maintain the I3C subsystem anymore.
> Alexandre Belloni proposed to take over which I gladly accepted.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> v2:
> * The subsystem is no longer orphan, Alexandre is the new maintainer,
>   yay! (Thanks for stepping up and proposing your help BTW)
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e73636b75f29..020fb2a0c5e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8333,7 +8333,7 @@ F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
>  F:	drivers/i3c/master/dw*
>  
>  I3C SUBSYSTEM
> -M:	Boris Brezillon <bbrezillon@kernel.org>
> +M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
>  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  C:	irc://chat.freenode.net/linux-i3c
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
