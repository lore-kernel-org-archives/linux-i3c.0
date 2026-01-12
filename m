Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F220D25030
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Jan 2026 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AKofthOZ5IIGtVwtfYcFtdHMu5PJefyI/yJVSUHgvKU=; b=mz2FBwbWVIbOU2
	EPfLGmo+RL9nwi8zcPOWCfUHIprWHNdbpXOZZ2VT0DdCD1xPlaoi61W7R3OMHncfVZlrEt8wenXZS
	ZgpBG/fPR2nyE5yYluHK4Toc9BoVuVJ2qfOYQWsdBzRUVpW5w3e6TqxshDnJySqkAENmzQ3yYq3X0
	TTwiJMPnyeSFMK/7bA7YmMJRGBVEEupXG1zG6SntKmTiebf6cGV/LNXrtuMljxySQWsSZSa46xvfQ
	CvsQJ09qfGwejaftv9miJaeX4cTF40rKqUE9PpCVw5bKYwTRR04OA1jPBRjSbFPSxRONA3qXck3xP
	R/ADIVKURaOGZL4D5Mog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfB5U-00000004oDp-41vd;
	Mon, 12 Jan 2026 06:07:36 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfB5S-00000004oDH-0SMG
	for linux-i3c@lists.infradead.org;
	Mon, 12 Jan 2026 06:07:35 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 12 Jan
 2026 14:07:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 12 Jan 2026 14:07:23 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 12 Jan 2026 14:07:22 +0800
Subject: [PATCH] i3c: Move device name assignment after i3c_bus_init
MIME-Version: 1.0
Message-ID: <20260112-upstream_i3c_fix-v1-1-cbbf2cb71809@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAJmPZGkC/x2MQQqAIBAAvxJ7TtBNO/SViBDbag+ZaEUg/j3pO
 AMzGRJFpgRDkyHSw4lPX0G1Dbjd+o0EL5UBJfZSKRR3SFcke8zcuXnlV2hjLDqnNVoDNQuRqv6
 X41TKB9gVJiViAAAA
X-Change-ID: 20260112-upstream_i3c_fix-455a2cc442a5
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Billy
 Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768198043; l=1264;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=0WXuprc6pBXr2YJmG7cWwTjM8gYJby628nouzslXniM=;
 b=oefSr4pEnR2L3qVO4YNRFDDpyEoT6Gj+OSmDy0xOHqw5aQ5Ky73AL6zho4b3hABgXXq1JMfcj
 sqWXB6WmdJNCS15+LEiEBhl93p1idHbn50oFYWHU10adi0EUFxlKASZ
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_220734_177825_73565D0E 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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

Move device name initialization to occur after i3c_bus_init()
so that i3cbus->id is guaranteed to be assigned before it is used.

Fixes: 9d4f219807d5 ("i3c: fix refcount inconsistency in i3c_master_register")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f606c871648..1bc3c9068402 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2881,7 +2881,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
 	device_initialize(&master->dev);
-	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
 
 	master->dev.dma_mask = parent->dma_mask;
 	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
@@ -2891,6 +2890,8 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		goto err_put_dev;
 
+	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
+
 	ret = of_populate_i3c_bus(master);
 	if (ret)
 		goto err_put_dev;

---
base-commit: 9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
change-id: 20260112-upstream_i3c_fix-455a2cc442a5

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
