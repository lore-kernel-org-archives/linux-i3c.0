Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F39ED78785
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyaOsYR/3tU7WwNVvnxG92lt3Pe4wdgSXRYYYjdX2a0=; b=cNdXD4DyagtrkL
	G6DgweRpmb57Fek+SAqypsOTshnI40aFeWdbdpmL/kYwS4ru+yXa3TfGoLlqBj7ZN3GNTXP/WBUU/
	pQmSj2kjL334hdMG6rIZ7s23YAWSBQjhGrEsQFIE8P2X5cSv0gVbtq/L4Pxh74ZyNdWOE1lEjVFBM
	t8aY4TOq4hyQIUjhCUuZca8nZBIyw4WKROYUPidFtfjqgiOrNwk4SdsCLOv/7+Vk2M6PsDuLuaKZi
	HpSIQLke/IrndVaiumeteK72ETlFW4r+dKG6Wn477Q9bDUT1FteWTu/uN7Ky8NOhptsxk8/P66xLu
	+u4xYch409uDb0w666yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjy-0000000ARPV-3FU5;
	Fri, 19 Dec 2025 14:45:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbjv-0000000ARND-2z3z
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155556; x=1797691556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mRJjp5pD7+8EYcD1NPcbqIVOXFXUlXIo7EafAPQcKFg=;
  b=Rl2jQq3av2NEbgl2oIdKJaGVXFt8uz1OJMfOs3EbtWZu5Ve354t6sx/Y
   MsJXXyv7DMMR/ocoHXhBukzvr6Ppzs/uYSkmtI0E25JW5oFQu8OtIYRip
   nikX0SNPJBctKSWZBeIXVmf/wLoAiV50L4jwTgxEmc/WPR/+vTOm5rUA7
   RR+wkbXy6UhMmHWbT6oYdXWwNYXhi+JCiFvza7C80dOMkA6ltMTBvPyD+
   tNpI/UbZk6Z/SI8jzDlsBDoWEH3kJNIh0dbyNK4mlPF0d8fBaI2PAgRVc
   91hmg1SKXtFZrZersNjhdjS1HQBLteRkUWh42bxcm5XtgCLThu0PuOvew
   A==;
X-CSE-ConnectionGUID: zaTiV9CzSwStZ087Xma7Ag==
X-CSE-MsgGUID: bs/q0QIqTbO36pLH209jtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588923"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:55 -0800
X-CSE-ConnectionGUID: /57x/HMuSG+cSYRUTMLGSw==
X-CSE-MsgGUID: A55Ot0fvQpSdMu0+BU38EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229563944"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:45:53 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 03/17] i3c: master: Update hot-join flag only on success
Date: Fri, 19 Dec 2025 16:45:20 +0200
Message-ID: <20251219144534.84391-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064555_783966_CAC78175 
X-CRM114-Status: UNSURE (   9.11  )
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

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
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
