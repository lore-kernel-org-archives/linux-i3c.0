Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA691CF6BE5
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWw/9ZrY3n85C7R3dteOy+xz8wPf1YP97kuveWVwhDw=; b=VOQqGqE5gTiZNM
	flch4lTxlP0qFG7E1ekR/PbJDmwn6y4hrAc28lBSh3cRkN0Fn16k8fTYxfg9qS+rCpR69UGq00cBv
	ZIS0TTj8aKxtjhQobj+5VtoyyUwXNcGUO3Q8MChS783r48kwYoxOnQzk4+bonyI5VGFX5pI/bzo7I
	BhSUZD48JROkiPwWGWK1wGT7KH4RZkVZqM03rbFy/gcLVOHG0UxDYBOKiiyHvEWsClBeq7OelVgpu
	Er6yE6z8FyQCLnAySMgai19HN2Gyo0rleZ4geVvz/LNuU/nYAocSUXVEdPr/GB9EdEuds/pZYoP83
	//rJDHArpiMAid1Pi9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2d-0000000GDL3-2x4P;
	Thu, 08 Jan 2026 08:06:47 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2V-0000000GDGR-0pkK
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859599; x=1799395599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5cZDLiU9OVv0V76EU9XzT2iWRfBK8RwxjraqqDjl/sw=;
  b=F1B/ow89vDWqvR79yxZdLmzLqljZf4dTx8KxMZjoOEg/NSE04egLi+pz
   CMSwGI+kRLD2rKx0BXUfsgR094va/EiIO8XgG+DW0hcWc47OKj/A/Kysx
   RTrt8qS0+KT34Jr9wt+OVpLQrsJ3iG4rF1r42Lnwz5ik/pDA6txE2Vb7N
   6UXYBI1jo+shrg45/FDu7hJEBxzPaboNu5DhgxfkNo/pHiusoWbLzQI3p
   BndmNXQ6LzY9boSTllhKYwtD+2Af89cgFuwh10Te7ouDlZdnqt+0auFQg
   RhU89PNrW7+c9shkpq0S4oJNbxgiiuWuFEYJy+yl7Ee32xnnC8ptdIWyK
   A==;
X-CSE-ConnectionGUID: j6fumZBdTrOE4oMKvkl/rQ==
X-CSE-MsgGUID: M24YTumWSTahhOu8EQqHSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792334"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792334"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:39 -0800
X-CSE-ConnectionGUID: RJPWjRbRSq+Uke4ipNRrug==
X-CSE-MsgGUID: dV3Os0w4QdKh49/+RIW8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413619"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:37 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 14/20] i3c: mipi-i3c-hci: Factor out software reset into helper
Date: Thu,  8 Jan 2026 10:05:52 +0200
Message-ID: <20260108080558.21767-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_000639_253446_8A966EAD 
X-CRM114-Status: GOOD (  12.50  )
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

Prepare for future reuse of the reset sequence in other contexts, such as
power management.  Move the software reset logic from i3c_hci_init() into a
dedicated helper function, i3c_hci_software_reset().

Software reset should never fail.  Print an error message if it does.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	Add to the commit message a sentence about additional error message
	when a timeout happens


 drivers/i3c/master/mipi-i3c-hci/core.c | 41 ++++++++++++++++++--------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index c4b249fde764..3b0609cb7da7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -585,6 +585,34 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	return result;
 }
 
+static int i3c_hci_software_reset(struct i3c_hci *hci)
+{
+	u32 regval;
+	int ret;
+
+	/*
+	 * SOFT_RST must be clear before we write to it.
+	 * Then we must wait until it clears again.
+	 */
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(&hci->master.dev, "%s: Software reset stuck\n", __func__);
+		return ret;
+	}
+
+	reg_write(RESET_CONTROL, SOFT_RST);
+
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(&hci->master.dev, "%s: Software reset failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int i3c_hci_init(struct i3c_hci *hci)
 {
 	bool size_in_dwords, mode_selector;
@@ -654,18 +682,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (ret)
 		return ret;
 
-	/*
-	 * Now let's reset the hardware.
-	 * SOFT_RST must be clear before we write to it.
-	 * Then we must wait until it clears again.
-	 */
-	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
-				 !(regval & SOFT_RST), 1, 10000);
-	if (ret)
-		return -ENXIO;
-	reg_write(RESET_CONTROL, SOFT_RST);
-	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
-				 !(regval & SOFT_RST), 1, 10000);
+	ret = i3c_hci_software_reset(hci);
 	if (ret)
 		return -ENXIO;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
