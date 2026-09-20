Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E07C982EB
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+TL8uth17lGNbnXcBmDSJun03Oe/2HrdSCx+Y30G6w=; b=e2uLKN4Xr0r976
	pqe1tEiSy6dIjwqcGxtxcThozbfii5mOm7hWLrEnPOUT60/8FKdVIZ6KiKYGc2hi6gxVNeA0T8L0u
	B4YBU3rh12U+oWC4UUIoaN0os/Cc5SKdqQl2hi+MnUrxXaakIAhTk5KXAiELzadqXdd+kivkGs73t
	hxi402v2um78AphXkabmO6wRSj3GDYYXZdslnqFcg6EhyetWJM+ISfDADsUmHDP7sW/q0qNCcdAwB
	NQrYFOvP3GqFUJlO9J0PZF5DmGWm9scxHwhlVmOFvnE9FgG8vyNJTJ1SBedR6QjRvOtNCiUyagHQL
	iELpOXTNL8Ks7BvoZ6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEC-000000002W9-29as;
	Sun, 20 Sep 2026 15:13:16 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEA-000000002Uc-0BkR
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917194; x=1821453194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NBwEjFcbmbb8ba9Jy+BmQAZLFPU4iOb9Ugzr6Vy+U8=;
  b=ha6h2QcVIyAs+ySVId4YrG96zgYTi4D7iwElVFqOXWY0kfaoL2bDoXrG
   6Qwb/Q6nipzsQjkkUzJxEqXSUAdZA+JrXgdTGkM9XLnF3ieff3kjp/hHB
   7CvA7gdRiobCVgostwtCoOc0RKnU/Ee83foYUQrEcPOM/cy4ZqXVNIFBm
   IPHYvL3uc820ASxCYy/O+X9sq/LqdcaehMx0QqSHbvdHKz+kPAIfcm+RB
   waMi9vKEgRRDx74PqPABazIM5p9oM8UtxeyakyLQd/8nyqeKfaPSuwHzF
   qBlq9uTxyQc9wnV7MCaoZHRPYXJw/SVONURmmR7Xfy4EbqHygRUYAgHHi
   w==;
X-CSE-ConnectionGUID: 6C9A0RRgQ02GEqdifCfh/Q==
X-CSE-MsgGUID: 9yT4ATFzToug87vmfiQULg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548441"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548441"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:14 -0700
X-CSE-ConnectionGUID: cqERlBjWQoeh+Av8hWPEkw==
X-CSE-MsgGUID: iazM+2xiTKK0rIUVOrgpKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352408"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:13 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 07/17] i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
Date: Sun, 20 Sep 2026 18:12:37 +0300
Message-ID: <20260920151248.46936-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081314_454454_2FDD34B6 
X-CRM114-Status: GOOD (  11.66  )
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

Reorder i3c_hci_disable_ibi() so that DISEC is sent before IBIs are
disabled at the controller.

This matches the sequence used by other I3C controller drivers.  It also
avoids dropping an IBI that races with the disable operation: an IBI
received after DISEC is issued but before the controller disables IBIs
can still be processed normally.  Once DISEC has been sent, the hardware
can be updated to NACK subsequent IBIs and complete the teardown.

No functional change is intended beyond aligning the ordering with other
drivers and handling the race window consistently.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 166d9f70f435..f6a34ce7a295 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -719,13 +719,14 @@ static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	__i3c_hci_disable_ibi(hci, dev);
 	/*
-	 * The DAT entry is now set to NACK and DISEC this target's IBIs, so
+	 * The DAT entry will be set to NACK and DISEC this target's IBIs, so
 	 * the IBI teardown can proceed even if DISEC below fails, so ignore
 	 * errors.
 	 */
 	i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+
+	__i3c_hci_disable_ibi(hci, dev);
 	return 0;
 }
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
