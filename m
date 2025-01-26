Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7222AC02198
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+dASpYNXxnwBaVrrLsdkQWe/Q/ds09Ht29wsEkbWOQ=; b=oUcRoaGClF/qKV
	aTqAVUJe1qnB99oYzsRt0qO9ZHPZT1urDoIg/0cqTMUA8eHVqB2PpWDsZcZKfAMSlKlQbMrgRDshb
	YyNeCzkA1/pP7DGIw24b81EJmYj2y4PPqsN8gNLQ25lkcOr6c8M8Wv5brjakmGbaxJWV8czuDHtQr
	+DNIeTV/7oWJWCfwQReEo+DD1v+TTN928BfuueSSSqC/tPazgzBMF9e8uzX5l4nP6UmGbKjh5tlSN
	df/c6TfaiQMGRgTmBwjSR2OXg8vqORFkKQRkUtCrcj/QzWqL5ZnWsm5a72UEXrMMJMiaJT02csN6C
	vrb/KYlV4H1ansco0/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElt-00000007lNx-0xeS;
	Wed, 29 Jan 2025 20:34:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc5lq-00000000ITt-47Iu
	for linux-i3c@lists.infradead.org;
	Sun, 26 Jan 2025 16:46:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34A60A40F21;
	Sun, 26 Jan 2025 16:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A488C4CED3;
	Sun, 26 Jan 2025 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909962;
	bh=84YlWhqWBeklgURgMLkHalNNz0F/RWl8SmS9xtQcU6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=en0yo277KzxX3kwF181Y26ieieJmi1g2IKrhxS0sjxglTzYEKu4BVjZbawQlCF8J8
	 WKxvVCCeXwdH7sKU4OWNuHo+xKRI4RSwjypu3B0wTCwPTKQLAkZp3QOFgamAxJIMtR
	 zy4QipJ6apDSnqpDmfpXXmRBkoPV2VGOYTIlKVcztM1J8kVF0X1ykZwglMMtxYywqG
	 JJXpPuc7Pf9gyvLmBXMW7aVxverx0cvg2kfXVHvY7A/HL0VSKiyD/ikM+mVQvg1pqe
	 A/17IVY2+LlMOZCLQebQZm4UkSHrPX7vcLPuL+hflhRz1RUzu8i3tPLmpIb1TiR+ls
	 vJO4N1sv4eQzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 6/7] i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming
Date: Sun, 26 Jan 2025 11:45:48 -0500
Message-Id: <20250126164549.964058-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126164549.964058-1-sashal@kernel.org>
References: <20250126164549.964058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_084603_086912_B8BD77D1 
X-CRM114-Status: GOOD (  12.83  )
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
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

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

[ Upstream commit ccdb2e0e3b00d13df90ac7a0524dd855173f1171 ]

MIPI I3C HCI on Intel hardware requires a quirk where ring needs to stop
and set to run again after resuming the halted controller. This is not
expected from the MIPI I3C HCI specification and is Intel specific.

Add this quirk to generic aborted transfer handling and execute it only
when ring is not in running state after a transfer error and attempted
controller resume. This is the case on Intel hardware.

It is not fully clear to me what is the ring running state in generic
hardware in such case. I would expect if ring is not running, then stop
request is a no-op and run request is either required or does the same
what controller resume would do.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20241231115904.620052-1-jarkko.nikula@linux.intel.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 13adc58400942..fe955703e59b5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -762,9 +762,26 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci, unsigned int mask)
 			complete(&rh->op_done);
 
 		if (status & INTR_TRANSFER_ABORT) {
+			u32 ring_status;
+
 			dev_notice_ratelimited(&hci->master.dev,
 				"ring %d: Transfer Aborted\n", i);
 			mipi_i3c_hci_resume(hci);
+			ring_status = rh_reg_read(RING_STATUS);
+			if (!(ring_status & RING_STATUS_RUNNING) &&
+			    status & INTR_TRANSFER_COMPLETION &&
+			    status & INTR_TRANSFER_ERR) {
+				/*
+				 * Ring stop followed by run is an Intel
+				 * specific required quirk after resuming the
+				 * halted controller. Do it only when the ring
+				 * is not in running state after a transfer
+				 * error.
+				 */
+				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
+							   RING_CTRL_RUN_STOP);
+			}
 		}
 		if (status & INTR_WARN_INS_STOP_MODE)
 			dev_warn_ratelimited(&hci->master.dev,
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
