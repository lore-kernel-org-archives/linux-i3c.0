Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B23D116F7
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciFRc5U/nd7qoo4LmIok0O+O/y4l5+JedPGw6uQItpI=; b=USfZ66m+EsOtik
	hCYIfvAXZOxN6RI/qYpTuZ66hYtSYYLl2pznaaWVFYq3yF2Q1fC7NUwTJACvvXEDYwAck8CCZK/l2
	iNgc79xLsoec8rmnmT3GBMAQkc6HEycz3HH7KHQXWJnUswI7fqm7qcAgGIWRDFmy7uBzL/0FvsMuZ
	qpzGGuxoKbw/t5SL6dXzrC9vojbjAMlhHrWfn2MCjqJ5jy4rjiC0zZsltwSiHYxG0u9nIJFWj5UM/
	AcGgCSL/i1MjH8Og63DLbnIunoMXO848h+d7fQWvDILXsSloO0LB3NWVvk28Gu2U2BDkvjwPVlV7e
	i7cH/k5tpp0vstinrkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAA-000000003SK-0aLN;
	Fri, 28 Nov 2025 06:41:02 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA6-000000003P0-41JK
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312059; x=1795848059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JBDMPYGln5JvRqOZNycxKqzVIr/anNsrVFKnSSI7VKA=;
  b=gS53vGQgOtW49tdY8+aCxji4sj3MVP2lZIR6zsRlLXlUKRxwfbOPL9qq
   Hserf3TnlvoA7uekkimDW7jMVwx0yzYnrQS3daE7T64dEX17VKbtMn09l
   pyaroQzgjSUPJDbw6pE6UdsBrnGEAvep8qNUieSQWloUuby33y8DZVgZf
   kgWNOChTj2wZbUuEON5WcUw26TOMFFGUa1fDKlUmlkMT4Mh2OYMEACWVN
   5EaeSVlpjYCl8oZARTAjNHpJnhUvlsaKNGWUQm8JQat4YhVm84FWnNdNk
   sEFVk7chFbQNQVGp+bYUTg7UuaaYAQ6UBAawnEm5bSC+O6baSrWZkzMF/
   g==;
X-CSE-ConnectionGUID: wV/EiimqRGOCxKPaE6EIIw==
X-CSE-MsgGUID: iuYw4Q2lRue8U7OSMePd3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059943"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:58 -0800
X-CSE-ConnectionGUID: xcQqjMALQA+nT+wQJpyVVQ==
X-CSE-MsgGUID: bYMyxBgwRdeVjiSpv5K5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348069"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:57 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 05/12] i3c: mipi-i3c-hci-pci: Constify driver data
Date: Fri, 28 Nov 2025 08:40:31 +0200
Message-ID: <20251128064038.55158-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224059_030210_552DD887 
X-CRM114-Status: GOOD (  10.38  )
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

Add const qualifier to driver data because it is constant.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3, V4 and V5:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 30915d78045e..abc7bad5e069 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -50,14 +50,14 @@ static int intel_i3c_init(struct pci_dev *pci)
 	return 0;
 }
 
-static struct mipi_i3c_hci_pci_info intel_info = {
+static const struct mipi_i3c_hci_pci_info intel_info = {
 	.init = intel_i3c_init,
 };
 
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	struct mipi_i3c_hci_pci_info *info;
+	const struct mipi_i3c_hci_pci_info *info;
 	struct platform_device *pdev;
 	struct resource res[2];
 	int dev_id, ret;
@@ -93,7 +93,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err;
 
-	info = (struct mipi_i3c_hci_pci_info *)id->driver_data;
+	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 	if (info && info->init) {
 		ret = info->init(pci);
 		if (ret)
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
