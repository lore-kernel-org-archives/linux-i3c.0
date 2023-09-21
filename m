Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CECCD495C
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RPtJimTpSVTv6JOmF3HaAcF2/G3MkQII33AkBNYTco=; b=VZANIED0Yl4sxf
	cV3yD7Ps6W0qL8hhkxHWL9Yvu1uRUQ2sJ8zvX/nmRXH+m1QjgcWD752Oam0POmnI4DmzCyhmW1YsJ
	bS96W9VKDtqqdPHoWS+KgRUJpJaWMIP62Q9c46q7eiHMKgwgCp9TmubwYVderr1cGp/O7oevEL78n
	/kYqkEmhRBK2NkHd5RGillG7QKRIDl8W5NJU6YR0MkXhmTowshhpFPf0sMe068YahjTgvPRQQ1KiR
	kNE1MEqNaHj0YpUopzOzoobaW6PV0ctuCkwxKajUNrPTJemOcr6jjg/8eUP5HCLdIOS+Fae4ZZDMi
	uSFhsDg5r39r2IoS8XDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChX-005DvE-2o;
	Thu, 21 Sep 2023 05:58:11 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChU-005DrZ-2a
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275888; x=1726811888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hP+81XG99C4zI6YFJe+jxjjbNgZrxEATM1Ajkd2nx5Q=;
  b=dX4dfg8kE5kZN9gIMqruFw11V4ydhVFFDiqCBqnN4Dw7fo73H9QbkEuB
   LaRBx7AQLHupl8FkMcJi9iCWq4l6a/JVnXbF6mY9XiICj3HMp4KCGkoqg
   JDZQS/TT1kPGwULZU6D7T9S+4OzEhWuapYktWXMHs0Xc8/vHRf1zwqMxC
   //7WTGNN/mzgJAj/O7oh9lO6QB+LtXOIoLD0pKNwLVgyEaU1+CFdkhdyY
   B5/AxoURBANeZ87uyMIySO6hdtJbspP3F/vZKZFFgldimhVfzi8Jcx68S
   2DU51bNKHTSnhfVAR9xGIPCZwvMVMYQ3aj36k3W43yqfCV4F3lI22mCo2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678494"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678494"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771267"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771267"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:58:01 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 06/12] i3c: mipi-i3c-hci: Set ring start request together with enable
Date: Thu, 21 Sep 2023 08:56:58 +0300
Message-Id: <20230921055704.1087277-7-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225808_870009_C4F017EC 
X-CRM114-Status: UNSURE (   8.07  )
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

Set ring start request together with ring enable in hci_dma_init(). This
causes the ring abort request in hci_dma_dequeue_xfer() will raise the
INTR_RING_OP (RING_OP_STAT in MIPI I3C HCI specification) interrupt in
the RH_INTR_STATUS register.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index a28ff177022c..df569d1351be 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -325,7 +325,8 @@ static int hci_dma_init(struct i3c_hci *hci)
 		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
 
 ring_ready:
-		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
+					   RING_CTRL_RUN_STOP);
 	}
 
 	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
