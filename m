Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33376C0218C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jan 2025 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JY1dd1XFze7uGZ2qMh5zOof06P15TeHtYYSrWyNWz6M=; b=Y5rJxHhWa4D8Tj
	X0lPwRP+9SgP7Xkv/bQ4I11TAadsY+ft+aR9qJwHIiiNPj+sfUsASHpRpfawgx+5hskBqjlX021hL
	sSuuzCNfW92OaKdj8af0qv8LNDsLep2X/fhvVjEo1+T1bHJo0BMGgWv24ARYxHJoEEQ5sdPL5O9Ep
	z0/17GdqiKxFt8OiMCX0hp/Of7aIfQF328l+F1sMCxp3LlKRmKKYgaHYYHq0EKPbcmRz+LXhWrz4Z
	qlNlTP9g23514Q5CHnsimqM0B66EiR6ARWmORWc0BSTzb20bTnS2GGc6TSAPy5MeOp4zYLT/hiueG
	Q/W3ciOemPfdIliJMi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taC7F-00000007hly-3wb1;
	Tue, 21 Jan 2025 11:08:17 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taC7D-00000007hk0-1tjW
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jan 2025 11:08:16 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 19:07:56 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 19:07:56 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <pgaj@cadence.com>,
	<miquel.raynal@bootlin.com>, <conor.culhane@silvaco.com>,
	<aniketmaurya@google.com>, <billy_tsai@aspeedtech.com>,
	<Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
	<Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] i3c: mipi-i3c-hci: Use DMA-safe buffer for I2C transfers
Date: Tue, 21 Jan 2025 19:07:56 +0800
Message-ID: <20250121110756.214714-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_030815_487299_D9BF9B25 
X-CRM114-Status: GOOD (  10.29  )
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

The i2c_get_dma_safe_msg_buf function is used to ensure safe handling of
I2C messages in HCI DMA mode.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a408feac3e9e..3567cd566339 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -382,7 +382,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < nxfers; i++) {
-		xfer[i].data = i2c_xfers[i].buf;
+		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
 		xfer[i].data_len = i2c_xfers[i].len;
 		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
 		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
