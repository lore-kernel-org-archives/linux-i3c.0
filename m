Return-Path: <SRS0=jIIi=LD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE9FC47082
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jun 2021 00:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662436128E
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jun 2021 00:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662436128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPGwFO26Ah/BvOl76tKnfMcN2PzPXsYWgA40rvrQi/A=; b=O+FobXG8AxubNF
	+OpO0sDhKBvHKX9Gi5bpAnqCB4kiJJtWiaB0VZ7cNCMQWaLxUAnLs1PTbOnfZTLzlQBkdEmTilIgX
	mYpm6XfqmgpanRuOGYTdRg5T3PE9dYQyGaa/6zLYceY8/IYiQLOAPJlq51uRW0XvLrH1Flu4pks5X
	/mHh7v2xc3FPx13yhc1R182xoUkyLdLHu06qZr4zHSQ1LP2ur2d5XigfRPdLKmS2/dh6g/2r02swB
	BMXYzMFddQn4ACnBxYVjQQJRd7a1FUXZcGJRTdUaHyrHS5YW+o3E8VJLmDjxJXs7WeNcFHtAnhZLQ
	Qz8zrA9VzqVUoFsndkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqlgi-00ApjY-Fk; Wed, 09 Jun 2021 00:03:16 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqlgg-00Apit-47
 for linux-i3c@lists.infradead.org; Wed, 09 Jun 2021 00:03:15 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 68A3F1BF205;
 Wed,  9 Jun 2021 00:03:12 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 miquel.raynal@bootlin.com
Subject: Re: [PATCH -next v2] i3c: master: svc: drop free_irq of
 devm_request_irq allocated irq
Date: Wed,  9 Jun 2021 02:03:10 +0200
Message-Id: <162319698188.1230434.16937256801626257846.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602084935.3977636-1-yangyingliang@huawei.com>
References: <20210602084935.3977636-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_170314_315445_91A8BBE6 
X-CRM114-Status: UNSURE (   4.83  )
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

On Wed, 2 Jun 2021 16:49:35 +0800, Yang Yingliang wrote:
> irq allocated with devm_request_irq() will be freed in devm_irq_release(),
> using free_irq() in ->remove() will causes a dangling pointer, and a
> subsequent double free. So remove the free_irq() in svc_i3c_master_remove().

Applied, thanks!

[1/1] i3c: master: svc: drop free_irq of devm_request_irq allocated irq
      commit: 59a61e69c4252b4e8ecd15e752b0d2337f0121b7

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
