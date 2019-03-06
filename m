Return-Path: <SRS0=nhNj=RJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039A5C10F00
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Mar 2019 23:04:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A8B20684
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Mar 2019 23:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AiX8G2HG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SC2dKtvX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A8B20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DcXAFY3GoOKfSrYiKxE73itv8JkEMvqqRk+y7dsrg34=; b=AiX8G2HG2AvtAk0R22SZKOSNPn
	KJys6m44XFxzVU22Nqv1t8P8Qu3QD/DwEC0+eMwYPsbsEVSOc0yg/HTEpbuzl0639bDi0QLMLM2C1
	C2kjUWdtoWmui6Jb2gZEgdfiLcdntSIB1wA9CKA78KP8/LV6Enw4E/quiBvwF/T4qjO+lE4MmxHQY
	DgzwLiFB9B9/gpiRSiSzGF4DWL2eFnh49m0bXK7Su1EtEngxJR0CUrUw7PxSpITQS5Iek7YSRSvji
	DCtkWDOwdnpaMXec3+tccKTiKN+G0+u3K6T9OMCSkrXB81hUD3S+U6e9+6L6V2B2FoDM2b9pQyQdy
	CY6znAHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1fZy-0003B2-FI; Wed, 06 Mar 2019 23:04:02 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1fZw-0003Ab-Cy
 for linux-i3c@lists.infradead.org; Wed, 06 Mar 2019 23:04:01 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 7A02F10C219C;
 Wed,  6 Mar 2019 15:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551913439; bh=2dOsSpPrJjbl70kbZdlzeiIVCGoQmcGSgFFktrvm96o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SC2dKtvXh3uj7gF15oDUORFU+or7MyYOO2DMKysfIW5s+VY9DXJswkgUjgUY18bva
 YS09ucuPQlbqygPMRynbAKkggXc5S/q/9VG5+9qppVs2sJVYeZ7I7/+aK87PSimxg2
 2Ab8TOLpiknxzd8NFh64mKNjwdmd2sEMOcUCrx6LeJ0r26n5a+ruO5A2m2QlbpJZeu
 nmWAS58CC0rwIh9JifZNrdyIY8871giAhGSlmPGyjdvNyQhTx8CwuYkv++Y4rcv0xo
 +VoZ0LiavQ8u2yIpwNg88LXm4hPrUK2BMs4du5DNPXbCX4G3WPPBT98cJQevhXT4cz
 OofOCydlOL+Aw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id 28DB555BB;
 Wed,  6 Mar 2019 15:03:57 -0800 (PST)
From: Vitor Soares <vitor.soares@synopsys.com>
To: bbrezillon@kernel.org
Subject: [PATCH 3/7] i3c: master: dw: remove dead code from
 dw_i3c_master_*_xfers()
Date: Thu,  7 Mar 2019 00:03:55 +0100
Message-Id: <6dcb0e17851cfb6913dda388d0960e0d1f15f853.1550587318.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <01dfc316793360cb601922caefe23153ca2db194.1550587318.git.vitor.soares@synopsys.com>
References: <01dfc316793360cb601922caefe23153ca2db194.1550587318.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_150400_453548_D5507486 
X-CRM114-Status: UNSURE (   7.86  )
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
