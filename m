Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B82C982CF
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXm32JOl7Q4UTU5flk1OpTZ5No2RSbl+kWDarKLQPaw=; b=HSvbM3B8eiCfHP
	r1ZXSpwaIwOuosvDpbGfEA7xCBqnWz4Ly6pcxlSU6U3s4H9I3jJcP9UFa6jEIGwNvDGoet0H0WPHT
	sbOU1xfy82jwIsnKfc0FyhXgzRbz4je5w7Xff9965kTqoyxn6WJEKkIz2ewE9pZLOnvSx3PSn7HX8
	nA87QcUvkAgvlJfT18jiCyzbCHzvIaxGq3sb/MtBsNdFFQMHiB3WPEuL7LwCqhNvTychB6i7o69sZ
	5QEVxGwdLTD2UzZaGiX1x2NP/VldnbMqbyapGjUpCu/TH7e5VvUVnRNG702LWhqvySZ/tgGX+V8pI
	L9SDZeLTkOIWLJsyftYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVR-0000000EKSr-07SQ;
	Fri, 16 Jan 2026 15:12:57 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVO-0000000EKQu-41CL
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 15:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768576374; x=1800112374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VOEEoYCcEPvtR/4uxET1B9atJua7rF8aKAnJ49Kyw7A=;
  b=ZU/cfgGG/EB2AP6duDTaODuJ1kc3402gsneAZ0Nr48u1qZ2fyQVAJVmN
   6pEZOQLUqg6kupSPXRtAMtFOOVlDV2Jj66YZ8zdablxXXJsAMXuZScKvQ
   ElYa354nNsFbztY3FcZIAeDfmJFstwJmOm8s2JoKTHanZYCh2oCrXoYrv
   rQ7VvSkJ7uwI0XNFJUqZd/ebaY6jd80GLENWstm9gzet9pdOuc30fP7aC
   MHZZPhdOlHRJGAw/+DBPWLxD+0+LnUKJQJ9Nmhssge22BBv8qi29ihfnr
   kwRTCwkBGZZhKom+pCzV4f6rhTPBL9oUgbXWgDiFXt0EKYWGyLCUP/WRo
   w==;
X-CSE-ConnectionGUID: QPhvPOH5QuerEHhYpW8FCw==
X-CSE-MsgGUID: tAYsO0AmRPeYsLUOIu4FEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69802821"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69802821"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:53 -0800
X-CSE-ConnectionGUID: HNHotEcQQg68ZcU2Dgc3cA==
X-CSE-MsgGUID: 3s7A85t8Ty+Ca4fbMBf9og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="209743036"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:52 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 3/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Fri, 16 Jan 2026 17:12:37 +0200
Message-ID: <20260116151237.96721-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260116151237.96721-1-adrian.hunter@intel.com>
References: <20260116151237.96721-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071255_043901_14531873 
X-CRM114-Status: GOOD (  10.56  )
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
---
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
