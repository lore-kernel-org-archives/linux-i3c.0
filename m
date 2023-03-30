Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AD4C761A6
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGDRK4Oy5oGUSml1IFwW7TB4T3SH5HNXZ/INGx0uvww=; b=RIfBWQrU+Ejcgy
	kmCGg1ZKFK3/BSeG1K791e0FRIB1QHyrB+VEbJQl98K0m5AMbhGKNrpAB2UtQ7BDIDeFggy+thlua
	LhhrTpFsNFYoecR0LoNaKGRzxXrPFBXkD5TiP5+ATpKNwIjHte6iFA2aCiKBLDgelczkeJjl3rCiL
	RxbfK846a6n+SD8MrcgdUr4RRrOvoYC6H9CMqz0p99UvZT2fqAATOtX3pB/fOf2+VXPjTTIZomfFl
	RyAwvAQ4S+Cn/+ZizZdVFUc8H9qWswy/vRNblVVYbv1KSLm11mj2B1qQj+JNhPiJlNt4y5Fe3wYd3
	QsZj76l3y+5Yhukm0MpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phscu-003vUP-38;
	Thu, 30 Mar 2023 13:47:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn3c-002ykb-19
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:50:53 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id A63AE202DE; Thu, 30 Mar 2023 15:50:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680162650;
	bh=8zhD2adCLYYuScBOR5iCaSFKhpfq+F0X69zJxXLarvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GIUJ+wJHtwMjSE88F1CyGXDRAtTwrDkSRaapKOTDaMaixddks/cp4darrUkSpc2pu
	 zn4eRfjnrtRB36syxICSeLa3YtmO6hm8/UKu0tQkuECVb8F8aOuE350fdUsEYejlJY
	 6UvDhnACIpKcMqYSluyaX9AND9Yu/EsG1sb7p+TExNpK8BIv8r9nnZyN4/RLGJ9I11
	 6XL/GR9TSYIc7mI596FiwT9ow2Ry0MZRzcGTU1YbgFZbDPBp8+beXDBykQClJwbmHA
	 R5TbVVuDoEQUS1hUek3kyqtW1zbpPqSyz2c0UwfCZ0sWmHY7PLTTzFtdRldByXSRHd
	 x2WGtN1w84wCg==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 4/5] i3c: dw: Add a platform facility for IBI PEC workarounds
Date: Thu, 30 Mar 2023 15:50:35 +0800
Message-Id: <d5d76a8d2336d2a71886537f42e71d51db184df6.1680161823.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680161823.git.jk@codeconstruct.com.au>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005052_585736_BA0343C4 
X-CRM114-Status: GOOD (  15.12  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:47:39 -0700
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

On the AST2600 i3c controller, we'll need to apply a workaround for a
hardware issue with IBI payloads.

Introduce a platform hook to allow dw i3c platform implementations to
modify the DAT entry in IBI enable/disable to allow this workaround in a
future change.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 19 +++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.h | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index c49c5fa01a26..df8bf985abda 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1155,6 +1155,7 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 	} else {
 		reg |= DEV_ADDR_TABLE_SIR_REJECT;
 	}
+	master->platform_ops->set_dat_ibi(master, dev, enable, &reg);
 	writel(reg, master->regs + dat_entry);
 
 	reg = readl(master->regs + IBI_SIR_REQ_REJECT);
@@ -1247,6 +1248,17 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	addr = IBI_QUEUE_IBI_ADDR(status);
 	len = IBI_QUEUE_STATUS_DATA_LEN(status);
 
+	/*
+	 * We be tempted to check the error status in bit 30; however, due
+	 * to the PEC errata workaround on some platform implementations (see
+	 * ast2600_i3c_set_dat_ibi()), those will almost always have a PEC
+	 * error on IBI payload data, as well as losing the last byte of
+	 * payload.
+	 *
+	 * If we implement error status checking on that bit, we may need
+	 * a new platform op to validate it.
+	 */
+
 	spin_lock_irqsave(&master->devs_lock, flags);
 	idx = dw_i3c_master_get_addr_pos(master, addr);
 	if (idx < 0) {
@@ -1387,8 +1399,15 @@ static int dw_i3c_platform_init_nop(struct dw_i3c_master *i3c)
 	return 0;
 }
 
+static void dw_i3c_platform_set_dat_ibi_nop(struct dw_i3c_master *i3c,
+					struct i3c_dev_desc *dev,
+					bool enable, u32 *dat)
+{
+}
+
 static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
 	.init = dw_i3c_platform_init_nop,
+	.set_dat_ibi = dw_i3c_platform_set_dat_ibi_nop,
 };
 
 int dw_i3c_common_probe(struct dw_i3c_master *master,
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 0096942649a3..379300b7c405 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -67,6 +67,16 @@ struct dw_i3c_platform_ops {
 	 * perform actual device enabling with the i3c core ready.
 	 */
 	int (*init)(struct dw_i3c_master *i3c);
+
+	/*
+	 * Initialise a DAT entry to enable/disable IBIs. Allows the platform
+	 * to perform any device workarounds on the DAT entry before
+	 * inserting into the hardware table.
+	 *
+	 * Called with the DAT lock held; must not sleep.
+	 */
+	void (*set_dat_ibi)(struct dw_i3c_master *i3c,
+			    struct i3c_dev_desc *dev, bool enable, u32 *reg);
 };
 
 extern int dw_i3c_common_probe(struct dw_i3c_master *master,
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
