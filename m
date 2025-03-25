Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E97C3600B
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVMGpUUOI/5Wz3RrcHQljfKPH06GJiRgzt+i4T8qY6A=; b=oylxi+NFnMbrmV
	DqqLoJf/guU0+EpcLPXA8D9ZENcBUOYzs9YVZVAeLz68tLShHh8o0LptoeLzFnjSwRop09KOg33GL
	+IHONfWJDjA4zm8Qj1N3moKicqSJh21QPW81GAK2aFNAU6g9yvWWqiiO8DH1ybpboS0gqRi+VZLfo
	PH829dM8rDB1LoMG8YmoKyqajqPsn5uNKn7exscXD5Tm4VJtuBflqHsdcHTWZzBRqdA4ZzZZ02q3P
	rIjDD1I3slZ0MLOl7TP3dXd0sIj4YBrmoKIdd58BuHRcMLJyJKDe6y7tCKXl27fzk6wH1qWJYD5Wk
	v2CnwWHLKdlN94BbAdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0C-0000000Hb1m-3PMk;
	Mon, 31 Mar 2025 10:04:20 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1Re-00000005Qa5-01u8
	for linux-i3c@lists.infradead.org;
	Tue, 25 Mar 2025 10:23:43 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C4531A0D0A;
	Tue, 25 Mar 2025 11:23:40 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E5D901A0E5F;
	Tue, 25 Mar 2025 11:23:39 +0100 (CET)
Received: from lsv03121.swis.in-blr01.nxp.com (lsv03121.swis.in-blr01.nxp.com [92.120.146.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 907F81800089;
	Tue, 25 Mar 2025 18:23:38 +0800 (+08)
From: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
To: alexandre.belloni@bootlin.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com
Cc: rvmanjumce@gmail.com,
	Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] i3c: Fix read from unreadable memory at i3c_master_queue_ibi()
Date: Tue, 25 Mar 2025 15:53:32 +0530
Message-ID: <20250325102332.2435069-1-manjunatha.venkatesh@nxp.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_032342_176178_50C520B6 
X-CRM114-Status: GOOD (  11.45  )
X-Mailman-Approved-At: Mon, 31 Mar 2025 02:45:26 -0700
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

As part of I3C driver probing sequence for particular device instance,
While adding to queue it is trying to access ibi variable of dev which is
not yet initialized causing "Unable to handle kernel read from unreadable
memory" resulting in kernel panic.

Below is the sequence where this issue happened.
1. During boot up sequence IBI is received at host  from the slave device
   before requesting for IBI, Usually will request IBI by calling
   i3c_device_request_ibi() during probe of slave driver.
2. Since master code trying to access IBI Variable for the particular
   device instance before actually it initialized by slave driver,
   due to this randomly accessing the address and causing kernel panic.
3. i3c_device_request_ibi() function invoked by the slave driver where
   dev->ibi = ibi; assigned as part of function call
   i3c_dev_request_ibi_locked().
4. But when IBI request sent by slave device, master code  trying to access
   this variable before its initialized due to this race condition
   situation kernel panic happened.

Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/lkml/Z9gjGYudiYyl3bSe@lizhi-Precision-Tower-5810/
Signed-off-by: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
---
Changes since v4:
  - Fix added at generic places master.c which is applicable for all platforms

 drivers/i3c/master.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d5dc4180afbc..c65006aa0684 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2561,6 +2561,9 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
  */
 void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
 {
+	if (!dev->ibi || !slot)
+		return;
+
 	atomic_inc(&dev->ibi->pending_ibis);
 	queue_work(dev->ibi->wq, &slot->work);
 }
-- 
2.46.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
