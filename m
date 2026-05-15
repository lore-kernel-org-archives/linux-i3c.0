Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6288ECD343F
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQGrsJl+/7y36TnEtgQt0PzZg6ZcZ5lwVstADFHCkyA=; b=jkP/3JKscKnsNL
	jV6esmyrgRnwwe9xkvejsX3tNJjNtLk1n+gTx0j+dC8fk6yLCS2Crrp8MlkpYfiu4qd5Lqu+yiYyG
	hLnKz8mJFC49p4lOIG7HNwA1Hb8zygeTSYS+FRREi/KxKva4o5oyT07OwoaEhUpQekJrh6mJ9FktD
	2qqHSxWcK9cd3BZRFVawRIFN0T8VeadkqEGFHjXduDrdERndJRD+fYBJajsVmYtwjzmgQvIkeXw4G
	goFdRr/nlGpa5IT0n1phte6ZBmbvKJi0EFRAwRxDKKAys3s5aChO0ij6EHMj9DMT55uIDVmAE9bWk
	hZmBw2h8pXHJIKHliXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNC-00000008rQv-0eP6;
	Fri, 15 May 2026 16:26:50 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN9-00000008rJ2-1kSa
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862408; x=1810398408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rmo72hvT7oVdD8KLIA0ACavIj7twlGv7h7oHGIOnbQE=;
  b=KqBFQuWbQobDW8rvstpIaBEZc4j3m9BmN3owmPB1gYx/SIbAR6ShtRQr
   H4hANPgW2Qkg5FLEIZ4BIiFNpITCgwXqH8TvO38IP6COGRaK6RM20F3wJ
   zLhBpMbbXtzSXfRJRcEE2XCK6eFwH3dni2mC7XVQL/kax6EvRBz1ARhg6
   vhWlN0YPJ2MALs2xbWFFYC2yV5+q6rah48zsKhc6kwbaqm/9JyScVXjKz
   2Py3XvzLfTBlY/sAE68Y/kzbKzmPou0SDL2gTwqS9ccLRs/NaxOU/oHS2
   aBoMAqXyEMkD7TUwHW/LBNRgWSqoEe767sEbTSIXKkoxGE5IWH2FWC5N4
   w==;
X-CSE-ConnectionGUID: FUDr9YjRSC+AP3iHxR5gKQ==
X-CSE-MsgGUID: 1xnszBSCTCizrUdo4hbkUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785257"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785257"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:48 -0700
X-CSE-ConnectionGUID: HmCIGNQ1QUORZf5EOLj3eA==
X-CSE-MsgGUID: O41tTOXuRninxzeWxc6ErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857207"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:46 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 07/17] i3c: mipi-i3c-hci: Complete transfer lists immediately on error
Date: Fri, 15 May 2026 19:26:11 +0300
Message-ID: <20260515162621.57719-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092647_500171_EC8EC3D5 
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	None

Changes in V2:

	Renamed completing_xfer to final_xfer


 drivers/i3c/master/mipi-i3c-hci/dma.c | 6 ++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index de0f17706ac8..83b553e1ab0b 100644
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
