Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AE8CD495C
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqqNNPDLPFHPeA82cPTYXo91gEtuqWNN5tAJ3ljPbLI=; b=TIq9BP3zOwKvLD
	F62bdRY58aeLv1hsuOaKMwNYgms5uhx2gP9vhUQI2L6mRrnRiucvvpoBHciGKva6PXIzNbwxNhTCd
	UP3+F199st9ywt9Xdn9zXQ6HqOW4Y7mKBhNvfcZTWRJSuRa6wSXtXmnqjrozFZDhpWuj8aMVqn1NJ
	436hQVZc7AguSbTPtgnRK5LaocRyhwX8NQcjWJCW+WgkF6VI72r0ll6XNBG37M235dr32T5+3rrQZ
	Fr6g8i/XNwhpj9acuwbEgj7Nws+OSyT/g8+8s/pk8zv48NXH75MTGrx+BSipkXfLPRhAO112zJ+Ky
	yrWVVcPm2ktK3SB5e3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCha-005DxO-1H;
	Thu, 21 Sep 2023 05:58:14 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChW-005Dqh-0z
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275890; x=1726811890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Wx89J7R8qdjnCZlCvpC5UUeWBxMtjE61nPS/qR6saU=;
  b=fIKTj0DmMW2gLb3Gdl7hWQ72PKv8EUNhDILM8KqAtxm3eDgi8a/ArwJS
   Ia18NUHEycEtDagdgGFk6BcmmrurFvuX1joi7M9RwzzThL+zPISG6BAvD
   y+K+MztvWhaVwu46fMbhPie1OL7h0labf4Drb6E1gA9gmetltY4n+RmK0
   U6U/+XSrtmm1B7pgwxqFSpLTAbVQiYg/p5Sncdx3BMQE8dsLC+g4tcdRR
   OnQMgAbPpjTPjSPUOtZKmNRA6z+ZHWnRsOEgslx3fPr40JlzItlDMrqWh
   CCO4wtWpIFaKn+ooi6g4bKJbquynyZMfVgSoIADyySznq3BZn4/M+00Ra
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678500"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678500"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771275"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771275"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:58:04 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 08/12] i3c: mipi-i3c-hci: Set number of SW enabled Ring Bundles earlier
Date: Thu, 21 Sep 2023 08:57:00 +0300
Message-Id: <20230921055704.1087277-9-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225810_450710_30BD8999 
X-CRM114-Status: GOOD (  10.45  )
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

Number of software enabled Ring Bundles must be set before using them.
Otherwise Ring will not start and may be power-gated by the Host
Controller.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index df569d1351be..6c7eef17921a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -229,6 +229,9 @@ static int hci_dma_init(struct i3c_hci *hci)
 	hci->io_data = rings;
 	rings->total = nr_rings;
 
+	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
+	rhs_reg_write(CONTROL, regval);
+
 	for (i = 0; i < rings->total; i++) {
 		u32 offset = rhs_reg_read(RHn_OFFSET(i));
 
@@ -329,8 +332,6 @@ static int hci_dma_init(struct i3c_hci *hci)
 					   RING_CTRL_RUN_STOP);
 	}
 
-	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
-	rhs_reg_write(CONTROL, regval);
 	return 0;
 
 err_out:
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
