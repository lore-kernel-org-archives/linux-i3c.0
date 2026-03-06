Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED031F01812
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juxtU4Lk1yxuxz+jJbkY+nQOzo0Pq6cJ/mWzMUffJNs=; b=ipoqzIXDVrCtEC
	hPkGGDQn3uBqz3Vtx5Uoa9w6oQ0zVxD0oCo/jQhflvyLrMFPySvHzVHGS20BGMQI7+cXeU/aJU20r
	5IlaeqAg/Adqz/RrYEE68etYdIvR+d7ZBshTJ1BdzqJ8lHAWWLY/EwPObIcdEM+ToafDAjv3bccX3
	WotW2i6tzEDQ8jG3rdCnr78OX0w9kz0Cck2q50kc0KJt710/j+kNkwkDXHTRJoaDLBsVgN5hCY2ix
	88a1xvNQYjkYsbFYg2yZHT/GyoQekqf5yw66qPk7OPMKI/KKYXPq4U+epIFh8zriQdssQxOquynZU
	Wj8O6KvrLb4lqUfPEAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQwf-00000003J7N-1HHN;
	Fri, 06 Mar 2026 08:54:05 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQwd-00000003J3d-2mhI
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 08:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772787243; x=1804323243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qgWuv4mkB26oO+o5wSHFxIMOYCOD8GUcosdl8NeKYrg=;
  b=XUlRrt5sWUDglur4Xum7Zk8biZJcYTg2glXcYbG6fo39dmG7BIzpb6uZ
   tgt8pHk5AtR8ihmj9M54KRaACL/u+y7+Xs7hqZ9tpXxBOyPwoBK44RSsX
   SKC6LRuUKzB8QU/UNPDrcuMHwtc4NChsTXdyk0xDn6GM1SsrPS0c5Aaul
   Y2mYpNnytBOwttkucNrWrDBQW4DMlv78Mvheft3NadL9Mv6wly1pgVS56
   8bfZFAUZuBw8wifHC+gjQmTyv909Uu5D4cWOtCHWpFhnbBVVjapTtu6Xw
   xQOmmx+1KTSRlNGlw5P39Q+oZJ043/mT4yLZCyw0lrjTU/ZHO5ktZAI1a
   w==;
X-CSE-ConnectionGUID: 7r9Kl/z5THyWynu+11lX3A==
X-CSE-MsgGUID: 66Osz3bfRFSN5IYdf1XTCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91467259"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91467259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:54:03 -0800
X-CSE-ConnectionGUID: x3gg1vidSfahWBM3XR84jQ==
X-CSE-MsgGUID: jxVFhWZCSZGGOddesUmY4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223641505"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:54:01 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V5 5/5] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Fri,  6 Mar 2026 10:53:38 +0200
Message-ID: <20260306085338.62955-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306085338.62955-1-adrian.hunter@intel.com>
References: <20260306085338.62955-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_005403_719185_24F81545 
X-CRM114-Status: GOOD (  12.10  )
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

Intel LPSS I3C controllers can wake from runtime suspend to receive
in-band interrupts (IBIs), and they also implement the MIPI I3C HCI
Multi-Bus Instance capability.  When multiple I3C bus instances share the
same PCI wakeup, the PCI parent must coordinate runtime PM so that all
instances suspend together and their mipi-i3c-hci runtime suspend
callbacks are invoked in a consistent manner.

Enable IBI-based wakeup by setting HCI_QUIRK_RPM_IBI_ALLOWED for the
intel-lpss-i3c platform device.  Also set HCI_QUIRK_RPM_PARENT_MANAGED so
that the mipi-i3c-hci core driver expects runtime PM to be controlled by
the PCI parent rather than by individual instances.  For all Intel HCI PCI
configurations, enable the corresponding control_instance_pm flag in the
PCI driver.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4 and V5:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Retain HCI_QUIRK_RPM_ALLOWED
	Amend commit message accordingly


 drivers/i3c/master/mipi-i3c-hci/core.c             | 4 +++-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d803c0b7a64e..b781dbed2165 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1042,7 +1042,9 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
 
 static const struct platform_device_id i3c_hci_driver_ids[] = {
-	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED },
+	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
+				    HCI_QUIRK_RPM_IBI_ALLOWED |
+				    HCI_QUIRK_RPM_PARENT_MANAGED },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 17f30706eb48..d6bbc3f8cd2a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -200,6 +200,7 @@ static const struct mipi_i3c_hci_pci_info intel_mi_1_info = {
 	.id = {0, 1},
 	.instance_offset = {0, 0x400},
 	.instance_count = 2,
+	.control_instance_pm = true,
 };
 
 static const struct mipi_i3c_hci_pci_info intel_mi_2_info = {
@@ -209,6 +210,7 @@ static const struct mipi_i3c_hci_pci_info intel_mi_2_info = {
 	.id = {2, 3},
 	.instance_offset = {0, 0x400},
 	.instance_count = 2,
+	.control_instance_pm = true,
 };
 
 static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
@@ -218,6 +220,7 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
 	.id = {2},
 	.instance_offset = {0},
 	.instance_count = 1,
+	.control_instance_pm = true,
 };
 
 static int mipi_i3c_hci_pci_find_instance(struct mipi_i3c_hci_pci *hci, struct device *dev)
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
