Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659B8C5DF84
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzvlJSz/qgU/tL1h76EPEeY2oyjFsm6TUDa8haceUvA=; b=Kb6q5K3YKnCzMg
	JvGORb2FnzKVedAqaW4WBop5lnrIwmHDfdTWiyOXODEJE3dX8kLOLd+aCKKdItqP1vHTqJb2pMB60
	zw25VOoVyHvX5RhBdZD0X84HDZHDitdeXQvghJfXbBbxRAhq+iEKUAxkCampyDt0VvUo6j0SAUEAP
	gsMRWS+m4nXuQ3+dXt9h3LK88Sj5saqIbz0tq9qwFHn43HL4aFhtw2nnw2FWE6vhTAAlhoBXWKqki
	qQ+sUK3Rzvv6Dp+UJGYoSQ89KsQd72Xf0j/TZqQVTFHh0Nz/qMdH9RCtlQl4i5SV5hXAwM440X7+L
	a2WcU1KJ6c0+mGvfqa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGh-00000007lf0-0ViQ;
	Tue, 18 Aug 2026 10:42:07 +0000
Received: from ms.asus.com ([103.10.4.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGe-00000007ldV-1pY9
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 10:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1787049725; x=1818585725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oZ678vPgTMNRQTofigf6RecpPZb30zBfV/Np1Ou+uc0=;
  b=Mjtvu30YMW47uOLUlJWaNNb6BLLAm97lgnDEg9beRmqiP7DvAmfTXhIa
   iKc18xIQR0wl+MrRSSFRU3A8nh9IqjMGx4+Pf9Dr30jlyE4VlNcsT+lpZ
   guK/1q3g98I97ceTVBfK1athbM6JFYcMicld2oyGbOLqK70l9Eu0UECo/
   8=;
X-CSE-ConnectionGUID: IHT7oCuZTfuPMDrR+U8f5g==
X-CSE-MsgGUID: Tbp+yTkpQFqPyId55Fd3YA==
Received: from apza006tmd.corpnet.asus ([172.22.47.66])
  by ms.asus.com with ESMTP; 18 Aug 2026 18:42:03 +0800
Received: from mymail.asus.com (42.79.21.38) by APZA006TMD.corpnet.asus
 (172.22.47.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 18 Aug
 2026 18:42:00 +0800
From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <boris.brezillon@collabora.com>,
	<linux-i3c@lists.infradead.org>, <Jm_Liao@asmedia.com.tw>,
	<Patrick_Yen@asmedia.com.tw>, <Chloe_Chen@asmedia.com.tw>,
	<Yd_Tseng@asmedia.com.tw>
Subject: [PATCH v4 3/3] i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller
Date: Tue, 18 Aug 2026 18:41:06 +0800
Message-ID: <20260818104106.763772-4-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
References: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-Originating-IP: [42.79.21.38]
X-ClientProxiedBy: APZA001EXB.corpnet.asus (172.22.6.13) To
 APZA006TMD.corpnet.asus (172.22.47.66)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-AS-Result: No-10--5.958500-8.000000
X-TMASE-MatchedRID: kREspPIIG7TJ+P2VFrJmrK5CuYauRYEN59KGlOljPvsZ0o/nGo6+ZFzP
	hPhLiWSadBjoMEPmPfjOgvfRKL36z+Zm92tquz3hcHJ4CH0c7yAwoEy+KKX0stKVybROFwAg2Z8
	68ZgqJNgObBW6/DqoDOUTedInjF4ziRz4gknBIqD9L8XB98yMGu/NeA9HA27QVufJYTwZR+xLkB
	olNiR3k2mixsRx/vikwIIDnRfCYC7Kx8BXMyxWlrAdecdWQCzFvZc1RlmploDh+0R5IBKRsr/a0
	nd+hIFC0KBwVrJVSIgDmyMy7NxgFnkymWss+DP3/mWg8WDgmCbBB1VpJh3UUxPUHezR7J3Jsb9E
	4+cAVnqLvFcWo9agJg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.958500-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-SNTS-SMTP: 695EF6B81387B68502686A2C13323CC9A2C929C44DDDBFA932FB73F7271ABE8B2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034204_639852_0E811061 
X-CRM114-Status: GOOD (  12.37  )
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

Add support for the AMD_PT I3C controller by introducing the following
changes:
- Add AMD_PT I3C controller platform device ID in core.c.
- Register AMD_PT I3C controller PCI ID in mipi-i3c-hci-pci.c.

Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v4:
 - No content changes. Resent to fix From:/Signed-off-by: address
   mismatch caused by mail relay configuration (Frank).
v3:
 - Restored Frank's Reviewed-by tag from v1 (Adrian).
 - Formatted platform_device_id entry with '{' on a separate line (Adrian).
 - Moved amd_pt_info definition to match device table order (Adrian).
 - Added space before closing brace in mipi_i3c_hci_pci_devices[] (Adrian).
 - Aligned From: and Signed-off-by: email addresses (Adrian).
v2:
 - No changes (rebased on top of v2 patch series).

 drivers/i3c/master/mipi-i3c-hci/core.c             | 4 ++++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dccc974ef15a..27dce02e7931 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1198,6 +1198,10 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
 			HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET |
 			HCI_QUIRK_DMA_REQUIRES_HC_ABORT,
 	},
+	{
+		.name = "amd-pt-i3c-hci",
+		.driver_data = HCI_QUIRK_RPM_ALLOWED,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 5a9e2a43eff8..cf61e056bc2a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -223,6 +223,13 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
 	.control_instance_pm = true,
 };
 
+static const struct mipi_i3c_hci_pci_info amd_pt_info = {
+	.name = "amd-pt-i3c-hci",
+	.id = {0},
+	.instance_offset = {0},
+	.instance_count = 1,
+};
+
 static int mipi_i3c_hci_pci_find_instance(struct mipi_i3c_hci_pci *hci, struct device *dev)
 {
 	for (int i = 0; i < INST_MAX; i++) {
@@ -475,6 +482,8 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Nova Lake-H */
 	{ PCI_VDEVICE(INTEL, 0xd37c), .driver_data = (kernel_ulong_t)&intel_mi_1_info },
 	{ PCI_VDEVICE(INTEL, 0xd36f), .driver_data = (kernel_ulong_t)&intel_mi_2_info },
+	/* AMD_PT */
+	{ PCI_VDEVICE(AMD, 0x444c), .driver_data = (kernel_ulong_t)&amd_pt_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.43.0

==================================================================================================================
This email and any attachments to it contain confidential information and are intended solely for the use of the individual to whom it 
is addressed.If you are not the intended recipient or receive it accidentally, please immediately notify the sender by e-mail and delete 
the message and any attachments from your computer system, and destroy all hard copies. If any, please be advised that any unauthorized 
disclosure, copying, distribution or any action taken or omitted in reliance on this, is illegal and prohibited. Furthermore, any views 
or opinions expressed are solely those of the author and do not represent those of ASMedia Technology Inc. Thank you for your cooperation.
==================================================================================================================
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
