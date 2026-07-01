Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D801C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuG3Nt/++PFcc/+3mY4a8sj7+nUG4zkCVGCuixNtPW8=; b=JKynNuyPMKWXA/
	gX2SKkykmgwHC3ll2kX7uj/JhZQu2f+w92wCBfXWGnfXiQ8tUndeIbSKdyOKd1vbHWPCojUh5jOUk
	XuGPq1zlYmUDGdc3NitKb9qXaUAa4EK63rWgGIQ08hb+OSPKlEPTdT+BmmxRdHqWfVGtub+N0iG/g
	LW06jGNBsPVaaQXQASTMN1+w1xALDsaZBgWhTyCCYHTF8Q8IDvWVKV1Yz0t4DxG3dhxg6aGA6DOdl
	BsSna/UPx6V0/0arG8PqOva4iBRTOccSWJ2ZZdulrD89DkH8Ppi6xCQpySRjf6GwXozEqGKiyiJLS
	d0aQAkePNYieKtY7mPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Ln-00000002xH7-3aIF;
	Wed, 01 Jul 2026 20:16:03 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Ll-00000002x67-0vCJ
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936961; x=1814472961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ebGfPmyiAwYoSiWiq257o+B7NcSMheMY6PP0hEPRA2w=;
  b=JYIOuaw4mpdXO0VPh1uy12UF40GHKsFBT4ybl1p8bldt5Y2ZeCWHM2GX
   mS7ZpVwMMcsBMB3/pf4CAS6E7m4XzUvs/yZ1vfgkdXkm5avOJW1EXfxrl
   A+Qui2gqpQgBXdS4NO8fqhgX0UIK9aMkVCUmpnNYPPUuPKf1onxwJG0Hi
   4KhVIiigQJ3UpjOS7KXSaZIdlmlcWlhMsf5LtAygNw+KMWSQwkljyBXL2
   U78JBLFxt0qHSr1eOPT+oIZkiyMh3AtahF+OV5s7BX0nIc+vXYypayLun
   OqV6DW4NBAae6NJZfA/PIn6lvf4cr0z8cyfpUEp7t6CeoQTd2d/IgzxLk
   g==;
X-CSE-ConnectionGUID: qBbFdzUlRO6SVDoy8QCyTA==
X-CSE-MsgGUID: HxT20AnQTLyu6S6jfxRwhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82671822"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82671822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:16:01 -0700
X-CSE-ConnectionGUID: 4ZAhvxweTBS+7S3RUwUQyA==
X-CSE-MsgGUID: 8lc5MO1RTWalRmh5wu3V9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282737169"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:59 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH RFC RESEND 7/7] i3c: mipi-i3c-hci: Advertise IBI wakeup capability
Date: Wed,  1 Jul 2026 23:15:33 +0300
Message-ID: <20260701201533.220818-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701201533.220818-1-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131601_267898_1523B943 
X-CRM114-Status: GOOD (  12.06  )
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

Set master->ibi_wakeup during probe when the associated system device
advertises wakeup capability, allowing the I3C core to mark IBI-capable
I3C devices as wakeup capable.

Tweak the comment for i3c_hci_sysdev() to mention the new usage.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4e17b1480362..55724a986f90 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -120,9 +120,9 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
 
 /*
  * Determine the device that does PM / DMA and has IOMMU setup done for it in
- * case of enabled IOMMU (for use with the DMA API).
- * Such device is either "mipi-i3c-hci" platform device (OF/ACPI enumeration)
- * parent or grandparent (PCI enumeration).
+ * case of enabled IOMMU (for use with the DMA API). It is also used to check
+ * for wakeup capability. Such device is either "mipi-i3c-hci" platform device
+ * (OF/ACPI enumeration) parent or grandparent (PCI enumeration).
  */
 struct device *i3c_hci_sysdev(struct device *dev)
 {
@@ -1175,6 +1175,9 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (hci->quirks & HCI_QUIRK_RPM_IBI_ALLOWED)
 		hci->master.rpm_ibi_allowed = true;
 
+	if (device_can_wakeup(i3c_hci_sysdev(&pdev->dev)))
+		hci->master.ibi_wakeup = true;
+
 	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
 }
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
