Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290CBCD4F26
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jun 2026 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNXLlDbYN7Wy4e7dXNcT8PDzc5p41bd5hnEnOJvV/Eo=; b=MoBzMq4pZXtGJ4
	gskNjrsWbkg5Xm+7LkPskDiGwbRNLqTiEA2BhYitQ4gkLhoyVBb549B18UEYA19WFR2n2DFMtLHiu
	b3hHTj8MR6Cyz+lbnDt1wygR64FNzNR/LpLHw90T9yzsssEOahYR+D/FJmOEP85nQ8NVtGZEn18YX
	0YxLOqbtR5WWpJhH2uiM2m2NkBz3KvhppkTd4IfSj3O2u13BKaft4SYJOk1ddZdH9lzbqmQr9hoh0
	CXELiO+lLOH7NMJT05oL+ALrUaZ/7DlRTRmNxfE+DG1eip+ExbxXkxt3FVQzvEjvPPVvGe0s2IrSe
	2prv6p0wKQ53mTZVsrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuJY-00000005kvJ-39S9;
	Tue, 23 Jun 2026 06:08:52 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuJW-00000005kur-07xq
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jun 2026 06:08:51 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3fADvIjpqf_nJFA--.53251S2;
	Tue, 23 Jun 2026 14:08:47 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
Date: Tue, 23 Jun 2026 14:08:21 +0800
Message-ID: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3fADvIjpqf_nJFA--.53251S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF15Ar47AFWDWw4UZF43Jrb_yoW8Wr18pw
	48KF90krn7tF1UJa18Ga1aqFW5Z3Z0qFyxC3yIywsxurZ3W34qkF17AFy8XrnxJr18Cryj
	yryYyayq9an8Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_230850_443769_692A3DA3 
X-CRM114-Status: UNSURE (   9.55  )
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

svc_i3c_master_xfer() emits STOP or force-exit for the final transfer
and then waits for the controller state to become idle, but ignores
readl_poll_timeout(). The function can therefore return success while
the controller is still not idle.

Return the idle-wait error through the existing warning/FIFO cleanup
path so the caller observes the failed transfer without emitting a
second STOP after the final STOP or force-exit has already been sent.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/i3c/master/svc-i3c-master.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 93805df8a940..93ae6eb1a355 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1488,8 +1488,11 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			svc_i3c_master_emit_force_exit(master);
 
 		/* Wait idle if stop is sent. */
-		readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-				   SVC_I3C_MSTATUS_STATE_IDLE(reg), 0, 1000);
+		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
+					 SVC_I3C_MSTATUS_STATE_IDLE(reg),
+					 0, 1000);
+		if (ret)
+			goto cleanup;
 	}
 
 	return 0;
@@ -1502,6 +1505,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	else
 		svc_i3c_master_emit_force_exit(master);
 
+cleanup:
 	svc_i3c_master_clear_merrwarn(master);
 	svc_i3c_master_flush_fifo(master);
 
-- 
2.50.1 (Apple Git-155)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
