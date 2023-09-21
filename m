Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3675CD4959
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRu48LdKZ7jA33AYNv6WWTPh/AdAd2GYZBAci9iyR28=; b=ZrcvhzWM5arXfo
	6cs603NwgML5hnMpyj6Sn74rVD48AsVx/0r1qaRjheAOTfr+KOlIQh79qlEFCcvhrHjnbXKDvDbJq
	cj3uzaCc8DRzmu+Ot18Zs2IhphpusYY0VmdqEYxpx5PV+cQbgmG6rQ44XJQWOzTZZqb0SkFajMMqL
	XbDs2gNu/2fC9ep1RdnGwrCCCuLqlBYppLwXe9KCw0x0OcNP97n/VRmCg0aRsDhyNrdvxJNHqsQn9
	eLdOsmRZFuiOf7EhzPf63FeA1B8qzhl5fj5oVqHZxNh4mMV79ne64WqsANqqaS0WGL5TEemNnUUmH
	x0RoVyUERs5oELbkiC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChb-005Dz1-26;
	Thu, 21 Sep 2023 05:58:15 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChZ-005Dqh-09
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275893; x=1726811893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pbWAG9SFPXwE7QbvhLAd+mzLnlyrpC5vo4oFLD71CXc=;
  b=BpVqk15gkEsw7eeHsrVsxD8GJtPDoD+WGb3DDSWoHwDkaMn6QshDlRLe
   OpyuE1FDaJBDFiyH7nf5HwWwk65IlCTSUqhFUxDjrUPAqzRZIduAWuINU
   4VkpcZz5BUlUOqwzualzzjQjLxHOufWb42CGhceG61iJiGrytGNKyihTs
   mn/FVpDy2r2HwofZ1l9KTHnoOhxoOTJsxseZ96LCLKvFU/P2rRvuDIB4P
   EsLX4yIPTNO27lxo0kQefG/CsjPseDhLX6Uy0Hd7b2aKEE3EpUTSUaWhP
   ZN6r0icBTExY+bqVcnbDrgTccnDHZUwW4YNEMTX98Mh2mOzGOF02twg3y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678509"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678509"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771286"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771286"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:58:10 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 12/12] i3c: mipi-i3c-hci: Resume controller after aborted transfer
Date: Thu, 21 Sep 2023 08:57:04 +0300
Message-Id: <20230921055704.1087277-13-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225813_099954_4EE0CD89 
X-CRM114-Status: UNSURE (   8.66  )
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

Host Controller goes to halt state after aborted transfer and needs to
be resumed by SW. Add this resuming to DMA mode code too.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 00d20a020ffb..bee47aac6894 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -759,9 +759,11 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci, unsigned int mask)
 		if (status & INTR_RING_OP)
 			complete(&rh->op_done);
 
-		if (status & INTR_TRANSFER_ABORT)
+		if (status & INTR_TRANSFER_ABORT) {
 			dev_notice_ratelimited(&hci->master.dev,
 				"ring %d: Transfer Aborted\n", i);
+			mipi_i3c_hci_resume(hci);
+		}
 		if (status & INTR_WARN_INS_STOP_MODE)
 			dev_warn_ratelimited(&hci->master.dev,
 				"ring %d: Inserted Stop on Mode Change\n", i);
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
