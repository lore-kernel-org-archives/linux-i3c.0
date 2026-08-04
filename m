Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FBCC55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWeEunGPfLI1H+L5KbNJi8kPpxrv+4qTGUJrz7CQB2w=; b=yfu1z+vM2uyuq9
	LIIhkl8jyC0PHmM4oGs1Ixm99hnkhW6brmh2WioVmpalMHPhNG/Fw1e4riSWKv/u2lFeqU7Skx6TQ
	FrvtXoVTf1VJz0jFnlY0zH2m36r1+EEwK7Q2qYKfhszh1lnIxJZC/CVz5JEPgDiWo67chlFiHkhzr
	SVMShrgotCMTxWP91tFABPssvaDdc716dLvK81LiM1mNrvBZJj1bqor6njh5remwIwfNMNLJY1+ml
	zC//LNEJNeiY97M+nAsOZquiytLw8Pwv/an2uO3BJ8jOyVzde6iBQ21Dekllh6NeleUvjkRofyEXr
	CwJVC08pK4WZ1sGfbzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLj-00000001wS9-373P;
	Tue, 04 Aug 2026 13:38:31 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFLh-00000001wP5-01Yj
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785850709; x=1817386709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=voeBAnGBFWyl9y6fsdJxZVdFpnCWoucAS4P5V6Enbi4=;
  b=K0BG90F/ATOBzlJ83Zz2Zmu2tG9GohytGgJ+QNA2PhBWmmlnlzv8VxQQ
   QB3BfYKBXL5aYKYlIz6hxgZ1vvYLVfVVsySmn0d/F0euZQdD7tkM65inl
   lqYmAVV4pxnPsoM4leNb08IKREpoM3m2hzfBklWkpzpUJSxXsyB3skzzN
   CmjYGNDEs4xb4Z1v7tIyju1Ny4uMniFcwRUiHc+3K+9jcr9kV50LfbK5B
   Bych4c2Odq7dGRDEwHJYcSByC7qKCy6PVrsWd+gUvBNBI6z2HBy8C+Fwj
   zm/p3w9xquihlZcqKWbHKXmqUCK1aAZZS7yBAe4y9+RmSWkKMzqDjzeG6
   w==;
X-CSE-ConnectionGUID: myT9IbYpTq+wkm5owXIcYQ==
X-CSE-MsgGUID: b12cidRzS8ScE1b1i4dR8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86410101"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86410101"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:29 -0700
X-CSE-ConnectionGUID: KlR37LwqQYGGpeUnydrrPA==
X-CSE-MsgGUID: OiGhG4D/TsyUrJucXriXRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263501008"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 06:38:26 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V3 03/14] i3c: master: Do not treat master device as a duplicate target
Date: Tue,  4 Aug 2026 16:37:59 +0300
Message-ID: <20260804133810.184905-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133810.184905-1-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063829_086287_08B80652 
X-CRM114-Status: GOOD (  10.24  )
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

i3c_master_search_i3c_dev_duplicate() searches the bus for another I3C
device with the same PID as the reference device.  The search can match
master->this, causing the controller itself to be returned as a
duplicate.

Since the controller is not a target device, it cannot be a duplicate of
one.  Exclude master->this from matching so that the function only
returns real duplicate target devices.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3:

	New patch


 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c7bb52b71d88..abb582645a2e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2545,7 +2545,8 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 
 	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
 		if (i3cdev != refdev && i3cdev->info.pid &&
-		    i3cdev->info.pid == refdev->info.pid)
+		    i3cdev->info.pid == refdev->info.pid &&
+		    i3cdev != master->this)
 			return i3cdev;
 	}
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
