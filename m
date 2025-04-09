Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEBEC369A1
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Apr 2025 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gl1T4D+RluZ1nxpowK6G/msJqU6h6RbWVC1iAT4r8F0=; b=sATFrwHgQGikm3
	6utmJVEeHRD9e0xAe1YHKmkLiEl0Yl3ErwICvzmHmEwDpSC+8rEYAaGHBuaRWdc7idB997tLHN9WR
	hfY9SrH9+rHb83iZY4I0Wj4ET1uvMkWAKHdCrJS4B2sIRHunqYuLUeDvF1CNxNFchiRIQ1+nWdjck
	Ygxq6Nuxg0VtO5XAGdGkjI6cuKRWpTnA5bbXpLKzqlIbaB1DK8ge34DeWFZRMDO9DGpFHqj9Q38ZZ
	NMY7zXhzto9wP5wNi2jjA3AKCgw/ol269LbhHPMsUUx7LhF7x6vU8I2W1JWpJONxYyMpJ4qdNvOP7
	xTV/FI7mtLJc98jQykxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WbG-00000007UwL-29uN;
	Wed, 09 Apr 2025 14:40:22 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W2C-00000007Nuf-3UIh
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 14:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744207448; x=1775743448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W+xfOkQcWzcVnZpeazxjbGMRud1BOVcQ4VoEWbMs3+I=;
  b=DMrIkua0d15yotRVMdoQ8jSwiGcq/G4bzmGaVuD9BtB1s6lZGba2yOtM
   qMFGcVsuMv4dhPEAcy2BnmL/9IjH/THkwDaEwCSEtN3T8UXa6VnBHl/Bd
   KIp1AcA10TZXlNPOOCEg4hbpid2PACgyze+8NX+updKjaBJHi0qCI6FUK
   AreS+U++sl35wrWkaHLhYsgp9IT5OVNbrE//uzSHkqjawnwzKlu12WJrv
   8cEZC50SEigg3whIgzayzUjhlUAq14zdApVbPmANpX4YSSNkL/gUTEnAi
   YnbzcTXHVJBXRBbiuMZ4zY9vONQYO4+aw5FvgEDhnRWb5q1fPfmXz3TCw
   w==;
X-CSE-ConnectionGUID: 9MDDMcNTSaSkDhbwEhVYyQ==
X-CSE-MsgGUID: siZ69b5MTu2iWx/Gk8uoaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49531266"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="49531266"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:04:08 -0700
X-CSE-ConnectionGUID: +57Mjf5MQiKgFqkLTOVdzw==
X-CSE-MsgGUID: 8ERIGNhATFuxzDEbcE5+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129116633"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 07:04:07 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 3/5] i3c: mipi-i3c-hci: Clear INTR_STATUS unconditionally
Date: Wed,  9 Apr 2025 17:03:59 +0300
Message-ID: <20250409140401.299251-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070408_878671_C973F947 
X-CRM114-Status: UNSURE (   8.52  )
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

Status fields in INTR_STATUS register are write 1 to clear so do it
unconditionally and move clearing of them out of an if block.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 780e9db7e21e..4c4100d2d9af 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -590,12 +590,11 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 	u32 val;
 
 	val = reg_read(INTR_STATUS);
+	reg_write(INTR_STATUS, val);
 	DBG("INTR_STATUS = %#x", val);
 
-	if (val) {
-		reg_write(INTR_STATUS, val);
+	if (val)
 		result = IRQ_HANDLED;
-	}
 
 	if (val & INTR_HC_RESET_CANCEL) {
 		DBG("cancelled reset");
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
