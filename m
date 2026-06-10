Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EEACD8CB2
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b69ZMEzgnm9KQkrHdnHmBMB7eooXZ0hVrF5D/zJBPdc=; b=K+imT8PUkSzXM0
	NujLwtBSsUkyZs0f9hWwEDsXrvsYmmc4252Pg2W+xBy2ST1NDpM+3ZC4BJJ1s0067UcH2iTDZGn/8
	118sJLNfNSVgBbSDDnRN+L6UK1G4KOejQi7JeVORsyLl4LTZ3hQ7Cj/vPo/CHbUkJ2RLK1ByPskmI
	EXmO3Bl1GnhNALp1DyYbvmcAmHRGtPty0kY0Dpu+pTadfAeGJWTq5WulH1icbyFJI85cnVO61w5Gy
	TwRUDF2X6JbMhnLjRRCwbMllHpJ91zD2lrLbfYKRPQ9oPh4TvrptnGsjZlSzfg6vCZX4emuZuYH1+
	HPxxq5QAsUm9cCP1Ygtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOS-00000006xVW-03fQ;
	Wed, 10 Jun 2026 07:30:32 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDOQ-00000006xUH-16ON
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 07:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781076630; x=1812612630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dsu1ctZ70EilEQnoW4bUeFQgTLsDl9ljkjgC9tN1PQA=;
  b=V2OKCRnSdIEVaowNu0aMHRWCYMx6fQfiX1xI1GDKlF4WMMXMzXh4TQkb
   vSGQqgK/Y9mdfgklCNh2OaLQn6Ocue+iPwMj6Jw/gKC4Fg3PTQ82eAasY
   FGVvzvWd7ERorfe8gf/Ik+33OTrJXG67pxZcHBqWSA/KfsjGZNVu7vBGl
   oCGxXU7MurhsGUdEQzSbahqCH2fXZveXTAC9cPJR/p0SOqUoVFi5FBdCv
   TpawEyXp2fYRJNoMBIMINaccUpxixlhv68x3rgMh4T9f9tRyAh3nx6tnO
   8c6KkQWTUbxNGxazmGVG2qtDR1g8itnBzdssQ+lPVGyFYLOx72wkvL6kf
   g==;
X-CSE-ConnectionGUID: S+31I/UcQcaE7QNALHxJzw==
X-CSE-MsgGUID: qzQkAVhiRRy2vhJ3wBwHVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80878431"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80878431"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:16 -0700
X-CSE-ConnectionGUID: oQPr6+EbREiYciZpxb0G6A==
X-CSE-MsgGUID: Uoe+C2TcRmuv3nTaHuJ4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270103460"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:29:14 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 5/7] i3c: master: Make i3c_master_add_i3c_dev_locked() return void
Date: Wed, 10 Jun 2026 10:28:50 +0300
Message-ID: <20260610072852.36934-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260610072852.36934-1-adrian.hunter@intel.com>
References: <20260610072852.36934-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_003030_315160_C1E783A6 
X-CRM114-Status: GOOD (  13.57  )
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

The return value of i3c_master_add_i3c_dev_locked() is not used by any
caller, and callers are not in a position to recover from failures in
this path.

Change the function to return void.  Amend the kernel-doc accordingly,
fix some grammar and remove a stale paragraph.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Re-base due to changes in previous patches.


 drivers/i3c/master.c       | 17 ++++-------------
 include/linux/i3c/master.h |  3 +--
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7b60b0c7f646..57857a3351c7 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2324,19 +2324,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
  * @master: master used to send frames on the bus
  * @addr: I3C slave dynamic address assigned to the device
  *
- * This function is instantiating an I3C device object and adding it to the
- * I3C device list. All device information are automatically retrieved using
- * standard CCC commands.
- *
- * The I3C device object is returned in case the master wants to attach
- * private data to it using i3c_dev_set_master_data().
+ * This function instantiates an I3C device object and adds it to the I3C device
+ * list. All device information is retrieved using standard CCC commands.
  *
  * This function must be called with the bus lock held in write mode.
- *
- * Return: a 0 in case of success, an negative error code otherwise.
  */
-int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
-				  u8 addr)
+void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr)
 {
 	struct i3c_device_info info = { .dyn_addr = addr };
 	struct i3c_dev_desc *newdev, *olddev;
@@ -2460,7 +2453,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 		mutex_unlock(&newdev->ibi_lock);
 	}
 
-	return 0;
+	return;
 
 err_detach_dev:
 	if (newdev->dev && newdev->dev->desc)
@@ -2480,8 +2473,6 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
 
 	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index e2c831fb5354..f73cede87d36 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -615,8 +615,7 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
 int i3c_master_get_free_addr(struct i3c_master_controller *master,
 			     u8 start_addr);
 
-int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
-				  u8 addr);
+void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
 int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa);
 struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
