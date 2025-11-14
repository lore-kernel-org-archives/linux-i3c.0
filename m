Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9548BCE8D70
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsyDrj2BuNk1JTDWs1ICeX4Mu/aS15BPwVE7edke6lY=; b=KRk0WY6oUT/SHA
	57PDSPQF5jVHacYxE/Wcm84BjLQAKTjbFjSpcfiiefLVbj5xF4CFL6LDW8XPi6diRmx6xvXeb2fS8
	meFnUa/Rn7mKDS7hjggPzFTCbrfjghafDr1Y+8UicDMNcjgsmjai2kkQDKGOJaeOUMH+iBJCJ1y88
	p75T4zK5nzQq17XYBukYr/DOtLRHIkazhnj8Yvhmjs2c3HBMUn8/wbXuLeCDNIMpcpOSfjoAnsL7P
	V5mWc5HERlJZbdYP4RinJiu08rFxkHkeYECI+lKZQnMQancRNKdBL3RTWO/hnJ9YLBsak0ujUxJTs
	dq8tf0m3rIBFD3pu79uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJf-0000000CwZs-1GN3;
	Fri, 14 Nov 2025 18:14:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJc-0000000CwUD-39s8
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144073; x=1794680073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M3NNHbYQuuAxsbkBnqiXhvVnxCi4Sc/3tO8ZpnmtU8k=;
  b=UCnfOjimyjZfmdOtRoY+BPiN06gyNbIP35hjcQ6d1Crjnwv3zX7rJt4x
   EerltOhnWLn5uNoW69pZCBquZGKb53i+ptXA/YXcMhoV+xvfDEVuflQeI
   k5rtRqNUbsTtLrwfDaeKeP17A91nIu4YKhdNM8aS0OfV9ff7XaP3H9ZsO
   x22iOmrVWe3kDlb18m2u0IiPOAwTAal31qEknR7y3esLQ7tzcbiRk3546
   8ZuKIEumOIo6j0KxXWDpiUXhfLpu/gHAjNPpWBUev0EXe0xZflrpmOQmp
   RyfZgby90VhU6/nvroPpmW0V1KBuoQK8wU4pkLRqkJXONxLzGoN4CYrgy
   A==;
X-CSE-ConnectionGUID: 7Mukv7cBS1qtjf3DgF5ATg==
X-CSE-MsgGUID: yW9o5+MpTCWQs7sNNK1iaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129455"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:25 -0800
X-CSE-ConnectionGUID: 4FqBwIuDSSa+DV7HSgqe5Q==
X-CSE-MsgGUID: 8njjYKc8TW2k2heGw5tr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189669011"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 10/13] i3c: mipi-i3c-hci-pci: Add exit callback
Date: Fri, 14 Nov 2025 20:13:53 +0200
Message-ID: <20251114181356.66515-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101432_882143_D1E727F0 
X-CRM114-Status: GOOD (  12.49  )
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

Add ->exit() callback as a counterpart to ->init().  This is in
preparation for adding device-specific features that require cleanup
upon driver removal.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 7bfb9fe337b6..b962d3c2d510 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -17,10 +17,12 @@
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	struct platform_device *pdev;
+	const struct mipi_i3c_hci_pci_info *info;
 };
 
 struct mipi_i3c_hci_pci_info {
 	int (*init)(struct mipi_i3c_hci_pci *hci);
+	void (*exit)(struct mipi_i3c_hci_pci *hci);
 };
 
 static DEFINE_IDA(mipi_i3c_hci_pci_ida);
@@ -72,7 +74,6 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	const struct mipi_i3c_hci_pci_info *info;
 	struct mipi_i3c_hci_pci *hci;
 	struct resource res[2];
 	int dev_id, ret;
@@ -114,9 +115,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err;
 
-	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
-	if (info && info->init) {
-		ret = info->init(hci);
+	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
+	if (hci->info && hci->info->init) {
+		ret = hci->info->init(hci);
 		if (ret)
 			goto err;
 	}
@@ -141,6 +142,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 	struct platform_device *pdev = hci->pdev;
 	int dev_id = pdev->id;
 
+	if (hci->info && hci->info->exit)
+		hci->info->exit(hci);
+
 	platform_device_unregister(pdev);
 	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
