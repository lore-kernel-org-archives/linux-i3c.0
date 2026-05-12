Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADE6CD4F35
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfSlvXv2IZ/yT9xxxYwE8KHtyO8DK4Adn198xDeJVic=; b=gL44uKrNyVZKFw
	R4JYdJGXRv3koLkhsSijk/Uu5p2pXw2bx1bM8SXFqJDsugNp5k5fU9+6IzIBn2ZWsXRdHiMuFUxrU
	z9PEaXBarHCG6QcUTAbXoDn4UHelx6AIcWd05ZHOHUOffPvJqXVl2XJ1Ji73aefDBxZBovFaMcDeT
	j0Ta397WjSntvWK/Fl707uE8gDd0SROFG63K41qhlC+OW/rPb+eGLKAiWAPGKGoCYMlUJjpWQS1IJ
	VexlB3l4jFpvEc8ObCPSMiokLXWQvmqHfS6Dv7HdOPezIbWoxPTey9sx2FoMkhlMC0U35+8nezdmg
	gyYRnLPXCcNDWT8lbuvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3c-0000000GeDN-3V6w;
	Tue, 12 May 2026 12:17:52 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm3a-0000000GeBi-0ObZ
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 12:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778588270; x=1810124270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j1amexI1xVWiYSdm203maTEISYpN+zkYKyM2TcKbHFs=;
  b=asu005hOfFzqlf8/gG4GLK+km4JxGTSDT52L0PVr+yEAeLcvlzkw0Gyy
   KzXfkjCJ4344lnheqn8Mii/0xcUzLJxRIa3NDu2SJRQKqZBtD/ZsdXMSZ
   llNZ45CmMoS5PVoJo0bNQs4GOBkHC3kyanAwFTyo2nSETN7ZKjVkUhgMK
   HTVdNGk93VioetPt/c6vjleuwsAzcLGWCvWvzfTHG7borvU77sd9nsoTO
   t/aOT2IhGWO8UD86jsPkJ0aiL8iYC8qnoLKPz7ebxO7j9J6fIsz6OO30R
   WQEvtsPG9B7XD3ynTYvbOMl6hAPjm7bgFGEyLIQhghLP78OLFuIMrLrU/
   g==;
X-CSE-ConnectionGUID: DUh+l09pToSeexrw0Lw2mw==
X-CSE-MsgGUID: 3IiQ7l5uQP66QKJoEOzVag==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79389489"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79389489"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:50 -0700
X-CSE-ConnectionGUID: vvHoXNu4RHSPZ+ahY/LvEw==
X-CSE-MsgGUID: mtV5ZTfPTEmKvSgus8eUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241756129"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.121])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:17:48 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] i3c: master: Serialize i3c_set_hotjoin() with the maintenance lock
Date: Tue, 12 May 2026 15:17:26 +0300
Message-ID: <20260512121732.406009-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260512121732.406009-1-adrian.hunter@intel.com>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_051750_177008_12A394DE 
X-CRM114-Status: GOOD (  10.98  )
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

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
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
