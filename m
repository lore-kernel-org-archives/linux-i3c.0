Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A043D26280
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Jan 2026 18:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7SMvkabhQpiBgJH+T2hU5RUFO3MjF3Py5nzM5k75II=; b=Sfn12IxSm9Fvsb
	XJsXlWBXntuIlneAlWOdUFS1FQuSqrFQ+TcYsC8d4ju61ZvsX6zyviwRGhJT1BnsAR5rdUvKXG7XC
	HGQVcuvjMC8xca4DET4Fx+dPTFwJysxJAzp1uqJWP8rXwMz6nBBP94D5S0EpVJgwjQzoa9O3T9Dx4
	kLMIMrzJSujBREPdLZfMGtpPTsBssSPfNkTf0jK9UlQA2vBgcrWV1250vs9L5+GChDXWPRLEyGWKH
	OicttyHxDs9Pnej1WtPfeEu4VasB1Up8TZMdC7O4aTKNOkf2yg+rMIr6o1UIfsk9GzGL10oQNs4yg
	Q9monQAbU61K4yHMUiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGc0-00000004JPK-3Iqu;
	Tue, 20 Jan 2026 18:37:56 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGbt-00000004JNV-3aU2
	for linux-i3c@lists.infradead.org;
	Tue, 20 Jan 2026 18:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768934270; x=1800470270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EgX/mF+QgMq4ziTdlyMw7VpwGdhKQriNQouTf0GCfLQ=;
  b=kG2y7zTBZVLgg5GvLYjgw70ZfIt3FFzwkM1Xhq0OnJWFYWVsVUC1sEQP
   MjO1MJfVdjtLCKcp/J0f/BYEYgfui1KR1B5zKCdnIODlaHeuuiVTlcIoZ
   tC+aXsz2Y7nAGL6Jk7ZchtZluJJHcChKxJecN4VR2enmlrDye85afy1v0
   bv50ARfwG4VoYhRYrf6aogfQ2effdOQKgxyM2EruoZGJZy1J+DYlm3rSO
   KBii33moa1MaOdeEJMLQWGsr9VqynMbi72qyZS9Ta4C+9pqmHMrzN2SS9
   YhdwcltqAFdeM31eah4z5hH8AL8oArViMTU+z/MWyF73/tluuM+/u0Xj4
   Q==;
X-CSE-ConnectionGUID: b3HExC8MRjWBNA9ee95UCw==
X-CSE-MsgGUID: rARqS4OvSC65ht/Vq+Ab6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80874619"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80874619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:37:49 -0800
X-CSE-ConnectionGUID: OoXse/y+Q4SirDRV8tWyNA==
X-CSE-MsgGUID: PxMiKtoHSd25vSEAsAJkJg==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.170])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:37:48 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 2/3] i3c: mipi-i3c-hci: Add optional System Suspend support
Date: Tue, 20 Jan 2026 20:37:34 +0200
Message-ID: <20260120183735.60654-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120183735.60654-1-adrian.hunter@intel.com>
References: <20260120183735.60654-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_103750_612406_B7F89C04 
X-CRM114-Status: GOOD (  11.16  )
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
