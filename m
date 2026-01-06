Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DA9C47BE1
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekeiYQyjMhR92eSGExpyfTINueEqEXNkTt//dD6WUlc=; b=EhEfvCf1Keou31
	uf99M+IeoETzGsF9ZfgcCVNfoVU1etTzkOlteaJZAJfxv0xlelHMtf2bLqaO8uZ7Dzbm62EsQpUMJ
	mobEiTDQWA5TfXrx4GGSp4yPzB71+okY0BDUWbPyJV+NfiOa89Cvr0GIg9THfZA0JJlea7A6Tm8Vf
	mjspcTsVEgygJs2TpaeUXlZc7DoqXoP2Fk0xFpDa674ThUu91HmDuMI3Qsh4sgxk6sHIywTrAB25J
	vU4QIpsD3Gi965n1+K3BGoNHOhRCMytV60zepQoAbbkonwa/1Hgdj5/3EZPMExbL5Wl91fe5pxMen
	nN13amNbUPHKuUW1jZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAu-0000000DWS3-20wq;
	Tue, 06 Jan 2026 16:44:52 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAAs-0000000DWNZ-2R73
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 16:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767717891; x=1799253891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Al/piFmqb4tf/koSTafQgAVCv1NpEY995GuteuOGByM=;
  b=Rrto9xE8Bp10Yv5qM82ofkPyOA649u2sE6U1LK8LTqjlHWlr+hIhmCgp
   /pkLmDc1IawhDT/wVTCIyRjRkx7xzFBOp0YO52t+IEuorw05kc5Z8UBJh
   jZ66XSrMxKBD+c52mCAhiSjpvFm2JkhBX8su+GfGOI9T+jExE/XCOwJ7f
   HTVA5bq1S2GmSg1TTTb4223+EvgHtJM0zCyc5x2vlT/snFnQJ+Re5c8f+
   q08KcP3Km6PilKEtt43sZm+Odb/UD3+fRzNktEy0tX+Iii/7DpdGu7DFq
   bQn0s6z25TeubSp6Vyz4mp2ZTKZ7ZmhXz6lT9Zo24izwfsKPRdO8T/Pdv
   g==;
X-CSE-ConnectionGUID: fBx5Nvq+Qpa5vxPjTKEnGA==
X-CSE-MsgGUID: 8+JmuX/sTsizIhslUWIToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91741840"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91741840"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:51 -0800
X-CSE-ConnectionGUID: yqIxEd9xTrKEU+wJGWr3eA==
X-CSE-MsgGUID: 159CTq2zRO+RTVHMQgBDLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206838034"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.254])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 08:44:48 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 05/11] i3c: mipi-i3c-hci-pci: Enable MSI support
Date: Tue,  6 Jan 2026 18:44:10 +0200
Message-ID: <20260106164416.67074-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084450_661842_005FD603 
X-CRM114-Status: GOOD (  11.38  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

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
