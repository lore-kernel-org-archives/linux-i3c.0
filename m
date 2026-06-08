Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55CACD8CA7
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJQ4163eXPAZtxCvgg/roUvkE3SvgqDnEtEYH62yTRs=; b=ucXGXk4kAExwpD
	OQ+4w3CoO/TwjHrmbJmygVGFoeZ4+3ISgSdgJF0QVmEmxiTnvLUm8+1HspBguFsNdO1HlYG/xlapr
	1sTC3EYZyMjPPPJEfsmZjdK+mP90OJOYPz8M++rwfd9vgpNltaiJCwlPL0PFauUYb/LLO697YuiCw
	1ZYOo6VunM9D+A9Hr5rmZYJc97ThmIq421ejh0+2fZnuvKk++hixUtCXcvEQe4Fk2OQ2S1KvENFM9
	nkBWgWJbejN+fuKHNsds9FW5YaV6U9RF1AAyIbZEot7FmGzSXgQnToxoCgoxsBNO7XgdGcwcDpq4H
	92tC7NyLfqBTUrJc9upg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlm-00000002qry-2IM7;
	Mon, 08 Jun 2026 05:43:30 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlk-00000002qr4-1fuA
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897409; x=1812433409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sHmZ9Hs+c2OgytBjaBgs3aCzSZjdfUAJbkqreEo5ReU=;
  b=DfJkjAQP09qZTsm1FrQiVO2lFRLbec8OdqtTmVnbcsxErIdBuQDKbICR
   /OMLKNV+dyIerVMpT4utNy6NksEB4r93rTq5iGjwrwPxRtvESopVG/S8v
   SUf0AB9LgLgfCuZWFap+3FfO7rYjq+IWlYreH6OGJbKYoA83pWMhWIjuk
   X3gq2qEX5O2zxQUxjCVILJ04dVdA0+A6QI8QLPFDberHhz+38RugMNQZy
   tJWhFiSAWNIlvTbzapbgzwy6HISMvxu8i53Vf0mps/cJ9eF1TqTrmlgOR
   BUQx4ajlFvlnAcjCZtzjS7wIb9Rt0M3Y2JiXSN71oGy67XOqKwcb1tu56
   A==;
X-CSE-ConnectionGUID: 36UsxsnMQLCqEFq9hmECrQ==
X-CSE-MsgGUID: LBDZWAF0RSKCE2PdBTBQVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284030"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:28 -0700
X-CSE-ConnectionGUID: iBmnY1m2SrOGfUgdrLgNiw==
X-CSE-MsgGUID: WSWw9h4tQZOTP9VJOztWOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505660"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/8] i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
Date: Mon,  8 Jun 2026 08:43:06 +0300
Message-ID: <20260608054312.10604-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224328_475786_36B65440 
X-CRM114-Status: GOOD (  10.87  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd by

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
