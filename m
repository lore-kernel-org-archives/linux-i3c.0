Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3546DD29DDE
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60QlxQV5uo2P6DosFO/11ThIS4MltzNAcVutzMKfisc=; b=TFMGtcQ5kxwtqT
	JaHpwl56JVylSC6sTEZRJuozpBZiVatJ02K+nt2gj6YE/s+bVBjchT6c5wQy88GrQduMHxOvJBQ1q
	CiwMY7AGpynwGk3KDk6Ga4IEJAjtDjm9lkoSiicJ1dFlTrCYEk2yPPK4EOLxYSvOQikAwYHxyAQVs
	zhKzUQtm0EV8Ti3kQzOCG9gDxjEQFlej0QpzWzQaeCgbvxkxF044CQtFeMUt2JCMpoeoBt4W6URyP
	vcGZ6z3bBtJTfeGcDVwHZzMGnisVs553eFdMuZzu1VJwyRj99flpGtxhSWgY2DL4K8THbBukSj3yo
	//Ave5KOGHnCYw2G8GIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoL-00000006eSE-3zxt;
	Tue, 13 Jan 2026 07:27:29 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoH-00000006ePX-19l9
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289246; x=1799825246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZewHavI3PKDAHYJqkpIeDB4GbawBVLQWy203cZsntFs=;
  b=G/NvrANldIkZ21ACU49B+dpsQxv3vAIMQX0xlbWFnxnOQFmgY7f2f9T+
   hBFVzXI45xUsA/PPL7CBZbB7Q8s/s1Oew7GB78qvo8Omv0O2YS+342rJO
   PphzTaTPouVJ04mN4L73ZUvX/HyuRqANq196gTHfIv9DgGz5yGKxgXkS9
   UVqfh0G3+a4hLp+IWbOMICKGGyKFJdRFamzBkG5a6fcgtJMYoE6xPW7vP
   cmD91eCGbFsHD7E/yJ6ZjMr9G2yjx9ciZYo05FYwmOClnK7U3Zokf0pgT
   fT5FV7sXC6oxmIkLCw1oqa/7+uidyj46uzjHYaYtIdWfy1bwEYNQJpVJw
   w==;
X-CSE-ConnectionGUID: gazl1d+aSs+22XcALx2MkA==
X-CSE-MsgGUID: v/YdqDchRy26z7xxKJd3vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625430"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625430"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:26 -0800
X-CSE-ConnectionGUID: L2of2AwXT+egR5Q72D2bOw==
X-CSE-MsgGUID: teqRLxRKSfGvv2PMVsxkIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021193"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 03/21] i3c: master: Update hot-join flag only on success
Date: Tue, 13 Jan 2026 09:26:44 +0200
Message-ID: <20260113072702.16268-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232725_371286_881D034B 
X-CRM114-Status: UNSURE (   9.28  )
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

To prevent inconsistent state when an error occurs, ensure the hot-join
flag is updated only when enabling or disabling hot-join succeeds.

Fixes: 317bacf960a48 ("i3c: master: add enable(disable) hot join in sys entry")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Add Fixes tag


 drivers/i3c/master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f606c871648..e6384bffd4ae 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -618,7 +618,8 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
 	else
 		ret = master->ops->disable_hotjoin(master);
 
-	master->hotjoin = enable;
+	if (!ret)
+		master->hotjoin = enable;
 
 	i3c_bus_normaluse_unlock(&master->bus);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
