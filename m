Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3E3D29DE4
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHTMphT4FvemRZ5DlAXDy1y9m0n5gwTgBlb1MVnz18w=; b=xp5rS/Tg6Hj/zf
	6s7iOqKf/hCNdP+V2gnQwTK+TWiqhe38s9Og7MJ2G3kTxpWOI9RyM5qYjU19f30NOqxL/z7gQ2juH
	eOFOtGnVzygzQvhQAkHKGcbPBd+H0GpeKeIKUUtzg577qY0X/hwHXvKuYuekdGKD5QfxSehLFoxmU
	b751Ydx+ipcOhcwtd7An9FRDuCOs5RcR9ZfROA0PfAlnFJWcaqnK6NOMzYDsWRFOgAAfyJSiGOah+
	jqwUUNkdKPVBKjTmmbK56OYoTnOqwBcGR68YplRKDIIhHOvA/ARLQscuILFBJ9632n0OFmOeby82M
	YVmauQIh9MvBSNvT8nAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYov-00000006enw-3KCB;
	Tue, 13 Jan 2026 07:28:05 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYot-00000006ean-0XSu
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289284; x=1799825284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z+YW09ZjFn1pqcsdphXi5rOE1NUElKadq6wPv8NnfQg=;
  b=a1jBcbxvIz/fXOr2iWkPDK5UaZ1RuOt2uz7Xj9nlZIds3cifTiDFFpKX
   H+SAQUEaVVQLpBUwT9xok2vyz1I5FCWPcBqrDuz6F5VylTTGt0WAv6GEX
   uTIqcXeEzVa0a/XrrfpcJyBQs25TNcjNqkzBmTPqQNyliHmJw1PtRkM1c
   0kzMTUhtez9KOHiwT7EuzpI5mpOBQ++ggTYk+rWDVacsjuO/G89Sjxep1
   StHamwl6GT8ZopZ/qUUOzk6NEKQULg326yNcXiOAnxE/GiADmlhDjzUrW
   8txnMfiPWc4lqvhI++u340VKQdtliS0UcTDQVBa6dmFXXGvvm6eMdkt4D
   g==;
X-CSE-ConnectionGUID: bCsfemwORmCsvEc86yxJQA==
X-CSE-MsgGUID: Qk8yUqETQtaDZg1v3T6gDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625554"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625554"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:28:04 -0800
X-CSE-ConnectionGUID: /2tHe4FESMa0QwJrGc//EA==
X-CSE-MsgGUID: NloBbujCS5CX5NN9F0TIqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021417"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:28:02 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 21/21] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Date: Tue, 13 Jan 2026 09:27:02 +0200
Message-ID: <20260113072702.16268-22-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232803_207421_A97DA09A 
X-CRM114-Status: GOOD (  10.36  )
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

Enable Runtime PM for the mipi_i3c_hci_pci driver. Introduce helpers to
allow and forbid Runtime PM during probe and remove, using pm_runtime APIs.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	None


 .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 458f871a2e61..1b38771667e5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -18,6 +18,7 @@
 #include <linux/platform_data/mipi-i3c-hci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/pm_runtime.h>
 
 /*
  * There can up to 15 instances, but implementations have at most 2 at this
@@ -208,6 +209,18 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
 	.instance_count = 1,
 };
 
+static void mipi_i3c_hci_pci_rpm_allow(struct device *dev)
+{
+	pm_runtime_put(dev);
+	pm_runtime_allow(dev);
+}
+
+static void mipi_i3c_hci_pci_rpm_forbid(struct device *dev)
+{
+	pm_runtime_forbid(dev);
+	pm_runtime_get_sync(dev);
+}
+
 struct mipi_i3c_hci_pci_cell_data {
 	struct mipi_i3c_hci_platform_data pdata;
 	struct resource res;
@@ -285,6 +298,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
 	pci_set_drvdata(pci, hci);
 
+	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
+
 	return 0;
 
 err_exit:
@@ -300,6 +315,8 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 	if (hci->info->exit)
 		hci->info->exit(hci);
 
+	mipi_i3c_hci_pci_rpm_forbid(&pci->dev);
+
 	mfd_remove_devices(&pci->dev);
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
