Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C701CCF2D4
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsRds15FSASifBHuXnjrJ3T1jzDGKljcWe54w5hxoz8=; b=B/gyS/GVEPb9M3
	TXjRzWQDVqtCmTup+KP0iQF+cECSgaoWxEcBFtwhe5DZAWjJAydFaT/t6l7E9sUZyfGRs2Tzzms8p
	tvyA5YZYTX9BsAmp2gzB7yeWWm/ZGGQJwbKkJPJ8eoHPS1N4FElgHFj8SpAwMJ8eK1i9uACyrnX+h
	FuwF9WVA/QCk/Y0lrD6aKdFhmy7SjVRHrICXb1KYl1kuBmZMHQ/aOQR1RGKBVjZMPeq4sJqfY9i6R
	wuSRfiFsVCw4vKvbnTR8cetr7vU9RAvMjUe82l1CKBRXh+4uFKCfwmc5Xz9SJPaE3zLrEGr7TvMII
	oN+wmroKaqYmD0IiQROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6J-00000001hO9-0jYX;
	Mon, 19 Jan 2026 10:03:11 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6E-00000001hMq-3f1w
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 10:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816987; x=1800352987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QnnM2msBLrrO2WtOXyg5OA66E2qi+vSpBxC/l7EdkvY=;
  b=L81tYAInqbkQuit5hSxF4u2LVOxlBgMltOdgMWh/yaSbtBO4y6rJjHH5
   zzWx4TNCH6k0oltJi+L56Su1QconklbxGRwueQmaRd7wdg0haH+kYgBP5
   7DXOJqYEG6DqDocZQmGiwiznx9cfEn0YAAdWiY3Qgh0Fn08Iy/Fgp2Nl5
   wBGJQQxW1UnkfbTT7qa8XEGxn6r/IkPyKWIqkdoEnXCVQmy5Qw6JoWCi5
   amk4nJPVtwjY2M5Z1PCNa2N6s6bUNdNXtwg4akahSw3EkxwHbRWsNbH5v
   hptBoSREKpg4YISCa4v3oyFwGBhIWX8qvkFmDFoAkR1/vbwUwehbtnhvw
   w==;
X-CSE-ConnectionGUID: MF2rOHuORvqwvRTDUU8gxg==
X-CSE-MsgGUID: 3gtkiuTSQ0eXswjuDpvrKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87605306"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87605306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:26 -0800
X-CSE-ConnectionGUID: i62lUlmDT2SxTatineA87A==
X-CSE-MsgGUID: b8Ww2xFTQjG6qssEcocgpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206179776"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.27])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 2/3] i3c: mipi-i3c-hci: Add optional System Suspend support
Date: Mon, 19 Jan 2026 12:02:11 +0200
Message-ID: <20260119100212.29607-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119100212.29607-1-adrian.hunter@intel.com>
References: <20260119100212.29607-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020308_591188_FA77004E 
X-CRM114-Status: GOOD (  11.63  )
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
i3c_master_do_daa_ext() helper with 'restore' set to true, which
additionally handles the case where devices are assigned different dynamic
addresses after a hibernation boot.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Helper function is now called i3c_master_do_daa_ext() and takes
	'restore' as an argument


 drivers/i3c/master/mipi-i3c-hci/core.c | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 02c5a133e329..ac8cfec1ff9e 100644
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
+	ret = i3c_master_do_daa_ext(&hci->master, restore);
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
