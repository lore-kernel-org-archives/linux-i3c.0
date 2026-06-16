Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004C9CD98E6
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpGq/+ioqmhIE7cKbwkNc7m7REY8b1H8T4HULciCKcg=; b=wjtqHRu7Rsq3d9
	/dj/ja07agoeTFZY787ct/Zq9BkQPOaZ1WTvWNZkL7cWjwwvDWEO97xZpbMkgHUgqlgSHathb67Yc
	tKgW+IRBLMOigr0741awhFS3HsNqHzUkVqrAmgJKZG9wjavL8gdGxO5lDLYqIx7a/GFycL4GJ5/jO
	Tf7fdK5wuvcsXsLKu2LFe3/E8+loOe9fS1khhZTIExLVW6xUGpG9VWeE9VrLbmnjI7RLR6BWMYgTk
	kzHk1KoRqU/mJwjJEksB3hzkM+BCwE1VIYPbLkqS6KLOWCo2U9b4ESl8wenpGMp1GxWjF5lUBcIGl
	AmwZN8cJPOjqV2CkDxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7O-0000000FgTC-31Ws;
	Tue, 16 Jun 2026 11:38:10 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS7L-0000000FgRG-0ADQ
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 11:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781609887; x=1813145887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vzjCOULK10zhhW9cPNbW0uto8mZkx13NVRPck38PmTo=;
  b=gk91Bbd64qiWDs9gv+YwWPFjHgRUEHFgBhG0+Y8VF637VpwP3dOVvRNe
   KyOQDRw9RrHvyjtyYSi+rNT828tuToaTDxyhm3rld/ET2TZR4gPKY3s+o
   hWpi9HOTDcOHKa6ACGUBFduJFaWMZAjsMys71TN8qqWzfE1it0s1TQNxG
   sSXkXcl+/0WEISgXqSNVRT9ON0IZgznRafBm/XSCZDEBwOMOxYgHuJJlh
   nyiBXw1i5mM3kkBr7eWT4kXM1F18PSyCJIcaN2XJlESk8nedDlN6vtr41
   DlbFksGpL+j0/6AuqKJdCLAUSNzY5CPhz08kxaP2Vud67YGI4qsNidMOO
   g==;
X-CSE-ConnectionGUID: OZ9cbRguS5inC7x7bnLASQ==
X-CSE-MsgGUID: /Dz+cNuXQ7+iXLxnnns9yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82383817"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82383817"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:07 -0700
X-CSE-ConnectionGUID: vJS4FGKfTyeuoR/cIpnrOw==
X-CSE-MsgGUID: tHklzjwjTnmGHYpBkedKhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="251666733"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.134])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:38:05 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i3c: master: Add missing runtime PM get in dev_nack_retry_count_store()
Date: Tue, 16 Jun 2026 14:37:51 +0300
Message-ID: <20260616113752.196140-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260616113752.196140-1-adrian.hunter@intel.com>
References: <20260616113752.196140-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_043807_135174_C98FE0C7 
X-CRM114-Status: UNSURE (   8.11  )
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

Ensure the device is runtime resumed while updating the retry
configuration to avoid accessing the controller while suspended.

Call i3c_master_rpm_get() before accessing the controller in
dev_nack_retry_count_store() and release it with
i3c_master_rpm_put() afterwards.

Fixes: 990c149c61ee4 ("i3c: master: Introduce optional Runtime PM support")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 66cf5d3bd987..903ac01ab413 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -767,12 +767,18 @@ static ssize_t dev_nack_retry_count_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
 	i3c_bus_maintenance_lock(i3cbus);
 	ret = master->ops->set_dev_nack_retry(master, val);
 	if (!ret)
 		master->dev_nack_retry_count = val;
 	i3c_bus_maintenance_unlock(i3cbus);
 
+	i3c_master_rpm_put(master);
+
 	return ret ?: count;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
