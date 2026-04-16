Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5D8F8D765
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kglqDs15VU8A4ph0XgW6wFhV4JlLh8tHOIuFN75zM4M=; b=h3c3PIRjhxWTcP
	QLl6pMWUPuw4C6Kw742y9WDAVA2e+pNOb5TuTw8mxbDVAAzXLQhHnEYsSKLJTSBVqIjg8M0MbweUu
	qAM4xSBUCjB8RsFznZ2YYZPk1gY3N7WvBwrXRK+XNiUBCrOYNJTacWydrd5smGBfc0A1BboKt28ke
	QEeoEQmM5bRskH0yZnzBiy2PZ3HJgbWW4xWyq+u1kFZRL/LW/Gwrg528tOwjMVHuXXDRljLCEMLJ6
	Obe9YkhCXWQrxM3ghpVS41sohB2Aqk0IY5LblIGCVhm33jVFXAKe2iEZHbA6Qg+26sKDR0WkC5TIG
	AVYRB74gKhICD9DAFViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxy-00000002jfF-2y78;
	Thu, 16 Apr 2026 17:57:26 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxv-00000002jc2-2I5Q
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362243; x=1807898243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pb+4SFr1d/dH70wamuLCRSduMxdk78xIhXYWmCU7UPc=;
  b=IjQAF+Ro0KF/WHkWPtatKhstQRy9qTMY+mK5yUi5D61rfdjTjRPeIOk8
   oshHcaZPB1JLx9qjWfMu+xP8pK0xPI4hs45Lk0mbrc579snIz4Jd768Eg
   TTDOdzncjhnx2L+wx7x0nYMD7R7EyXmfj5aN9SK49THWYndaLT3T5DHiN
   RGUV2dpeiYwApO/ueJRm5HNN1kWOFoJbaqAdiuofFwweCNtup2qmPX3fe
   OoLwKREdrARhT4lhi5AKAtMInpSEkQkTVn6hVz3ZSKRbac29BuF41tvvc
   mJ0G9OV1+gnHqs+I/bl4oVhKNO1BbyUCh0bWPFNTiy3FKwLTRsIwvZcwJ
   Q==;
X-CSE-ConnectionGUID: d4hTKSk8Sz+bJdaFitzFSw==
X-CSE-MsgGUID: VNgNF5EVSW6Fjz30K+E+bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778370"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:23 -0700
X-CSE-ConnectionGUID: yWsqRJalScq7QldeDGorzQ==
X-CSE-MsgGUID: im98xUr/TeWXLBCEakbfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784521"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:22 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
Date: Thu, 16 Apr 2026 20:56:52 +0300
Message-ID: <20260416175704.41217-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105723_627177_F8C7B10C 
X-CRM114-Status: UNSURE (   9.36  )
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

Although hci_dma_dequeue_xfer() is serialized against itself via
control_mutex, this does not guarantee that a DMA ring restart
triggered by a previous invocation has fully completed.

When the function is called again in rapid succession, the DMA ring may
still be transitioning back to the running state, which may confound or
disrupt further state changes.

Address this by waiting for the DMA ring restart to complete before
continuing.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 314635e6e190..28614fdbf558 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -617,6 +617,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	}
 
 	/* restart the ring */
+	reinit_completion(&rh->op_done);
 	mipi_i3c_hci_resume(hci);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
@@ -625,6 +626,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	spin_unlock_irq(&hci->lock);
 
+	wait_for_completion_timeout(&rh->op_done, HZ);
+
 	return did_unqueue;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
