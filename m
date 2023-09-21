Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA92CD4958
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fi2UiRRdVhPBGgkdVrHjhYwlB9r5p8H6j8aOaqsMRy4=; b=TuSByGj6B4Ue90
	TZz11RW6nWEo/GGyMPOIK+jRrwguamf2EOgobYdm90+1sN74NGS+5pl+drysFe4lMRqq+4fG/ivZO
	4LSBqrUig3JfJD1bJjKgM//ss7em+BZUaIITnkcRWQA7KGI44Lmf3zRltCfrY5AMjPBH09cAyS92X
	WYIlbEp0SGmxfZFx4KtBxH16qMCdBkG5N/qnsFwUy4t4Y0z7H8DnoPeeSgMHLo3EDAJrfsQmdl350
	BIafd0b3HHCzx91IxBIPwQ7aMN+7G085r2dvRlPpXl+8cHPBwldztN1AXOL5t9nNviz6N3kRJVOy5
	EhxaVzEhnereGnVPu7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCha-005Dwz-0H;
	Thu, 21 Sep 2023 05:58:14 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChW-005DrZ-0T
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275890; x=1726811890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U5inNHpnc+RZt+M0IJnqIW8hyk2cqJ+ZZxi5amaaubw=;
  b=VrI5hDsrx/bINAGgYwNTvVXKDnx3h6ekzDigJuiBS759N0TsL0y7fVyb
   IaPYDHV8gEqAOxAZRciPNrjhhw/RPaAijZyOsl4ANE8IP/FpTxJAS3Hyq
   Q7Ux7U8x2VsVHisd9uSwp6WXX5YyqhNCQ0a21mZqMPX0gnjHC+L8bB4km
   KhsPCgnrPW2cJHkxJSnpfCBf1WXLJbCYV0kymR3ESzzXv8qenx1Gdfgk2
   QUo9gW51UHvKkWjeWH31jjsYUjOHk4ebXEHA3FDw3pjPegREFURflnU3+
   UXR1aHZdJcDIlmvnmI79sRoNA7XgpvINmV90HacuLD131/awtI81G96jr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678498"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678498"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771271"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771271"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:58:02 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 07/12] i3c: mipi-i3c-hci: Fix race between bus cleanup and interrupt
Date: Thu, 21 Sep 2023 08:56:59 +0300
Message-Id: <20230921055704.1087277-8-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225810_204476_31847FBA 
X-CRM114-Status: GOOD (  10.06  )
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

If there is a transfer error during i3c_master_bus_init() and code goes
doing the bus cleanup in i3c_hci_bus_cleanup() there is possibility that
i3c_hci_irq_handler() is running in parallel with hci->io->cleanup()
which can be racy.

Prevent this by waiting there is no pending interrupt on other CPU
before doing the IO cleanup.

This was observed with ring headers where first transfer failed and
sometimes transfer error or ring transfer abort interrupt was coming
simultaneously with the bus cleanup path.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 76a3e6bb3665..d7fe8e62820a 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -161,10 +161,12 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
+	struct platform_device *pdev = to_platform_device(m->dev.parent);
 
 	DBG("");
 
 	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	synchronize_irq(platform_get_irq(pdev, 0));
 	hci->io->cleanup(hci);
 	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
 		mipi_i3c_hci_dat_v1.cleanup(hci);
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
