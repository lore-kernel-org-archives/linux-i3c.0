Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F7FF94CA4
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGg6CmO/IUJTq8OcMUTVfz+IMIhiDZcr94Maaq2aU+c=; b=1VgmIh5pqTlliU
	EQe10fmOpu0Pj9H/RGwGM3OAQZ8TWrcKVAsvJa96971UvPFDYBWuYRh6pX8WJF2bFNe9emwoRTQUp
	qWDhHnYBwaAefZUI21zwuDgrr+6Xd+6HBtOTawI3xkCvGi5pW6UTkQ20clyAlCLkewEilR3LB/nD2
	15qZ3mVElBVP8X6aASuM2ARsQWQ3Pgi9Ru+spPEDMvHggih+7bxnI4692MaIoYeumm080OqQocN0Z
	Q92/+U7QvPvaVWBPazxlwEzpZXnWSH55FupcmTKr46FuLbVu8Ch7qkMK39nJ14w3hwrFYSt87yGkN
	x6VSd6SwiIkeyGV4j59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJO-00000008zYw-2K9U;
	Tue, 21 Apr 2026 17:55:02 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJM-00000008zV1-2fHC
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794100; x=1808330100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vIipsx5svp72kwB41kARwQF7UhLQmZOq5LWQKjJv/G4=;
  b=F3raOzEiFnr1burmZM0OY2OntdjILZN/RJC6EeafMm+aoynRK/9/r8GP
   9J2aiNLdKEvzxaqjLW9LAb4sPdMev6nZ11smHq4ibJCbnz4Oucvd0NWEB
   n0SwB77M3ULiDPpRmN1sEe4xkDvNuw3JziylKCKhDGTSoFakaQXncqEEo
   klPHB2FViae9sPfN1M+hv007NsTeja4q6/7z8VF7L33AM/KqttSwcck0w
   kKkQlAIuDIOZldXk8JZWtYA2TF048kdHwjSGZ7JEMJ7Zj+gc8NH7EGLGc
   QjtH8hZpALOxd/jfP5i6DalwPg7yoydY2axZMyZ/+g0cLU0uWxZP/4L+C
   w==;
X-CSE-ConnectionGUID: wem5yoZPRwijzlerVzVAyQ==
X-CSE-MsgGUID: od35lHqLRwq3HyTCZPuUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651380"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:55:00 -0700
X-CSE-ConnectionGUID: eU1ft4tfTLCQnme+Dw9g1Q==
X-CSE-MsgGUID: WMopnoCQSW6wefY8Gr7FMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494921"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:59 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 07/16] i3c: mipi-i3c-hci: Complete transfer lists immediately on error
Date: Tue, 21 Apr 2026 20:54:26 +0300
Message-ID: <20260421175435.122094-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105500_725258_CF6AD61B 
X-CRM114-Status: GOOD (  12.59  )
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


Changes in V2:

	Renamed completing_xfer to final_xfer


 drivers/i3c/master/mipi-i3c-hci/dma.c | 6 ++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 28e4d38f55d3..899fdf6555a8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -502,6 +502,8 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
 		struct hci_xfer *xfer = xfer_list + i;
 		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
 
+		xfer->final_xfer = xfer_list + n - 1;
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
+			if (xfer == xfer->final_xfer || RESP_STATUS(resp))
+				complete(xfer->final_xfer->completion);
 			if (RESP_STATUS(resp))
 				hci->enqueue_blocked = true;
 		}
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index d630400ec945..f07fc627d4d2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -104,6 +104,7 @@ struct hci_xfer {
 		struct {
 			/* DMA specific */
 			struct i3c_dma *dma;
+			struct hci_xfer *final_xfer;
 			int ring_number;
 			int ring_entry;
 		};
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
