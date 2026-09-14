Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589C1C88E50
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVIBPyk6XvYhbHxkM6aAefz3z69yE4W2e4vU9M5PMyI=; b=pynOU2jH5CFsBQ
	86jUcgZybQS2LvE49cEmslqH5ErCctmiV7Y5XDcyesFhO22HHhdU++o9KCVdDJgGD74aJNfHM+VTe
	O4XIsTzxG24Fk6rUNSr3RTa7OZMoDrOGXx0tqwKcyYsbnCXP3xkptScsbqllEqwGWMxRDImP6ILKz
	Ik0FiYYHF7cbtlCG9oMp3fYSgpA4xXYdbw92CvamqU+RCGRF2YxpwJd3dI56voypA5yshKcF3GHLC
	AKPwyECiaplFgO+lM9v+5MhiNjm3T8aDP9Y4Nt3CRAQKSW36lg9pINhjD5hh7cbZtHqbErKafeLDP
	US4icTnA4ELVCUf6em8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64tn-00000003FOy-1yVh;
	Mon, 14 Sep 2026 11:30:59 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64td-00000003FD2-0BSE
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 11:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385449; x=1820921449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R/XJ6S7xhtZIYsanltvG+qUeHZ8P/Dna7tbwo8U1D0Y=;
  b=MY9DPY653fJHpGt99keLbc9oDe5N1PVOI4DyXOgAvWsHaeAYAToLQMRd
   M2oYsSMSSFkIVjYx6ZCqOZnLHPjKogDbb+NvC9m32UZH5l6c6dYd2FYX5
   toz/o4Qis0l0uy9wf7nGq8Pq8h8xD8EozmKD2tT7J7HwTa5T+jdTE3hld
   NVghqweEqyXYnXmvOPtqQvg0Du8pTjYvRWSXTrG2eBEAL9teERjv+pLYE
   OvpJyzjA95XuuhfI2RFV6TWzE4uEOhYrGgUkpHzIv1jM0QtoFcdlpuHBm
   lVKxsjeIrjpVQhUYPFsjnzIgF6HgtyT+51qsgE4lryD2CoX91EOwXv3VM
   A==;
X-CSE-ConnectionGUID: NUryxjwGS52LtxlQ3WadRA==
X-CSE-MsgGUID: q68sFU2TSA2juxSL2in9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864515"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864515"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:48 -0700
X-CSE-ConnectionGUID: jKgaa+P/SIKfUUhp0f3Wjw==
X-CSE-MsgGUID: /OrvX+qzQeyr42z3B3qekg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133159"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:47 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/17] i3c: Restrict HDR modes to those supported by the bus and target
Date: Mon, 14 Sep 2026 14:30:02 +0300
Message-ID: <20260914113003.183150-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043052_405277_8A548498 
X-CRM114-Status: GOOD (  19.40  )
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

I3C v1.1.1 Table 9 defines which HDR Modes are permitted for each Bus
Configuration.  A Mixed Slow / Limited Bus permits no HDR Modes because
Legacy I2C Devices without a 50 ns SCL spike filter cannot be shielded
from HDR traffic.  A Mixed Fast Bus permits HDR-DDR and HDR-TSL, but not
HDR-TSP, since of the two Ternary Modes only HDR-TSL is defined for a Bus
that also has Legacy I2C Devices.

However, both i3c_device_get_supported_xfer_mode() and the transfer
validation in i3c_dev_do_xfers_locked() currently consider only the
controller's hdr_cap.  Since hdr_cap reflects controller capability
rather than bus or target constraints, HDR Modes can be advertised and
used even when the bus configuration forbids them.  Likewise, HDR Modes
unsupported by the target may be reported as available.

Add i3c_dev_supported_xfer_modes_locked(), which derives the usable
transfer modes from the intersection of:

  - HDR Modes supported by the controller
  - HDR Modes allowed by the bus configuration
  - HDR Modes supported by the target

Use this helper both when reporting supported transfer modes and when
validating transfers, ensuring that the advertised and permitted modes
remain consistent.

GETHDRCAP is queried only when I3C_BCR_HDR_CAP is set, so a target
without that bit is treated as supporting no HDR Modes.

i3c_device_get_supported_xfer_mode() now takes the normal-use bus lock
in order to access the device descriptor, matching
i3c_device_get_info().

Also fix the kernel-doc reference to enum i3c_xfer_mode.

Fixes: 256a21743d91 ("i3c: Add HDR API support")
Assisted-by: GitHub-Copilot:claude-opus-5
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/device.c    | 15 ++++++++---
 drivers/i3c/internals.h |  2 ++
 drivers/i3c/master.c    | 57 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index f1ba363b22a1..4df4682af150 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -301,16 +301,23 @@ i3c_device_match_id(struct i3c_device *i3cdev,
 EXPORT_SYMBOL_GPL(i3c_device_match_id);
 
 /**
- * i3c_device_get_supported_xfer_mode - Returns the supported transfer mode by
- *					connected master controller.
+ * i3c_device_get_supported_xfer_mode - Returns the transfer modes supported by
+ *					the connected master controller and @dev,
+ *					and allowed by the bus configuration.
  * @dev: I3C device
  *
  * Return: a bit mask, which supported transfer mode, bit position is defined at
- *	   enum i3c_hdr_mode
+ *	   enum i3c_xfer_mode
  */
 u32 i3c_device_get_supported_xfer_mode(struct i3c_device *dev)
 {
-	return i3c_bus_to_i3c_master(dev->bus)->this->info.hdr_cap | BIT(I3C_SDR);
+	u32 modes;
+
+	i3c_bus_normaluse_lock(dev->bus);
+	modes = i3c_dev_supported_xfer_modes_locked(dev->desc);
+	i3c_bus_normaluse_unlock(dev->bus);
+
+	return modes;
 }
 EXPORT_SYMBOL_GPL(i3c_device_get_supported_xfer_mode);
 
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86a36b951e0d..9a6936e2c660 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -18,6 +18,8 @@ bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 
+u32 i3c_dev_supported_xfer_modes_locked(struct i3c_dev_desc *dev);
+
 int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
 int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev,
 			    struct i3c_xfer *xfers,
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 4296c51a9537..c8093708807c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -938,6 +938,61 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 	return 0;
 }
 
+/*
+ * I3C v1.1.1 Section 5.1.2.4 Table 9 lists the HDR Modes each Bus
+ * Configuration allows.  A Mixed Slow / Limited Bus has Legacy I2C Devices
+ * without a 50 ns spike filter, so there is no way to hide any HDR Mode from
+ * them.  Of the two Ternary Modes, only HDR-TSL is defined for a Bus that
+ * also has Legacy I2C Devices; HDR-TSP is defined for a Pure Bus.
+ */
+static u32 i3c_bus_hdr_modes(struct i3c_bus *bus)
+{
+	switch (bus->mode) {
+	case I3C_BUS_MODE_PURE:
+		return BIT(I3C_HDR_DDR) | BIT(I3C_HDR_TSP) | BIT(I3C_HDR_TSL);
+	case I3C_BUS_MODE_MIXED_FAST:
+		return BIT(I3C_HDR_DDR) | BIT(I3C_HDR_TSL);
+	case I3C_BUS_MODE_MIXED_LIMITED:
+	case I3C_BUS_MODE_MIXED_SLOW:
+		break;
+	}
+
+	return 0;
+}
+
+static u32 i3c_dev_hdr_modes(struct i3c_dev_desc *dev)
+{
+	if (!(dev->info.bcr & I3C_BCR_HDR_CAP))
+		return 0;
+
+	return dev->info.hdr_cap;
+}
+
+/**
+ * i3c_dev_supported_xfer_modes_locked() - Get the transfer modes usable with a
+ *					   device
+ * @dev: I3C device descriptor
+ *
+ * The HDR Modes the controller and @dev both support, restricted to those the
+ * bus configuration allows.  SDR is always supported.
+ *
+ * The bus lock must be held in normal use mode.
+ *
+ * Return: a bit mask of &enum i3c_xfer_mode values.
+ */
+u32 i3c_dev_supported_xfer_modes_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	/*
+	 * master->this->info.bcr is ignored because it describes the master's
+	 * target capability, not its controller capability.
+	 */
+	return (master->this->info.hdr_cap &
+		i3c_bus_hdr_modes(&master->bus) &
+		i3c_dev_hdr_modes(dev)) | BIT(I3C_SDR);
+}
+
 static struct i3c_master_controller *
 i2c_adapter_to_i3c_master(struct i2c_adapter *adap)
 {
@@ -3856,7 +3911,7 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
 	if (!master || !xfers)
 		return -EINVAL;
 
-	if (mode != I3C_SDR && !(master->this->info.hdr_cap & BIT(mode)))
+	if (mode != I3C_SDR && !(i3c_dev_supported_xfer_modes_locked(dev) & BIT(mode)))
 		return -EOPNOTSUPP;
 
 	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
