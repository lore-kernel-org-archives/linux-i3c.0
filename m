Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E65C55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGUXwaHdp0Zy1H8kSUNwcvc/qR0mwqOXZ5DlAJhNMW8=; b=IbQSqiTW2Fbwom
	SDmNBGnHZMQEi1RLhxqpUN8TQ4JWbI+03K/AyFLqweHD8y+r6PiW3hmjG+oCAcJLfYjO5ErjDXvAJ
	cvMAMz5oqRtCBtPIj1+HU4g/wQr3RgyCSv1R1R5BGpgE4DhIix7iOD6snI3qcM9/vFlULWLLktm2w
	4/dq8m+N+OGkEKmFIbw8GE/TuGNf9Dac6fCxYiIBJgVOOqnxxK88KvWJ3SDgDqmALQ1XvwZpD1h3g
	EuFtN4Iu4PH+a/kpQE7YbplvslnaTse8ZsLzwxcW+qruNBx7vpnd2KLnlU0296OWYmUvBMFoeyOKN
	nvnAmHasg+XxGMa8CfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0W-00000005s8X-2hEs;
	Thu, 06 Aug 2026 13:19:36 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0V-00000005s3x-0LYB
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022375; x=1817558375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8cXJv+a33kqp6eilmp46Qbbm+eANnhR9qHTgafUpDR0=;
  b=LsP1IEVeXzDxlB4CA734ycextWaEDXVAplfar14c1mE+DWMgTtCGXfQo
   cobgUHMrajlSC9Prmf6LVQK63IQIWUyZaNmi0NpivWw/iVYUt+Okb5z3Y
   gHXFbLe6adg8Za2TdeYnmBHd+K6ToV3K1E5nTOHNNpkieA9HB9oz6ValU
   pjhKBCDgUAq7s9iGRShIDjD0Uj8VCd5Kz6jXlBeaO3kTSXc3rVWuL29Lj
   FUvI2ysS7LIwgijvPZ6nCHe03R1A5zoCBcaqKwJzBWX2q0ma7jyWiCuvS
   Ji5v/Cu7MvvW63jQYYf5ZK7t6JiVoy4aCGOPTlG3c3HhaYUX2wpN4YMvM
   g==;
X-CSE-ConnectionGUID: jbbbtpsuR72IgKJcKS3AcA==
X-CSE-MsgGUID: vmlJ/BCcSNSe5xtzAQFdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149620"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:34 -0700
X-CSE-ConnectionGUID: FDHh+cuwTpKvjBriPUT4PQ==
X-CSE-MsgGUID: ZfkrfyC7SYiat7ESCcIxAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338228"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:32 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V4 09/14] i3c: master: Report wakeup events for IBIs
Date: Thu,  6 Aug 2026 16:18:52 +0300
Message-ID: <20260806131857.119830-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061935_147950_9C8DD3F7 
X-CRM114-Status: UNSURE (   9.59  )
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

An I3C device configured as a wakeup source can wake the system by
generating an In-Band Interrupt (IBI).

When an IBI is queued for processing, record a wakeup event for the
device if wakeup is enabled.  Use a 100 ms processing interval to give
the I3C device driver time to process the IBI.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V4:

	None

Changes in V2 and V3:

	None


 drivers/i3c/master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2616354dbe54..6c5341491944 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3384,6 +3384,9 @@ static void i3c_master_unregister_i3c_devs(struct i3c_master_controller *master)
 	}
 }
 
+/* Approximate time for IBI handler to run */
+#define I3C_WAKEUP_PROCESSING_TIME_MS 100
+
 /**
  * i3c_master_queue_ibi() - Queue an IBI
  * @dev: the device this IBI is coming from
@@ -3397,6 +3400,9 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot)
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
