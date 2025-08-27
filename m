Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3610CCA0FED
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhUUcpLfvyaQoyVfBA6BuOAofTjUkmj5JaYa6rAFmhc=; b=JekrX+DlZs1NsA
	4ExdK1RYkEGMrW50VBrAPQp3LHscw9ugYR9eeNH10e8yJOt1C8UHN2EJrsSF483nizdpa6I7Obl20
	Hiy2jA3XNnLuyDLiutulnp3+fAma171sv3llPz9msCbQulN6AdMGm/bdk+1bfDRXrmlV8fR7YFpb+
	3zL3+irZt31X5GIuv5/JgjvNNtVBayYeaLADx5vVPYAT++im+Fo69VDcZk3Jj/Xzyyk7hlk1xC7k8
	LSVKnefl3mj20YRG2gYe8A+liMkSKzZE+h874g6lf8vZ3ZobHADs1glWuQw3WMFF99UmB2GMy7PtH
	TyYcWl3fIQDHH0Crn3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE2Y-0000000FDPC-3ZME;
	Wed, 27 Aug 2025 11:10:06 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDQ1-0000000F4fD-1ejd
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 10:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756290617; x=1787826617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PnJrnDm43g9QKg3IimkF2lpAvTrtXFE5ob3dS695OlA=;
  b=dZfAv1V35Id5sipLQLJAzwsfs+hAB0v0m48FE5kc9YLs6qKnpIl6MbEs
   e58JVaLDzv1S5ifyD2jnB0yGFoo4GukIeK2QOqIFpwC0v7oKh4QMfGRtI
   tEFDzKdDyTE7VdLuU8MV59n7BRNOvYME7p+YTOIYJiXzFWdWA3gsN22FM
   GMclyRvAJk/F+6cLwOtuRS0vQSTYxDSogegfxaZWjMoIm/YivXxurR+o0
   YTRye9kdlvk16YgEpF9LwZMoRXIlZpblc6JSQKSU49QA2ZqvK3mhj4P3H
   7L3u+9Cwp2kvfE32PPvvLIjfMN2bOKht5RPd10ON1rRh5Yduk5PtSTVDW
   w==;
X-CSE-ConnectionGUID: VdHHI8qkT/uMx971WAidQQ==
X-CSE-MsgGUID: XJT231MxRtSRolwUQOvVFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57740992"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57740992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:30:15 -0700
X-CSE-ConnectionGUID: 7wOChHRuQN+ANyG7K747sw==
X-CSE-MsgGUID: XSMdRLUQSwW5UpB3Q3+/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200761504"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.51])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 03:30:14 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/5] i3c: mipi-i3c-hci: Change interrupt status prints to dev_dbg()
Date: Wed, 27 Aug 2025 13:30:05 +0300
Message-ID: <20250827103009.243771-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_033017_453484_0689F05F 
X-CRM114-Status: GOOD (  11.19  )
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

Change interrupt status prints from local DBG() macro to dev_dbg() in
order to make it easier to enable them without needing to recompile code
with DEBUG defined.

While doing so, spell out the status register names as they are in the
specification to make it easier to differentiate between different
interrupt status registers.

Since dynamic debug prints can include the line number remove the "(in)"
and "(out)" markers from the PIO interrupt status prints.

Prefix the ring interrupt status print using "Ring %d" instead of "rh%d"
to make it uniform across all other prints showing the ring number.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 3 ++-
 drivers/i3c/master/mipi-i3c-hci/pio.c  | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 7a467ef65787..d532933ac7ab 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -553,7 +553,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 
 	val = reg_read(INTR_STATUS);
 	reg_write(INTR_STATUS, val);
-	DBG("INTR_STATUS = %#x", val);
+	dev_dbg(&hci->master.dev, "INTR_STATUS %#x", val);
 
 	if (val)
 		result = IRQ_HANDLED;
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 09688ada4912..f5f5ab4db172 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -760,7 +760,8 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 
 		rh = &rings->headers[i];
 		status = rh_reg_read(INTR_STATUS);
-		DBG("rh%d status: %#x", i, status);
+		dev_dbg(&hci->master.dev, "Ring %d: RH_INTR_STATUS %#x",
+			i, status);
 		if (!status)
 			continue;
 		rh_reg_write(INTR_STATUS, status);
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 2fc71e696911..cde883137bc7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -986,7 +986,8 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
 
 	spin_lock(&pio->lock);
 	status = pio_reg_read(INTR_STATUS);
-	DBG("(in) status: %#x/%#x", status, pio->enabled_irqs);
+	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
+		status, pio->enabled_irqs);
 	status &= pio->enabled_irqs | STAT_LATENCY_WARNINGS;
 	if (!status) {
 		spin_unlock(&pio->lock);
@@ -1023,8 +1024,8 @@ static bool hci_pio_irq_handler(struct i3c_hci *hci)
 			pio->enabled_irqs &= ~STAT_CMD_QUEUE_READY;
 
 	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
-	DBG("(out) status: %#x/%#x",
-	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	dev_dbg(&hci->master.dev, "PIO_INTR_STATUS %#x/%#x",
+		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
 	spin_unlock(&pio->lock);
 	return true;
 }
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
