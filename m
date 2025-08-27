Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C74CA0FFB
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nPS9wqZpp3OF/0rR9ppqVeYki1oPUuamTSn7EA8v5U=; b=QEV+OPbunN1Kym
	MppA93e2WqgumB2RdnpnES0QxzjnpQMkf1pB0bIkkaC72eikSSOC84IuVqpPvm9+A4vyqDdJc+C+V
	J1hHzbZG2PkyLB1dow5DdcOqEmvknBxpY765b+cx5Coup0kSzgk4TNMbmMXTpaDaCzsSRYpAUInvV
	OpnzSdKCIfinTVvaCiDSNFVFjqEAc5HPGuIvtfjvgRNLhAcGq+3rKkgbNLgkDrLaCJ+N9kj7TPUi6
	BQspW8Itcv5DDnWan0TWmJ/R2M727X6zPJerGY1/Lw9o18wtTGRXoW0hyZmeGyh7boMElkfkL0MaU
	yhNZWY9dO39M74Rshg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE2Z-0000000FDQR-3j9N;
	Wed, 27 Aug 2025 11:10:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDQ4-0000000F4hH-3O7a
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 10:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756290621; x=1787826621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wp+mA6h/+XHVNHI6UNhWJ3SxRNLHHtr3c1sNtqluW4A=;
  b=dfffFk1jJNP21i3vu7LN4YWXO1SyQRMxo0Vqn4kHe8v+hEbYP6l+ezuN
   eA3NcoYM1AZ3r7o6a8UWqSW8Fz+7rQit2harMkdylPx6XIDRdoVwzGlKE
   ATkmx2fk6U4kJ8FgBa3GRI3INy1BAb8h2LPVUJcJU48Ynp1POEqm1YUC2
   nfBiZjSZ7URrz+AqfMwunV5x6fkjxbE9yE6CswdyepI+oBzAp/B4rr/Bv
   xa8Wf3CG0Da36Y8/lRQGXZz0cHgFbLaO46kRa10opSzlHdYrn7c/gNzFx
   nZhhAsElKCy9ORsUelet3RiRtbx9ddeNX3ujnT1hARgqXePBb3quQ2Eul
   Q==;
X-CSE-ConnectionGUID: w/cYtGg2QfK5pdIa1fwcug==
X-CSE-MsgGUID: /JUXcZeQTb2qvQsueMM24g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57741017"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57741017"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:30:20 -0700
X-CSE-ConnectionGUID: 03M6U7SgQvqIelhk+FUFBw==
X-CSE-MsgGUID: r/XBzucOT5KRyYsuvA6Smg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200761527"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.51])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 03:30:19 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 4/5] i3c: mipi-i3c-hci: Remove function enter DBG() printouts
Date: Wed, 27 Aug 2025 13:30:08 +0300
Message-ID: <20250827103009.243771-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_033020_854931_99CBCA08 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

These function enter DBG("") printouts are not very useful in error
report point of view because they require code recompile. In which case
they can be replaced with more informative debug prints if needed so
remove them for now.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index d532933ac7ab..9932945ecf06 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -121,8 +121,6 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	struct i3c_device_info info;
 	int ret;
 
-	DBG("");
-
 	if (hci->cmd == &mipi_i3c_hci_cmd_v1) {
 		ret = mipi_i3c_hci_dat_v1.init(hci);
 		if (ret)
@@ -159,8 +157,6 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct platform_device *pdev = to_platform_device(m->dev.parent);
 
-	DBG("");
-
 	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
 	synchronize_irq(platform_get_irq(pdev, 0));
 	hci->io->cleanup(hci);
@@ -267,8 +263,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	DBG("");
-
 	return hci->cmd->perform_daa(hci);
 }
 
@@ -385,8 +379,6 @@ static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_hci_dev_data *dev_data;
 	int ret;
 
-	DBG("");
-
 	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
 	if (!dev_data)
 		return -ENOMEM;
@@ -410,8 +402,6 @@ static int i3c_hci_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn_addr)
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 
-	DBG("");
-
 	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
 		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, dev_data->dat_idx,
 					     dev->info.dyn_addr);
@@ -424,8 +414,6 @@ static void i3c_hci_detach_i3c_dev(struct i3c_dev_desc *dev)
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 
-	DBG("");
-
 	i3c_dev_set_master_data(dev, NULL);
 	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
 		mipi_i3c_hci_dat_v1.free_entry(hci, dev_data->dat_idx);
@@ -439,8 +427,6 @@ static int i3c_hci_attach_i2c_dev(struct i2c_dev_desc *dev)
 	struct i3c_hci_dev_data *dev_data;
 	int ret;
 
-	DBG("");
-
 	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
 		return 0;
 	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
@@ -464,8 +450,6 @@ static void i3c_hci_detach_i2c_dev(struct i2c_dev_desc *dev)
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i2c_dev_get_master_data(dev);
 
-	DBG("");
-
 	if (dev_data) {
 		i2c_dev_set_master_data(dev, NULL);
 		if (hci->cmd == &mipi_i3c_hci_cmd_v1)
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
