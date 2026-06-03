Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB89CD6E64
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4h+S23EPvl0exSO/6LPDzNgN5iNGa6PQ9bOOXme8aA=; b=znNbbLZnr4gBJV
	nt3e/AY6CgnJfP4KTFRD0L3snbGYm5W2eHJdLUCCV6zc8Ze2lG6ztvWY03PscBrgUEUszCko1WbR0
	82GNXAzddqsXEf64rusGPuzPEqRoKIfbIJSYSMZ3eLDpXLlXPl8CRyO6hTEYswWzvJ03OWBx2i+zR
	XO2nVGG6wgebr3JB/f7hZBJEvdw4NdTKxTTANazS+AeDby2WU3f8ALaGccftvyBtd64QcU5t+Q4N9
	jyq8IlanRr52ILiFIvZ7iecAGnbvHwmf+Cw5uhgmZEnYfuI6p4wtN1dFrLeK2q2jKcwpaejfMl0fG
	CwsidgRLe/T4O8/dhUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaV-0000000Efus-0X26;
	Wed, 03 Jun 2026 09:08:35 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaS-0000000Effy-3YKV
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477712; x=1812013712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O0xK5K3/G53nKbyeNuBRq5NzzvrVjzhiTGzNgav0Z8A=;
  b=iZzhH2cSJl5alyiTZbFk67D1Cip8JJIqmxB50sXxbV5WQlzMMcaHL8DE
   kzl4oQ8OFIDEUaFojh6jBxHuKGUIiLqSxCug7hsP9ml2Nbuojknw3PAS8
   LnfgDd5TMhrfTnr28oT97d8yn7zs06NQPOUkzCazzz2HqoTMZ1L7wwO16
   czViH2gM/v+gI01DRQ1xqfXkyhwRRW98kGVj7bzAhG/2i9OVpjb95Shh5
   pLaVXv7yQT9kW2urGnoewNQ/mEcWjX8posV3af/ehu4XxFNRHN3WyivU8
   NbuZ2ImNZk2WrMY1Xen5bCsobcBroLv0wW0faT7434J93BZonM11W9xsE
   w==;
X-CSE-ConnectionGUID: 83xPBqFdRt+Fo3IG7tZDTg==
X-CSE-MsgGUID: 4vNFR4oLRS6rYUaxAPYLEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852654"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:32 -0700
X-CSE-ConnectionGUID: cRAVE+GJSP269cCypU6rxA==
X-CSE-MsgGUID: 3Xa6AlspSwadXpprSPRzzQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:31 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 12/17] i3c: mipi-i3c-hci: Factor out reset-and-restore helper
Date: Wed,  3 Jun 2026 12:07:49 +0300
Message-ID: <20260603090754.16252-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020832_898420_356CFC39 
X-CRM114-Status: UNSURE (   9.26  )
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

Factor the reset-and-restore sequence out of i3c_hci_rpm_resume() into
a separate helper.

This allows the same logic to be reused for recovery paths in subsequent
changes without duplicating suspend/resume handling.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	None

Changes in V4:

	Add Frank's Rev'd by

Changes in V3:

	None

Changes in V2:

	Drop redundant i3c_hci_sync_irq_inactive(hci)
	from i3c_hci_reset_and_restore() because it is called by
	hci->io->suspend() anyway


 drivers/i3c/master/mipi-i3c-hci/core.c | 19 +++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8274c84b16be..12a0122fb709 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -798,9 +798,8 @@ int i3c_hci_rpm_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
 
-int i3c_hci_rpm_resume(struct device *dev)
+static int i3c_hci_do_reset_and_restore(struct i3c_hci *hci)
 {
-	struct i3c_hci *hci = dev_get_drvdata(dev);
 	int ret;
 
 	ret = i3c_hci_reset_and_init(hci);
@@ -821,6 +820,22 @@ int i3c_hci_rpm_resume(struct device *dev)
 
 	return 0;
 }
+
+int i3c_hci_reset_and_restore(struct i3c_hci *hci)
+{
+	i3c_hci_bus_disable(hci);
+
+	hci->io->suspend(hci);
+
+	return i3c_hci_do_reset_and_restore(hci);
+}
+
+int i3c_hci_rpm_resume(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+
+	return i3c_hci_do_reset_and_restore(hci);
+}
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_resume);
 
 static int i3c_hci_runtime_suspend(struct device *dev)
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 97c31a315a6e..a3151c26827e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -175,4 +175,6 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 int i3c_hci_rpm_suspend(struct device *dev);
 int i3c_hci_rpm_resume(struct device *dev);
 
+int i3c_hci_reset_and_restore(struct i3c_hci *hci);
+
 #endif
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
