Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED432C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 09:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MF2bvfTXTLlB7NwCU6+AW88tfkctDtLuUXy87F3FYyw=; b=2z0F19Xl85M3F5
	IenQ6r1QgZmj06EUg/I5A3usRHzf1O3sHkKLxmuSKIilsB2GvOYj7npZ9u3E3SRNd0Hi9pLWBrF20
	upJArJUS29TZBkQhTFigdXF9/bR569D71/lF3cgmYWUaTYVm0fwmRgpD8bSJuyb32Df/SPsQJl2wu
	8TNUnhRK+Xp21VIfIsApUeKajHlHx3uyofw+PVF1xkGqp7RscnqwqOL4YI2XRN+XIsNLeNDWgGLz3
	JDlr9CNi688yhyPp2aXdhW+XMkeA40jbsLzGVtRatX/rf4BZHK39nVBrqBAnXG/EMC3Qiw++W/jv1
	H3Udh3I1WraJyTA4BnwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBZ-00000004q3f-301o;
	Tue, 28 Jul 2026 09:33:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBX-00000004q2y-2bJ8
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 09:33:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3795696a91.2
        for <linux-i3c@lists.infradead.org>; Tue, 28 Jul 2026 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785231195; x=1785835995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSWhSJeE3HXChMdo+avAyHYuoP23DYeDmiVN9+8VC8k=;
        b=dL44zGMWlkRK98fLZG9iQUGjUmLFi72NHKLXcTKoqU8qRS3Y4vQBa4bRiXiLHJpf6z
         AVCVWwy2sdO+2+ASY15/wU+kjV6/zGZX3EBuOlu4gFOOF53qJr8ghV66Q/FFxXbhJNKP
         97hN6rHdWgyQWJaWWivTTkMg/Ovoj3Bg2EZfaSaJf50nzMppRH4bTbPAbcx1p9QloBAW
         HG6J78CE4FvTIl6Y8HU/LNYAibgUd8GRdLoYXq0+eflSEKK4mrB+K1T46zL9MEVnOrL0
         EeS6dCTqZ1GpS+bISK5gdj1MMubfq8vidKMADk2BPV0SuvhSoRLlEpJ3u9LdHZYsbYv2
         gnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231195; x=1785835995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSWhSJeE3HXChMdo+avAyHYuoP23DYeDmiVN9+8VC8k=;
        b=pITmdiD9hBr0UIggV8Bz9qDXER+zN9N+ppPAnd5vwYMAd3c/JH2ePUiq8IMmO/GcKJ
         aqr3DaPLKQG5RPwtun410pz9C+OKMkjr9Z2BeZyaK4y4HUsxSKhNwWkv3lplrf4rw5Mv
         NudFQZNpGGgff1Y9ywl9by7J//mKys3hcjc/C87wO/HskAcbx+Ht33xpX/+Nz8Km4Uu4
         YXQ7XqMLoRhI0GSnKts7rm3YUEJJXkW0JuYg7lW36XxWxUPahyEQddMMM18iTVa0KCLo
         bd0cPEzHeT57Nfi930Qlv/+1lYoy21ctv9g/isnDmtKkm/IUPFhj4ihA2NeD0oWZ4VTd
         +1wQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrYVM42+OABiSWqHgpQzsxN5pJgPZuO+9xMewup2pesFHzM2KUgIpSNmZ/HflZNRQ75eAvZeRF9Dk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+sWFJ/LWzpdjDXisnKMRCcSq27l1wkF3N9X1rwOwXsmih8dPV
	QvnrWzqBxr7KREbY8dcAwFUvSzuRauPge7CgHR28EGDQLzBrainpv1WvUb7GJw==
X-Gm-Gg: AR+sD12GKDwbscYHi2a9Rw1RlnzRN6ckhWfyC0qGmbZouXrtdzoVF8mXDjiJhhuUHwX
	/U9SVOsqYx2/+AD8YE3aZjCRt5z/1AaraW7IpSCG230vGGh4YnkqdyghGZp4xMuvG/tbFQEAquT
	Jkc5quxPdzUL3eUCorjXXsIypFBEBg5ZFomKdDVntQFX8KLHfocZbp55+NNRNW8yaItjFUkKm5s
	7cqepgGXYQdzQ1h5ovnZxUIPXKTHK1GU1LEZJYhmGtouXg5Cs5IpjO+qQHYnnHihpSIZAZ6wthJ
	9H9HWNUCy5elKuh3qF2joeWMvYwSvHpkf2WzIjh/4oh4uJCt69FX5QEiEPp0bqm9NH7aMdsdewj
	TBCobnDdvL5RQ5392MVB3MQXour2BtNPVm7wuZXMRUaiio536B+lAcKJY+V0s6wGbRKQNWGRHEi
	LcPxkEotShwe+kkIaZ/isR0wpscutGHyIPSdnLZZW4ic9VmCiTLvWyiwWAIF7wYAFdM7yT9PY/P
	dSYsBwC5yP5GALMErX/IJKLNNyuimplAu0=
X-Received: by 2002:a17:90b:5105:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-38f6a44b7bemr1630767a91.12.1785231194479;
        Tue, 28 Jul 2026 02:33:14 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e14e-87ac-83f9-7a00-1613-f224.emome-ip6.hinet.net. [2001:b400:e14e:87ac:83f9:7a00:1613:f224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089e3472sm4592446a91.3.2026.07.28.02.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:33:14 -0700 (PDT)
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
Subject: [PATCH v2 2/3] i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
Date: Tue, 28 Jul 2026 17:32:37 +0800
Message-ID: <20260728093239.487156-3-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023315_670753_78EDF8A6 
X-CRM114-Status: GOOD (  15.89  )
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
v2:
  - Removed '-' prefixes from commit message per maintainer's suggestion.
  - Aligned GENMASK bit definitions with existing macro styles.
  - Reverted unnecessary dev_dbg line movements to keep the diff clean.
  - Removed manual kfree(pio) as pio is managed by devm_kzalloc.
  - Introduced/used helper macro for HCI version checks instead of hardcoding.

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
index 9df114ef0278..43ef05468cc4 100644
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
@@ -192,6 +210,17 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
 	 * IBI routing yet.
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
@@ -210,6 +239,7 @@ static int hci_pio_init(struct i3c_hci *hci)
 {
 	struct hci_pio_data *pio;
 	u32 size_val;
+	u32 cmd_sz, resp_sz, ibi_val;
 
 	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
 	if (!pio)
@@ -219,10 +249,24 @@ static int hci_pio_init(struct i3c_hci *hci)
 
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
@@ -246,6 +290,9 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
 		BUG_ON(pio->curr_rx);
 		BUG_ON(pio->curr_tx);
 		BUG_ON(pio->curr_resp);
+		/* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
+		if (hci_version_at_least(hci, 1, 2))
+			pio_reg_write(CONTROL, 0x0);
 	}
 }
 
@@ -766,6 +813,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
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


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
