Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A30CEFC2A
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Oct 2024 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rP3TUX2jju4cT3vD9BBYPCMW2h6T2LXfj4J9mP0pi9U=; b=rXVcG0nbQTEXs/
	iFLBFlOPkBcKFh+cFx69iBlf9QKBhy0HmKzCRTW1Zce2I7V8NxpnBsiNSQEnmCYNyD3USfoEMW+Oh
	rIUWviCMtgTLtLlP83z9YumZXtFGwv5nC/s432LRFCSF1uaib8SJY8MeGsdx8OrWM0C3lJACGNIvJ
	mfCeKk0sK9mHi7c8RFkmKK6GEEKm3wzpwnMs+64rr4iRpqFSQrCVnLwwiDmoy9UZMGPf1yO+Ifj6t
	HkicBN8POgnptE5qN4rXQ6DnoeyI0sFBHIRfqDBlAPeQ85DfLoZ1HN3QLya7wFWwmAQADAXO5Z5H0
	lEcQsp2f1Ce/qH3IlmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syCW6-00000006Pmy-0bP1;
	Tue, 08 Oct 2024 15:52:54 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sweoT-0000000Bfqg-40Vb
	for linux-i3c@lists.infradead.org;
	Fri, 04 Oct 2024 09:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034890; x=1759570890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V3VXJEp3smunlOf3qC4y3ZItA/MIzj6KIM1DVxGWatw=;
  b=QPVDqLm9mUqCA9msfTcuXWkJnCVGvR5UADxUHfsJMePCotLMiV3byYFp
   qd9dewUYpk4ZawtUjWbvixC1ThSrBPpB8foZvf0HKjNZmev0fZQdETyQD
   /TG8mYlpIFPZ6S3WBiSeaSRTNlNgeVaVeiejNqKvCGCMZYSwDp71o9mbE
   9xQRwo58fBDnRP+N9x+T6akvUmIEgo8OoUHUVqhW/Wt6z6bmtGAihJXEF
   +/Ns7JC7DBe8aK587G2lVto+msZqDbQdcNeogXIHv1XStthV5fRL7o8aR
   eFtItMfieX2eIiWXAiXuPKrjDoNsixiyFQZ5HsiK9Bfc+RJVwr479rzYJ
   Q==;
X-CSE-ConnectionGUID: F1VtBg0LRSu53zyiw1S07g==
X-CSE-MsgGUID: sX1Dw76TRyO2l5A6cCXavg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856260"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856260"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:29 -0700
X-CSE-ConnectionGUID: q4voOJ+aTiG2Pw0SLZnHOw==
X-CSE-MsgGUID: RiXzvgypTDqB9RLg5rhbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331939"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EBFF1120D8D;
	Fri,  4 Oct 2024 12:41:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoM-000TZP-34;
	Fri, 04 Oct 2024 12:41:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aniket <aniketmaurya@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org
Subject: [PATCH 18/51] i3c: dw: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:22 +0300
Message-Id: <20241004094122.113657-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_024130_291781_8E311E9D 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 08 Oct 2024 08:52:51 -0700
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

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/i3c/master/dw-i3c-master.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8d694672c110..d2731ed66705 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -700,7 +700,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 
 rpm_out:
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -817,7 +817,7 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 		ret = dw_i3c_ccc_set(master, ccc);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -900,7 +900,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 
 rpm_out:
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -986,7 +986,7 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	dw_i3c_master_free_xfer(xfer);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -1136,7 +1136,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	dw_i3c_master_free_xfer(xfer);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
@@ -1304,7 +1304,7 @@ static int dw_i3c_master_disable_hotjoin(struct i3c_master_controller *m)
 	       master->regs + DEVICE_CTRL);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
 
@@ -1330,7 +1330,7 @@ static int dw_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 	if (rc) {
 		dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
 		pm_runtime_mark_last_busy(master->dev);
-		pm_runtime_put_autosuspend(master->dev);
+		__pm_runtime_put_autosuspend(master->dev);
 	}
 
 	return rc;
@@ -1350,7 +1350,7 @@ static int dw_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 	dw_i3c_master_set_sir_enabled(master, dev, data->index, false);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 	return 0;
 }
 
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
