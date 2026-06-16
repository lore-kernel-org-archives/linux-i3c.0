Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2550ECD98D2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 22:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlRhf+CHPo2u0p1RWKP4NrXf2/GdfVtSoyFIey5Ah8k=; b=ZhyFs/r66/7xYb
	bw2YEKy5QUx9hXdrmEbei/tfj0AH5K6buABYb5DJlUN5Taq+frhdtNdH4ahgkAbHwJgHufLwOcKQ0
	xhn+T2wTR5gxJHT+9K/Djfj4vZVLO47HwnmhiSVtvaUf7YLhXKLv9CQHYeQ95QcXxMQ3zTiyHzTm8
	qsN+tayP6CWAlwqiIozh4a4P6DI3n/5ouIkK0l15hdoOKq7hPaWfjOa13bqtZ82AniQfT34BpM+ie
	kWFvlAYWRnyRLBWrt2Q0rlDN8lwSYTdIum7+0hUruOCPFNOHieu5B5lnoSdWp6IjHgeKQ8o5qNS9o
	wXjFHj44Lg/AJ4kUQHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZcGJ-0000000GNge-3UaQ;
	Tue, 16 Jun 2026 22:28:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZcGF-0000000GNgA-3UzI
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 22:28:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1B44CC2BB34;
	Tue, 16 Jun 2026 22:28:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43050601A9;
	Tue, 16 Jun 2026 22:27:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 606CE106CA0DA;
	Wed, 17 Jun 2026 00:27:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781648875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=f3XE9ac2lx1O11P5dKG//W7WFemrx88IpJbcMD4WtsI=;
	b=IfoprmoNo2Xj7GlOT/oMbHdRWMRELGx2LzZ/Kw7rGvUdfMZGUtzRbyR9sf9v6767nEN+aE
	+/VLBKUTdZRZdZCFzvtKnya38YJyg2+7JhRhcb6qqOqQ96HrR0eh63jzXPOj4wpZgZheWl
	+XXgLan7hlPOzoXlcpA7m9AG4WPi4YLzNiJuVmwioauDVQqYFAHG43n0un4ZcoXfsuJUQh
	C9icCskSZNYk82ZRG/6gA5mUNXmido7Ql/IsVxSHkmO7JssTT1mXWUDDd9wNixDlEiblLE
	TUfyqjzw+IvOWka1TSbi/SlwEsadOkWOb/+tqNE8ulSU8R9yV0N5YrTHLOFspQ==
Date: Wed, 17 Jun 2026 00:27:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] i3c: master: Small fixes for dev_nack_retry_count
Message-ID: <178164876047.854146.16341576083391784993.b4-ty@b4>
References: <20260616113752.196140-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260616113752.196140-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_152800_050802_DA5D1FC9 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
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

On Tue, 16 Jun 2026 14:37:49 +0300, Adrian Hunter wrote:
> Here are some small fixes for dev_nack_retry_count.
> 
> 
> Adrian Hunter (3):
>       i3c: master: Update dev_nack_retry_count under maintenance lock
>       i3c: master: Add missing runtime PM get in dev_nack_retry_count_store()
>       i3c: master: Use unsigned int for dev_nack_retry_count consistently
> 
> [...]

Applied, thanks!

[1/3] i3c: master: Update dev_nack_retry_count under maintenance lock
      https://git.kernel.org/i3c/c/ab5f9c5cb527
[2/3] i3c: master: Add missing runtime PM get in dev_nack_retry_count_store()
      https://git.kernel.org/i3c/c/79ce29e100ab
[3/3] i3c: master: Use unsigned int for dev_nack_retry_count consistently
      https://git.kernel.org/i3c/c/225b76e2a711

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
