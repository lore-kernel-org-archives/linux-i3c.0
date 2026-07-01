Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38217C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4iT7nt1hNhSXvy0tGehuCvf2m4HBp9y/xjBDMXv86E=; b=CYmfe5afBwk+IS
	TfH8tYuBZEAH725b3XlKB0aLRJQXw9fhk2+s+kywiOYkHj9AlqVVt7tk8CnYiubXBrwQLz/TRqpGn
	2mWSn6pVeY5QIydbA1IJHbTw8XsCZHNQNBj38QdoocMzgrc+lTYhkYJFqxpoko0nRk4uJGGvzWB52
	jSE55wfAlbt4M2CZZY6k3nobFLJmVvniVgGB0xALW1taPj+N2kU7bpf4Iuf5tE79m3psDhUUf4/LN
	r/1y5IESnDdXzBYwyoGlFXtJDw+5Y2EIKO4zLSK1WdesqAXPCa7OmZizb4N52M7Gjw3db0ahGjJ0Q
	hHtY0aeRG9kG3xtV3K9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1CK-00000002wVN-42bk;
	Wed, 01 Jul 2026 20:06:16 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1CI-00000002wRb-2ZuP
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936375; x=1814472375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3P3wdcp+8UpuSxAdjYoys5NJLGvY0xP8Nj5ewS+gK0c=;
  b=YHIOOKJ1JhRpBesVyo2+Ek24eYe/+XlRMF09ZG4q1+8rfjmHDTEJAuEe
   aF3e3OxXTgk/fl4GTxywGUm62cl43ScyDIbgsS7l65JHpor4OqLfxUV95
   Bi6ilzA3pvSLGyZGb1fTNaMq2s27dp4415C57phDrI16ZpSrQvR46Z8Sd
   8FX7UTWkcV/FeGBF7r1q7ccUYeYe17o6Bq5o79KoOrjTUnRnHKUZ2Bhtm
   5HFon5ZSQ/pG2nqC+TG41QZUCU9T3vQGoRHdm02FJjKMDGu5sEorRKUx3
   5/kai9OsCdCgzSwVx7pLh7yYiSXT47mF77hMJJjtKiD8WVMASLbxW63ji
   A==;
X-CSE-ConnectionGUID: aJ4t7I0lQ8GCTOyFPsedaw==
X-CSE-MsgGUID: NBaQYZNeQA6a32swSrIcAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83812922"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83812922"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:06:15 -0700
X-CSE-ConnectionGUID: Om5ZPycHSDekOLV1ewq8HA==
X-CSE-MsgGUID: j3E+ijG7RPuonhT7Jv+F9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="252805033"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:06:12 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@lists.infradead.org,
	linux-pm@lists.infradead.org
Subject: [PATCH RFC 3/7] i3c: master: Add helper to query bus wakeup requirements
Date: Wed,  1 Jul 2026 23:05:48 +0300
Message-ID: <20260701200552.220042-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701200552.220042-1-adrian.hunter@intel.com>
References: <20260701200552.220042-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_130614_671944_841362C6 
X-CRM114-Status: GOOD (  11.10  )
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
wakeup.

Controller drivers can use this helper to determine whether wakeup
support must remain available while the system is suspended.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c       | 27 +++++++++++++++++++++++++++
 include/linux/i3c/master.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index a36f9b617cbf..979457e635bd 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1957,6 +1957,33 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
 	i3c_bus_normaluse_unlock(&master->bus);
 }
 
+/**
+ * i3c_master_any_wakeup_enabled() - check if any device can wake the system
+ * @master: I3C master controller
+ *
+ * Iterate over devices on the bus and return true if any device has
+ * system wakeup enabled.
+ *
+ * Return: true if any device may wake the system, false otherwise.
+ */
+bool i3c_master_any_wakeup_enabled(struct i3c_master_controller *master)
+{
+	struct i3c_dev_desc *desc;
+	bool wakeup = false;
+
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_bus_for_each_i3cdev(&master->bus, desc) {
+		if (desc->dev && device_may_wakeup(&desc->dev->dev)) {
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
index af3c35a8e7b6..b9f2d84ac276 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -746,6 +746,7 @@ void i3c_generic_ibi_recycle_slot(struct i3c_generic_ibi_pool *pool,
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
