Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0730CD343F
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 15:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R9IPrw/xxXZi2bKaZcSuiemHbw6jNtZmHSFkl92Klkc=; b=q/DNw/qIuY77I3
	J/CcwujPi1/CzN3W09T3lEWb9VnzULCBAUaSLmdDj2a4ZK2/MNCZQDwVIiAFMoFuQ1LZU1O+t9Yqx
	J3SNZ1SxRX+fUbL0XsGvEGa31Y9Sa3MQ6OcsREg2aRUmBFDvbT2p9qfo7Rqb6m1xH5PGD6gHuZk21
	iUfm1UwXIZ0PtdfZkc9FI4dVaVhSGE6n0Kx9cqfWIcHii0EcDTtJadrRKyWSAd96P5029FMP54W71
	qXyyyLabpyZ8PGvdI8dudGcRL4IZq6EjqVLbiF2y7QlFXCzbkGIjZ0L0bM6emAzULH03tVw1DtGEv
	d97Y/HAvggBEFpxpq0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuug-00000008o7U-2XlU;
	Fri, 15 May 2026 15:57:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuue-00000008o72-1zxc
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 15:57:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso3923386a91.3
        for <linux-i3c@lists.infradead.org>; Fri, 15 May 2026 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778860639; x=1779465439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yX0chCqXf0mQpC8vWLQku9y3n8pCGrDqgza1e2QxHwo=;
        b=FngqoukxJcJldaloWQK6IjOiNfubIxpg4gEoG6utO9hyLsLkQ1yO9FiGS0hCc2Ky8g
         gD8hdnjfFqnI3o7lVV/U3scq88Hf6Mu5iG6vxf8HE07YMD358sCNrrUm1YI0wVn8OfE7
         BS1M+/uc5J/LTX8DKai5GFBX85wD6J2YYZFrR8+v283Np7wbg5gv7WlS5nctMORyPJQu
         4uqWuen41yIzqRQzIgiDtG29bsbAwaxfioZuDBtkGw4Mb1oPJC9elN6axjfCmNj9rP0f
         dRMw+t67wAKyirRcFFX4Lq2PrCFjmGMGVFbHdR8zwscCUcrXaokgBe1cHMr0ZL8fK9sQ
         8c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860639; x=1779465439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX0chCqXf0mQpC8vWLQku9y3n8pCGrDqgza1e2QxHwo=;
        b=SPPSHp4UtGaLt1JurotiERCvOMYHcDv8YGw2ir++Cib+EbyF+6xkDwsq/rd92ZYZXj
         HoUzZxwdeC9rAh0rmZnTHyidb8LmizcdDVLcZN/0QIxeZWbEMyEeW9782XHbWoYDfjfw
         AKPy13C4hi2iW0skJAG5No9NKlmy/wlSlxRKgLU8xEAtkO74i5kR7xa38k96OVekopAc
         d+5JFtqk4xeQA6tUzX1uzBzQWffi+SJTmQGRVPNsJEqdc8E3bJOTA11wU3zyxbHOL9wY
         MN7XjD4Nvb8eHtvj2aL0w+jg8/BIuNsA1JlNnildXaUJVillW9U5vVYNOoQG7WrdDkga
         gJUw==
X-Forwarded-Encrypted: i=1; AFNElJ/Po7J18YMGD3tsj4RuqUxZWygR//P0jheD24nv/PaviyvAWYrWM/DwaBtmyd2xLH4WiPVy4laNQ5E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1LDq7yXD9gUclcjoTghGMJt9CuJIg9S2OoOEOQO08H4tJuyPy
	mo3ISQFU8fZUSMNYzG8NBFuAEIxopmIqZjc92WnaNp46mJuZDqDLaoXA
X-Gm-Gg: Acq92OGCkUBM1RFl/+dkVOXKHliFaW/06SheoRkv/ub9XAyBBOszry6YnPxWwSEOkMU
	vf9lX+Yuy89vG7iFx8QYDDBdt0HLWlxzPexuRWlExVA9phGFgoonG2nxBmFAkoIYpA/rkM8RZyB
	NP7FHiQ566pNK8jzfMIsJdL9ppm0RZT9xG+mq2cu19QkXbWr+CjnCSABloKZNw8+RQq18Ts/htG
	TNID+5PZ1r/+rpQC2rJ++DtM6gWiF8jcV8INi2su15/XVpSxolIpMQxHpvOAF2AGerFAyuSE/hi
	0FD1ooq677Ta6/lTTVmOHtZey802T8qpgiNg0EVmd38CO2XArJyRq2WA4SAy68x8XMGpnoFlZsq
	vo8PYHvCjQ4IYFOStCcJqzzp6NQYS4t/YOcAYipfXqUu3eIULm0OmmSCsqz5Cw0K8Wi9QokZcUy
	VppLUZ4fJKVsMYSr6hwewdbN/NHE0xh36IMoSEsauBM0WEXSEd2ujH5w==
X-Received: by 2002:a17:90b:5348:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36951733ddcmr4642211a91.0.1778860639055;
        Fri, 15 May 2026 08:57:19 -0700 (PDT)
Received: from ZC-202510311500 ([117.22.251.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3696e550dfcsm75221a91.1.2026.05.15.08.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:57:18 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [RFC PATCH] i3c: dw: add DMA support for data transfers
Date: Fri, 15 May 2026 23:56:35 +0800
Message-ID: <20260515155638.1840-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_085720_530667_2396A2EE 
X-CRM114-Status: GOOD (  30.85  )
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

Add DMA support for the DesignWare I3C master controller to
accelerate data transfers.

The driver now requests tx and rx DMA channels during probe and
uses them for data transfers of 4 bytes or more. Transfers smaller
than 4 bytes, or transfers where DMA setup fails, fall back to PIO
mode. DMA tail bytes (non-4-byte-aligned remainder) are handled
with PIO as well.

DMA transfers may sleep, so the xferqueue spinlock is temporarily
dropped for DMA operations. This is safe because xferqueue.cur is
only changed when a transfer completes, and the calling context
serializes simultaneous transfers.

The DMA enable bit (DEV_CTRL_DMA_EN, BIT(28)) is set when DMA is
used and cleared otherwise, to ensure the hardware uses the correct
data transfer path.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
This is an RFC patch to gather feedback on the overall approach before
a formal submission. A few specific questions for reviewers:

1. DMA threshold: The current implementation uses DMA for transfers
   >= 4 bytes, with tail bytes handled by PIO. Is 4 bytes a reasonable
   threshold, or should we consider a higher value (e.g. 16 or 32) to
   avoid DMA setup overhead for very small transfers?

2. Spinlock safety: dw_i3c_master_start_xfer_locked() and
   dw_i3c_master_end_xfer_locked() temporarily drop xferqueue.lock
   around DMA operations. The analysis is that xferqueue.cur is only
   modified on transfer completion, and the caller serializes
   simultaneous transfers. Is this safe, or should we restructure the
   locking (e.g., convert to mutex)?

3. DMA channel handling: dw_i3c_dma_request() is called during probe
   and silently degrades to PIO if DMA channels are unavailable. Is
   this the right behavior, or should probe fail on DMA errors other
   than -ENODEV/-EPROBE_DEFER?

4. Error handling for DMA timeouts: when a DMA timeout occurs,
   dmaengine_terminate_all() is called but the transfer proceeds as if
   it were successful, potentially reading stale data. Should we instead
   signal an error to the I3C core?

5. IBI path: dw_i3c_master_read_ibi_fifo() still uses PIO. Should
   IBI reads also use DMA, or is the IBI payload typically small enough
   that PIO is preferred?

Any other feedback on the design or implementation is welcome.

 drivers/i3c/master/dw-i3c-master.c | 260 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h |  17 ++
 2 files changed, 270 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..7b6c8681ff0c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -13,6 +13,7 @@
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/iopoll.h>
 #include <linux/list.h>
@@ -24,6 +25,10 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include <linux/dma-direction.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+
 #include "../internals.h"
 #include "dw-i3c-master.h"
 
@@ -32,6 +37,7 @@
 #define DEV_CTRL_RESUME			BIT(30)
 #define DEV_CTRL_HOT_JOIN_NACK		BIT(8)
 #define DEV_CTRL_I2C_SLAVE_PRESENT	BIT(7)
+#define DEV_CTRL_DMA_EN			BIT(28)
 
 #define DEVICE_ADDR			0x4
 #define DEV_ADDR_DYNAMIC_ADDR_VALID	BIT(31)
@@ -359,16 +365,123 @@ static int dw_i3c_master_get_free_pos(struct dw_i3c_master *master)
 	return ffs(master->free_pos) - 1;
 }
 
+static void dw_i3c_dma_callback(void *arg)
+{
+	struct dw_i3c_dma *dma = arg;
+
+	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
+			 dma->dma_len, dma->dma_data_dir);
+	complete(&dma->complete);
+}
+
+static int dw_i3c_master_dma_xfer(struct dw_i3c_dma *dma, const u8 *bytes)
+{
+	struct device *chan_dev = dma->chan_using->device->dev;
+	struct dma_async_tx_descriptor *txdesc;
+
+	dma->dma_buf = dma_map_single(chan_dev, (void *)bytes, dma->dma_len,
+				      dma->dma_data_dir);
+	if (dma_mapping_error(chan_dev, dma->dma_buf))
+		return -EINVAL;
+
+	txdesc = dmaengine_prep_slave_single(dma->chan_using, dma->dma_buf,
+					     dma->dma_len, dma->dma_transfer_dir,
+					     DMA_PREP_INTERRUPT);
+	if (!txdesc) {
+		dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
+				 dma->dma_data_dir);
+		return -ENOMEM;
+	}
+
+	reinit_completion(&dma->complete);
+	txdesc->callback = dw_i3c_dma_callback;
+	txdesc->callback_param = dma;
+	if (dma_submit_error(dmaengine_submit(txdesc))) {
+		dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
+				 dma->dma_data_dir);
+		return -EIO;
+	}
+
+	dma_async_issue_pending(dma->chan_using);
+	return 0;
+}
+
 static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
 				     const u8 *bytes, int nbytes)
 {
-	i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
+	struct dw_i3c_dma *dma = master->dma;
+	unsigned long time_left;
+	int ret;
+
+	if (!master->use_dma || nbytes < 4) {
+		i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
+		return;
+	}
+
+	dma->chan_using = dma->chan_tx;
+	dma->dma_transfer_dir = DMA_MEM_TO_DEV;
+	dma->dma_data_dir = DMA_TO_DEVICE;
+	dma->dma_len = ALIGN_DOWN(nbytes, 4);
+
+	ret = dw_i3c_master_dma_xfer(dma, bytes);
+	if (ret) {
+		dev_err(&master->base.dev, "DMA TX setup failed (%d)\n", ret);
+		i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
+		return;
+	}
+
+	time_left = wait_for_completion_timeout(&dma->complete,
+						XFER_TIMEOUT);
+	if (!time_left) {
+		dmaengine_terminate_all(dma->chan_using);
+		dev_err(&master->base.dev, "DMA TX timeout\n");
+	}
+
+	if (nbytes & 3) {
+		u32 tmp = 0;
+
+		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
+		writesl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
+	}
 }
 
 static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
 				       u8 *bytes, int nbytes)
 {
-	i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
+	struct dw_i3c_dma *dma = master->dma;
+	unsigned long time_left;
+	int ret;
+
+	if (!master->use_dma || nbytes < 4) {
+		i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
+		return;
+	}
+
+	dma->chan_using = dma->chan_rx;
+	dma->dma_transfer_dir = DMA_DEV_TO_MEM;
+	dma->dma_data_dir = DMA_FROM_DEVICE;
+	dma->dma_len = ALIGN_DOWN(nbytes, 4);
+
+	ret = dw_i3c_master_dma_xfer(dma, bytes);
+	if (ret) {
+		dev_err(&master->base.dev, "DMA RX setup failed (%d)\n", ret);
+		i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
+		return;
+	}
+
+	time_left = wait_for_completion_timeout(&dma->complete,
+						XFER_TIMEOUT);
+	if (!time_left) {
+		dmaengine_terminate_all(dma->chan_using);
+		dev_err(&master->base.dev, "DMA RX timeout\n");
+	}
+
+	if (nbytes & 3) {
+		u32 tmp;
+
+		readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
+		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
+	}
 }
 
 static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
@@ -403,14 +516,29 @@ static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
 	struct dw_i3c_xfer *xfer = master->xferqueue.cur;
 	unsigned int i;
 	u32 thld_ctrl;
+	u32 dev_ctrl;
 
 	if (!xfer)
 		return;
 
-	for (i = 0; i < xfer->ncmds; i++) {
-		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
-
-		dw_i3c_master_wr_tx_fifo(master, cmd->tx_buf, cmd->tx_len);
+	/*
+	 * DMA transfers may sleep, so we must drop the spinlock while
+	 * writing the TX FIFO. The xferqueue lock is held by our caller;
+	 * xferqueue.cur is safe because:
+	 * - New xfers are only added to the list (not cur) when cur is set.
+	 * - Timeout-based dequeue is blocked until the caller calls
+	 *   wait_for_completion_timeout(), which happens after we return.
+	 */
+	if (master->use_dma) {
+		spin_unlock(&master->xferqueue.lock);
+		for (i = 0; i < xfer->ncmds; i++)
+			dw_i3c_master_wr_tx_fifo(master, xfer->cmds[i].tx_buf,
+						 xfer->cmds[i].tx_len);
+		spin_lock(&master->xferqueue.lock);
+	} else {
+		for (i = 0; i < xfer->ncmds; i++)
+			dw_i3c_master_wr_tx_fifo(master, xfer->cmds[i].tx_buf,
+						 xfer->cmds[i].tx_len);
 	}
 
 	thld_ctrl = readl(master->regs + QUEUE_THLD_CTRL);
@@ -418,6 +546,13 @@ static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
 	thld_ctrl |= QUEUE_THLD_CTRL_RESP_BUF(xfer->ncmds);
 	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
 
+	dev_ctrl = readl(master->regs + DEVICE_CTRL);
+	if (master->use_dma)
+		dev_ctrl |= DEV_CTRL_DMA_EN;
+	else
+		dev_ctrl &= ~DEV_CTRL_DMA_EN;
+	writel(dev_ctrl, master->regs + DEVICE_CTRL);
+
 	for (i = 0; i < xfer->ncmds; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
@@ -486,9 +621,17 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 		cmd = &xfer->cmds[RESPONSE_PORT_TID(resp)];
 		cmd->rx_len = RESPONSE_PORT_DATA_LEN(resp);
 		cmd->error = RESPONSE_PORT_ERR_STATUS(resp);
-		if (cmd->rx_len && !cmd->error)
+		if (cmd->rx_len && !cmd->error) {
+			/*
+			 * DMA RX may sleep; drop the lock temporarily.
+			 * Safe because xferqueue.cur is not changed
+			 * by other paths while a transfer is in flight.
+			 */
+			spin_unlock(&master->xferqueue.lock);
 			dw_i3c_master_read_rx_fifo(master, cmd->rx_buf,
 						   cmd->rx_len);
+			spin_lock(&master->xferqueue.lock);
+		}
 	}
 
 	for (i = 0; i < nresp; i++) {
@@ -1582,6 +1725,107 @@ static void dw_i3c_hj_work(struct work_struct *work)
 	i3c_master_do_daa(&master->base);
 }
 
+static void dw_i3c_dma_free(struct dw_i3c_master *master)
+{
+	struct dw_i3c_dma *dma = master->dma;
+
+	if (!dma)
+		return;
+
+	if (dma->chan_tx) {
+		dma_release_channel(dma->chan_tx);
+		dma->chan_tx = NULL;
+	}
+	if (dma->chan_rx) {
+		dma_release_channel(dma->chan_rx);
+		dma->chan_rx = NULL;
+	}
+	dma->chan_using = NULL;
+	master->dma = NULL;
+	master->use_dma = false;
+}
+
+static void dw_i3c_dma_request(struct platform_device *pdev)
+{
+	struct dw_i3c_dma *dma;
+	struct dma_slave_config dma_sconfig;
+	struct dw_i3c_master *master;
+	struct resource *res;
+	dma_addr_t phy_addr;
+	int ret;
+
+	master = platform_get_drvdata(pdev);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return;
+	phy_addr = res->start;
+
+	dma = devm_kzalloc(&pdev->dev, sizeof(*dma), GFP_KERNEL);
+	if (!dma)
+		return;
+
+	dma->chan_tx = dma_request_chan(&pdev->dev, "tx");
+	if (IS_ERR(dma->chan_tx)) {
+		ret = PTR_ERR(dma->chan_tx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"can't request DMA tx channel (%d)\n", ret);
+		goto fail;
+	}
+
+	memset(&dma_sconfig, 0, sizeof(dma_sconfig));
+	dma_sconfig.dst_addr = phy_addr + RX_TX_DATA_PORT;
+	dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	dma_sconfig.dst_maxburst = 1;
+	dma_sconfig.direction = DMA_MEM_TO_DEV;
+	ret = dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"can't configure DMA tx channel (%d)\n", ret);
+		goto fail_tx;
+	}
+
+	dma->chan_rx = dma_request_chan(&pdev->dev, "rx");
+	if (IS_ERR(dma->chan_rx)) {
+		ret = PTR_ERR(dma->chan_rx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"can't request DMA rx channel (%d)\n", ret);
+		goto fail_tx;
+	}
+
+	memset(&dma_sconfig, 0, sizeof(dma_sconfig));
+	dma_sconfig.src_addr = phy_addr + RX_TX_DATA_PORT;
+	dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	dma_sconfig.src_maxburst = 1;
+	dma_sconfig.direction = DMA_DEV_TO_MEM;
+	ret = dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"can't configure DMA rx channel (%d)\n", ret);
+		goto fail_rx;
+	}
+
+	init_completion(&dma->complete);
+	master->dma = dma;
+	master->use_dma = true;
+
+	dev_info(&pdev->dev, "using %s (tx) and %s (rx) for DMA transfers\n",
+		 dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
+
+	return;
+
+fail_rx:
+	dma_release_channel(dma->chan_rx);
+	dma->chan_rx = NULL;
+fail_tx:
+	dma_release_channel(dma->chan_tx);
+	dma->chan_tx = NULL;
+fail:
+	devm_kfree(&pdev->dev, dma);
+}
+
 int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
@@ -1627,6 +1871,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		goto err_assert_rst;
 
 	platform_set_drvdata(pdev, master);
+	dw_i3c_dma_request(pdev);
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, RPM_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1683,6 +1928,7 @@ EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
 void dw_i3c_common_remove(struct dw_i3c_master *master)
 {
 	cancel_work_sync(&master->hj_work);
+	dw_i3c_dma_free(master);
 	i3c_master_unregister(&master->base);
 
 	/* Balance pm_runtime_get_noresume() from probe() */
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..633b7abdfaae 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -6,12 +6,27 @@
  */
 
 #include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/i3c/master.h>
 #include <linux/reset.h>
 #include <linux/types.h>
 
 #define DW_I3C_MAX_DEVS 32
 
+struct dw_i3c_dma {
+	struct dma_chan *chan_tx;
+	struct dma_chan *chan_rx;
+	struct dma_chan *chan_using;
+	dma_addr_t	dma_buf;
+	unsigned int dma_len;
+	enum dma_transfer_direction dma_transfer_dir;
+	enum dma_data_direction dma_data_dir;
+	struct completion	complete;
+};
+
 struct dw_i3c_master_caps {
 	u8 cmdfifodepth;
 	u8 datafifodepth;
@@ -70,6 +85,8 @@ struct dw_i3c_master {
 	const struct dw_i3c_platform_ops *platform_ops;
 
 	struct work_struct hj_work;
+	bool use_dma;
+	struct dw_i3c_dma *dma;
 };
 
 struct dw_i3c_platform_ops {
-- 
2.17.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
