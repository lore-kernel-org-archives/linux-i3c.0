Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D88CC77B61
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 07:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcH/6rD4B7Pn2y+ElVkozt7yIJUPnDR7j6R9zV2sWqI=; b=3z4Es6ZsvTOPbN
	hPkBjOEDR0X/vqU4F1QalD/LyLOjrtgwShu5is2kQQ994hEH5IMBkNFliAkg+2ts6alj0b5N0KL5T
	OOc7nSJBtsle9ziXFc2P8S2/cnwh8dcwuaCWF7TBq7co4hcF+ugiSRS96jme6q0pjJDyTqhg9D6bt
	SO7CL6Olk/ctkGYaEU+hnWOI44fErnNcXkC6vgc6DbJEfxg92w6qlTGYOH0/Y2iXJyLdmBCAc0ozX
	9Xf7usVrFDkRlB13KyEuF4HL3mVJtXLKhTBH0i/WY8TYIlkl471kroG0PFM1JbxXq0Nds+6Fc3SgA
	Ojw4td90oBccL7O6dcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmOX-002rGn-0A;
	Thu, 30 Mar 2023 07:08:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phlZj-002jPU-06
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 06:15:57 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 5ABCC20127; Thu, 30 Mar 2023 14:15:40 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680156940;
	bh=VslsMR1RGA47xdSol17mvkBhE1pYlmrfqfiajjoXuh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OcLc+uJb+WK1aI6O7lPqw6/8ZPnseQCc+f3MgfMQCRlFaaQDRCo6q6oDkbFgT6wCj
	 +1I7xaDbGGfuIg3zl6VcYU3ohdTiOVWSWtn4ksrEoZinWlJaBu2yRHV2St8MOc33cu
	 ZHl/KoF1yoZoRGUVcy+NhsyHYkZKkzhMUzOaB0yJCf8NcexTpyBdJdeBnjv41AFFHv
	 oCYKtRGa51nau4X0ItTQDQmfttU+lYTFibTkDqvGUEAW54k9mVuKyFvKkrVMT93VRy
	 jNxruHX/6M6uLxyQKGNjljPRefAeGo61opaN/5vloRT+hB8g9gb9FKok6jcSvfWShy
	 RpQ0Hktpsl57g==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>
Subject: [PATCH 1/2] i3c: dw: Return the length from a read priv_xfer
Date: Thu, 30 Mar 2023 14:15:32 +0800
Message-Id: <f4fff7ab18dee1f662dc7a5a4111fcd921e6792b.1680156630.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680156630.git.jk@codeconstruct.com.au>
References: <cover.1680156630.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_231555_409378_FC1EDE2B 
X-CRM114-Status: GOOD (  10.14  )
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

From: Matt Johnston <matt@codeconstruct.com.au>

We currently assume that the rx_len of a read command will be as
submitted, but we may have a shorter read than expected.

This change populates the output i3c xfer length from the actually-read
length.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 48954d3e6571..97a5442b1ad8 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -887,6 +887,13 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
+	for (i = 0; i < i3c_nxfers; i++) {
+		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
+
+		if (i3c_xfers[i].rnw)
+			i3c_xfers[i].len = cmd->rx_len;
+	}
+
 	ret = xfer->ret;
 	dw_i3c_master_free_xfer(xfer);
 
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
