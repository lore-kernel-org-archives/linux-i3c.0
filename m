Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8F2E95385
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+WdUsM5BJFc3ii86/U4zmcG/VhatCALksjZ/GLQQ5o=; b=BOFXZnMKZ7yFoP
	bruDI7d4t4sekc7TjFXCRpy2PlgQd+66PsSADXZb5GBY0tKzxFNtkrhokhTMpAggrmbq0KvCc9yjY
	glTMWpJYZfit5k56s9Sw7YDouxeQ7Ta4N8SQhydWHm9tC8/OtJRYoT3jDWQBOpJTCBJg7uZG5Bbh6
	lvMNMRUMBEKFzndrj95PGfaltMLbCMJ/aMdo+mOOo/Q3BXjBozgTd57n634ZaxxlnqbWxHV1XPisE
	3Jwen9qb+uWsKtLAbHEwjIj8HEe8d9Ey+ZwmRgB2Yj5s4HzdWlw76Zd/9phx5PN3ra65fno3fBru9
	yyL91Lw4SCtu8b5wmpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar4-00000008LJo-1oAv;
	Wed, 04 Feb 2026 11:15:30 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar2-00000008LHZ-1kKO
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 11:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203728; x=1801739728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KkNfCwrKCHp8Xe5+Jm3fYu//MNhdQMcABR/3080KeIU=;
  b=dOyrMRar9XEWH8A1meCJL+xxitC7VPe7C4sNVMvFtkO/YvpOon2aoNlD
   NCgi9oUyKXjA/487L7ZncdUatjQ8fr211mhSE/HhQHYIvSIKcipQPFcYN
   i+UOGGZ9rYdCKF5f15DlAIaqXu2KMEECH+32kiWMsPHZSMfmcHoJ1PMtZ
   eXNQKEtxQJXKnGmakTXOsynwcc22IdL8ZGUmIfJuTwA0w+AdnGgZ1sqUr
   siXQCsmVGnJtilGVd4vmGgtLlZuBAeZSwG9SUoZc4HwGGFAGGAAl6tXO6
   GIt5nFqF5ObsaxUNYU2t8JkzqmdgrT82hPbE47bRonTWPFLIYorwu0SHD
   w==;
X-CSE-ConnectionGUID: H/YFHRjET8KzQ0BoHeZWUA==
X-CSE-MsgGUID: O6R/Xdi+Rje697sPRMoL5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70406058"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70406058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:28 -0800
X-CSE-ConnectionGUID: bs6xWYdhSHmZPP79Wh20nw==
X-CSE-MsgGUID: 9IPRzyk6SrKOvlnnRRw6cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739281"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.181])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:26 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 3/6] i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
Date: Wed,  4 Feb 2026 13:15:08 +0200
Message-ID: <20260204111511.78626-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204111511.78626-1-adrian.hunter@intel.com>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031528_461242_95A093E0 
X-CRM114-Status: GOOD (  12.36  )
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

Some I3C controllers can be automatically runtime-resumed in order to
handle in-band interrupts (IBIs), meaning that runtime suspend does not
need to be blocked when IBIs are enabled.

For example, a PCI-attached controller in a low-power state may generate
a Power Management Event (PME) when the SDA line is pulled low to signal
the START condition of an IBI. The PCI subsystem will then runtime-resume
the device, allowing the IBI to be received without requiring the
controller to remain active.

Introduce a new quirk, HCI_QUIRK_RPM_IBI_ALLOWED, so that drivers can
opt-in to this capability via driver data.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 3 +++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e925584113d1..ec4dbe64c35e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -959,6 +959,9 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
 		i3c_hci_rpm_enable(&pdev->dev);
 
+	if (hci->quirks & HCI_QUIRK_RPM_IBI_ALLOWED)
+		hci->master.rpm_ibi_allowed = true;
+
 	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 6035f74212db..819328a85b84 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -146,6 +146,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
+#define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
