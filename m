Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE85F8D765
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJeVCgTc5yX8j4QPPUSANa/ByQl356mg2abPbdeQlHI=; b=PSc7yaDpx0erGT
	Elv3o0FdM9rSPAGgLyEtKSt9iAS50areBEsB4P9EWVqHXdWTB3R0LEn043ezAs7p13GdRQjhy0Aq8
	jIs1Kpex9xpbjyMqoIUgpYu6Oq47SEcuTdQn+1ihbCUxWCBGWkl9Km8BPgkxRXAgvfMqmvzaOrzT+
	hcrtnd55tmJY+nbIffUttEaUeAHhyBxi97TezsQKKboBCtyv/VOnXKhPnqm4FoYIWGZe9PgGS5AUw
	FaoMRJHRTzmbRWVa/8uiTbXx/qqh12A3+T37BuHCVFVJKKKDEv5sRxhbTp6F5k6kpxL/YngaDPKl1
	l5m/nnERTQsRh/0JV3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxu-00000002jdK-2wWM;
	Thu, 16 Apr 2026 17:57:22 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxr-00000002jcH-3JMT
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362240; x=1807898240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z4Qbr2ArJ5Ivc+8c4wPA6/J5rPKAKUL1RthHGDqpNIQ=;
  b=hf68Y1kQ16lKig7C1agJua/FQLlfstX79JE7Yq7VpWBRo5kcLUAtyBRm
   QBSpgArZRaAjbYpBregaVg/rrA+F/dA/iIUuVVfUQpZwmn09FYjFLA68B
   +Q/N0m+N7xLMHLCjAarV92AqolBSrlYOgAv4rHP76vTarJkTPtUr6ae0L
   SLdo0ZeciggHo9Tc8le1gTDOOJ5sppZLS8Ot2QBf2k43V8cDVJ26rZ5BO
   dqWQ/cnQYHDcU8UznU9yN4jrtMHC+HlYUGrHDrusV6o4N7OinAVBAdnBm
   /waqS0FnDlck8CfJrdhdZaWmg6N7ZgL8szBfydTSjD95ITQxk1uOuoEsW
   g==;
X-CSE-ConnectionGUID: HdDZhcpGSDudQSzSfvQo1A==
X-CSE-MsgGUID: G6jXYaUpRP+Mrq4w1BKLiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778349"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:17 -0700
X-CSE-ConnectionGUID: 9mVuN3hpS9OFxzYFtDpqgA==
X-CSE-MsgGUID: Eu0n5YNyT4SQgPVxvuhnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784476"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:16 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/16] i3c: mipi-i3c-hci: Fix suspend behavior when bus disable falls back to software reset
Date: Thu, 16 Apr 2026 20:56:49 +0300
Message-ID: <20260416175704.41217-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105720_874480_DA2C5E74 
X-CRM114-Status: GOOD (  12.09  )
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

Software reset was introduced as a fallback if bus disable failed.  The
change was made in 2 places: the cleanup path and the suspend path.

For the cleanup path, after software reset the function continues to do
cleanup for the current I/O mode.  For the suspend path, after software
reset the function returns early.  However software reset does not reset
any Ring Headers in the Host Controller, so returning early is not the
right thing to do.

Instead, continue to call suspend for the current I/O mode, which for DMA
mode will reset any Ring Headers.

Note, although Ring Headers should not be active at this stage, performing
this reset follows the procedure defined by the specification and keeps
the suspend path consistent with the cleanup path.

Fixes: 9a258d1336f7 ("i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b781dbed2165..bb8f2d830b0d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -765,16 +765,14 @@ int i3c_hci_rpm_suspend(struct device *dev)
 	int ret;
 
 	ret = i3c_hci_bus_disable(hci);
-	if (ret) {
-		/* Fall back to software reset to disable the bus */
+
+	/* Fall back to software reset to disable the bus */
+	if (ret)
 		ret = i3c_hci_software_reset(hci);
-		i3c_hci_sync_irq_inactive(hci);
-		return ret;
-	}
 
 	hci->io->suspend(hci);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
