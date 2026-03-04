Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D89EFCE2A
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrr++3dW0IMv6yjfF9EnOZCB2J0Fp/yQ6PwJNKPCo4U=; b=o3tvKF7m8dPSti
	vsxLvejvuGmoYYCCmDa6AFELo9ehgcRoFeBzDQH4dpbHx/EiXU8MEBSxpGdR7uRT+j0JJkHKxnQib
	vi8qL7mbDw51pnE0bArdYTHBJyc9mclxf+UlP2n0061hRzGQBuHxcabZjCqbrRFNDdotpPPWpoxGw
	Nqx9gQOo6KvzmgnSe9vA7t6ugRgomOR3SL1Q/JzYbuyn1qbaUq1u7jkgwwBKMDCauvAakWrZ95yXK
	S8ebH/aPw4UfrOSsuswvZxs7msUM97W9dt5BL6frTPlAbuxZfZ6X0b0SmQMAj8TQ5JUFVj5KVZBA6
	9FheQC8N5et1dYKXZ3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmr-00000000K6e-2ZJR;
	Wed, 04 Mar 2026 18:17:34 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqmp-00000000K1V-3Gkj
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648252; x=1804184252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SKYb+cLJaAB3MGBm1NBKhRiRtKu+W6iYJjrzE+XodMc=;
  b=D/3SDXM/kkK18SzFGMO+Kk3p9uyxxY/kSR78FD6IinUIzl1AYIHma035
   adKpAJIZ0TezeLmrARDu5cqBeRpmtJJJd+/o7ZT66051R/uxePwFpOR7H
   TgG8Xw5+jkjRomrVsqotTs/LsBcWTYs99HKTP7pJg5SSEsEIQsTdUCZW8
   64cP8pgn632eE35p/jo69CUR1Jtin0DuPNVemf4SOj6CtCpqnJNMDt8Ea
   vBJRvWerHHpTyOFDPCjN2bngVAnvNUP7bQHP5Nd2n48GRM+ejULL9bayI
   dw0Ej4M8c5K0N0auJcLDGs+FcL/NgFIhW0ms951eVRMLlLkGnae6WdxJV
   g==;
X-CSE-ConnectionGUID: 22mTQsYaSpitJMRmXAnIbA==
X-CSE-MsgGUID: jFimt0G0Qxmj6se5OdNJRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72745905"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72745905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:32 -0800
X-CSE-ConnectionGUID: 2oHVX/AhQ4ePtzUkhzCliA==
X-CSE-MsgGUID: N6u8sS9ZSY+z74VZMije4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217656759"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.133])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:17:30 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 06/14] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
Date: Wed,  4 Mar 2026 20:16:57 +0200
Message-ID: <20260304181706.143841-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304181706.143841-1-adrian.hunter@intel.com>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101731_829172_7450B203 
X-CRM114-Status: GOOD (  11.98  )
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


Changes in V2:

	Mutex now defined in struct i3c_hci instead of struct hci_rh_data


 drivers/i3c/master/mipi-i3c-hci/core.c | 1 +
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 2 ++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index faf5eae2409f..061e84a5c412 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -927,6 +927,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&hci->lock);
+	mutex_init(&hci->control_mutex);
 
 	/*
 	 * Multi-bus instances share the same MMIO address range, but not
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 74b255ad6d0f..f7d411e5e11f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -547,6 +547,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	unsigned int i;
 	bool did_unqueue = false;
 
+	guard(mutex)(&hci->control_mutex);
+
 	/* stop the ring */
 	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
 	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f1dd502c071f..9c63d80f7fc4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -51,6 +51,7 @@ struct i3c_hci {
 	void *io_data;
 	const struct hci_cmd_ops *cmd;
 	spinlock_t lock;
+	struct mutex control_mutex;
 	atomic_t next_cmd_tid;
 	bool irq_inactive;
 	u32 caps;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
