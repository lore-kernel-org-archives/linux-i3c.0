Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58067CD4959
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uef3pN3ybY9FGPyJ5RIbe/kuhewien5Z4iGx3BXIjYs=; b=e7ccurwR8qbrJa
	XXosM3RjkYu9Tv/v3Vf5uOTu1muYVTO9DPPeGyf4wZShXQxVBgtrtn6M/0wFjfaAxLap8vhFODggd
	pIzy1X/Fjn4Y09z1TBnRKNUgtUj9R4DykS+UjIFNYyGXSSrmRGIkug3k9fWGaS28PEmFehoFYxoCT
	fPgmyf/s8/Hc7f1I7G/ZdRDX064l48FogjFb1n5NLYHNM6uCoDYhQVdkYDUXcGZdDur+sKdviQ0LK
	vzOoZ/b3/oEfZCJFhzMH5lhyt55yZ99p3CIUrNfQu9ZTbqUuQwcy2KMoVF0/+QPoXaCeKNXYW3T5E
	x5joWObdCWADxEU7KQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChW-005Dsz-0B;
	Thu, 21 Sep 2023 05:58:10 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChT-005Dqh-1X
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275887; x=1726811887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/SeISXjWIzeIA7EW8mGJyfsIPDJVFu9ZBzVproLzXzk=;
  b=SfTpTt7KfmXkagD1pEi6Ct5luyOI2ehxpsXimnnC6qf+ILnlxvep7Etd
   dfJhIxeg6SV7RnoO1N7tKgORl2H6nCb8slkfgDGPTW4J/MAlpPhAI3DOd
   uv/ZfuRquk/EYuUoaiP2Vmf4ln9CiW27Ir8DqyeYo5g7vet+XcpLUMHmN
   PUYLI1epLV7D8+a4h04xI5+X4p0LV71tEhTtRddFMkQPtotjF7RH1inOY
   4wyUFm8t55DrYb0u9/XDbJ/HOuHkRQXNH5dD/TwsjiQWaUk+5LYnLw5+c
   akZStsc4UxW23q1NbuZsLUoHy3df8xDBmQibvolTDTLc/j+MGMfsj/0uw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678485"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678485"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771233"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771233"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:57:53 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 01/12] i3c: master: Inherit DMA masks and parameters from parent device
Date: Thu, 21 Sep 2023 08:56:53 +0300
Message-Id: <20230921055704.1087277-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225807_523973_448A8AA7 
X-CRM114-Status: UNSURE (   8.25  )
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

Copy the DMA masks and parameters for an I3C master device from parent
device so that the master device has them set for the DMA buffer and
mapping API.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 87283e4a4607..401380c17156 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2629,6 +2629,10 @@ int i3c_master_register(struct i3c_master_controller *master,
 	device_initialize(&master->dev);
 	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
 
+	master->dev.dma_mask = parent->dma_mask;
+	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
+	master->dev.dma_parms = parent->dma_parms;
+
 	ret = of_populate_i3c_bus(master);
 	if (ret)
 		goto err_put_dev;
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
