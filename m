Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E577CE79A5
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p8ciH+DNqDEkjwRleZ/55/bGA9tZ3ghEk8pskDGPI54=; b=e27RzXN0+OrWhB
	HGiaxBfo80WvhU6ITyujgY8czXjtrNH75CN9pVfSNka5O/+2GjRxc31mDLTD1+//u65/T8Iyl48OD
	KKQ+6xGtaFfxq/URozTaMKRcBlw80E2IqIrYYMgN/9Oq2UbblZYq3yeOz7PYVrG+XymmsXmVXYphY
	+DV2paWNBqEaJVbAkTScIt1ox5jxpgUWFyg+jK+2V/+drYHIMjZxT0VY/XDUrzjrbgFPRnyMwBsjx
	a2Kszq8CRJM44eKP+1AIcbInl2XXkgDIsftg2alfLWBxkKj/gyWjycutAeuoffDABhdVvBG/x84Iq
	qXeQWmjM+ndcYajrrlbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktIg-00F4eZ-2T;
	Mon, 25 Sep 2023 21:39:30 +0000
Received: from mail.zju.edu.cn ([61.164.42.155] helo=zju.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEzO-005UDH-0P
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 08:24:48 +0000
Received: from localhost.localdomain (unknown [10.192.154.10])
	by mail-app4 (Coremail) with SMTP id cS_KCgCXD8+r_Qtlv_KOAA--.42236S4;
	Thu, 21 Sep 2023 16:24:16 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs
Date: Thu, 21 Sep 2023 16:24:10 +0800
Message-Id: <20230921082410.25548-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgCXD8+r_Qtlv_KOAA--.42236S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1UWFW5Xr1kAF47Zr4xJFb_yoWfJFg_Kw
	48ZrWvqr4rCr40kr1YgF45ZryIkF90grWIkFW0qF1fW3yFvryDWw15XF4UAa45uay3AFnr
	AryDKrs5C34fCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb28Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280
	aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
	x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgYRBmUAdB8q6wAgs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_012446_489597_D5C148C2 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 25 Sep 2023 14:39:30 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

put_device() needs to be called on failure of device_register()
to give up the reference initialized in it to avoid refcount leak.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/i3c/master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 87283e4a4607..0e9ff5500a77 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1525,9 +1525,11 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 			desc->dev->dev.of_node = desc->boardinfo->of_node;
 
 		ret = device_register(&desc->dev->dev);
-		if (ret)
+		if (ret) {
 			dev_err(&master->dev,
 				"Failed to add I3C device (err = %d)\n", ret);
+			put_device(&desc->dev->dev);
+		}
 	}
 }
 
-- 
2.17.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
