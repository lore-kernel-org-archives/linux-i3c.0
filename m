Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20256C5ACAB
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MPU+k/ipZrB0auk8qfdEE6+EimPpqGN3/x3jG1ho5E=; b=FP1hSY7zVEWe1c
	noYnhBPAAF6H+55TKqxKmz92ww1ND5kF6aeYVXivI6hV1jseaIr3nxIDLxn204Q0BdqAPbcfB068m
	3LVA4QRFN35ew99/g8ITpSXdhR87ck/uA1lsWcTyI055k5u81QheH6OxiPTm9gAz5X37cBbBVNj7g
	kG38lkts5IIN0zrJqvwGVlzOCWTphMqTo6c3kqxInyv1J1ioz1XcatGBwhN0+sUqm3ro70uVWG1zk
	YM9zlWG8D1qb8oGWoR0TZEZJRGlyYFQF/Rs0Wgl8tDHXoE+tWlD05sYQPaf7AiAmy2Mk7vxYs9Drg
	q1WTpWfyhQCLqUcqS8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0p-00000008Ihj-3HwB;
	Fri, 07 Aug 2026 14:57:31 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0n-00000008IgE-0bEk
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114649; x=1817650649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6uWV/4a7ou9YlS2DldAkICXYmliziER5KKT2Q7nsl78=;
  b=n2OnYDsdC88D0ioajE94l9EGTtU3v7b9OlbOdGa7qxCc5Sr6XGg8Wyt5
   jGmR+9gJbrPTfCv3NAQhxT+Oon+mQkAAnlrxkr/9Ro6SscSPLOLO3dXlo
   der8xgshgpEZd4fq+kqP9B8KBKHaS30+9LlmY7x+0bQbwVMGsyyihnjgB
   CjYhpbmDGCSfeYc0/uKpGnRgl3VzWKSyx86p5sQ0Gh43bZINlzL4yylJY
   UosTrQ6WyhpuxjE4DupPv5L6ZI4b4m9JGfbMqJc/NeyYpYMdu+WK87MKx
   +zzlEHZvCJBJTJK9VB3Eq68KHaIVBJIMJPjSEfnSe/IsQDe0x08b90b89
   A==;
X-CSE-ConnectionGUID: 4pAMJUZRShelKBr8bascJQ==
X-CSE-MsgGUID: +92TLXfGRzaEG8zE+2xHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485187"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485187"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:25 -0700
X-CSE-ConnectionGUID: lo7Te4SoToqvDB3tdFxQGw==
X-CSE-MsgGUID: wBvOWhNHRdOEYhu6B9xuGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809878"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:56:51 -0700
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
Subject: [PATCH V5 02/14] i3c: Fix unlocked dereference of dev->desc in i3c_device_get_supported_xfer_mode()
Date: Fri,  7 Aug 2026 17:56:26 +0300
Message-ID: <20260807145638.168865-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075729_243758_4190F3B2 
X-CRM114-Status: GOOD (  10.54  )
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

i3c_device_get_supported_xfer_mode() uses dev->desc to obtain the
master controller.  However, dev->desc must not be dereferenced unless
bus->lock is held, and this function does not take that lock.

The function only needs access to the master controller associated with
the device's bus.  Use dev->bus instead, which is always valid for the
lifetime of the device and does not require dereferencing dev->desc.

Fixes: 256a21743d91 ("i3c: Add HDR API support")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'd-by

Changes in V4:

	None

Changes in V3:

	New patch


 drivers/i3c/device.c    | 2 +-
 drivers/i3c/internals.h | 5 +++++
 drivers/i3c/master.c    | 6 ------
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 101eaa77de68..a3778282e84c 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -309,7 +309,7 @@ EXPORT_SYMBOL_GPL(i3c_device_match_id);
  */
 u32 i3c_device_get_supported_xfer_mode(struct i3c_device *dev)
 {
-	return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
+	return i3c_bus_to_i3c_master(dev->bus)->this->info.hdr_cap | BIT(I3C_SDR);
 }
 EXPORT_SYMBOL_GPL(i3c_device_get_supported_xfer_mode);
 
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 0f1f3f766623..86a36b951e0d 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -72,4 +72,9 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
 	}
 }
 
+static inline struct i3c_master_controller *i3c_bus_to_i3c_master(struct i3c_bus *i3cbus)
+{
+	return container_of(i3cbus, struct i3c_master_controller, bus);
+}
+
 #endif /* I3C_INTERNAL_H */
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d2fb1a110521..c7bb52b71d88 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -102,12 +102,6 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
 	up_read(&bus->lock);
 }
 
-static struct i3c_master_controller *
-i3c_bus_to_i3c_master(struct i3c_bus *i3cbus)
-{
-	return container_of(i3cbus, struct i3c_master_controller, bus);
-}
-
 static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
 {
 	return container_of(dev, struct i3c_master_controller, dev);
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
