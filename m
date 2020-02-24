Return-Path: <SRS0=0Txb=4M=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9916C11D27
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 08:34:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEFE2072D
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2020 08:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hACC6uzU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEFE2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6t7GbTr0qMqHR1LVKDQSPwGg3NyXQdfwmxp8C0QfuQU=; b=hACC6uzUW6+vwT
	K099xoRzLmozwoEy0B019GscdE1rAjaMPWwG1AGUsDRkBfykpp2gL5Wqrn/23qxKbq7kiyntkz0f3
	4bMGhXpgOUK3eqV18llISMR+Y8GcX1Od8LwZDciZSOqx5ecjwtH8hQ7yIukatyKSnFRmi9V6DiFKR
	NU+pkdhBNh5GO8QWT1EQ8EnZzzbpvPfHuSz2iG+BNO+FNV9Qek/ejpyw9jtBBL8Sr4EXkmSywpP44
	H5mw8C4BA1cmujDdDodWPbgZ0/vtC7gZlCZl8CLi0vMdqaGTo8vn5YWP7mzKqLoodgnFSygMkT6cm
	EAvbF+mHP0fp9V0fdSGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j69Cc-0006ql-TC; Mon, 24 Feb 2020 08:34:58 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j69Ca-0006qR-4I
 for linux-i3c@lists.infradead.org; Mon, 24 Feb 2020 08:34:57 +0000
Received: from [109.168.11.45] (port=57856 helo=pc-ceresoli.dev.aim)
 by hostingweb31.netsons.net with esmtpa (Exim 4.92)
 (envelope-from <luca@lucaceresoli.net>)
 id 1j69CW-000pN8-1J; Mon, 24 Feb 2020 09:34:52 +0100
From: Luca Ceresoli <luca@lucaceresoli.net>
To: linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: master: use 'dev' variable in dev_err
Date: Mon, 24 Feb 2020 09:34:39 +0100
Message-Id: <20200224083439.3487-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_003456_329410_D04D1C1C 
X-CRM114-Status: UNSURE (   4.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

of_i3c_master_add_i2c_boardinfo() already has a handy 'dev' variable, use
it and simplify code.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f8f896fa0c3..b56207bbed2b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1953,7 +1953,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	 * DEFSLVS command.
 	 */
 	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
-		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
+		dev_err(dev, "I2C device with 10 bit address not supported.");
 		return -ENOTSUPP;
 	}
 
-- 
2.25.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
