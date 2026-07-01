Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1C8C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rQIijaRhUEi6jSrf3KgWlkL+YyCNTfvZsWKQUqEONU=; b=cH+34wTx6atvGq
	k2tcjohGwwzW+DUES8uttNnWNdChu9YvZZvyICIMtC4eyHqHosHlfskHbDMVlmvvmycTDP7C71+qe
	HvdkydnWQhY4EpU2sk8EuZcYeoibnUyxGN5gZknx55b+jjdgeQG6WZSy8Yz5Xx2H8eeqMtHWyrKqL
	/iN2oQLG1WZfpD/EZ9iVvU1x2lHpBQozzpb5wzhAHMPEQcWWMpIoxEVSgx7DzeSpnZt38mfIwjrJs
	TA7xaDW8lc/H8tCqRk4IgkE+a0HTw1FkfFodrTiBs6kXTQtxCUt+q50zX4ajxXpTKpqW8J0df+0Ac
	GL5hS7Y8OnV5YVVWVYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Lg-00000002xCU-2eaz;
	Wed, 01 Jul 2026 20:15:56 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1Ld-00000002x67-2nEn
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782936954; x=1814472954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VTAvYFO3S4nTpXuNRTDSeK7JhvfP65YCWkQJ/dIE6tQ=;
  b=LKX8J1zzlVFl/xDxZv8DfYztyIEJsA7sXwnGO5sGFHH3qq4nescvGKR7
   o73BqVPtdkd5K6mPdKQJ6k62XVQ8K73Yt9PmxhHsoypukgU5HmAzp42/e
   E5LDsHKWuailhfnLsbbxWxp+fafHq1xijg7MVm1NTFXEgk6/wnqGcLRBR
   il2YCOo3EM9Jyc39edDiDujdYWyNUWZw9pbV/7VjuDiPNkCUeKOqpnMJI
   D/yU/Cey/+BdJCMbRCMr8IgchNE1mfzJnSmiv2Mou9SK8Fkgj9TTo82bG
   SihuSY4uDSwUAAHP17djxJDK0Q3saM5KPvrRDvavMJrl/LTD4CSb2gfEJ
   A==;
X-CSE-ConnectionGUID: J7NFuMRESUiWl/q9+lMZiA==
X-CSE-MsgGUID: cHrV5qWGRna0Gs9EvLRJEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82671806"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82671806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:53 -0700
X-CSE-ConnectionGUID: NBzLgdcLS5+WbiDqbxZd+Q==
X-CSE-MsgGUID: lK30DXguR22GivIUxBET2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282737063"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:15:51 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH RFC RESEND 4/7] i3c: master: Reject IBI requests from non-IBI-capable devices
Date: Wed,  1 Jul 2026 23:15:30 +0300
Message-ID: <20260701201533.220818-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701201533.220818-1-adrian.hunter@intel.com>
References: <20260701201533.220818-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131553_716700_D1A75529 
X-CRM114-Status: GOOD (  10.73  )
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
