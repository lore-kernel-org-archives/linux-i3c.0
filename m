Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15015CD4958
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E6upvlCcHs0+OD8nFDwEWLnge/uycOUgUn1jrxUZrIo=; b=3Dx7Q6lDcWTkoU
	tfojYOYIXxIM8Cq1Jn3ezq0ZEzJ73WN+gDoHjItd14wUwAN3fJNhCcly57g5HZjz2I1TzNxuCMN2r
	rvSuW/se6Q5NWbOIK7xQ/jUB86KWI5mjOA5HvKCH+kYEYGQrz3hrouDHqsM5cyQlrdV7TGQoR5qeJ
	X+nWZ7MYMeYIp3uxEX41HJ6QByeyqXu56dfOg4LXVBDgMacOQ18rmCjtMPnTPDAco5bCjmGV46OQU
	HqZahKVuSPRciKZRTpmbOdVVrf77GCk5eyh7Z1E9yfIYhUC40MdQjZyhLF6n14gw39HD4erGv9HSA
	rCu2/9ooR60rPmSgO4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChM-005DoP-1Y;
	Thu, 21 Sep 2023 05:58:00 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChJ-005DnM-28
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275877; x=1726811877;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=to9/GwBcckjYK/Rr9E7NIPQ4jf4XZEfxp1rAKlibfws=;
  b=WiAr9Sgt2BT0Y61uc8FdVKmLVNkJ6kSkXMsvdPe4F3PiIkoV+yw9F5vo
   T9ScVk5yGMKz/JSPf3tq7akSAvpe4u7dzPjSTT4pNSIpei0QxLlALIxIi
   nEmvzwPYnpnkSImYva1KdczgozIWDAdfBDj3p6ioF/zpMasyTp3YInCBq
   WncvBctbOeDqQsh4EUPLggyNGyus4lQwH7ObrcvSkAiGUAU34ORXK2C54
   uUPzhyeLLyWU/INDLP0AR6weu78wNXv9D6AqtKV04Gb3VIxvTiK9X9m8Z
   0W3S1zRrD1wgkTAWPsW3gx0DtZidvh0C9fkvq2AdNYpUdQaMDxKV3onO4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678460"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678460"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771212"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771212"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:57:50 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 00/12] i3c: mipi-i3c-hci: Enabling fixes
Date: Thu, 21 Sep 2023 08:56:52 +0300
Message-Id: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225757_713264_1A8B09A3 
X-CRM114-Status: UNSURE (   8.41  )
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

I've been hacking with an early MIPI I3C HCI version compatible
controller on our development HW. Basically a glue code registering the
"mipi-i3c-hci" platform device with some additional code for logic on top
of MIPI I3C HCI.

This early MIPI I3C HCI version won't be productized and the glue code
won't be released in near future but I believe these patches might
benefit others who may be also enabling the MIPI I3C HCI on their HW.

Patches are on top of v6.6-rc1.

Jarkko Nikula (12):
  i3c: master: Inherit DMA masks and parameters from parent device
  i3c: mipi-i3c-hci: Add MODULE_ALIAS
  i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes
  i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler
  i3c: mipi-i3c-hci: Remove BUG() when Ring Abort request times out
  i3c: mipi-i3c-hci: Set ring start request together with enable
  i3c: mipi-i3c-hci: Fix race between bus cleanup and interrupt
  i3c: mipi-i3c-hci: Set number of SW enabled Ring Bundles earlier
  i3c: mipi-i3c-hci: Do not unmap region not mapped for transfer
  i3c: mipi-i3c-hci: Fix missing xfer->completion in hci_cmd_v1_daa()
  i3c: mipi-i3c-hci: Resume controller explicitly
  i3c: mipi-i3c-hci: Resume controller after aborted transfer

 drivers/i3c/master.c                     |  4 ++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c   | 14 ++++++++------
 drivers/i3c/master/mipi-i3c-hci/dma.c    | 19 ++++++++++++-------
 4 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
