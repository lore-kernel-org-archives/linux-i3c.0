Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A00CD6E4A
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYhxj9z9jLE3eMLNpNSXL5EpNugeaGAgF9W1HMm4CKY=; b=DrAi+0LqCdTCJd
	ExBtvW/Fwfh7B6AqidKGFanjajwiCDzydtvhs1JXqZFEPy0Nh6emnzTokBKThmUZ7eT/2K0lU4MaQ
	5xjxt7O8nWp3aBLBNFcjDPYpsHFpbUgcUdE+iN7evMJIeZ+3MbkTLVPnPmPSef0oazb1nZp2053q6
	M57Jz35wySIsvzE9qVw/31Bir2DgiAS+5RZZUMDo1e1xLMV2yLTwisQ2I95qxRnlTG579ZY/+c/Ry
	biAoXBxWRu9rYTeQmGio5JWl7B45VAHUuH9q5TuApRgYOf0/EaTnaWFP9fYpuhOe0Z6+EB1ey+ZbS
	JIh0p6PCoWf84M0i0qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBI-0000000D7Q2-3dGj;
	Tue, 02 Jun 2026 13:29:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPBG-0000000D7Oz-3bgE
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 13:29:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92C8543992;
	Tue,  2 Jun 2026 13:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C581F00899;
	Tue,  2 Jun 2026 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406958;
	bh=VGh00h5m8TDNfIxYGHg0jww3vZhwGYH7HN9uRv86q1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A8SJ/1Um/R6GiexQ8hhR3CFOemBpBnFo7W4IFoPUrE6McqBbmb7rotgNJ+X2Eexyz
	 79MqBdLsHsB+fYfPzN30S0QsCBkSxjOsVpO2a85ju7MnROEKGg1tb6zcVDv+CABRmv
	 ygbVMziFZyEHKhhBzyJ3wf6F0JfXQU5J51YBbTAXPcHgua8m4w67aUYScX61NF1RAr
	 SUx5K0968O5bnszAi8AtrZyn9bhCk9vGD9DYlqs9bkK8K1nDG4jA+S2Iy3dIzRIXwS
	 qnazDadjnu0/pP+w0iW3qYD552vP1JT2/Yw468QpX0J5zOykDlgwpxLgldZRUWEXBk
	 4JyJgyyKg9RQA==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 14/17] i3c: renesas: Organize structures to avoid unnecessary padding
Date: Tue,  2 Jun 2026 16:28:21 +0300
Message-ID: <20260602132824.3541151-15-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062918_920218_6611FC64 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder structure members to reduce padding and improve memory layout.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 9ffb4a9d1e46..e1aa445de933 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -221,19 +221,19 @@ enum renesas_i3c_event {
 };
 
 struct renesas_i3c_cmd {
+	const void *tx_buf;
+	void *rx_buf;
+	/* i2c xfer */
+	u8 *i2c_buf;
+	const struct i2c_msg *msg;
+	int i2c_bytes_left;
+	int i2c_is_last;
 	u32 cmd0;
 	u32 len;
-	const void *tx_buf;
 	u32 tx_count;
-	void *rx_buf;
 	u32 rx_count;
 	u32 err;
 	u8 rnw;
-	/* i2c xfer */
-	int i2c_bytes_left;
-	int i2c_is_last;
-	u8 *i2c_buf;
-	const struct i2c_msg *msg;
 };
 
 struct renesas_i3c_xfer {
@@ -258,23 +258,23 @@ struct renesas_i3c_addr {
 };
 
 struct renesas_i3c {
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
+	u32 *DATBASn;
+	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
+	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
+	unsigned long rate;
 	enum i3c_internal_state internal_state;
-	u16 maxdevs;
+	bool resuming;
 	u32 free_pos;
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	u32 extbr;
-	unsigned long rate;
-	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
-	struct renesas_i3c_xferqueue xferqueue;
-	void __iomem *regs;
-	u32 *DATBASn;
-	struct clk_bulk_data *clks;
-	struct reset_control *presetn;
-	struct reset_control *tresetn;
-	bool resuming;
+	u16 maxdevs;
 	u8 num_clks;
 	u8 refclk_div;
 };
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
