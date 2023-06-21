Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31667C001DE
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jun 2023 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBDPkZIXhMCnbOwgrvsAJqFwXExBsy0uK/tHmDMWHcQ=; b=KN1KT0JtjfMcme
	PfA+njpbyMqpDjphZEaN3Y83OLH9m3mk5hZg2StPniX3z96VJJArCN+TiHn1awC7rhN+VkQ2e435C
	c0eycMSOO5W4Up9OCKOIdJp3eD0bAkn4zwZYDsroo/dFWmYXQpbTat2UgJOib76HtmdBS6AOABHrl
	5V4bfqxXLk7M6marsI2fB2hsMXKCCqZfYa6AUTFvFj2oAThthhhZWBE1ysFeAjG2RSG3VtqCWhsu9
	Nm+QfghniW+3OrtpNAHiMtw6MysVLx8RBLAVmQB0XWhQblzkppIPk42dVLPtLpzbUKeVI3XTFJW1U
	zjqJulj38NiUK02FI3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEohr-000fq2-2k;
	Thu, 29 Jun 2023 10:16:55 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0Z3-00F45z-2j
	for linux-i3c@lists.infradead.org;
	Wed, 21 Jun 2023 16:20:16 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qC0Yx-0016ia-Dk; Wed, 21 Jun 2023 17:20:07 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qC0Yx-001z4h-0Y;
	Wed, 21 Jun 2023 17:20:07 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 4/5] i3c: show error messages in of_i3c_master_add_i3c_boardinfo
Date: Wed, 21 Jun 2023 17:20:04 +0100
Message-Id: <20230621162005.473049-5-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_092013_883652_5AE93032 
X-CRM114-Status: GOOD (  12.72  )
X-Mailman-Approved-At: Thu, 29 Jun 2023 03:16:50 -0700
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

If of_i3c_master_add_i3c_boardinfo() fails, then there's no much to say
what the issue was (most of the error returns are -EINVAL), so add some
printing of the errors using dev_err() showing the node that failed and
what the issue was.

This should help with finding which device-tree node was causing the
issue and also mirrors the i2c case where it shows the node and the
error.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/i3c/master.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index bc42669f5c6d..2a9ebb1d9d57 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2050,32 +2050,42 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 		return -ENOMEM;
 
 	if (reg[0]) {
-		if (reg[0] > I3C_MAX_ADDR)
+		if (reg[0] > I3C_MAX_ADDR) {
+			dev_err(dev, "%pOF: address too big\n", node);
 			return -EINVAL;
+		}
 
 		addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
 							  reg[0]);
-		if (addrstatus != I3C_ADDR_SLOT_FREE)
+		if (addrstatus != I3C_ADDR_SLOT_FREE) {
+			dev_err(dev, "%pOF: slot in use\n", node);
 			return -EINVAL;
+		}
 	}
 
 	boardinfo->static_addr = reg[0];
 
 	if (!of_property_read_u32(node, "assigned-address", &init_dyn_addr)) {
-		if (init_dyn_addr > I3C_MAX_ADDR)
+		if (init_dyn_addr > I3C_MAX_ADDR) {
+			dev_err(dev, "%pOF: cannot assign address\n", node);
 			return -EINVAL;
+		}
 
 		addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
 							  init_dyn_addr);
-		if (addrstatus != I3C_ADDR_SLOT_FREE)
+		if (addrstatus != I3C_ADDR_SLOT_FREE) {
+			dev_err(dev, "%pOF: slot in use\n", node);
 			return -EINVAL;
+		}
 	}
 
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
 	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
-	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid)) {
+		dev_err(dev, "%pOF: bad PID\n", node);
 		return -EINVAL;
+	}
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
 	boardinfo->of_node = of_node_get(node);
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
