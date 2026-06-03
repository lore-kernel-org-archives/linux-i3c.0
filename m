Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C95ECD6E69
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrvUhffL64l0XYWajQvrpQk84yGbF9w1pjczo0fw04Y=; b=UBl+Wnmg/mY3aO
	epWsUHMqNK5QQNOcTGvnQNCV5eEH4uoXMFQ5XB3TL9lI26FjNw9ApG8SkEuviSfI+ymb7jzt73jH0
	PMq/N/MJf786+UwY85YxKCLiTCdDrnG9qfKpSnw8K0bMNZHjKD7lGRiPMOUMvTNQ8mxketvDPI78s
	AepUaxFKdcOzhUmi9TBaq9t8mX3AjKSO5uF0/frOWxSmBaQgvQtRQgbRxfoCGmSJ7sEQraTs6v1mX
	AVzRzkt+hFTBSNKqk25SvcvGgAk/TsqVHOYkFFMJY+/982jME0w02w9IBVeMAwcE3V0pjVDKJ5nrA
	5RIc2912+yTlBTLwOHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaQ-0000000EfrV-4077;
	Wed, 03 Jun 2026 09:08:30 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaP-0000000Effy-1OMH
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477709; x=1812013709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wqsMxiAfOYox2X6r1Ef7yW3f1xoqVnM8R4Hb1do8JT8=;
  b=SzbPWstOqhP6nb8NRBg5V1xUdPRs1Xq9IE2zwcGY/hhdjbex5uxTyVUW
   zets+oClBEbbnaA5VkA7BUOnRLgPb2yfpXtP6EX+D0p1HZrFDYydJnPmf
   tUdmiqeMXX8GF8cG+T+1mRowXN8QNtQbgQH86YHIDt4+dGNz6GCFVDCRa
   gCKi8OgPbE0H0Hdn/cSmDWIXAPAe8AvSR5dKAJoDO16KotYTHaGd7Wxt2
   OZ7YwxvGfbTxYTNkxVaGH3dJrfQ9/6/iwbfwMBQLm9LCNhcwJPR+RcKUB
   e5J0ctXFH2bxhWBHakSBsy0D1S54JvADr0XLwwEpucElodNLiFaUQvjME
   A==;
X-CSE-ConnectionGUID: iCNNAwL3QeqTxt6pDwGa3A==
X-CSE-MsgGUID: we0BlZpzS4mk329JJgsjHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852646"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:29 -0700
X-CSE-ConnectionGUID: EVULlwJ9Smauroet5/UUgw==
X-CSE-MsgGUID: Kt9hRJkmS8OtXx5CNHIrEA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:27 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 10/17] i3c: mipi-i3c-hci: Factor out hci_dma_abort()
Date: Wed,  3 Jun 2026 12:07:47 +0300
Message-ID: <20260603090754.16252-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020829_387054_E89FB927 
X-CRM114-Status: UNSURE (   8.03  )
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

Factor out hci_dma_abort() from hci_dma_dequeue_xfer() in preparation
for further changes.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'ed-by

Changes in V4:

	New patch


 drivers/i3c/master/mipi-i3c-hci/dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 906de7dbfdb5..f2d33068b8df 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -597,6 +597,13 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	rh_reg_write(RING_OPERATION1, op1_val);
 }
 
+static void hci_dma_abort(struct hci_rh_data *rh)
+{
+	reinit_completion(&rh->op_done);
+	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
+	wait_for_completion_timeout(&rh->op_done, HZ);
+}
+
 static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
 {
 	if (hci->enqueue_blocked) {
@@ -623,9 +630,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		hci->enqueue_blocked = true;
 		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
-		reinit_completion(&rh->op_done);
-		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
-		wait_for_completion_timeout(&rh->op_done, HZ);
+		hci_dma_abort(rh);
 		spin_lock_irq(&hci->lock);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
