Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D99C55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjyH6tYyFWHAXqhoczsGkLHgNoc8ES9WouQ/IH7gY5Y=; b=cuKeunfc2kvUeH
	0hAz9ZyrslG0ePiLnWiU3BFcx2jQP2i3trDyG9VNM9TUQYX+BrEuiXA3VgU0+0LaVfuiGE55VOj7A
	q63FNloOXp5E25Oc0b2oEYPXVe2fUz2Ok4xopd9QXevRh8Eh5v5Uj2webAoRDdzCjRO++E+KwWeZP
	Nz1bSP3XhMGo79co+CCJCI1BsvctNMcvJka0S/u464KIP6ZP36SWlZW5SDMbBWN+cEdIz1gaEubJu
	o1KLFDwlkHBowthfW6a9O8o2qfLdMrNGF8p5QYz0+nW5C0Ar9MsoNQB8isJwZ6yls2jvplYBB64ji
	cOD6FZXSWwT9OXMA3cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFM4-00000001wdp-0pMm;
	Tue, 04 Aug 2026 13:38:52 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFM1-00000001wP5-36Yi
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850730; x=1817386730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkUaZuL70LekaMXKH0xasjz56ftvkRCLeoG4ImrPSCQ=;
  b=dLjDznVihU9miDlhvR+xSgIQg0ZEsapYoUq55lECwD9ZN1+DskWszs3X
   y4l5zr33Cn8HFNlf+ybcjqadNkjSbXTqyxo+Y+FAw2yLXqtdIbasI7poh
   ovy2qeYZUvhOjVeLWHH6HRvkGOhKdbK98DOlVSydk9ZZ4rLUnhq2n1lw8
   zUmePRawsguGyI2iMlww4noX16tdnnz4lvDOL5mnXvWuIy9wqZatTJdUn
   NCG+fPtqGkeLvhigrhO0SJuA/6j5otSw0jsM2H5XI5DWl9aGJWttgEQ1B
   hhLOtYBNAqnm5XvtYoQM1csJaBqik0DdmQocrgYiSshYczzGIF0ZUIs54
   w==;
X-CSE-ConnectionGUID: a9uAj3peR72Tk0NY044yqw==
X-CSE-MsgGUID: S/M2fymNTK+p17v9g3lL1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410171"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410171"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:50 -0700
X-CSE-ConnectionGUID: 2Xc+d9tmS8mqeONIWEnk1Q==
X-CSE-MsgGUID: gVIB+3M+QgimrWrBQyQSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263501059"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:47 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 11/14] i3c: master: Reject IBI requests from non-IBI-capable devices
Date: Tue,  4 Aug 2026 16:38:07 +0300
Message-ID: <20260804133810.184905-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133810.184905-1-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063849_818029_3653EDDD 
X-CRM114-Status: GOOD (  10.20  )
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

i3c_device_request_ibi() does not verify that a device advertises IBI
support before attempting to set up IBI handling.

Add a check for I3C_BCR_IBI_REQ_CAP and fail with -EOPNOTSUPP when IBI
support is not reported by the device.  This keeps IBI setup consistent
with other IBI-related functionality, such as exposing wakeup capability
only for IBI-capable devices.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank's Rev-by tag

Changes in V2:

	None


 drivers/i3c/device.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 5e6df6de0283..f1ba363b22a1 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -204,12 +204,14 @@ int i3c_device_request_ibi(struct i3c_device *dev,
 		return ret;
 
 	i3c_bus_normaluse_lock(dev->bus);
-	if (dev->desc) {
+	if (!dev->desc) {
+		ret = -ENOENT;
+	} else if (!(dev->desc->info.bcr & I3C_BCR_IBI_REQ_CAP)) {
+		ret = -EOPNOTSUPP;
+	} else {
 		mutex_lock(&dev->desc->ibi_lock);
 		ret = i3c_dev_request_ibi_locked(dev->desc, req);
 		mutex_unlock(&dev->desc->ibi_lock);
-	} else {
-		ret = -ENOENT;
 	}
 	i3c_bus_normaluse_unlock(dev->bus);
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
