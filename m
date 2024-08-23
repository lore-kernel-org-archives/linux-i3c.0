Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98EDC531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 06:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dQbg+vkDvjtNMe69xhM2q6yuZEckrGsltgRmHlJ9H9o=; b=emEdSZAqHGtpVB
	Gimm0onBMBthUM6CXCM1lKsqiVCoxlr+Ee2uTzjNAIKGCJCwlMUUtqRuewltsf4LPy3JsPw79eO7N
	vNIUV6m57OrhJRxwcU+LePIPGSO8OU4xLiakohWgymrL4GYuujf6/wz/UKmtDZ/eyq+aQDPpvfp3a
	J7nW+W3Dhtq8KAvu7iiOcq7NN7A7gPCfAWofGS+mxybAPiT+sQiu3PyXNqrQXzJfRb2+BxPYBINd1
	glgr1G0VLbQ4mb3h0VDJ562v4a1oSUp9qmtctDpuWUBJCeFAuQAfLpWmt7aiZTue92tbTk5n4oTl2
	3irnSqSQrWCsktujWQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNlE-0000000FRpE-0dJ6;
	Fri, 23 Aug 2024 06:27:00 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNkP-0000000FRY3-3aie
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 06:26:11 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 23 Aug
 2024 14:25:35 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 23 Aug 2024 14:25:35 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <jarkko.nikula@linux.intel.com>,
	<billy_tsai@aspeedtech.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] i3c/master: cmd_v1: Fix the exit criteria for the daa procedure
Date: Fri, 23 Aug 2024 14:25:35 +0800
Message-ID: <20240823062535.3073706-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_232609_912568_679E347C 
X-CRM114-Status: GOOD (  10.15  )
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
