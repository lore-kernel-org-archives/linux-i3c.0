Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23432C6FD1D
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 07:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHT8LF38W2ZAq4nX0EX1bepTliT8Nww2NITLAlZbVTs=; b=YxjwPqViUxB1hp
	j2qR0TXjWjBdnVxRnHRJ0lSNYNY5t1/eeitCJ9amWMCiqOoJZ6ofdoSkPZX4toOpv4SylMV+KDwUm
	94CjziVlUNj0ke1xGMDmaICe/uvcWELmjt9MNuU3tu4PpGq+KpbwLws7AxxAmDaT+agYMM6/ET+HJ
	lMe/JHxvW+pLp0bJ5ihrVWE2kuDCCpGsztmQfoZRTM6AdHDsKwOrXE0W01nOjgCTAbSRdzcOOo98k
	fG0y+ELIEpuTkDwBPFQU/2Pz9/Jb8qF+p84sVDH6ZIgI2QA97lATLm8Pm4avoKySkQgqYFsS58yfB
	6Ykapgzvj1ud1Ar+ovPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmOW-002rGe-2T;
	Thu, 30 Mar 2023 07:08:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phlZj-002jPV-02
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 06:15:56 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id E18AE201F2; Thu, 30 Mar 2023 14:15:40 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680156940;
	bh=VSfWL5J3N0HofMP0Z1GXRuSjpsdhEDDcmRtOaVcYUYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cUH2qq599hF3SDx4Lquc+si+GhAMGFn/heshsCWGmpVCXomV03WKAnq/VjniqUVA4
	 nQGXSJwVQtya6NGM6pNrd1ffvpLwNowz9ozhuvScF881i1U+W2cs28H70Q0CvoVKX/
	 0g+FTwkE89q9q7rjFjyl0lwnv8TNgtKQVtGuKgTxhFYwBgeP/gzPygZc180QYvOZmO
	 fWkXm9O0zlNUlKVTakyNryEmhcSxmNytA7TK1FyWDbtWFxK2n/6ZeQbwItTm5/nCTo
	 O3aQcf3GTBDeK2972J6qvY1ne/gUtkFAbOWiNO9H97YGq4bfjha0nwjqhlrCSTsowI
	 9ppaFPOZlzRGQ==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>
Subject: [PATCH 2/2] i3c: dw: use bus mode rather than device reg for conditional tCAS setting
Date: Thu, 30 Mar 2023 14:15:33 +0800
Message-Id: <92a933566f7846708a00ad7f5a16ee8e6ed32d0e.1680156630.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680156630.git.jk@codeconstruct.com.au>
References: <cover.1680156630.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_231555_409567_1DE39A99 
X-CRM114-Status: GOOD (  10.99  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 00:08:23 -0700
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

In the clock setup path, we set the hardware DEV_CTRL_I2C_SLAVE_PRESENT
bit on a shared mode bus, then read-back this bit for the conditional
tCAS set.

Instead, just use the bus->mode setting for the conditional test.

While we're at it, add a little comment about why the conditional is
there.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 97a5442b1ad8..1c146a39e1bd 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -538,7 +538,11 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
 
-	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
+	/*
+	 * In pure i3c mode, MST_FREE represents tCAS. In shared mode, this
+	 * will be set up by dw_i2c_clk_cfg as tLOW.
+	 */
+	if (master->base.bus.mode == I3C_BUS_MODE_PURE)
 		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 
 	lcnt = max_t(u8,
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
