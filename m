Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333D5C982CF
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=llJqVeC6XJA3PFq0ujXXY0zmPXDxeQMwtX46d/EjGSc=; b=USlXvCXbdC2nSc
	9Zmp++6zoB356+B0cetPVXtWs5UHL9gIkow8UwkCHPrr3jO6I0aCQLLGQVaRuZEj+FV8XINVOXQZ3
	IQMu3Dvi8cRQc/l/u7xOxn/egPZdl1tszMJwypQFMuZ66x1gGu1+LScleJlTZuV4uadIyLVqEG62N
	Oxxn2Gu+6W22J1wsIlcg9tDtBjozJ+KKn44uEoJbVQ4q9FK7FMA1alOIBuGxQNz2/TcLM9Yzjy/96
	0YosStQUna8SMs42aAd1tEyINKM+YK/Kif/3ymeOcKPkxGnXiUkE6OtSm2xFwVJpwA4ufjXV5tWrM
	VqkpjnJmW1Eia/kyoovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sAW-00000009gzn-3fY0;
	Wed, 16 Sep 2026 16:07:32 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sAS-00000009gxb-2Zev
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 16:07:31 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACnETy6vqpqjV5tCA--.44393S2;
	Thu, 17 Sep 2026 00:07:22 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank.Li@nxp.com
Cc: alexandre.belloni@bootlin.com,
	arnd@arndb.de,
	bbrezillon@kernel.org,
	gregkh@linuxfoundation.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] i3c: master: Fix of_node reference leak in of_i3c_master_add_i2c_boardinfo()
Date: Wed, 16 Sep 2026 16:06:54 +0000
Message-Id: <20260916160654.2081795-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnETy6vqpqjV5tCA--.44393S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1rAw4UJFyUWry8tw18Zrb_yoW8XF4rpw
	48GFy5C348XF1xWF48XFyfuFZ0v3Z3trWUKw43Kw17urnxGw10qr1DJ3W0vr1fKryrAryj
	yr45tw4UWa95ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbtxhJ
	UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEMA2qqpO9AQAABsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_090729_019789_282A75B9 
X-CRM114-Status: UNSURE (   7.30  )
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

of_i2c_get_board_info() stores the device node in the board info's fwnode
without taking a reference, so the board info relies on the trailing
of_node_get() to keep the node alive. Nothing ever drops that reference:
the board info is devres-allocated and has no release callback.

Register the reference as a device-managed action of the I3C master so it
is released on registration failure and on controller teardown.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i3c/master.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 23f490a00591..30b3822c530c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2407,6 +2407,11 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
+static void of_i3c_master_put_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int
 of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 				struct device_node *node, u32 *reg)
@@ -2437,9 +2442,9 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	boardinfo->lvr = reg[2];
 
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
-	of_node_get(node);
 
-	return 0;
+	return devm_add_action_or_reset(dev, of_i3c_master_put_node,
+					of_node_get(node));
 }
 
 static int
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
