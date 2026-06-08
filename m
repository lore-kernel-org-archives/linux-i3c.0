Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF97BCD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 05:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWoKiUP270F6z1BUd9tLz58wVx3jmRd6q0UIdfjShaE=; b=gA750+KUBMvCRK
	9eKb7J1DBjV0twZiRHotAvvHsKFHhKZ8so6T4K2N7UAWV1/1hbRcywXInsWn1Yxaw8un3l3pSGr5E
	gVVxLfY/8TtQt4NM7w3pHqwI4VZfok2rgM6ciRLI3egP6Wt+ASGwSj+8mheSb22TSQfHmLJ3HIx1a
	/yT9oUkOutmp4XaaFh3W+qEaj4KHIA5hI/6HFBME818a5hNo6323eME2yf4aCzIBprp267iMEF2dD
	eJVWAB5oQwTJcvz9AzNM/uYvEeHMKjeqsy6I7jiIDAbHJmnCvQpbrCgv/5F9DAFJDGtRfyZgra62y
	kRV+se9Z2zB46AyxPWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSls-00000002qv0-33KH;
	Mon, 08 Jun 2026 05:43:36 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSlq-00000002qr4-3HhV
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 05:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780897415; x=1812433415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R+NKl/FyOuS6RcqfPQVYLwMCMeC8u1wvspCUJQ74Igk=;
  b=A/b5LBjO158TNSbTH+yk2UaDA6tRtoTfQQ8cQiyazaYd0jwNQWIY3NRb
   8vOfjRySEA//usS57tsVG16bSUzRuzNGkBVUtEPoYFfo3ZBBpYpB/7x8u
   gwznHPZRycSeKzmjGafa3Q9IVyxNY4qQb0E2RQl+5tNX54nKQmRRUATcE
   i3SGRpozj4Qgd4wUlRfTRaIShlu7C4logcW9/1YImJyo6+QMfbJ2jdhr1
   17y1RAu4pZ8Z6eRuIE+Sg/tWBP/cNdAvHZoHtApZEghdIwD5UUehQ0pYM
   cIK2Zr46wZEeZTTdXdt/v8gkiOxJHinv5JzLa6iH4tnlRTTdsrYHOq7NL
   A==;
X-CSE-ConnectionGUID: N/FtZSsJQU6LiagxeOj3Pg==
X-CSE-MsgGUID: NXhgIMP2RyePzPAfdtQFyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104284051"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104284051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:35 -0700
X-CSE-ConnectionGUID: huVb5kKFQ1KwO+aciX17FQ==
X-CSE-MsgGUID: VENvf8h9RaucIeHkg8LuGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245505684"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 22:43:32 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 5/8] i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
Date: Mon,  8 Jun 2026 08:43:09 +0300
Message-ID: <20260608054312.10604-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608054312.10604-1-adrian.hunter@intel.com>
References: <20260608054312.10604-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_224334_860677_3F8E69B8 
X-CRM114-Status: UNSURE (   8.15  )
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

The I3C core now installs an i3c_bus_type shutdown callback that
flushes master->hj_work (via i3c_master_shutdown()) before any driver's
platform shutdown hook runs. The explicit cancel_work_sync() in
dw_i3c_shutdown() is therefore redundant: by the time it executes, the
Hot-Join worker has already been cancelled, and the shutting_down gate
makes a new worker a no-op.

Remove the now-unneeded call. No functional change.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Add Frank's Rev'd by


 drivers/i3c/master/dw-i3c-master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index eb9a13a73684..c7030d0cd8a6 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1793,8 +1793,6 @@ static void dw_i3c_shutdown(struct platform_device *pdev)
 		return;
 	}
 
-	cancel_work_sync(&master->base.hj_work);
-
 	/* Disable interrupts */
 	writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
 	writel((u32)~INTR_ALL, master->regs + INTR_SIGNAL_EN);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
