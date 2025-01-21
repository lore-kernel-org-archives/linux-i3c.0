Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF63C0218B
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jan 2025 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UaABLmEPI4f+6VqliYxbjkXcgtg/8Fpkh8CBGoVrPs8=; b=qZPYL0k3kIoG87
	RPR1SBVQS7ZK+a8CzrGLVvI7rjUt3cjHwym7iiscPF6SML1U9wJDCzdB+F5ZN4IImpZpSkS1Ujt/e
	6R8xcMtCGEKGKNFhVmRtMmDKLwf3FT2brVgmoW9Tyom7Fgb6DKlGxFMzmP1HiVim3rkpa0PP70Cjg
	eAUu4iPLN8Orl58Czp2BormOkhNPE58CT2rW0dgUchf4jYipbn4HxQPlH2UHhcA28WdcmLAy6VvyJ
	RFlrR9O/xAHXGJKJgmJ8t2gypb6cQb+fhk/3nkFPCxTg4l5E3/MLqU+oI0Am4J/ipBhkcNRklZcoM
	iqy4138pRwGVc1vvu+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taC7D-00000007hl8-2jw2;
	Tue, 21 Jan 2025 11:08:15 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taC79-00000007hk0-08d1
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jan 2025 11:08:15 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 19:07:56 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 19:07:56 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <pgaj@cadence.com>,
	<miquel.raynal@bootlin.com>, <conor.culhane@silvaco.com>,
	<aniketmaurya@google.com>, <billy_tsai@aspeedtech.com>,
	<Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
	<Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] i3c: Remove the const qualifier from i2c_msg pointer in i2c_xfers API
Date: Tue, 21 Jan 2025 19:07:55 +0800
Message-ID: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_030811_071603_94865346 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

The change is necessary to enable the use of the
`i2c_get_dma_safe_msg_buf()` API, which requires a non-const
`struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
ensures safe handling of I2C messages when using DMA, making it essential
for scenarios where DMA transfers are involved. By removing the `const`
qualifier, this patch allows drivers to prepare and manage DMA-safe
buffers directly.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/dw-i3c-master.c     | 2 +-
 drivers/i3c/master/i3c-master-cdns.c   | 2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 drivers/i3c/master/svc-i3c-master.c    | 2 +-
 include/linux/i3c/master.h             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d09ea5b6467c..54c7d86997d5 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1079,7 +1079,7 @@ static void dw_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 }
 
 static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
-				   const struct i2c_msg *i2c_xfers,
+				   struct i2c_msg *i2c_xfers,
 				   int i2c_nxfers)
 {
 	struct dw_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8d69a34986d9..c9e4c129454c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -813,7 +813,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 }
 
 static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
-				     const struct i2c_msg *xfers, int nxfers)
+				     struct i2c_msg *xfers, int nxfers)
 {
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
 	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e6e482a259b4..a408feac3e9e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -367,7 +367,7 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 }
 
 static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
-			     const struct i2c_msg *i2c_xfers, int nxfers)
+			     struct i2c_msg *i2c_xfers, int nxfers)
 {
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c1ee3828e7ee..24bd701b5de0 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1584,7 +1584,7 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 }
 
 static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
-				    const struct i2c_msg *xfers,
+				    struct i2c_msg *xfers,
 				    int nxfers)
 {
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 12d532b012c5..c67922ece617 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -475,7 +475,7 @@ struct i3c_master_controller_ops {
 	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
 	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
 	int (*i2c_xfers)(struct i2c_dev_desc *dev,
-			 const struct i2c_msg *xfers, int nxfers);
+			 struct i2c_msg *xfers, int nxfers);
 	int (*request_ibi)(struct i3c_dev_desc *dev,
 			   const struct i3c_ibi_setup *req);
 	void (*free_ibi)(struct i3c_dev_desc *dev);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
