Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D8D78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTnMZ/MWXYGQwnXrywM5Itz37PW9xY3B2+7xrRbL4xs=; b=I3uvwEaUP3XBkj
	jEGBaFPfzcBjZo/x1Q+FCZeHcFSSH0kjgPZwO2OuNydkbmJFq79k1JgiYkDk+oBWSt/ZKY6Q9sjcm
	rPMuQ1/UtEZitRcEvFT8+gej+ZQWbCDCQJ9/03TiBihY2GwPtwLOc5uYsnjvIfNVWGiac6q7iwwOP
	/lxq3hSf0ZEqIsdQDH+FDtVwCTSwjc0HzeEN3edRy17SgeLfxvUmfOpdaYyJk/K7JgKo72KBaaaZt
	boN/jXVmFujnpPXbgDd1/hWU//kbxN/hSkOJ1Oyu7H2Y9ccQYb54wtPzgmnDOC/BixVHq/+nHpJqX
	8h6hbiNnhbMXjOCVsxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkS-0000000ARjZ-0PVS;
	Fri, 19 Dec 2025 14:46:28 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkQ-0000000ARes-14f6
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155586; x=1797691586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L4UpCbCGOnjuyIIP11NxPgEMLn9k1SfrMcjZHueO9Dc=;
  b=aTfOVcZJoPWjfkS6ozH97AIX/V7qRj9A0w/kT553zPiZP9Spx4m3KpWV
   qcpuCjZC3NEhA+fr7qFKgpdwsPrwKzjUD7K7iSIWl9ApamvXgxPw0Ij7v
   ZhJ893qJBytzXkNOPwRlebuXQO/UkJA+Saaws0uS4BrYTE5qIBKeVyjB2
   jm6DhpWTCMWR73TFki6G6jKD2h/ZvnGLvZBYeaK2YT0HpRLXteH/sH8bF
   XnM4K+jSjgry5PRZqsKlGkID9I3qg31Hpn6jiYnU+fZd6nowROTc6uNdp
   MJg8H7Nu6iEp7qIj4Yc8P/RrXOHcooY26e+OFLtHx7Kbk27VFX6iHZLBf
   Q==;
X-CSE-ConnectionGUID: GQSWfVPwSX+xPJ3DHzIV4A==
X-CSE-MsgGUID: T+VmSyaBQO2J0ZvSseqzMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93589008"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93589008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:26 -0800
X-CSE-ConnectionGUID: zgQF9KYPQZilqiOyjYqroA==
X-CSE-MsgGUID: 0lPnBo7nSpOJw0FcZtMkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564125"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 17/17] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Date: Fri, 19 Dec 2025 16:45:34 +0200
Message-ID: <20251219144534.84391-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064626_301525_802E7A23 
X-CRM114-Status: GOOD (  10.04  )
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
---
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
