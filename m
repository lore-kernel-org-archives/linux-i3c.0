Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CC5D3B7EA
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTALkhuAjrpSwIpq2FlH5NLIdROAx7RFkPQLEvP0QY8=; b=Ke0SKgeh5mmc7S
	mJCCaLJO9uSljnJHK1kjGjZ3OdQXK8EX/Qa9SOF6+3YjfEZvdHKfECc5IMBdwDWG8EtWrRu+IgvF6
	8JriPkH11DKnQ58TXniiHLCd3hWW7ndTxe/2oA0mBY/FGb2kbMmLWhWs/FN2nNUqRoNtC80fXgbPy
	zfnmgLL5W8HNLel4EdbDuf2p760yfP9JegzJHxLifZMF/qzAhRopFFTBZxy9F2WxhR///xim/4Zfq
	cE6Tz38z1IAcAk3tauA8joGj79RcGDN2/GcdrnIhvUM61osayC/+ZR4cMjdbt/Z3ptp2PHKL5S7pj
	w0fwxBBxBKQOHrITCZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFc-0000000EDPy-2b9t;
	Tue, 09 Dec 2025 11:51:28 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFZ-0000000EDK7-26ZE
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 11:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765281085; x=1796817085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QdLOhEpGrtNIES+tLBfo12a3Y7tmblp4klLkaceOToM=;
  b=WaEjuSUa10MKVCFdoedPdQp1its9U0Qidux5XS94M+g0O7V0S0VqBD8y
   3BdR+HYCfrXakMbsC6jS99Rv20jpX7paiP7lxkVb7Mc+YsWtEf6X2z67a
   AtCuGthTob5KGR8AfIGDmHalTrI5acVlqVh+cxvX40r0fLTW58s+sOgo1
   2nWccUjKFEYI+Jv16C9u7KmOhMldvjfvT6Qcb+dm1Ep6JknnD8eql9Aek
   Dg0lDQjr1djbz8itNmzlxq2yuYvvaloZazgH9vKRRYW3C8dcVPlJMipNI
   FWU06bcQnzQ8soIIsu9CTFG5xaD6Jht3dd5A1c/XzOFgB+3IdUJyJA28d
   A==;
X-CSE-ConnectionGUID: tg78+KyuRUCfHH4CaV9RhA==
X-CSE-MsgGUID: YHJzJHE0RJKfP07SK1NNDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67271187"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67271187"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:25 -0800
X-CSE-ConnectionGUID: HyjtIkaVQVOIVz4NGwvQKQ==
X-CSE-MsgGUID: h4TKScwdQNG3e7IX9PA6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200644444"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 7/7] i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers
Date: Tue,  9 Dec 2025 13:51:04 +0200
Message-ID: <20251209115104.124156-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251209115104.124156-1-adrian.hunter@intel.com>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_035125_610880_9CD57173 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

Define Multi-Bus Instances at offset 0x400 for some Intel controllers.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 145f9adadf75..d62c7b6bcc58 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -193,6 +193,13 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 	.exit = intel_i3c_exit,
 };
 
+static const struct mipi_i3c_hci_pci_info intel_mi_info = {
+	.init = intel_i3c_init,
+	.exit = intel_i3c_exit,
+	.instance_offset = {0x400},
+	.instance_count = 1,
+};
+
 static const struct mipi_i3c_hci_pci_info dflt_info = {
 };
 
@@ -350,17 +357,17 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Wildcat Lake-U */
-	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_mi_info},
 	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
 	/* Panther Lake-H */
-	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_mi_info},
 	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
 	/* Panther Lake-P */
-	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_mi_info},
 	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
 	/* Nova Lake-S */
-	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
-	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_mi_info},
+	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_mi_info},
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
