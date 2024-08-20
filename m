Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5521C5472E
	for <linux-i3c@archiver.kernel.org>; Sun, 25 Aug 2024 01:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YVeCBBWFvsuPObBIX7iWAgu4rGpiDFsa2p/SmqHIyKo=; b=zzQNffjaYltXWm
	0DMDZ4r7ISWDtdud4Qddk7rmOl443cKzVcsM6XrAGr6052QPQGoh7I4WLrldg7DApZPuKkhVmNjCL
	wGMXRERq7RMEZuhvdEYlYekJArckT0S3qPsIFlh806BgHxjDwNMa9d7NRB+7zOVzXBT+deFTU2HBU
	rLaCQXZjXjpuyv/ApP/DOHUBQ78MstJv+rat45RCbs1RvGoVaF7v+D89FEMvIBUS5jTjUpvVmEzSu
	Y5fzaRftkhlWHi4XGMiDd1TCK386bYhgwag3GaDEJupTg/QAojUHiCc/Vn7jv3r4FT+ldvGkrrBcL
	F3uwOoHJNjgCC3rKUXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si1ts-00000003EBF-0Xob;
	Sun, 25 Aug 2024 01:18:36 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgGdU-00000003moj-1ikj
	for linux-i3c@lists.infradead.org;
	Tue, 20 Aug 2024 04:38:25 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F336B1A20EF;
	Tue, 20 Aug 2024 06:38:22 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA0BA1A2113;
	Tue, 20 Aug 2024 06:38:22 +0200 (CEST)
Received: from lsv031045.swis.in-blr01.nxp.com (lsv031045.swis.in-blr01.nxp.com [10.12.176.65])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C2029183DC24;
	Tue, 20 Aug 2024 12:38:21 +0800 (+08)
From: nxf24178 <ravindra.yashvant.shinde@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:I3C SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank.Li@nxp.com,
	nxf24178 <ravindra.yashvant.shinde@nxp.com>
Subject: [PATCH] i3c: master: Avoid sending DISEC command with old device address.
Date: Tue, 20 Aug 2024 10:08:17 +0530
Message-ID: <20240820043818.3352614-1-ravindra.yashvant.shinde@nxp.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_213824_586161_174A2200 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 24 Aug 2024 18:18:33 -0700
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

When a new device hotjoins, a new dynamic address is assigned.
i3c_master_add_i3c_dev_locked() identifies that the device was previously
attached to the bus and locates the olddev.

i3c_master_add_i3c_dev_locked()
{
    ...
    olddev = i3c_master_search_i3c_dev_duplicate(newdev);
    ...
    if (olddev) {
        enable_ibi = true;
        ...
    }
    i3c_dev_free_ibi_locked(olddev);
    ^^^^^^^^
    This function internally calls i3c_dev_disable_ibi_locked(addr)
    function causing to send DISEC command with old Address.

    The olddev should not receive any commands on the i3c bus as it
    does not exist and has been assigned a new address. This will
    result in NACK or timeout. So, update the olddev->ibi->enabled
    flag to false to avoid DISEC with OldAddr.
    ...
}

Signed-off-by: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
---
 drivers/i3c/master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7028f03c2c42..07ccb2c00074 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2042,6 +2042,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 			if (olddev->ibi->enabled) {
 				enable_ibi = true;
 				i3c_dev_disable_ibi_locked(olddev);
+				olddev->ibi->enabled = false;
 			}
 
 			i3c_dev_free_ibi_locked(olddev);
-- 
2.46.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
