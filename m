Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABE1C5DF7D
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AQS8ZujnKDVEozHX9O7k3dLatDphFQrUc95VpRW32w=; b=ggohE+luBwrEfg
	gvONYFMtAmCohvaJgr2ri8eGJCFBP39j4L1PtH0ed3Qxc6FRcjs6IAB4d5GEyB+zPd3XIC/ZT+10q
	2Nfu5v+OwFODO1/5+6PGmGMOByFKZ4OejUrDqr279ZdsSy8Pj1QqBfhmnDAnzmiaeJZQJtBpfcN8z
	zoYgYKcM0+738bcOiKo4mhpo4voV+E6gizv8stIqZaIB4R73MuFBOoLjg0tq0wBa2/dT2l3cAAaao
	+1UxYR5toOTGCb+usMEpgwJRjCbkfJDKikfWJRvBMnUCaWbwcedCdR8XjCOe+xJS+7KvmtLugxnB0
	9EdEUFk28npk/pl1TsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGf-00000007leE-0Gp5;
	Tue, 18 Aug 2026 10:42:05 +0000
Received: from ms.asus.com ([103.10.4.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHGb-00000007lcL-1uEe
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 10:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1787049721; x=1818585721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xb3Z7Iq+rpl8ylrKJF+RAnX6e2yx5po0g1tHxzRDvDg=;
  b=TvGSB8Q2FES6CIweTwW+ZdQxf8S1RgxDBVR4ux/8cSgrV2A/4y4hkcRQ
   QtWg2jrVxxwSWEbuiBONWXoEwNSVvjH2FTBSUxhtgKyl1mZlmcDq5RStm
   FbaBBIXU4omJmme5VYqM1484887xsmEJADhEqVGqVXK3MBD/hxK2GYzin
   c=;
X-CSE-ConnectionGUID: MuubmzRURbWqCczPGDxllg==
X-CSE-MsgGUID: shGbJiuHREepx7iZQtUOZQ==
Received: from unknown (HELO APZA006TMD.corpnet.asus) ([172.22.47.66])
  by ms.asus.com with ESMTP; 18 Aug 2026 18:41:58 +0800
Received: from mymail.asus.com (42.79.21.38) by APZA006TMD.corpnet.asus
 (172.22.47.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 18 Aug
 2026 18:41:55 +0800
From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: <alexandre.belloni@bootlin.com>
CC: <Frank.Li@nxp.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <boris.brezillon@collabora.com>,
	<linux-i3c@lists.infradead.org>, <Jm_Liao@asmedia.com.tw>,
	<Patrick_Yen@asmedia.com.tw>, <Chloe_Chen@asmedia.com.tw>,
	<Yd_Tseng@asmedia.com.tw>
Subject: [PATCH v4 2/3] i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
Date: Tue, 18 Aug 2026 18:41:05 +0800
Message-ID: <20260818104106.763772-3-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
References: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-Originating-IP: [42.79.21.38]
X-ClientProxiedBy: APZA001EXB.corpnet.asus (172.22.6.13) To
 APZA006TMD.corpnet.asus (172.22.47.66)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-AS-Result: No-10--14.081500-8.000000
X-TMASE-MatchedRID: +WRSeMlL01Ix0vOXNHUI69TSGjubFor4Ya9B+ixdAccZ0o/nGo6+ZFzP
	hPhLiWSadBjoMEPmPfjMFg9UULWZ6L3NCeST488JsZIjJc0QK/bVLrJfyVWkTWoFPYQQDhzPPK5
	qeOxNMEqUVkUQf589Z/2SSSZQeAJWrddi2w4fb9BFg2HO5lmNEAeATH6uEs3iygHdGJDPWm/I+i
	U2V/dVVE9mW2T4Pw0+sr66CBhEVecwZSTP8c3RQnvDSw7DFidmXcn+MCmnlIvVRABzI1K6vv9vf
	1NXtdDvZ9Nmu37Zy4AogybAbRksQCkedqpt2pqwJOyPZ8F0fn4rZaUz4ubTvMtRuEMqYcjXZSL4
	AKI4WH5l1yP3wWwNewuzuERWOc8Dx9AuD7Q5+D3BcAkkfZSxiDwmgZuJTXax1dIiPKI/VPtjc99
	KY0Ed8qODSWu0oxbKJP/2DvkXaK9aOxpgjiWHdVV0twgLfg8YizfBJLTC23Ah4WWPHpPFyl1s/l
	JxhUXQbagCZkqxaKxu6XVSYos3Ufpuf98Q4CrZftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.081500-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30140.006
X-TM-SNTS-SMTP: EDB94811B8D2696CA6BA57151E9D81B6DE66301518C11AF62EFF38A6F6D7D3182000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034201_787810_E5F7B6EB 
X-CRM114-Status: GOOD (  14.92  )
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

Support explicit enablement and starting of PIO queues as required by
HCI v1.2.
Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
Implement explicit PIO queue stopping/disabling and restart logic after
errors.

Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
---
v4:
 - No content changes. Resent to fix From:/Signed-off-by: address
   mismatch caused by mail relay configuration (Frank).
v3:
 - No functional code changes.
 - Aligned From: and Signed-off-by: email addresses (Adrian).
v2:
 - Removed '-' prefixes from commit message (Frank).
 - Aligned GENMASK bit definitions with existing macro styles (Frank).
 - Reverted unnecessary dev_dbg line movements (Frank).
 - Removed manual kfree(pio) as pio is devm managed (Frank).
 - Introduced helper macro for HCI version checks (Frank).

 drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  5 ++
 drivers/i3c/master/mipi-i3c-hci/pio.c  | 67 ++++++++++++++++++++++++--
 3 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e80aa1f5722e..dccc974ef15a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1031,6 +1031,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	switch (regval & ~0xf) {
 	case 0x100:	/* version 1.0 */
 	case 0x110:	/* version 1.1 */
+	case 0x120:	/* version 1.2 */
 	case 0x200:	/* version 2.0 */
 		break;
 	default:
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index b3d9803b1968..becccb1a8cf5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -30,6 +30,11 @@
 #define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
 #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
 
+/* helper macro for HCI version check */
+#define hci_version_at_least(hci, maj, min) \
+	((hci)->version_major > (maj) || \
+	((hci)->version_major == (maj) && (hci)->version_minor >= (min)))
+
 struct hci_cmd_ops;
 
 struct dat_words {
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index a1341d66bc65..439578a6eb54 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -45,6 +45,11 @@
 #define IBI_STATUS_SIZE			GENMASK(15, 8)
 #define CR_QUEUE_SIZE			GENMASK(7, 0)
 
+#define PIO_ALT_QUEUE_SIZE		0x1C
+#define EXT_IBI_QUEUE_EN		BIT(28)
+#define ALT_RESP_QUEUE_EN		BIT(24)
+#define ALT_RESP_QUEUE_SIZE		GENMASK(7, 0)
+
 #define PIO_INTR_STATUS			0x20
 #define PIO_INTR_STATUS_ENABLE		0x24
 #define PIO_INTR_SIGNAL_ENABLE		0x28
@@ -72,6 +77,11 @@
 #define STAT_RX_THLD			BIT(1)
 #define STAT_TX_THLD			BIT(0)
 
+#define PIO_CONTROL			0x30
+#define PIO_CONTROL_ABORT		BIT(2)
+#define PIO_CONTROL_RS			BIT(1)
+#define PIO_CONTROL_ENABLE		BIT(0)
+
 #define PIO_QUEUE_CUR_STATUS		0x38
 #define CUR_IBI_Q_LEVEL			GENMASK(28, 20)
 #define CUR_RESP_Q_LEVEL		GENMASK(18, 10)
@@ -173,6 +183,14 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	 * IBI queue size within allowed bounds.
 	 */
 	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
+	/* Adjust actual IBI queue size based on v1.2 ALT_QUEUE_SIZE */
+	if (hci_version_at_least(hci, 1, 2)) {
+		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
+
+		if (alt_val & EXT_IBI_QUEUE_EN)
+			ibi_val *= 8;
+	}
+
 	pio->max_ibi_thresh = clamp_val(ibi_val/2, 1, 63);
 	val = FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
 	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
@@ -190,6 +208,17 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	 * (will be activated on first xfer).
 	 */
 	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
+
+	/* MIPI I3C HCI v1.2 requires explicitly enabling and starting PIO queues */
+	if (hci_version_at_least(hci, 1, 2)) {
+		u32 ctl_val = pio_reg_read(CONTROL);
+
+		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
+			ctl_val |= PIO_CONTROL_ENABLE;
+			pio_reg_write(CONTROL, ctl_val);
+		}
+		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
+	}
 }
 
 static void hci_pio_suspend(struct i3c_hci *hci)
@@ -208,6 +237,7 @@ static int hci_pio_init(struct i3c_hci *hci)
 {
 	struct hci_pio_data *pio;
 	u32 size_val;
+	u32 cmd_sz, resp_sz, ibi_val;
 
 	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
 	if (!pio)
@@ -217,10 +247,24 @@ static int hci_pio_init(struct i3c_hci *hci)
 
 	__hci_pio_init(hci, &size_val);
 
-	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
-		FIELD_GET(CR_QUEUE_SIZE, size_val));
-	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
-		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
+	cmd_sz = FIELD_GET(CR_QUEUE_SIZE, size_val);
+	resp_sz = cmd_sz;
+	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
+
+	/* MIPI I3C HCI v1.2 supports alternate RESP/IBI queue size */
+	if (hci_version_at_least(hci, 1, 2)) {
+		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
+
+		if (alt_val & ALT_RESP_QUEUE_EN)
+			resp_sz = FIELD_GET(ALT_RESP_QUEUE_SIZE, alt_val);
+		if (alt_val & EXT_IBI_QUEUE_EN)
+			ibi_val *= 8;
+	}
+
+	dev_dbg(&hci->master.dev, "CMD FIFO = %u, RESP FIFO = %u entries\n",
+		cmd_sz, resp_sz);
+	dev_dbg(&hci->master.dev, "IBI FIFO = %u bytes\n",
+		4 * ibi_val);
 	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
 		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
 	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
@@ -244,6 +288,9 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 		BUG_ON(pio->curr_rx);
 		BUG_ON(pio->curr_tx);
 		BUG_ON(pio->curr_resp);
+		/* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
+		if (hci_version_at_least(hci, 1, 2))
+			pio_reg_write(CONTROL, 0x0);
 	}
 }
 
@@ -764,6 +811,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
 		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
 	/* then reset the hardware */
 	mipi_i3c_hci_pio_reset(hci);
+
+	/* MIPI I3C HCI v1.2 requires explicitly restarting PIO queues after error/abort */
+	if (hci_version_at_least(hci, 1, 2)) {
+		u32 ctl_val = pio_reg_read(CONTROL);
+
+		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
+			ctl_val |= PIO_CONTROL_ENABLE;
+			pio_reg_write(CONTROL, ctl_val);
+		}
+		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
+	}
+
 	mipi_i3c_hci_resume(hci);
 
 	dev_dbg(&hci->master.dev, "status=%#x/%#x",
-- 
2.43.0

==================================================================================================================
This email and any attachments to it contain confidential information and are intended solely for the use of the individual to whom it 
is addressed.If you are not the intended recipient or receive it accidentally, please immediately notify the sender by e-mail and delete 
the message and any attachments from your computer system, and destroy all hard copies. If any, please be advised that any unauthorized 
disclosure, copying, distribution or any action taken or omitted in reliance on this, is illegal and prohibited. Furthermore, any views 
or opinions expressed are solely those of the author and do not represent those of ASMedia Technology Inc. Thank you for your cooperation.
==================================================================================================================
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
