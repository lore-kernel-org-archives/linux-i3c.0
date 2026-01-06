Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77150CE9D7F
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qv6JzBA3DzrR5zmsbbB0guWa++znXpAgZopjfc3CZbA=; b=r3d53sFCNVT22I
	4O3xmEDkJukvP654KaYpJz6PJP/evxXXHJkA97tpZm4PAtB8NtlnaVjzPTeDBcS1SvuyUtue5eIve
	TwUnVyTTza4nNLSJOg2brDaVKuQdLqyjsUY5L5QcDHIc3M9slXsfVbcCD52fodq8mvqZH11WcOCSA
	36JdH8jryu38MbzPwav1CiWn/1OE84IN1GA+yhFCmJV+mJnxgWu/cjmev0o1ndU+zndIfTlJjSmbm
	lVSAEGFEHRT0PjUu0fnAPOGZbWeVow+2UsH88RTmLoMegHmnfJaN+pk12Rvd/9uaiwbvXGkbtDFFe
	dYWbIX6PqonqQdcxewDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAt-0000000DWRN-0t4s;
	Tue, 06 Jan 2026 16:44:51 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAq-0000000DWNZ-20g0
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717889; x=1799253889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j0lnjeGpKsw3a2JnYVaspVng8undRfW8BO28LmP9F1I=;
  b=S1pKjIpgFl9bH0EHfQGvl8QlLyfxtY2hFCfbcwCZoiWc8oZZY9geZhQK
   M8H+nTV2oi0asF71m1FZhw7SypnzVfXizJdgCWNn14DiMw8/PBEfUXmP+
   vfDfRsndst2wsKUqdWwLkhObjzrefcqaBYq/6A8SG1V5XAj8sTvKpkCtT
   0cXo52bdAw3b5irOdSaTZNrJkH0shDBzdG4xp3/ftzBjCntYGMPB72YLV
   oboNeKuF1Wx+GVpDH75a4vGj5R6tfVm7Zv5mb3CyVWqKyv3tg6JqVPy0Y
   FVeWUjzyrWgdo1VAnK40WFaZTwRYD0wu1VjnZ9LumpRdyRHu2GP3eQ74O
   A==;
X-CSE-ConnectionGUID: z3O9dILOSDWRSRyl0kXFhA==
X-CSE-MsgGUID: MSeLaXD3RuCoQ0yqSJyBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741834"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:48 -0800
X-CSE-ConnectionGUID: 7Q/66THCQCCpW+mOINbCOw==
X-CSE-MsgGUID: +4NwguzyQl6xNMh/mOZCzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838028"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:46 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 04/11] i3c: mipi-i3c-hci-pci: Do not repeatedly check for NULL driver_data
Date: Tue,  6 Jan 2026 18:44:09 +0200
Message-ID: <20260106164416.67074-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084448_559608_B4BA9924 
X-CRM114-Status: GOOD (  11.06  )
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

All entries in the id_table have driver_data. Do not repeatedly check for
NULL driver_data.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Drop default driver data


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index dc8ede0f8ad8..8ade911e3835 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -229,7 +229,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 		goto err;
 
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
-	if (hci->info && hci->info->init) {
+	if (hci->info->init) {
 		ret = hci->info->init(hci);
 		if (ret)
 			goto err;
@@ -244,7 +244,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	return 0;
 
 err_exit:
-	if (hci->info && hci->info->exit)
+	if (hci->info->exit)
 		hci->info->exit(hci);
 err:
 	platform_device_put(hci->pdev);
@@ -258,7 +258,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 	struct platform_device *pdev = hci->pdev;
 	int dev_id = pdev->id;
 
-	if (hci->info && hci->info->exit)
+	if (hci->info->exit)
 		hci->info->exit(hci);
 
 	platform_device_unregister(pdev);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
