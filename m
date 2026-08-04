Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8DBC55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uM9hm6vJYSMWBouaHIH3JtAJvVB9m3llbwBV4trZJIs=; b=e2XY29zToTHeVV
	Eb0ZPcvkpzA0KAbCV9uBJeKhqfvzuFDxXsbUWrTFXheCLZjAonu59v54WYHWdINt0o6xklz2p7VAk
	Lg14ynfSXvungV/7sRDKhLojY/8XDwm9qQx8I9bSeROHKosAZyW2ppyXL5AZ0vDIjtJDF/6hbn7FT
	qCyr4nXJAR7y8P+OaNzLR/yqPlOglYDgryXf3Ul/SQbOOXjuIDvdaVMn9DUblZFWQySB39nelGeAG
	5XAR76N6xXjhEEocU/lAs7z8qlJ/wNMJHTf0gHJl370GPUjVhZBWwqsiPmH9ljU5BIYPLuP21haNg
	0bP54uw/NwrvVWxzIVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLt-00000001wXf-32BK;
	Tue, 04 Aug 2026 13:38:41 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLr-00000001wP5-1mj8
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850719; x=1817386719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5NmvrefdJdFqJwX9A5ehFBhEleFx9mtAtJU4G6VWcEI=;
  b=JrgiX1XyGep9nmD0v7xu8k8LYA6VM/IJODbodU1zGCpk4/vmtmlE8cyV
   iOMD1riZHFEPHWEYz37VwpP5XZUvwdx36wVPUfNN3I4TpJjHQAGV7dr6c
   GRRONyuAMOrCO6kGE1w0fskQ2raZI5fjwKNIRg+a8UGZmM3hBvIGDWqV8
   756IBi4EteDlYTiOMAQQEfO2WL9I2T3pOE4PUyfZAhFRq0DbpFCBHazfe
   jAqxdxD7dvj9gBx81RO7mGJDqSc5gQT/vsL2h+YD62R/PBbumW+oAZgmZ
   CSaXy+o+i1RgvuBmathHD9RF4xXJ48RRVdRYYjYu1WDAC1QMLSC0Lw7so
   Q==;
X-CSE-ConnectionGUID: oIJUqiTYRD+2/7qlG3hc8A==
X-CSE-MsgGUID: D9sOYsA2SdCizApRg3sDFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410132"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410132"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:39 -0700
X-CSE-ConnectionGUID: dt4O0ijsQAW1J5NR3MJFOw==
X-CSE-MsgGUID: o3PUtclpQjiye19KAn9NzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263501024"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:37 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 07/14] i3c: master: Fix potential UAF in i3c_device_match()
Date: Tue,  4 Aug 2026 16:38:03 +0300
Message-ID: <20260804133810.184905-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133810.184905-1-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063839_502037_96C83443 
X-CRM114-Status: GOOD (  12.71  )
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

i3c_device_match() dereferences i3cdev->desc without holding the bus
normal-use lock.  Since the descriptor pointer can be replaced
concurrently, the dereference can race with descriptor replacement and
result in a use-after-free.

Protect access to i3cdev->desc with the normal-use lock.  While the lock
is held, the descriptor is guaranteed to remain valid, so the NULL check
is also unnecessary and can be removed.

This change depends on "i3c: master: Fix recursive locking during device
registration".  Prior to that change, taking the normal-use lock in
i3c_device_match() could recurse on bus->lock during device
registration.

This fixes "i3c: master: match I3C device through DT and ACPI".

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	New patch


 drivers/i3c/master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 947ab3c681d5..e7ea41007889 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -347,8 +347,10 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 	i3cdev = dev_to_i3cdev(dev);
 	i3cdrv = drv_to_i3cdrv(drv);
 
-	if (i3cdev->desc && i3cdev->desc->boardinfo)
+	i3c_bus_normaluse_lock(i3cdev->bus);
+	if (i3cdev->desc->boardinfo)
 		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+	i3c_bus_normaluse_unlock(i3cdev->bus);
 
 	/*
 	 * SETAASA-based devices need not always have a matching ID since
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
