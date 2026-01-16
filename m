Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B10C982CE
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZupFKBE0xJnOXsJuXnpxavVUzsJRxX4XCSxFMbM/4WE=; b=UL5SmGP/IlsrVn
	lhHA4FgkWzZtdPLXHCf5nWIGLpslTuQuZyvN1qvGkD7AwHm7syldFcvigpyyEXK6PTpRFM0tUPPMw
	rhJJ2LPRdsjsaEvlWWPqgtLnzsL1aMjpwz3WyXaatPXkuU5pELXdvmWpAUwNADxizwdodlBXoslVN
	FNyJK5+kyWTHrnEOzybkai/FOa7XWC1vlKystd9hk1y1u1a97luaCzW4y1sa7ZrDGMpYd/38WqRGy
	2znDD8BVCFbdrwk9LtDmmcOAgnGu1CVwoGu9l4HyODwcQvnoqu5rovTqMeCDd9awq6OvrI6qM2OT/
	lWMiCW6ZNjGdNOgv1z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVP-0000000EKSA-21WV;
	Fri, 16 Jan 2026 15:12:55 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVM-0000000EKQu-3fAt
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 15:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768576372; x=1800112372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5RYpahTurz6dFRK00PcXMcMY4usqka2yBd6LcC2GPxQ=;
  b=cFwwugZwavk5SbhffHxldrI3OwPSv/gNmAh1IllnC277mUAkINt9xbKz
   nXsgUYknxIOEQPR93oeK++kXH0n5gQ00Oqyq5qQv9pGOFKabBOgqzstF6
   11+c8KCwEmcpTYuMF3aL4VGSk8dGP18UwWnPvThuf2atJd+mJ+f4P9QCW
   4HtBLrfh6k6txJGQjeW1sR/ugKJ7hxm0u7mCqyDeG7qbJGWgN7lioLH19
   1Py3OMVtNUK7XwInqdkJFOEG+x1eDGB/1TI05ocrDjwV7/NR96DNvx6vp
   iYwIyMIZlMbsDSmuIGMAzuCutTJj5AECjw9cJ44LU8ZO/QLGpCwg1z2UT
   g==;
X-CSE-ConnectionGUID: puLWxD0UThaxzuC7BynV9A==
X-CSE-MsgGUID: 2OsddCy+S/KcEGqVi4WBBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69802815"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69802815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:51 -0800
X-CSE-ConnectionGUID: blLbUXyLRk69bzwAokgHqg==
X-CSE-MsgGUID: KAh8ZrqSRweHTrG3Sev2ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="209743023"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:51 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 2/3] i3c: mipi-i3c-hci: Add optional System Suspend support
Date: Fri, 16 Jan 2026 17:12:36 +0200
Message-ID: <20260116151237.96721-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260116151237.96721-1-adrian.hunter@intel.com>
References: <20260116151237.96721-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071252_956773_1681BF96 
X-CRM114-Status: GOOD (  11.05  )
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

Add system suspend callbacks.  Implement them by forcing runtime PM.
Consequently bail out if Runtime PM is not allowed.

On resume from System Suspend (suspend to RAM), rerun Dynamic Address
Assignment to restore addresses for devices that may have lost power.

On resume from System Hibernation (suspend to disk), use the new
i3c_master_restore_daa() helper which additionally handles the case where
devices are assigned different dynamic addresses after a hibernation boot.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 02c5a133e329..b972d8bc81e6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -769,6 +769,53 @@ static int i3c_hci_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int i3c_hci_suspend(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+
+	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
+		return 0;
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int i3c_hci_resume_common(struct device *dev, bool restore)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+	int ret;
+
+	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
+		return 0;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	if (restore)
+		ret = i3c_master_restore_daa(&hci->master);
+	else
+		ret = i3c_master_do_daa(&hci->master);
+
+	if (ret)
+		dev_err(dev, "Dynamic Address Assignment failed on resume, error %d\n", ret);
+
+	/*
+	 * I3C devices may have retained their dynamic address anyway. Do not
+	 * fail the resume because of DAA error.
+	 */
+	return 0;
+}
+
+static int i3c_hci_resume(struct device *dev)
+{
+	return i3c_hci_resume_common(dev, false);
+}
+
+static int i3c_hci_restore(struct device *dev)
+{
+	return i3c_hci_resume_common(dev, true);
+}
+
 #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
 
 static void i3c_hci_rpm_enable(struct device *dev)
@@ -945,6 +992,12 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
 
 static const struct dev_pm_ops i3c_hci_pm_ops = {
+	.suspend  = pm_sleep_ptr(i3c_hci_suspend),
+	.resume   = pm_sleep_ptr(i3c_hci_resume),
+	.freeze   = pm_sleep_ptr(i3c_hci_suspend),
+	.thaw     = pm_sleep_ptr(i3c_hci_resume),
+	.poweroff = pm_sleep_ptr(i3c_hci_suspend),
+	.restore  = pm_sleep_ptr(i3c_hci_restore),
 	RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)
 };
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
