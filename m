Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F0EFCE37
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D081cNBK87XTf8TyOk6TlVb4vL90kYlNk5yzafDbN7E=; b=CReZY9LRs48mK5
	NDcGYOiaMVtPeltaXRnL3wlFASYJI+c++3nSJxw1bzlLToqE2SwuE71BxyJJZmqxw2PPko6sjjjAM
	lwRvcgugRUNmxgH0bwW0zjF8V8HnpUtyEPcoXvco38019kSsVmoURLZ5+AxjWzDm5D8cB1ais+lg1
	BoJ+14Wu5fRALcHwrJHNApCE6YlPG0Q07c4OTA3Gi1KczY9jj17WMvg3uKs+Kup53laL18Ch6lhHy
	YxHUzsOrbSURXcmbwKpviXBkP5r6mdgoAjUQlobCM6ndO91edsskNgoF7V8O25pGN9RZiU5qOL4wB
	GkAJfR1KYNzL+7wqRm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmi-00000000K1N-3V2l;
	Wed, 04 Mar 2026 18:17:24 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmh-00000000K11-0zKT
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648243; x=1804184243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1fK6rC5QdyhzXtZxqpz2zn5xNwDBI9S6g3AKy0Bl2PY=;
  b=O5LRni0iU8xGXaQvVtjhcpIGfWKt7owMRSJ+CEzach89deDlu1dhztU+
   cnACpTcoLrp7GCfKPmLJE9EXMa8IIkehjTD0HYfadPthEBDA5Zsht0lu9
   lUq6iRITe43Rvdvs7grbltnf6omIfxr1ftkAzhsAl9XTJvya7X/6N9dkG
   Sxmv/dMcOEqMptn3FVabDjRQAnOKm6DjWCorBFQjqB6GknhjNumnzqt1F
   DZzFVp9wZMXDHBpOF9scweKK8DVNOlILCJgWMT1vLUenJRK5JhCKtGXlL
   HZyKEFGzybgWumc4RvtTrps7Gn31+F0iQ5NTuWWTZlvvQFbt/yuniwZq5
   g==;
X-CSE-ConnectionGUID: huvpoDE5QsG1hZybkMd9aQ==
X-CSE-MsgGUID: ol1WhgFVRoOssOq8putCIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745877"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745877"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:23 -0800
X-CSE-ConnectionGUID: fxd4Rhl+TSuoUc7TWLZGuQ==
X-CSE-MsgGUID: LqTuAgICTnSZ8STyCpHY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656704"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:21 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 01/14] i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
Date: Wed,  4 Mar 2026 20:16:52 +0200
Message-ID: <20260304181706.143841-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101723_289571_7FC0D780 
X-CRM114-Status: GOOD (  10.72  )
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

The MIPI I3C HCI driver currently returns -ETIME for various timeout
conditions, while other I3C master drivers consistently use -ETIMEDOUT
for the same class of errors.  Align the HCI driver with the rest of the
subsystem by replacing all uses of -ETIME with -ETIMEDOUT.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c | 2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index fe260461e7e6..831a261f6c56 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -334,7 +334,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 		hci->io->queue_xfer(hci, xfer, 1);
 		if (!wait_for_completion_timeout(&done, HZ) &&
 		    hci->io->dequeue_xfer(hci, xfer, 1)) {
-			ret = -ETIME;
+			ret = -ETIMEDOUT;
 			break;
 		}
 		if ((RESP_STATUS(xfer->response) == RESP_ERR_ADDR_HEADER ||
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
index 3729e6419581..054beee36da5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -275,7 +275,7 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
 		hci->io->queue_xfer(hci, xfer, 2);
 		if (!wait_for_completion_timeout(&done, HZ) &&
 		    hci->io->dequeue_xfer(hci, xfer, 2)) {
-			ret = -ETIME;
+			ret = -ETIMEDOUT;
 			break;
 		}
 		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 5879bba78164..dbe93df0c70e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -261,7 +261,7 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 		goto out;
 	if (!wait_for_completion_timeout(&done, HZ) &&
 	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
-		ret = -ETIME;
+		ret = -ETIMEDOUT;
 		goto out;
 	}
 	for (i = prefixed; i < nxfers; i++) {
@@ -340,7 +340,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 		goto out;
 	if (!wait_for_completion_timeout(&done, HZ) &&
 	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
-		ret = -ETIME;
+		ret = -ETIMEDOUT;
 		goto out;
 	}
 	for (i = 0; i < nxfers; i++) {
@@ -388,7 +388,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 		goto out;
 	if (!wait_for_completion_timeout(&done, m->i2c.timeout) &&
 	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
-		ret = -ETIME;
+		ret = -ETIMEDOUT;
 		goto out;
 	}
 	for (i = 0; i < nxfers; i++) {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
