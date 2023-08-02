Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AC6C41513
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Aug 2023 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dQbg+vkDvjtNMe69xhM2q6yuZEckrGsltgRmHlJ9H9o=; b=gBHlFzs5mJ6VZR
	NjZHOk/PIqm/SwWMsSwrokIhG3pn2tPaa68TfY7KdcCaP9ht+8495kiq5NeWqIgE27h6VFiq6+9II
	DPNT0dq+9BLKgOBkWYsJBn2W8S4Xhqx8LjaLRO9XZEuoE98ujNAmBMSD6ty+Vnz9p3wiGY4Z8Y+ep
	p0T6aNHRr7dGz6GQFB3M3BmDclVp5ha3MI77Zv4fTzzbnwvDCXzGOcyZtCnpSz6SQK5lrqIWX3KIv
	ujYux6uVk+Bav1YYN53PeMz6WNtuBINCvib3/uDy6WXuOkgLjLHC6YAEuxaqyujcQMSjh70ggcaJ9
	iRffyj9+P23jPBrV6mWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNHb-002iLC-1k;
	Tue, 08 Aug 2023 14:01:59 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8n8-004ZJ2-2i
	for linux-i3c@lists.infradead.org;
	Wed, 02 Aug 2023 10:09:20 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Aug
 2023 18:09:10 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Aug 2023 18:09:10 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <billy_tsai@aspeedtech.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] i3c/master: cmd_v1: Fix the exit criteria for the daa procedure
Date: Wed, 2 Aug 2023 18:09:09 +0800
Message-ID: <20230802100909.2568215-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: Fail (TWMBX02.aspeed.com: domain of billy_tsai@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_030918_903712_5D72B0C7 
X-CRM114-Status: GOOD (  10.63  )
X-Mailman-Approved-At: Tue, 08 Aug 2023 07:01:57 -0700
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

The exit criteria for the DAA should check if the data length is equal to
1, instead of checking if the response status is equal to 1.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index d97c3175e0e2..6a781f89b0e4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -339,7 +339,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 			break;
 		}
 		if (RESP_STATUS(xfer[0].response) == RESP_ERR_NACK &&
-		    RESP_STATUS(xfer[0].response) == 1) {
+		    RESP_DATA_LENGTH(xfer->response) == 1) {
 			ret = 0;  /* no more devices to be assigned */
 			break;
 		}
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
