Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E25FC282D0
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2025 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU0qQFsvjNWqvB5wNwN5QVEXAvS/LBHaPTZOGeFazwE=; b=qkEMYt/geBJHrz
	2r4iZsJgr+uErpn0tP2Y01pFXMi6H0BZxiQN4E7baoac0+FnoE+GtOUjYd5YAAToJ42gpZmPpi8PI
	Vi+5CkFYW6xCw0wEjp72hP1DuQXPUuss/nUj89rxm/rH1JB1Vq6kcMyKuFXOV7QkWAmEIEfcuct5j
	ul1Kb0W9yIuXGEpvehzVw9z01AlW4jfekr7erOhy/5j49/8mtAggmdX3y1dDGmXq5wgREB+e7Ynx4
	Iiq2L+U4WoP3eJsAef/BfQHQ87RlhIT8++HGG+6F46UAn7rTbCxkcxAHTWJqb4BSmjcW0bImhOG0Y
	e4h30Rd5NpRVqxLosmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Xy-0000000BIox-3twU;
	Fri, 28 Feb 2025 14:41:02 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Br-0000000BEBr-20mw
	for linux-i3c@lists.infradead.org;
	Fri, 28 Feb 2025 14:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740752292; x=1772288292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mRSyF1KOIUKHVltC1mRdOmWwHWh8hNl1+iPCVfciduQ=;
  b=UgorA0dcH4v/03gFcCWlpTWOkFm+iktr7GoP3Vg24Dw/UeXYDuQ4Jp2z
   BUZE38oUBjjuczANJydsCKzwN6MijSPa1e8gLunba2gF/r9JCWX1jeGWK
   oDRJNhZ4KefFZwgPYUHb0G0gsS7jVX5oW00ThxKFPeAAXQ8tNi0pu20oT
   J/xnBN/sHkwq+Eri6L0Z+xnv11zFJ5Xf0NcYq+ToVRD5pLifuFnG2PO6U
   7LyCkErZMfdUNNTovQvg1vbx/JN9F3WHyD8x2QJ91Gjt4DO52SLOkbjJy
   EXQabTM59Z63JIOz4qA2//ERLvd4H8gHXoc/r95pnuD/wVdMb23gY+jTU
   A==;
X-CSE-ConnectionGUID: n8xkJByjQdSRoSpUBUJdyg==
X-CSE-MsgGUID: cTa53uunS2mHVkgE5PMznA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45600751"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="45600751"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 06:18:11 -0800
X-CSE-ConnectionGUID: KuTfaGjYTW+dhW3yIwUuxA==
X-CSE-MsgGUID: bLOqZxVYSvuVj/Yrntphcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154517451"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.59])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 06:18:10 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 4/4] i3c: mipi-i3c-hci: Move unexpected INTR_STATUS print before IO handler
Date: Fri, 28 Feb 2025 16:18:02 +0200
Message-ID: <20250228141802.1344453-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_061811_526764_56219629 
X-CRM114-Status: UNSURE (   9.26  )
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

Move "unexpected INTR_STATUS" error print before calling the IO handler
as it is more consistent that way. Otherwise it may be confusing if
generic interrupt related prints are mixed with IO handler prints.

Since this error print is more indication of missing code rather than
runtime error downgrade it to dev_warn_once().

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 84c372740020..5c173249c0ac 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -607,12 +607,13 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 		val &= ~INTR_HC_INTERNAL_ERR;
 	}
 
+	if (val)
+		dev_warn_once(&hci->master.dev,
+			      "unexpected INTR_STATUS %#x\n", val);
+
 	if (hci->io->irq_handler(hci))
 		result = IRQ_HANDLED;
 
-	if (val)
-		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
-
 	return result;
 }
 
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
