Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E7EC197BF
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kLQ1ncINWnfM2rvkWo8WQypxUYIgM6J+J7xOV/teGXI=; b=JjEUYDOtxVH0cD
	C6W+E0dJnDQ7gIXuLpzbAm0Zx/5EONt5qTyaeluMZkUeXM7BA1xL8uwktblsZ6+0EpAvZB8sRM7tT
	3kjVj+JpWPLDdSlhHfNuI9bwDfnVTR9Dsh78ex0T6iUgiA1E6dOk1TfCgqTJMym53yF6L93GjnlMi
	cJfaPx2sPOrFJzm3xd3E204XbOUMabnhToc6dlV5AuQ7gCc3WEXOxiDfu3U0wIr/l0QRhLAP1Sn0U
	phWUSCIYYz0Ek6FeCn6BXrI/8T9Opmrir7f6aVq7rL5g3iPeLLysIUIBRrHCQTgaZIwBs45J+k6o/
	BPLgNCW5ez6MPObaEUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnm6e-00000008yQq-33S3;
	Thu, 27 Feb 2025 22:11:48 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmOzy-0000000CDvc-3juQ
	for linux-i3c@lists.infradead.org;
	Mon, 24 Feb 2025 03:19:16 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A7081A0E8D;
	Mon, 24 Feb 2025 04:19:11 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D2AB51A0E7A;
	Mon, 24 Feb 2025 04:19:10 +0100 (CET)
Received: from lsv03121.swis.in-blr01.nxp.com (lsv03121.swis.in-blr01.nxp.com [92.120.146.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 333C91800083;
	Mon, 24 Feb 2025 11:19:07 +0800 (+08)
From: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
To: miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: manjunatha.venkatesh@nxp.com,
	rvmanjumce@gmail.com
Subject: [PATCH] driver: svc-i3c-master: Kernel panic issue fixed
Date: Mon, 24 Feb 2025 08:47:54 +0530
Message-ID: <20250224031754.1001101-1-manjunatha.venkatesh@nxp.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_191915_064631_9367AA6F 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 27 Feb 2025 14:11:47 -0800
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

I3C Master driver svc-i3c-master

As part of I3C driver probing sequence for particular device instance,
While adding to queue it is trying to access ibi variable of dev which is
not yet initialized causing "Unable to handle kernel read from unreadable
memory" resulting in kernel panic.

Signed-off-by: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..98c4d2e5cd8d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -534,8 +534,11 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	switch (ibitype) {
 	case SVC_I3C_MSTATUS_IBITYPE_IBI:
 		if (dev) {
-			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
-			master->ibi.tbq_slot = NULL;
+			data = i3c_dev_get_master_data(dev);
+			if (master->ibi.slots[data->ibi]) {
+				i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
+				master->ibi.tbq_slot = NULL;
+			}
 		}
 		svc_i3c_master_emit_stop(master);
 		break;
-- 
2.46.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
