Return-Path: <SRS0=5ZYP=PS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42D8C43387
	for <linux-i3c@archiver.kernel.org>; Thu, 10 Jan 2019 15:35:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C4B214C6
	for <linux-i3c@archiver.kernel.org>; Thu, 10 Jan 2019 15:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bnq8gZQ5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ldpz9rKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C4B214C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iDokrOoFd3gwBl8foEuxVNe0mDVc37UFO2SqqurxL70=; b=Bnq
	8gZQ5mRSkdE4By7TtSz/lAWUl+q6AOB4XyaVhhgSwyxPrB658BJtfhdMR4BqgIghgtDshXN+XacjH
	Xhtv9W5JAp7/Xah4JLL3RFxMv8NWA9a81D9ETzoAGONsnhar4r1HOf8a2WlT1OiaRRhgI3zb7XjU0
	cqZpFmTQL5CuUKSJfAM1qG3lMEXD8FyClFW0Uxupj7WhB+Q7TUxTUxJfGf29Dz58wh6smwFtGITBT
	youwMe2d0/QwenS3YaGjcwBbrGDbJbjqKOeDNa/Y5SeUphgx/Q5xL7MMzsF/riHledCHuSKZ2eB6w
	h3nioe9skOnRPeE6blo8ddosjAXssOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghcMM-0001gr-T9; Thu, 10 Jan 2019 15:35:06 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghcMK-000191-PO
 for linux-i3c@lists.infradead.org; Thu, 10 Jan 2019 15:35:06 +0000
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id E385510C125F;
 Thu, 10 Jan 2019 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1547134502; bh=8is7arKEt+v6y/W0hvvhRP7Az7DBj/LBbvlYfK7M9KQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ldpz9rKEPkQutaTcVzvhoAWXTsI8Jw/jnFcg9yKa2GiYr6aIKQiviAYQzX4KzclDQ
 gs5e/sgAmyO0xiFDraoD1XhD/68CsHxa+gTS9HIhtT08SBHAw8v1YtBcLEKRuiWtgS
 9hfv78syZICvSuE6C1fJDTBCVmEE5wkcqGJb1LkRNTVQvlsnH5z/tXObO1CtRnEWNR
 HutVz1PRUOKHVChI0W+ORDFa0CUY3rLhlaCAoyuasR82JeMEADoFgpNDr41pYx8Rqn
 ltt0BETrL97tr+FVy/VYLmWxkOtyFA7wHfDg8PyKuULeFA5TOrKJK0fL/bo4Cv6xXJ
 MLlgaSn58U6jA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 0E8D157C0;
 Thu, 10 Jan 2019 07:35:01 -0800 (PST)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v2] i3c: master: dw-i3c-master: fix i3c_attach/reattach
Date: Thu, 10 Jan 2019 16:34:59 +0100
Message-Id: <0314b6939b1aad59a972e7c3109d01e76b24dc35.1547133644.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_073504_836297_E82AF3E4 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: joao.pinto@synopsys.com, Vitor Soares <vitor.soares@synopsys.com>,
 bbrezillon@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch fix i3c_attach/reattach functions.

During the i3c_attach the driver *ignores* the static address used for
SETDASA CCC command.

During the i3c_reattach the driver doesn't update master->addrs[data->index]
with new address if old_dyn_addr = 0.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
Change in V2:
-Coding style fix
-Edit commit message with Boris sugestion
-Add Fixes tag

 drivers/i3c/master/dw-i3c-master.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index b532e2c..f8c00b9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -901,9 +901,6 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
-	if (!old_dyn_addr)
-		return 0;
-
 	master->addrs[data->index] = dev->info.dyn_addr;
 
 	return 0;
@@ -925,11 +922,11 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
 		return -ENOMEM;
 
 	data->index = pos;
-	master->addrs[pos] = dev->info.dyn_addr;
+	master->addrs[pos] = dev->info.dyn_addr ? : dev->info.static_addr;
 	master->free_pos &= ~BIT(pos);
 	i3c_dev_set_master_data(dev, data);
 
-	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
+	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->addrs[pos]),
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
