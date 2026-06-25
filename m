Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A95CDB47C
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Jun 2026 03:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qs3K3xTvl+UZK/ih/f0y0a4kemK0MxE4+AaRk+QLsN4=; b=vVItP58bT7GLdT
	tHCUjkHOqYI/c6xb+Gs4NtLmisb0IXgDXJ5BEKRg4zmAb9sZ671R/637QpjL3HmNjQsUjfGVwlZu0
	RYcoZ0ZyItveV639C5/colXuqR7tfKFdx9OKonWevhZ5i5nTzJqcE30dFl1dYKD8HcOvZh70yZTMR
	1B8aXJa+mQ/n0CbeQ87It3FVv+4ewIgs3pf5y+llTxOR/aJ6mZjs4tZBqS3ife96mTijlkoXIFZO7
	8NnGuIXKEvolPVxB9cmsTNU5GTEhGCFG5zwK3537qaTMOUXP0ay3XiX9nRv+0mtewttTMKnf4IK1D
	LIv9f7l3wXpbWE5R4wfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcaNt-00000008bLr-2lJJ;
	Thu, 25 Jun 2026 03:04:09 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcaNr-00000008bKq-1u12
	for linux-i3c@lists.infradead.org;
	Thu, 25 Jun 2026 03:04:09 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAC3Usukmjxq41EkAw--.38511S2;
	Thu, 25 Jun 2026 11:04:04 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] i3c: master: renesas: reset xfer status before each wait
Date: Thu, 25 Jun 2026 11:03:57 +0800
Message-ID: <20260625030357.87402-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3Usukmjxq41EkAw--.38511S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWrZr4fXFW7Ww48Wr4rKrg_yoW5XFWfpa
	1UGr45tF48GF4vgF4UCr93Zas5A3W5KryIka1Sg3Z5Cryvvr1qkF1YvFWSyr13uFW8Jryj
	yFWjkw4UC34rAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjMqcU
	UUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_200407_869882_08DE92E9 
X-CRM114-Status: UNSURE (   8.59  )
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

renesas_i3c_wait_xfer() reinitializes the completion before queuing a
transfer, but it leaves xfer->ret unchanged. After one transfer completes
successfully, a later timeout can therefore reuse the old zero status.

Reset xfer->ret to -ETIMEDOUT before each wait, return the transfer
status from the wait helper, and propagate it from DAA, CCC and private
I3C transfers.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/i3c/master/renesas-i3c.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f39c449922ca..7f123cd72cdf 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -433,15 +433,18 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
 	}
 }
 
-static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
+static int renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
 {
 	unsigned long time_left;
 
+	xfer->ret = -ETIMEDOUT;
 	renesas_i3c_enqueue_xfer(i3c, xfer);
 
 	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
 	if (!time_left)
 		renesas_i3c_dequeue_xfer(i3c, xfer);
+
+	return xfer->ret;
 }
 
 static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
@@ -687,7 +690,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
 		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
 
-	renesas_i3c_wait_xfer(i3c, xfer);
+	ret = renesas_i3c_wait_xfer(i3c, xfer);
+	if (ret)
+		return ret;
 
 	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
 	newdevs &= ~olddevs;
@@ -800,9 +805,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 		}
 	}
 
-	renesas_i3c_wait_xfer(i3c, xfer);
-
-	ret = xfer->ret;
+	ret = renesas_i3c_wait_xfer(i3c, xfer);
 	if (ret)
 		ccc->err = I3C_ERROR_M2;
 
@@ -815,7 +818,7 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	int i;
+	int i, ret;
 
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
@@ -854,7 +857,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
 		}
 
-		renesas_i3c_wait_xfer(i3c, xfer);
+		ret = renesas_i3c_wait_xfer(i3c, xfer);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.50.1 (Apple Git-155)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
