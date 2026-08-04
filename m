Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDA6C55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu+/9yE5Sdu3DFOTQoWzQ142dh4e9DZaI5aKWmVWObs=; b=GmDsCSsCBL2b4S
	IMlhZhUFIp1HybsAJazPuL02KviEgkRUZjMElqmixz4q26mzVEdcv1j8wjH8TnAyRQZlDRVrkSiyD
	k8nIfcr/MHD5BUVF7zWpQbb7iWOwJQYDVbZKd7mmrPWpgZzh6buoZol+1U50fKhC5QY12FaEe+jd2
	+qABBt65YhAdFXtYDLX2oPwKcFNMyWnj5u6/c5PXpTSdgTnHt3hBDwwhadfrQI2rjJaXDwwHiU1ZI
	4BesHf7rEhYoYenDR1OK63wxUDb343Q5gwyV1fPh+acAn4iueQMWbtANa34TsAjuClPChdRieBcm2
	JGcsC5IFS0HzrJTGxqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLo-00000001wUi-3SVc;
	Tue, 04 Aug 2026 13:38:36 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLm-00000001wP5-14Xx
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850714; x=1817386714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z2TA/miuqxxjPRFW0ZELLHvJKfQaSPolisc0yaOn6HQ=;
  b=DgOl2/us84ODNibmOn6PqeEqA17hguiFvGHkjTNfqXLuvc0H661N+Ikd
   34+qWtvZGcxoQ3tUETEaJsfrDbv+k64TRBSyIJR/S1AXrKv508RA2YMwt
   LX+rI0aDefNoj2c35m3jXhyZNWJWLuMsQwmHMEcMGJf1FNEjvUxrTLCNF
   2j+0uoWp7pU3/4DXAEfyTihSFNQrdn4SsI+ksxHBebz88MO1CgCRgizEe
   yrxsPYV54Yp1qg+R9i9hQjQ62sTdvOsFkSQomT5sD373dDlbknmuFyWJm
   GXTvzAYVLmVt5sdZ90Lka1hiqv4aXQACgw8eKayVW4tzyVdGsh9SpWU3m
   A==;
X-CSE-ConnectionGUID: zt3od0/MQ/mnrUjwGGwt8A==
X-CSE-MsgGUID: okSHwfs+RWW2u4HZ70Oy4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410118"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:34 -0700
X-CSE-ConnectionGUID: LDTB3y78Q+mtzTsATUkFTQ==
X-CSE-MsgGUID: NJxJlSqeR/mCLrr2/sIvWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263501017"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:32 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 05/14] i3c: Make dev->desc locking assumptions explicit
Date: Tue,  4 Aug 2026 16:38:01 +0300
Message-ID: <20260804133810.184905-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133810.184905-1-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063834_339096_CE7FC513 
X-CRM114-Status: UNSURE (   8.34  )
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

i3c_device_get_info() takes the bus normal-use lock before accessing
dev->desc. Under that lock, the descriptor pointer is guaranteed to be
valid for the duration of the access.

Remove the unnecessary NULL check on dev->desc so the code more clearly
reflects the locking rules and expected descriptor lifetime.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	New patch


 drivers/i3c/device.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index a3778282e84c..5e6df6de0283 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -101,8 +101,7 @@ void i3c_device_get_info(const struct i3c_device *dev,
 		return;
 
 	i3c_bus_normaluse_lock(dev->bus);
-	if (dev->desc)
-		*info = dev->desc->info;
+	*info = dev->desc->info;
 	i3c_bus_normaluse_unlock(dev->bus);
 }
 EXPORT_SYMBOL_GPL(i3c_device_get_info);
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
