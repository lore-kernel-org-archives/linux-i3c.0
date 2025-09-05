Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC05CA0FED
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Sep 2025 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P9bzSkSVMG0aOlMQKkhk7MdC/LhGyUv1+Vf7ZLQz2gU=; b=AUCQ4+ZtD6ilzE
	wK4RUTr/elyBBjJSAdvWdBZEWQfWvPLOj06KHxB8tUx8pjOY6tojcDLB4OwncMO04q0y0W+TRLxSi
	jbQk68nOYzYMQexydGRYJ5h8Ug52IK33HtlXLZ+56X8z3Mu3BDK6iAEuBKD0BBINjbD2UZyqbvc7R
	pIVIEt/CcLaDipgHsgdtHKrI4IaeAaJHbcu9zL0GmKhXKBy69sei+OtZ17+nxlRPA8B3SOYmm0+tL
	2gQVwys630ZON69RbNlGR5KFF0ZSrTveMajzr3ovQ/NxoZ6WV0ubtRUv3KRzGKo1uppF9e+dXJnXb
	o5EX3KIj0jKHuHvMyMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWw-00000002Mky-1pvR;
	Fri, 05 Sep 2025 14:35:10 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTHy-00000000vTF-1gpC
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 10:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757066606; x=1788602606;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RxdiTblO4Wz8Rs154MS5jVm7KrLuUtNHDhYd6LFLef4=;
  b=MsbpnPTg/cJOcOw/amkWdbwbzhwRfa7+0kSsVNHW7lD3sZPJvFgH9rGr
   zhsxGUj/4FDWv934D+yfupD6g0Ul81NnA0vP3c5mzTdkgLEm1TFhAFlyC
   zN34rZbq4WQbiqrPabDR+MOADp8/hrlnDM2Hdlcr+r6mq1KqEKvmpIRzK
   qcHLBq85oN5iD1B3H9PVrfqyb4xdowbPFqPlYBtt8JtfDOwPpu6u4Th4b
   vh0VJq9+QT1fhfAuiwjzOjAnM5mrBD/MxeuPq6w9PB9Yi8Gnk9cSnhYJO
   XoGVu6fwmMr4+TjDhs/O5kpvGvjegGR9nXFWlE3BHvnwgVY2JI0jM6/Aq
   w==;
X-CSE-ConnectionGUID: 5tX+mU4eSliRvoX4Ihn6AQ==
X-CSE-MsgGUID: hF+oVellSxaNpSKrkpvJzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59116070"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="59116070"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 03:03:25 -0700
X-CSE-ConnectionGUID: /WCAUJTZRMa83cjGrrr42Q==
X-CSE-MsgGUID: oCD0hlqMSnWO56qky40FDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="172939048"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 03:03:23 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	stable@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] i3c: Fix default I2C adapter timeout value
Date: Fri,  5 Sep 2025 13:03:20 +0300
Message-ID: <20250905100320.954536-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_030326_477517_5041A41F 
X-CRM114-Status: GOOD (  11.12  )
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

Commit 3a379bbcea0a ("i3c: Add core I3C infrastructure") set the default
adapter timeout for I2C transfers as 1000 (ms). However that parameter
is defined in jiffies not in milliseconds.

With mipi-i3c-hci driver this wasn't visible until commit c0a90eb55a69
("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers").

Fix this by setting the default timeout as HZ (CONFIG_HZ) not 1000.

Fixes: 1b84691e7870 ("i3c: dw: use adapter timeout value for I2C transfers")
Fixes: be27ed672878 ("i3c: master: cdns: use adapter timeout value for I2C transfers")
Fixes: c0a90eb55a69 ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers")
Fixes: a747e01adad2 ("i3c: master: svc: use adapter timeout value for I2C transfers")
Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Cc: <stable@vger.kernel.org> # 6.17
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
- Stable Cc'ed just in case. While the incorrect default timeout value was
  introduced back in v5.0 it became visible only due to commits in
  v6.17-rc1 and if CONFIG_HZ != 1000.
- Added Fixes tag for the Renesas I3C controller. Thanks to
  Wolfram Sang <wsa+renesas@sang-engineering.com> for noticing.
- Added Reviewed-by tags from Frank and Wolfram.
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..67a18e437f83 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2492,7 +2492,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
 
 	/* FIXME: Should we allow i3c masters to override these values? */
-	adap->timeout = 1000;
+	adap->timeout = HZ;
 	adap->retries = 3;
 
 	id = of_alias_get_id(master->dev.of_node, "i2c");
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
