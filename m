Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D12ED26284
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Jan 2026 18:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlY7fWR/C9JTYWEiY4Gm8EQYk8dp2L7nPwgo1jpMG1c=; b=WUnyuXsE3txGUw
	zrlj/rQLTrgbXMe8I6qFPnFyljLAyCic88TwhWoUMe3PMN3U/xr0f9dslQpyTfT3Rqa3Wq4uldsEK
	Ctg59SV/n8nUnUHWY/vlaS+27QZGcLU599aHdN79lDS1SwHwoGfXjvPyLzGa24NyQ6jA2Xx2luoOp
	X6Ij465KKTo+a5Z2M+WdAxc8wJu9Vr2HtvsOQ5VheLKE6UxApqhOInFjsHZ0SXTG1t1bZ/CMwcRM3
	3C6P73vuEL55npP7hYkhehtdxDMGZ37YatwbrHpkZAnOLFBMeRqenzz9jVRO645/ZkeFIMZ88T+hw
	X70OSxppH1aHVCuPk76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGc1-00000004JPU-07ch;
	Tue, 20 Jan 2026 18:37:57 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGbv-00000004JO7-2xqR
	for linux-i3c@lists.infradead.org;
	Tue, 20 Jan 2026 18:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768934271; x=1800470271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ndosEZ0k3yqmLsYEPwFnazareXaKVFMIG1xRJugWYzM=;
  b=RLXqkVP+5GZ668Jx5gMCFIzijZqtyLg5i9f2v+laSHlbRtrrEMRpnywi
   PExf4Kmyse/2jXU7m84iMRSuinKgXH+sVnIVRnbk0/D2uYegwf+hdGH9y
   Waf5VeMz8jD9HwVMTGP6WM6wtb9MQ02aRZ004Bc6xvAqJu9q7joRx/N/R
   BvV6aYT1mmom3d0GIuY8gmiIDchbiV+7nTlt7oRXnbHCQnt9VbFhqTr04
   850EcfucYtt0HVEm5xFdKGsPK3CbgKFvtTb04HvK5P2R6yjwCwTBSbgp8
   AA/5/HNw9dyR18HKVC09vfIA2kxH97Bh0Q87x6Zm6NjCQPp3jiJJ/23Ry
   A==;
X-CSE-ConnectionGUID: OEt5c1QeQ1GCwvIkbGZCBw==
X-CSE-MsgGUID: KXxAleqYTHaBHsFhzcjjEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80874621"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80874621"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:37:51 -0800
X-CSE-ConnectionGUID: IuuWe4XwROiA/NkgXpfwbQ==
X-CSE-MsgGUID: PO/B+EEuSPSn9HxHo1ocZg==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.170])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:37:49 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 3/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Tue, 20 Jan 2026 20:37:35 +0200
Message-ID: <20260120183735.60654-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120183735.60654-1-adrian.hunter@intel.com>
References: <20260120183735.60654-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_103751_752825_94B6CFCB 
X-CRM114-Status: GOOD (  10.45  )
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

Assign the driver PM operations pointer, which is necessary for the PCI
subsystem to put the device into a low power state.  Refer to
pci_pm_suspend_noirq() which bails out if the pointer is NULL, before
it has the opportunity to call pci_prepare_to_sleep().

No other actions are necessary as the mipi-i3c-hci driver takes care of
controller state.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 1b38771667e5..0f05a15c14c7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -320,6 +320,10 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 	mfd_remove_devices(&pci->dev);
 }
 
+/* PM ops must exist for PCI to put a device to a low power state */
+static const struct dev_pm_ops mipi_i3c_hci_pci_pm_ops = {
+};
+
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Wildcat Lake-U */
 	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_mi_1_info},
@@ -342,6 +346,9 @@ static struct pci_driver mipi_i3c_hci_pci_driver = {
 	.id_table = mipi_i3c_hci_pci_devices,
 	.probe = mipi_i3c_hci_pci_probe,
 	.remove = mipi_i3c_hci_pci_remove,
+	.driver = {
+		.pm = pm_ptr(&mipi_i3c_hci_pci_pm_ops)
+	},
 };
 
 module_pci_driver(mipi_i3c_hci_pci_driver);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
