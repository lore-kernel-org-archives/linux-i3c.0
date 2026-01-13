Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD2CD29DE0
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4p4+6TrmLzSLSzph5hiCBow9EcUTFcPj7lMit6B7AI=; b=MTSNKYya63IR0N
	pf08dSrY+Td3KGdYTPoSCqeUkBC7FxdOCHCfoDb1vh/TsjJCCecUlrcoLSLNZC/AcDYT2OeQvaxQL
	QYDJJW0nDD5LjQSmJ4DwvV4dHAM5YdEwSJ6+uVFhrr1WNwVPwDEFOHRNY54p8hA8iaP/hhSXOha6G
	Y/+QzgubB7BM1vnd9YR8QPQ5wrEHHXzPqF2iqEMJbOSGYYzUcocbu68x37e0KEL1XeREYwdZl+pTq
	D3mJ6zLZHNbXzKzCys3Xm2Bdi9zCMrlxIZaHEE5MMMSyV88wVtS2LpGAZJaALBk7M9S3uZufG+Nn9
	GRU+hdBfur2FFRKvDKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoh-00000006efi-0DQx;
	Tue, 13 Jan 2026 07:27:51 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYoe-00000006ean-1EgB
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 07:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289269; x=1799825269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sG+ddJbKoaM01U+Y4Bq8HN2zIV86cD7JHFiuUVmLhWs=;
  b=ZAsBZqpodv8fenFt/xsZUQgnE1wo2Vg0dkT6ivEGHbRw/H070NuNbW19
   8QJogT1KaoRQKZMAJkS0okhVXDUrLM0CyE4W005uXDtuh9DB/CvHuwhr3
   9pQtrd5fBesM+uX4vy0cMjSWNghAPnk08S144aojhgK6eu7iAXEpYr+Yk
   5SRWDEeGVm1ptmbQnR7isvESYNOaX2J45V1rlJlBiX9vBCAT0/T9z/8MV
   vnlI8LPOGLIh2Zxu1smqObGcm0pZ6zB2ER1uLM3AIr583R4xuDnrn6liS
   QnBr5BXzPVL767NRN3uQ2wPrzMrjiFBGavM38K2IYsiYqXta2s5iYuxwf
   g==;
X-CSE-ConnectionGUID: kjF6VlPQRKeCI+2J1SRQtQ==
X-CSE-MsgGUID: RhM/OPqIS5iSu0981EUysw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625507"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69625507"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:49 -0800
X-CSE-ConnectionGUID: FUGSx/9XRZSA2H4eBCZKEg==
X-CSE-MsgGUID: gaYLCfPfTAmJvX+B0ing+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235021337"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.167])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:27:47 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 14/21] i3c: mipi-i3c-hci: Factor out software reset into helper
Date: Tue, 13 Jan 2026 09:26:55 +0200
Message-ID: <20260113072702.16268-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113072702.16268-1-adrian.hunter@intel.com>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232748_375912_904F8F0B 
X-CRM114-Status: GOOD (  12.82  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Add Frank's Rev'd-by

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
