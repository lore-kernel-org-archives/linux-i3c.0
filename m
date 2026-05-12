Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F944CD4F21
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jM3H7fP7X8MT5QAaUX805WEftBarlgEfCNrWdf+kza4=; b=zNEKXAasDVC/zV
	iPSXmNkdbgerZJWpS1CCkAiKUDg8HWEUnOY8btx1ZQEaSx7Us38ONJukEI9ZIDlVtsDEoC9FPwSCB
	+NPAPGHOJthmafEhR5uA+wOZKa7PUBlKNGuC79vTs4n/29lNpaC5zzoj+9ueGmSfnj9OoZaoLx+R6
	oEvSOivuvrPUWN4pVNS9sncUGFyRuMMz1O2XeAX8WWaoTtMdniAdN0EhR0vX6zvLdnA6jRbiC0q0u
	94T8BmifJBkgeafW6edMjr2VBKaYBYOA93P3pSfud7iEkjZ2974BbMmsdxCBwZbCpB2JmaWj5L2/+
	0Pny7zS86h01ZZWmCjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3i-0000000GeGe-03nT;
	Tue, 12 May 2026 12:17:58 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3f-0000000GeBi-2xxz
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 12:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778588276; x=1810124276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e1NvvD4rZ+mSdMuQXOmY0LYGHXLJzztM5hIBT+Aw2as=;
  b=O2jSClMLNt/X36j4WQLxZA/wnBmcZlp+igmEGMeb3yNSPIsoJEUTriP2
   6vclK7pJ3cyU4lhlMnNFGhGQ0RRNo2I5A0EkZnnbXDdbPjFfQW1KnPKBW
   SPRZs1A3I2heRMeC2P4X3Y63vY1FYuVie6Y+/MKKF3rK2qVaHpvyKFpbI
   sb3mZQquDvvtqV8kzjA+BjDRGQ48ImaAU15RClCeN/voJvJ7Cm8qN1tPd
   xnmYdnVpJk3iCKTo75r/t8MawF38WxFk7Y18wLR3OH+/Bw4Y5d5TqRkyQ
   uCZ1Vq8DlKct7U6VuwJdQpXvAbZNlWKsH1sjJex9rWzmsOxvANaGyPAig
   w==;
X-CSE-ConnectionGUID: 0P+Am9GxTwG1g+5p74X55g==
X-CSE-MsgGUID: /8O6f87XTk65a7HJ7EqDJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79389504"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79389504"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:56 -0700
X-CSE-ConnectionGUID: WB3igC9KTS6NM4QHh5JicQ==
X-CSE-MsgGUID: lhvk4XJyT/GCQFTxRw4HbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241756152"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.121])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:54 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
Date: Tue, 12 May 2026 15:17:29 +0300
Message-ID: <20260512121732.406009-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260512121732.406009-1-adrian.hunter@intel.com>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_051755_793521_8A03C914 
X-CRM114-Status: UNSURE (   8.57  )
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

The I3C core now installs an i3c_bus_type shutdown callback that
flushes master->hj_work (via i3c_master_shutdown()) before any driver's
platform shutdown hook runs. The explicit cancel_work_sync() in
dw_i3c_shutdown() is therefore redundant: by the time it executes, the
Hot-Join worker has already been cancelled, and the shutting_down gate
makes a new worker a no-op.

Remove the now-unneeded call. No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index eb9a13a73684..c7030d0cd8a6 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1793,8 +1793,6 @@ static void dw_i3c_shutdown(struct platform_device *pdev)
 		return;
 	}
 
-	cancel_work_sync(&master->base.hj_work);
-
 	/* Disable interrupts */
 	writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
 	writel((u32)~INTR_ALL, master->regs + INTR_SIGNAL_EN);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
