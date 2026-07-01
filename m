Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B2CC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XKsklzRFBZR2rgAzcr+ukwWYjw/IbNZSebsaIGwwXE=; b=OopSkCLpMai20b
	6REHABv7ViE9YlqIYtsy1VzThS6n9HldupnkweGo/a5//vA4m02420oDmDF6WtW1uaTh4806iwRtG
	7/uNREL1MpWOx56V2pW1lQBJooc2jCXlIaZslfS23wrB5ZA6/3lCjVKLaKSC3VRbCd0XL2KrCj/DU
	cLHyZ8Fapihjd1J8Eh5FOz9ocDGXDaxjQ+lawDmyluP7kPMBlcR9g/h3C8KraH1hpwgumzzMAPpzT
	SdCVRlKcB+Y9T7p+zVfQVZ+9QyVuGTJK9Pdci3l8kE1oJCet821twAuxDZ+e0xm/C6drJv9dP+Ako
	zrodJxX8+9wmgRDNp0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1CH-00000002wTX-3qxQ;
	Wed, 01 Jul 2026 20:06:13 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1CG-00000002wRb-0UBG
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936372; x=1814472372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fUJQmeO30dZmNsYhdWgV/Cb07B9pDkcedp1zvYifsZg=;
  b=LfpqSfTtSBfgjIhruUo4CQnAFxczCYQ7dJWHK9jZ4NYWZCe0i1QmOvlG
   JL55Zxs5r/AjJbM7FKNG9CT7T2kxI0tHgIHVcUZLEL4Z7PQI2LJE98T/N
   x+VmCBFu0xS+u5vfJKjWGvy2UB/areboP/oannJc0qZXq14Qcj9/u0Mjp
   uzHH3uWz6UppaqnZvN3YbEYqbuKVqv8qd4Ul50/Uv3vhpU/oTUGJUTZ6m
   CI/ml5UsKx5vT+cOSy2Xn9fABEx7rsgRnTP7Xh0FYkCBDLmbg7UL2u5Mr
   bnZUrzS7pY6/P/ysFKQ2xCAeyH07lPBg5Atpn3Tx8QVs7t9AWvg6DkMVN
   w==;
X-CSE-ConnectionGUID: HOkEV8yRSQu2ESnFMDueeA==
X-CSE-MsgGUID: BV941SLrRPmO/SaTnWS9JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83812912"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83812912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:06:12 -0700
X-CSE-ConnectionGUID: n8KdOeslS2CvHouqDLVrEA==
X-CSE-MsgGUID: Qf9tePqYQd+LdzJTJM0evw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="252805028"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:06:10 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@lists.infradead.org,
	linux-pm@lists.infradead.org
Subject: [PATCH RFC 2/7] i3c: master: Report wakeup events for IBIs
Date: Wed,  1 Jul 2026 23:05:47 +0300
Message-ID: <20260701200552.220042-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701200552.220042-1-adrian.hunter@intel.com>
References: <20260701200552.220042-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_130612_162240_2EC11217 
X-CRM114-Status: GOOD (  10.09  )
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
