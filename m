Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E006C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olhqU/jf+HlWUgsv4vW5biT+oJsmB88PESFwx/npcfM=; b=lWlm026ThmxJbG
	JztwTXo9nbZk9xk8/JYzuvOmZ6FKUA+r7qMKlPpYngEMfy0a3Qlk6JwXYKbWU4hrIyaIy1WwLSJ3/
	2+QNc5DTQamxRDdDAkvtD7W7CVVjBDGmvMBO69zdJsXh24uGE1kz2xnlqoPYl9nYkxJmyVit7lh3m
	QoOqY2K4U5HRFPZuSZyl3UFX25KjR8xYfmDlc93EUwE6UhM7WsQffJ93NF9zzKljk0a7gEvQMqvLG
	ntIHaUEwwy/15+eq0m8o4msMy2+ZGFzEgzm7VfWk8M0fufp+KaDhL9/F3YUMvdc9vsJTHOvO0OjiR
	h0p38tGENWNbT3XHNdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7X-00000005jHN-2yKC;
	Tue, 28 Jul 2026 15:53:31 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7V-00000005jFt-3sG0
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 15:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785254009; x=1816790009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U//LNM0JF380/UWtxZO62C4GqoySdCbLHUzAYHrU9Ww=;
  b=eno3NKegJfnQKP7QmyM28heg+Vny3dILsmE5hEt5ihi/Eo8uORGR8ZeP
   K2HipkNi/Ze8T+0yglfP0/2wgeL1Cxuk6eRdEKKppcmA/0eeMRL0ehDh0
   TO0Sh10xKRQ8XcMWnRQvRGnmlkWUt6AQjsJQsXHatxaNVZpCvoghN/3Ve
   I2Y9JY+fR7iXbsELKgTFUv/YEYzorIn/s2ABnXQh3EZ8GA5utPzZBv/KV
   97AgNyBniCRSxG4Cf0jFoLNxxRsTE8z+uQvc3wT+O6c6fnBG+ItCf1xIG
   poHv8YDIWAC+FGTA+6CayqLvpoc8Z8OMCP7pFRRR5LthzrN8snLwA2zoO
   g==;
X-CSE-ConnectionGUID: 3OZq9DMiQbOzVduLv8Tpww==
X-CSE-MsgGUID: ZeewvIF3Q3qI3CCaFkOB8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85696622"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85696622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:29 -0700
X-CSE-ConnectionGUID: FJ/ciscGRV+GkvAN9yIR7Q==
X-CSE-MsgGUID: DSommHvKT62yYTSCInOmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255817568"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.126])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:27 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 4/8] i3c: master: Add helper to query bus wakeup requirements
Date: Tue, 28 Jul 2026 18:53:04 +0300
Message-ID: <20260728155308.142713-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728155308.142713-1-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085330_002605_1215343A 
X-CRM114-Status: GOOD (  11.69  )
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

Add i3c_master_any_wakeup_enabled(), which iterates over the devices on
an I3C bus and reports whether any of them are enabled for system
wakeup and have IBI enabled.

Controller drivers can use this helper to determine whether wakeup
support must remain available while the system is suspended.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	i3c_master_any_wakeup_enabled() now also requires the device to
	have IBI enabled, not just system wakeup enabled, so that a
	device with no active IBI request does not keep PCI PME enabled.
	desc->ibi_lock is taken while checking.  The commit message and
	kernel-doc are updated to match.


 drivers/i3c/master.c       | 30 ++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9d56ca08569a..dd49652425b4 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2048,6 +2048,36 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
 	i3c_master_register_new_i3c_devs(master);
 }
 
+/**
+ * i3c_master_any_wakeup_enabled() - check if any device can wake the system
+ * @master: I3C master controller
+ *
+ * Iterate over devices on the bus and return true if any device has
+ * system wakeup enabled and IBI enabled.
+ *
+ * Return: true if any device may wake the system via IBI, false otherwise.
+ */
+bool i3c_master_any_wakeup_enabled(struct i3c_master_controller *master)
+{
+	struct i3c_dev_desc *desc;
+	bool wakeup = false;
+
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_bus_for_each_i3cdev(&master->bus, desc) {
+		if (!desc->dev || !device_may_wakeup(&desc->dev->dev))
+			continue;
+		guard(mutex)(&desc->ibi_lock);
+		if (desc->ibi && desc->ibi->enabled) {
+			wakeup = true;
+			break;
+		}
+	}
+	i3c_bus_normaluse_unlock(&master->bus);
+
+	return wakeup;
+}
+EXPORT_SYMBOL_GPL(i3c_master_any_wakeup_enabled);
+
 /**
  * i3c_master_dma_map_single() - Map buffer for single DMA transfer
  * @dev: device object of a device doing DMA
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 99f89fef7653..d8cdc7ff2459 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -748,6 +748,7 @@ void i3c_generic_ibi_recycle_slot(struct i3c_generic_ibi_pool *pool,
 				  struct i3c_ibi_slot *slot);
 
 void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
+bool i3c_master_any_wakeup_enabled(struct i3c_master_controller *master);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
