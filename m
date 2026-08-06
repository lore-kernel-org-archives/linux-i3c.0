Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B72AC55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2paXYN0OcB1jfTR32+bKfXwx2NmUtqTxxgaiei+SDpM=; b=WIKrMeVayafY9B
	6gd24+9uK68HyKnMqDcPOtympFxff/6V2sKNrxH8yT9f7z3HFSHVcD+lMIyc6etVqczsbLlNIaEmk
	A6dTP8G0XJ2cS1k2/XBjlZ/Ezj1s0XseSFwCE2V5PBxnFkFtRl21DpSyDvEkij2qzU/7Pge83vaOA
	ut/sumsxOrCuoy5/1QyHk3k4b9NQ+F40fRGDKx4Ujdh8oM4w/1GT3yJ9VFXxcEOfg37HTo43C5wQ6
	HPLXYBbnjvdG0OBc/kFBUmETOvTLkLb/415SaxHeKqPDiA9HN+tPjsppFP5tlk7fSUETRIStIPMxS
	pVy4u0/rwGDJzdARNOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0m-00000005sGl-3zXt;
	Thu, 06 Aug 2026 13:19:52 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0j-00000005s3x-2qSH
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022389; x=1817558389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4rY7IGb0lt7RFyKVZ1S7RTS2cw+M31qnZC70CCtDg4o=;
  b=N4t8W4/rwWtIVoyHnveyUFrCpX97kqmO6LmK5dyqi4q1Ssx+fpPrWPi+
   BTVObF6d+50/P32Ytp8QGzFZFSCiWYTwPVUgUgTFPs0ApbQzzapzj0mQG
   5RRh87uMGiQYfzU3mS2RS2np9woYiUrRMOvpi8ssU+2ugQkDr5W69hJ1c
   Whsmx7iZQG6DQnbPDgCM1Gki9H6Wxy6CyHLjj/dD3j788guB3cfw1ILIQ
   tRbQkUgOuD/xfAuKzGRV1r0r7XtrOwpbNgMXo3P0H/iXmT+uTTvU+SIAG
   VBj4CsQVv+nQaFUJ73kFHXMIXJM7HVQ8PELntGA+z+FjzFf/0BJ5IjHu/
   g==;
X-CSE-ConnectionGUID: +KFhQGzVSAWMhv77CBocxA==
X-CSE-MsgGUID: /bwDec8eRwiV17FxTwMEzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149667"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:49 -0700
X-CSE-ConnectionGUID: 6EkFM2hkTC+Y0OcbD5vnnw==
X-CSE-MsgGUID: 20RDd/bkQNWGFcHBAdXucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338357"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:46 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V4 14/14] i3c: mipi-i3c-hci: Advertise IBI wakeup capability
Date: Thu,  6 Aug 2026 16:18:57 +0300
Message-ID: <20260806131857.119830-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061949_725623_04B2409A 
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

Set master->ibi_wakeup during probe when the associated system device
advertises wakeup capability, allowing the I3C core to mark IBI-capable
I3C devices as wakeup capable.

Tweak the comment for i3c_hci_sysdev() to mention the new usage.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Updated the i3c_hci_sysdev() kernel-doc to mention system PM
	and wakeup, in place of the old comment tweak.

Changes in V3:

	Added Frank's Rev-by tag

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index f95da427d7a9..06acf6cf5a0d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -119,12 +119,13 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
 }
 
 /**
- * i3c_hci_sysdev() - Get the device to use for DMA
+ * i3c_hci_sysdev() - Get the device to use for DMA and system PM
  * @dev: Device the HCI controller is bound to
  *
  * When an IOMMU is enabled, DMA API calls must use the device that IOMMU
  * setup was done for.  Under PCI enumeration that is the PCI device, not
- * the "mipi-i3c-hci" platform device below it.
+ * the "mipi-i3c-hci" platform device below it.  The same device owns
+ * system PM and wakeup configuration.
  *
  * Return: @dev's parent if it is a PCI device, otherwise @dev.
  */
@@ -1180,6 +1181,9 @@ static int i3c_hci_probe(struct platform_device *pdev)
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
