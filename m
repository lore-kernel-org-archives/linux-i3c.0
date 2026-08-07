Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F32EC2A09B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xmQ0GW7nheSmfh/LKr2dPLs1W6+3GMTffY1b9rUH8Q=; b=0/sBHAmvoRg561
	u8hIv9IdPId/gE+Gj0TTExsMlVZVYxjnulMZWjEHlJhVKjI15G3npjKIgJYkzPl0PSkRqOyG6DLTx
	7nKZRg71b9NTvBM5jTh749sCZu5c7zIjiQNPPPgDn0o4pLhQC44OnmgJ5/ct8kj7+7YhSvCwMdTgy
	D9G+Udc+2jL3kbckZHvDCxTp0SVOztCJ0MrfmUsVAAjnTzi29QL9tcatPcdUAe2Ny03ygALzLxn9L
	s53pX456D8w7DsQaf9qFTY1pj4sh6UTeZ/2/h4rbId7HBP89TpQMknnL98aItx507XWFC03yacFBn
	spVz0t6FNnDthf9rOU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0y-00000008Ilm-0Omw;
	Fri, 07 Aug 2026 14:57:40 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0v-00000008Igy-452W
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114658; x=1817650658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GXla3rEiuoVy1r6X2ffYoXaqd7/8Dw7PH/mGtXsD/VQ=;
  b=Bmw1C9DizWmvWElN6extvBtsTMb/nZlQNQtcLCU963R9tMUibTZvCsVL
   Egoh5CYkHvMNAJXXSQy2m/zsVjuQ8EQQ+UaXZMjM2DxiSi9g5hodKeL0M
   eQfJkKDjI3O0Pdc/d9FixfOpbxWfUaAQXEm8yk97Kwj6aBhxXHoGpubu/
   szl8XMxykM3D/mw6S7vuj3j1EEeaB41aNRtfWGGZW287PdDQS5Zq6TWZB
   Ivg23RhYC6H5KBT9KMWbZx5VsV+rBqNAxuLoqsnTguVu6OsKco2ZRg+EJ
   33eMnnqQ4ubFwt/D9LkbCH3s5U0oWvYeJUXC6uT5K05Cj1at8SDxdL2mt
   Q==;
X-CSE-ConnectionGUID: HH8mKGIwRmiohub1Gsibuw==
X-CSE-MsgGUID: j1566LbxQka17XmxdKY0Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485233"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:37 -0700
X-CSE-ConnectionGUID: Pw3PS3EnSdCoM/ktTPGfNQ==
X-CSE-MsgGUID: KSHIWB1ST56hZfekZ230Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809936"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:05 -0700
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
Subject: [PATCH V5 07/14] i3c: master: Fix potential UAF in i3c_device_match()
Date: Fri,  7 Aug 2026 17:56:31 +0300
Message-ID: <20260807145638.168865-8-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075738_052269_0C60BB5C 
X-CRM114-Status: GOOD (  12.32  )
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


Changes in V4 and V5:

	None

Changes in V3:

	New patch


 drivers/i3c/master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ee771ac0b203..83e04a2c202a 100644
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
