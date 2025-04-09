Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A184C36002
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Apr 2025 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2J+030zseAlpm9X9dDycZ4RjR7qebfOI4jARzh63jew=; b=uHzxaO7uu7/5mq
	phCy28aeeV8DoOroiAVStjYVE1IwyWc4/HVegcKfmTjot7scoJJ2ky5e28PW9B6KKKBBvtWKUfPTA
	fGQwUTXrYphWxUjbEAVSBm4xdvZAHpSKAtwAuhPyYsKKXx9+u5TpXoQ0hPP+pQ5bvUYlybp/yE7uX
	ZAAijo8OOl/U+55qOA1ShoUP3weMy4GUdcesZ+LF6qndm9HV1uiVTwMYCWdEroHNf5J2Cfz0M1JYV
	qphQblwJUdOo0MEgOEFkkz6qcpD9oPbo5ceMwG18NYdpeab6ouxM7isQBvYU8YPJBeZ53Lk6mog6V
	aVpSekR3z+RVzv61idgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WbF-00000007UvO-3pGM;
	Wed, 09 Apr 2025 14:40:21 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W2C-00000007Ntw-0FeV
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 14:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744207448; x=1775743448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1gXFLClhhhN5Y+3liMFHfr4/vFDAOfwje/5m552dw+I=;
  b=EJVQ82nnvtG+KI15wyxlW0kIhxMvLaKCPH1q8olnC1QpCDAs55Kbjh8y
   qrC8hKNzdG1gBsXOf1VN4zO9LHHrbmZwWQcxftlXLw/HF4BBwC6vpj42E
   IPpHe7mP+oDcqwdU5JgS6eBVP3tM8D4mUzwGWm/pgjpKEUq8rtvc+BKfa
   QyyjMAEAKVfT3C0AmXz0iHeWmb7gWMFLUFYN62NtWPAU5RcptkYLn8TKQ
   1cYyP/tH1D9JiVz1gKCEJfQfeacK8j+AwvXqLAEkxqqhCCV0KftFAI0LN
   V6ed5PsSY3ovPiyf1DKtMNLr6O0hbZJ2TRnLa/1qnBUkomFVCeC9jRFX+
   A==;
X-CSE-ConnectionGUID: uhob11JGQHeKiWFtJnajGw==
X-CSE-MsgGUID: 6Ep47vraQfOUOhQdPlW7hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49531254"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="49531254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:04:05 -0700
X-CSE-ConnectionGUID: Fcl2v5+lSo6hzTAI5NC5vA==
X-CSE-MsgGUID: b0Nrh4euS+SlCWMJtTu6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129116625"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 07:04:04 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 1/5] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS bit updates
Date: Wed,  9 Apr 2025 17:03:57 +0300
Message-ID: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070408_106741_292DB542 
X-CRM114-Status: GOOD (  10.71  )
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

Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
current driver code and not needed in DMA transfers.

PIO transfers with v0.5 would require changes to both
core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.

For these reasons don't enable signal updates from INTR_STATUS bits 9:0.

It allow to get rid of "unexpected INTR_STATUS" error messages on old
v0.5 IP version and is a no-op for later versions starting from v0.8.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v3: Changed the last commit log sentence and clarified more the comment
about INTR_STATUS_ENABLE signal updates according to Frank Li's suggestion.
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a71226d7ca59..ba7aa6bbcec5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -699,9 +699,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
 	if (ret)
 		return -ENXIO;
 
-	/* Disable all interrupts and allow all signal updates */
+	/* Disable all interrupts */
 	reg_write(INTR_SIGNAL_ENABLE, 0x0);
-	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+	/*
+	 * Only allow bit 31:10 signal updates because
+	 * Bit 0:9 are reserved in IP version >= 0.8
+	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
+	 */
+	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
 
 	/* Make sure our data ordering fits the host's */
 	regval = reg_read(HC_CONTROL);
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
