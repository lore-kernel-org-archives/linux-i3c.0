Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A973CF6BE5
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKTN4dWMeb8SVUiVLv8SSWlHf6FhJ+BNSGvAJcig1dM=; b=eDDUN4MCgJHBh7
	L+GhXW5RdgWnyGouuj9+VDWXHr5JowseZk1qRg2NxWjEaQuUubm/l2cGhlmJJzrSBj+3HXUQgHI8W
	Chtzmtqv6cNBEFzEwYUBv1iDzaMOunfhhwvzNelRQ2KyL6NeVqvEg7NZ5vP0eGvGd+LA29yXUqg7N
	XPjVtg2R8al4DzqZ14d+SelcEpugAQ0sSct2BrNlhb55k4/Ym3bntRPj79gok1Lr/poXQpzgL723f
	G9/DsuByjMHbQXadeESfxvhABmFzFViZAKJ7nRWdcnqrjNRw2Imb1keTht67whcZ1ovSDcsofq+NA
	3pxXfT557J3DfRNWWZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2k-0000000GDP2-3RmT;
	Thu, 08 Jan 2026 08:06:54 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2i-0000000GDGR-1Tk3
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859612; x=1799395612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c6xJrZZ0VkB4N9uKdG3Evur9nzaNHv4vTy0KBHpXZMk=;
  b=C/6GTN4fR/xa/UGGIJvOScTuBdn4m1OQJU6Pd5kxW9foMWZfgJefKb+B
   8DDvkMAPV4fphTEojx7C3lK/cWA/wFidWmSlzJjShPOYNOSWXbraUbzAz
   NMtDglrkCvl/hto9ehuwYL+Fgq+WNuMisbjV7EVXVp+Zj4PQs6UNxkpzf
   LEzXS0HyfYaj78esOSAZqppTTXMRZChBRFn5xtuPslugV9XfZZz6Y6kxk
   kDPNtbiG8f7rrFDWiZRdecwMesy+GpekDIoumSQCS+SwCdLknLKJZw47b
   tlkpb7LjSxoF8urY7XYq9i/ibRM/5es59SOUpVWlmB8yc3b5uoIKdmDux
   Q==;
X-CSE-ConnectionGUID: NRSRM+vWS/6GS+MKDotN+A==
X-CSE-MsgGUID: IeVrul3wSuqOMXFDJej5jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792376"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:51 -0800
X-CSE-ConnectionGUID: sRuehYYTQG+frQ+R8Y3N3w==
X-CSE-MsgGUID: Hk3bSOCcQVeGiAGhxpghcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413653"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:49 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 20/20] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Date: Thu,  8 Jan 2026 10:05:58 +0200
Message-ID: <20260108080558.21767-21-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000652_401665_30B72593 
X-CRM114-Status: UNSURE (   9.93  )
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

Enable Runtime PM for the mipi_i3c_hci_pci driver. Introduce helpers to
allow and forbid Runtime PM during probe and remove, using pm_runtime APIs.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


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
