Return-Path: <SRS0=21jQ=TG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6D7C04AAF
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2019 06:13:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D67B3208C0
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2019 06:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rsZAjTDX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D67B3208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8AYbxg3QxJdPbr5V0w+D6M7d0lZ9g4IRyYv3wCn9fts=; b=rsZAjTDXRFWXsv
	sE74RGq1QFFzi+jhB/jjSe+t1pzc2aWjTLM5UVchusBrAyZasXSo7B0mc0QGnLwK2lyjIBsp++rI1
	1EiqNc/uFNH0O9NA+INQaMc5UqeFmFct1NvS8fxoMnk7S8bDJZp3H2G1wQRpXDA7dS6PMVuPSLat1
	v9I206mJ+oe8eWcYW0jFzLTygQtiVNm10WEnZNUoVyc2MIa/4xQjXtbJYU6bWcAs1TPQY0//s0Mf4
	AcSMadunqTezRnj0D7LuRXsroADk3NS6PvGoTJU8j7sICfZ23mChmD9iszd9Qthgwf/bVRTFsH8eO
	fnSSvtBuQz5gYpOhMSGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNWsY-0000Sq-7e; Mon, 06 May 2019 06:13:34 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMxHN-0001eg-CB
 for linux-i3c@lists.infradead.org; Sat, 04 May 2019 16:12:50 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hMxHI-00035w-5A; Sat, 04 May 2019 16:12:44 +0000
From: Colin King <colin.king@canonical.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: fix undefined behaviour of a shift of an int by more
 than 31 places
Date: Sat,  4 May 2019 17:12:43 +0100
Message-Id: <20190504161243.18879-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190504_091249_546845_AC3DE309 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 05 May 2019 23:13:27 -0700
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Currently the shift of two enum ints by more than 31 places on
can result in undefined behaviour with 64 bit longs. Fix this by
casting the ints to unsigned long before the shift.

Addresses-Coverity: ("Bad shift operation")
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i3c/master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 1412abcff010..752256d4078f 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -385,8 +385,9 @@ static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
 		return;
 
 	ptr = bus->addrslots + (bitpos / BITS_PER_LONG);
-	*ptr &= ~(I3C_ADDR_SLOT_STATUS_MASK << (bitpos % BITS_PER_LONG));
-	*ptr |= status << (bitpos % BITS_PER_LONG);
+	*ptr &= ~((unsigned long)I3C_ADDR_SLOT_STATUS_MASK <<
+		  (bitpos % BITS_PER_LONG));
+	*ptr |= (unsigned long)status << (bitpos % BITS_PER_LONG);
 }
 
 static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
