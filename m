Return-Path: <SRS0=GllZ=GA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EB1C433E0
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Dec 2020 10:55:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311F2229C4
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Dec 2020 10:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311F2229C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/qYeFPsY05kOgxTiwIlQNI3H3RS1B9rGwQOAMVp2dWk=; b=HxbqW2+cocG5E3UfyAGMZicHW+
	jz4JZyh0LXnHJX/nKFd6hcrsYYSf2V5llKHyN9vNMDZwPl+qLbMP06TADzqes4pMils4EKrxesL9C
	bzBqqTJlImSXDXldhsYlU7besmhfwGAMRliuWPjvwK/qoJquFC+bNSc6jLJqWKzq8i4P6fZk41/sg
	z19iBUWw2CG646LtRfCktXVtLSqETaHvmEJFytfFxMWG818WyadpxXwzRFvVukFQnSh06LfEnCAp1
	OAQ91QAJCgEboY+THTCQGniMLNzDzNMEpS3tl0v722SOxAX7eGg1NFtvgnjpCW09XV5Y5LvUrPOLe
	raX6EzXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktqBF-0006MA-1M; Mon, 28 Dec 2020 10:55:13 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktqBA-0006Jk-5t
 for linux-i3c@lists.infradead.org; Mon, 28 Dec 2020 10:55:10 +0000
X-Originating-IP: 90.89.98.255
Received: from localhost.localdomain
 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr [90.89.98.255])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 428F8C0009;
 Mon, 28 Dec 2020 10:55:02 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RESEND] i3c: master: dw: Drop redundant disec call
Date: Mon, 28 Dec 2020 11:55:01 +0100
Message-Id: <20201228105501.6104-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_055508_376110_C4969B68 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Disabling all event calls is already handled by the core right before
starting the DAA process. Do not do it again when the DAA process
completes, it is redundant.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

AFAIK I did not receive any replies to this patch with is still valid,
so I'm just resending it as-is.

 drivers/i3c/master/dw-i3c-master.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8513bd353c05..03a368da51b9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -816,11 +816,6 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 
 	dw_i3c_master_free_xfer(xfer);
 
-	i3c_master_disec_locked(m, I3C_BROADCAST_ADDR,
-				I3C_CCC_EVENT_HJ |
-				I3C_CCC_EVENT_MR |
-				I3C_CCC_EVENT_SIR);
-
 	return 0;
 }
 
-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
