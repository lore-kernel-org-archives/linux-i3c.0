Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A0ACD6E55
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeIrHXngaJBfCWVBGbriYrzYufOOkXjjy1hyuUG0S/g=; b=CR5GRX6gddRz/g
	naZKXHBSYizODXcqEiwXL6zXmedYr7SqltQOrAJzDo/HkFimEwaXgnUeEdc1bl9rLqsUSNyuESVqd
	iPlUk8yW4yoASzLeSl+VWkoXWh99IRsoqpLX/GWRo7W0P2tNTSMmJb+KzurI/sWxziEMOUhORd8M3
	TBNOb097g+W2oaQosxiRqePVFtRf50OZ8opgQCvf4Z3L2XIKCoPwGpQLRRM/4nx7smlpEi+ApSqVd
	KjuNd/qVvsx4v0+2h50To8AhuVu5v/LfYJUcmCy7SeE9dfjTqh25/rErnKVBY1VzG9KMZEObxWG6M
	O6s5Yb5H+W1tI6rqZpyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaY-0000000Efwi-0wLA;
	Wed, 03 Jun 2026 09:08:38 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaW-0000000Effy-1mJr
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477716; x=1812013716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a+HV4otQQnfg70YbgVKjl7GYJ2TmpuPTytvG8ieMQus=;
  b=ielolpUP6p7bS8bk+hOhszBlQAqTwGq3DRq8GT7hhzf/6z6hCEEpQHBQ
   zVgsteBlz5rodFrhzZigwodu067ikK1uczEJqs3/cNj4FU/HgWyHNzKSi
   KrtYPe0pTfHTVMzhnGdiEjwLf1rYD+5sq+ewVFkDujaTVy2znDYLI8L9e
   8iP4jnN1PL5tDvPdLBeGA45hlgBZ9dvAEAzf/TKccT0slZH78askXQj4m
   6vRdiLOKP2+1z8Z2Su8nd8bro/10jz4Hd5+IIhDdXUFlU6pxXPS5sEOs8
   wOLbYxyM8uwSdDNxqloYlFecIzxKiY/ma8sdZy7KI9gn6jLXQc3BX7du2
   Q==;
X-CSE-ConnectionGUID: 17bFpc34RX2J4MtLa7JvaQ==
X-CSE-MsgGUID: IDGY9vSOSRaeMDoCwtXsoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852664"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852664"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:36 -0700
X-CSE-ConnectionGUID: 2uX7maMRRc2TvsSTeqiFbA==
X-CSE-MsgGUID: SOYuEsqKTqW7clNLPw/qpA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:34 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 14/17] i3c: mipi-i3c-hci: Wait for NoOp commands to complete
Date: Wed,  3 Jun 2026 12:07:51 +0300
Message-ID: <20260603090754.16252-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020836_480618_4E2FCAC2 
X-CRM114-Status: GOOD (  13.66  )
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

When a transfer list is only partially completed due to an error,
hci_dma_dequeue_xfer() overwrites the remaining DMA ring entries with
NoOp commands and restarts the ring to flush them out.

While NoOp commands are expected to complete successfully, they may still
fail to complete if the DMA ring is stuck.  Explicitly wait for the NoOp
commands to finish, and trigger controller recovery if they do not
complete or report an error.

This ensures that partially completed transfer lists are reliably
resolved and that a stuck ring is recovered promptly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	None

Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	None

Changes in V2:

	Rename completing_xfer to final_xfer
	Add missing reinit_completion()


 drivers/i3c/master/mipi-i3c-hci/dma.c | 39 ++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index f39a6ce2aad5..0fd56bbb84ef 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -686,11 +686,33 @@ static void hci_dma_recovery(struct i3c_hci *hci)
 	dev_err(&hci->master.dev, "Recovery %s\n", ret ? "failed!" : "done");
 }
 
+static bool hci_dma_wait_for_noop(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n,
+				  int noop_pos)
+{
+	struct completion *done = xfer_list->final_xfer->completion;
+	bool timeout = !wait_for_completion_timeout(done, HZ);
+	u32 error = timeout;
+
+	for (int i = noop_pos; i < n && !error; i++)
+		error = RESP_STATUS(xfer_list[i].response);
+
+	if (!error)
+		return true;
+
+	if (timeout)
+		dev_err(&hci->master.dev, "NoOp timeout error\n");
+	else
+		dev_err(&hci->master.dev, "NoOp error %u\n", error);
+
+	return false;
+}
+
 static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 				 struct hci_xfer *xfer_list, int n)
 {
 	struct hci_rings_data *rings = hci->io_data;
 	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
+	int noop_pos = -1;
 	unsigned int i;
 	bool did_unqueue = false;
 	u32 ring_status;
@@ -698,7 +720,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	guard(mutex)(&hci->control_mutex);
 
 	spin_lock_irq(&hci->lock);
-
+restart:
 	ring_status = rh_reg_read(RING_STATUS);
 	if (ring_status & RING_STATUS_RUNNING) {
 		/*
@@ -757,11 +779,10 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 				*ring_data++ = 0;
 			}
 
-			/* disassociate this xfer struct */
-			rh->src_xfers[idx] = NULL;
-
-			/* and unmap it */
-			hci_dma_unmap_xfer(hci, xfer, 1);
+			if (noop_pos < 0) {
+				reinit_completion(xfer->final_xfer->completion);
+				noop_pos = i;
+			}
 
 			did_unqueue = true;
 		}
@@ -793,6 +814,12 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	wait_for_completion_timeout(&rh->op_done, HZ);
 
+	if (did_unqueue && !hci_dma_wait_for_noop(hci, xfer_list, n, noop_pos)) {
+		spin_lock_irq(&hci->lock);
+		hci->recovery_needed = true;
+		goto restart;
+	}
+
 	return did_unqueue;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
