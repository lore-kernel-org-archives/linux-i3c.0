Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8387FC88E70
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLNVAPtrsOhQWzU2921s5yE5/gGtVE+u73l3mJmQhfQ=; b=r2f/C/54aej47h
	uZC+Vzynz93J+zV1uFilKtfws7o6ghJPVE1nRQK2obyIN+zGWT5m3RnP48SKucbNiT3CCtc7WCTIs
	Py32A4x+gTVYyGsHLyI3za57Zsoy4zFuoZ5F9YRGoUPjsW71/ykRv/gfm49cIioPNY48fQKnRYC2F
	B/Fa+LxbaSPtM6qLLlHMnc4f+ldVkhNLbuBdL9WqDvoFNki+imlHVdaak8V8+1nWtRkGfwMgBL/fN
	YUM2HOQ2ryZwB2d9Wsp5YRzV+gxezPbulo8GqYG1pNfQhUwxDvsrz33jSIO90+PsG+VR0WUqonK6R
	xPUzZqBuFqtIoDhplYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tT-00000003FDe-12nx;
	Mon, 14 Sep 2026 11:30:39 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tN-00000003F69-2Zp3
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385433; x=1820921433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A6ansUeDN7k/9sT0TmvrZh2giOrXschlK/7xkmr3exo=;
  b=ihHC03uVgVgeCpkPG0340sYERuoi2hnLsRedNg5AjBPbJtO7Zp7iCZwc
   emKXoNxx3nGwLemYHmVr/yZrIRIlTsdvwOZnf0RsbsO809+HfhSHJ5CKi
   wFANPyGD/SUp4T6IcsJxav0KV595p2B82rdZ4sQItucKpuUISiPTEwT90
   IUXhz6Cvtx1s+eAjTdn0Vm91uFRg2ea5mnUSItoMIYpHxALN+7+aywx75
   eFP+6d0TFVy/IHCLTL3l+x3SbX5nffU64HIIG1/9A4o35Yb0Xc1LFsj6s
   ZrcNRGcN7BtEESBi2G9EFRS706QgYsJji7XQ0OuCfZIpJp/mvtyu99fGV
   g==;
X-CSE-ConnectionGUID: C6O9l0CiR3aLO+w93QQUfQ==
X-CSE-MsgGUID: EtDG+el1Q0KEZvmUi4wHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864453"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864453"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:32 -0700
X-CSE-ConnectionGUID: 4jnyY0tTSX6vwZNp/n99HQ==
X-CSE-MsgGUID: vw1VwUPxRluwSzaibhloIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133121"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:31 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/17] i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
Date: Mon, 14 Sep 2026 14:29:54 +0300
Message-ID: <20260914113003.183150-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043033_664603_F4B68534 
X-CRM114-Status: GOOD (  12.60  )
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

i3c_hci_free_ibi() calls __i3c_hci_disable_ibi(), but the latter
requires runtime PM to be resumed.  The ->free_ibi() callback does not
guarantee that condition.

The cases where ->free_ibi() may be called without a preceding
->disable_ibi() do not require re-enabling runtime PM handling:

- runtime resume failed in i3c_dev_free_ibi_locked(), so it skips the
  IBI disable but still proceeds to call ->free_ibi()
- the device has been re-enumerated under a new dynamic address in
  __i3c_master_add_i3c_dev_locked(), which tears down the old device
  descriptor and deliberately clears olddev->ibi->enabled (to avoid
  sending a DISEC to the stale old address) before calling
  i3c_dev_free_ibi_locked().  As a result ->free_ibi() is reached with
  neither a hardware IBI disable nor runtime PM resumed.

In both cases the important requirement is to prevent further IBI
processing for the device.  That can be done without accessing hardware
by removing the device from the ibi_devs[] table.

Replace the call to __i3c_hci_disable_ibi() with clearing the
corresponding ibi_devs[] entry under the controller lock.

Fixes: 650716f23eac4 ("i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index f6a34ce7a295..b9b20797d045 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -675,11 +675,13 @@ static void __i3c_hci_disable_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
 
 static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
 {
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	/* Must ensure the IBI has been disabled */
-	__i3c_hci_disable_ibi(hci, dev);
+	/* Must ensure IBIs for this device will no longer be processed */
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->ibi_devs[dev_data->dat_idx] = NULL;
 	hci->io->free_ibi(hci, dev);
 }
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
