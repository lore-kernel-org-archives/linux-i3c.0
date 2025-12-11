Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9988D41C37
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1dICuR10f7QLSDVHdEBuUMwUFkUKxhNVl0gKzKGtUo=; b=aFhZYCakfuSBSQ
	QC+Gy3qCaowDkM5X3h83YyCEfJoIgfCAJhe1LVTTQA8Yug/3LUtT3vrnBlbcDYC4S2zNJ0GyBd3Mp
	Kp56rCRHv4IaHMtVqVLNx/8hx1dNKeIBy5gRYxCFPEzWsK7WyhKKVKVqeZb0VcnSvey2v2hjtecIT
	T32MqzdQplpKVEqoK87+G/qZSQ2Ba5LDJNTXzfEnt6ImPpDEJm2thavyS+/6QZfZwbfXcx82omVGe
	VbRilQwszUWpLksDVoCQ4Ji5WWm7m+eBW/9xkN2vwXNWHdDzr31Fm5ERxD5xJc8hkuw4YqKYumWgT
	ubPeL2KCHo5NZsuNsTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh28-0000000Gfii-1h6B;
	Thu, 11 Dec 2025 13:48:40 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh25-0000000Gfc2-2bMg
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460917; x=1796996917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ubPG8uDw+0z6EIP6VuTR7tQgMkrH1+1zzEsVbPoTIFE=;
  b=gc9NX17n9iaxB/9emStICaIpQFkIc6sfEyVxQDQAYyAOeCRBnICKLxwo
   +f50P58ySJaX/MZgtiyV1cvHAHXfUJi3eGiw3rh9areouZ9Iqm74vfJAi
   9t/Ds4xqtL6QKu25QEgBAlESCkXcxoeOWsFfegKOInZj2uzIw3QfF06Lw
   U3fk5W1HojeHrwtMiWeWXxqxe+mdctzPIdwALwHTacIrf6HuTv4+He34S
   IgWl5LmOZgcwyYc4h/wuCQqcvJbQ9TK3BdsSRvJfObQuw+5/mUz4oWawG
   t9lmvutuWyEH+ZmB8NUzlvYH7VErW7w4BsvgvPr3et0Wb+EnjANG7br3m
   g==;
X-CSE-ConnectionGUID: l/OH/vVQShqQn+DdjSHMFw==
X-CSE-MsgGUID: tmi2Jaw1Sg+PbQltKv32sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481898"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:37 -0800
X-CSE-ConnectionGUID: JJtstSt3QzSQ0sPbpbVneA==
X-CSE-MsgGUID: V5axAPmETduD91MSLydukw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171687"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:36 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
Date: Thu, 11 Dec 2025 15:48:05 +0200
Message-ID: <20251211134809.75872-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054837_666957_31D7B451 
X-CRM114-Status: GOOD (  10.57  )
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

Use pci_alloc_irq_vectors() to support all IRQ types.  Do not call
pci_free_irq_vectors() because it is unnecessary when the device is
managed due to the use of pcim_enable_device().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


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
