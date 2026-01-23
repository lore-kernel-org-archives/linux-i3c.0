Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B342D6CFDF
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 06:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQdUPRJxY1zQ+XPBGHj/qXBcJTsqu2BhHIqcFtfY0PM=; b=2gMjxCs/lAhmpE
	9d8YFyzM5ugVMm2Ugsqm9kGChJrDqz96DTyCdR1MPnw7Ca3JWH8WrJBFwWxm7mJTXX44AV81WnLLq
	2kUxSSecr2GKK2E1k6+phElzyulcPk17bH3I3LyzcHc0wlnoFGr+qqQAl+P6wCN9RBRWnHRHdmnit
	YpEZWCPP/DbEAIf2azdcbf5cZU4Ol9AxA/WbF7bCh3xfPQrxfvLUPkzBw9v9B69VjoEOzMDnhafj2
	/S+KDT8dpKlW1rIpTJTXeRw0M6e43V3oNyWfSTLCUQ8+W122NLKXXZkicvG39UjzDe5xCDfkIIZ/8
	RyQdiE1ZGxrepAEvZSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjo-00000008Ilh-0TTu;
	Fri, 23 Jan 2026 06:33:44 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjm-00000008IkG-0yd9
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 06:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769150022; x=1800686022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ipwM5ICmSt58nmD8OJkMY9vbgZdMrgGNHhlXEu4ihoI=;
  b=BOH5W/FlHtA7rEPXnuEo+oYnNeHc+C4otg5qHPgkb2Ug12XkRh9zlDZQ
   HJnlxllMZeq9jDK/GWLzdyelCXlAlh2Cm4T973EP/zdZC69GXGwPUknJ8
   9Gwm5k1j3r4ni6MVOE+cB+F4qcGoebLLo3iajEE2zHBpDS/mMqiHXy6/m
   y/GYdlMoyN/r/fM3ttnOxs1aFkLMr6QBHdUcAknMl1cFNKcZy7Gr9Bd73
   uhWRp8ya1GFwWoxtP/sQUVtX5dkkt+toBGmU2DQPfi7J1cxiz9JE3r+gj
   SKrU1l2E708j5mOZfgHpQBJR8ynsPK98SQNt3Q0fj477zEXfvf1Dq130/
   Q==;
X-CSE-ConnectionGUID: GIlzI/ifQD6sgtS9cveO2g==
X-CSE-MsgGUID: dPv0JoCKTFGZ3fG2cQ1mgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81514045"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81514045"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:42 -0800
X-CSE-ConnectionGUID: kpiJuvJjTnGuOr4cXXSqxA==
X-CSE-MsgGUID: cdp1OIWvSOeuICJ/tVBNSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207210830"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.101])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:40 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 2/3] i3c: mipi-i3c-hci: Add optional System Suspend support
Date: Fri, 23 Jan 2026 08:33:24 +0200
Message-ID: <20260123063325.8210-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123063325.8210-1-adrian.hunter@intel.com>
References: <20260123063325.8210-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_223342_306515_CD75170E 
X-CRM114-Status: GOOD (  11.10  )
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
i3c_master_do_daa_ext() helper with 'rstdaa' set to true, which
additionally handles the case where devices are assigned different dynamic
addresses after a hibernation boot.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Rename 'restore' parameter to 'rstdaa'
	Add Frank's Rev'd-by

Changes in V2:

	Helper function is now called i3c_master_do_daa_ext() and takes
	'restore' as an argument


 drivers/i3c/master/mipi-i3c-hci/core.c | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 02c5a133e329..e925584113d1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -769,6 +769,49 @@ static int i3c_hci_runtime_resume(struct device *dev)
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
+static int i3c_hci_resume_common(struct device *dev, bool rstdaa)
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
+	ret = i3c_master_do_daa_ext(&hci->master, rstdaa);
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
@@ -945,6 +988,12 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
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
