Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169FFFEFB57
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/msMcIYU6A4+e0CWper6XVlmkz36KW9wT9Yg0H+08lU=; b=B5ck+0WXA93KOV
	qFA1pjGmTmFY+go2fG5eERMOFjFdHJ892DvcfGUU0HkPsCNTslY+/8Ejy4E3Zis+4qyc1VOycispT
	vw1pOt/4xibBiquef+W81AY654FdwoQKq+YFGhMnicc4MNINiLyLW4GQ7x2S4Yp8DL800sJhdSvkH
	KrGzsRpAFK4RCHXlhhSfznDACvy+J7lnoBRO4RU33GOtWwlik3LsbEhTqpYy1LMVGPWFFIoG+D406
	+8XpyEvvbv9BIZrKgPxU8VRmZLnH86MsEHrT4BHBCSDq0JVkbkbDCeOMRi5MDLUj5pS8vP36oOYYe
	wpSgQ9KkZXLB0DIi6fsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZl-00000008TXJ-3SM9;
	Fri, 27 Feb 2026 14:12:17 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZi-00000008TRP-1pmx
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201534; x=1803737534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wtUasUjkX97tN9R67I5HNOoZYQ9EGRlY2oWEdSF802c=;
  b=UDTat7fbXrO7qav4vGdq2zpDtv/k4g+Ww+JnsvHQHO6gbG9cjsPH9VUi
   TM2dBUdZxGe15fPdV0XKoNbkEgwLACCCS8J87x2+PILeRFqFAapIu57H/
   UtxOtrVDg36/yBo4kzCbSziEzS3VuvnZVdihluiM5D7HRcNU1/AGp/sno
   U1VLbCvyuXsMUZVPhcOS+48sQeDvTEP5HM0beKeazpm6NQLVFsxcseE+w
   FcHSebNF6vQ7ADVWa6paq7lXH3sd8utjaj/zKrXG16KUsCwUiXAIi8oKz
   801ipuS4GSE0CrtK0LTHaGVAvoQiDzKJFTQMnlMK7YRc6LnAemTGGfEsT
   Q==;
X-CSE-ConnectionGUID: DQtTD2GtR46HHud5Mk3dqw==
X-CSE-MsgGUID: 4lAOs0ONTZCDs/xjcDBPOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750041"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750041"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:12 -0800
X-CSE-ConnectionGUID: BwqiBhGnTaetBfY8CvyrQw==
X-CSE-MsgGUID: ksYWMsubTCWcJs+2k/JYiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015701"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:10 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 07/12] i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
Date: Fri, 27 Feb 2026 16:11:44 +0200
Message-ID: <20260227141149.184980-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061214_486431_9FED4360 
X-CRM114-Status: GOOD (  11.79  )
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
---
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
index dff96b84479e..a11d0743fb80 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -586,7 +586,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
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
