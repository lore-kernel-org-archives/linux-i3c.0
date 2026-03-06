Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8666F01806
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omuQ4pRg3dQOpQHXVWs6JEOCyRlj6yl24/TImsp3OOQ=; b=oEy/7HZUUm93ix
	CfDNTI99zBPSbFGfjqqgS2gyT38692rkiRknD3A/kcXxZbc55cejIGVugBcgJx0HDdf/htY9N5Roh
	WglveMUMbWtO+gnnvD3qeMinLQGWdPkjEuhMM3lsG3+li8htiqXmxgUkt8g7TFaQ+JOO2Q1b4WQIP
	Fc2PojI6fF/fqwVWPYJoFiMSLWz2iP7GA6JmIqF+1m75kwk6k3l+xmDL8EOCduydcu4kvZ4LWW/B2
	Ybr71Fuq+4rPLsgATiLpSv/37LGhkkBGIkm23HnPhcTCSlj4dGEnEam28mBIHADg6cGaY2P5GeoUp
	XMR9k7N44JuiOCTkcHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYb-0000000394r-1UGK;
	Fri, 06 Mar 2026 07:25:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPYY-0000000393l-1aWH
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 07:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781906; x=1804317906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jdTdkwi1MeDDjW5nOFodWX4JRh0nH8HX2QtBd0lGFlQ=;
  b=kQmAVOPD9UDO9REw66g2RHJD6dGQ5BI3B87NEC3MSa8Y9kMDdxe+shWL
   JLnWGvRjzAJBy6uLWJj9boX10zHUNOD015Cz8roz1KiGDi+93bNhZtLLH
   o4mI5ZMLjYAvOXSIwYPtzgqjN8t3qHxtceXhKMUZZyh29DE2LCeAVWkIj
   J2435t1+l8ZMowevgkKrrgsy28XWnIAkRo2Xdxse/8O8aPsmSNDiVlHZT
   /2SAXrQiUVRWHv99evK+NGKMqJG5B+wuUxHxtj1RmKs2CrLdts1gXcVwk
   JVEeb83bN732EhUxoCCATljyNbYtKaH5ikOpl8WDhxXablMoPO0DFRTCR
   Q==;
X-CSE-ConnectionGUID: g52m42e6TFe8CmwUKJVtEA==
X-CSE-MsgGUID: q9OoFOF/To6VslQsKjsIiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91461311"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91461311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:04 -0800
X-CSE-ConnectionGUID: mYoWCCC+Q16hUOUeuV4+1Q==
X-CSE-MsgGUID: k6VzkFYtTLywHSSH5es10w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223419870"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:25:02 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 01/14] i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
Date: Fri,  6 Mar 2026 09:24:38 +0200
Message-ID: <20260306072451.11131-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_232506_429265_3964D312 
X-CRM114-Status: GOOD (  10.02  )
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


Changes in V3:

	None

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
