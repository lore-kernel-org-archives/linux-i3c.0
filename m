Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD510CCF2D5
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQo4qY5tLVb999+EgVXedkCwtSTwzEHafxd8k6QcrT0=; b=BRDfFaK8tm+fLK
	8RTSxE+2mjYa89nnQnxLpc7ow+9B35l1cY0u1eCvvmUg31PjAOZA9/EzpyN/d7nMQ72plA+Tk1ZeC
	jyJcMhTNDMJ/gOMPHqHEJG4S2vkPETdkF+InG7F35tsTZkagDfeDL8gX3O0pJvyoIEiO41yMA20rX
	FJDSdQubAgonPBe+J33fY2uOVfQdWXImWOxmpUzEj/+MrLaEf4yueJdkuT0C70YmQNcShajZbqhGR
	ki3uxV89YOzvjtD6rYrR6nckaeFlyJCJprGokYnZPxUJNmhyQqFXHcnAoag57OeJIsNz8rUDfAI6p
	Q6LbIONKnrskvvUQJpYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6J-00000001hOO-1rk6;
	Mon, 19 Jan 2026 10:03:11 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6G-00000001hMs-0AGs
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 10:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816988; x=1800352988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DOhX/9XTCCdvzunDPE9hzjy0nv07GVbWlTKewqw0oKk=;
  b=LDFUFxrwTEnSepQVK4G1RZluEWdVjPPXgVM5J07mv338q3GiskhiFtUw
   o7nymbSYpmoI7gmUXe47ERPXoMz7edLNdqLTcWmq3Mr08TfWAz+BnhJJ+
   T7XWo62VOuJSkJ/7IWbZ3JIZZYCA0gG5CGKCxPLtM2Tcyxm/TT+77ZEb+
   nmtBN8MBHjt8749zwgqxki2BQSrEeikOQXqqcq9d0cZNR7MvtJMJ/NNYN
   t9dUisOsBlkPq0usP/ChQe5XWe/i9gJ0NQhC2gwVpr/snBkKIPGyGvf0c
   NgsH+SGCX1gw//9GCcYYy8xXhBceNuxOnnRR9K8I6sdIy0nqGYdQIA6tp
   g==;
X-CSE-ConnectionGUID: wc7W3f6qQqOpBIfUwdJ1fg==
X-CSE-MsgGUID: TEhCdhfRQEybTMXfefW4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87605312"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87605312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:28 -0800
X-CSE-ConnectionGUID: CeZSlO8lQhmoEaAGkJwRcw==
X-CSE-MsgGUID: P+7/vOIxQx+BjSHSe+mOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206179784"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.27])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:26 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 3/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Mon, 19 Jan 2026 12:02:12 +0200
Message-ID: <20260119100212.29607-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119100212.29607-1-adrian.hunter@intel.com>
References: <20260119100212.29607-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020308_768728_CFC6ECE1 
X-CRM114-Status: GOOD (  10.82  )
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


Chnages in V2:

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
