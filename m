Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C1CCD495A
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eXcv7hN4a+RM9Vs/RMt4qCz1ah7Q46IKKYzCpp8W/Y=; b=2qB4RCuvoXsgVq
	9G7YuBpMAJoCU8YUl4CYRWcPcmyygq1v8Oid6t3sKTlziHqhXg9/i+feKZZIXSQzefHyqb3YRIW7H
	5yfAs0z6u1Z0hs9v5qNWsa9oY8F3fkx6wa/eHBjusthPd1RPoVkQHTL3GzveuNqPyotwg5Jl+UJGc
	gSHgFnzSLCHadZytGiL3FrL6QaoT9tfuQeZ8DXJq2OJj+teZyn8YttzimJ5eO97FPO1v4i17CyagE
	ylMC124cYbjOjEh6W0zNByiGJgJbbqMF7gl4/v++Tji2BvWX/B/pFmG1cz5Sw1Lr+cRmuRuKLA3Kx
	RuKfwMfZQvTZ1sL8wDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChb-005DyH-02;
	Thu, 21 Sep 2023 05:58:15 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChX-005DrZ-1d
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275891; x=1726811891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gb5ZLEzIhacXU4uuWImWz0+QTO5VFToCmZ/XNFq97+w=;
  b=fftRppyzk7vi8RIX8HrgQJGC6OWQJuiIXCFiWX2fm1nPedGLNzmHxj6d
   qG5d33zPQUHFKILB3vz88BMfYEp3VdWAMPiHd1IhaepjW9awkMS0N7Vmt
   SelnG9lRECQdvZoDvwqG1ESX4W6nibpRiJTDCLVbx+ihxPG8uSAPY3kLs
   KUhT8PQxGrWgM6RzjYw5VkWtH3p0vtn2DDD3oRkdp1r9Zs3PeII4Fds8N
   Xo4+76WdnZrC/qdws3seAeAkFBWaUnhFNujeSoe4EeJXeDrb+fF9s8Qn0
   EjIUBGy4x4P3iD2eGGpw9i3+B3llp649Ch4WSr5d5AI1nZ6UubMNItpIO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678504"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678504"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771282"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771282"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:58:07 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 10/12] i3c: mipi-i3c-hci: Fix missing xfer->completion in hci_cmd_v1_daa()
Date: Thu, 21 Sep 2023 08:57:02 +0300
Message-Id: <20230921055704.1087277-11-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225811_557180_702848E1 
X-CRM114-Status: UNSURE (   7.65  )
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

Due to missing completion object for the ENTDAA command transfer in the
hci_cmd_v1_daa() the wait_for_completion_timeout() will obviously
timeout even the transfer itself may succeed.

Fix this by setting the xfer->completion to the already initialized
completion object.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 6a781f89b0e4..2b2323aa6714 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -332,6 +332,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 			CMD_A0_DEV_COUNT(1) |
 			CMD_A0_ROC | CMD_A0_TOC;
 		xfer->cmd_desc[1] = 0;
+		xfer->completion = &done;
 		hci->io->queue_xfer(hci, xfer, 1);
 		if (!wait_for_completion_timeout(&done, HZ) &&
 		    hci->io->dequeue_xfer(hci, xfer, 1)) {
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
