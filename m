Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E47D6CFDE
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crQL9U6f/ybQsUdMiqPJK3WLARqJU2LL8u24dOSFRzk=; b=MBwzn30Tv/Omnc
	Fv3kkZnBRXMeIia9rHQ9TkdUmVT32SMQVW3+4+Zgd2aFhF+b5pzP1FlNOxsumvuk3TCzTZYY23yId
	1LPzf62yM8evQ9po6FtI28slH9ugJshyqGDaTxCtrKGGj/lNdSKmqhVZrCfHEfFQuKuod/nQ/PGZ6
	yveDb9v8aCOfcmn0d+2iJNdzoWSv2a3GM1vCfeoighZxriobmLt1dybU0581O+rcnbrv5AayAIF3J
	+mePBNn+8qyEk76E8iFO5L7b2+RWhZoTEjKsti/WE2hu8Sg0Fkg/c6+BnEFhkb0QDKVEgNfv/5pbu
	G2aBOL/sgBeZZCMNR0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjm-00000008IkX-2JEd;
	Fri, 23 Jan 2026 06:33:42 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAjj-00000008IjK-151I
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 06:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769150019; x=1800686019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oyAiz7g9V1ecskpXnIzb+5FTnAYjbLkVN5/WjEiQ2BA=;
  b=mAlzdVOIV1P2H0Yz3GkY922g10M3+hkT9c0/q/UtE3K4UVXncmjU2AQC
   PtDZHESrJc3u6MvXG9AqSRW0aCadk3ky96IGx5RksH3hIQZtTdopuf9c7
   nM970A3xQiPSgmiJVrMjaWJqPI4TvLbH31yiE62H3BjDWYYCETgBpIILX
   QUBCbOmHu2cD9R19M7MkJLVs+Q0BaprFF6gWvLi5uGzGB8ubeTuYqv24l
   4b0R072WoQBKEfUqdrKK1JEMsyP2txSR/HwyTj7p/ypr5ZXzLpumCmdDL
   vL4493vYJV32Zs85SYey3lTve00KwSV24m1jLax6XL2OonXfVG7wk9IhI
   g==;
X-CSE-ConnectionGUID: nIOBa0CLQg2Vy94EpziOrQ==
X-CSE-MsgGUID: gI5NVKyrR5+ziNOO+73Zpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81514035"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81514035"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:38 -0800
X-CSE-ConnectionGUID: B4BQucCOT9uxZMN4WEZ1Xw==
X-CSE-MsgGUID: 3C9BoGFuRCyFzeaDf8nUWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207210800"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.101])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 22:33:36 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 0/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Fri, 23 Jan 2026 08:33:22 +0200
Message-ID: <20260123063325.8210-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_223339_329553_C479EAED 
X-CRM114-Status: UNSURE (   7.20  )
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

Please note, all patches now have Frank's Rev'd-by.

Please can this to be applied for the next release?


Changes in V4:

    i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
	Add Frank's Rev'd-by

Changes in V3:

    i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
	Rename 'restore' parameter to 'rstdaa'

    i3c: mipi-i3c-hci: Add optional System Suspend support
	Rename 'restore' parameter to 'rstdaa'
	Add Frank's Rev'd-by

    i3c: mipi-i3c-hci-pci: Add System Suspend support
	Add Frank's Rev'd-by

Changes in V2:

    i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
	Helper function is now called i3c_master_do_daa_ext() and takes
	'restore' as an argument.
	Fix new helper function so that RSTDAA is conditional on the
	'restore' parameter.
	Subject and commit message amended accordingly.

    i3c: mipi-i3c-hci: Add optional System Suspend support
	Helper function is now called i3c_master_do_daa_ext() and takes
	'restore' as an argument.
	Commit message amended accordingly.


Here are 3 small patches to add System Suspend support to
mipi-i3c-hci and mipi-i3c-hci-pci.


Adrian Hunter (3):
      i3c: master: Add i3c_master_do_daa_ext() for post-hibernation address recovery
      i3c: mipi-i3c-hci: Add optional System Suspend support
      i3c: mipi-i3c-hci-pci: Add System Suspend support

 drivers/i3c/master.c                               | 49 +++++++++++++++++-----
 drivers/i3c/master/mipi-i3c-hci/core.c             | 49 ++++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  7 ++++
 include/linux/i3c/master.h                         |  1 +
 4 files changed, 95 insertions(+), 11 deletions(-)
 
 Regards
 Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
