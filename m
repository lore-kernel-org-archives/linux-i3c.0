Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A5EE95385
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzXjpSlHKa5ABpElaqGQovh4JnH/O/hb3q9tdYa017Y=; b=hbgrnslRY/SQ+2
	VFBeHssQz+q0AVPRGLeuztd3ybOTpiJAUjD8FMQ71PVYS27s/S99Qn0BAyAMOaysjZG2OJ2RqEUtd
	d8BujFGe6PcfxVBuAuewWFPMiESkLE0vnYGM/uMZJZQRx9PT3PP1IAJOzyvk8HNKR2jLFDfUG50oj
	3PnRAs/M2AIfJ6vxgcehCZ4gVVs/HkEHRhvS4weP7hLQpMxUhiIYngnFpgcyMR5ru6f3/Z6xmHW5Z
	cHReHQMTnC7MPSOJS4tRdZzTmxXm5aJlWTaJkee8lSpBa0vylc7kcqyhKQU+6JNYDHBQBSr0BJJfI
	aD2UkvDn2JeOKbIGlVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnarA-00000008LNA-1oJN;
	Wed, 04 Feb 2026 11:15:36 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar8-00000008LHZ-3OoE
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 11:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203735; x=1801739735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qFV5w6/dojBgFuMoTmraSw+wpik8MwYGAHJG2STTolk=;
  b=KWzWOIiFoz0u7sfh+7hbGdrWjgYrEBSpYF9W+LPZe+nPg0TxLU5CfFVR
   F326M7OnQvuvnGwYK4FOpTCjgbGzyRFn01iH0mrlGB9vOh6zh442DC3Ml
   ObELLiQjuqvpygpMTpyphs/gGzmQWb5ex+zre+FG/qw5f4P8b9JFmLgWS
   rirkpdD9FyTHOVIh/bP0pcXOCqVFPGhJbpXDeFX9cN5lmAWzmHK2PBPjh
   0enihCw2Eowez3IdesNasIY2hsRB+wklHAczlumNc3TG6JXqVeLEaBBbg
   luwN8+HWITuhQvDcVaG3zz424z1VvAJhu8/m12PUEWO+HCdJVllsX7RcQ
   A==;
X-CSE-ConnectionGUID: cELi0y9BT4Cxtk9zSp7ocg==
X-CSE-MsgGUID: ie3/ErpDQk+TF/zN+EzRwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70406074"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70406074"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:35 -0800
X-CSE-ConnectionGUID: WRl7Nv9dT4eYUi9DBOcG8Q==
X-CSE-MsgGUID: OTM0MQiwQ+6X57JQAv4aYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739293"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.181])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:33 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 6/6] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Wed,  4 Feb 2026 13:15:11 +0200
Message-ID: <20260204111511.78626-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204111511.78626-1-adrian.hunter@intel.com>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031534_859375_42C7DD10 
X-CRM114-Status: GOOD (  12.36  )
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
---


Changes in V2:

	Retain HCI_QUIRK_RPM_ALLOWED
	Amend commit message accordingly


 drivers/i3c/master/mipi-i3c-hci/core.c             | 4 +++-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 149b3fad34b5..d19be1d276b5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1005,7 +1005,9 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
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
index c562e666f29a..58c4a025a29c 100644
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
