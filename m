Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C18C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2rOO6cF5agrGhSoL5xc4viav8Uzibub6yeH3C9RIsI=; b=u7fT2Fp6QLVd54
	Cy00to90J4cUrdHtXIAfMqG6ywX9zbOoSDll0FUAvkuh0djjuY8E+uLjzp+L6UvCHXMiAEpXhGqyD
	ANXZ5LGUnnz7oyE9e+WPT/HH9vnYTFhUVMkiNJd+8zqWWfBifzzmGeBWKTsYen2MnXSMIHYa9s6OF
	re2AWqOw4XykboP4x1y5E5vssyaoQjXd4rZlosf79yqRSu1gV93PufVLGl+tKhauU2lpW30eRZ3NX
	hdtP6PYBLjJaG22u4f7vfXG6z7YdE7/u6i8sgDGwLuMN43N0Cs7E9FByWoK9+uQJyjwr13v9YZ9F6
	z0Xrfbnq+W/+ibejXCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj2X-00000001G6z-03xZ;
	Thu, 09 Jul 2026 07:19:21 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj2T-00000001G64-2q4D
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 07:19:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1213854a91.2
        for <linux-i3c@lists.infradead.org>; Thu, 09 Jul 2026 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581557; x=1784186357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgJ3kKKbI9YQsgQrGMbA0/Gs7guYaA5biXVV2qvMzok=;
        b=KHMHNFSKkMvlwY1sCAdOnqXg2+AoPCFtphYflLs6+BgxuRilDNCqaItp1f0aajrKi8
         GGc6gP6VBzqVQvwLAwC22WU4uMQ9JhOYYmFb81LZF/1n0CU+Bou4mN7O81eqHLBcBD+M
         a/j3h/W5myMlFwJqtskGEE+uWbGFz2qRyDhNYJOA243wBI0huft3Wire8VOk7sA5HuzC
         PK8jUhUjuB2hoANKv++691kxnC1Lx4DiPuEyGMCuiS/wu28oErj7KmCp7AjREVrAtWVU
         lM+NEQ1O3mmtZUsNKcIljV0TwZqqGvhQul5bar4xQaoFhOcHxdlweojBtdTVIEdtE42l
         +q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581557; x=1784186357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgJ3kKKbI9YQsgQrGMbA0/Gs7guYaA5biXVV2qvMzok=;
        b=AUngA8y00RikUvcMT0tyfpDG6T5aiz093fIA8NAzbulVoNVLf2fPIjttxoPpjXi47w
         SsZ6zfI33u8xO/HvimTpJkrJdzehKJL9/GVoMg0GRN4IT0QO7J4zHEOOQHcmNuRvYXT6
         R0wcVVd5E9XBXdO9FABkoyrvPCyil+v36UFLVYMB7rFuio5lE6KlIrDAjpQJgaVg8Ndh
         yme+Qb+qFur75hjBKq+ZzOJ8wpt0fCPVOhpku3Pp01PAPrdpt05dJv2s4gy/jkAxN+cN
         6WdS65VpFvA0TTI1HKW7tH2HUymhXZurlG2sF6AV5SAN1UzOh0czG2wGiHY/zaVFb1+1
         3Tiw==
X-Forwarded-Encrypted: i=1; AHgh+RrfM4FeNoJpm/bugIWDysK9C+Am+WFH+LoMFd0ghptanx5KCA7EB7250iT2FBo07QW0jX+g5d2V0rY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBO+fUhy4mvKvvoN/7kBZqiTaJXUgTDide+WC89sUl+gHyPrph
	j/b4FLpqhJ7pygbb94KhqqkMxmo6DLTIhm+vxMuJgD0GmlwgzsqifNTu
X-Gm-Gg: AfdE7ckut7KPtLKxSr4MOKgnj5XO6+pe9oV4d6gt3iGdOS3JcjvRZ3YVxsgd6rVa6LQ
	zrmsPTSq81USoEjQ72mWQiLBe5SOGdil4IVIrhQZ5SamcdkUw6glE0tsa9fysFPSuAB5rupVU4U
	j7Gsha+7/PoEpD5ZsA4vFMrZnG02jhvdTa41jmPSrYwRZBqlaYhxxEo+XP3gw79HyV+CJen4MVr
	RlgJYHtYxWMZU8Kk5wayOwq85y0hNvUk7a37wmm8qdCLTjsL5oc3LJuvbYUgnlslsfm8VV/hzJB
	TxrJa4r9JAeKrRawRChoUQwxI3jjkjq1zenNFRJhCEClZ5SRlf89glqim8Q1d8Q6cxrayFINZer
	kkIJ23fL2T20RuNQlB7JrcrFEu6T4JdSf4nj46o3TCnsd+SHupPatnYxEBDN+UtqVRO2NpPBOAm
	lfO35Y14WzuJT14uc9lIv+l76cTU7Ddi45FRgTwGL7ZISffEHUjCSP8h0813Sb8dTYSrrum+qpB
	buWjS0fWlZNXqMg15fUy4X3ZFEIzlEmnR8fp7K2BciVKQ==
X-Received: by 2002:a17:90b:554e:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3893fe5d587mr6638805a91.14.1783581556787;
        Thu, 09 Jul 2026 00:19:16 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e11d-51b8-fc5d-5f39-cd11-ce64.emome-ip6.hinet.net. [2001:b400:e11d:51b8:fc5d:5f39:cd11:ce64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm697456a91.1.2026.07.09.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:19:15 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: [PATCH 2/3] i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
Date: Thu,  9 Jul 2026 15:17:43 +0800
Message-ID: <20260709071744.333403-3-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_001917_724271_18C73878 
X-CRM114-Status: GOOD (  14.49  )
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

- Support explicit enablement and starting of PIO queues as
  required by HCI v1.2.
- Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
- Implement explicit PIO queue stopping/disabling and restart
  logic after errors.

Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
---
 drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
 drivers/i3c/master/mipi-i3c-hci/pio.c  | 72 ++++++++++++++++++++++----
 2 files changed, 63 insertions(+), 10 deletions(-)

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
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 7870b2c7888f..c05fb3666378 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -45,6 +45,11 @@
 #define IBI_STATUS_SIZE			GENMASK(15, 8)
 #define CR_QUEUE_SIZE			GENMASK(7, 0)
 
+#define PIO_ALT_QUEUE_SIZE      0x1C
+#define EXT_IBI_QUEUE_EN        BIT(28)
+#define ALT_RESP_QUEUE_EN       BIT(24)
+#define ALT_RESP_QUEUE_SIZE     GENMASK(7, 0)
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
@@ -138,11 +148,44 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 {
 	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
 	struct hci_pio_data *pio = hci->io_data;
+	u32 cmd_sz, resp_sz;
 
 	size_val = pio_reg_read(QUEUE_SIZE);
 	if (size_val_ptr)
 		*size_val_ptr = size_val;
 
+	cmd_sz = FIELD_GET(CR_QUEUE_SIZE, size_val);
+	resp_sz = cmd_sz;
+	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
+
+	/* MIPI I3C HCI v1.2 requires explicitly enabling and starting PIO queues
+	 * and supports alternate queue sizes.
+	 */
+	if (hci->version_major == 1 && hci->version_minor >= 2) {
+		u32 ctl_val = pio_reg_read(CONTROL);
+		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
+
+		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
+			ctl_val |= PIO_CONTROL_ENABLE;
+			pio_reg_write(CONTROL, ctl_val);
+		}
+		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
+
+		/* Adjust actual FIFO sizes based on v1.2 ALT_QUEUE_SIZE */
+		if (alt_val & ALT_RESP_QUEUE_EN)
+			resp_sz = FIELD_GET(ALT_RESP_QUEUE_SIZE, alt_val);
+		if (alt_val & EXT_IBI_QUEUE_EN)
+			ibi_val *= 8;
+	}
+
+	dev_dbg(&hci->master.dev, "CMD FIFO = %u, RESP FIFO = %u entries\n",
+		cmd_sz, resp_sz);
+	dev_dbg(&hci->master.dev, "IBI FIFO = %u bytes\n", 4 * ibi_val);
+	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
+		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
+	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
+		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
+
 	/*
 	 * Let's initialize data thresholds to half of the actual FIFO size.
 	 * The start thresholds aren't used (set to 0) as the FIFO is always
@@ -172,7 +215,7 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	 * or one available response or IBI. For IBI data let's use half the
 	 * IBI queue size within allowed bounds.
 	 */
-	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
+
 	pio->max_ibi_thresh = clamp_val(ibi_val/2, 1, 63);
 	val = FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
 	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
@@ -219,15 +262,6 @@ static int hci_pio_init(struct i3c_hci *hci)
 
 	__hci_pio_init(hci, &size_val);
 
-	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
-		FIELD_GET(CR_QUEUE_SIZE, size_val));
-	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
-		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
-	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
-		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
-	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
-		4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
-
 	return 0;
 }
 
@@ -246,6 +280,12 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 		BUG_ON(pio->curr_rx);
 		BUG_ON(pio->curr_tx);
 		BUG_ON(pio->curr_resp);
+		/* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
+		if (hci->version_major == 1 && hci->version_minor >= 2)
+			pio_reg_write(CONTROL, 0x0);
+
+		kfree(pio);
+		hci->io_data = NULL;
 	}
 }
 
@@ -766,6 +806,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
 		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
 	/* then reset the hardware */
 	mipi_i3c_hci_pio_reset(hci);
+
+	/* MIPI I3C HCI v1.2 requires explicitly restarting PIO queues after error/abort */
+	if (hci->version_major == 1 && hci->version_minor >= 2) {
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


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
