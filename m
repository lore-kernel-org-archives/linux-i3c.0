Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32437C07352
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Nov 2023 09:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5q4vK8oK0fJ+Pmg1c21iJ9KyaWz3xy6KcnvyilwfKLM=; b=ds0+FdiaciXV0v
	61uN9XnCErdH0kVt1G9bXM9DVAQg8KYZSpyymyxjydTKo+rCXJftRya3T/8+BHJqPm0uoaOaxSmO4
	fot/p3TdZA3vWnSvvALr05K7MLzTdD11pB6GGnqis4f7BlQClA6zYMfdznXVSUdAtdcxoWcCaKFY2
	6cuDUFfGrGxlH2dVxWDluEraZiJkdyLkWb/8rfKHtgB7YYNL3+IzE9XIw4uYa6OFF5cOXNhLyp9OU
	YXxKHX6Z5TTJnwU+w1fX8j09ZZhCTf28YniuVFjsCihIzi2ug/EQUFrE2AxQjwmEwUXJ7zQ63u0b5
	O2GH6I5fLHevC6da8exQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2T1T-00DXjP-2z;
	Mon, 13 Nov 2023 09:14:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ARv-00CPAp-1l
	for linux-i3c@lists.infradead.org;
	Sun, 12 Nov 2023 13:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 484E8CE0ECB;
	Sun, 12 Nov 2023 13:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5FFC433CB;
	Sun, 12 Nov 2023 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795463;
	bh=xaTo4/rQUf+2BsXc+915yJ1k0HsoSTYI/lTE7GmUkQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrhy78PZzq6QP5oBjmylHRUPHgscAkOQ9GZ43LobPKPEmGNLkjyCt60mD/EzU2phj
	 VdWH8jJeuDo0ZGY1Y5QM9Ysl2f8hfSNC/t4N+k52MqLDbZYj2ExWUONB9uMa4rqLOh
	 kaAeW+4xxSKjbx2yGKmDBUjTDTrK2LX818XjsCJI9MCF9ivZwVKqZ/2I9QrfPiJlQp
	 rxnSFLYjz/p2ZPaJnjhDhjen42Gu+FmuNanG3RbmQLU4fdOw69xJNEcLfBt/XVLhRU
	 gKDYEIq7z0dQgThJCKiyV3gm5rzegcBK3fFc1zCQhuoymeyd+yxxVzSoG8lo/Q7Fcn
	 OvUek0B4pVgsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 6/6] i3c: master: mipi-i3c-hci: Fix a kernel panic for accessing DAT_data.
Date: Sun, 12 Nov 2023 08:24:01 -0500
Message-ID: <20231112132408.174499-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132408.174499-1-sashal@kernel.org>
References: <20231112132408.174499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.62
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_052427_926778_3EA1FA05 
X-CRM114-Status: GOOD (  12.30  )
X-Mailman-Approved-At: Mon, 13 Nov 2023 01:14:21 -0800
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

From: Billy Tsai <billy_tsai@aspeedtech.com>

[ Upstream commit b53e9758a31c683fc8615df930262192ed5f034b ]

The `i3c_master_bus_init` function may attach the I2C devices before the
I3C bus initialization. In this flow, the DAT `alloc_entry`` will be used
before the DAT `init`. Additionally, if the `i3c_master_bus_init` fails,
the DAT `cleanup` will execute before the device is detached, which will
execue DAT `free_entry` function. The above scenario can cause the driver
to use DAT_data when it is NULL.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Link: https://lore.kernel.org/r/20231023080237.560936-1-billy_tsai@aspeedtech.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 29 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 97bb49ff5b53b..47b9b4d4ed3fc 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -64,15 +64,17 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
 		return -EOPNOTSUPP;
 	}
 
-	/* use a bitmap for faster free slot search */
-	hci->DAT_data = bitmap_zalloc(hci->DAT_entries, GFP_KERNEL);
-	if (!hci->DAT_data)
-		return -ENOMEM;
-
-	/* clear them */
-	for (dat_idx = 0; dat_idx < hci->DAT_entries; dat_idx++) {
-		dat_w0_write(dat_idx, 0);
-		dat_w1_write(dat_idx, 0);
+	if (!hci->DAT_data) {
+		/* use a bitmap for faster free slot search */
+		hci->DAT_data = bitmap_zalloc(hci->DAT_entries, GFP_KERNEL);
+		if (!hci->DAT_data)
+			return -ENOMEM;
+
+		/* clear them */
+		for (dat_idx = 0; dat_idx < hci->DAT_entries; dat_idx++) {
+			dat_w0_write(dat_idx, 0);
+			dat_w1_write(dat_idx, 0);
+		}
 	}
 
 	return 0;
@@ -87,7 +89,13 @@ static void hci_dat_v1_cleanup(struct i3c_hci *hci)
 static int hci_dat_v1_alloc_entry(struct i3c_hci *hci)
 {
 	unsigned int dat_idx;
+	int ret;
 
+	if (!hci->DAT_data) {
+		ret = hci_dat_v1_init(hci);
+		if (ret)
+			return ret;
+	}
 	dat_idx = find_first_zero_bit(hci->DAT_data, hci->DAT_entries);
 	if (dat_idx >= hci->DAT_entries)
 		return -ENOENT;
@@ -103,7 +111,8 @@ static void hci_dat_v1_free_entry(struct i3c_hci *hci, unsigned int dat_idx)
 {
 	dat_w0_write(dat_idx, 0);
 	dat_w1_write(dat_idx, 0);
-	__clear_bit(dat_idx, hci->DAT_data);
+	if (hci->DAT_data)
+		__clear_bit(dat_idx, hci->DAT_data);
 }
 
 static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
