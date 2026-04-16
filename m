Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8F0F8D763
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qznZWc7eLv6z7wgoqNsd+c1SvFB3o+6lU4XBre602bs=; b=C+IpdtXMuh2X6h
	nPX+meEEEzFcS9ONM3Y6L+5EA4ddVqe4coBL7/laSCaBqFG0QPyMXQA27Co9rXcoAulY2YPWXEgLc
	ALp1ouDjvUGJJyYj2Kw7v7xMyIzO/OFEokMdf/ikmf5mzRJE6XmW75a1YfNbnmkqGI75lni1Q+wM0
	Dji22u/fB3dI4WktvfHanRP0hJ8dH5BqrIxTbWYUuTby65uXRyvlsXr2J7mDxP25xcJ6uHhWm5Rkw
	1ASEz0rQLkuH223MxERPUn3SKb/p7sE5qIStV4O0ngFu/fRfRlynSE/QCUc2yZdVjcPHTIj+bG9ij
	FZwcqBK3clF09PZSK9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQy4-00000002jiK-1gOv;
	Thu, 16 Apr 2026 17:57:32 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQy3-00000002jej-01qa
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362251; x=1807898251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sftKnuMKbgr2LYtEm+2TjhHATg50Nz6kkphzeIBb1pg=;
  b=dytrw+zpwnCXQCI6bmp/aGrGr8IcY5RcBAErpLroEbzgnCEqHLlKlvVG
   Jq5tXUGG/5RW24yHYYn6wjhE98Tn9/hELmjMNvhUFfTg7bhHMmbGILnB1
   gAQhV7n6zKMVzu8fqamQYBXHRL32BRQiQUjsP5JuMxzZItCTSujj+B8WG
   gbwK6P5opCdQGJfOgunwGFDfysyn5vJub114kVy0pdIqxjGYf7LJkK/9G
   iUompk3J+yKqIwHETrX9JfTWbeWqxEZl1M6vHfryRyroxGSHRfuLchmcb
   mfNchxqCi5nb2xI4D1BmRhIdz37//Ogx1COWMNBoLlZzoq5lZAjFkdorb
   A==;
X-CSE-ConnectionGUID: JZ8npAnARDy8sLlAG65Fkw==
X-CSE-MsgGUID: fdeIUE8WSy2HlcPY9al9Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778387"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778387"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:30 -0700
X-CSE-ConnectionGUID: t6yEQZbgR+O9DWEwRUK2Ug==
X-CSE-MsgGUID: abSEi+MFT5+G4Rq2KJ/R3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784564"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:28 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/16] i3c: mipi-i3c-hci: Complete transfer lists immediately on error
Date: Thu, 16 Apr 2026 20:56:55 +0300
Message-ID: <20260416175704.41217-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105731_093006_37AEE2D2 
X-CRM114-Status: GOOD (  12.33  )
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

In DMA mode, transfer lists are currently completed only when the final
transfer in the list completes. If an earlier transfer fails, the list is
left incomplete and callers wait until timeout.

There is no need to wait for a timeout, as the completion path in
i3c_hci_process_xfer() already checks for error status. Complete the
transfer list as soon as any transfer in the list reports an error.

This avoids unnecessary delays and spurious timeouts on error.

Complete a transfer list completion immediately there is an error.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 6 ++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 28e4d38f55d3..5eea4fe6ebb3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -502,6 +502,8 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		struct hci_xfer *xfer = xfer_list + i;
 		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
 
+		xfer->completing_xfer = xfer_list + n - 1;
+
 		/* store cmd descriptor */
 		*ring_data++ = xfer->cmd_desc[0];
 		*ring_data++ = xfer->cmd_desc[1];
@@ -576,8 +578,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 					tid, xfer->cmd_tid);
 				/* TODO: do something about it? */
 			}
-			if (xfer->completion)
-				complete(xfer->completion);
+			if (xfer == xfer->completing_xfer || RESP_STATUS(resp))
+				complete(xfer->completing_xfer->completion);
 			if (RESP_STATUS(resp))
 				hci->enqueue_blocked = true;
 		}
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index d630400ec945..eee3e11810dd 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -104,6 +104,7 @@ struct hci_xfer {
 		struct {
 			/* DMA specific */
 			struct i3c_dma *dma;
+			struct hci_xfer *completing_xfer;
 			int ring_number;
 			int ring_entry;
 		};
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
