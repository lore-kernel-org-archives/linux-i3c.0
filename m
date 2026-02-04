Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739FFE95388
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rR/j9NnNjFMlHoc4avchNUm/EMY95xYNNI+2RIJjZwc=; b=H5URQ5SS5QAqSc
	jXhg5QxJmK/vbrUjDKtCimbGIOQcsyVMbgE7RcJLEDRlBj9lgqHzKMQN7lAteftouoWiccJ3LCZjL
	1c9qHTU6Xm+ODDsjp9bhescwCByhVx1rQB4weym5RadvoYggluFxvry9bO2sncljwP4mt9tBR4umd
	O+5zt5dVtmnM31x2YNm+aZuGJ6yilJzGooWM9+SfWo0YCMisHRq+jz8s5VaEnXVtpzUdBCm/IJwTD
	gQGqZ6m6lq2F7h9VmFpF5XI9Q56hZFYk3A5oz8YxDW31rHr6xdMMuiQogHA6KMTLT1+ZNEHMy0wtt
	eW6zrJhjX43752ZtPklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar3-00000008LIq-0njQ;
	Wed, 04 Feb 2026 11:15:29 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar0-00000008LHZ-1UqK
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 11:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203726; x=1801739726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w4uBEMnFw6IU1yfNVWzXyJJ/IeAOyUbFqbRawZssQ2M=;
  b=EOHqvE7fm/YR0EWID9rA8WUIw+yqFB5adbtHt8iQyXLMPenSFqfD5ZRG
   lHbHF0YzzNJ/JI3RTtdNFBZTEVltpa5T3EZfUL88bnTsLbJTK/7IEM6/R
   r63t1DfukU2OqWwv0mezZ5O4VbSgwHO3Xgc6wL4Cb0W7cJd2Euxkgq8yi
   R5BTD9zlEV7pv037EQn6ACIPppoKPYGhLLcxjGMFn9x7efEkFkZ0ZaRPL
   O8nKHBCq0GJpDHpApMw53/0gwmexYKDkHx9X9z+GbYKoihfVyGdqReVQ+
   20ZdlHAriqNw7FudP7iEWfK1PlVs1BPgXEyPWsLI+T3d+9uKTryLCn+Lm
   g==;
X-CSE-ConnectionGUID: 1QLksnItRVu8jI0XpZOCYA==
X-CSE-MsgGUID: JoUGbqKiSW204nRvSuYwoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70406051"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70406051"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:26 -0800
X-CSE-ConnectionGUID: JGyTMG6ERISRZye3oPZ/fQ==
X-CSE-MsgGUID: jwXsVocsRmmwRB30PvlIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739278"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.181])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 2/6] i3c: master: Mark last_busy on IBI when runtime PM is allowed
Date: Wed,  4 Feb 2026 13:15:07 +0200
Message-ID: <20260204111511.78626-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204111511.78626-1-adrian.hunter@intel.com>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031526_402410_247D170D 
X-CRM114-Status: GOOD (  11.09  )
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

When an IBI can be received after the controller is
pm_runtime_put_autosuspend()'ed, the interrupt may occur just before the
device is auto-suspended.  In such cases, the runtime PM core may not see
any recent activity and may suspend the device earlier than intended.

Mark the controller as last busy whenever an IBI is queued (when
rpm_ibi_allowed is set) so that the auto-suspend delay correctly reflects
recent bus activity and avoids premature suspension.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Adjusted slightly for earlier changes


 drivers/i3c/master.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 49fb6e30a68e..48d1b1256290 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2721,9 +2721,14 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
  */
 void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
 {
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
 	if (!dev->ibi || !slot)
 		return;
 
+	if (master->rpm_ibi_allowed)
+		pm_runtime_mark_last_busy(master->dev.parent);
+
 	atomic_inc(&dev->ibi->pending_ibis);
 	queue_work(dev->ibi->wq, &slot->work);
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
