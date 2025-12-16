Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C438FD609D3
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3hQw30PKUnwOu37EmkWtIYp2BOu0vpoiFKiVDI3iMA=; b=CRPzNlcGqsK9nr
	FUQXcuee7GOmwcbogn9GXMo15u/fwzodYULQf5kZ4qVI0PFmAJgOt/xvEhE0pUFJgaQZ2c1Bforx/
	MDyjW63ghnlF+SonnfOb1TAEIlopkN+kg2/fB2a6bKqyTt8IRXDGeMHrB2BfWV7WA3HWv/o0f/qjy
	cyiJ4pLSSA6TDmoijk2tqC0sQPNCB2qDd4V1CkasrXE0J88nxgI5QwwcWf+BN9/a8ZWMkVcFiUZFi
	lOfnjnik3z4g7puzA8OnQO4vpjq/nHMUKA17hPP7noQ9yOiLr23q1m1/zkwJQGWONPtOV/mBrkJCP
	dnCti7IqUBgzk2ua/ghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYMC-00000005ZOv-2GZs;
	Tue, 16 Dec 2025 16:57:04 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYM9-00000005ZMJ-17ht
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904221; x=1797440221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cIha7/RrfEz11E5VmJ1hsHoK1WCsMk04TduVDZ77spU=;
  b=cNXgLqU69VTi/ruG0xTSV0i8ZLn01Z1x64YK76TGfQ5cBwcolSMe/IJ8
   FD1uc15ACa4LSczOHWe5Ec4QR/pHulmOQsZM8Gx/j66eSDywXb1oeGhSK
   G2UoucZnkCh937HekWzQwOKPHRxCdrRLhp3zC0jGsH3Klki7HrrwTbCYQ
   VfwbCsfioanIZZHqqyxKXa6GxirNCoak6D/y5pqCBBtadJk14fixaOVY1
   6YPGEYThBAETUi8KqDejqnlttYxTdDkVWGR0Ru/p5YtCk8+sp758l9VRB
   ALNOHulAwIvIT0qdZ/vhi4eEbAT8lO3TqSgxhWikM9nhmTE5BYf2yJ23/
   w==;
X-CSE-ConnectionGUID: jbcdnLIjS76pj8L+ogPNkQ==
X-CSE-MsgGUID: EPtTcfmUTKCHpsXlIFOG4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466747"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78466747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:01 -0800
X-CSE-ConnectionGUID: uVd9boFfQ3W6gcSqzN/rIQ==
X-CSE-MsgGUID: QzZS9c72TM6QTOFxNTm4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197817669"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.195])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:57:00 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 05/11] i3c: mipi-i3c-hci-pci: Enable MSI support
Date: Tue, 16 Dec 2025 18:56:36 +0200
Message-ID: <20251216165642.164583-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251216165642.164583-1-adrian.hunter@intel.com>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085702_801123_85607DD9 
X-CRM114-Status: GOOD (  10.89  )
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

Enable MSI support by using pci_alloc_irq_vectors() to request all
supported IRQ types.  Do not call pci_free_irq_vectors() because for
resource-managed devices (those initialized with pcim_enable_device()),
IRQ vector allocation is automatically managed. See
pci_setup_msi_context() and pcim_setup_msi_release() for details.

Note: The current documentation for pci_alloc_irq_vectors() does not
mention this behavior.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	Enhance commit message

Changes in V2:
	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
	Multi-Bus Instances"


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 8ade911e3835..0fd3587671e1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -203,6 +203,10 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
 	pci_set_master(pci);
 
+	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return ret;
+
 	memset(&res, 0, sizeof(res));
 
 	res[0].flags = IORESOURCE_MEM;
@@ -210,8 +214,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	res[0].end = pci_resource_end(pci, 0);
 
 	res[1].flags = IORESOURCE_IRQ;
-	res[1].start = pci->irq;
-	res[1].end = pci->irq;
+	res[1].start = pci_irq_vector(hci->pci, 0);
+	res[1].end = res[1].start;
 
 	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
 	if (dev_id < 0)
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
