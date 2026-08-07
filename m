Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177DFC2A09B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVVUGFT3cspAEZ8+nqMEIIRs1cFNRlDPLblxh2kb/AM=; b=U2iuHwgXeTaXgj
	HBihyjUrKrF90BpoYCuTGQfJLkSBAsdN5EDP9AmpNDK1JuZ0ch3wVDl50sEHgJ0oAz/cobqD3/p3n
	ipYjdMXOHjGieMjZjjX9IbOeONRholfuWJzieaivGsvsMktC38++Z2pbP+q6JiFk9psOcdXZZfnqY
	RFvoGVG9TySeselBBMGyCkMS6J5qqqQ0HMmjUvaRFfwFTmiHLEBZl/zC0O5JTTYpPR7a/nGciV/b2
	BjICp8zG089ODtBswxYxpvCkJGUXCaKeheiadwqzUU02u7lUqQbgE7xy4A3WHAtXcKJcnBZoZ1+1N
	xitc0OzvxxfHiHSJAznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM1C-00000008Iv5-2py9;
	Fri, 07 Aug 2026 14:57:54 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM1A-00000008Iso-0NjK
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114672; x=1817650672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WCBP3RYMvYq8dw77nVtVu31W3Qa1sdE1j3BBwSPtGt0=;
  b=m1oor/jmrhIZCTRdjkQ5uJJw0IQoD9ODTFpk3uO9EmOjqYD1TLYynOC0
   vw7idadQjYOAGYa+WU1e0qeAuXg85q2yDnXlQNe/0TXZlwCZpCWhEXNcR
   QmMnAn7jIyG2RGqEAF3cZWTOjV/s9rywqyh6gxJ0gi0hL53iiuXpivBEp
   Yofg34yND+D9j3QN31/xzmSwobKxHMoeOqFHkSJ0AeYuCsOSF3HsfMDtz
   JF33ICCfXH9OeUjn/Z68rFq7+0pzr5VXjB3MyR/kwzRRT0kQQUtT6o/uA
   EZj146xoeLjwclu81NkTPOZv/cXpZ/0Vb3rDVjh3arcZ45GFMWjQtzXko
   Q==;
X-CSE-ConnectionGUID: SmBtoW5ZQqWbqrzXsBtHBw==
X-CSE-MsgGUID: 9D+9B/GoRxKQlN+nBRn50g==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485301"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:50 -0700
X-CSE-ConnectionGUID: ozuY+Q+DSiSnCvilsCLGDw==
X-CSE-MsgGUID: lKRgqdkhROupl7Yov/of0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809956"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:27 -0700
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
Subject: [PATCH V5 14/14] i3c: mipi-i3c-hci: Advertise IBI wakeup capability
Date: Fri,  7 Aug 2026 17:56:38 +0300
Message-ID: <20260807145638.168865-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075752_172047_FDF87A34 
X-CRM114-Status: GOOD (  11.79  )
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


Changes in V5:

	None

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
