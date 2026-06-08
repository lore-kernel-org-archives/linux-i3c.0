Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB13CCD8CA8
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQkNQdiyYxusjSwPCn5t0UrmUw8dMoKRK48QZeHInoY=; b=Wv9XhVcpw387Eo
	h1zHkLK64iFSeuZ35ffSdxxS0azvm4PSaKO8ClSQorlJUtVDP2dtFNXXXSS4vQzc9OnEt5BZzDQoA
	ZlKSkCaaJsC8NhUgQivVhQUf5sh/bnXsMcMV2vk9QxSPwtml9CZpH25z7qA21KIESGcY7K9F++JA2
	71YtsoB/cu383aDXXOz4LvArBSrK5Q53vBiKbm26Z6btPF3/FoefCMH9K7upc41oIXYDKKqs3RNJA
	7StiVBOtH8PSMzjL1iC8LVcai2EDdP4RbGAy+jlwU95u70KVFT8+xEH3W1SeFGFUE4l7nkuj+dRT+
	/QVLSyHdjU+E37siV8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgO4-00000004LYO-24Yq;
	Mon, 08 Jun 2026 20:15:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgO3-00000004LY3-3J37
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:15:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AE04443E4;
	Mon,  8 Jun 2026 20:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97391F00898;
	Mon,  8 Jun 2026 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949755;
	bh=jbpCIZZMa6WvgXcR1iGqmxLZxC/rvMaJ2IzN6io74mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ThjEOtZxaTklOCwM4A2QvgXo1t//GF1p51Vz8W26Z9D8FmEn+ieQhlWjfVLMmdjTA
	 yQdRMOsnbpU2pDXYVLnqg0GsyE5z40qBsb18WY+hfd/ot3l8+b4sPCto1wZl5LKbKf
	 kCpLNhGhHbfKCLKW+IrYjTxFxoRCJuYEjeVyk1OnZcXyax052SqEIwZ7lAiVa1S7No
	 N6F69q8WMOK1kIX7TOe/YNf9vKS4olzTmccHUca0vPvmCtX6GNeUbZAa6JE4gS28Ib
	 XbVN2+0xPtYKXQHx/ssCriOwwU6kQBnQjGIlbvIPDGM7uhGWtf6hjFpaRJE/rLnKB+
	 NU/CH4HD/mX+Q==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 01/17] i3c: renesas: Check that the transfer is valid before accessing it
Date: Mon,  8 Jun 2026 23:15:27 +0300
Message-ID: <20260608201543.804902-2-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas I3C driver uses an asynchronous model to transfer data. It
prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
The interrupt handler dequeues the transfer, updates/uses it, and signals
the waiting thread.

If the completion times out, the waiting thread dequeues the transfer and
free it. If an interrupt fires after that, the handler may access freed
memory, leading to crashes.

Check that the transfer is still valid before accessing it in the
interrupt handler. Along with it, clear any status flag to avoid
triggering the same interrupts again.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- clean the IRQ status bits before returning IRQ_HANDLED and adjusted the
  patch description to reflect this change
- collected Frank's tag. Frank, please let me know if you consider
  I should drop your tag. Thanks!


 drivers/i3c/master/renesas-i3c.c | 44 +++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f39c449922ca..6e7ece2e0b4e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1014,6 +1014,12 @@ static irqreturn_t renesas_i3c_tx_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			/* Clear the Transmit Buffer Empty status flag. */
+			renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1053,11 +1059,18 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
 	int ret = 0;
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
+		/* Clear the Respone Queue Full status flag */
+		renesas_clear_bit(i3c->regs, NTST, NTST_RSPQFF);
+
 		xfer = i3c->xferqueue.cur;
-		cmd = xfer->cmds;
+		if (!xfer) {
+			/* Clear any error flags. */
+			renesas_clear_bit(i3c->regs, BCTL, BCTL_ABT);
+			renesas_clear_bit(i3c->regs, NTST, NTST_TEF | NTST_TABTF);
+			return IRQ_HANDLED;
+		}
 
-		/* Clear the Respone Queue Full status flag*/
-		renesas_clear_bit(i3c->regs, NTST, NTST_RSPQFF);
+		cmd = xfer->cmds;
 
 		data_len = NRSPQP_DATA_LEN(resp_descriptor);
 
@@ -1138,6 +1151,12 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			/* Clear any status flag. */
+			renesas_clear_bit(i3c->regs, BST, BST_NACKDF | BST_TENDF);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1184,6 +1203,14 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			/* Clear any status registers. */
+			renesas_clear_bit(i3c->regs, BST, BST_SPCNDDF);
+			/* Clear the Read Buffer Full status flag. */
+			renesas_clear_bit(i3c->regs, NTST, NTST_RDBFF0);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
@@ -1235,6 +1262,11 @@ static irqreturn_t renesas_i3c_stop_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			/* Clear the RX/TX Data Buffer Full status flag. */
+			renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0);
+			return IRQ_HANDLED;
+		}
 
 		/* read back registers to confirm writes have fully propagated */
 		renesas_writel(i3c->regs, BST, 0);
@@ -1259,6 +1291,12 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
 
 	scoped_guard(spinlock, &i3c->xferqueue.lock) {
 		xfer = i3c->xferqueue.cur;
+		if (!xfer) {
+			/* Clear any status registers. */
+			renesas_clear_bit(i3c->regs, BST, BST_STCNDDF);
+			return IRQ_HANDLED;
+		}
+
 		cmd = xfer->cmds;
 
 		if (xfer->is_i2c_xfer) {
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
