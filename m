Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20383FEFB5A
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyRwfUGVFJsF4hfQai98YU+SPDZcmg8BwabeR+LHAsY=; b=nGFesuYhMGNamj
	1UCTbSHdaE5896xxuOkaP/iu7T1xxP1JWwkZBVjOF32z+MS0Haz6QfmMMe/BCTFj07PT8SryASH35
	hEutkMa88fkoHTBKen8ce/7Bugi2lhr9q2H3UsjngT7Hi74kT00m4L7tij79wltYLxIP2rcZiV9uX
	FP9cdyTZlIaBddHwfDGGv7LXaUDofWK08CK8ewhe0meNZiH08HwqTnmF6/rehMGNyrC7WhoyNzbZg
	+SGgnn1l/86wEVGEEbzLxrkeeRq4Hp/LJnIfYubdgggKJD76dDniWuPxVIeRtlMJvc/tDm7gCVW30
	QrauCRpaON/GESEFXOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZj-00000008TVd-3SMI;
	Fri, 27 Feb 2026 14:12:15 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZh-00000008TRP-17ye
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201533; x=1803737533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MC5eQatcGv5l0lmDLAUfDDcWrrqlDb6TJe2NtnPopoU=;
  b=lfOK/toERwgbWOtBfEWwpW0t5cfLiefwQDNQkos1/KXVD63WzRYxa9Sr
   cACwdbSJ9rA5qDvKd1Q4Mrv7VcBCK/LtDuMXRIEkxGxvPEX16FN97buHp
   QkP4E2gmxHiMMhf4+ULTDpL7ct7R45Ct4dDBSbcyVVCV8Kc/3GSGT6a5J
   QpZ26wAZAxkdFl5DdnK7jICsCLxgkRt/QQL+0D2RtTnaaW2dPpKVy/8l/
   QGRVch5JDJq7VwAWhLxmKT70NLjhZeBCP1bTzH0va+jya7eEjS0T0mEik
   P/53nOqS0BmCC6FnjuFaCjfa5BHGIL8jwG67vpdkifpZXGQTGh5R6V1ih
   g==;
X-CSE-ConnectionGUID: Pd8YlN9rT+qy+IjxIpf1ZQ==
X-CSE-MsgGUID: maCGT/D0SJWWTWP5QyPL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750026"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:07 -0800
X-CSE-ConnectionGUID: 1QLCshSQSTy4aYmgmEizKA==
X-CSE-MsgGUID: oPxM5qL3RmeAE8TuAZGbPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015607"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:05 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 04/12] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
Date: Fri, 27 Feb 2026 16:11:41 +0200
Message-ID: <20260227141149.184980-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227141149.184980-1-adrian.hunter@intel.com>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061213_318563_C9B96706 
X-CRM114-Status: GOOD (  11.19  )
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

The HCI DMA dequeue path (hci_dma_dequeue_xfer()) may be invoked for
multiple transfers that timeout around the same time.  However, the
function is not serialized and can race with itself.

When a timeout occurs, hci_dma_dequeue_xfer() stops the ring, processes
incomplete transfers, and then restarts the ring.  If another timeout
triggers a parallel call into the same function, the two instances may
interfere with each other - stopping or restarting the ring at unexpected
times.

Add a mutex so that hci_dma_dequeue_xfer() is serialized with respect to
itself.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index f60654fbe58e..5a9af561e4cb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -133,6 +133,7 @@ struct hci_rh_data {
 	struct hci_xfer **src_xfers;
 	spinlock_t lock;
 	struct completion op_done;
+	struct mutex control_mutex;
 };
 
 struct hci_rings_data {
@@ -347,6 +348,7 @@ static int hci_dma_init(struct i3c_hci *hci)
 		rh->regs = hci->base_regs + offset;
 		spin_lock_init(&rh->lock);
 		init_completion(&rh->op_done);
+		mutex_init(&rh->control_mutex);
 
 		rh->xfer_entries = XFER_RING_ENTRIES;
 
@@ -549,6 +551,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	unsigned int i;
 	bool did_unqueue = false;
 
+	guard(mutex)(&rh->control_mutex);
+
 	/* stop the ring */
 	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
 	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
