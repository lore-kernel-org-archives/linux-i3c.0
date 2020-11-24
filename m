Return-Path: <SRS0=M/mW=E7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51C1C56201
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3218C206B7
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2020 09:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+GrVYzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3218C206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBU8mmWSJXTL0Jvnpv6satRLyd0ToL3JmuhsGr+/Yvo=; b=s+GrVYzKeEJhj36GN2iV5T+iTQ
	osHGcOYgX/I7ejNov0M3GKST1jY6/h3+5fU1EE0YlQZQLHHk4go9GbaWAlrO0kYhH+4VwmRnf8n45
	1BjLQpnYulGFYXv3ucDJts7UJlsFz2LlQPndPtS+/KmEejrgTSI7CArcnKFPgnBmFWPZXjllL1Oru
	el7+oarPqb9QG3wxmxGNvPkgnr9FCZPSTfPr95OfBytW/MONbtU3wObM/F7MZAa97TJ1WsildTk75
	q5CC+AqK6+usbnB4bxxLUPD24jeh+6e4OCOTq9BTkXOjiXU9hGm/xcpqD6AVUa7PgMhWQfROIWWvt
	zcF5eZIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khrYD-0006Z0-BH; Wed, 25 Nov 2020 09:57:25 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khXXH-0002iX-9n
 for linux-i3c@lists.infradead.org; Tue, 24 Nov 2020 12:35:07 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1khXXE-0004vU-LI; Tue, 24 Nov 2020 12:35:04 +0000
From: Colin King <colin.king@canonical.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-i3c@lists.infradead.org
Subject: [PATCH][next] i3c/master: Fix uninitialized variable next_addr
Date: Tue, 24 Nov 2020 12:35:04 +0000
Message-Id: <20201124123504.396249-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_073507_428200_CF1AC63C 
X-CRM114-Status: GOOD (  11.99  )
X-Mailman-Approved-At: Wed, 25 Nov 2020 04:56:59 -0500
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The variable next_addr is not initialized and is being used in a call
to i3c_master_get_free_addr as a starting point to find the next address.
Fix this by initializing next_addr to 0 to avoid an uninitialized garbage
starting address from being used.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 6dd234a82892..d97c3175e0e2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -293,7 +293,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 {
 	struct hci_xfer *xfer;
 	int ret, dat_idx = -1;
-	u8 next_addr;
+	u8 next_addr = 0;
 	u64 pid;
 	unsigned int dcr, bcr;
 	DECLARE_COMPLETION_ONSTACK(done);
-- 
2.29.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
