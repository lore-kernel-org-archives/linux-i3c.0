Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E93C4167B
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Nov 2023 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crDtehrPsNA8MR9EM8jYfjsIjVQVXkASUh9pUJID4aU=; b=gppsdNTu3Ot6NU
	1E1FPsqvWVfvrsq879EXR/wguPRcZj/SspEQJBiJzhu5iVt5Xmr9z9zCyezcVa5BBrgrrtrXCrg3E
	zsYYO+JXtDs0zNTBn0BfyoiQarZpVe3vQceTR1Yg9JNPJ25iPNyCDUZqje8DJP6PaxKQ/OPri05qK
	A/D8/C3bWPwABPzrcIYpN5W9XQpg1YdBBg5Z2j2JAepBVkWXU0NrfRrTkP0NZ0hh7mCHKBMbMMvBj
	H5eXeLOxsFJBdT0lH0GnA20FDM9SIbewgZLQtel1nab2K5agTkMxa5U1LNrPhIizo2StFgrfiV4t8
	R5DEqYT9z7QDrpt6envA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Eu-006Oun-24;
	Thu, 09 Nov 2023 13:38:32 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r15Eq-006OsB-0H
	for linux-i3c@lists.infradead.org;
	Thu, 09 Nov 2023 13:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537108; x=1731073108;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yLKXCxfTF0pVkUoiJ32+WtlUC/LEhoIGbAj/C06sA/A=;
  b=GVHt8UaUWCv+6hLFbVSoU0AQzBI5Vq38agtkVVxBnRWwYvWIkmL1lzjm
   AlXKToQ/phW4UepzP4n9MbGQIzq25QrtitQ1OX8N8BoyF2/rFwGx9+Ccp
   FGHisc67vus+OMDuEaIuGjlxOJepUujGBBgD2mLk97/6oQVaqSB5Xucvd
   aGEJpIOYQqLJEqcyOdrTPFbjgJhQAQGmU1okhl9VqO90amlR1JWTqpWv9
   AIfokiWJ875EsSD2s7w75e30MSUiqnt46/pVooyovNfCwsLcy5hkr37pH
   O9vNrZsVrWRr00U39wF+f5Bh9Iri6bHpF5LS0rLSIjBl2Lg6KywS5VJY2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2949348"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2949348"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:38:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="907127726"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="907127726"
Received: from display-mtlp-1.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 05:38:20 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 0/4] i3c: mipi-i3c-hci: Functional update
Date: Thu,  9 Nov 2023 15:37:04 +0200
Message-ID: <20231109133708.653950-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_053828_166499_D64F5CF8 
X-CRM114-Status: GOOD (  10.61  )
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

These are v6.8-rc1 material and not for current cycle.

With these and handful of local patches [1] I'm able probe this driver
successfully with an I3C device on the bus and without.

Also able to communicate with I3C and I2C device from their corresponding
device drivers. I'm using in my test setup an LSM6DSO sensor (forced to
I3C mode) and at24c02 I2C EEPROM instantiated from userspace.

Patches are from top of commit 9fd00df05e81 ("i3c: master: handle IBIs
in order they came").

1. Glue code and minor hacks for early MIPI I3C HCI version compatible
   controller on our development HW.

Jarkko Nikula (4):
  i3c: mipi-i3c-hci: Report NACK response from CCC command to core
  i3c: mipi-i3c-hci: Do not overallocate transfers in hci_cmd_v1_daa()
  i3c: mipi-i3c-hci: Handle I3C address header error in hci_cmd_v1_daa()
  i3c: mipi-i3c-hci: Add DMA bounce buffer for private transfers

 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |  7 ++--
 drivers/i3c/master/mipi-i3c-hci/core.c   | 49 +++++++++++++++++++++++-
 drivers/i3c/master/mipi-i3c-hci/dma.c    |  4 +-
 drivers/i3c/master/mipi-i3c-hci/hci.h    |  1 +
 4 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.42.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
