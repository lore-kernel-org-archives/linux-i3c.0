Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE19C54F5C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuddFME3pkKhHQyuOF3Z7BvWIes8oV6Uir5IwPa9CRc=; b=vpU+u3OFLmqdhc
	Qu3S1zxbwWGNW5BNUuEjgZDMd12Z7kGSPPzNALDatlQYl9/kZUwjmedG5HVvtHSjuLgASII81ij/X
	KQmBbDL+zfow7bvnFrVFIAg3x4PuWWPhnW+wtKbAaA2PKc8SnHcnpaWNesUE800bAJq4bHEiIue2v
	nD++lyDV7acE5RTDDEIxHW1L+pTF0PWbreysHe4dShfoZjdvd8bCrjOSRLFLPzffYh7EvNiYFaLYZ
	iZNQKGoeU9hVKNuN5Z89QmRXF8hgqRxH8Ktb4uAMsBp2BlCOxJqxKK3VQuS6H7pMxL/mkJaYAtwxy
	cEp7MVqdVJQXYttFRmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7j-00000005jPY-4AzT;
	Tue, 28 Jul 2026 15:53:43 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7f-00000005jFt-0uGI
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 15:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785254019; x=1816790019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TCb/nISARFE2W5GFqZKUbYAlrh6G+l/ILM+5Ecvs8Tw=;
  b=GsJpF5amVnszQytQ/cBPpa/SY0IL2BvNrQidWTwrPfqEBVk5cGWfSzpH
   FmzGPAjLkZ6gqI3YuVJwvIeYvXsDfHv4FLGH74B71O71H+hkDM5D0fJRs
   broLGihfkp88xZNqmZhLZuLo5LQt/0Z7Fh1pZpdJ6006OgSyfHfi5fZ4l
   wacnIWotw0bOogaxyTo3nJhiH6mb3WHXl+CHA+lOCVmwHxDoRAtJtporP
   0bOuRsbOTiQMBFA1SR1LyyMY7CR2G94R4OLS+EKNLaRzcE94UjB1DWCzC
   L+NdVWqtMvsklswnQXVtR+oangV6a9R9uLupEyt/XumRvkyY3FoKDDKv8
   w==;
X-CSE-ConnectionGUID: H0o1SJrQTtqNs072sLlbeg==
X-CSE-MsgGUID: ZT5xT+M3QauwNKDjPeJmtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85696814"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85696814"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:39 -0700
X-CSE-ConnectionGUID: V+mtTotjT/2g1Lo2bFLyiA==
X-CSE-MsgGUID: aPFZ2k8dT2y8u3eoGAZHfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255817747"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.126])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:36 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 8/8] i3c: mipi-i3c-hci: Advertise IBI wakeup capability
Date: Tue, 28 Jul 2026 18:53:08 +0300
Message-ID: <20260728155308.142713-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728155308.142713-1-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085340_460678_A933C773 
X-CRM114-Status: GOOD (  11.60  )
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
