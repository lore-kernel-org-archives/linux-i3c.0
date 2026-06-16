Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF966CD98E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCdNNMCGKWKjJhtRW1nIO00EZYu/Q7Jp8k9z/fxMpXg=; b=34Mije3F5EEOw9
	trscprvpAv8i/nUg4q5Mh3ljqykI6up/org8/IkKWUKHY074vKXExNn3xD5tL1/kUE2E7ZDMFdLYG
	gZa/WFkcAbtWpPMWWuPGngvp0Wx+22zxLWajnPAz6kmBajxxOsforYLoXcxI/SgFwQszJTIa1soMS
	V4Ibv3Ao0bK5G1niy/VFcuiK19XXeBiL9jlwUU6ki2dRglPIhA/1r3rBxsvGWERqjoSS9N92/NbJM
	ci/tSg4/bJ5GKwxvciyhwHOeaKQGQlKh5uyDu7E9Dwr3ugiK9/CCmBGQdMbC0Bea77VtM4A9Va9sZ
	6imfBpN8gO6qxMEZVoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7M-0000000FgSU-29h3;
	Tue, 16 Jun 2026 11:38:08 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7J-0000000FgRI-0Usc
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 11:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781609885; x=1813145885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zx+VMlOCv6IpYCIpbgZoAu7Rqm6ZaaGVS2tn/BuYWv4=;
  b=IOF930vXvuYuVhEdrksUxNmp11euzg63QCAMXzUllOomsrfQDQdw9sO7
   O8/MVdgRvMNj5OQ+kQouE56+OSvAsYIlohyevkWGhLvzmPucvcvfFu3nS
   wL+lCGvoiwm2qdR51JJP06jZo3Cutd39LoTj3uv6vGcul2T0CHakNDc26
   N8OOJasR6ese01uKICud2nNgXq05YysZxPOkC2yq6Bw8r9Y8xJP3aPWjD
   px/1jUTMfFa0wWl/DOyED6ClyNdo65Gkt1UN/mvTFeBfVdgG1XVPoEzBr
   ccJvdLjkWfB1qkwDvLJI+jTOQ30epQWkPvY9NTUNd0WzXSfpnQ+UbIMCE
   g==;
X-CSE-ConnectionGUID: Y8t1pCkoQAKeygUxoXrFrw==
X-CSE-MsgGUID: /+YSAdbFQb+aAScIzL4Pjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82383809"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82383809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:05 -0700
X-CSE-ConnectionGUID: CMmXdfx8Rv2nfji8yGr+Qg==
X-CSE-MsgGUID: ZcWXVCliRpyngC/0vZUFsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="251666728"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.134])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:03 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] i3c: master: Update dev_nack_retry_count under maintenance lock
Date: Tue, 16 Jun 2026 14:37:50 +0300
Message-ID: <20260616113752.196140-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260616113752.196140-1-adrian.hunter@intel.com>
References: <20260616113752.196140-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_043805_281556_0E44ACB0 
X-CRM114-Status: UNSURE (   8.84  )
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

Protect master->dev_nack_retry_count against concurrent sysfs updates
by updating it while holding the bus maintenance lock.

Consequently, combine adjacent return statements into one.

For consistency, read dev_nack_retry_count while holding the bus normaluse
lock.

Fixes: b58f47eb39268 ("i3c: add sysfs entry and attribute for Device NACK Retry count")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 367e0d6d4a64..66cf5d3bd987 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -744,7 +744,14 @@ static DEVICE_ATTR_RW(hotjoin);
 static ssize_t dev_nack_retry_count_show(struct device *dev,
 					 struct device_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry_count);
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	ssize_t ret;
+
+	i3c_bus_normaluse_lock(i3cbus);
+	ret = sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry_count);
+	i3c_bus_normaluse_unlock(i3cbus);
+
+	return ret;
 }
 
 static ssize_t dev_nack_retry_count_store(struct device *dev,
@@ -762,14 +769,11 @@ static ssize_t dev_nack_retry_count_store(struct device *dev,
 
 	i3c_bus_maintenance_lock(i3cbus);
 	ret = master->ops->set_dev_nack_retry(master, val);
+	if (!ret)
+		master->dev_nack_retry_count = val;
 	i3c_bus_maintenance_unlock(i3cbus);
 
-	if (ret)
-		return ret;
-
-	master->dev_nack_retry_count = val;
-
-	return count;
+	return ret ?: count;
 }
 
 static DEVICE_ATTR_RW(dev_nack_retry_count);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
