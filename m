Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1235BC54F4D
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kY0jQ4Lgy5fsV4q5e+vxVVi6/8WCtIe4XAYouKRi0xo=; b=AiAhgpLTpHkfnM
	31RajhgrjtCbfX6oap5bASNNp3WeepFPyjohBZyW+p/5Na0aauc49jzj6MVUSKPfmy9nGDSDbjf9T
	jPX7j6XZfWITyfcXcOMKgNW9IjTp2QPDubfh8mc42Bm+Dt2m2X7rLmIiSX8DEEdPD/ugHHB+PK5ss
	h1VBIh9+vVh//cMioub9iyu3hm5029Kuuxv1ok2oeOY9EnDd7C3IRMcr5TRWCn6eYsmKbxeVUd+cn
	Xg5/kVy9yKRsRaiTjh5CVkQSM56ZrbZQeqN0WnfL3/ceV1+etrZ4CaxkUa9wulZL5IfEJI6I25vno
	nOTc4SnFS2KTjm5X5tQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7Z-00000005jJ9-3HTG;
	Tue, 28 Jul 2026 15:53:33 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok7Y-00000005jFt-0c5Y
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 15:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785254012; x=1816790012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GyQHeubSRZqQQ2yo6w+X4EKYG7SA6gkZFStluoIGdZo=;
  b=mF4rzCEp0dubWiH3rRvOryXFDe7tfQpAfH8HHHEGeu9SiDtteOAdS4UH
   QxqcqGm0grfeREJ6bni0ynb63gqKPLb8HCRS2V5Cnk2tPBKbA5RNNlqzS
   dJrdA5L+C46igxg4ju8GQ0AebTBgkk3qHayoBVXUFpW0UcRK7EZKj7/BW
   Fr334IwpH11EHCZpatalgvFwqB35kJEVP9Nyc4MhO/CS3UNoDjna+RwyR
   WNTB+29hUg2+OoaOxH7n+Nm69ajkbHJ9KR8jUgmJztiMS569QS6mveQ6G
   LTT7oaJzjmjlz0N946PW3zuBUK7ioPFb0FWD2VUpXbyWJy6nvRgUJRFMa
   A==;
X-CSE-ConnectionGUID: wgwA6GNAQcy8fUPxc0xqQg==
X-CSE-MsgGUID: nk0E9dU3QaSsX0RYafIjTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85696672"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85696672"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:31 -0700
X-CSE-ConnectionGUID: VLg11lL0TA2RDGulLAa/WQ==
X-CSE-MsgGUID: 3i051EavRmaRr85RZlfRrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255817615"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.126])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 08:53:29 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 5/8] i3c: master: Reject IBI requests from non-IBI-capable devices
Date: Tue, 28 Jul 2026 18:53:05 +0300
Message-ID: <20260728155308.142713-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728155308.142713-1-adrian.hunter@intel.com>
References: <20260728155308.142713-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085332_234927_70B8080A 
X-CRM114-Status: GOOD (  10.41  )
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
---


Changes in V2:

	None


 drivers/i3c/device.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 101eaa77de68..307ca6dc04ca 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -205,12 +205,14 @@ int i3c_device_request_ibi(struct i3c_device *dev,
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
