Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF3AC5CFC1
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Aug 2026 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5u/hyhQqKoUpuWW/DkzknBb5DdZggO86qwN32W1g7E=; b=EnrvLFw4DRHLaq
	xdOUVD3hBgB8Kpliqkw6bRaw7WuoghBw27YLyQZ7thGsYgNWVdpQtxsflc4ndyB9QfTPo3Vwbfk3m
	Uz1J7mu71nN6owU49PY5ZCQfiwWDM1hrvM3rb0e/+SlEbwWBrjCW88O7UnaUTmsDmEmWs0llYvUs8
	RROUNgvHiBi2auO4VNzyKOy0zf1LVks8ZoohuHcKR27oqqzrw3wQn/AyQbHoLCiUeq9YDgkh7AYgd
	uk1dG0glqPhaiYFLGGr/z13CI+KGNcVGPuvpP5yt8fGanFEraItE5CLl4I7dtMsDMXr0uAxogX2MN
	Z2z8kdO0et+h8itBpLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsgp-00000005gqv-1mn2;
	Mon, 17 Aug 2026 08:27:27 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsgn-00000005gqK-2jM7
	for linux-i3c@lists.infradead.org;
	Mon, 17 Aug 2026 08:27:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2997875a91.2
        for <linux-i3c@lists.infradead.org>; Mon, 17 Aug 2026 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786955245; x=1787560045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Figj4/rD5er/rUVtgFlGDnLbnfbqd4trDHkkzalIkc=;
        b=Sz38b2JTb6JCSwZHVL8atOph3GrTJjIXc5PYWQwmlTbdGB4xmku2go2YgtFf8sQLtb
         /rk1F2brG87dPAB+uNkKrxz6nnLdubfzI3K+ERNqL3MQStHqgALza7ym9RAFSvOiEOzf
         XqBVUtO5A5UybUEpgwQxwCuyTgrYT8wTR0dLyaNT+Wm0XfN+d4O6K8xtlHGETqdrtb6v
         yGZt8erywyfgNe9uoOThEX2ycKPt2uMNSVuub009QyQVSsplX8l919Bv+Tuf+SLl5LU3
         kpkZNrnGEsPYSqsBy6KKDibBdkWkLzQChO8KAr8pgyx6VA+PNPs9VHDu2TYncFvNsSQa
         8KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786955245; x=1787560045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Figj4/rD5er/rUVtgFlGDnLbnfbqd4trDHkkzalIkc=;
        b=Ca4bruY7PYXe5TMXxWIdOUhHpvKlMNYeQo7/ssHCVEk+mNFUlHJqrQlcgzxqQJfesq
         yzRwbh36AsgdEEbfIs6gKXSMfw/Xz0pIgZnetZsWOd5nurziPfLvOQkq+GcMaufRXoEq
         jRt4zSiHpRPvU9QUz92MY+T0M6qxS56edY9WEqbuFSwQv+AbZqSFMRn8TSr2bJ3E/DWj
         DEWbj+VNpyo3u59Hb78fAMvlzFw66ohlWJuPwiV41a8sjcg5dAq4poCvMe2Yh654G/4Z
         N7ZMZyrouBqW9YSpRG5JA4sEUGMNmdLAAV8dRyzXpOm7MVop/35DB1hwBdxGpGxUS9Jw
         MmXA==
X-Forwarded-Encrypted: i=1; AHgh+RqnNCSGdCVKU55JAPj2NAOMZ+9EcXjQ2HgUj9cP99TT5GdKaefgEBeSutkyWlmYyOhAfNdWpSMAdmU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUWGP+R0BVsimEY8mw9nDS11PXW2ZREZhDYQAbbh2EIxamo20H
	fblun9jLBLGRou3r1oaDL6rJsxjK5hDJBuEdPuI5Gn/cCR0KgvU4wzc4
X-Gm-Gg: AR+sD13QZJ64qiuEQAle+cRGG++riNj6AeH9xgUn4+6pGvvU7tdrB77biOuvVCsb+OP
	7O4de0V2EERmiJiPgETf/0JeikjXYNqQmKq6lMqj6TPbPCxW2al6ySxIn0VRszpYgoc1dY/SR0J
	s952PkztTkN0qGm3xRgWVS0XPqXOFrOPwZrClroYPOWbVfWzZHD6n+1fKPC7YkAiGAGqLHdRx8A
	Ee1WDXWICjgIP+Q1Pk7WJ2kg0zFWVSnqiPowYrPQ9xX5Ox3KEyOfojB0vPZ5ivzWQx5aOJ+X6Kz
	wNCm1/pNn+y+T2AxpgRv1IP46l01oYkDKVBd6Bep7Pgx6eKeaXA4gOqjDJFguT/zEojvW80pKiU
	kPIPsKqpZWWnYvURtXWRdjOGRJqKSP+KiEXHjU4+2meL+DeL/3WVmpdhdgOsVvM1/Dm8+4/UvVr
	b/XLs3vSYNfzy7QFf3uBJRP2TSO8+TzvEn2bEZBmBbD0D1uq58q0xBqDZXrW2y97SHcP4gk7hYA
	Z4T6VUNAgsySs8BrvR7HBux6oC5EUfHpvsuE4YCnUinyJLbh59xqX2HXTck5z+x1Wk5UEq8IlA6
	eciKe5gUatL2vhmuew==
X-Received: by 2002:a17:90b:4f8b:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-3933bcc78a9mr23421572a91.19.1786955244596;
        Mon, 17 Aug 2026 01:27:24 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e15c-4d9e-e270-183b-5fe6-6f07.emome-ip6.hinet.net. [2001:b400:e15c:4d9e:e270:183b:5fe6:6f07])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b8080sm1393379a91.4.2026.08.17.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:27:24 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	boris.brezillon@collabora.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw
Subject: [PATCH v3 2/3] i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
Date: Mon, 17 Aug 2026 16:26:46 +0800
Message-ID: <20260817082647.612471-3-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
References: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012725_717913_588967FA 
X-CRM114-Status: GOOD (  15.62  )
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


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
