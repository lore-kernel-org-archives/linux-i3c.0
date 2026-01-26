Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2014CC88E6B
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 08:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eI61kQxbUhBYEtBXwCEDCvy3irqVUuep+G+L+URdMb0=; b=gxKt104giHkSiO
	iGxoa/kOJ+/dI4miXWH/BrWV7Ny+/616scO4RHJ9JlN4vlQ5rGZrZ5HtWu5brSog/rn8ZmjRnzczu
	8472hgpeYCkQGct5KC4tC1EbAQJKZ3eUZXakVcIzMhrrF7Jhw3vziz1tR/cq9ct92tGGeXRZ3ROxY
	iwuAI0dTDvEZR1kUGXoJpdFplsT/pX1+3VsZizLQqznhRMfjGPGoTzMmjbV7THdLxUC75h8P5ZAo0
	lMrkty564r1hNuy+Vtw9f4egjZdUx1yq5DzBZBDSVI9sWf3AXwZ7HpIRNYmK/OL+ld2H4xCUIg+yB
	VKMij3WLK/LOnxS+OUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHhM-0000000C5WP-3SuD;
	Mon, 26 Jan 2026 08:11:48 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHhJ-0000000C5W3-3MFs
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 08:11:47 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [81.31.232.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31f72b0f2;
	Mon, 26 Jan 2026 16:11:31 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	aniketmaurya@google.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
Date: Mon, 26 Jan 2026 08:11:21 +0000
Message-Id: <20260126081121.644099-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9bf95ba17a03a1kunm11aa4cf6131075
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ00ZVhlMHUIfGB5JThlOTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlDSlVISlVJSElVQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=RcfzYdw+5oaxnCcgnl63gEYZ+kk4cohfcbjtUhTQwDbHrpRBnXzAjykR5y/xIZwhDXOdTuAdljo6h3s/8dRkESWFQOr+M8bgK1e93hhgBvvUBAn/6wPBOsbORcQyGMYIhdxdn+3ZeS8qgUUuCe9qcTNWQUcGLXfXcKbOhQeUMis=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=7LRJaJGzkQ6sYAkEFSwZ70mpAwxcvUV07CkXsrSmy7k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_001146_082195_59B0FFDE 
X-CRM114-Status: UNSURE (   7.71  )
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

The dw_i3c_master_i2c_xfers() function allocates memory for the xfer
structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
fails, the function returns without freeing the allocated xfer, resulting
in a memory leak.

Add a dw_i3c_master_free_xfer() call to the error path to ensure the
allocated memory is properly freed.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 889e2ed5bc83..3e6f66dff2ec 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1099,6 +1099,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		dev_err(master->dev,
 			"<%s> cannot resume i3c bus master, err: %d\n",
 			__func__, ret);
+		dw_i3c_master_free_xfer(xfer);
 		return ret;
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
