Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388B606A33A
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 03:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sr/8Q5C5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nu1NG6hdL6n0cV3TwrArS/wyEM1MJl10m7NtkQjUNKI=; b=sr/8Q5C5XljWM3N08EVlepjHlM
	zIlx9RQkXCPNQNIIQJpMV9djsqKuV1oEymaL27LuzVu+x/8poJgRoyJCdkC/zgi1i6jmk8PR5SUGh
	PkadT9hs03cBx1Mk3NiypcZfUJV6Jihi1f2EE9sRsX0L6/o4u9oa5Uw7JJnZzeyqXkwMPYBpc0jYa
	YJDIr+S9Foxv0lmV9ApAkf/Fu3baypZDbbzpayx2dtpNR6HLbrLvftHzinLBmqf8UqCX4ggYIy4Kb
	OqGrBhsCM7C4sTDvzPZ4I5xJYFN9Q699kan9jrGgz0oaVNEh+E72Lw87uSk+8WhocNUABrXJtBG2H
	/N1giwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypf-00000005WbG-0C2k;
	Wed, 11 Nov 2026 03:17:07 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypb-00000005WER-0kxw;
	Wed, 11 Nov 2026 03:17:04 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:32 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:32 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 11 Nov 2026 11:16:36 +0800
Subject: [PATCH v2 8/9] i3c: mipi-i3c-hci: Improve AST2700 PIO TX queue
 utilization
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-8-4d8fff5c5196@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=5992;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=PnUI0aMUfWomkFnXNrj/l47pexR/eLZ4/01b0YThnl0=;
 b=IC2QMoBS4HhTkUdyZfh73t5mJWN2P2/C2HES5gXTsxZFnXkH93e/0NnxY7hm5jp2FjM5z82BO
 CNEEfODeEb4D0D3LTAFcyCyAgQPjGVOAP0xSAyHVzRnwb7ULgJanuEI
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_191703_248287_ED96A7AC 
X-CRM114-Status: GOOD (  16.71  )
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

The PIO TX path only pushes data once STAT_TX_THLD reports that
tx_thresh_size words are free, with the threshold set to half the TX
FIFO. The FIFO is therefore never filled beyond half from a single
wait, which under-utilizes the queue, and sending buffers larger than
the threshold makes software race against the hardware draining the
FIFO, resulting in an unstable flow.

The AST2700 vendor block exposes the TX FIFO read and write pointers,
which give the exact number of free entries. When HCI_QUIRK_VENDOR_TX_AVAIL
is set, size each burst from those pointers, using CIRC_SPACE() to
derive the free-entry count, so the FIFO can be used up to its full
depth. Other controllers keep the existing threshold-based flow.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/aspeed.c | 11 +++++++++++
 drivers/i3c/master/mipi-i3c-hci/aspeed.h |  6 ++++++
 drivers/i3c/master/mipi-i3c-hci/core.c   |  3 ++-
 drivers/i3c/master/mipi-i3c-hci/pio.c    | 25 +++++++++++++++++++++----
 4 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/aspeed.c b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
index 4a73e0180a10..8f2a00a940f7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/aspeed.c
+++ b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/circ_buf.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/i3c/master.h>
@@ -156,6 +157,16 @@ void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len
 			 FIELD_PREP(ASPEED_I3C_IBI_TERMINATE_LEN, ibi_max_len));
 }
 
+/* Free TX FIFO entries derived from the vendor FIFO read/write pointers */
+unsigned int aspeed_i3c_avail_tx_entries(struct i3c_hci *hci)
+{
+	u32 ptr = aspeed_i3c_read(hci, ASPEED_I3C_QUEUE_PTR0);
+	unsigned int w = FIELD_GET(ASPEED_I3C_QUEUE_PTR0_TX_W, ptr);
+	unsigned int r = FIELD_GET(ASPEED_I3C_QUEUE_PTR0_TX_R, ptr);
+
+	return CIRC_SPACE(w, r, ASPEED_I3C_TX_QUEUE_ENTRIES);
+}
+
 static void aspeed_i3c_phy_write(struct i3c_hci *hci, u32 reg, u32 val)
 {
 	writel(val, to_aspeed_vendor_data(hci)->phy_regs + reg);
diff --git a/drivers/i3c/master/mipi-i3c-hci/aspeed.h b/drivers/i3c/master/mipi-i3c-hci/aspeed.h
index 7aecce04bba7..e80a0dff0dc9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/aspeed.h
+++ b/drivers/i3c/master/mipi-i3c-hci/aspeed.h
@@ -38,6 +38,7 @@ u32 aspeed_i3c_read(struct i3c_hci *hci, u32 reg);
 void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, u32 val);
 int aspeed_i3c_phy_init(struct i3c_hci *hci);
 void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len);
+unsigned int aspeed_i3c_avail_tx_entries(struct i3c_hci *hci);
 
 #define ASPEED_I3C_CTRL				0x00
 #define ASPEED_I3C_CTRL_CLOCK_STALL_EN		BIT(14)
@@ -54,6 +55,11 @@ void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len
 #define ASPEED_I3C_DAA_INDEX2			0x18
 #define ASPEED_I3C_DAA_INDEX3			0x1c
 
+#define ASPEED_I3C_QUEUE_PTR0			0xd8
+#define   ASPEED_I3C_QUEUE_PTR0_TX_R		GENMASK(24, 20)
+#define   ASPEED_I3C_QUEUE_PTR0_TX_W		GENMASK(16, 12)
+#define ASPEED_I3C_TX_QUEUE_ENTRIES		32
+
 #define ASPEED_I3C_INTR_STATUS			0xe0
 #define ASPEED_I3C_INTR_STATUS_ENABLE		0xe4
 #define ASPEED_I3C_INTR_SIGNAL_ENABLE		0xe8
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 31fab1fe614c..5e7af7717da7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1415,7 +1415,8 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 				  HCI_QUIRK_VENDOR_INTR_SUMMARY |
 				  HCI_QUIRK_VENDOR_RESOURCES |
 				  HCI_QUIRK_VENDOR_DAA_INDEX |
-				  HCI_QUIRK_IBI_PAYLOAD_THLD) },
+				  HCI_QUIRK_IBI_PAYLOAD_THLD |
+				  HCI_QUIRK_VENDOR_TX_AVAIL) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index a95ef7fc351c..b58edff234ea 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -14,6 +14,7 @@
 #include "hci.h"
 #include "cmd.h"
 #include "ibi.h"
+#include "aspeed.h"
 
 /*
  * PIO Access Area
@@ -397,11 +398,23 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
 	p += (xfer->data_len - xfer->data_left) / 4;
 
 	while (xfer->data_left >= 4) {
-		/* bail out if FIFO free space is below set threshold */
-		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+		unsigned int avail = pio->tx_thresh_size;
+
+		if (hci->quirks & HCI_QUIRK_VENDOR_TX_AVAIL) {
+			/*
+			 * The vendor FIFO pointers give the exact free space,
+			 * allowing better TX FIFO utilization than the
+			 * threshold status.
+			 */
+			avail = aspeed_i3c_avail_tx_entries(hci);
+			if (!avail)
+				return false;
+		} else if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD)) {
+			/* bail out if FIFO free space is below set threshold */
 			return false;
+		}
 		/* we can fill up to that TX threshold */
-		nr_words = min(xfer->data_left / 4, pio->tx_thresh_size);
+		nr_words = min(xfer->data_left / 4, avail);
 		/* push data into the FIFO */
 		xfer->data_left -= nr_words * 4;
 		dev_dbg(&hci->master.dev, "now %d left %d",
@@ -418,8 +431,12 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
 		 * also get some bytes past the actual buffer but no one
 		 * should care as they won't be sent out.
 		 */
-		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+		if (hci->quirks & HCI_QUIRK_VENDOR_TX_AVAIL) {
+			if (!aspeed_i3c_avail_tx_entries(hci))
+				return false;
+		} else if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD)) {
 			return false;
+		}
 		dev_dbg(&hci->master.dev, "trailing %d", xfer->data_left);
 		pio_reg_write(XFER_DATA_PORT, *p);
 		xfer->data_left = 0;

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
