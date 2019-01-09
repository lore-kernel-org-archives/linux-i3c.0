Return-Path: <SRS0=kSke=PR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236B1C43387
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jan 2019 14:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7865206BB
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jan 2019 14:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L0zoH46Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WgtjT2mI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7865206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=i+18TwlPVmQNrrdWjF0Pm2WH0Zbivzgp0v0Ji28QrDQ=; b=L0z
	oH46ZESgJWhLeiQdGwCGpHy20XzhvBaQnrvtNIMVC6nT/A3abXgZmcHGKq1rCLlqE6Sv+hJx9ZZDs
	rtMzDb5D6DHbv/L8OcaUn4cPPm+cHGMCgjd/D3yQ9P9EnKtbMytijsbHhgyElzodK9R8o1Ub/sId7
	otfReXd35CPhSBtqhc7CBEHT4O9lKYtDmkuB4ZEWyEPZnMgyHVwSdVLFsZRD1VRQf8DXiI9AnojOM
	o/JDUIMwnU2ZONUM5rFg/r2hoDEF0zgIl+838k+jFJkE2/EicjWRENHdWAD1C/2OJ0cIG1nb087aD
	JfHavYNwTOmx/T/+VUsHQmbsjNYYfPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghFJG-0008GU-8e; Wed, 09 Jan 2019 14:58:22 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghFJ5-00086c-3U
 for linux-i3c@lists.infradead.org; Wed, 09 Jan 2019 14:58:12 +0000
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 2E4D524E14FB;
 Wed,  9 Jan 2019 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1547045888; bh=8AwVsi0qvDh+rgfT/vt5PEcypnkBnL+xnltrtMhWZ58=;
 h=From:To:Cc:Subject:Date:From;
 b=WgtjT2mI++7WIiNvanUutiM6QDliwTE5Ht3N/zWRSNsNxl29v1RA1kD6ENb36zuyK
 bjPUSGydPseuD8uwPLXI4L/FABknfHUl7a1za6nf1bTSmfePB97Ht3GOfL1a8WUCi3
 ChY0xgZkPFXHXRQTCCI7O1cExelm7BGwVQUZkVzLKVkZrQ0NqE7PBdD6r6P7yfkYD0
 YRVwaLBbSU/tNhBp7k8yppoeGqsJBsu2RPiLQjUBHJl98Sd2ism+gBoGJAwJAKR39e
 hPdQGs8v1u9rKACe4Mbv4JIuMb8EEOJGb2DaH/VqYfmOm69e34XE7LDMq3DKzJ/aZe
 0I26dWhvx5w9w==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4159157E7;
 Wed,  9 Jan 2019 06:58:07 -0800 (PST)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: master: dw-i3c-master: fix i3c_attach/reatach
Date: Wed,  9 Jan 2019 15:58:05 +0100
Message-Id: <2e33e1f72db978f77ced019ae085c972050ca4e9.1547040890.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_065811_147978_390AC635 
X-CRM114-Status: UNSURE (   9.21  )
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

This patch fix i3c attach/reatach functions.

During the i3c_attach the driver doesn't threat the static address used for
SETDASA CCC command.

During the i3c_reatach the driver doesn't update master->addrs[data->index] with
new address if old_dyn_addr = 0.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index b532e2c..b84acbc 100644
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
+	master->addrs[pos] = dev->info.dyn_addr ?: dev->info.static_addr;
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
