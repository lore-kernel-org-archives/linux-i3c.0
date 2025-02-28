Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7127DC282C6
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2025 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sjrovud1Zbz9PFvxR9tcrZplE/CV7nFnxDLlIB4NaBc=; b=N1acuL4hlH6vFg
	I8LcTNVnUDAb3xd7Fcwi7ve0X38hklixFB/eWrE1o9O+zusk3x4t4GIRY5ZbSyNrGb2IIGltL2sNv
	jv0BEA/k/lMKCd/fG7hfuYCXtjBCrqlXGbhwHWoIN+2rydLYuUC6WexsrbnV/K5IQtq4baN2eB6jZ
	7SkC3LCp03rS7w+NEWmCnWofj7rpsqGd0kXSV8fvcAPMHV4aA17nuu+duJ6EHsXTpF/XtNBWY+IJ1
	UdY0HIceoAyUhR7WVH86V3H+RW7AlYYP7aSP3jlAWBX4RjliACS53P+Sg8S6q0AAtRHsu40xqMGos
	aQ1kW7dga76ZyLFdUgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Xy-0000000BIoJ-0xHO;
	Fri, 28 Feb 2025 14:41:02 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Bp-0000000BEB0-3ZaA
	for linux-i3c@lists.infradead.org;
	Fri, 28 Feb 2025 14:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740752290; x=1772288290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PR9x/EnXUCNH4rosATTLiFNtLG+fgATAlLH3DW7HcWw=;
  b=Ra0FhrYtcvIQACsYbUf0eBmKvtlSaeFEwOoYfwNAOy3JOp8MngQASTNX
   l3kRdPM01HQYS1YDR+q5XJr5FzaPqpRy9yy5bYzL9EGEuRp6u3qrYPf/4
   VMbS+qVhE49XWylaAmpNpzZizjOfv1+FkFWXx/gOWn+gAdDVtlVP+cMZm
   TRJuOPm3C4dpAj31fzVbKTCY+1eIa0g1IG0haB+snhLwBIMWs/Jfz+FWD
   wpFQbt6PUpfttVrx+yFvpYmTk+QfYO4MM0Ih1n82aD48oqFnNJWPAkesY
   Yi8JL453iQ+n7PIpHr2vGgTxi1K5QVPc9MEp7pBmLs3/cYBTthfILg5HF
   Q==;
X-CSE-ConnectionGUID: dQ0tJi2aTuC5WdQvcOwm7g==
X-CSE-MsgGUID: wtCqoxvpSPK6WU5dCI5Pwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45600737"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="45600737"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 06:18:08 -0800
X-CSE-ConnectionGUID: hHEXsk/CTk6s0Aj8/14EYQ==
X-CSE-MsgGUID: XlaBCLWPSz2SRlBdvuWklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154517440"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.59])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 06:18:06 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/4] i3c: mipi-i3c-hci: Fix handling status of i3c_hci_irq_handler()
Date: Fri, 28 Feb 2025 16:18:00 +0200
Message-ID: <20250228141802.1344453-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_061809_899102_69855647 
X-CRM114-Status: GOOD (  11.27  )
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

Return IRQ_HANDLED from the i3c_hci_irq_handler() only if some
INTR_STATUS bit was set or if DMA/PIO handler handled it.

Currently it returns IRQ_HANDLED in case INTR_STATUS is zero and IO
handler returns false. Which could be the case if interrupt comes from
other device or is spurious.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e139d7e4d252..e5593b6e897e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -594,6 +594,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 
 	if (val) {
 		reg_write(INTR_STATUS, val);
+		result = IRQ_HANDLED;
 	}
 
 	if (val & INTR_HC_RESET_CANCEL) {
@@ -605,12 +606,11 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 		val &= ~INTR_HC_INTERNAL_ERR;
 	}
 
-	hci->io->irq_handler(hci);
+	if (hci->io->irq_handler(hci))
+		result = IRQ_HANDLED;
 
 	if (val)
 		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
-	else
-		result = IRQ_HANDLED;
 
 	return result;
 }
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
