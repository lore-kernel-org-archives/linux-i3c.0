Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E85C4332F
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Oct 2022 02:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hEXQRdrCNPW6+SPAu/JVUNSNhQ+bkV1VYnnKIT/ZC4Y=; b=pjgcuOHu5Z2fu5
	OSjiCkYm0aRI5fA/XErF/HdUHTfYGZgjUCJnZTXJMQ2F2jVvbAyHOTQWL14redV/NL8OH00dobLD0
	VUKNOud/6NylLsrQKPv9tFwDYCrgG3VSmllS/9bV3suFu+gOouEDcO2EEA4m7w6AJGSFT5GBBMmOk
	uYbSfMZhA1T9fG1yLK/lofKjh0d529sY6cn++7OrKJKj08psUzKcMdaeU2hsVG27ErffuHvOgU2kg
	nMml4u6YtgYzpJIdskDXeo7cz4CuB2/hOoN0EWXVWOx+flAJ55E/wKJo7MALtN+p+E57tTbuiGod/
	M7t/374+ZZPgL3HtB1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBXR-003YM3-S5; Mon, 03 Oct 2022 02:50:37 +0000
Received: from twspam01.aspeedtech.com ([211.20.114.71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclhr-004JYZ-1N
	for linux-i3c@lists.infradead.org; Mon, 26 Sep 2022 10:51:25 +0000
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 28QATohO057043;
	Mon, 26 Sep 2022 18:29:50 +0800 (GMT-8)
	(envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Sep
 2022 18:50:57 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 1/2] i3c: master: Free the old_dyn_addr when reattach.
Date: Mon, 26 Sep 2022 18:51:44 +0800
Message-ID: <20220926105145.8145-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28QATohO057043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_035123_389112_159A68FE 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 02 Oct 2022 19:50:36 -0700
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

This patch is used to free the old_dyn_addr when the caller want to
reattach the device to the different dynamic address. If the
old_dyn_addr is 0 the function will treat it as no old_dyn_addr is
reserved on the bus. Without the patch, when the driver reattach the i3c
device after setnewda the old_dyn_addr will be permanently occupied.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7850287dfe7a..6349ce0ce835 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1379,6 +1379,9 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 		i3c_bus_set_addr_slot_status(&master->bus,
 					     dev->info.dyn_addr,
 					     I3C_ADDR_SLOT_I3C_DEV);
+		if (old_dyn_addr)
+			i3c_bus_set_addr_slot_status(&master->bus, old_dyn_addr,
+						     I3C_ADDR_SLOT_FREE);
 	}
 
 	if (master->ops->reattach_i3c_dev) {
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
