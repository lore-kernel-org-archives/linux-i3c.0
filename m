Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB651E95387
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueG95smddwZVBXpFdcYDPCp7hlEBffrvJ/kljslehkg=; b=Tifkwzaurfe7Mi
	ee+Z83Ox3fXmU6oBN3cPsIQqpH7K5cZMMQM5UJIH0Fe50CUAexg+2c1hFi1UHv1iU9aiZn3SiNoAA
	c1rnOWY+j9WlbapWZxmBCXRh0ogwM8FzP5EKFddgWykQDbvIgysX72iLEPnwgC1TFjMmODclhYlbr
	MHavaDmfub/YoRlTN0gL8aEe0JIFJzYUa8dUFcgllPArElbeDao+DkAUScHYzd5ur8lgmqEDheAac
	yfhqlOWagYmzEKXrV76DUChKiJC/1x2M1vaZRM6m/FXGeWcbjO54+AG3gB/nl7sabLVmKDtQHr7v6
	X/cZoaOdqUZfyGs/5Jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar6-00000008LKu-2r5b;
	Wed, 04 Feb 2026 11:15:32 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar4-00000008LHZ-2LLr
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 11:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203731; x=1801739731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tg6qAlKvIpUYCnfDQ5uuuIvk1cMvfNW9bDreMnl92H0=;
  b=GSQiIGMdq5V34oGw3MI6uzg9vNceESF9AsXDfdMHO8OjLn7Gsm1yguou
   ux/eZKeBJ47pxcRFARCB+NsRw/BQlBbpWlCVaYgyTAb8SXokBjcKdE4K4
   QJkq7EhO1Wz5sThNS0t0XOsqBQkUF3HWLOaTmjC5N0AD13Zy6P0rUeXQH
   RD5fnh8YuH6GZqT69EXDdxHUemylDf9PcoeCZ/rb2TYKVXQf/QW0y6m1S
   bgQQhj4Pjp8aoKjwcvtEn/O82QruPmM8PZiYsYuvTFvNl2pokTI8c2Kjd
   1W3SLOmu6C4XO0joCzBLEtwWc/H0StQ0MuBWVikJgO9KqQzAVyP/26pMb
   A==;
X-CSE-ConnectionGUID: gh4TDiYBRYm/eNUqF+l6/Q==
X-CSE-MsgGUID: zi7YqKwDTTilY7Ac9RNaFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70406063"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70406063"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:30 -0800
X-CSE-ConnectionGUID: Zxzp3TygSiyv7311WG4iig==
X-CSE-MsgGUID: fMiMOBW7T7StW+R85+rP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739285"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.181])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:29 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 4/6] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
Date: Wed,  4 Feb 2026 13:15:09 +0200
Message-ID: <20260204111511.78626-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204111511.78626-1-adrian.hunter@intel.com>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031530_613604_6EE8BD8C 
X-CRM114-Status: GOOD (  14.11  )
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

Some platforms implement the MIPI I3C HCI Multi-Bus Instance capability,
where a single parent device hosts multiple I3C controller instances.  In
such designs, the parent - not the individual child instances - may need to
coordinate runtime PM so that all controllers runtime PM callbacks are
invoked in a controlled and synchronized manner.

For example, if the parent enables IBI-wakeup when transitioning into a
low-power state, every bus instance must remain able to receive IBIs up
until that point.  This requires deferring the individual controllers'
runtime suspend callbacks (which disable bus activity) until the parent
decides it is safe for all instances to suspend together.

To support this usage model:

  * Export the low-level runtime PM suspend and resume helpers so that
    the parent can explicitly invoke them.

  * Add a new quirk, HCI_QUIRK_RPM_PARENT_MANAGED, allowing platforms to
    bypass per-instance runtime PM callbacks and delegate control to the
    parent device.

  * Move DEFAULT_AUTOSUSPEND_DELAY_MS into the header so it can be shared
    by parent-managed PM implementations.

The new quirk allows platforms with multi-bus parent-managed PM
infrastructure to correctly coordinate runtime PM across all I3C HCI
instances.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	For HCI_QUIRK_RPM_PARENT_MANAGED case, change from
	disabling runtime PM to instead causing the runtime PM
	callbacks to do nothing


 drivers/i3c/master/mipi-i3c-hci/core.c | 28 ++++++++++++++++++++++----
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  6 ++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index ec4dbe64c35e..149b3fad34b5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -733,7 +733,7 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
 	return 0;
 }
 
-static int i3c_hci_runtime_suspend(struct device *dev)
+int i3c_hci_rpm_suspend(struct device *dev)
 {
 	struct i3c_hci *hci = dev_get_drvdata(dev);
 	int ret;
@@ -746,8 +746,9 @@ static int i3c_hci_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
 
-static int i3c_hci_runtime_resume(struct device *dev)
+int i3c_hci_rpm_resume(struct device *dev)
 {
 	struct i3c_hci *hci = dev_get_drvdata(dev);
 	int ret;
@@ -768,6 +769,27 @@ static int i3c_hci_runtime_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i3c_hci_rpm_resume);
+
+static int i3c_hci_runtime_suspend(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+
+	if (hci->quirks & HCI_QUIRK_RPM_PARENT_MANAGED)
+		return 0;
+
+	return i3c_hci_rpm_suspend(dev);
+}
+
+static int i3c_hci_runtime_resume(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+
+	if (hci->quirks & HCI_QUIRK_RPM_PARENT_MANAGED)
+		return 0;
+
+	return i3c_hci_rpm_resume(dev);
+}
 
 static int i3c_hci_suspend(struct device *dev)
 {
@@ -812,8 +834,6 @@ static int i3c_hci_restore(struct device *dev)
 	return i3c_hci_resume_common(dev, true);
 }
 
-#define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
-
 static void i3c_hci_rpm_enable(struct device *dev)
 {
 	struct i3c_hci *hci = dev_get_drvdata(dev);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 819328a85b84..584ee632b634 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -147,6 +147,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
 #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
+#define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
@@ -156,4 +157,9 @@ void amd_set_od_pp_timing(struct i3c_hci *hci);
 void amd_set_resp_buf_thld(struct i3c_hci *hci);
 void i3c_hci_sync_irq_inactive(struct i3c_hci *hci);
 
+#define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
+
+int i3c_hci_rpm_suspend(struct device *dev);
+int i3c_hci_rpm_resume(struct device *dev);
+
 #endif
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
