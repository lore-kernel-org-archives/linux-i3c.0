Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54161061B37
	for <linux-i3c@archiver.kernel.org>; Tue, 31 Mar 2026 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RqcNDFceMFnDAqbfRyDmyMNgu0vDR+ebCOTPDbj4tS4=; b=tC+hlD8Ke1Al7B
	OxtBig/3JwFH/Co7RXXkkwrm+yiNkct4EgEr2UU2ow2BEP8Ki7SYiI/zMrgLySBn/JBVj4Xo6vigX
	56QhuL9JPoUXxrig25eS7Z+BWVk5DV1xhFj/eb5/eBnWOZW3VM0sqwClkmMDj+BdI9BLocTWz/QsE
	Qb3jKzmmBHfvrmFV6KyK/kSbkzsVfR2+FN3gOy+p9wH+NFzfbWmABGhV3iA4Oz+Utu5fgdiEl6Vl+
	GguQfApXkPJpg2/nLaKRJQmP6v9SVx32jJFE8i+rkoCsFppS0InTJ3UI/MKEAXS5YgALq0uZNIEFF
	Sbnn22oY8tebQ9AC0GHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XxY-0000000Cv8b-29E3;
	Tue, 31 Mar 2026 12:12:40 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XxU-0000000Cv7q-2llw
	for linux-i3c@lists.infradead.org;
	Tue, 31 Mar 2026 12:12:38 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 31 Mar
 2026 20:12:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 31 Mar 2026 20:12:29 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 31 Mar 2026 20:12:23 +0800
Subject: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
MIME-Version: 1.0
Message-ID: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIACa6y2kC/x3MSQqAMAxA0atI1gZS64RXERclRg2OtCBC8e4Wl
 2/xf4QgXiVAl0XwcmvQ80gweQa8uGMW1DEZCipqstagWsaFFcfd4Xbyiq4hcqYkbssKUnZ5mfT
 5l/3wvh/2fLkKYgAAAA==
X-Change-ID: 20260331-i3c-hci-dma-lock-a700a140c845
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Nicolas Pitre <npitre@baylibre.com>, Boris Brezillon
	<boris.brezillon@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Billy
 Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774959149; l=3526;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=zXraJM4rpO14mz7DUQbRXxLT+rMD+bP7LNhl1brNqWo=;
 b=wjuA4WSwCZqv8JAsbxYjpEqyHR1FkkSzQCDMBoeSDMEHU45qNt6ZxWONH6n3NOeDC2dFHpvOy
 UNWYAkkyOahCiQ33LgAOSBe3S8s6zM7tNHeXAk+RfeQd057j70Ip8LF
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_051236_706899_1AA53B57 
X-CRM114-Status: GOOD (  11.78  )
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

The RING_OPERATION1 register contains multiple bitfields (enqueue,
software dequeue, and IBI dequeue pointers) that are updated from
different contexts. Because these updates are performed via
read-modify-write sequences, concurrent access from process and IRQ
contexts can lead to lost updates.

Example:
CPU 0 (hci_dma_queue_xfer): reads RING_OPERATION1 (enq=5, deq=2)
CPU 1 (hci_dma_xfer_done): reads RING_OPERATION1 (enq=5, deq=2)
CPU 0: updates enq to 6, writes back (enq=6, deq=2)
CPU 1: updates deq to 3, writes back (enq=5, deq=3) <--Pointer 6 is LOST!

Fix this by wrapping all accesses to RING_OPERATION1 and associated
ring state variables (xfer_space, done_ptr, ibi_chunk_ptr) in the unified
hci->lock. This ensures that the read-modify-write sequence is atomic
across enqueue, dequeue, and completion paths.

Specifically:
- Add hci->lock protection to hci_dma_xfer_done() and
hci_dma_process_ibi().
- Ensure hci_dma_queue_xfer() and hci_dma_dequeue_xfer() use the unified
  lock consistently.
- Ensure the software-maintained ring pointers are synchronized with
  the hardware pointer updates.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index e487ef52f6b4..3d967157411e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -617,10 +617,12 @@ static int hci_dma_handle_error(struct i3c_hci *hci, struct hci_xfer *xfer_list,
 static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 {
 	u32 op1_val, op2_val, resp, *ring_resp;
-	unsigned int tid, done_ptr = rh->done_ptr;
+	unsigned int tid, done_ptr;
 	unsigned int done_cnt = 0;
 	struct hci_xfer *xfer;
 
+	spin_lock(&hci->lock);
+	done_ptr = rh->done_ptr;
 	for (;;) {
 		op2_val = rh_reg_read(RING_OPERATION2);
 		if (done_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val))
@@ -659,6 +661,7 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
 	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
 	rh_reg_write(RING_OPERATION1, op1_val);
+	spin_unlock(&hci->lock);
 }
 
 static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
@@ -716,6 +719,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 	void *ring_ibi_data;
 	dma_addr_t ring_ibi_data_dma;
 
+	spin_lock(&hci->lock);
 	op1_val = rh_reg_read(RING_OPERATION1);
 	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, op1_val);
 
@@ -767,6 +771,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 		dev_dbg(&hci->master.dev,
 			"no LAST_STATUS available (e=%d d=%d)",
 			enq_ptr, deq_ptr);
+		spin_unlock(&hci->lock);
 		return;
 	}
 	deq_ptr = last_ptr + 1;
@@ -849,6 +854,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
 
 	/* and tell the hardware about freed chunks */
 	rh_reg_write(CHUNK_CONTROL, rh_reg_read(CHUNK_CONTROL) + ibi_chunks);
+	spin_unlock(&hci->lock);
 }
 
 static bool hci_dma_irq_handler(struct i3c_hci *hci)

---
base-commit: f311a05784634febd299f03476b80f3f18489767
change-id: 20260331-i3c-hci-dma-lock-a700a140c845

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
