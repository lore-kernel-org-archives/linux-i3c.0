Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A0BF01804
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbzjHGpqNk7uN2Vf751+cXTfba6o4l4TJJVMSXQyFNc=; b=09W40otVi1/HS3
	GUHSXk2dDFBs1q2s9U5XTw3tTtYoY+Y0z64EvNHMds0fXXg9YeluY4ioOyNFKXQ6rKmj8kqELk22i
	ldtIxhfNyvwwThmr5w/lo148ZrQ8IVvzXDY7ynHe5AKEX0TJJKfyHmiCKIG3avrtgsuV0uj8ad3Yp
	uEESoeHYO2NQIHBdU1i8t6PBTa13SYtqu1SIdY18IzUvySXtHGfy3MT8CC4pqrWmddABBo/iYBfsG
	To1RqOF8dFCA4K2qIfojkvrYMSSsSgeiANODzJ9bszxqe50eShnAwQS6UyZww4WUrFNrIqtBPosLy
	Ipdni5fVVMt5Iy7/qBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYl-000000039Bl-3e6r;
	Fri, 06 Mar 2026 07:25:19 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYk-0000000395H-1qXx
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781918; x=1804317918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O0H9H5yoMUY5woq1GKDu2nl+gdt7yOSL0g1wUIHZtR0=;
  b=Fciqa4lEv1FEdsAMGnjRcrgC4phlTqKW2DCLCgDxCVuKewtuDwU8cjRP
   ZHJJo4qUk9X4LVWFrpaY3gkPcLmFhvA3K1r3KxDVamwNZNZcFSfkhwYTZ
   sfWkXsy5fyqCHxe5Ceh5TLWrGWMqc633kN/6qgjzubkThP7OuBNPbF2n6
   u+OjReGLpIV+CWwxLtrGlV3cwE3d+NY8ObIayxmy2nlq0HFjje1rl6h3W
   juVYd5bKPQ4PtslHt2luIWXsivphe8oR4bPq7y0ZzOTpoNPKcFIwN75Ez
   j8veUSIWlxIPZZYTianbS9Ou9kYqf18Eno3ucACTvo79VQG905UbYvcIH
   Q==;
X-CSE-ConnectionGUID: UvWESghGTgmEjA+LE6+EaA==
X-CSE-MsgGUID: 0hgHPYmjRKGmf6G6QCf8YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461346"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461346"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:18 -0800
X-CSE-ConnectionGUID: Xv++rzDMTn+jVBT05A15/g==
X-CSE-MsgGUID: ewB9QCuARFSy4tnzQ6/v8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419948"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:16 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 09/14] i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
Date: Fri,  6 Mar 2026 09:24:46 +0200
Message-ID: <20260306072451.11131-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232518_491356_147E607B 
X-CRM114-Status: GOOD (  11.14  )
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

The internal control command descriptor used for no-op commands includes a
Transaction ID (TID) field, but the no-op command constructed in
hci_dma_dequeue_xfer() omitted it.  As a result, the hardware receives a
no-op descriptor without the expected TID.

This bug has gone unnoticed because the TID is currently not validated in
the no-op completion path, but the descriptor format requires it to be
present.

Add the missing TID field when generating a no-op descriptor so that its
layout matches the defined command structure.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/cmd.h | 1 +
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
index 1d6dd2c5d01a..b1bf87daa651 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -17,6 +17,7 @@
 #define CMD_0_TOC			W0_BIT_(31)
 #define CMD_0_ROC			W0_BIT_(30)
 #define CMD_0_ATTR			W0_MASK(2, 0)
+#define CMD_0_TID			W0_MASK(6, 3)
 
 /*
  * Response Descriptor Structure
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index a3e8e01a35c9..239a195df7c7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -582,7 +582,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 			u32 *ring_data = rh->xfer + rh->xfer_struct_sz * idx;
 
 			/* store no-op cmd descriptor */
-			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7);
+			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7) | FIELD_PREP(CMD_0_TID, xfer->cmd_tid);
 			*ring_data++ = 0;
 			if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
 				*ring_data++ = 0;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
