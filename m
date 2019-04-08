Return-Path: <SRS0=LM0f=SK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B366C10F14
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Apr 2019 23:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08767206C0
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Apr 2019 23:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="StJ86CLb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Dd5p3X7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08767206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=184DpA6jkACC1Hk5rwVwgYo7u8X2wOF5A+3ZAqoXnHc=; b=StJ
	86CLbU6NV0TsS7RdYf1Cz+lOhYZ+pJ/YaEiMmCBXN5YBEsPmnIomzaLvg1XuCwY0Vm1aUNqPz1N6f
	AYA8IixSDZ6RRsyUY8YROdWpk2y+pxitHBIpAsv3VZ0L4e77xg3GfBOI6SNccBEBCILFzP079MxGg
	hd71IIJqwTOHYS1tcCel8rVWqmJVoyNTWXU7zCpvia3fBEJEARR9gMMpUmNbKFML9FDAXk1S4L5FK
	/OETs3OX/nCu3N1ULEDiiL3Dk4Zvdq+Rd9qh/DQS/N7E/spBkHyCFOIH8EVAjKwJuT85zKPKYOHXc
	QxM7l3U4vSNw2khtAeLhaDcshzBr09w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDdZO-00087o-Hn; Mon, 08 Apr 2019 23:20:54 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDdZL-00087S-CK
 for linux-i3c@lists.infradead.org; Mon, 08 Apr 2019 23:20:53 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id D937C10C154F;
 Mon,  8 Apr 2019 16:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554765648; bh=Q2Otr1EuOF+LzU7O4g8np3htvxKlIQoa5LQV04MBFs0=;
 h=From:To:Cc:Subject:Date:From;
 b=Dd5p3X7p8Hgl/6D01yOhJQKRYM/Sn/o9evXiY+dr1r1EJXIKUt6QNNxb1cwkoza1z
 8tmQnS/g4xOSfzj4GnpgggcDIvZMvTRgBZWkeMBFG4Tsw594U+7Q85wPSt9DJLljTZ
 PbXOOrdjMS5NW/VfKMyxDxqEL5+xUDRMBRJ/72RYei7oiYbtIqUFsIu1SYWSf5itxa
 z6/sPF9JsqJvnEgMia243UnIjN3e/r9ceYOcb9OOUc/6YFu76lDlcg4NGAzrNbXyuf
 KAd8/cnTHfshV3s8XxtrR9WZokKY5qmoe46mnsTgwPsZ2a0cajJ6lHi/VhsOMgpO8N
 YYyxZzb2X5FWw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id 8E6855D15;
 Mon,  8 Apr 2019 16:20:47 -0700 (PDT)
From: Vitor Soares <vitor.soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v3] i3c: dw: Fix dw_i3c_master_disable controller by using
 correct mask
Date: Tue,  9 Apr 2019 01:20:44 +0200
Message-Id:
 <72bc802eb51555b8cf33595a87e06940e367777c.1554721267.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_162051_429418_B8FEBBF5 
X-CRM114-Status: UNSURE (   8.28  )
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
Message-ID: <20190408232044.E5-AnPWcygTGPuKoaNkrSiWWlz8xTaDrhIGcjSfJXII@z>

The controller was being disabled incorrectly. The correct way is to clear
the DEV_CTRL_ENABLE bit.

Fix this by by clearing this bit.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>

Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <stable@vger.kernel.org>
---
Changes v2 to v3:
  Add Fixes tag

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
