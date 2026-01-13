Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18C7D29DE4
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gTpNJfxVGrtaoXaKbNWWjRrhQvKUzmznG7u3W5Z55E=; b=Ihwcdl3PjrfgpW
	j2wAEgiOcE1sf3ZhqWEKbyRwLJRGnOQDYyt+d1Qc1q317a9XYSg//zY63PmpXjlUJW4JZ3qDDwb7M
	Z7LD1AncrMzd8X9QzndedT0yeMBa1L/x8B9R2LHjxwHsleJKvndnnTb9cDrQvra6wstjEdWpnzi0N
	8wcyOMTUr96sOk0J90v/UQ8rloc78w+puc6jVOWHz0X5MMsyY4in4ZlRv7kpuUzfp1k4zIbNBz0Jj
	rxMpx/i2IQXJMnjh907hG6mbTPk2ciloa3fn+5MChCU966NB+8FPhGQHmbIXd3VGqRx3LcGtQ9l3p
	y6XOoU+dS0qdm9+necUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoN-00000006eSw-1u3K;
	Tue, 13 Jan 2026 07:27:31 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoJ-00000006eQo-28wR
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289248; x=1799825248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uhywbczg3V6ZlMzwL0EDMvhGANsiFolKdEs+bqkneNs=;
  b=bc7lyQbX/hJhUbb+8001OwfYfdGwCFfe3yYP/Tf/NnHK09TuHTEwh66b
   anrM4kBKaabXuEMZLj/SecyC+VrXWfBeKVxDSOKoeTSLEv18SqmL5kFGu
   bT53nGgE5GkYeS3M5Gl88STjt/KdtQUluwJ0agq6jfUqb7El0WeBl2+no
   GLOLxYiQ344NrGqFiKP76kMHO8Wu3vFNzlvOZ/QCoagh3SQyWa/R2+GoQ
   HMJNDtv9kAezXO8gmamGGsIT+z4l8ly9vntIHiVt4IiGxZTDqpouwLfls
   5Ca2MyoSQ9CmlmfKFxYu9xzGYWaIdphZD7RY1BPTV3AUPJn2a2VXo4wlV
   Q==;
X-CSE-ConnectionGUID: UIhGjBcOTHiQnRcGdORkBA==
X-CSE-MsgGUID: 6SHoVUF9SA+yblm97F6fdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625437"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625437"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:28 -0800
X-CSE-ConnectionGUID: j8XQZx6qSRS3AzeETHb+gw==
X-CSE-MsgGUID: tusXmz1CQaSZVK208aaDyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021202"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:26 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 04/21] i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
Date: Tue, 13 Jan 2026 09:26:45 +0200
Message-ID: <20260113072702.16268-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232728_595742_91B37240 
X-CRM114-Status: UNSURE (   8.37  )
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

IBI disable failures are not indicative of a software bug, so using
WARN_ON() is not appropriate.  Replace these warnings with dev_err().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e6384bffd4ae..ff6cbc044787 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3113,8 +3113,11 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 	if (!dev->ibi)
 		return;
 
-	if (WARN_ON(dev->ibi->enabled))
-		WARN_ON(i3c_dev_disable_ibi_locked(dev));
+	if (dev->ibi->enabled) {
+		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
+		if (i3c_dev_disable_ibi_locked(dev))
+			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
+	}
 
 	master->ops->free_ibi(dev);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
