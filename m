Return-Path: <SRS0=jIIi=LD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1314C4743F
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jun 2021 00:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C1B6108E
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jun 2021 00:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C1B6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gczhQ35/HGCx0IfkIa57KAZk2jlwhmGlgfAKQM3ghuU=; b=p4zCVjBA/4KkWk
	hDAebfs7h+0Ahqq9evvRQd0W3xXpBd+sNOCwlWr1xiKQ3bwsPW6upZEycSpb/kF/RC3SP2TGi3eoI
	EVKwrIT7ql8sG7RDRkF8+u+8uHOVVrFcIzBy09mvetChJDrZ1PhUX5XinkCLnfgiE+9GGOJQ8Yub6
	icM34DLsiv1gribrXADcSIfAlXR9sN4vLR1Y7ZO4rDZoliGWwgtv6m+EZOaks9+dcyCjAOv12HInO
	lBYCyInVOQ4Tet+9AR6k0TJXO3us4fod3SjAI1oqVZ5BteKiQOqmRmJ1wZKWn3r1WJzRCXR7M+3a1
	UUgQjdftLACahA4Ep1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqlgi-00ApjR-A9; Wed, 09 Jun 2021 00:03:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqlgf-00Apis-Qe
 for linux-i3c@lists.infradead.org; Wed, 09 Jun 2021 00:03:15 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A20F220002;
 Wed,  9 Jun 2021 00:03:11 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 miquel.raynal@bootlin.com
Subject: Re: [PATCH -next] i3c: master: svc: fix doc warning in
 svc-i3c-master.c
Date: Wed,  9 Jun 2021 02:03:09 +0200
Message-Id: <162319698188.1230434.17817139640415078043.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602085544.4101980-1-yangyingliang@huawei.com>
References: <20210602085544.4101980-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_170314_016701_B6DDF87A 
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

On Wed, 2 Jun 2021 16:55:44 +0800, Yang Yingliang wrote:
> Fix the following make W=1 warning:
> 
>   drivers/i3c/master/svc-i3c-master.c:207: warning: expecting prototype for struct svc_i3c_i3c_dev_data. Prototype was for struct svc_i3c_i2c_dev_data instead

Applied, thanks!

[1/1] i3c: master: svc: fix doc warning in svc-i3c-master.c
      commit: 3e5feb11a82945c88a1518fd2682ca8de66c37d3

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
