Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65075C433EF
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Nov 2021 22:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H4eX1SLfdZm/qUiOA422S7HXZbax4z1lrnVphS/JPqo=; b=Czp9ykJwq6/x3h
	8pvt5UyUen8DaKjtyhYNyXXUWz7T5jgvQkSI9i+MBUhysQn1x2oKdhu8kOBh8WJ+Lo7zxGF1asHZM
	6NJjb+p+hR9D0drpQw+kBGtrvHXZHM4I2MUuNi/lvIWgRbVCVa37U3KMAYYQHu4BgLveCR3M6qD6N
	54duzJa/uksqCmB/ab+lspaq930p94d4EOhHvw6CmBBkztRRxBtCeI1HbwKHGBLXJzEOwh5xslsqy
	7wkeFLTQF4/xyQN2bvgy4LHYmE21kTZ59Ndf06MgaGllnMBL+mrpdQJHWhnHTQN/jIxuaUNSJSwU4
	irLTjsVa3nyb/ZUoa7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCgV-00BjHH-KM; Fri, 19 Nov 2021 22:48:43 +0000
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnT3i-006OHP-H7
 for linux-i3c@lists.infradead.org; Wed, 17 Nov 2021 22:05:40 +0000
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id nT3VmkJwwf6fnnT3Vmnq7e; Wed, 17 Nov 2021 23:05:27 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 17 Nov 2021 23:05:27 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexandre.belloni@bootlin.com, npitre@baylibre.com,
 boris.brezillon@collabora.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i3c/master: Fix a potentially infinite loop in
 'hci_dat_v1_get_index()'
Date: Wed, 17 Nov 2021 23:05:23 +0100
Message-Id: <0cdf3cb10293ead1acd271fdb8a70369c298c082.1637186628.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_140538_790967_BD2C5BB7 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 19 Nov 2021 14:48:41 -0800
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

The code in 'hci_dat_v1_get_index()' really looks like a hand coded version
of 'for_each_set_bit()', except that a +1 is missing when searching for the
next set bit.

This really looks odd and it seems that it will loop until 'dat_w0_read()'
returns the expected result.

So use 'for_each_set_bit()' instead. It is less verbose and should be more
correct.

Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Speculative fix. Untested.
---
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 783e551a2c85..97bb49ff5b53 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -160,9 +160,7 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
 	unsigned int dat_idx;
 	u32 dat_w0;
 
-	for (dat_idx = find_first_bit(hci->DAT_data, hci->DAT_entries);
-	     dat_idx < hci->DAT_entries;
-	     dat_idx = find_next_bit(hci->DAT_data, hci->DAT_entries, dat_idx)) {
+	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries) {
 		dat_w0 = dat_w0_read(dat_idx);
 		if (FIELD_GET(DAT_0_DYNAMIC_ADDRESS, dat_w0) == dev_addr)
 			return dat_idx;
-- 
2.30.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
