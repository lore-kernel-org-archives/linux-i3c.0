Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E88CD5BAC
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzxZkC4q3RbjV6t2kAfi7YHR9SMwzhCVP6E6E+O5qqc=; b=pOl1WZO+sPTOiz
	LXNXJON92frAjvoXXYMcOaNrzKFj0UmGFdUCU7a3Px3n/DCYs14t8Xab92fK94AkDc2wysVElV/tR
	tlKfUr8lzfhGGdhAEXFrkxwo6V7J5CktjOAF8D6f54SO+Zc7dwFj69A3mGjJ9B8vLt9lduPmrQT1Z
	+1z3gbZe9n/+wE+JLroTa9u5sKzI4lmc5JYTR2DCtlGV+5IgQdVCb+TgnLExMaP0mH5yQEgvC5mxF
	P5kYzA6Xa5KhE841GXAiIplkTAs8Zlw23IJVS4Do6DVuxtktcbsi0kfPHfnmuRD2EWuxZWkRGR4+N
	EdPZ5xxZGbbzhb47iuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMyE-0000000AUZ9-15fe;
	Fri, 22 May 2026 10:19:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMyB-0000000AUXW-2qQh
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 10:19:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5256E445E3;
	Fri, 22 May 2026 10:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2911F00A3D;
	Fri, 22 May 2026 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445147;
	bh=t1ETYeozg7CFWt2DrNX0CbO/MU4FMFeuD38xoBF1sMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R890KuJLkTrgTHNT1i4/eHoOHOMtVRzBIUdmuZG3KNgLngTY77KKakYvXJtS+uqy7
	 +5MfVU5LahS7U3rfAKgnYKf1hIK6IEJadAN98U4pjs4/zZiwSjq8pvlWp8m2OO1PO1
	 a/y730K085NG3XWr+8eagG+/6s9F+M/mhQGPkOUvB47W75Hedjsp1dKuSqNLay9/N6
	 dKlGKBaFRNKv292cEbc1pLZf7IF6tTj7iRA/fGJwiZLWNcKiVjlQbnA6mIgTLbIqAz
	 yTgs4frTHnOlG539uzif3YpxApiC6hqxe0KBI/6dTeapVl3cpcRPhE4dCIEbFIVRE8
	 YV5FrARG3eUtA==
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 14/17] i3c: renesas: Organize structures to avoid unnecessary padding
Date: Fri, 22 May 2026 13:18:12 +0300
Message-ID: <20260522101815.1722909-15-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031907_735127_CF1CAFDA 
X-CRM114-Status: UNSURE (   8.42  )
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 631c9c5d8038..5614ed99553c 100644
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
@@ -253,21 +253,21 @@ struct renesas_i3c_xferqueue {
 };
 
 struct renesas_i3c {
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
+	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
+	unsigned long rate;
 	enum i3c_internal_state internal_state;
-	u16 maxdevs;
 	u32 free_pos;
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	u32 extbr;
-	unsigned long rate;
+	u16 maxdevs;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
-	struct renesas_i3c_xferqueue xferqueue;
-	void __iomem *regs;
-	struct clk_bulk_data *clks;
-	struct reset_control *presetn;
-	struct reset_control *tresetn;
 	u8 num_clks;
 	u8 refclk_div;
 };
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
