Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09CBCD98DC
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9Hlfnof/FO3jZ6UdVCU7avwhHTqj2j6Im2qF7sRTFM=; b=QTN3XX1yqIPdKC
	2x4xBc2zc6mRfn3wJcl1F5YYkkzyEJwRoJqzQYGka0tHQhj5MPt1J/46tM9brMRKb1TfWciA3M2eX
	3Y/dG4dsHB0svxKmFxBgLTi7L/uUrX2/9jCpNssmGnGQWagnvHv5ajimCrhsLYjDR231rukKhPSYE
	gTh5NbuuOTzyeq3ghq4y8IWm0vs8ukS2c4PLRPPk/UH4J6TzB4GrY4saCjCXrMhPLDAJt2p6149xs
	z+MUfSL4Qpy1Q0vP6xm9GcOx2w0pJdKYjTxVOS2UM53nOA/sIlBAN/xUW+Lus+mmxynEMxek98hQx
	jmlCxotxoxsy31aLMYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpe-0000000AXE3-2Dvx;
	Fri, 12 Jun 2026 08:01:38 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpb-0000000AX8Y-0R6T
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 08:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781251295; x=1812787295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hlm/wya+n9NOIaapCCAWz8hKxUCeDWt5EzkegeKPzIA=;
  b=g0wU0Fh1/9S1LrmgsOxODvbGmgWWpLhwRQGLlEVWTBlY0Fori+YEYnQb
   iYV/li68midsYZPG0/L6PHhTR8kefH/N/GU5j/s+v3VDJrRCN7UB6nYiw
   PbmeEf/LaKAI+xC79ZDv3AnhyRgfXcM+xZQMS9eQIgfpAThxkHSYStRRY
   TZjrQ9Eco2CvVcuicECXCnE0aJ+ImCIwcxCG+lks3nRMezZJuwtqw+dfQ
   BUrWdnyQo6OCZxFETJdUqzQdAe36HcIPvTfdEHLf/ENjCd01LTxkeUlhi
   3JJSB+MLnBdT+oYkx3TaTU7murt8pSXnlqQUsKR0iR62DnsVi3yzMp35Q
   A==;
X-CSE-ConnectionGUID: vQxOIoZDRHKFs6cpdIRDwg==
X-CSE-MsgGUID: m3HRhhT5QgyypiBIZqlgtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82186754"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82186754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:27 -0700
X-CSE-ConnectionGUID: FJl3Ne3CQxSTdGMp0ymNow==
X-CSE-MsgGUID: z9hLAmt6SviwHw/yFguElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246630368"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.41])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:01:26 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 5/7] i3c: master: Make i3c_master_add_i3c_dev_locked() return void
Date: Fri, 12 Jun 2026 11:01:05 +0300
Message-ID: <20260612080107.11606-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612080107.11606-1-adrian.hunter@intel.com>
References: <20260612080107.11606-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010135_162736_4DE8DF5B 
X-CRM114-Status: GOOD (  13.52  )
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


Changes in V4:

	None

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
