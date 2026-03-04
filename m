Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B80CEFCE2A
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPUMqzTIRfqAbez09XTuPikV1ICC4SCLCV2MF8TErB8=; b=ObL/G6fQKe8sGf
	3NSuSsW5rioRq6ehiAShPCL2TdHYpofHcN3SbyYFPY1wwalHTO0RwV8IgJT3rIgkUxasEgOEUoLLc
	b6XNhAt6Z0LHbSiXyz4mc2k042P01DXhBfowAfC2MYysuMUm4R4U38iCJ4kKz+HnnybPSK4T8XSgH
	CZmpXkTmisRRHSoFBfWHGxKAMQoD64+1fww5zC/uNt+3bR36a0xmNjc3OxEyqZvxHUnLFErfT6mTr
	/OylfaaYoBrJU9IAPKauixv8VuWn8ONyBrklbmOI7A4DJFyJQCshMb4PphvdX9Wau4Ete97PO6Ysv
	DzgLlgav7zWE7lLUnGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmz-00000000KCF-0s9z;
	Wed, 04 Mar 2026 18:17:41 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmw-00000000K1V-2m7w
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648259; x=1804184259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U3bwXr5T5pPErWsw0ID2SosFK754S+THkCYC4ACKH3w=;
  b=imUOz41+XGORa1wkNVTAACuqLNO17+xZuBIumOCzcUESRXjOJwidx2vS
   ZGbOttk053y0Hukh21tCNyRHUwMPSPw9kWlspc9Afca3NXQgQ/5BWLIpP
   ghn+EO9fXzqvd4xjL+KwyIVjjOtmzezf3qeoyUlsSzZYlmi/hY9KwdGvf
   1Cmzamm6nD3FsYvJw7tm9F4NNDmGOZjfILl6R9QNGCVFQlpuwhPLAf9c5
   h4gEX0gcpR0JnwNCSE17xROpXwHcLbL2F0Fkw9GxO8FKl8F6gdiPoQX4O
   k6RTQTDQU49fD2VMikSpPmqmWyJg8/sRdsX5bj8pVe/e0k04YQS5yLBA1
   w==;
X-CSE-ConnectionGUID: d8Qtgj3JTISKWd/2bLT50Q==
X-CSE-MsgGUID: YV9d02M0QkWidYPk6EdCig==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745930"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:39 -0800
X-CSE-ConnectionGUID: DPUZ3x5ESi+MuohbeXid0w==
X-CSE-MsgGUID: 7qGBUheNQPmhSrx3H2352w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656778"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:37 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 10/14] i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
Date: Wed,  4 Mar 2026 20:17:01 +0200
Message-ID: <20260304181706.143841-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101738_710888_67FDE856 
X-CRM114-Status: UNSURE (   8.37  )
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

The DMA dequeue path attempts to restart the ring after aborting an
in-flight transfer, but the current sequence is incomplete. The controller
must be brought out of the aborted state and the ring control registers
must be programmed in the correct order: first clearing ABORT, then
re-enabling the ring and asserting RUN_STOP to resume operation.

Add the missing controller resume step and update the ring control writes
so that the ring is restarted using the proper sequence.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 239a195df7c7..41b83f07fdab 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -600,7 +600,9 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	}
 
 	/* restart the ring */
+	mipi_i3c_hci_resume(hci);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
 
 	spin_unlock_irq(&hci->lock);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
