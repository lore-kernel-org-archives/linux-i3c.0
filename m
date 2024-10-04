Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FFDCEFC29
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Oct 2024 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udSgF5xP5z2mPcsIL805JkqN1YIsrVASDPEKDqZs4u0=; b=IURcTLGelYp7NE
	RprD0P0NT6NGTlCTJto3yn+IwAgQgAulERDN2JF5+FozSXxCKavO0w0fH9EsCQgRBm5JKpDRIjGoE
	Yi1o96SqQu0kiEnPPZIuh2sy1yQZzSo1YfCVHFyQQiuOAv4v5BE+4nQvfM49i+YOp5pb/5OdNfBH8
	3FPTAf7+Y5V1LKecWgY193PiBvlqKQqqCUScGhpqdgTQyY7e5Kcf61egzg+J8RtCP+BKKEmudEocQ
	m9zsz54XXAwkEt/41mhiFcyxCnehPlqrwA6pmfSTViM2wqbva8WCTagNlUFBzphxtQUQCqX6Oi3n4
	iiQw3NO+8+46OuekQZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syCW5-00000006Pmm-3WCo;
	Tue, 08 Oct 2024 15:52:53 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sweoS-0000000BfmG-43EA
	for linux-i3c@lists.infradead.org;
	Fri, 04 Oct 2024 09:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034889; x=1759570889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hGztGFmW4B6F+PO1YpP5j2Ukcvk1GEP7S7/TRTnhsbw=;
  b=QMnkISA3yG84q90Lx8mBU3q6cr92Lh9j8casSVhRT1CxGU1budEHXcf/
   fIY2gZFO7SBwVR+N+bqSUAYvMksPskggB3BPNTFbRZwkYTMWoce4poG1P
   Y2G0uup/PEDt++WITknBKX2dLP5bB/ai0DmIm5O2AIOMYPjvKXEieor4p
   ujgobVaRUCI5pVVyk8MfgvzIYfCavNajQqE0HfMOJJqDPhZJ7UNTOsrA7
   /zo31GMbbb5oaIZj/G2LZPkBQwVECZP0PGNLQ23HKZ+UDu2RysqPp3FKG
   7q/tbX0Ti7dnD4s+oO9vszRuP7LioywX7POPAAowIx3cwltDjgcCR8883
   w==;
X-CSE-ConnectionGUID: dqSiInIYSZ2DLTN/DwveCw==
X-CSE-MsgGUID: q9zh072+RAmlhJi7AS2AtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856254"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:29 -0700
X-CSE-ConnectionGUID: 9zdJNaHPRTCyAvAlylX/FQ==
X-CSE-MsgGUID: BafC5rXHQoO53OGBmlxZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331937"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D7D0E120CED;
	Fri,  4 Oct 2024 12:41:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoM-000TZ8-2o;
	Fri, 04 Oct 2024 12:41:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
Subject: [PATCH 17/51] i3c: master: svc: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:22 +0300
Message-Id: <20241004094122.113640-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_024129_143940_AD6B7318 
X-CRM114-Status: UNSURE (   9.37  )
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
 drivers/i3c/master/svc-i3c-master.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index a7bfc678153e..684f20fbc265 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -576,7 +576,7 @@ static int svc_i3c_master_set_speed(struct i3c_master_controller *m,
 
 rpm_out:
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
 }
@@ -691,7 +691,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 
 rpm_out:
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
 }
@@ -713,7 +713,7 @@ static void svc_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	writel(0, master->regs + SVC_I3C_MCONFIG);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 }
 
 static int svc_i3c_master_reserve_slot(struct svc_i3c_master *master)
@@ -1070,7 +1070,7 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
 
 rpm_out:
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
 }
@@ -1353,7 +1353,7 @@ static void svc_i3c_master_enqueue_xfer(struct svc_i3c_master *master,
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 }
 
 static bool
@@ -1643,7 +1643,7 @@ static int svc_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
 	ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 
 	return ret;
 }
@@ -1676,7 +1676,7 @@ static int svc_i3c_master_disable_hotjoin(struct i3c_master_controller *m)
 		svc_i3c_master_disable_interrupts(master);
 
 	pm_runtime_mark_last_busy(master->dev);
-	pm_runtime_put_autosuspend(master->dev);
+	__pm_runtime_put_autosuspend(master->dev);
 
 	return 0;
 }
@@ -1820,7 +1820,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
 
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
