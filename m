Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7116ECD342C
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrnvSJ3U9k0jQUQdNVIqJEjwiyYxT2A3DwDyMBvH8Ps=; b=fLBDfYkTGElaMH
	2uLK6+5raDnSZDo3H+raHIUFhL8v9MFHKDDecfa8F/gqNSjFw0ugHMotej0b8ImAT3TKx/zzeqH1S
	l51awjf0JHNLBMumsmSu7jCUHD6KXGu/V/n7WGc6zSkhL4LEy8gGbY1u42ajGMgF83If46m3IMeLr
	PuifxlQf1p63o3Rz0tiV4c93QHm7+bN5d9Cq6nRl1/ynw0uLDs9+m2GiyVCfc65A2K4G+N4GN52HE
	j6p0180XKzgTOJgIijRcwFDm6t0ywclCUznLMIxxx/wXBix+EHLi992FBIm1CkiIvENTiCERkf0rh
	VIojzw3ul4aq96xB6qEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZB-0000000D3SU-0p7j;
	Mon, 04 May 2026 11:34:25 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ9-0000000D3HH-04n7
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894463; x=1809430463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dVsKZXcxZ5BtGeLdH16h9e8zvXX13Alg2ikK2Z0Ln8M=;
  b=moyn/RNc4kWtLTNA3xilOkD9drglZo6DuKTV4U80aVPaF3zFyunktoI9
   M3nmE4/cfcJ/VX1X7XiiajS2BkDYQoBktOHXCPp3RXIwKT9ZdIh3QfuPD
   BxhTdWRPUU7JLERpp77vvRP0LaX7S8VVzORXgUgWx+EJc0QabD9k8u+0h
   X2626uEhfX5oVX62bpNVvK2BCEU65QMhAswObRYLw2heQlKw2aJ/4Xqng
   1qxoEUcjdAXtBSN48c0blt0NQURQmNub3GFYFpflF4/m9nRwY3PNRDJfe
   T2Fui8XwFX3+CV8yqPLV1goNLpwrrEGcvvA0T55+Hx4lBaOb2VYZ1jvco
   A==;
X-CSE-ConnectionGUID: e0YbOmR5SceNv94Ib6d2Ug==
X-CSE-MsgGUID: lIhdPJcBSBOqxTp99wSUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315222"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:23 -0700
X-CSE-ConnectionGUID: KebiJ14yQiOgqiZV/kA60w==
X-CSE-MsgGUID: 6vc9fWzsTrm9BG98BaH8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478284"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:21 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 11/16] i3c: mipi-i3c-hci: Factor out reset-and-restore helper
Date: Mon,  4 May 2026 14:33:47 +0300
Message-ID: <20260504113352.38490-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043423_070425_637A7619 
X-CRM114-Status: UNSURE (   9.37  )
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
---


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
