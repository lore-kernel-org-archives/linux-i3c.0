Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C407BC88E72
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEccMx79Lrfaxz8BogHq/NKgDdKbl9AZBDfAOtnUgEE=; b=b1BJrJZ1hfRaMj
	d7PzQ+mXpx23QPfEABECw1b+60XE7iaNfasAbtVcbC+3S/5N87ozpAHhWH+lKAQfi1pCou6obrTce
	cA1/0uPXTB8a6pkOReRsYkkQqID9prFTrWdY1MeC0oPQYK8W0wD849BcJxKw21cRyC8qs3YmljWPk
	njixbNyBqfSjCaXixCKHlIT7oDjtyikWVw60t9MiXqDV/qOwterdz19uTN/SKKRxpQUCmQuytKMeK
	K7LczmJPcXam07M/mvUKC/kzmQF3lDK7SXe2i5Uvr4YzbsxA5zdJHnV8mlCc9Bmps5TAzbKbBlx3g
	UntyYdSd36dfJ5bIWGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tQ-00000003FAa-2BlW;
	Mon, 14 Sep 2026 11:30:36 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tI-00000003F3I-147x
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385428; x=1820921428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PnOvkPZ/WXW8f4HhiUTjMvupYjHVFfcuoyhnEqzhSZE=;
  b=U0pYzH0KshYBeAJc0BO1/yAcXk1BkxGIxVe5tKat+1CZ2n+zTF8V3bF8
   gL4jEhvZL+zydQt3AnWNPP/6WoBiSG3fruvOxC57qAX2HQXoPOL6hE0U8
   t2Auu3MIqT9tULDeGo3aoDM9utCW7c8MS2GaL/2IQUZFsnFkwQCdtfnuz
   ZiLfSG0mexrrLifud8xmen+FvDMHmqOxsqpmK+Ql5/g3WCX/OTrVlq7HJ
   G6lfn7CE2+PV13W8Op7vxxY/urDElw8ptIzd553nAKQBWr6J6xJd4/TUM
   tl9ZCQzcaTHdzL7k7vVB00BOjNhk64aRE5rqWGUTh+YeQ4T5g+xcfdlQN
   w==;
X-CSE-ConnectionGUID: CM4dZ9ObTx2wLfTfsFRHNQ==
X-CSE-MsgGUID: JfaNhQf/RTCrVSPQs8AHsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864440"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864440"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:28 -0700
X-CSE-ConnectionGUID: tF9f+P3zSMaJw0UmnvWVkg==
X-CSE-MsgGUID: 64xSYaZ8S7mjHwakYL/Cug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133110"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:27 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/17] i3c: mipi-i3c-hci: Fix i3c_hci_enable_ibi() error path
Date: Mon, 14 Sep 2026 14:29:52 +0300
Message-ID: <20260914113003.183150-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043031_311527_9881F9A5 
X-CRM114-Status: UNSURE (   9.13  )
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
