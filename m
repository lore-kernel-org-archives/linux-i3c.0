Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D7BEC1E91
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Feb 2026 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgbD9MTyTY0XooB/Lqorn2O+96RsI7/nXaQpfjmSiwY=; b=4oBA4I4NqH3n0m
	xj3Mzo322AvyvyzVVxqUfdYR7/Ku+nO5GhYDV6VbTCiPqriOWnt8BNbK/VGmQlEEZselRhW9c6tvy
	8DH2KAZOykx8IJ11mvDNXVzNbv9bv9U5TeWvOZV7hgkxOyZb7Ib7ONcNTrCAcRxiB18w6eGXWWwnw
	7cnj+FS+4vI2XonGby5gI9J09x00cQeeK8cPvwMfrzOGKe1RMrPhkKIInq3wcPKnirfkVFevRN4d5
	zXbARYBPAmr+dCVCSJD75r2lklaMPn3daeXDihEwhVa4yAejz4ASICMiQDfnpnA9LZbs0rhlRA4J3
	8UtSY6qzBy//VpL5Ik7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwIw-00000009lAV-1GDX;
	Thu, 05 Feb 2026 10:09:42 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwIs-00000009l5W-1lZ4
	for linux-i3c@lists.infradead.org;
	Thu, 05 Feb 2026 10:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770286178; x=1801822178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8THRXBi85fbzXkk7iqY16ie3SHmpU5RsoRpOmh5p5eo=;
  b=YkHjfAWU1uDRc2eBEh7jMHieBSeKVGjZHiwuPR5e7xjwkS31tozvLDS+
   6/RsGkUfqcnm2h2syU9J5G39UE2pXhRmXkoiKKMtMSxFylZNNklMNfQ1x
   n3aTTxjEOavnD1PFaYBg5w8KICb2nlCltrN11Q9DznH8rsTTPL/9AFc6M
   4aBVzY0Ie4XudvOzCRTTEnmbqaQPvxGsD5lRGvOV1QhepcqshlIdGMBAK
   kr8Lh6MQZHTVsovDxkFjdzHH6oS9aZLBK0nru0rbmJwbSp1+OexYxSfs+
   5OyArGWkk39uB3Jwjwwd4v998/50Byqda4U/lYfZ+gVjywoygJHQYbB9r
   A==;
X-CSE-ConnectionGUID: Stv2CkkwRGiXCMfU19BqHQ==
X-CSE-MsgGUID: 7qevcnQVSW6bkc+81suchQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71471731"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71471731"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:09:37 -0800
X-CSE-ConnectionGUID: zo9u6nJmSFeGqzEsIH/wEQ==
X-CSE-MsgGUID: baG2yiM2TAaCnj/kTQwxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="214631183"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.58])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:09:35 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 5/5] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Thu,  5 Feb 2026 12:09:15 +0200
Message-ID: <20260205100915.19792-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260205100915.19792-1-adrian.hunter@intel.com>
References: <20260205100915.19792-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_020939_491757_452AABFD 
X-CRM114-Status: GOOD (  12.21  )
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


Changes in V3:

	Add Frank's Rev'd-by

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
index ed0efed17726..54a2176ca79d 100644
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
