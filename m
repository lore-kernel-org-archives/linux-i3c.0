Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948FFC3271E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jul 2024 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f/u8J3R80Z5qS/ZEM6RldF27beDVYa0h6xRSuBjG6s4=; b=Kz1fmkwxq75kRh
	B7z9wSenTpr5Tb1xCEiJcZvq3wQ9ulbFPzV1Ik1BCBRrd6jo6cQKDxSBRlWrfJxVa28Amn1wcSjej
	yX7xJYR4m9HUgcawhjUU8xVuh6xwj/1OKCOLl6swPXs1qKOil8sPU0YuCN5qesBa0TMQWFm98UisN
	JVGsSfinRbU+kLzBGa9eQjewmMOqKnHomJNqYjBcI/PHHtg0F+BkH5yCxBbsoBxdLdxKvlTrr2LSJ
	DQCOn1BQn8YmMvqMpj/0dKWgiJCAJ7Td1afGB2uh9HgE5orV98/6G2cWEDDurowrxw5Y5RM7+EXBF
	kFVcxFrXwqDo+osymZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiM0-00000002xJU-13bq;
	Mon, 08 Jul 2024 07:00:04 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQh5M-00000002meF-1Xmf
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jul 2024 05:38:49 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BC3F41A09B0;
	Mon,  8 Jul 2024 07:38:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 85B8A1A168E;
	Mon,  8 Jul 2024 07:38:44 +0200 (CEST)
Received: from lsv03083.swis.in-blr01.nxp.com (lsv03083.swis.in-blr01.nxp.com [92.120.146.80])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9DF57181D0F9;
	Mon,  8 Jul 2024 13:38:43 +0800 (+08)
From: Bhoomik Gupta <bhoomik.gupta@nxp.com>
To: alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Frank.Li@nxp.com,
	Bhoomik Gupta <bhoomik.gupta@nxp.com>
Subject: [PATCH] i3c: master: Enhance i3c_bus_type visibility for device searching & event monitoring
Date: Mon,  8 Jul 2024 11:08:35 +0530
Message-ID: <20240708053835.3003986-1-bhoomik.gupta@nxp.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_223848_558188_A1FCF645 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 08 Jul 2024 00:00:02 -0700
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

Improve the visibility of i3c_bus_type to facilitate searching for
i3c devices attached to the i3c bus. Enable other drivers to use
bus_register_notifier to monitor i3c bus device events.

Signed-off-by: Bhoomik Gupta <bhoomik.gupta@nxp.com>
---
 drivers/i3c/internals.h    | 2 --
 drivers/i3c/master.c       | 1 +
 include/linux/i3c/master.h | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 4d99a3524171..433f6088b7ce 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -10,8 +10,6 @@
 
 #include <linux/i3c/master.h>
 
-extern const struct bus_type i3c_bus_type;
-
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3b4d6a8edca3..a211dc4d25bb 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -342,6 +342,7 @@ const struct bus_type i3c_bus_type = {
 	.probe = i3c_device_probe,
 	.remove = i3c_device_remove,
 };
+EXPORT_SYMBOL_GPL(i3c_bus_type);
 
 static enum i3c_addr_slot_status
 i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 0ca27dd86956..074f632868d9 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -33,6 +33,7 @@ enum {
 struct i3c_master_controller;
 struct i3c_bus;
 struct i3c_device;
+extern const struct bus_type i3c_bus_type;
 
 /**
  * struct i3c_i2c_dev_desc - Common part of the I3C/I2C device descriptor
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
