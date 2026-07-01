Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2079C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XKsklzRFBZR2rgAzcr+ukwWYjw/IbNZSebsaIGwwXE=; b=x0bCZOco0Na7bT
	9ihzsHUPWfcY2lX38QoJNM0t57nnxfqYi2JvSzsGYFmVu8F1THolEgrQdQ25sCktNkSqVkPNhBBi3
	Ni46wepU8ylPbEg0WUsB9F5g5DfZ9oWzMXOFfUU0MyzHxw79L2sxojmXADecYWwYKTr3jUxJQRULB
	TqlIMncCDfXSoRv7y9cZmJtf3CzrzkY8/7G81NQxNWs01oIAVXV2cPaJCdfG2I4ekfijb7fBKfo10
	wcc9QNLK/aPUhyYUnEK1KWKHorm6G/NZCSUEgEeQBa5jL7g7HdgJCY5SiXT8ZwJKlLPCy/4V/HV6e
	mThx/FZIsTtdNmWppekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1La-00000002x91-263y;
	Wed, 01 Jul 2026 20:15:50 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1LY-00000002x67-1urQ
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936949; x=1814472949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fUJQmeO30dZmNsYhdWgV/Cb07B9pDkcedp1zvYifsZg=;
  b=QztX+sS1ycXG316grWt4EIdkCyGrpMGDGYMvJtqiIsr+X8Zl0a3e3h14
   wFa1uFC3ljqzpBVKj3ldlfbH4CYZCvOfF73bfUUANbFg1H/7YPyoUuPYe
   sjdaIKMcNA8mxN8vFGfFrpZqUIhqGJVuUupjeAycQjnu9p810CwCGVx+j
   g0Rb6I7KRtZY2azZOVoCbLS+9ZK6bZwiKygZ2Llf0V8qhkDopBtkI7IAj
   17mNU/O4O3/5w8x/slhLBnFB8XupMtsrJmFnuKCtSM4esrzhEIuxEjdNM
   SNXuU9pnzNgKEcOrFpvtmRJH61Ez4dw9V6zkcqJC3sQ1BTyMYvWIMF33/
   w==;
X-CSE-ConnectionGUID: O3bgcLhrQI2UsQDloG+FPQ==
X-CSE-MsgGUID: LdlOs0OFQg+CEWzXiDwqHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82671792"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82671792"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:48 -0700
X-CSE-ConnectionGUID: EMboBcFmTP2KZKekYgsSDA==
X-CSE-MsgGUID: U9dQtbuORxuGn5dDFu35XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282737053"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:46 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH RFC RESEND 2/7] i3c: master: Report wakeup events for IBIs
Date: Wed,  1 Jul 2026 23:15:28 +0300
Message-ID: <20260701201533.220818-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701201533.220818-1-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131548_503649_B7440E14 
X-CRM114-Status: GOOD (  10.20  )
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

An I3C device configured as a wakeup source can wake the system by
generating an In-Band Interrupt (IBI).

When an IBI is queued for processing, record a wakeup event for the
device if wakeup is enabled.  Use a 100 ms processing interval to give
the I3C device driver time to process the IBI.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index a47e2924bb70..a36f9b617cbf 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2994,6 +2994,9 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/* Approximate time for IBI handler to run */
+#define I3C_WAKEUP_PROCESSING_TIME_MS 100
+
 /**
  * i3c_master_queue_ibi() - Queue an IBI
  * @dev: the device this IBI is coming from
@@ -3007,6 +3010,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
 	if (!dev->ibi || !slot)
 		return;
 
+	if (device_may_wakeup(&dev->dev->dev))
+		pm_wakeup_event(&dev->dev->dev, I3C_WAKEUP_PROCESSING_TIME_MS);
+
 	atomic_inc(&dev->ibi->pending_ibis);
 	queue_work(dev->ibi->wq, &slot->work);
 }
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
