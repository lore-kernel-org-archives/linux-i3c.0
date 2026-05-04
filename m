Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1CECD3430
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbyKI+XVU5xoIqKgUWI3RNXp24JoAJ0tTDQZ7+vC9MQ=; b=tt3u79KxDBzyqv
	/HWyUMxdZJPHApEMBdeH2MP3nEMdO3RaeogCIM5PmrLDwKE6D3bNkjgKins3lzzpuLEltHH9n71UV
	RIYG2E6fH9CooXEUWskGaTjlJtpYwKBLB1L86qYwItPJjar+1kRJ2KjqZFUeeXNDa+3ekBAkCR7fm
	U7PHOIvouxl7gF6LntdXRxZ+xcaclOW0LIHyanUbCfUR88M5DBimrkASO3LH+aB3xEff/ISZnrXgz
	OKx2Bb74AmdMHJTjty9hOFel3ol8JZW4eIkFcql4h7gsuPB5hgIeEaIkFuEqSAgtyKDZ3g47sGbPr
	eXChD3gZAKtxxt7219eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ3-0000000D3Np-3gK1;
	Mon, 04 May 2026 11:34:17 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ1-0000000D3HH-3jnd
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894456; x=1809430456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ziNVxdUbaASwghi8AIhL9hLaXeTgfUuYFZaqap0QkWg=;
  b=Hop2bztSH/NwbqDEPEUfYaRzgiKB7nOcS+IgFFohrBwDvzZ3Hk1zotIl
   lTkxOlg7Yxbpndb98JsxiDacstclcmo+yvE3uKd5xSR6j/LRGB1BSICIx
   mC08p1rm2l2/+5ePhrcc6bkUwRWM1mEsvobFDzKU4rcsFe3v+qhwSRPna
   S3rwoe4vkszxoCVKW4t2gg4dB69QTkNFhkmZ3P63Db8mKjmuaoBBY2Qmf
   /dMqpvRzC9iMWbhUlvoKyHuFNUjL5LpkRHFE7HE8/I2bzKRNauJwoM1AI
   hxvTwRg6Xa6gmahQYwuwVNrwfRK3BuIrxhXrfCI0KfoxP29qwijAjuOsJ
   A==;
X-CSE-ConnectionGUID: K65myZrERyuuEMhELR7X/w==
X-CSE-MsgGUID: Tr74GsTHS1uIktN4QFlOVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315173"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:16 -0700
X-CSE-ConnectionGUID: w0vSKyivQFiKopr4EXu1PA==
X-CSE-MsgGUID: W2aXWlvIRcCmruNiEujnoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478249"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:14 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 07/16] i3c: mipi-i3c-hci: Complete transfer lists immediately on error
Date: Mon,  4 May 2026 14:33:43 +0300
Message-ID: <20260504113352.38490-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043415_940765_28F2DA18 
X-CRM114-Status: GOOD (  12.34  )
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


Changes in V3:

	None

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
