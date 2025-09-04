Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED09ACA1013
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QKjonikhs4AgkECM9tPmwHHdMjY0wTnUUqReCjWqj4o=; b=IMpapTdt2JwPj/
	2tQOFMpGHhFPWMnH38PrAmPfozZEE+uqVs41+GMmVto8qJuC155rYpvuWf2mNUcLxLjxqj0P4/LNj
	92DQYQM4ewnJOfZjGVV0kUYbr4vvI5K0CV5RKADXHPz/I5+phsWuDhxv5NIYCLA0C+XKl2sT/T3th
	cgyJGBNJ4r2hlI5xp3cmHAm6T37/IXKq91qTeyag0OzjaK6fd+WOyKWgyTF+3WOphuZqFc6mLtq+f
	pKn6pR3iOLFI2EfPUi/g62coSbSC/jQ/oCw183wxus6VUL6lSqUKgJxI61LR7lbjjhjflDWDRGPOA
	g+RtQ8rx9jCmfs5Bimyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClU-0000000CqsP-2OMG;
	Thu, 04 Sep 2025 16:24:48 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9IO-0000000BdqJ-0qHO
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 12:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756989752; x=1788525752;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uBZmlOc+OPtsEtg+cYneZ2W1b3x5tDqmB5bVem4OYes=;
  b=Bas84GoahJL0JV5WsYmH/+Ax323UAgNaHQPNxBFc/Z24vTE9jA1rOr1J
   s4PYVO1gnjZYc0Ldmf2b7UMOoUJmae+i3r/3goBhhybq9ntQwY7gfVIfH
   UvLxy//0cSwN64JxH025M2/tlIRCZcDQMFcY3/JIAUX0aw90xEZeuklo6
   lVs/aRf01xVPDM9OYiz4BI+ncPTrftpdIjpeBenBSOi0VJjmkyWWsfomo
   gqSEXmD+WQOv2DFrd5Imm9qQvNrS1gaynh0lnOrtQ/A9EuUurYpv39oQc
   5UT2lKAlIKuV6rwVLmA8jb/wtU90TjmXQFeQgoX7dc8A+WH8L/scJlt9l
   w==;
X-CSE-ConnectionGUID: WGBlOYJHSFippIpOKRU5tQ==
X-CSE-MsgGUID: wl+/6zsERf+LeIyMIW4N1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59246524"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59246524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:42:31 -0700
X-CSE-ConnectionGUID: wmhd7yBKTG2lyNRW5ZBqQA==
X-CSE-MsgGUID: 5/m0IPpTSsOMXMkl1tQGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="171770634"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2025 05:42:28 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i3c: Fix default I2C adapter timeout value
Date: Thu,  4 Sep 2025 15:42:26 +0300
Message-ID: <20250904124226.837639-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_054232_294191_15B590F0 
X-CRM114-Status: UNSURE (   9.39  )
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

Commit 3a379bbcea0a ("i3c: Add core I3C infrastructure") set the default
adapter timeout for I2C transfers as 1000 (ms). However that parameter
is defined in jiffies not in milliseconds.

With mipi-i3c-hci driver this wasn't visible until commit c0a90eb55a69
("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers").

Fix this by setting the default timeout as HZ (CONFIG_HZ) not 1000.

Fixes: 1b84691e7870 ("i3c: dw: use adapter timeout value for I2C transfers")
Fixes: be27ed672878 ("i3c: master: cdns: use adapter timeout value for I2C transfers")
Fixes: c0a90eb55a69 ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers")
Fixes: a747e01adad2 ("i3c: master: svc: use adapter timeout value for I2C transfers")
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..67a18e437f83 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2492,7 +2492,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
 
 	/* FIXME: Should we allow i3c masters to override these values? */
-	adap->timeout = 1000;
+	adap->timeout = HZ;
 	adap->retries = 3;
 
 	id = of_alias_get_id(master->dev.of_node, "i2c");
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
