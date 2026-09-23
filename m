Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C20C982FA
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Sep 2026 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8xS7II8w4P6/aSDOhX5muPs3gwXrAkMFzuZFaulP0d0=; b=DYxxf+kcn/COq6
	4j+L0NkUuXBAnuLtYQZ2osS259Wt9pYVgGmS38PKz86+dDLu2mVmp0QoS7u048ANWgriY/Qxt+chj
	/hQMw3KwEkmZihZ4oOpg0ZDMZ3ykADibc+cKqBSFR1Qxio+Dx7khcyjK8s/qCNIdZX+M3MIy+QrZl
	EurMO0+8QV1YP+LhkpGI3b+uNBu61x3VA/oBJhLvtnGiVZM0zLuTWP5Xr3qAs6d0AVBV27VvDtdJS
	v7PsthdiHrXJrQTyjdlZVF8SF9m6GdbBg1b2oVhbkDXsQ+N4V22NinMP0wpbsZ5WvxxWhqnZiniCd
	jLt4kNZkGo1kuJdd0vpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ikf-00000007cUu-0sjl;
	Wed, 23 Sep 2026 08:54:53 +0000
Received: from fraori-sdnproxy-3.icoremail.net ([132.226.202.154])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IkZ-00000007cQm-3CO5
	for linux-i3c@lists.infradead.org;
	Wed, 23 Sep 2026 08:54:52 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wBXUH_Lk7NqlyoxAQ--.6727S3;
	Wed, 23 Sep 2026 16:54:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app2 (Coremail) with SMTP id zC_KCgAXY8fLk7NqW12WBA--.34014S2;
	Wed, 23 Sep 2026 16:54:35 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>,
	Song Li <songl@zju.edu.cn>
Subject: [PATCH] i3c: master: adi: free the IRQ before unregistering the master
Date: Wed, 23 Sep 2026 08:53:40 +0000
Message-Id: <20260923085340.490776-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zC_KCgAXY8fLk7NqW12WBA--.34014S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?8KVjTwXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI1FG/lD/lmE44/TuyE2gfu15RhSvlRqdn5iLMsVzzySkL90
	jme45YJaF+aFbzuszpKp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW7CFWrWFy3tr4DWr1DJr1fAFc_yoW8ZFWrpa
	18K34Y9FWkJF4UAa1UGa15ZFy5Jw1a9ry7Kw43t3sFgr98JasYyryrJry8AF1fGrWkCF1Y
	yry5tw4Uu398ArcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Xo7JUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_015448_117966_7F1931DA 
X-CRM114-Status: GOOD (  10.53  )
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

adi_i3c_master_irq() is requested with devm_request_irq(), so it stays
registered when adi_i3c_master_remove() runs, and the writes masking the
controller IRQ sources do not synchronize with a handler that is already
running on another CPU. i3c_master_unregister() then frees the
struct i3c_dev_desc objects that master->ibi.slots[] still point to, so
the IBI path in adi_i3c_master_handle_ibi() can dereference freed memory.

Fix this by storing the IRQ number in the private structure and calling
devm_free_irq() after the IRQ sources are masked, so a running handler
is finished before the master is torn down.

This issue was found by an in-house static analysis tool.

Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
Cc: stable@vger.kernel.org
Co-developed-by: Song Li <songl@zju.edu.cn>
Signed-off-by: Song Li <songl@zju.edu.cn>
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/i3c/master/adi-i3c-master.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 6380a38..9b0ee4e 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -115,6 +115,7 @@ struct adi_i3c_master {
 		spinlock_t lock; /* Protect transfer */
 	} xferqueue;
 	void __iomem *regs;
+	int irq;
 	struct clk *clk;
 	unsigned long i3c_scl_lim;
 	struct {
@@ -954,6 +955,7 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	master->irq = irq;
 
 	version = readl(master->regs + ADI_AXI_REG_VERSION);
 	if (ADI_AXI_PCORE_VER_MAJOR(version) != 1)
@@ -999,6 +1001,8 @@ static void adi_i3c_master_remove(struct platform_device *pdev)
 	writel(0x00, master->regs + REG_IRQ_MASK);
 	writel(0x01, master->regs + REG_ENABLE);
 
+	devm_free_irq(&pdev->dev, master->irq, master);
+
 	i3c_master_unregister(&master->base);
 }
 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
