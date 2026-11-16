Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D33606A31C
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Nov 2026 03:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wqy6eYBk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=R7sLG4T9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=itj8aOVP4VjiqjEJhZR22OEOOeVxXvArT1NljKPP06U=; b=wqy6eYBkP4mrEAYXnCjnGtmWIv
	uvUasAHOLgzgVxaXvCFQUv+n2j+rcCdzQM6RPrL/0KUZA/rfi4EG0Of+ZVtY/KU2qCahl57+KWxqP
	H69TXqFDcdpv3wETbXA81sWi9MSy/QAvFht1lKN8t04he9bbz6z5LEHuuISi6UZ8IOxgLBYw34Jjy
	iDjTb83rDN8MPd0G+uNfcS8cAl3qSqNmmM5peihb8T4S4EFL3jQ1266BzhVzl/gklXUtPOMeQ92xh
	LJ3cqBnrROq0H81JJxo1iA71H7kRfiZzlkeZjPOn4aadX5PZ1E3I/5NejXK4kd0WJd95xna9yaiKj
	dd4JNW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnoG-00000001539-3FNW;
	Mon, 16 Nov 2026 03:55:12 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnoC-0000000152U-3Ksv
	for linux-i3c@lists.infradead.org;
	Mon, 16 Nov 2026 03:55:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XVo8cX/ZclE2JZLJ5Sy4t7M6wxCXh5CPKIlg5JJkfRI=;
	b=R7sLG4T9vY049yplmjnT6eRystNU87CIO2ZCQLt+aQXGzOQlCmADTVHSxbU6wvUSHp9FGtCUF
	ZdY0OpNctAk7BW91JZ/ymjVka4sZSTT7t8+ilaMcOvTGrKFfLDRdbudEUJn+S2sSzMK7JTVuSYT
	LTkTzqbkQdVVovu5MIdlxoY=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jSYrs35q8z1T4Fp;
	Mon, 16 Nov 2026 11:54:21 +0800 (CST)
Received: from whupemk300003.china.huawei.com (unknown [7.152.185.49])
	by mail.maildlp.com (Postfix) with ESMTPS id EB55B40561;
	Mon, 16 Nov 2026 11:54:57 +0800 (CST)
Received: from huawei.com (10.50.87.204) by whupemk300003.china.huawei.com
 (7.152.185.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:54:57 +0800
From: Zhang Yuwei <zhangyuwei20@huawei.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, <chenjun102@huawei.com>
Subject: [PATCH] i3c: master: Skip IDR cleanup if bus ID allocation fails
Date: Mon, 16 Nov 2026 11:53:17 +0800
Message-ID: <20261116035317.132490-1-zhangyuwei20@huawei.com>
X-Mailer: git-send-email 2.22.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemk300003.china.huawei.com (7.152.185.49)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_195509_303518_52065315 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 9d4f219807d5 ("i3c: fix refcount inconsistency in
i3c_master_register"), an i3c_bus_init() failure is handled by dropping
the initialized device reference. This invokes i3c_masterdev_release(),
which unconditionally calls i3c_bus_cleanup().

However, i3c_bus_init() only assigns the bus ID after idr_alloc()
succeeds. If the allocation fails, a zero-initialized controller retains
a bus ID of zero, and i3c_bus_cleanup() removes ID zero from the IDR.
If another bus owns that ID, its mapping is incorrectly removed, allowing
the ID to be reused while that bus is still registered.

Initialize the bus ID to -1 before attempting allocation and skip IDR
cleanup when the ID is negative. Keep the put_device() error path so that
the device reference and firmware node reference are released normally.

Fixes: 9d4f219807d5 ("i3c: fix refcount inconsistency in i3c_master_register")
Cc: stable@vger.kernel.org
Signed-off-by: Zhang Yuwei <zhangyuwei20@huawei.com>
---
 drivers/i3c/master.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9928c5dffb5b..39363c097682 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -523,6 +523,9 @@ static void i3c_bus_init_addrslots(struct i3c_bus *bus)
 
 static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
 {
+	if (i3cbus->id < 0)
+		return;
+
 	mutex_lock(&i3c_core_lock);
 	idr_remove(&i3c_bus_idr, i3cbus->id);
 	mutex_unlock(&i3c_core_lock);
@@ -532,6 +535,7 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
 {
 	int ret, start, end, id = -1;
 
+	i3cbus->id = -1;
 	init_rwsem(&i3cbus->lock);
 	INIT_LIST_HEAD(&i3cbus->devs.i2c);
 	INIT_LIST_HEAD(&i3cbus->devs.i3c);
-- 
2.22.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
