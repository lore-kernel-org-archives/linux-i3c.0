Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95830CD4F47
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=877xKGl+IrlF0xp/nVmEKRn2E27ct6jEBkWBUFbXmc0=; b=Y7EjS4r6D9aaqX
	AobRYhm2woY8V608X/Mgy/n1sdUe4hzqfIhfQBcHbNjyPUnCphsYD74sMB+Htzdji96nM7LLXsCpK
	D05fIb1bjwMxVOM14iHmn4MrC3VG/18EBzDTc03rg7heVxLwnCXPHg5uzxkyIshGEWMhiKIzpdluh
	PileaJ3OQPN13WDmh2Mqss/gb1ONejaNfwE5OaxoUJviCs+t4W9xZlqYJOJa4xO1fRXUlOpb8lFSF
	pmXE0hQ315V5xXuC8bvzyQEKjLEmKQU2ZB4gO6qiEcc5Z0tBSGknsu1e6p0Gz+QU7FRnHKg8sl1bF
	Bl5zffxx3ptCQR0Vf7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNM-00000008rZ6-1VM7;
	Fri, 15 May 2026 16:27:00 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNJ-00000008rJ2-0ljX
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862418; x=1810398418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KtEA1mk6JfjgPW/BabL7nch+gDd3Wsxjpv4iDjidqho=;
  b=ct+1lB6Nw6TtnN7+Lsl8oCCdhOhfTP+VhVNAKNW7auNmBGJxB1/dKLSa
   ba9RnkeYQD3rOkvVzWWnqGIPwUNy0FXUBdKZwtZSCDjMWHocOlM8813IJ
   mwocH1IGZ65SigiERfUHyTvwo9kloQSJOS3zNKEt841dVVtZQZxCcerJz
   2OdqhmVIxE4e7By6rVmpHyXjm+DPTztXECWrhRQTaSNAJvzrU8sGNPUyn
   3myKAwIvcH253+1SBgXe/bTDNEq4ev+mQgy9OQvIze433IWMlYsuGuyFq
   TeFc9q15wQYRhgkON+04nX1k480v78YyVhPRkj85DZrHnWCKWUs049+bQ
   Q==;
X-CSE-ConnectionGUID: T3KqjjVJRjGxtwOHIaFUeA==
X-CSE-MsgGUID: 6d1JuPp3TN24J+AEPpa3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785288"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:57 -0700
X-CSE-ConnectionGUID: OjvOzWpmTd+aN5pSph3dCw==
X-CSE-MsgGUID: F92zqIqqRGemsu42CBT1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857261"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:56 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 12/17] i3c: mipi-i3c-hci: Factor out reset-and-restore helper
Date: Fri, 15 May 2026 19:26:16 +0300
Message-ID: <20260515162621.57719-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092657_267036_D16C8CFE 
X-CRM114-Status: UNSURE (   9.29  )
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

Factor the reset-and-restore sequence out of i3c_hci_rpm_resume() into
a separate helper.

This allows the same logic to be reused for recovery paths in subsequent
changes without duplicating suspend/resume handling.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd by

Changes in V3:

	None

Changes in V2:

	Drop redundant i3c_hci_sync_irq_inactive(hci)
	from i3c_hci_reset_and_restore() because it is called by
	hci->io->suspend() anyway


 drivers/i3c/master/mipi-i3c-hci/core.c | 19 +++++++++++++++++--
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8274c84b16be..12a0122fb709 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -798,9 +798,8 @@ int i3c_hci_rpm_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_suspend);
 
-int i3c_hci_rpm_resume(struct device *dev)
+static int i3c_hci_do_reset_and_restore(struct i3c_hci *hci)
 {
-	struct i3c_hci *hci = dev_get_drvdata(dev);
 	int ret;
 
 	ret = i3c_hci_reset_and_init(hci);
@@ -821,6 +820,22 @@ int i3c_hci_rpm_resume(struct device *dev)
 
 	return 0;
 }
+
+int i3c_hci_reset_and_restore(struct i3c_hci *hci)
+{
+	i3c_hci_bus_disable(hci);
+
+	hci->io->suspend(hci);
+
+	return i3c_hci_do_reset_and_restore(hci);
+}
+
+int i3c_hci_rpm_resume(struct device *dev)
+{
+	struct i3c_hci *hci = dev_get_drvdata(dev);
+
+	return i3c_hci_do_reset_and_restore(hci);
+}
 EXPORT_SYMBOL_GPL(i3c_hci_rpm_resume);
 
 static int i3c_hci_runtime_suspend(struct device *dev)
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 97c31a315a6e..a3151c26827e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -175,4 +175,6 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
 int i3c_hci_rpm_suspend(struct device *dev);
 int i3c_hci_rpm_resume(struct device *dev);
 
+int i3c_hci_reset_and_restore(struct i3c_hci *hci);
+
 #endif
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
