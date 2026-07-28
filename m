Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA889C54F55
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSDo6Che4myZIxlRic/QHqdIz4aLEr/5f0TyeMZf2lo=; b=Z8J32bWW5yrNU4
	vuN2PmhMmbeRzkJeKDDSWjYBVwSB4RLV/LZNtawkAFjPc8k6KR0iuFJLJppz9GQCUiylA3Asf30zm
	GywD19hc8anvBx3T6JjqOXvDU7b+5+Q8uv2xUGwBL8CaTwfiWZjkfoa7mkhp4zCpKBqYPYj/hEFJU
	+i8f3vvzJEsMCrmEQbhONWQkbhMNFvEoPo7rDqvyFgBBSiqNbZKqi2gZrb+sjb6WqmxYqX69e39ug
	8HFTv4tDsOSBo+fWJYVLoj/npEE4/WQ1Re3+KGkKZwhr0n6I0YIrjFsXbO1hTB98TzhyzfV8AmK/p
	vAiODUVlGXXq8Eu0RWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7W-00000005jGR-1OKS;
	Tue, 28 Jul 2026 15:53:30 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7S-00000005jBg-1L7x
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 15:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785254006; x=1816790006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0EBtWuBQlGKuNMxcLbHMlP+7SpipqmE1T979hPNe/Yg=;
  b=S+NbASaJwc921P3QNtQjjR/IZxRHnQySbcdnnuHp5R8F/TJVXX0Ak8ww
   CbyR0azDiWHNy+yZ3eWjfbIfJmXiDd6VkPsDsrQLlybPJFknwCID6cWs3
   Xun4wyYTEgxXQe+hKrZcPkKbzKDjKhvP8mE28C2cd1qKVj4VQ6M8BNBdR
   4NdOvm6FPwnhMAt+FvB6RFH60LXyEK+SUTRKH+gRDf9ZBHoPUVv1m3a9y
   hYPej/Hnoa5AiubzIh3saUAAke1VupJ6f/XeTKTkmKs1ru5CEQhpFem14
   BOahUUAIiZPNL0XUKhUp5ncpxozmRK4frbBSG8bXurWCxanSSYrdOyA5U
   w==;
X-CSE-ConnectionGUID: 8tC7aWcOTDeMXybLcbf8LA==
X-CSE-MsgGUID: 0IqdKsU+SUmJJ0xc4jorGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85696533"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85696533"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:24 -0700
X-CSE-ConnectionGUID: qlf5VOKNSfOx5q06RUn29Q==
X-CSE-MsgGUID: jkbz94joQyKTilJGQYcjrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255817453"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.126])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:21 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 2/8] i3c: master: Support IBI-based wakeup capability
Date: Tue, 28 Jul 2026 18:53:02 +0300
Message-ID: <20260728155308.142713-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728155308.142713-1-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085326_433565_471DF9DB 
X-CRM114-Status: GOOD (  11.34  )
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

An I3C controller acts as a bus controller for one or more I3C devices.
If the controller can wake the system in response to an In-Band
Interrupt (IBI), then any device on that bus that is capable of
generating IBIs can potentially be used as a wakeup source.

Add an ibi_wakeup flag to struct i3c_master_controller so controller
drivers can advertise support for IBI-based wakeup.

If set, mark IBI-capable I3C devices as wakeup capable when they are
registered, allowing wakeup management through the standard device
wakeup framework.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Dropped the redundant #include <linux/pm_wakeup.h>.  That header
	must not be included directly, and linux/device.h, which is
	already included, provides device_set_wakeup_capable().


 drivers/i3c/master.c       | 7 +++++++
 include/linux/i3c/master.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 874f6e11b296..cf3345265ac0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2008,6 +2008,13 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		if (desc->boardinfo)
 			desc->dev->dev.of_node = desc->boardinfo->of_node;
 
+		/*
+		 * In the case of IBI wakeup, any IBI-capable device can
+		 * wakeup.
+		 */
+		if (master->ibi_wakeup && (desc->info.bcr & I3C_BCR_IBI_REQ_CAP))
+			device_set_wakeup_capable(&desc->dev->dev, true);
+
 		list_add_tail(&desc->dev->node, &i3c_unreg_devs);
 	}
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index fa1c98f0f5c1..99f89fef7653 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -513,6 +513,7 @@ struct i3c_master_controller_ops {
  * @hotjoin: true if the master support hotjoin
  * @rpm_allowed: true if Runtime PM allowed
  * @rpm_ibi_allowed: true if IBI and Hot-Join allowed while runtime suspended
+ * @ibi_wakeup: IBI can wakeup the system
  * @shutting_down: set to true when master begins shutdown or unregister
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
@@ -547,6 +548,7 @@ struct i3c_master_controller {
 	unsigned int hotjoin: 1;
 	unsigned int rpm_allowed: 1;
 	unsigned int rpm_ibi_allowed: 1;
+	unsigned int ibi_wakeup: 1;
 	bool shutting_down;
 	struct {
 		struct list_head i3c;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
