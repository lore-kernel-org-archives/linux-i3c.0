Return-Path: <SRS0=Vv1h=R6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96FAC43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Mar 2019 21:49:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BFC72082F
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Mar 2019 21:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LB+Jfzk4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QUuIWTV+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BFC72082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5sn746uU5On5wk+RG7W837V9zWZEMygrb+Ek+PQdSgU=; b=LB+
	Jfzk4chudcUi+GcAxP4F0LOss72wM8d+5soBrgFUCuYD4mytb+NzniN6xNJBlXXH81I6wxJ3CY8Az
	uJfXtRgCTugdAFvJgfL6g2sqGpb5ug+ynyr+TuIBfFVbssJ4QQaSsij4pj8w2uYHA8Uov2Vnx6QNq
	qLq5nGAJvjYlnEmz1DZO2e2bLZhEYqufl5eCY4fRfoEB0an9kYY3FyPmXlEcbT+18arWrR5tBqOp1
	xUQClNUyLfH2m8f92t9q0l9lmGovLm0FbFEtNWpsN/pccgMAYOklmypCftSX9bLQh5VC0lB+J5EJ0
	CijZXZKNPMGbWb7UxWupflrui7rFLaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GQK-00058q-OR; Wed, 27 Mar 2019 21:49:28 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GQH-00058U-H1
 for linux-i3c@lists.infradead.org; Wed, 27 Mar 2019 21:49:26 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id B9E0510C0809;
 Wed, 27 Mar 2019 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1553723364; bh=FgyqFdzJywzOfGNWoICX59VUQvhWQWRY25FD2b+zBGA=;
 h=From:To:Cc:Subject:Date:From;
 b=QUuIWTV+GsBIU/8EWfbPT/QgwiaUuEZnEiGLlgShGKdFsRdktYiaIxRmOy2FR5ZY1
 I74TWq+vou3N1LPIL5j/cp/Zy2h+b/nheBJcjdtR8oAbRhSxk5/lqBPsFSAabJX/A2
 fOq8XM+lWXB4PGmC8A1aVK4mNdo5K6TrY4nSUwkYFTkNWzlVCd3T+8cuQsqosguIMi
 Ew2XE9wavvWvzHbWsLkwSf7e4VWWMGMPziYARoolTiUUXSBr+umWvGO3KmeDOBhJjx
 KRI7ss4lgEGC0CYGvEP3OG98PzEv2V1tS/B9jQBP0tLR7bpA83V1FP1gnjf2Plyq1X
 L89hEyHoMv0Uw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id C5A6C5161;
 Wed, 27 Mar 2019 14:49:23 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: bbrezillon@kernel.org
Subject: [PATCH v2] i3c: master: dw: remove dead code from
 dw_i3c_master_*_xfers()
Date: Wed, 27 Mar 2019 22:49:19 +0100
Message-Id: <1312c53876c6542f86d80e6e6c07e44d7e1a9ce0.1553722931.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_144925_572729_4EC7456D 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Detected by CoverityScan (Event result_independent_of_operands):
"(i3c_xfers + i).len > 65536" is always false regardless of the values
of its operands. This occurs as the logical operand of "if"

"(i2c_xfers + i).len > 65536" is always false regardless of the values
of its operands. This occurs as the logical operand of "if"


Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---

Changes v1 to v2:
  Fix message-Id
  Fix message subject

 drivers/i3c/master/dw-i3c-master.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 5927922..e5a2880 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -841,11 +841,6 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 		return -ENOTSUPP;
 
 	for (i = 0; i < i3c_nxfers; i++) {
-		if (i3c_xfers[i].len > COMMAND_PORT_ARG_DATA_LEN_MAX)
-			return -ENOTSUPP;
-	}
-
-	for (i = 0; i < i3c_nxfers; i++) {
 		if (i3c_xfers[i].rnw)
 			nrxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
 		else
@@ -974,11 +969,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		return -ENOTSUPP;
 
 	for (i = 0; i < i2c_nxfers; i++) {
-		if (i2c_xfers[i].len > COMMAND_PORT_ARG_DATA_LEN_MAX)
-			return -ENOTSUPP;
-	}
-
-	for (i = 0; i < i2c_nxfers; i++) {
 		if (i2c_xfers[i].flags & I2C_M_RD)
 			nrxwords += DIV_ROUND_UP(i2c_xfers[i].len, 4);
 		else
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
