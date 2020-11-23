Return-Path: <SRS0=AdV8=E5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF07C2D0E4
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Nov 2020 11:23:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E9820706
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Nov 2020 11:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6Q9XP3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4E9820706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UT9b5tNtlQ/b8kL63kPno/WeEb9GXrYEeIQGGQTX6lc=; b=D6Q9XP3tyLyL5osOPqwAeg1go
	7gQZRY8+jA/pzkSoKV+NC7e+/zYOQQ5Cv4dWRaKY3+Hp/T07UD/+WcSgtkPszOxINAIXxLevzVdmN
	S324N+yBx5iNCnpWrLfpuIerrvCdfVWwOzSMuhLhN1tyX8GO7iKFQLpLW0wjQZQFz5CYaJ8PEU2zf
	VkLRUbdnz/DtmKe4Kz28KQKm483PGOXlQVbTTSzZUqgS5TU6PaoDEOhTSCr8kxxSJgxSojfHDxkOp
	oCIp3K+pCKzYkvUo7wxJ7Zb5qrrTlAzDDMLuZhq3vp70axoMz3QVo+4W/R6J8HXq+BsQvDN5l7gvI
	i3lJDG/jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh9w5-00021n-Fn; Mon, 23 Nov 2020 11:23:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh9w2-00021U-RI
 for linux-i3c@lists.infradead.org; Mon, 23 Nov 2020 11:23:07 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 860AD1F44BBC;
 Mon, 23 Nov 2020 11:23:05 +0000 (GMT)
Date: Mon, 23 Nov 2020 12:23:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: Resign from my maintainer role
Message-ID: <20201123122301.5dcdb34e@collabora.com>
In-Reply-To: <20201123092753.38304-1-boris.brezillon@collabora.com>
References: <20201123092753.38304-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_062307_029753_9AE21192 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 23 Nov 2020 10:27:53 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> I simply don't have time to maintainer the I3C subsystem anymore.

s/maintainer/maintain/

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> If anyone is interested in taking over (ideally someone with a korg
> account, so the transition can be done as smootly as possible), please
> let me know and I'll make that happen.
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


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
