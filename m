Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E732BC78858
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Sep 2024 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lBVPJk/TojeQulrbd0ElMcbDIDmMQUlOZTLC/D7K7po=; b=gtGZII3uiMK1Of
	oz7akIlV1Hccm0ZAPbDISFwycKUqVsQ3CZXhDQ9UZEm+06byeTl48KTLIBEBvM7vOzfLlT/oVlPMQ
	ov54U1O/MGetpi854LpdOB31x8IBdyrfK3bqct2OZV6k4+gMMqYpl2B+qNRvNirM15MbYM49j8BnO
	ISOru0Hb5Pt443fIuPGW49vJdUy3nTiWbPikFwzNzuv0TuDwhcjQ9ggkSVbrrZknbHxHfPPED5b1W
	j15zZTMy6TxzEJaZuHd1mLliAIHqA+LPPjWRtE5p+0+whHsPvtKphf6Cg/yBySG2qQ5I3aKg4LlyC
	IfpQvAAl5dvL87nJ4aFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sresH-0000000CPXd-0Jdb;
	Fri, 20 Sep 2024 14:44:45 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sresD-0000000CPWP-4As2
	for linux-i3c@lists.infradead.org;
	Fri, 20 Sep 2024 14:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726843482; x=1758379482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OUQlr2bxAVFHqCE8iQt00DOXm1aDmumrr8+31cUT0sI=;
  b=enLOLKpbzW3AN1Jt4JSfq1U7isVC2XCr+wAVE8Hw5Yx3Gsa9zCaSxgVZ
   8UQQuhc2i7eFfRcnfQm5nbxLwfAPesyzjQZFUsvYgZ+/8gUNoNbmXMtQc
   HDSoQE9gTkxsXKcnVkRf3lx2zOTE+3PRrzK4g71kpVQ7W4N5UMoD+xMuJ
   NK/ecTHfGJgXRNUx9wHv/n/47xn/gWLef8IPgKsFIYEGxi/ShH1ZGP1Ku
   AYb1ixKzc9Gee64o1JDOYoyU7viW6/vzTgHIR6FYkw7SZJRQ86g9obkLo
   eZ3zyICSwFg+YGYEut5GxZwobUB9hpLDX5z2fU+DYPRVWJE1oIIdYHNKd
   A==;
X-CSE-ConnectionGUID: O2Ldoe2UR1eihoH6IIonPQ==
X-CSE-MsgGUID: 8eFKmgsuQ0GN3/AJTUI8TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51271249"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="51271249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:44:37 -0700
X-CSE-ConnectionGUID: 18jamvNlSTOF9N3y3MgAEA==
X-CSE-MsgGUID: m+lVgv3sQ560xQKF798ouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70751940"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 07:44:35 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 0/2] i3c: mipi-i3c-hci: DMA interrupt fixes
Date: Fri, 20 Sep 2024 17:44:30 +0300
Message-ID: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_074442_069184_629D93D8 
X-CRM114-Status: UNSURE (   7.87  )
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

Hi

These are targeted for the v6.13 cycle, i.e for the i3c/next branch
after v6.12-rc1 is tagged.

Patch 1/2 is stable looking material but I think it gets visible only
after patch 2/2 on a MIPI I3C HCI v1.0+ compatible HW so in my opinnion
should go through normal development cycle.

AMD folks: You said you have non-functional DMA mode on your HW. Can the
patch 2/2 make it functional or are there some other than interrupt
issues?

Jarkko Nikula (2):
  i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
  i3c: mipi-i3c-hci: Handle interrupts according to current
    specifications

 drivers/i3c/master/mipi-i3c-hci/core.c | 16 +++-------------
 drivers/i3c/master/mipi-i3c-hci/dma.c  | 10 +++-------
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 +-
 drivers/i3c/master/mipi-i3c-hci/pio.c  |  2 +-
 4 files changed, 8 insertions(+), 22 deletions(-)

-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
