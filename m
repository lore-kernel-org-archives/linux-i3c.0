Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D7FC88E50
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewmjysgM0AeceeR3KVcMFbQsU7ePQZ82CpD1ArN/5nM=; b=WNWLNW9UTPP4ip
	havyOhSUr7+1LjWe+VNIQjIeJXP744u962xo8s8oMpi0AWMUOURJCfQABNJKgLCUDc6S46ddpZy7C
	Koa9uOLT2Pvj11r0xhnZhQCRlLo8reMKq2gWCR7WBuwaXeGsAbySnaOjCJPL/cRJo56VaYRYc74nw
	8xgnpi/8ErN3HOtjWs9cppepkgS8cXvvk0Q2+7E9ItzCLKenFIir/0dxWw+HHS8SxuDLRzdCU4lOg
	lJlFc707BxLz6BsgL2KyQeUwxTgAhbiUGHdml55PuQgnszbEx/LqMwNWk9CD23lA2GIF0eHx/k/Us
	bdzQpxqFIaAooiAS8zVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tQ-00000003FB3-2hl7;
	Mon, 14 Sep 2026 11:30:36 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tL-00000003F4u-1Y0D
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385431; x=1820921431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xiBwffZ+2jfHOWWFIuWoiFPyt7CRh5+pNTC+PTaon98=;
  b=aQv+BwrHJDZFvXRmuuNOmrFxNIhsvpPg3PMJv5avXIt/h4KX/7SFnd4f
   eZeqE2s10YwqlqhHCEVHsFJkcPesKx7vey/vUiRoxS8F0X9OLbVasUb1w
   ulgsqZpfTP1lvYlSqL5w6YyOl7+h9xmjF66CI4HmnROBgAE/PqcPv4dI0
   XwcG+rKbItPu1yHLZg6iaTs4j/c0zPA7BCrq8XRqSyX8eJxv9uTlKjLEE
   FwWZARwhEy/eMdQyKMP/rI4HFcexP+74Q7CyS5NUB94Ycr0v7YQFd84w0
   h2q8VFL+7DCkU6tLUmgZk25SK3jk/QbiG5AdjFss8isoxiKH/h4Wq5ZRy
   g==;
X-CSE-ConnectionGUID: xsYjpJp2Q32ZO5xSz9oM6w==
X-CSE-MsgGUID: kkydGCAMTMiDpBwBF70njg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864446"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864446"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:30 -0700
X-CSE-ConnectionGUID: hmCxbhwGQdiBUdBRnxBtBA==
X-CSE-MsgGUID: kBXAUQcWSrWNeT00W9aLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133116"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:29 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/17] i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
Date: Mon, 14 Sep 2026 14:29:53 +0300
Message-ID: <20260914113003.183150-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043033_347638_E8F3D00C 
X-CRM114-Status: GOOD (  12.06  )
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
---
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
