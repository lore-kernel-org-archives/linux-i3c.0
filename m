Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547E606A334
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LTcYWCAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XuhxGEY7EvXILdHUa7Vg/I5pf+vPPJmJr2gpoCyH+ZY=; b=LTcYWCANkMjHXeZLt6mQtjzRyO
	XfcMrw0WLr7CQPV5igftpdzJuhebwyaxVMqwBy+Km0rglfV4r2bc+5Xgdsk2yS8kApky8qOfh9Z4A
	QekrFDfDV3HeTOBym4a2Z7Jr9Zu+0KX63wtr2mkGtu/cU9tiygep0gHIZtL+RSR23xHPSEKp+yI/5
	k+DDvK7R6ZaaSs9Ypv2gsRrDOyNPLpKk0yt0A+tyVIF48UbVCLESNoN5WzYMSmrjBoEQ+lKzzHlZs
	N7VAyGZz/F1F8HU2fGQOmY8hAxBK1gj1kTWkMzoY0EFZwq+uI5/OsguRKGEbBqxhXIar4sQLT75OO
	YcNpYdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypZ-00000005WS8-3FVR;
	Wed, 11 Nov 2026 03:17:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypU-00000005WER-1RFi;
	Wed, 11 Nov 2026 03:16:57 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:32 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:32 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 11 Nov 2026 11:16:33 +0800
Subject: [PATCH v2 5/9] i3c: mipi-i3c-hci: Add a quirk to clear the TX
 start threshold
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-5-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=3959;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=TT6DVgROupJj3o1NofDpSO7UhBTyX4AHTZoi/iJQSlA=;
 b=Ai9LkrYBBUliNFI6XRcHiqNjuuOuxzu0ReD+CeYTqZcZPRadOkfpPA5WVlazABTdEQH5uCIOe
 95HgtWJm3REBMstuKUB5zKwf2uRcfR46y43Sggk/6MS3afRxcrd3rRu
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_191656_396494_A0990688 
X-CRM114-Status: GOOD (  16.73  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DATA_TX_START_THLD field of the PIO data buffer threshold register
holds off the start of a TX transfer until the FIFO holds a set amount
of data, which in PIO mode cuts down on the number of software writes.
The field resets to 0x1, requiring at least (2 ^ 2) DWORDs (16 bytes)
in the FIFO before transmission starts.

HCI controllers that support both PIO and DMA can expose the two as
separate register blocks; nothing in the specification says selecting
DMA mode disables the PIO block's own gating logic. On ASPEED
platforms it doesn't: DATA_TX_START_THLD still holds up transfer
start regardless of which mode feeds the FIFO, and in DMA mode that
threshold is never satisfied for some transfer sizes:

 - 1-4 bytes: uses the Immediate Data Transfer Command.
 - 13+ bytes: since the hardware fetches data in 4-byte chunks, a
   13-byte transfer fetches 16 bytes into the FIFO and reaches the
   threshold.
 - 5-12 bytes: the threshold is never reached and the transfer stalls.

Add HCI_QUIRK_TX_START_THLD to clear the field whenever DMA mode is
selected. The clear lives in i3c_hci_set_io_mode() rather than in
probe so the reset-and-restore recovery path also reapplies it after
a controller soft reset.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 2 ++
 drivers/i3c/master/mipi-i3c-hci/pio.c  | 7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 25d0aba6b300..da77384e985c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -884,6 +884,14 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
 	else
 		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
 
+	/*
+	 * On the ASPEED AST2700 the TX start threshold gates transfer start
+	 * even in DMA mode. Clear it so DMA transfers are not held back
+	 * waiting for a PIO FIFO level that will never be reached.
+	 */
+	if (dma && (hci->quirks & HCI_QUIRK_TX_START_THLD) && hci->PIO_regs)
+		mipi_i3c_hci_pio_clr_tx_start_thld(hci);
+
 	if (!is_version_1_1_or_newer(hci))
 		return 0;
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 18a28360c728..3f28f821bf0d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -180,12 +180,14 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
 #define HCI_QUIRK_DAT_INDEX_IS_ADDR	BIT(10)  /* DAT entries are indexed by device address */
 #define HCI_QUIRK_DMA_64BIT		BIT(11)  /* Controller DMA supports 64-bit addressing */
+#define HCI_QUIRK_TX_START_THLD		BIT(12)  /* Clear TX start threshold in DMA mode */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
 void mipi_i3c_hci_abort(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
 void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
+void mipi_i3c_hci_pio_clr_tx_start_thld(struct i3c_hci *hci);
 void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
 void amd_set_od_pp_timing(struct i3c_hci *hci);
 void amd_set_resp_buf_thld(struct i3c_hci *hci);
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 439578a6eb54..a95ef7fc351c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -118,6 +118,13 @@
 					 STAT_LATENCY_ERRORS | \
 					 STAT_PROG_ERRORS)
 
+void mipi_i3c_hci_pio_clr_tx_start_thld(struct i3c_hci *hci)
+{
+	u32 val = pio_reg_read(DATA_BUFFER_THLD_CTRL);
+
+	pio_reg_write(DATA_BUFFER_THLD_CTRL, val & ~DATA_TX_START_THLD);
+}
+
 struct hci_pio_dev_ibi_data {
 	struct i3c_generic_ibi_pool *pool;
 	unsigned int max_len;

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
