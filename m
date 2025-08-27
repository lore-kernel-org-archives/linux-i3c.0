Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FE4CA0EFF
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+tjF/NMUfkho0+CX0acJYbRqOBb8j6WfqsyWvsmV0mA=; b=gRNojo4zp+rH9c
	PaitZ00B9Uvt7mqGpscNYwyUMnvYZmIW20YFuCHHdA3gVr0SxvlwloWLLkAq4RWzZH4VwYUQuPkn2
	dTbXllI6BxMYrGGYYDY/CsmQM02mW6khCiCOmlekwoe1YD45bsCjTssEdtW0xVaCoNKxg367UE9ve
	HvSetcWxseJ3p3i2KGgVJntP9jO3Jm5CyNIV9FGCurdb1miyWPP1Dse9N/UZIHqlDyCCDNanZOEo/
	Ev2JTlZ/1mKw/b19yHbqDQUhc48YWmUK/jIJ8EJu1/hkBaq7MhNkXPxIjDM3AsDJnf2Hh47D5rKIR
	Xg1RzmW8eObRUFFUVZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE2Y-0000000FDOy-2E7z;
	Wed, 27 Aug 2025 11:10:06 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDQ0-0000000F4cs-2ksS
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 10:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756290616; x=1787826616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qo9VhK3yCGU3WHf1aBwJheFJxi05D07wTlLO3CAluJA=;
  b=B85hEuy4IOtXX0cMkcvgg9siKL7Xb0hb2nL3cRCwwPO9h51186DTNWu5
   6cV+SBGpn/8+fwih50mCRtsK5zEMwB5LL2K0HbdjfkeVj49TDNa7UuT0U
   1baloZ6dFBG+PjVtG1Yz9hHKfvRIpeaax60kYsE3BrSCM1YG9zrkiw8qA
   iAQvRHw554UL+qEf1gNqAhAJTq7BDPE0NYffBK7AxKIUBLXk4QDEjHqWR
   o5xlNk1zt4NJ/twDUnvF9Z8v8jj6lS0CJej1IOoM+mMisoeBIMzoHPEzA
   KQhN9z3ChIpPSr+wKmpwscsikPN42fyBy+KSRYsidJF4Jf6hafMs/V0ij
   Q==;
X-CSE-ConnectionGUID: 0/UAueNRSbO2N8qJMK7inQ==
X-CSE-MsgGUID: 7dHhjsO6RE+QJQM2q5eWgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57740988"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57740988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:30:14 -0700
X-CSE-ConnectionGUID: 5bLsbx8yTHqivgBOyQhrSQ==
X-CSE-MsgGUID: fqSp7SaSSTiqWd3TlhtEaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200761496"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.51])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 03:30:12 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 0/5] i3c: mipi-i3c-hci: Convert DBG() prints to dev_dbg()
Date: Wed, 27 Aug 2025 13:30:04 +0300
Message-ID: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_033016_735529_18E59A7F 
X-CRM114-Status: UNSURE (   5.00  )
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

A recent error report and reporter's difficulties to enable interrupt
status prints motivated me to (finally) convert all local DBG() prints
to dev_dbg().

Jarkko Nikula (5):
  i3c: mipi-i3c-hci: Change interrupt status prints to dev_dbg()
  i3c: mipi-i3c-hci: Remove nonexistent ring interrupt
  i3c: mipi-i3c-hci: Uniform ring number printouts
  i3c: mipi-i3c-hci: Remove function enter DBG() printouts
  i3c: mipi-i3c-hci: Convert remaining DBG() prints to dev_dbg()

 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   |  9 ++-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   |  7 ++-
 drivers/i3c/master/mipi-i3c-hci/core.c     | 34 +++-------
 drivers/i3c/master/mipi-i3c-hci/dma.c      | 27 ++++----
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 11 ++--
 drivers/i3c/master/mipi-i3c-hci/hci.h      |  3 -
 drivers/i3c/master/mipi-i3c-hci/pio.c      | 73 +++++++++++++---------
 7 files changed, 81 insertions(+), 83 deletions(-)

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
