Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E59C5ACC2
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5gWVRIm1X9z9ZHvS7dJlVcxWLlVYhtUgAuISAKUkmk=; b=2cCHYKGRaeCAzL
	XDkz696R9FJuk1E7VwCXZW1s6agXyAtGPdyJMP0HiTDKoJ2HS9BfC2v4WxG55ek9GwQa30CtmCDoL
	T80wWBdMZpNHtAa1nFP2HkDRXCx0k4Dm/92oOfjhyZC67qhjVOAa/38ZPYVmLqSQDVOsl/DDIpj1f
	hXJ0Dk3ybj4JON91To8dke+VDRUCP0AKZZxRZiBYFzK1NMno13/AlaGGIfDWZ2liejZTRTaMQZ2qy
	5zgo0VRdYUSkCrZv190USLpmo45kfWFl3wLBnSz9WFK4f2nIGe8JOzMIbEHwH5poS+xN98RbQ0AhO
	TFxoj+ApeL5wxFtH7l5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM14-00000008Iq7-1mmD;
	Fri, 07 Aug 2026 14:57:46 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM10-00000008Ilk-2n8l
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114662; x=1817650662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/3nCbbeIos8TapZNKsjIUGLe8mZz8XEWaAijxlyQEE=;
  b=LvFF4bCEkxbbx1kX2L1kPc/G8ZXGP9xrUWVdSS764LmpQfyGntxLK+x3
   4FiCyxe2Eye2euFdh/d3EIbjIFYLV9bFr3ZjY+vmoKWjVqPIdDkuxfTZ1
   gDC2oV2WFno72LtoCPbUBlgqYojS/Xbgmpf6wQqhEFF78glYvFNJSdgkP
   6LT2OuUHs8KWZklyTzEmXCOw9bOoA/pAaSs4tw/cTT+XYQg9K/isOJdtu
   lRAe1najbE/VCl47aUSQhsH3Kvs4wb9AwP8q8a48QB3YWjpHK6mLEQxBW
   itZwQ+QUPQm+HGk85Y9HpBpghCtJppDEsH8CAtpJAXma1SDAS/IXCh0dT
   Q==;
X-CSE-ConnectionGUID: YQJqOXx1SyiTCMtOQH/jWg==
X-CSE-MsgGUID: PTmq6gM7SBW8MBBlojwhgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485269"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485269"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:41 -0700
X-CSE-ConnectionGUID: Wd2TuOILQeG9Ed81BLZv5Q==
X-CSE-MsgGUID: 5VsMs/PrQ1yu+yejmSZrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809948"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:16 -0700
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
Subject: [PATCH V5 11/14] i3c: master: Reject IBI requests from non-IBI-capable devices
Date: Fri,  7 Aug 2026 17:56:35 +0300
Message-ID: <20260807145638.168865-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075742_744715_0ADBA5BB 
X-CRM114-Status: GOOD (  10.21  )
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


Changes in V4 and V5:

	None

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
