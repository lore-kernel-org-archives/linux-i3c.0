Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539BECD4F3C
	for <linux-i3c@archiver.kernel.org>; Mon, 18 May 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5MFeXGv+g9rX6OyhTmCKVSxe0t89bOIjQu0NeHCV60=; b=IrjhauYRFYsl4F
	nrFLQsdLf4EMEoDTwFGX4Z1dvuqbLtgDSZgLEQkNIQZQPSbqju16xIHyEYdbkGcFnsVbymGTCj2Wc
	Cx5htBHlACH8pxHvAvOIE2613xfQ8opI4gBLbBUH9TvKzSAFyvuiI11WrHz7oAD9GLaQD0IF+e5u3
	pbYwzwO5SIuHFi+2R9Zk565dDHszcYnFidLrv3vNcmAek7YIE0G9v9Vb/63B6bhkqXkQINs281jHi
	y5Fim9qCCDFasRm4g23AkLQMS23P8OIJ6QATHiFHdk26JkbOxp7QFbkCXB30QsL9dsyN4u1lbVqV7
	kHX2UBzJzvfATDDwufXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZb-0000000FWB7-0CU1;
	Mon, 18 May 2026 11:55:51 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwZY-0000000FW3B-32BO
	for linux-i3c@lists.infradead.org;
	Mon, 18 May 2026 11:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779105348; x=1810641348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x9wINvGzkhXWZhz0LHxePidlKWHibKXGhzDQTSxC8h4=;
  b=eJwjxDIp88C6l8u4nv/Z9aFjf6iRgXFD+mijEgXQ5pucdDeOV4KJ2Jim
   a92V1Y/9KoSLudROMJFwwWI0ZGkF7qHTwabURzS1LTGJFtwibThDB0lHx
   I6dUm6Qudo9CrlGDtXvxqdksKNaRtLvnqC+glfJe48tYUVoqdGXDsJ0ak
   8NA+sfdzx+IkuEVTODiwl5k9boNBFHq1f6UbgW4JdonTCcDKHk5WoMVwh
   oWhn7J8Q/gVoSKBMlSPLhNt5HiX6D3arA05RNxCFrpePPOdsU08V6iTlr
   4s8tp9NXgNLD47pMZoHpggqfpIvhKNTuNzQZFizhla5rj72z3FGEXaZ7R
   Q==;
X-CSE-ConnectionGUID: uEHbO3WRQlaPOglkTxc9Ww==
X-CSE-MsgGUID: d0R+5k84SquR35i7Hf0WAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91347078"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91347078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:48 -0700
X-CSE-ConnectionGUID: fCE30K8ORbC8nt6KjVq5fA==
X-CSE-MsgGUID: 1PTJVs2iTxyFrz5Kn1lP5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239663423"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.220])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:55:46 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/8] i3c: dw: Drop redundant Hot-Join cancel_work_sync() in shutdown
Date: Mon, 18 May 2026 14:55:16 +0300
Message-ID: <20260518115520.98335-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518115520.98335-1-adrian.hunter@intel.com>
References: <20260518115520.98335-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_045548_790276_FE5CC423 
X-CRM114-Status: UNSURE (   8.14  )
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
