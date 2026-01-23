Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982E8D6CFDE
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyFLYF14TvErqUBKau/7yfJ7xYD+z5EIve5tQvNdeLE=; b=ABUebzgulZngB9
	azPpMfGpToR6JPWHDZICLcQPM1kUZQHLbg49+oJqs1whbn7UL3as8ccwLi/OnQOPlI2lExuKsCLmd
	tH3emchitHkf0HFzADgUL/8J065Obbu50UUXQnKs8kQtO/zhx2dyradapEVQVbFxShbTiUrrW3T9V
	/XRZM1rUios8jIcIQqB6Bq2V/Ut6y6WA7wkaKFmV1ZiJuje4qjCMbosIfKuZUOZn9HbHfxmqpbl6M
	bvcAoSQ2UqO+Sw/86V2LK1q7+VKpTOHiCdclWBDaRhtb56H3QIqKAYzKdd/oBNJ4ff3ZSI1jFhO0Y
	4ViGQzFAouMbp/5RugdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjq-00000008Imi-1VoY;
	Fri, 23 Jan 2026 06:33:46 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjn-00000008IkG-4C3N
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 06:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769150024; x=1800686024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2hxmL9Qz6gdt/XHVCwgsgP6NEUHmsMFhM0AcH8z+SDs=;
  b=NdwcFPAcbrf3oY9mYBT/d3gXm7tWSvSnAKt0UddM/YlpPzGrq2l88ruz
   oReVOeqxey+G7ZH40srOqKHvvnAYEYmPocFmM+8onvmWavCegFbYHjfX/
   ZZFrbgOJBrf8k4zTYt0N+YN3lkwJ6GS4MaQxJRj1pl+E7r0Qq4H/xRdWp
   SUrcR069fKTgO64eorgGnCRaLEHqe50D+22AG6FUgj6KvpilyRqEpEMPU
   h/XWrtbYrE0jlAQIzmXmmTjpfCMx2AG8/nppTc2J4qIr8iDGxUmLE6lpa
   tKhXs5az065ojpKkFXCparYZNxku5tZxmcejd3FD7FWQHmI5q6RcLfuAg
   g==;
X-CSE-ConnectionGUID: LCgtCfgdTZGs4p7DoWkM3w==
X-CSE-MsgGUID: qZcYO98fT/+g9btBF+76Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81514050"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81514050"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:44 -0800
X-CSE-ConnectionGUID: JONfSpUuQFSWu6nvrutDhw==
X-CSE-MsgGUID: x/XWe5crSg+lb+cS1vIXwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207210839"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.101])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:42 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 3/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Fri, 23 Jan 2026 08:33:25 +0200
Message-ID: <20260123063325.8210-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123063325.8210-1-adrian.hunter@intel.com>
References: <20260123063325.8210-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_223344_075137_268DE90D 
X-CRM114-Status: GOOD (  10.40  )
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


Changes in V4:

	None

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
