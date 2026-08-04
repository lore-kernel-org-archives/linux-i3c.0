Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7550C55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtQu/JkVe+zN+XMSdeSJpEGrOzfAn2Wu4yCbFEzMFVc=; b=U8RoYt0XPV7ysQ
	L9gCkqsrp6gByvc5cUkrw8zhzb/gMRsp+s6tzwgFCsoUhZ7+DGueqPdPAfZBoqNrBKxR1r4ojjMw4
	+XLz0QNJhnKfNqVRAVFfvudFy4SEkVChodutXypS1G7b29hTqjPbdIWLdppVyce36V/13DTH0COnq
	1ZMjhkDkZXbJmqq4nNA2LyYBoD8tUrRcq2c8OnGV+fPYleoaR/XP35e8Naj+fZ/NJqKqV2Kx+idY4
	6mi2jQ111tiemIwWAzODwVLPlmsYV3OQ8EpdzHO0AJXoDCFsY/f5sUQYd4GcU/m5aR9vxjJwxGHmg
	lww9Jr1KdkzOaBdFMuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFMF-00000001wj3-1qtB;
	Tue, 04 Aug 2026 13:39:03 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFMA-00000001wP5-2kpr
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850739; x=1817386739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fL5R1x9TZFT+HG95wJ+SGsMrSYKHX0Fo52jLM1Vj45E=;
  b=bEYC1OgnvbKmv1p6ZUFXB/975dfV6E2OI0pu+91PkI2M5JXtjckHB9gD
   SWsfOB2Xnikq+WquOSkvC7Q97QAPS8vxPArJ/uFDc4BmjeMxScFXYlwL9
   kNHtYyOcGvxC/Jr/M1R1qbumKoUJhWGnfOI+BO+b/fV4kSGqhxtsX8JTC
   1Ql54r6D27Qx6kf97IUO3mH3jk3rtZ6x+qU+j+RZXymx2AgsjBH/fhBYi
   B8aJeHCLoTt2Eyh/72sfAz8LcMVHUX2BNpoTBJ3VF2vxncHQ2pqT0KSUt
   zNwC9oLRZwl9HX1GsKclcBWXO4PNg3gea/3+w5onnDpP6xBBw8XMvdjiI
   Q==;
X-CSE-ConnectionGUID: DTDXyccTScuL4vZrfZ6tsw==
X-CSE-MsgGUID: fbQ86OEuQXmJUdselwy30Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410199"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410199"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:57 -0700
X-CSE-ConnectionGUID: HvgyCBfORymBzck8FInXbQ==
X-CSE-MsgGUID: s8v2B4aqRKuzsdG0ghgOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263501071"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:55 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 14/14] i3c: mipi-i3c-hci: Advertise IBI wakeup capability
Date: Tue,  4 Aug 2026 16:38:10 +0300
Message-ID: <20260804133810.184905-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133810.184905-1-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063858_744431_C1263BCE 
X-CRM114-Status: GOOD (  11.67  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank's Rev-by tag

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 0212c9e984cf..5d92cf0645ef 100644
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
@@ -1176,6 +1176,9 @@ static int i3c_hci_probe(struct platform_device *pdev)
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
