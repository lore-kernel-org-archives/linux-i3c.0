Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F697C55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5ImGlCuZZp6hP1LG9cMDy3UgBY/ALaj9JAvKlzvQ90=; b=gikEL/3HeXzHBx
	Qqtv2sY1x+I71VdGwYAfZ4vdlkfT8lIeOUzhaKd8vNhZyZcJtigdKas8R0dF8F21lv1ET5/C6dxiU
	aCxfGYIyXs8+mklnR7zSSvF/hPmtKo/CKqBt19qp3YSqVPt2fwyQh3TQB6c6x3Zry2JiC+ssLr2dJ
	wU2u0U7Fc8LgjM6fpmtI1ll02qFs7SDnknIlrSX9SXQy69Fk1y1id+dy4YPOdlB4vOj3KN1h5PuX5
	YXDehz4132SdIq5RE30N3XZqbDT2mYYkhFPrhayhsf1B4gbYhyjVha/Z3+J9F9IARJQ7xLT0JEOu9
	46eDdvckpd7Qq4LbL6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLy-00000001wbA-3mt1;
	Tue, 04 Aug 2026 13:38:46 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLw-00000001wP5-2Te9
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850725; x=1817386725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UaMLbZ0IzXimDx+Nc2/VUT4yVPyc/sRZ6Ky7fCkM2UA=;
  b=elWlTu7DqSKrIBruryIugTuxD0HVOz6klVQjz7sv0mdZqz2nmdylzOn0
   MleS+ow2B4c5r2CKd/dzZJEG9mG2jWgxgCyGD4s/I68KD5T3mbZa+NgeW
   W8fuKZGPQOh6H0BvpIu58WuUAgR2wcZgbAnXpPjRp3tSkOEP0m0a9W1BG
   UfE2Q7GUwPpumI1hwPGyaQfrUhCrnzi/awGBsDnrXc4RUTyFbU6pdjgC+
   0TnSj73qm3w1OGCCzQ9LLddJcMByWxn7vNWLPFUO7g28kZi13gHDLoeY6
   2kTWkfbzPkxALBj9sqkn1UPyBMOP5NGYXs+p8w9KhLxG8MsF2fcv28/Ke
   w==;
X-CSE-ConnectionGUID: HWBGmygVQoyB+Ry2accXsA==
X-CSE-MsgGUID: 6eXHou3gRxGLNh1GkIClOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410153"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:44 -0700
X-CSE-ConnectionGUID: wQ3+E0FYQy+92Wey6uHwCA==
X-CSE-MsgGUID: 7ppwyp02T+S1JLi9peccvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263501033"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:42 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 09/14] i3c: master: Report wakeup events for IBIs
Date: Tue,  4 Aug 2026 16:38:05 +0300
Message-ID: <20260804133810.184905-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133810.184905-1-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063844_667502_9AF845F8 
X-CRM114-Status: UNSURE (   9.52  )
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

An I3C device configured as a wakeup source can wake the system by
generating an In-Band Interrupt (IBI).

When an IBI is queued for processing, record a wakeup event for the
device if wakeup is enabled.  Use a 100 ms processing interval to give
the I3C device driver time to process the IBI.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2 and V3:

	None


 drivers/i3c/master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e6b320da475e..8c9e62e6f146 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3385,6 +3385,9 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/* Approximate time for IBI handler to run */
+#define I3C_WAKEUP_PROCESSING_TIME_MS 100
+
 /**
  * i3c_master_queue_ibi() - Queue an IBI
  * @dev: the device this IBI is coming from
@@ -3398,6 +3401,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
 	if (!dev->ibi || !slot)
 		return;
 
+	if (device_may_wakeup(&dev->dev->dev))
+		pm_wakeup_event(&dev->dev->dev, I3C_WAKEUP_PROCESSING_TIME_MS);
+
 	atomic_inc(&dev->ibi->pending_ibis);
 	queue_work(dev->ibi->wq, &slot->work);
 }
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
