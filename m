Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEA2FEFB57
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQ2mM2FkCjY5AwIgATuLYif2rtHryCBeqAC6AGwu2M8=; b=cx2TzlDb8UOqGh
	QU5x9GW0gPQhUPtaEocYVH3JTmcCNT+6J/jIZqoCB2myC5B4szLJ/F309kjhqNh6m5R6qXp+2s51B
	OOUq0wTnm6r7RHxuqVwivddiO3DmYO0499WDzajL5Fma9ayYohD8K60+F4zIt1E3BLuY6o8Oz646m
	vW1WXYiGvoEBqoTJVwM/pcYouDYwakDiZk8gVbuTZeCQ+tEaG1W6mIJIkN7BmqrOLHhLbZlgmwiFH
	YuIijnkCfb5rIeRCBOURlPqhhiBTxz1u8aKhH9EZTxL21fMta8aJtUHYmD2qI5pvuRWHi6jIcICpN
	6xypm5CzpSrpnQCb97Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZh-00000008TTF-3D62;
	Fri, 27 Feb 2026 14:12:13 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZe-00000008TRS-1g9m
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201530; x=1803737530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nyn+KkXVzy6GsMDfhRAZ0tJFhMmU4+2DpCRCl3oG+gA=;
  b=YZFpwIzdUAQkeS7jTmxpQupZS5x/IKcXHqXtMxNUgwnJxL3+AkRwydiv
   KgzwXRyuMjZg9fv+cH0TUtUA9A++nK8MYxXpOAQ04Yj6cThLggNPSLlqP
   91DT1Qum3lu2CvuZWBhSHjrNisW1Pz0zt/fgdF2pBJXL0JWCx9aapEueR
   XXmgcmYH321vn/FXu+v9MkUKWO5HcZDb4S9I028WZPhYV2XgRA9jDwhDC
   cENyPgLyzjyoYAvu651rIx9jQgt9beYStGog+XwGduZcN6fnTEpp6tRNo
   BZ1QdoR5Wldw4m6SEKY0/4m/CnAurFGSiw7eBl7OWBLZ+E0ZgdyBzj7YA
   A==;
X-CSE-ConnectionGUID: 4uCwTMGBSsm13HcJ1++ukA==
X-CSE-MsgGUID: vnX3JeH0TeqIz3smJVT65A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750008"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:01 -0800
X-CSE-ConnectionGUID: KTCiFexpSQuoLjNOvZZXZQ==
X-CSE-MsgGUID: e+VDhtrmRXWImyzrBcB62g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015546"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:00 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 01/12] i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
Date: Fri, 27 Feb 2026 16:11:38 +0200
Message-ID: <20260227141149.184980-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061210_665356_D0A033A0 
X-CRM114-Status: GOOD (  10.57  )
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
---
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
