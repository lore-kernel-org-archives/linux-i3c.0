Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF81CD4F54
	for <linux-i3c@archiver.kernel.org>; Mon, 18 May 2026 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tx+G6jcjNQ/PgnHfqZeKDYVp8t1IlNp0joxpkCnePY=; b=H3isLYaTHaNAoL
	jLKTtWWuWqrG35dCdDO3ixVHKVrj5XoAjXgRVyKMAtmfd8lGqjWtPCnXWPFlkLKU0jhybRWvCk/ZG
	jEeA0A3SZUZ62BQSkEPfFaa1bWaJMwcFYGLK+ZENrvsMIy5OaycXGjSOipHetRzFb3C6mrQHbM3gC
	x6YysTH0mFOPEUe8e7foedQmK40iZRjiFk6k3PLVYj/Wvdd+oNInyFJ7bcijZ3+kE7e8f9DM4U7Sx
	UtjkhHOnC0imT1yg6HOztBzVf/wlYsFhaIu8HuufSIQS4itlK+yr1RFueVwgnXAJGYoH3GjxNLMck
	lCKfc9FI65SF1aCn0uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZU-0000000FW6l-2wLM;
	Mon, 18 May 2026 11:55:44 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZS-0000000FW3B-0cio
	for linux-i3c@lists.infradead.org;
	Mon, 18 May 2026 11:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779105342; x=1810641342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lTtMuVrJNw2IoPW2wMITq46V6MAlulkuO/DcRnZTqTU=;
  b=fJfJy3vcnI9I3Fz7JHxjs1uBdP0AjHoz29T0Jo5Kl8HWM4PRwL2Erpiz
   xEqgCY/+7a/0zJiWLFnHNZmDoBzQuj5uBcydP3u+V5xPoIOt+iU5uYmRq
   zc9CKuTJugQH8y2yzgrXfMSXMX2VwFOuRzbf+JnpLEcbQe2eUog9iHLRk
   QjXQ1tFg2UIMe8wTUqcZ0leCbP7210kESIJ5qcXHiKwUo7OLRjYkJVtx0
   ZII1lw+O0dmbCtbKGo84zN8WUC9FQP4kvYAvtdo0unJqkTgbqzyFmYh07
   X2KXnglbjlibOhwNP5hLU72d24z1oAiSbQPh9El6Nr0oBw3QcCX7qErJO
   w==;
X-CSE-ConnectionGUID: Ah+KLi7FR8mMMpJB1IAUdA==
X-CSE-MsgGUID: 7Y0O6d35Qz6uQgyHMu1w0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91347048"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91347048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:41 -0700
X-CSE-ConnectionGUID: +ESJhtAKT1yllq8VseiOpA==
X-CSE-MsgGUID: uH47qRaRQZaaVgNVei7lzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239663404"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.220])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:39 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/8] i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
Date: Mon, 18 May 2026 14:55:13 +0300
Message-ID: <20260518115520.98335-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518115520.98335-1-adrian.hunter@intel.com>
References: <20260518115520.98335-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_045542_197367_FE1E74B5 
X-CRM114-Status: GOOD (  10.91  )
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

i3c_set_hotjoin() dispatches the controller's enable_hotjoin() or
disable_hotjoin() op and updates master->hotjoin under
i3c_bus_normaluse_lock(). That lock is a read-side acquisition of
bus->lock (down_read()), so it does not exclude concurrent callers.

The hotjoin sysfs attribute can be opened multiple times, and writes
through different opens are not serialized.  Two concurrent writers
to "hotjoin" can therefore race in i3c_set_hotjoin(), with the
controller op and the master->hotjoin store from one call interleaving
with the other.  The hardware enable/disable state and the value reported
by hotjoin_show() can end up out of sync.

Take i3c_bus_maintenance_lock() instead. Toggling Hot Join enable
changes bus state and is conceptually a maintenance operation, so the
write-side acquisition of bus->lock is the appropriate lock and
serializes concurrent callers against each other and against other
maintenance operations.

Fixes: 317bacf960a48 ("i3c: master: add enable(disable) hot join in sys entry")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Add Fixes tag


 drivers/i3c/master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ab11e2d79aab..38ffc8713167 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -649,7 +649,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 			return ret;
 	}
 
-	i3c_bus_normaluse_lock(&master->bus);
+	i3c_bus_maintenance_lock(&master->bus);
 
 	if (enable)
 		ret = master->ops->enable_hotjoin(master);
@@ -659,7 +659,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 	if (!ret)
 		master->hotjoin = enable;
 
-	i3c_bus_normaluse_unlock(&master->bus);
+	i3c_bus_maintenance_unlock(&master->bus);
 
 	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
 		i3c_master_rpm_put(master);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
