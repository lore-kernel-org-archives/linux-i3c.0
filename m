Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DA6D41C39
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pC6LiZFD5WDMYHkvLDCgkck68PiwvuUG1fTzIdRMAaE=; b=H0TqKqkj14O0Pa
	pMJOiL/YIOFOZoFqZ3DLbyxEY6SdmZCZudxPx1dpybhLQguUXS1ofTaptcQevdqi1tc+BD6ghLIlX
	Qmt3OZx5YlUO86dBQJAANsDxjPpXwz3CwgQBvBri0lDkraUsPixMbQSxWLtvbGv05ZzMcQSCmwCcs
	NQ934qWrz9fPwruZs9svWrQ0K/HgqQE9NkX5BnlzOgwA0k0ddp9DDoGejzftL8t8jIBfjQ2+g/azV
	rKVw5RUY0s8NK8KJ6kjbY3JrSxzQDaot/6nC9DzVUFkFjjWkxfxq8qn0JnmU7lbKz0QeaqjtSmsu/
	mLdFsVeSlpm3tQPT+Wng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh2E-0000000Gfo2-01K3;
	Thu, 11 Dec 2025 13:48:46 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh2B-0000000Gfc2-3PyN
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460924; x=1796996924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MvRXdmuDLuMZGLpL5j/bG5yh2xavW9pe4st+0BoC74M=;
  b=S6VL4AQLNeBq6hdT1dDDj9icCDyfqOtVcYSXQfMIXVPx9ELM4HM3tJxJ
   WGSlxxG29vHnNF/k7qdcT9D1Gx1k0RyGG+BxjepVdGAOGXHIuc+Ci3FBj
   JmAlWhXOkE5TVMt7Z+d89iBoHyTCjd77kFsO/MAR9420fhajdfPMb/tkn
   oLZG67UHSUmeAQKyxBy6SELwg0vngGUscGI6yBVS1uNCgT9XZ68OpjU+Y
   5fHRBhl/lInMjXX5y1qlQq6LbiFudFpErJt9dS/yYCrihP4wM3lf6T9/j
   HQcKHWtwNwgZVfj/ywSmHLayrmGMUHr+5OBs/Li+PWc7NAxODAOy5RhD2
   w==;
X-CSE-ConnectionGUID: F1OXJexfS3Ojr5mDNMxD6A==
X-CSE-MsgGUID: hWHvbUJ5Q025hV4Ff7QwUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481929"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:43 -0800
X-CSE-ConnectionGUID: WCXGDyQeSKy7uXkTzESOMA==
X-CSE-MsgGUID: kXAublMzSYOC+5UYkBaEnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171712"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:42 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 10/10] i3c: mipi-i3c-hci-pci: Define Multi-Bus Instances for Intel controllers
Date: Thu, 11 Dec 2025 15:48:09 +0200
Message-ID: <20251211134809.75872-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054843_864557_CCFE9CB6 
X-CRM114-Status: UNSURE (   9.37  )
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


Changes in V2:
	Also define instance 0 in driver_data


 .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index de1f71763786..9937718dc069 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -190,6 +190,13 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 	.instance_count = 1,
 };
 
+static const struct mipi_i3c_hci_pci_info intel_mi_info = {
+	.init = intel_i3c_init,
+	.exit = intel_i3c_exit,
+	.instance_offset = {0, 0x400},
+	.instance_count = 2,
+};
+
 static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
 {
 	for (int i = 0; i < hci->dev_id_cnt; i++)
@@ -323,17 +330,17 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 
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
