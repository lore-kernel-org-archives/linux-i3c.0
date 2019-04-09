Return-Path: <SRS0=XZWt=SL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081DAC10F0E
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Apr 2019 17:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDEAF20850
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Apr 2019 17:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZVfwcQp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UbVGvjYG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDEAF20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1dv4MRRkzcoG53ENNtJuAOw+Px495cEOSSuSUqcvWsA=; b=WZV
	fwcQpZIjY/GhoV3OzriR6pjdcSVZuHqzYCJJ2nykqN4jf46cOPUribVsWKU+1gJ9kUuvIJXqWSxcu
	jnQ9f8Y9uz7D5JN2Ivt7hEWL9+6HY9aUeTtPspGThR+6pcAceLzEUolqNG6YbhRa9O9h2/zZuqZqz
	x1H9KP6J5ZHxUowpEVGu0S3RnMYGYAxUR1van2qDJ1i+ji/qDRz8mcckLNq/cXC50FQzK/nr+WXbi
	Y7xuJ5Xw3nrsymB878viOdbabuzCTrJQiznxy2h8Ud67DclxQObkG/0i4ITkwCl5ZloxhsJbqv1ml
	KyexLipktN9/0IcoRi/ShHtsNAURtHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDu6w-00021k-CU; Tue, 09 Apr 2019 17:00:38 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDu6s-00021B-S2
 for linux-i3c@lists.infradead.org; Tue, 09 Apr 2019 17:00:36 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id E570510C19F9;
 Tue,  9 Apr 2019 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554829233; bh=qYW9CR74s75k1p6PigaJRinaO/YYqxa9TonXg7nrbVQ=;
 h=From:To:Cc:Subject:Date:From;
 b=UbVGvjYGT54ru+ycB7TJtAsNih8DC3A+UM5vF2I4pY+GXdO2polf5Hbh3oI9YWFWc
 HTB43I4WCuLe1TQadEUV/E6NebAEFh6KQ0vpmP60Q7cD0jQGweq4xmjRGC8dAR0iTS
 F3H+ej1L8GvXbVFzRZZ/Mi1ZJ3MGHshpGsDV35aCs4zs1BV3kIgHxEb2BNukNZZMRC
 c8jS4vYkoSDoNnwQ1ExRF0Ajf5JyeRh2IXWTMVBJtDqrBxjJPSCjKE/w72zSfldRw0
 uQSQr5uAXBP4VbgUaM5///l+zCVWDxeFm/tDLAhAWWFsMUGolP2juSkderJyl/7+p4
 t8PzGGV2jnM8w==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id 9CE035311;
 Tue,  9 Apr 2019 10:00:02 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: Fix the verification of random PID
Date: Tue,  9 Apr 2019 18:59:59 +0200
Message-Id: <f787c7ac5a4a82624b1711b9eba2a2a1d4cf5b58.1554828338.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_100034_909877_70CF092A 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: joao.pinto@synopsys.com, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The validation of random PID should be done by checking the
boardinfo->pid instead of info.pid which is empty.

Doing the change the info struture declaration is no longer necessary.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>

Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <stable@vger.kernel.org>
---
 drivers/i3c/master.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 569ea68..d23a57e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2006,7 +2006,6 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 {
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
-	struct i3c_device_info info = { };
 	enum i3c_addr_slot_status addrstatus;
 	u32 init_dyn_addr = 0;
 
@@ -2038,8 +2037,8 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
-	if ((info.pid & GENMASK_ULL(63, 48)) ||
-	    I3C_PID_RND_LOWER_32BITS(info.pid))
+	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
+	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
 		return -EINVAL;
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
