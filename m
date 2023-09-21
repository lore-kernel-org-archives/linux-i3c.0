Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93724CD495F
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIQsFi1JxfbWtWKyXEbiEpOD7RPOHF4ZfzLddRWWPkE=; b=cGPDTLVdEPENuq
	AfXN/yqIkTvbNZPj6tOzC4T0EMfJHADq08ASGaDOhrJGnoA/hC1VGwaXBrpLmAmQbZUPiwfKEstDf
	Z2ICas+e2uCvpmg9ODAEtPKyxE4uoMQfiO44AngSjSGHpTfhubLBd2weeJEVCP38E/iVGJ0IjQNXE
	E8JKyxIGdYCBAB9Jwft537u9R+KhdfFNbosoYKtonpGa6/VzC4uVr1AGTCBIveqMlp2FpzHA2FjVV
	7rCpvxI/9chwD9s4Q/8eLDczvwXIuqJ4ueiY0wUMkauH8Bq4Xh82jfmdjJtP7iNOEE7yW4FpYO5pH
	08qATaIDSE9pAw9TQOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChb-005Dye-13;
	Thu, 21 Sep 2023 05:58:15 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChX-005Dqh-2L
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275891; x=1726811891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3qJ1kbEKRiOKgUMdYKHwI/85YY4D8mBZHC6RBZZ0qcs=;
  b=kPpHAcTxMd1/r7DXKz25pRDDZzGPTf4vwe8YQnc5sC8Z2bT7P4dOUN5z
   22r7NreUcEs5tI6cEvSsv6FnRMN7TfWwnq96d7pioTAkHft8X++XMxN03
   GkCQkCpz0Xo5TxFAMZQXoWxJW6WeupoHjRYOgGl6dGDFQxUj6fkZKbjmm
   vg9paKDOLXG1vhmXEwlxEIC5k2hvLLaCkWr61i+ZvrM0CjGKohW7uKYwK
   Lql0bQ+HLWETWaYnWe8otpDFxxl6B1UyA4heUZv6ozVYSACW3NI7uaWGL
   bM5n96ivDT6ET0I4PvdPZwgTdZMmrTRcGdxFiv+9sOM/2nNXShyoNvMi8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678506"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678506"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771284"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771284"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:58:08 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 11/12] i3c: mipi-i3c-hci: Resume controller explicitly
Date: Thu, 21 Sep 2023 08:57:03 +0300
Message-Id: <20230921055704.1087277-12-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225811_795193_6F836F26 
X-CRM114-Status: GOOD (  11.20  )
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

On an HW I'm using in enabling work the RESUME bit is not set in the
HC_CONTROLLER register when Host Controller goes to halt state. Value 1
should mean controller is suspended when reading and writing 1 resumes it.

Because of this erratic behaviour plain HC_CONTROL read and write back
won't resume the controller. Therefore do it by setting the RESUME bit
explicitly.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d7fe8e62820a..1ae56a5699c6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -174,8 +174,7 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 
 void mipi_i3c_hci_resume(struct i3c_hci *hci)
 {
-	/* the HC_CONTROL_RESUME bit is R/W1C so just read and write back */
-	reg_write(HC_CONTROL, reg_read(HC_CONTROL));
+	reg_set(HC_CONTROL, HC_CONTROL_RESUME);
 }
 
 /* located here rather than pio.c because needed bits are in core reg space */
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
