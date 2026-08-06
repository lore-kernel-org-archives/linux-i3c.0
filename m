Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13095C55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEDv4nV2HRKJrm5ZslQPQHDmN18GX6FpfiPsfMz9xKE=; b=Vg9nSYOQ8NUGoS
	Pd8BD6x8HDnzXk54kVu6Yh+OE1VC1/InkBqWpy6hiwwyLSzupwnl4uykODE2snj4ursGXWNkWv7Md
	Ke2Bwi2gZ/VIEUgpxGjhl9iFovARY4UlX3DBEScwr5ET/Il5fEVpZbb7sHjvZSVKMAaOhqYjm7cUD
	FTh/tcaejmdAFbBvpE3lqdkuNuZPT4pNq6RYTu3+UiCm2EKf+vJlxGl+cvc4jeF5ChfbIITEGeKgU
	zsldeaSV1PmMJUdYgnVQ1HnvPonSrSjV0pjg/5IgW+NZB8ej/mR3UVRAomCcfEjDGQUL23JryB+w+
	QlvnH6GAz4KunwjQV/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0c-00000005sCF-3GJv;
	Thu, 06 Aug 2026 13:19:42 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry0a-00000005s3x-3eIj
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022381; x=1817558381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nX3Q4Ck76KKHbqDDEK/0Elh/XWuHke9+jxodTd88M7I=;
  b=D/eH/mwWKxRIfRllPAO3q750oAc4HLZGOyBJjWMmWvWXKTexw+smkVbw
   W0imxpReMXDdJ1tu5TC83fjFkDdnk1QbmrFhzTm1QWL/7iuWckgVTP8sY
   UHfFhETJ2DCxTiLFpfClknO0cqI3d8UZJKFFf9qcV+pxXopPAyKYuN77i
   codbu+DdyBMiowkvUFHwNz0TMqMfZPaiy6FklwlWK4x1tSofyU6kk5nWY
   PHvrc305A97FX56BTNt21LfS7bZP22xlYdhp/JeECHZsPedodx4GyFgfu
   aOlJWXa5QXBCpxppLJTZB2QM+2XPA0LHJ7Og1wPfTOICXp7i0ShKrX0aM
   w==;
X-CSE-ConnectionGUID: FdF8qglAS7W7nAIdXgYQEA==
X-CSE-MsgGUID: xDD3Cf3qSa6a1ykxkCD3hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74149639"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74149639"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:40 -0700
X-CSE-ConnectionGUID: GJapqe8GTKqZ89quraQLnQ==
X-CSE-MsgGUID: 89gP3eSOQPieWvbSTUp0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260338258"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:19:38 -0700
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
Subject: [PATCH V4 11/14] i3c: master: Reject IBI requests from non-IBI-capable devices
Date: Thu,  6 Aug 2026 16:18:54 +0300
Message-ID: <20260806131857.119830-12-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806131857.119830-1-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_061940_915702_B2D8C178 
X-CRM114-Status: GOOD (  10.26  )
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


Changes in V4:

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
