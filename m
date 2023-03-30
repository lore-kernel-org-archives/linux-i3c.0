Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DE7C77B6F
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8KPtzuUmn2TnSIpJ7VXiymS0YT/3UF3zHTCbD00IL8=; b=GJkj56SUR2Rxsu
	gmoC4CZVf8BU4Yqyd9lSX475+ECzUfK/TtHVEAgPULBfd3yS5RcmH08In7OTsjWTiKwccj6/+ZrGz
	FhG6rxYJPEdS2Oc9UAtRs65USFuD1nnY+VEe23YDW3Sw3oXNNuwsvrikYSn4Bx94BorOcJvdlu/Z1
	Lf4WXQiPppeKebX7IT/YS4QBMH98+WWAC6yUxr8oMmYl2cVPRC88EVUinlsFlNNtaikC9L8UgfEIQ
	113iWKdgN4fquuyckNpYcQ+7Ih6ME9g+L2LT2xKrAm4WOCXAaN3yzaJMfmymE/igAWyC0wjJo+ktK
	fsKs/xmdgXSRR0PrrJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phscv-003vUq-1l;
	Thu, 30 Mar 2023 13:47:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn3d-002ylX-2O
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:50:55 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 10EE6203CB; Thu, 30 Mar 2023 15:50:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680162651;
	bh=TgWA3dNdjw60/A4TBWePBoZJR96ih9X8EEXzL94FJKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dzWg3NEeDk5FeA5lWd6SScOUizSw4NDd5KWrRnsP7OMPamYA6mYBC6CqDqPonJKL2
	 O0ZtzOu3xFrH3P49ewg4kdQc8CoiQKLr+fTieHho8I8N97wWjy04YNxwE6nORqtkvu
	 zEzThb5ejhF1bOTv2fo5cl4XdeWaZNJiH6OsfB3WhLtMTuobE39rbEA1iSmVsLN/ft
	 SwBZmrIJLZQqSq4ThoKtkxINc4+TYuw2rHS21ZGR3giBKPqUNUAFpDWS5938t80d6u
	 QK2iVaxVk1aLyVrnl3V9gR4imC3ZJTWOuZpbx5EhJzvNfIjond5q8yCRpp6WuA61wW
	 vGKYl57YBiNcQ==
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
Subject: [PATCH 5/5] i3c: ast2600: enable IBI support
Date: Thu, 30 Mar 2023 15:50:36 +0800
Message-Id: <ba923b96d6d129024c975e8a0472c5b2fcb3af32.1680161823.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680161823.git.jk@codeconstruct.com.au>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005053_975724_A6A3A018 
X-CRM114-Status: GOOD (  13.95  )
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

The ast2600 i3c hardware is capable of IBIs, but we need a workaround
for a hardware issue with the I3C state machine handling IBI payloads
of specific lengths when PEC is not enabled. To avoid this, we need to
unconditionally enable PECs, at the consquence of losing a byte of data
when the device does not send a PEC.

Enable IBIs on the ast2600 platform, including an implementation of the
PEC workaround, which prints a warning when triggered.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/ast2600-i3c-master.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index d3d7b7d19f22..52d9474a7651 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -36,6 +36,8 @@
 
 #define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
 
+#define DEV_ADDR_TABLE_IBI_PEC			BIT(11)
+
 struct ast2600_i3c_platform_data {
 	struct regmap *global_regs;
 	unsigned int global_idx;
@@ -93,8 +95,26 @@ static int ast2600_i3c_init(struct dw_i3c_master *master)
 	return rc;
 }
 
+static void ast2600_i3c_set_dat_ibi(struct dw_i3c_master *i3c,
+				    struct i3c_dev_desc *dev,
+				    bool enable, u32 *dat)
+{
+	/*
+	 * The ast2600 i3c controller will lock up on receiving 4n+1-byte IBIs
+	 * if the PEC is disabled. We have no way to restrict the length of
+	 * IBIs sent to the controller, so we need to unconditionally enable
+	 * PEC checking, which means we drop a byte of payload data
+	 */
+	if (enable && dev->info.bcr & I3C_BCR_IBI_PAYLOAD) {
+		dev_warn_once(&i3c->base.dev,
+		      "Enabling PEC workaround. IBI payloads will be truncated\n");
+		*dat |= DEV_ADDR_TABLE_IBI_PEC;
+	}
+}
+
 const struct dw_i3c_platform_ops ast2600_i3c_ops = {
 	.init = ast2600_i3c_init,
+	.set_dat_ibi = ast2600_i3c_set_dat_ibi,
 };
 
 static int ast2600_i3c_probe(struct platform_device *pdev)
@@ -136,6 +156,7 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
 
 	dw_i3c->platform_ops = &ast2600_i3c_ops;
 	dw_i3c->platform_data = pdata;
+	dw_i3c->ibi_capable = true;
 	rc = dw_i3c_common_probe(dw_i3c, pdev);
 
 	return rc;
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
