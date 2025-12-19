Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F367D78783
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFZjORUD9bgg80Fnkl0eDTUoC6xrUHE92T2j3OWvasM=; b=HjmxNZp+wbnNYZ
	l9cte/PCYz/hn9QGZK7qsOPkNVxhiRWRO7IlfA8vlJTCzZ6BDGPnNldKPJTWXCioMkorkFF0x+GHm
	bikoaVlUy7cYgoc1a40GzdwAC1lNe1g+N3csfvx5JVAOpJgzR6XQjkoCmyR/LRFMX49kGvmWsQlNw
	FT+PCwvhnP3mT10kbC5+uGCrzMg/Zs7jKoo9zq4Ay0P4GJDGWvoMZ4ZAakwDBtIz0qPhuDIbDICE9
	/7BHtbbNLo5AqoBsPY4p+LCm7bN4UGWUO43bGS2prslVADEYscp49DTg6yQ2WRZngN4hAqgNfWSVS
	MmDvOakiY/2hZL+iIESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkM-0000000ARet-01Ul;
	Fri, 19 Dec 2025 14:46:22 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkJ-0000000ARd6-2edd
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155580; x=1797691580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ils5PVT4Fl1qkNmSmd1FXBGWt8qyqTDvq2Fzphqht4=;
  b=R9Arg7h/B9s4nEgTdvJOlQIKSgp8Zd7F1bZxHSDdeSJ6pQtNhiKFiS59
   RI3oCxSv+P0RpZylve59Mect+B3ppe66pzRW+f3PhLYNEjkNb9P7O83pc
   e2Z5PrsutPqXjm5cZ4V2N1hTBToapsEexzi0TevItEdCm+QG3iCzh4mpF
   VnQlzqv5DPGC0R5ySfE+JoXPPjatL0sd8sif1eJa2z2VnW4DM5WDaX2l0
   F+oF/75ReRb7eFbjt6rLdqIKYs4cYQ+uK733h1avEp3lN11ngcF08rwEs
   z805zD1I2FpGtHScaqMsS+rKT8qbyBin19028QsVWNp3F5Fq8O9j2SxyK
   A==;
X-CSE-ConnectionGUID: AHb3a26OQ/u+t2ljYmvA+g==
X-CSE-MsgGUID: o7LfbccTT7Ovqf0kgfl0QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588990"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:19 -0800
X-CSE-ConnectionGUID: 9D+AVCLnQvmkjC1cJFABgQ==
X-CSE-MsgGUID: gG/9JT5FTumkFEifKopBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564088"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:17 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 14/17] i3c: mipi-i3c-hci: Factor out software reset into helper
Date: Fri, 19 Dec 2025 16:45:31 +0200
Message-ID: <20251219144534.84391-15-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064620_538563_437EE238 
X-CRM114-Status: GOOD (  11.29  )
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

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
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
