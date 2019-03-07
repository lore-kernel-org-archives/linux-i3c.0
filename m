Return-Path: <SRS0=nBCV=RK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08B5C43381
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 00:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A404620854
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 00:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QuwAVFur";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X1OSCZwK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A404620854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MkILVx+KyKVI2b/CbLAzuZfv7Ab1wQKv9Xrvin8/Hqg=; b=QuwAVFurkkQf1RO6tOoPI4lbI8
	2qMk7n8ihE+p3ZMpGIjgz8ZQtMUMvqBT5nN8L6wIuNYEI6PNp+iHI0gkqERvGUJj+l/tB2l4Mrp+B
	50cNGcx1xNsWnDtEQSsaoUZLuSdVmUYF81wK2YfAtXFlFhHImaX711wi8komyY/hUPxbNf/CLJDa+
	fEs3/cuX9CEdzVQzRv2FLD0FZAJ/y1YXwtl+h2NVgUUND4AAx4bpOxLB2Cu0JwvNehhT9gX4r5MCo
	2Wu/IBDYxTpp90SGjUpnXU7GsbaChYcx/V5p4ZdoT7ebvFhK3XtANJ81DMxDwCNUXu92XPaflGjnK
	/xyYH9Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1gTP-0006QG-9u; Thu, 07 Mar 2019 00:01:19 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1gTM-0006Fk-Lk
 for linux-i3c@lists.infradead.org; Thu, 07 Mar 2019 00:01:18 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 8F3EC10C21AE;
 Wed,  6 Mar 2019 16:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551916874; bh=uBmYKqGunxgMMz8mMmGUwSRfl0ij6sdb0ZXR2jJF+2M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X1OSCZwKQ0UFZQZSyPf+/BgI39GlN5XJvvFVptlxgx4oDsXO2Cfd1ijC2x8MMtiCe
 QSPR0i5YikmA1rx56MzxX/lHYn59Ub1nk1jqLv3Y8JLkJ3Xya/ymn+QUsRZIPg9odm
 DmPLD8WR9g2RGUIo8km9XgCoOXLOHEtCKD34pdfTGhqy2HyVd4UeWcjYdIaREHIbar
 k5u01zVRQ5kzkKPNSDlXRgsZqYQD6xu+yzwYX28K4ojSqiTXoUY9W2zHY9RmkmEbzZ
 B4vkAuUZWFrPpWKVftPM7rqVoL4CtItyvD8V7RIIawpAIMZw0kdsO7iAIXzwvZJr9v
 LsNL56rq+ZZkA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id 48D17569C;
 Wed,  6 Mar 2019 16:00:42 -0800 (PST)
From: Vitor Soares <vitor.soares@synopsys.com>
To: bbrezillon@kernel.org
Subject: [PATCH v2] i3c: master: dw: remove dead code from
 dw_i3c_master_*_xfers()
Date: Thu,  7 Mar 2019 01:00:41 +0100
Message-Id:
 <6dcb0e17851cfb6913dda388d0960e0d1f15f853.1550587318.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <01dfc316793360cb601922caefe23153ca2db194.1550587318.git.vitor.soares@synopsys.com>
References: <01dfc316793360cb601922caefe23153ca2db194.1550587318.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_160116_730665_CBA8E593 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com,
 linux-kernel@vger.kernel.org, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
Message-ID: <20190307000041.2uZQux2PSazzXVXT-k09cTXqKOg9jnv3BX_KdnpN58Q@z>

Detected by CoverityScan (Event result_independent_of_operands):
"(i3c_xfers + i).len > 65536" is always false regardless of the values
of its operands. This occurs as the logical operand of "if"

"(i2c_xfers + i).len > 65536" is always false regardless of the values
of its operands. This occurs as the logical operand of "if"

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---

V2:
 In the previous version I didn't remove patch serie index from Subject
 Removed now

 drivers/i3c/master/dw-i3c-master.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index bb03079..eef6fae 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -840,11 +840,6 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
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
@@ -973,11 +968,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
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
