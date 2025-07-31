Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831C7C87FD3
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Jul 2025 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfKeW2d8OuEiSWKWY3gBAH5SafbO4TaE6PP1Gf/RK4U=; b=MheIPNumTydxY2
	l/Nzx+moPYvAOpXe5ay075g8tqRo5wpAjdMlH9GWGwkym5lX4Lr7c7jdx7QMztIZynWM7ZedVXIPR
	5RAyEIqGlwE0VljoeUG98vHFK6HmrZ3qNYBbcBzMOWHl5Q2daJLsuYWyuxw2UH7I3RAFtARoM7V7W
	RzVuSuAr+6cDdZmBVxkCDV4GmAk0rnzEcnn3RaPTv99E2L3aG3q8LRSbwn0HPZFlxmi1qiiHSZOhb
	Zd2AVHQAdSW97knw/OG6S62LqMUFFbOdqlWA0+Z7Mx1RwsGa16zzG7vc2mWhOdDVjFWa4C3gyxohv
	Y6CozPLyFQoRD/bDDEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUgJ-00000003tW1-16OB;
	Thu, 31 Jul 2025 14:54:55 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU3E-00000003ng9-08t4
	for linux-i3c@lists.infradead.org;
	Thu, 31 Jul 2025 14:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753971272; x=1785507272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yiwl2EWrKl7Bhz5uqQvqleFbNzcbK9FiJXxCzY/9XGE=;
  b=lZqlZGfVZ3DO4LYIpLclGje/gdN5VskUMEO76RXpiNQSC88MRlQiv619
   /vqE6l28uaG1WN3g0NFKsrpgYVJEf8O9Rh2lo7ohq0/RB4DVzPHMEEDpj
   9+Dj826fA4OGnTowxNjTGYv3AHS8OlwIHnjVmshBJIanQ3vIwiARyZzEU
   PnNDnoN1ruZBskVUrC6uryr8S4NsK7lpRt2RwDcJZ/xFpgI3uxQxgpvp/
   HHYHQw3tJJPu7AZ7GRvfSeJ3EfFK8/SeudrD7oZ/wKX1+4VQL/6HBFFYX
   3j0oZCoLTHeI3rIi4bx7iRLSnjEsE+VNgZAA9mqLDlXjzKyMPwp8XDnif
   g==;
X-CSE-ConnectionGUID: HjTGuUxbRkG1MpY5C/vz3g==
X-CSE-MsgGUID: 0wpNdGP7TZGzZS8kf0D+Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66990774"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="66990774"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 07:14:31 -0700
X-CSE-ConnectionGUID: ODc70awaSEenbuAabFrYJA==
X-CSE-MsgGUID: RL+RMf9tSdOEoyDrCk6jVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="167451876"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2025 07:14:30 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 4/4] i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C transfers
Date: Thu, 31 Jul 2025 17:14:20 +0300
Message-ID: <20250731141420.422525-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_071432_084199_456ADA10 
X-CRM114-Status: GOOD (  10.05  )
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

Stop using I2C DMA-safe API for two reasons:
- Not needed if driver is using PIO mode.
- DMA transfers needs a properly sized receive bounce buffer when the
  device DMA is IOMMU mapped causing needless double bounce buffering in
  that case.

Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b2977b6ac9f7..7a467ef65787 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -348,7 +348,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < nxfers; i++) {
-		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
+		xfer[i].data = i2c_xfers[i].buf;
 		xfer[i].data_len = i2c_xfers[i].len;
 		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
 		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
@@ -374,10 +374,6 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 out:
-	for (i = 0; i < nxfers; i++)
-		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
-					 ret ? false : true);
-
 	hci_free_xfer(xfer, nxfers);
 	return ret;
 }
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
