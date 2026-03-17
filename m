Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E3BF3381B
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Mar 2026 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN/Ms5+G5dWzq85EdXrJqX2VztwW/fLHWMnmYMrMxxA=; b=jauQJ36JhBs8wb
	bFRrISUC/p/YCN+TzFT7DyxJ13ZimLaByb4KHliA2lZi7tXSV5+EFjnLNbBGgVJ715QDjoztu7Dil
	dCiGehrqXKcqy5qqOg888LpQM/M3bc6NgJkna8YWEPRVlZXsHGr6D+sl80uavhR7Y8+kJMSSuwWkm
	scLC2XOw5Ughfc33VXJTjmI4+d1h3y9AUNIPsiKspoL8D19GXlL0HMS53aBiZALNVH8di2bK1kUVJ
	ilEEwCGzlBobkliqOTdZiFAYWLMmz4vq2VFz2xMi2ZYI+cPY7ZhTD/u0NOYPwHcu0BYwM3ek2f+HV
	fDM+NZP5UTwxxVczFiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QBA-00000005lpX-3p7R;
	Tue, 17 Mar 2026 08:53:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QB7-00000005lp6-3lQl
	for linux-i3c@lists.infradead.org;
	Tue, 17 Mar 2026 08:53:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7292DC55054
	for <linux-i3c@lists.infradead.org>; Tue, 17 Mar 2026 08:53:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DADA5FC9A;
	Tue, 17 Mar 2026 08:53:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D105610450425;
	Tue, 17 Mar 2026 09:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773737604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=In8idt2yZweANMAepWHj54chzIEKvH54YasTehXIpzQ=;
	b=VfXCGi8qmU3nCq3Gukypcit5ZVFlruwkaPJ15ozYvVPvdTISE6bbCPJBV9jYPT9MUjP/g2
	NUQw2F7PQ1VHJEeBeLSJaRZvTb62wcUycIwRGHhWCrXsdN61z5nI5LetmpU5aUb0Wo0dxX
	yDMxSeNXLoMZiJ828qRnMEVnLwNakdBBaYmYdQzcMwE1s4gkBOjxrMS0IHSDmCgFIbfBMf
	nSeZWeoiRuUhfE2FZY7oGMDN8EXTzpu5+t7wpyjkFgsMrymINVwrLNy/sXHNIgtBAC6Vj+
	9QIa0urILQ6XsECAr85kUH3sqqXGKAGsdGW16cZzmHzuP+zpkhZdL2T0EinQoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,  Frank Li
 <Frank.Li@nxp.com>,  linux-i3c@lists.infradead.org,  imx@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix missing newline in dev_err messages
In-Reply-To: <20260317034015.638-1-hechushiguitu666@gmail.com> (Haoyu Lu's
	message of "Tue, 17 Mar 2026 11:40:15 +0800")
References: <20260317034015.638-1-hechushiguitu666@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 09:53:23 +0100
Message-ID: <87a4w6g7lo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_015330_097091_C00F8B4D 
X-CRM114-Status: UNSURE (   4.85  )
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

On 17/03/2026 at 11:40:15 +08, Haoyu Lu <hechushiguitu666@gmail.com> wrote:

> From: "haoyu.lu" <hechushiguitu666@gmail.com>
>
> Add missing newline to dev_err messages in:
> - drivers/i3c/master.c
> - drivers/i3c/master/svc-i3c-master.c
>
> Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
