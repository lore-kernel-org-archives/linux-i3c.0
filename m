Return-Path: <SRS0=LM0f=SK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB31C10F13
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Apr 2019 11:14:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F020820863
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Apr 2019 11:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RjqfvaeC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LAMFISyv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F020820863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5OOgg3/tW1f/TrNbXjc9C/cvAtL42AFLLq6IA9ibM3g=; b=Rjq
	fvaeCjma3l2WbI7NxslpPZsOf9u4Ra5Gih7qrg+2CkwrrtmXgPkCcvjazvF+SHKRKu26t2z4sGQrM
	IKNoqJVOIE/CEkmFNaEOey6sQm58xlTiffqjj3ZkFH8A+UhjQrEjk2+1JtSpa3ZBVXdzSeC6Nx1rG
	5mMs0RqzFCapJ9lkA0fuOMmJ1kubPROZ9ct2tXp5GtIgLXvjyXSgTTTz30KjWdLIv8Rgj0HxTR0cm
	4TFVGzkvZ+UgNbRbQx/7ck7K1thj5GHdXe3c51/Z8kJQiE8XbfVOWwqIv/OX6LahCMQWeqJldVtwM
	FKXaJ+gvsw2W12H9+NsjuQzU09lGDTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDSED-0001uN-Ig; Mon, 08 Apr 2019 11:14:17 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDSEB-0001tz-CJ
 for linux-i3c@lists.infradead.org; Mon, 08 Apr 2019 11:14:16 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id DAF2110C1411;
 Mon,  8 Apr 2019 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554722049; bh=X2CXJnXZVJ1jXjm2UfONkSoB2BvCy5dWqEMklkWqNTA=;
 h=From:To:Cc:Subject:Date:From;
 b=LAMFISyvk/MARxD9QS+NE8O9JJj5lkiLVytXo0OrfobBm1Kz1puSwgImfMT/1mEAf
 G2hMV4jhB1phw+PcuLooHMV2jxPXWOg7mjzLcewrKF7e4CJ1Yj1ZiS0s6XBpwA069K
 gEf7RHzNmHw6lofPh/u5qkzrngP42aF2bob/gWEb0jqwsY6qiRjEzbY1LPyLpo5+A/
 FhgwpbzpKzgkCZ7XBlCm1ssg2WB8PHd2Q+hHx9U3P4RSWX8CROeeluAVdpofXL3Dms
 TLNzQmmGlu/aGcmrnJIIPjCtjGLpAOsF1jq4DSmsz11lLjMNoaNIobdamTzgn8KhV2
 /HiKRR+qBPczg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id 9044D5C36;
 Mon,  8 Apr 2019 04:13:38 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v2] i3c: dw: Fix dw_i3c_master_disable controller by using
 correct mask
Date: Mon,  8 Apr 2019 13:13:34 +0200
Message-Id: <72bc802eb51555b8cf33595a87e06940e367777c.1554721267.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_041415_421608_F4AA3D5D 
X-CRM114-Status: UNSURE (   8.14  )
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
Cc: joao.pinto@synopsys.com, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The controller was being disabled incorrectly. The correct way is to clear
the DEV_CTRL_ENABLE bit.

Fix this by by clearing this bit.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>

Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <stable@vger.kernel.org>
---
Changes v1 to v2:
  Fix commit Message
  Add Cc: <stable@vger.kernel.org>

 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 5927922..10c26ff 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -300,7 +300,7 @@ to_dw_i3c_master(struct i3c_master_controller *master)
 
 static void dw_i3c_master_disable(struct dw_i3c_master *master)
 {
-	writel(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_ENABLE,
+	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
 	       master->regs + DEVICE_CTRL);
 }
 
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
