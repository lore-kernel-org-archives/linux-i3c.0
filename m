Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308D8CCF2D6
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za3AzEUzl656eYFJlq1PJo4wJB2/HmbIgPU6Rn960KY=; b=Z444wwMBnWrnaq
	g4UcFEqwEOZ6O+mCQwUStl1PlNFpKenJmTGHHhRXXoHo5cdaQsL4AGZCN+pQWDxRMd7x4yLAeQXGx
	wGebw6kSKCrU6RzG9PkaPOKwsCiohMaWkUDCe3sCWvpbER8hcBPklaHkRggtGF0HzcPL+qyAG51CY
	gjNvSgklHoMZTeZLev6ZE5qr04/o1YNZxrG3QMP7SnpjKb42PHmM0xqEyyb4eoMsgzUS/u9b2fZyr
	S8OqCuTUl8iEe679Xp5Q972okjzF7PIwX+Uut71N3BGrrLWcyqZ2Is6K0sqfkh74C7/+O/GIKgo/m
	VmzpbvKcCWGL8HkT375g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6J-00000001hOt-3vcp;
	Mon, 19 Jan 2026 10:03:11 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6H-00000001hMc-2Kl9
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 10:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816990; x=1800352990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2kti+6vlnbnMZF3EyDbO4TXZHe/cBONe/RivHUQhX0Y=;
  b=KzK6LXaXsMiYGG/elgv4zjuX8TQoQq9CVPo3/9shWGjhyop9iBbVmaY2
   Ow+v/+Mb8y3+BU0KofddMJFg3t0xpR09ta9r0ozgHIqZvRwIWa+UlxIT1
   tq5izffdZkrFwr7L4FFT6U+x+u5mUjdCVudurMN6ZObe6Ib9k9BxkOwt5
   qSlZnB1W+dsD2ekpXPoDwrIHVdX3z75H0D4dk6afHPaXQZAYYr0Ma25Ac
   cavOMlPA6YXfqKPvxp2TmsDa3XzRavcV4Th0oti47j9wxs9F994PH28dn
   uHhoC/+WJx8I9MhGBzYWCyY3VbX/6wBDelFmYnlwCQjKtvqPH5UQZFs9Q
   g==;
X-CSE-ConnectionGUID: Pjcy9mOFRvS8kGfCOvEa2g==
X-CSE-MsgGUID: 5FXGhc0eSTuD5CxVnwCzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87605299"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87605299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:24 -0800
X-CSE-ConnectionGUID: iMzIqZ5hR7SmX6if2jKL7g==
X-CSE-MsgGUID: pjKC2oHCS62iAlx5OlUW3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206179772"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.27])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:22 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 1/3] i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
Date: Mon, 19 Jan 2026 12:02:10 +0200
Message-ID: <20260119100212.29607-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119100212.29607-1-adrian.hunter@intel.com>
References: <20260119100212.29607-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020309_605541_2331DF06 
X-CRM114-Status: GOOD (  17.36  )
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

After system hibernation, I3C Dynamic Addresses may be reassigned at boot
and no longer match the values recorded before suspend. Introduce
i3c_master_do_daa_ext() to handle this situation.

The restore procedure is straightforward: issue a Reset Dynamic Address
Assignment (RSTDAA), then run the standard DAA sequence. The existing DAA
logic already supports detecting and updating devices whose dynamic
addresses differ from previously known values.

Refactor the DAA path by introducing a shared helper used by both the
normal i3c_master_do_daa() path and the new extended restore function,
and correct the kernel-doc in the process.

Export i3c_master_do_daa_ext() so that master drivers can invoke it from
their PM restore callbacks.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c       | 49 +++++++++++++++++++++++++++++---------
 include/linux/i3c/master.h |  1 +
 2 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 594d61edcef4..ca1587cddb9b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1735,22 +1735,24 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 }
 
 /**
- * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
- * @master: master doing the DAA
+ * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
+ * @master: controller
+ * @restore: hibernation restore
  *
- * This function is instantiating an I3C device object and adding it to the
- * I3C device list. All device information are automatically retrieved using
- * standard CCC commands.
- *
- * The I3C device object is returned in case the master wants to attach
- * private data to it using i3c_dev_set_master_data().
+ * Perform Dynamic Address Assignment with optional support for System
+ * Hibernation (@restore is true).
  *
- * This function must be called with the bus lock held in write mode.
+ * After System Hibernation, Dynamic Addresses can have been reassigned at boot
+ * time to different values. A simple strategy is followed to handle that.
+ * Perform a Reset of Dynamic Address (RSTDAA) followed by the normal DAA
+ * procedure which has provision for reassigning addresses that differ from the
+ * previously recorded addresses.
  *
  * Return: a 0 in case of success, an negative error code otherwise.
  */
-int i3c_master_do_daa(struct i3c_master_controller *master)
+int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool restore)
 {
+	int rstret = 0;
 	int ret;
 
 	ret = i3c_master_rpm_get(master);
@@ -1758,7 +1760,15 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 		return ret;
 
 	i3c_bus_maintenance_lock(&master->bus);
+
+	if (restore) {
+		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+		if (rstret == I3C_ERROR_M2)
+			rstret = 0;
+	}
+
 	ret = master->ops->do_daa(master);
+
 	i3c_bus_maintenance_unlock(&master->bus);
 
 	if (ret)
@@ -1769,7 +1779,24 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
 	i3c_bus_normaluse_unlock(&master->bus);
 out:
 	i3c_master_rpm_put(master);
-	return ret;
+
+	return rstret ?: ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
+
+/**
+ * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
+ * @master: master doing the DAA
+ *
+ * This function instantiates I3C device objects and adds them to the
+ * I3C device list. All device information is automatically retrieved using
+ * standard CCC commands.
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+int i3c_master_do_daa(struct i3c_master_controller *master)
+{
+	return i3c_master_do_daa_ext(master, false);
 }
 EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c1ec597f655c..5d0d5359a03e 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -598,6 +598,7 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
+int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool restore);
 struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
 					  size_t len, bool force_bounce,
 					  enum dma_data_direction dir);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
