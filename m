Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE41C982D0
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRTC7U96Y2yhC70+O4FdHMY+5zdEb5PE2YYjcDEJ+rQ=; b=qFagRTLV9uQBBT
	smT5PJnSiRoJj0BwzZgyw4uuCiZYeDjMycah7rYF6jHHOsE2fUGb56b6nPB03d5G2mnErLDiIDT3X
	wkWJG6bbMlOPlOGcNhEYRNkpASF/udXupH5trQ2h1kyrMUyqTGfp4VO2JvgTirmepHUImomXBJjS2
	eHNfkF86nnzCgr+TzrRoRNXzHHuxdb/C8cAyIwbxd7tlWTehRjQwNl/axxwbe7XJHFSvfUe8iHYCq
	xxBH125j+DF107f4mEL3pi0ptmlax4wFBSLCT+MvT9m72SvsvDlCZrut2iJS7DuIyqAKg+dJfvrr+
	O8cPrD7AF/rO/M8YEf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYp-0000000CJLN-0Bnf;
	Thu, 17 Sep 2026 19:14:19 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYm-0000000CJFz-2YTE
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672456; x=1821208456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wOR0t6NyeVQrcvvWqcA7+DR+SuMRbj2V6g0RQeyhr0A=;
  b=Xn2x97lPHO5fmn5WO+bXwfrF61s1Q+5RCThcL5MsM/z347Ix+afDzhBh
   kqqKr1PypvZBBkcBcS3LrEg//NHrj2eQi5wwtAY1iBj9TMtYX0iTR66ZZ
   ccI7NDATyj9ELkjds0dncr/I8SQL+5u8C9BgUTFDUGQp5N2KsFmb4A9T0
   dSVgQGqgfOxsJwJmqTHFab5aX1FO+W33oRiyOZPnoq1Mqvglo6IbxfrVt
   cFuaCaCYGt6vgeT3muCrTfcC9A+C1Dm6AunRAXdLMOfTxafZ1K7y9U/ET
   o2PYaRqS/wjdJLU/HXj38AJTb+eVx24/rW67IcTnJas/GH2X0BEWKhztT
   g==;
X-CSE-ConnectionGUID: GaicuDwcQNaCMA+p1+FyWA==
X-CSE-MsgGUID: T16uWvJQTDCwTt7n+zEJUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639904"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:16 -0700
X-CSE-ConnectionGUID: /7Iw5LihSPOLV0MwpYGqCQ==
X-CSE-MsgGUID: gRumGHMTQFOIsDTNr7g5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271967"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:14 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 05/17] i3c: master: Remove stale GETSTATUS length check
Date: Thu, 17 Sep 2026 22:13:44 +0300
Message-ID: <20260917191356.133242-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121416_659181_61DC9E69 
X-CRM114-Status: UNSURE (   7.56  )
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

i3c_master_getstatus_locked() verifies dest.payload.len against
sizeof(*getstatus) after issuing a GETSTATUS CCC.

This check predates the introduction of dest.payload.actual_len. Since
then, dest.payload.len has held the requested transfer length and
dest.payload.actual_len has held the received length, so the check is
always false and can never detect a short response.

It also predates the addition of generic read CCC response length
validation in i3c_master_send_ccc_cmd_locked(), which now performs the
necessary check before returning success.

Remove the stale check.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 215a22f2c7b6..4296c51a9537 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1777,11 +1777,6 @@ static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != sizeof(*getstatus)) {
-		ret = -EIO;
-		goto out;
-	}
-
 	if (status)
 		*status = be16_to_cpu(getstatus->status);
 out:
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
