Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2934DCD5BC9
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72REOxkUMOUGyz7mVCimUZ6Gu4xQTffjVBYV6+TNT/o=; b=CHXIhyDCrbmDxq
	x2onogzOiU3dYBW1iDZ75Bljwgb1G4N7fQPehgvySFvHu1XPnXb2PEIlftRdfgRMk0d5HyYo7Q+Lp
	DBVzTIFC8i3DsoN/vnG1Kd3UUCyew9ykZ8kc9HxBENT+D9cyTCqBLtT3ofdVuK2JS/R8K387dmAxO
	e2r9gq1tQAEghpoSOmUlCOhoiS1X02rP+CQ2CoBS2RA6h/wRlE5Cl3V8NSBPjIkDr2Q2sLlEHKoba
	eGjMGLW8SiPxqi2oObZyjbjtAo8BNa9bQBQpUmZvfq6sLg8J4acZGiUUN+KCRtCll6zNkF/1IBuTb
	R2suGsXYzPvHAnfo46Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQv-000000040C5-3qhA;
	Wed, 27 May 2026 11:28:21 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQt-0000000407g-1XTH
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 11:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779881299; x=1811417299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Iq0nkwrTWyxjQPZhGN3MqKxY8ovfTm8N2RMw1tn3sI=;
  b=EZEFEnELxnDYFirWbkLOpgeXcCrFJGgspvsK9B1Zhdqv6T165yRcPOYA
   Lt0jeOo7wBZxGI5Hhc6v3vGvlbTQwERsPbMy5VKhmdkv+foBmZDSLaAQS
   eitKuWn1mDOhEYjMG7fxhUzaAX4GwmiGf2DaQQoGoRxJmAaIXo96SP6d3
   1UPCSLMSS+cZw4W+ootNvTnn1RtIqtf0QrOHOcRDAnasoaIFfVLBhykaP
   6Sl96wLvIyXnq7cbHDUPoaH/Z8zwZ5P0aC2g4YfK4BPTzg+sX4orgpsIS
   8po8wMdG/u6Gia7o956/jLNWLI4YN4gpnKqSQwz2Os17dWTvd3qGwdxqW
   g==;
X-CSE-ConnectionGUID: 07Ruy4huQTuLUZfIq9ld4w==
X-CSE-MsgGUID: DEfxBiQ/TNGV59iew90cUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103381726"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103381726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:19 -0700
X-CSE-ConnectionGUID: hXeYWTQoR8iMXTCOVNU25Q==
X-CSE-MsgGUID: 69/hQMo+QamfvK4r7Cw6UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246238646"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] i3c: master: Make i3c_master_add_i3c_dev_locked() return void
Date: Wed, 27 May 2026 14:27:56 +0300
Message-ID: <20260527112758.38530-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260527112758.38530-1-adrian.hunter@intel.com>
References: <20260527112758.38530-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_042819_453282_50895AC6 
X-CRM114-Status: GOOD (  13.48  )
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
---
 drivers/i3c/master.c       | 17 ++++-------------
 include/linux/i3c/master.h |  3 +--
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7820f58ab4aa..c1188c5d1f23 100644
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
@@ -2458,7 +2451,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 		mutex_unlock(&newdev->ibi_lock);
 	}
 
-	return 0;
+	return;
 
 err_detach_dev:
 	if (newdev->dev && newdev->dev->desc)
@@ -2476,8 +2469,6 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	 */
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
