Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56510C35FF1
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Mar 2025 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Ooeqi0k8EfkCZ35fndKVoQT3irEh02/S4vE4iZceOM=; b=n5D3S9lw6gS9kN
	VfD6iPh7sUaMIAaCEw8eLlttws5j1Ll1y7TkJ7Eu1v4yEB+ZDN+e46c4WFFcfoqF8HEtX0/Tiu32h
	eSTYBac20vwgoILa0ysfCijo6eeGP8EVTxGDao94X8OWmL8CC2edNHR+EZQLm1qSzKBv4SDUE7Wcp
	1/YyuB7VBRUMY2OjrsDbj3TSnKVBZQw/8plTJFHByY1RqJoBtCOoc0LmwdNW3eA1D9o3EorG+snHd
	4fRLJ4xqwl/Vc+FNLtfkS4NWlTXnfNbjbJi94uZH7uiFXuR/KGLNGaDvp2sqBnQ+cduAwFK7hZHSz
	4VPvdsTWsYHpH5udZUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK7r-00000008EeZ-0FzE;
	Wed, 12 Mar 2025 11:19:51 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzH-00000008DWj-1Kqf
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 11:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777859; x=1773313859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0EdTmmi4bN1yMd6d59q7QN3FwUKRg3xUHN58HKPrc2s=;
  b=kY2rzhI4NQPP4S1Kzhs0NCBYpn7ZuK873Ee6T5Ew3mnzx6FNwk6LkPJw
   H4Atks9lrSQbssIWunWPlp6F7+9qoV/5jhQS5cHM5UUYvJ8Up0TNhllAs
   99OsLFLERYppl78rUEJzlAciEu7uLQIe1uwztyOgbpHX9ptGOBASF57uM
   Mprg0JSnSQfaS7h0ZVj9KUkQK7mVoHCY4BcwXqPVj/aBvrXOfIxo0V9pC
   F29fnGV4D/Qzy+RebGpTK8GlNMZUYp0hKoGzNHsv/dAC82gqpmEsi9bh8
   nZNXTDHcjjNALHB568G8e4HOwW5Z2vVoEaGue/nKtny3a+U0OowdDYTBD
   g==;
X-CSE-ConnectionGUID: vyV+LEYzSqGDQ8uqERtazQ==
X-CSE-MsgGUID: cIiGU8bKTUmB9pvDIcUMuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42983467"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42983467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:10:59 -0700
X-CSE-ConnectionGUID: w+rgUXK4Q6WinkbUtiW/xA==
X-CSE-MsgGUID: a2lAzYLASyuhb7OF0t23hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120310869"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2025 04:10:56 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 4/4] i3c: mipi-i3c-hci: Move unexpected INTR_STATUS print before IO handler
Date: Wed, 12 Mar 2025 13:10:49 +0200
Message-ID: <20250312111049.197855-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
References: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041059_368354_E4D4B567 
X-CRM114-Status: UNSURE (   9.34  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: Added Reviewed-by
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
