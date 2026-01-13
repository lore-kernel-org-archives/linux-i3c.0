Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E66D29DDE
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVzbuYEep2VXqF/qbyfExm6vVDqMM4vWCNVLZO315v4=; b=xM4DADWt3fzTOu
	TycPfmrLqHaXffH5PkiFaCO2WGrqUEEsfuPBSXCmmzpOjuoAnJO1JdJPwq+5MS6Ym42GdQ0hMYpBc
	JJRXiruPUfPE/dtjvZsSINKAGrM6JtkQdbNUjluPdJPTNXMFIcpu6Dw0C9uGKFHAV72xG24Oiy3Pl
	d8AD4xel5CW/ccIPDNhBm8EagEAwybnC4pfOPWTyMSzC3HE3XI5nFNKNoWOopsI1hIYUB79RwJXWZ
	/G6pgqBQdIKkOry5nHeB08+tv8yDjdFE3iwWIfM+mYjlYfLov9dHV5V1hfgofaXsC7zMzdbofpDL8
	2Z9PWlk/nN1jodxbrzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoS-00000006eVv-0mXj;
	Tue, 13 Jan 2026 07:27:38 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoP-00000006eSy-2Wyt
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289254; x=1799825254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t3i2Gc7n4EzP/cLmHA4QN3cmkcU+Xj3UTCX3D2NqeH8=;
  b=J17DxUYSXuT3lbtGoeZpqxX6uC8ZMFCdHkyy8MBbYOtyb8608DAfi1b5
   MMffmfJpkfxieqOFf5Y7ulJNc+dD0mWTXuvGKdNlTLVnUKGkqjEmGt18s
   gL1v0AZdfM+kbh5P62Va8BNA8NTG6rPQ5z7ZJdwaZSwyuWZqugvDEmuKA
   0PPe2obTTNJDdMyV9IO7glyw8fZcOzOMNIPO/8o/+C9OQ4n87EnlZRKM4
   rnwno0TzU6mL2i6bi4UIVnRiwLcl48QzXTz8fD86n3a0E3BLcreHGGm6a
   G439On0RyEs55gT6vuW2m1SwtorcQ+jA8taeZlAjoIWXqSJQW7xX7yHTI
   Q==;
X-CSE-ConnectionGUID: kgMwMd0GRL+XBfzRGX/aJA==
X-CSE-MsgGUID: LS6a7v4fSq6SOL/RkWcuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625462"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:34 -0800
X-CSE-ConnectionGUID: lbbCg5FaRQOxLHN3DV3TYw==
X-CSE-MsgGUID: czuFs82+TNyFoLDEisbNcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021250"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:32 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 07/21] i3c: mipi-i3c-hci: Manage DMA deallocation via devres action
Date: Tue, 13 Jan 2026 09:26:48 +0200
Message-ID: <20260113072702.16268-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232733_676580_4C7C28B6 
X-CRM114-Status: GOOD (  12.75  )
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

The driver already uses devres for resource management, but the standard
resource-managed DMA allocation helpers cannot be used because they assume
the DMA device matches the managed device.

To address this, factor out the deallocation logic from hci_dma_cleanup()
into a new helper, hci_dma_free(), and register it as a devres action.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Move hci_dma_free() below hci_dma_cleanup() to make patch look
	better to review

	Frank suggested using devm_add_action_and_reset() but it doesn't
	work because the error path needs to call hci_dma_cleanup() before
	hci_dma_free


 drivers/i3c/master/mipi-i3c-hci/dma.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 54849aa98fad..4999cf3d9674 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -169,6 +169,22 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 
 		rh_reg_write(CR_SETUP, 0);
 		rh_reg_write(IBI_SETUP, 0);
+	}
+
+	rhs_reg_write(CONTROL, 0);
+}
+
+static void hci_dma_free(void *data)
+{
+	struct i3c_hci *hci = data;
+	struct hci_rings_data *rings = hci->io_data;
+	struct hci_rh_data *rh;
+
+	if (!rings)
+		return;
+
+	for (int i = 0; i < rings->total; i++) {
+		rh = &rings->headers[i];
 
 		if (rh->xfer)
 			dma_free_coherent(rings->sysdev,
@@ -190,8 +206,6 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 		kfree(rh->ibi_data);
 	}
 
-	rhs_reg_write(CONTROL, 0);
-
 	kfree(rings);
 	hci->io_data = NULL;
 }
@@ -359,10 +373,15 @@ static int hci_dma_init(struct i3c_hci *hci)
 					   RING_CTRL_RUN_STOP);
 	}
 
+	ret = devm_add_action(hci->master.dev.parent, hci_dma_free, hci);
+	if (ret)
+		goto err_out;
+
 	return 0;
 
 err_out:
 	hci_dma_cleanup(hci);
+	hci_dma_free(hci);
 	return ret;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
