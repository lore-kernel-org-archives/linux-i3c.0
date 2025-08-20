Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41294CA0EFF
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18S8ebtXp1+B4ZdKYyOWwaCOiojEQDnUNKA71opBEak=; b=lFjMWXdU3n1AL5
	Op7S6HJ5yX8znwD/dUmjlGmohQqxRs28SNjQZt0WVpirjumQzJbw9FGOVZbf5qas00phZPpd+jwAY
	uEXKritydZgSpNP8qftyCsqDPa6xKuabRevE8y+17BHFH8djvx98gQU7g0G61FGfO7dQjWe/x8hjj
	JGPDk52iIZ5HFauC2t4Zc/h3hPI6wE0zF2jrX871s1lEqWjJ/WdS8C6jyap+wAimXZr0iX+PmFsII
	YifCXfbxig3jDUdOyAivMNIJK35SSBfsXsuwLTw8UsWfrEDITTCFsMyhFsGHV8ukCaaXn1sg0K5IA
	bcBZjCjdG5SjvkJPk8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohUB-0000000DUW4-47d3;
	Wed, 20 Aug 2025 12:00:11 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh5o-0000000DQkh-2WiJ
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 11:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755689701; x=1787225701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=chnnKCS/jgoeXGXddFxYjGPkRKf9EkiZKCm/bdDaVTA=;
  b=QbCRRWI0+x5fyEC2zOP41TAYgXFVoG/YBZWBKpRVRmyycKdDoDTJxcur
   Vx86DxIbwkJgdH2KE9XPR9MsYX+XzKA4dpTeqlGH7MbscIHU5+7WV5yzP
   RfBzYEFo7MRoRumOmfTzqUPzxkZ3B06jtYc88OfsSPZ2rDdMTgs12EpwL
   mzIzIPyD3NoanYR7rpz6UIkp6RL1ezLUx907SjJgX7GIHp/GxFZEGEAEa
   xtp9eO7bHi/zkWDNni9EdM7flpyOmy8EnxiK/M9eXbcFt7/c41Q4NHfcz
   bSi6++Lnjp9+ddulqwv+ma6lj1Hb7AWxaXez0t+o63nbTXBi4AdW9Xk5U
   w==;
X-CSE-ConnectionGUID: QM66gE6wQGisXmS08xPRUA==
X-CSE-MsgGUID: 9B42W5a9RpuAOo9XLajVRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61590996"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61590996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 04:35:01 -0700
X-CSE-ConnectionGUID: 1A5ub0vySAOeqVzxScrMAQ==
X-CSE-MsgGUID: 0KPtKlZgRXmkyxd4BpQxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168016656"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2025 04:34:59 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 4/4] i3c: mipi-i3c-hci: Use own DMA bounce buffer management for I2C transfers
Date: Wed, 20 Aug 2025 14:34:47 +0300
Message-ID: <20250820113447.2502071-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_043500_689175_EA7EFBB3 
X-CRM114-Status: GOOD (  10.07  )
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
- DMA transfers needs a DWORD align sized receive bounce buffer when the
  device DMA is IOMMU mapped, which is causing needless double bounce
  buffering in that case.

Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
