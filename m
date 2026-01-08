Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCBECF6BE5
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXfq6i7umavmaVsKoVinfO64VfUM4fsEOL6jhqFOP68=; b=OOm9ihA4IWQeqy
	7JrftAWpt+9ZsiR6zdTfosYa2fFSoMjxZmt2LoN0ndTShr7db5XkHAsMZr8P7lK7QgiYxUQ7WLJTh
	1FB37eAXHif6ly4ehicsmxcyHeY+eRcfKiWkXyd/901MqonCoMOlKXlFbLStrzWIXvHmWXaNySvVC
	yqw2L0nFwQEPeb8K7rCWtx/Mx8r7gQjA3Sf8CVhNvebGTk5KnlB67wfWFMYuiRiOTyTL3bX3AIolc
	xSZoDoCljSgHQrxCDc367FrIjqXXd0T+0d46cOiblnP+DvSBPK/N+W1+OztE71CoFt2ik3Z3qmp8z
	GM19wp6/QPLovMz/TRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2E-0000000GD5w-1uXf;
	Thu, 08 Jan 2026 08:06:22 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2B-0000000GCzw-2BC1
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859580; x=1799395580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+VapA+bv8ySNp4UDKIS7XFYz2qDKdEyRZgxRQNUuBgs=;
  b=a95ONct0i6xI2m3Wh13PmzsP7iFCMqXV0D0ziyES/t8mNIdlsmGjYD38
   ylq7nV/2KhFKIXdh8uqBOGMDiHUtAUdngR9byOKbL6BkXW1xYQg7Lkehs
   Vev+S3Sm2RyTB4KSnWDPqfp+X8U64ObcqkVxQYLHOvu2bBkaSXh+vaNDT
   6AZu+MaGhQklQ9fQAMqYMEh572h0lfB57/pn+0AEbezIfmWt/hxHmh/d+
   u1RWgsR39xA/B/OrT+kHRtaIe12hWopHfImgXKPLu1n5xWyPxV93gs04Z
   C6NnI9AsufZ1CNJpVq8/PH1C7Nacj+BgOSc7V6CZneMry/bHrdLxR1ILg
   A==;
X-CSE-ConnectionGUID: NDzl+CNcTlqEdFFpvlypMg==
X-CSE-MsgGUID: rh9R9JQjTXiu5aBr0ZUzXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792270"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792270"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:19 -0800
X-CSE-ConnectionGUID: hCmk5bz7SKWkM7StKMxFbA==
X-CSE-MsgGUID: rfD7vd3CR5CFrMFB83PNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413579"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:17 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 04/20] i3c: master: Replace WARN_ON() with dev_err() in i3c_dev_free_ibi_locked()
Date: Thu,  8 Jan 2026 10:05:42 +0200
Message-ID: <20260108080558.21767-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000619_578882_748E8225 
X-CRM114-Status: UNSURE (   7.83  )
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

IBI disable failures are not indicative of a software bug, so using
WARN_ON() is not appropriate.  Replace these warnings with dev_err().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e6384bffd4ae..ff6cbc044787 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3113,8 +3113,11 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 	if (!dev->ibi)
 		return;
 
-	if (WARN_ON(dev->ibi->enabled))
-		WARN_ON(i3c_dev_disable_ibi_locked(dev));
+	if (dev->ibi->enabled) {
+		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
+		if (i3c_dev_disable_ibi_locked(dev))
+			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
+	}
 
 	master->ops->free_ibi(dev);
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
