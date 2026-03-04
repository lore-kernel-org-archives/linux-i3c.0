Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F0EEFCE39
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47QgdEtvS5959Bh9cq6ri1TvCZA6nFYH5H6z7i91PxY=; b=SKCJTqMHJ1rd/i
	nsxbiZbgqlyOqIYaysQKFwA3GLRHxICttd78brnWBmtGHAMwdsnvr52XQeXPxmJHhBtr8OZA49n0/
	WtXAFcWqc9baOGXQlByT85q0yV+nCBA+dalxw9V6tIjcJWcsZlB3lzd0a88hMViQgtsoZ+NZHniI7
	uQrvh/OcL0MJN31PhHKu7PWva2KbLJPl9PoZtQfEbvmC5TAESUImP4Aa9NxegSIwdbBvjXb1T7Da0
	GguoFtWs2fPVMqCRht2FVDc+H4K/FmR3Vu2bKkkSwZN8M5YMg30t7BkROswcKOf+kq2l2tTQorzVs
	mzeqIWkSLDDOhjYjOaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqml-00000000K2S-1NIm;
	Wed, 04 Mar 2026 18:17:27 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmi-00000000K1V-42rU
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648245; x=1804184245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VSMZKC7rZq3mwAKN2XOZjg9c3J5zId+zDmapLnUlaJA=;
  b=XfrLo/XjqyY+IhJR54sfiSHn6UELS54ZW/Xu61ulVjsLrIKlHe0/yDes
   RzDul4keFdh6TGa6eL3UH9lMhry80PgamKVB+GW1glPYf/Md/IGWRJkoA
   a0Pg3efPNRFeiG1KUQsBReHdjaqNnEHWUZY3xcLNyMMLgjZD36AVuEEEJ
   +4RcCwlLByxxmRD5eUsFcpl0YKxVwyPSygiptNLSsdO8nL/B7AsNuAJ7p
   Ge7aXjTKztlDTYomEp1eVDi8J4WbVKwm47Kt7hRrvHEFWsxsjNu2qpW94
   PtlVPk9OLpuUgRz602wu8Aq6jvRNwgX2uxRCyjLYDHYk53N/YYYHvcS7v
   Q==;
X-CSE-ConnectionGUID: Qt2UB2ICQNCJeF7RucCwUA==
X-CSE-MsgGUID: unKJ67MCR+SxTr/PPRNG/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745883"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:25 -0800
X-CSE-ConnectionGUID: 5gPFtgH9SCy3IOJk5zgO/Q==
X-CSE-MsgGUID: CzEcChIqQJe9C2lfee1c6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656714"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:23 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 02/14] i3c: mipi-i3c-hci: Fix Hot-Join NACK
Date: Wed,  4 Mar 2026 20:16:53 +0200
Message-ID: <20260304181706.143841-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101725_022302_BF33B84E 
X-CRM114-Status: UNSURE (   8.79  )
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

The MIPI I3C HCI host controller driver does not implement Hot-Join
handling, yet Hot-Join response control defaults to allowing devices to
Hot-Join the bus.  Configure HC_CONTROL_HOT_JOIN_CTRL to NACK all Hot-Join
attempts.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dbe93df0c70e..4877a321edf9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -152,7 +152,8 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
 		amd_set_resp_buf_thld(hci);
 
-	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	/* Enable bus with Hot-Join disabled */
+	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
 
 	return 0;
@@ -764,7 +765,8 @@ static int i3c_hci_runtime_resume(struct device *dev)
 
 	hci->io->resume(hci);
 
-	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	/* Enable bus with Hot-Join disabled */
+	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
 
 	return 0;
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
