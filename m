Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C795CD4F54
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzlWK6j9sJt5uRtQ4k02aOdZ8eq36Ksq7f4/T7qdUco=; b=DuZRH5/WN9mOrc
	yVgAHBH5UbAZ6EIcDkucRauQVManqK3tc4E8QfUcCf/GeLe8/HV8XPKBfuit6A2q6ok1oNsP3ilaa
	MhV5tVxsTK9YfdPX+HF5ORP0JqFBF2UGnRQSF6r0/rWvTye6VpV5sFrAUe36yH+kyKP3qJ2FU5Hml
	8JsMl6HFa5l3N7CTPAFupRQ93ZOoRhHS+24GWLOuBHctt3FgEbp7E1iHonyHPS7/yrlXwBw2uGm8N
	cjCXqkW8IyDOxkc6jRe7zgweFAgIgHSNAT6/FQvHJkIGoACyrrAOiKbDrliSVX+GFyhC7rYvNlwTt
	FIVIqq4qhv7fV1rZzqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQx-000000040Da-4AQL;
	Wed, 27 May 2026 11:28:23 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQv-0000000407g-23Ao
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 11:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779881301; x=1811417301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XUzc6ulbVNdnYgoqBi6u1YhjQDUzRLq1VpYaqojUsTo=;
  b=bKOljVWzct/cY+e1dhdQ4SdQ2mEs/SXSqcS2dLV7s9kWiKXyCtlUpiNr
   qIcwyTd6ubX+Tjh/Z1EUMDcTSH3REFxLpopRqYYChq6BxBHQTmpi4nMhz
   SbgNWzDzEDooQbYYJedEEtiTaP48bEglpKSxuzZsCRbvzql0RlAPjNl+F
   XBHHyNvKZTsv7cwlr+IIAY5mFRRQaT3WNdkRgkaDElP3iQjO0aKzNflnZ
   AEzvXgocyp75dzECIzHq3yml8YJZw2wJaVJpLmL6zWkfb+Rm0yag+WA04
   FDa1NO+csA6bZLTbhUbKsk/suCaCW2T2ZVtvqSY3yMDjlxeboxqKbneby
   A==;
X-CSE-ConnectionGUID: UJdiGfdKQ8y0j/mWAqZ9lw==
X-CSE-MsgGUID: r5M+vlH/T3mTznee33ES7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103381737"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103381737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:21 -0700
X-CSE-ConnectionGUID: NhL9fS29QGeRyOKIx693gg==
X-CSE-MsgGUID: 81Cr5bmaTe6FjSzjVXXcdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246238652"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] i3c: master: Move DAA API functions after i3c_master_add_i3c_dev_locked()
Date: Wed, 27 May 2026 14:27:57 +0300
Message-ID: <20260527112758.38530-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260527112758.38530-1-adrian.hunter@intel.com>
References: <20260527112758.38530-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_042821_576723_89178263 
X-CRM114-Status: GOOD (  15.91  )
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

Relocate i3c_master_do_daa_ext() and i3c_master_do_daa() so they appear
after i3c_master_add_i3c_dev_locked().

This ordering is required for upcoming changes where the DAA flow will
(indirectly) rely on i3c_master_add_i3c_dev_locked() functionality.
Reordering avoids forward dependency issues and keeps related code paths
logically arranged.

No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 128 +++++++++++++++++++++----------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c1188c5d1f23..69e19c56f9a5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1870,70 +1870,6 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
 	i3c_bus_normaluse_unlock(&master->bus);
 }
 
-/**
- * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
- * @master: controller
- * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
- *
- * Perform Dynamic Address Assignment with optional support for System
- * Hibernation (@rstdaa is true).
- *
- * After System Hibernation, Dynamic Addresses can have been reassigned at boot
- * time to different values. A simple strategy is followed to handle that.
- * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
- * procedure which has provision for reassigning addresses that differ from the
- * previously recorded addresses.
- *
- * Return: a 0 in case of success, an negative error code otherwise.
- */
-int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
-{
-	int rstret = 0;
-	int ret;
-
-	ret = i3c_master_rpm_get(master);
-	if (ret)
-		return ret;
-
-	i3c_bus_maintenance_lock(&master->bus);
-
-	if (master->shutting_down) {
-		ret = -ENODEV;
-	} else {
-		if (rstdaa)
-			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
-		ret = master->ops->do_daa(master);
-	}
-
-	i3c_bus_maintenance_unlock(&master->bus);
-
-	if (ret)
-		goto out;
-
-	queue_work(master->wq, &master->reg_work);
-out:
-	i3c_master_rpm_put(master);
-
-	return rstret ?: ret;
-}
-EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
-
-/**
- * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
- * @master: master doing the DAA
- *
- * This function instantiates I3C device objects and adds them to the
- * I3C device list. All device information is automatically retrieved using
- * standard CCC commands.
- *
- * Return: a 0 in case of success, an negative error code otherwise.
- */
-int i3c_master_do_daa(struct i3c_master_controller *master)
-{
-	return i3c_master_do_daa_ext(master, false);
-}
-EXPORT_SYMBOL_GPL(i3c_master_do_daa);
-
 /**
  * i3c_master_dma_map_single() - Map buffer for single DMA transfer
  * @dev: device object of a device doing DMA
@@ -2472,6 +2408,70 @@ void i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master, u8 addr
 }
 EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
+/**
+ * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
+ * @master: controller
+ * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
+ *
+ * Perform Dynamic Address Assignment with optional support for System
+ * Hibernation (@rstdaa is true).
+ *
+ * After System Hibernation, Dynamic Addresses can have been reassigned at boot
+ * time to different values. A simple strategy is followed to handle that.
+ * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
+ * procedure which has provision for reassigning addresses that differ from the
+ * previously recorded addresses.
+ *
+ * Return: a 0 in case of success, an negative error code otherwise.
+ */
+int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
+{
+	int rstret = 0;
+	int ret;
+
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+
+	if (master->shutting_down) {
+		ret = -ENODEV;
+	} else {
+		if (rstdaa)
+			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
+		ret = master->ops->do_daa(master);
+	}
+
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	if (ret)
+		goto out;
+
+	queue_work(master->wq, &master->reg_work);
+out:
+	i3c_master_rpm_put(master);
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
+}
+EXPORT_SYMBOL_GPL(i3c_master_do_daa);
+
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
 static int
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
