Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3816CC982CA
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w//eE6PX0l1fYTdMVbcHc+BnXDFbDJhKqa0dtL0zkYk=; b=BXnWzdgBx6ySOC
	VhOTMnTJns10gzZSDDMc/IesecYNSp83n75aLeTVC6SEwD32jcqaQlpR4aIsAJYMBWTCmwNLE4QHu
	X2FpncdjfOJn0yyPp0BqIZHeYc0xYnVYy+fS/jj4qbFBGs97niZfng/IXTaGyY5MPlGmBcmsjrSuf
	9Cqb48EQjST2q0BjAvBsu4IVCBM2Nkby35zTdBFFWDuXZcsxRx1aoGTOF68/v2LXwG5Txx4u0qKKG
	r8AC73uVr4JfX9Brn11nPppfycbiudEpjBRwk02MiIhcowFgOiDy1r2JOGDAbbv5j0A4qArHpQbJR
	naXWntfwZmMk/j/25qrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVL-0000000EKQf-47Mr;
	Fri, 16 Jan 2026 15:12:51 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglVK-0000000EKQ6-0C1W
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 15:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768576369; x=1800112369;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=StLAocH/wZjrklVvW9HxQgRU8lvIlBuQ73Doxg7+vVY=;
  b=ViuR/UDtCAWywV9loGA7tQNSfct9jTdi8goyGhBqweG4kLxgpPCrnkUk
   +uX4h5hhM1q8RpHdnNA4KKnZOOEJpGFj9ZoMhYLWoNWdkw+gY9xhUfvrq
   Xx+YZscDxPzduf3NgPHdxq6A8KGUbWhxvitQEDQ42YzKUcZfr6XJezdK8
   IA2bnB8kKomU45BcdhP5v5J/GbM4hp8PFH6ycTw9UTqs1d7Z2cyJoqwYn
   qCL0EGx61iFqbtgDcmWuxGoBUh5D17wyWuTOI3u720hmojNRL0mp5wR/F
   cDGfGAj9m7K81aGYoHzR1u8Qd44KNnnMam4dmo54CFQSNFQoGOpfd4Dey
   A==;
X-CSE-ConnectionGUID: v4ShD/16TVi1kZU7X0wu5w==
X-CSE-MsgGUID: J4rIC8M0TSyxZgc5vbYfww==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69802805"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69802805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:47 -0800
X-CSE-ConnectionGUID: 18H7+xseQqmtRrxK5Js68Q==
X-CSE-MsgGUID: oxlNAITSQ2GAzU3jBpU4KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="209742986"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 07:12:46 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 0/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Fri, 16 Jan 2026 17:12:34 +0200
Message-ID: <20260116151237.96721-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071250_166685_6E441E6E 
X-CRM114-Status: UNSURE (   6.09  )
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

Here are 3 small patches to add System Suspend support to
mipi-i3c-hci and mipi-i3c-hci-pci.


Adrian Hunter (3):
      i3c: master: Add i3c_master_restore_daa() for post-hibernation address recovery
      i3c: mipi-i3c-hci: Add optional System Suspend support
      i3c: mipi-i3c-hci-pci: Add System Suspend support

 drivers/i3c/master.c                               | 60 ++++++++++++++++------
 drivers/i3c/master/mipi-i3c-hci/core.c             | 53 +++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  7 +++
 include/linux/i3c/master.h                         |  1 +
 4 files changed, 104 insertions(+), 17 deletions(-)
 
 
 Regards
 Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
