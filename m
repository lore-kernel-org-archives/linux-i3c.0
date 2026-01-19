Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50471CCF2D1
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RNmuU5q0PSOBIhc9IPPbgfRwO7s0Ue34JuhD2XOCbW0=; b=jHrJ/lGP7fJ0Hg
	bZYKGq2RgNrmGWAZQYFlkkSt4S7jOkqpAHGBmDbx976PIO928SmwcHacLfn1Jbgv+TIynUnnsXCoq
	LexsPiIoMQ4HMGQWu4N5TMBrkF5dNuYVwOi8qINR0WHEpXNEW2Ya3Bhy5pI54xY6+MKdhvi7CP55n
	D4fbS1jEzL6FkIH0FPqfXpGXqVCRNJhRAr+znS5LGK26u7tNA3Rydd0KsBrIoZ/GSCrKbp8miGKi4
	m9kcBmNhATzlIE9AzmoVydvUGiR9QGzxquAAEt/rTKz9Jaf7Jp6uE8Wy/EZ+MDh2E2WFLOiXEm9BA
	JzVN4zcC6QtT98SKF7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6H-00000001hNh-3fit;
	Mon, 19 Jan 2026 10:03:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm6E-00000001hMc-0Vjf
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 10:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816986; x=1800352986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4lH98vgrpFG2Kj/fNsv1JdYUPBXc4lzgRRgsGiW9LJU=;
  b=DyT9fqxmw+WowGytj+q41V3+/7MIMUr2bUgaBNUIeO6e7NB7V6ptbVD8
   ZPCQXU8dICSUbXzL0hG9MqksPGG2TY4MyTnNLlWbH9GeKgd53iLh2BgYt
   GCpggjKEJUXhWkgqFG5jeNOFxY+bHWYd0usNJ0IGbHnr6sKvlaNOr1LsM
   17XJCDEY0/3Z6bNTvsj2aitksBBJVXJJMjlF8LpWSZvtcoehBjvEkS01Z
   T5rMnXhU1O/duMge4Ln/JBi+rZtatAkJBw31OyhJ6qcJf5QY7PREf5+X9
   pPCeQPX2CCHzMBSCzH9Bm2v0frdUOJgdNGL2x4dAXKe5w5yX5bNc4t01q
   g==;
X-CSE-ConnectionGUID: CL3WQhJcRh6pSOZBDbP94Q==
X-CSE-MsgGUID: dIkPX/TmTbOr8v6Yle7zwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87605285"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87605285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:22 -0800
X-CSE-ConnectionGUID: 9opIUMM1QyqpJdFbqumTXA==
X-CSE-MsgGUID: NHaRx5JZTAWXE77Ux86WEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206179765"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.27])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:02:20 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 0/3] i3c: mipi-i3c-hci-pci: Add System Suspend support
Date: Mon, 19 Jan 2026 12:02:09 +0200
Message-ID: <20260119100212.29607-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020306_199138_DA6A67EF 
X-CRM114-Status: UNSURE (   6.81  )
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
