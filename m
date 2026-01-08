Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E955FCF6C15
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNmEuzT549k48XZuSeOhzY2DCl3nAAl/USoyNLhOHp4=; b=czt4GIRLeRXKO8
	DjOzoBxUhWvER7TQRshA1hSIFnvJ+Lo809zwmyPkw38R3BhzSBbXdGKbDG1ymHOplmXPh1kbrHKnI
	88YljjXJYVr4rBIOEV1zGL9xRl8lyt3AoALdEneGGFE/5pYuo8UDcPmMg677PcA58xL+MB0I6xNXc
	WKxL7MCAerGUSoWtp7IbwPmZaTJw5KEMKRndN/bxKGknHziiz5SJOdJz1tgfP5ueW/dq8Im4CTaz/
	jTHxDWycEHfXuNcQMN3UHOuqO3zI8DX5VKM7mQU9uMNd+kzYhvOSsrmhh/ItDw1YdeXtIi4vHLusz
	nt1kLCCNvIh/B3Z0iviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2F-0000000GD70-2vct;
	Thu, 08 Jan 2026 08:06:23 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2D-0000000GCzw-2n4Q
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859582; x=1799395582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lR1RqmRhgwTLwuOUWOdyx/SOokpPOBwAHnc1enfGVsg=;
  b=b9GJ5Jxru5LgnmDN9c91lUZS7Qq6G7Wyn/FzYbRfA6pHiYs6ov8sq7cq
   qN/8zctwNQvB03VgtPfDHGT6BKpK6oO67mi4JBtjgVKWoiU8FBvnwhWqF
   O74s6SRUnSC1LOnK5OfyOBJl+GYBcyOwtkrhupEw69VRGC//VAcvVGOPF
   BSjWN9465qK+1OjEyJcDxhJLwS9cIXkUAcbnPq+NWCh1Fp6UyTs6hzQDZ
   bsBTJMTjzfFB2LfxNLUnawV0FrvXNxjdZjZOJZDKJhq19K35LhkA/1HCR
   LxzhHYpm1UEBOfT7ZBvl3pZyfLoUJlA2bRPgM8wWbAAJ1gy74Vwa1uZAJ
   A==;
X-CSE-ConnectionGUID: tgWs4FVrTUiahiMJTZJYCA==
X-CSE-MsgGUID: TUUCmqazQhm6BsNtZP4gSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792281"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792281"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:22 -0800
X-CSE-ConnectionGUID: 933UWzm2Tp2zZkYzysJa1A==
X-CSE-MsgGUID: a6zFZZkxSH+tRBCrSkbQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413583"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 05/20] i3c: mipi-i3c-hci: Switch DAT bitmap allocation to devm_bitmap_zalloc()
Date: Thu,  8 Jan 2026 10:05:43 +0200
Message-ID: <20260108080558.21767-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000621_718640_2490D52E 
X-CRM114-Status: GOOD (  11.63  )
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

The driver already uses managed resources, so convert the Device Address
Table (DAT) bitmap allocation to use devm_bitmap_zalloc().  Remove the
manual cleanup routine.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/core.c   |  2 --
 drivers/i3c/master/mipi-i3c-hci/dat.h    |  1 -
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +++--------
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 0d3ec674878d..c4b249fde764 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -185,8 +185,6 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 
 	i3c_hci_bus_disable(hci);
 	hci->io->cleanup(hci);
-	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
-		mipi_i3c_hci_dat_v1.cleanup(hci);
 }
 
 void mipi_i3c_hci_resume(struct i3c_hci *hci)
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
index 1f0f345c3daf..5277c65fc601 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat.h
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -17,7 +17,6 @@
 
 struct hci_dat_ops {
 	int (*init)(struct i3c_hci *hci);
-	void (*cleanup)(struct i3c_hci *hci);
 	int (*alloc_entry)(struct i3c_hci *hci);
 	void (*free_entry)(struct i3c_hci *hci, unsigned int dat_idx);
 	void (*set_dynamic_addr)(struct i3c_hci *hci, unsigned int dat_idx, u8 addr);
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index cc5d2deb23ab..c60ef5d77ca3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -55,8 +55,10 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
 	}
 
 	if (!hci->DAT_data) {
+		struct device *dev = hci->master.dev.parent;
+
 		/* use a bitmap for faster free slot search */
-		hci->DAT_data = bitmap_zalloc(hci->DAT_entries, GFP_KERNEL);
+		hci->DAT_data = devm_bitmap_zalloc(dev, hci->DAT_entries, GFP_KERNEL);
 		if (!hci->DAT_data)
 			return -ENOMEM;
 
@@ -70,12 +72,6 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
 	return 0;
 }
 
-static void hci_dat_v1_cleanup(struct i3c_hci *hci)
-{
-	bitmap_free(hci->DAT_data);
-	hci->DAT_data = NULL;
-}
-
 static int hci_dat_v1_alloc_entry(struct i3c_hci *hci)
 {
 	unsigned int dat_idx;
@@ -170,7 +166,6 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
 
 const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.init			= hci_dat_v1_init,
-	.cleanup		= hci_dat_v1_cleanup,
 	.alloc_entry		= hci_dat_v1_alloc_entry,
 	.free_entry		= hci_dat_v1_free_entry,
 	.set_dynamic_addr	= hci_dat_v1_set_dynamic_addr,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
