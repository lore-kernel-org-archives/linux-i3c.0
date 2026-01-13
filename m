Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675BED29DDE
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA1gcPdIj2WbABPOHHTuJwTxNAKqplSUKmZYS/nyL5g=; b=1g4i4NS4GcB3Oa
	OvlcJROnbnL9Ax251tMAiDdQNQBGC247da96SGTEY+QOg/hoCCmsz/Dpe/1j1CFkYFH3jv/t7vB4i
	BMiOqiruNpHbAFcgmC7BVZ//2fGPHDFFvWj2RvXGeFs3mAzhkwuiDZFH3KrwI/I1gZ+d32TXkfsb8
	nYME/gUR9dV1nnwduYzHySKXgmU0UgTDQN3KUQaIR4neA0vCcEcxGpEkPFYYs9XhwOX10Z09cCRzV
	3KSOkWk/xdHSNl1dZ9jVwKqwWQTniT6GSpu+GqRDQzp7Mx11n0YXcmix9I5Kq7/2cgNkbADWLAOJC
	1+wGLzhsSmrvru6dQE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoG-00000006ePo-0Jdc;
	Tue, 13 Jan 2026 07:27:24 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoC-00000006eOv-3DYt
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289241; x=1799825241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MUu7uufXK8i/OxoJSwDMAninD9iBcDk/wgkWAwI8R9g=;
  b=OXmrRR54AzcxgPvdt/rXv5Rr2Dwsa9A3EsThRfC9x+iH/jZhojNv7+Qi
   cbQREnvifsfI2DqRdEL3RKcQYAi09AMLCPuOYGy27/8Npp6mkffE+15ld
   rtqVj2B+qnfMN/NTiiWHHp2eCJvgPrFo5IGBKv1FCI4i2uHEo+PO0eTkm
   LlrPjXM465i0o/Z0SRZkaMc5HvwOKC6GXg5PD7v3NarqSHtpWHk8fbkXu
   XAkeZWqmtQjsREyJoBxLdCcgBvfML44QwjTJUxiJN/GUYW4cwMWJUMtna
   Ps6HjUaUsswVH24IOfU5YIlyZwxY3JVKMC/1/t0ZT9iI+yP28HgNdxRXf
   A==;
X-CSE-ConnectionGUID: /4Sj1jbTRsqGmDaArzpgUA==
X-CSE-MsgGUID: 93R4vHWDR+uBMXZoPhnH1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625416"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625416"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:21 -0800
X-CSE-ConnectionGUID: UNIl1aL2Q92/r33VxgjOQA==
X-CSE-MsgGUID: jeqnupgnRbGpwwL3eWNxuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021059"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 01/21] i3c: mipi-i3c-hci: Reset RING_OPERATION1 fields during init
Date: Tue, 13 Jan 2026 09:26:42 +0200
Message-ID: <20260113072702.16268-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232720_844107_9FF20D80 
X-CRM114-Status: UNSURE (   8.50  )
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

The MIPI I3C HCI specification does not define reset values for
RING_OPERATION1 fields, and some controllers (e.g., Intel) do not clear
them during a software reset.  Ensure the ring pointers are explicitly
set to zero during bus initialization to avoid inconsistent state.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 0f6bbe184e85..5515ed740ca4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -340,6 +340,14 @@ static int hci_dma_init(struct i3c_hci *hci)
 		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
 
 ring_ready:
+		/*
+		 * The MIPI I3C HCI specification does not document reset values for
+		 * RING_OPERATION1 fields and some controllers (e.g. Intel controllers)
+		 * do not reset the values, so ensure the ring pointers are set to zero
+		 * here.
+		 */
+		rh_reg_write(RING_OPERATION1, 0);
+
 		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
 					   RING_CTRL_RUN_STOP);
 	}
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
