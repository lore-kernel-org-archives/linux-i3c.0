Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2E7C982DA
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Qd8sgMRjbs4caJftIaLP0/bpOx/53gy9KN9DP77PPA=; b=z2f+2ygDUY8st/
	w0GwjNMmsrDFOuAr7bTdMfXBYvUFdxpNMfM8ifLjXJtjYB7kXa4mLEZEUHdiWQ5mEApjKtRrEI18F
	LT/Lvq3O+o60xKh9bjyBaqId34J+lQ5qK0vksJ8hDAhvUO3rlMM01mVyl6URgMh2e3kfGYLp0pq+i
	H4EYNckSOBuH+FGzjePa6J/x6EGlQzF+ZsE+Qfrekv2//iw00ByNIOe3EgEiVQfOty1sTZRrtFQHf
	CbbPlFti1Mo8GOvWmiO2gMemKGcD0XYu2sZcBmVLwQBrs8yGEGQXUoa2CKhQsAB1XDslmRpcO2+4F
	UaBhXgeZ4KWLNJRJ5O4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JEV-000000002h3-1QgE;
	Sun, 20 Sep 2026 15:13:35 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JES-000000002Vr-4AEj
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917213; x=1821453213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s+V9WPrUO4QRKoHxkhrGxeANRngu5P6fGXwFTO7W+ZU=;
  b=Rj5ilpIrPGDllcoOZPBAb8+EDQRVTjVyhcGCjCulhUyc+mLpvBe/971i
   tLS2zeVmaY7GIpDnjQE86dFmNJr7af3+OkA+kP412kc8sJcdITXezWAvL
   1KhK04diCiCudhvGaU6CUPLlkzIGojRACSpSYPWfKhgHI1QUhAmITx77D
   MPnmS/s2oph53N6naZM01mwOari9cR+SXhez3FkYnxElcm4Dpe1jQaq8m
   geNdR8TcIYGeWBlvasmge4Eub6E03XkgAC5K0tTvvWpdx/hmzehbwoTmU
   765inOCFyuxjlMiLbucek5fyemloggpIdZMT8PnWBJJ3luYZqKIG7yvb/
   A==;
X-CSE-ConnectionGUID: EityiHxKSv2M9hE57cj3zg==
X-CSE-MsgGUID: beue+NDwTDCJTPLPraikkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548495"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548495"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:33 -0700
X-CSE-ConnectionGUID: NEudkfbfSnCPy6RltwOMAA==
X-CSE-MsgGUID: 4ibVNwNeQZ+lApRN7PLxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352475"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:31 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 16/17] i3c: Restrict HDR modes to those supported by the bus and target
Date: Sun, 20 Sep 2026 18:12:46 +0300
Message-ID: <20260920151248.46936-17-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081333_040674_EAF2ABB3 
X-CRM114-Status: GOOD (  19.00  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


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
