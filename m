Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D5EC982D9
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4wGuxwXEUFfMNr72Fr3kaG4uhtwS2AWgqWnyC3tZLQ=; b=qAQ0WCkiyopiI+
	j83BBpH1ZUbBNV+r/tqO7GcghxcHkHucdDlfbmHiXzafsRibf1prdwEpBNY2OPgHwz7ylUQc5uduQ
	5JWbgdlQegBmuWLOEuXKsVbQpr8+xlnfcKeaYZrnvvONk6aWHt+Mm1OysIYZlFuh3T1acwUpwIGXw
	i8/ZIs5bl/hn0GmDTYzh4dEUo78bhqmbX+egaexUbnSNG/IhXnSb0lDavl2E2WiPJMk65FzYc+hZl
	Rq4OAItWNBFamyNaZ21C8fPczkH9xTpAsDyI7wvGzLHriC6ATTVTQUFbpBQYwiZ0NMKXx2O5CqGWs
	gqPs9BrPY/1aZLh7JQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYr-0000000CJMG-0P2p;
	Thu, 17 Sep 2026 19:14:21 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYo-0000000CJFz-2Nuj
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672458; x=1821208458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ygh1Shgl/gNfzc7vwVHMLOMwehx0u2/hUTIwlKl3shI=;
  b=ekepH2t4sdK26mtE11Qk9nFc9EMVCDt+utGnT5tJfjPo0Ju9JJt2vnWY
   3tag3B2ZLPp+8zoYRX4G7TzUQL6uHAEHFvPWC56V70zKDy05z1TbEGuS5
   vaklR0bDREeePfcyJNNHDfImpvSU6QPOUTWC0gSXwT2kJPsFJfxxV0XVy
   ZYQHDjzIvEz+ThiDVTI0lLCiMVo1Li3rqQ5BZFcjK75Y37FW9Tgiwnp/X
   L0Mn6oD9YFPxLSxjtdTkaypKQ9k/af+fFzGrgA2Fl0vRvWJ+NoS+HvBUJ
   dK6hGkQ5OYb34JYfb1h8r5OjBo+6MOuFsxj/wTWX3gVpobVgYszT95wyR
   g==;
X-CSE-ConnectionGUID: vIaAO+t4Q8ilAoAczroQyg==
X-CSE-MsgGUID: hGHv7Rj5RIajzrGPnli/Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639915"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:18 -0700
X-CSE-ConnectionGUID: PoIuiAs9TTSL9nP2JA51vA==
X-CSE-MsgGUID: s2ADALTDQRq8roI4ZaniFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271971"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:16 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/17] i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
Date: Thu, 17 Sep 2026 22:13:45 +0300
Message-ID: <20260917191356.133242-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121418_618338_41A18A94 
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

i3c_hci_enable_ibi() performs controller-side setup before sending the
ENEC CCC to enable IBIs on the target.  If the ENEC CCC fails, the
function returns an error but leaves the controller configured as if IBI
enabling had succeeded.

Fix the error path by undoing the earlier setup when the ENEC CCC fails,
ensuring the controller state remains consistent with the failed enable
operation.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix i3c_hci_enable_ibi() error path", to say what the patch does
	rather than that it fixes something.


 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8b3a87d8a8bb..166d9f70f435 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -703,11 +703,15 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	int ret;
 
 	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
 	scoped_guard(spinlock_irqsave, &hci->lock)
 		hci->ibi_devs[dev_data->dat_idx] = dev;
-	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (ret)
+		__i3c_hci_disable_ibi(hci, dev);
+	return ret;
 }
 
 static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
