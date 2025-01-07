Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741CDE77199
	for <linux-i3c@archiver.kernel.org>; Tue,  7 Jan 2025 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8mqbcxqcFrDTstrYk8JZUdQZCm9K7Jzuz6bqWU8L+c=; b=T7MgxMgbO0/VJc
	2QaeDLRTVp8sS3WwqR2fXbsTAyPS/WDgxJ7bqPXFU2muZSuZVutcGMLZLfqSnnZtWxfdXrlKpCMY9
	xRnHIOdTXA3H6skjGXcrWWsSfMeA35WS1kJEGQQXrDpdtpd71Tym9OXPSqRaTZMDVbdOG01188JgR
	HENsym2qrBBpzxpl/zzs3GcAiLgpuQyrxwxjy3ZSkvRJnajlv7RC5rpynDCkQRTptXV45kckfY7Vc
	7Bzcxszqd7eBsKemS7aYW1uQLkl2cMQZ+qZZ9DXrU6lPfU3H4T4KuSlhWySqsQ8l4fVryayzvWCOX
	ITVUnGOLI6ibsRny7+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Vw-0000000428m-0yEp;
	Tue, 07 Jan 2025 09:04:40 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Tb-000000041Jp-1bwO
	for linux-i3c@lists.infradead.org;
	Tue, 07 Jan 2025 09:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Py0DoMMuciEt40Q+z4uuudYOKUnz5ppwQn4+cYx5ojg=; b=eyDX3q
	TAD+n/EOt+u/Mbevq3q8Gsf4GnKSJAJqyKHhz9//jF1GRu+0GsQ7FjIXQc2+ZL7O
	IZQgyoH0KrmN7meBBEEZxpb8fYhgRQvrZQtM9VK/2YoVG4BE5UITV2BWw1nSYGfq
	VNoDCUBhQJoIVfTfQiiTr/5HkdKElOIGZ3fOM6xn+A1e9UCQQBsA6Jk3Z6+sg0yH
	UE8vqVOy/dQD5A4NoP5RnATZAN1H++JHCfUl3aD0GfyF9EMg0DyIi1kkIjmvcbAe
	WKXCrmW4SRcDOd5siPghYn8PRW835Oc8IghjW0Jh9gF6VWkbGox7e3zaJHpaRiQu
	/gxlFH3uD5S4KwHQ==
Received: (qmail 2125336 invoked from network); 7 Jan 2025 10:02:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:09 +0100
X-UD-Smtp-Session: l3s3148p1@hx36/xkrZpMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 3/5] i3c: dw: use parity8 helper instead of open coding it
Date: Tue,  7 Jan 2025 10:02:01 +0100
Message-ID: <20250107090204.6593-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010216_287277_065C3BD4 
X-CRM114-Status: UNSURE (   9.54  )
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

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/dw-i3c-master.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d4b80eb8cecd..0d4d44458c11 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -251,14 +251,6 @@ struct dw_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
-static u8 even_parity(u8 p)
-{
-	p ^= p >> 4;
-	p &= 0xf;
-
-	return (0x9669 >> p) & 1;
-}
-
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -848,7 +840,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
 	u32 olddevs, newdevs;
-	u8 p, last_addr = 0;
+	u8 last_addr = 0;
 	int ret, pos;
 
 	ret = pm_runtime_resume_and_get(master->dev);
@@ -873,9 +865,9 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		}
 
 		master->devs[pos].addr = ret;
-		p = even_parity(ret);
 		last_addr = ret;
-		ret |= (p << 7);
+
+		ret |= parity8(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
