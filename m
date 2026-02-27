Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FDEFEFB56
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FfGPZpGpLuL02BNncwxZrw3ZU4AIky4q4+nz8MjR/qM=; b=cRvBQ66N76Y6Nt
	bsQdkJwaLCyHSwihy2p+Mk3n3U+1uzs11USiFniLxIDFNOpkbEujVHsOf+HEUtw0gzZ9NVKLaEHBu
	+lN+DiDcIwVulaP6xp/wzHuqCbhDtc73wnrJUyFhigXYLKKZR4RVZWaxAGsscCdX4IbbZ+vzgdBpD
	GBtZEBQaZKlbaJglGAQ9iG3LjQFtpfjZrwlPr8AL1OdyWpwqhyNkzmu3AaAkMqG2L7Tk5MrQ8fMb9
	WBrWqqrYD9B4MGRIabklQo6UjKSu5auuW+JBg9f2li3/JLIvDKkym4X6kzAmxTRz9QvnfzJT/vcDf
	PQiQuJrV38BLhS+xptzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZj-00000008TUT-06VO;
	Fri, 27 Feb 2026 14:12:15 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyZe-00000008TRP-1J8x
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 14:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201530; x=1803737530;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gP3I0b5UAOiFJI1p1+9xXvt3Iwzb3QZ9tG+c4Ad6Y54=;
  b=cg05ZPrZ1xfkm37dc3PNzvknrJpJwMdgj5OWdwtI/IMoUVLYdETZoTuU
   pLHkBEG8RO7cOk/q3Uufrx0orp+5b2vw670EHSeL8UgjMivmR5kquTAQs
   gcQUFppjbRzeJ7N8g0f8OhKADLKRx9K+n7R2sxzkTPFeFQIQ8+B0xgI+r
   2YWuCiOJqwi9PcxjcYwHKCML+4KSX5YKAfn5xhF2nVZhlQDn3RejGlcxt
   /fXLeGkhkPIoRBKG5fjDf5LtueH6gq3ZRjoP8icMq//SekBG/bdVJAs6M
   F1qdibVRTAj6v3Dao3aJdatcys3RvOTief9g0ljkggn3cB+oAq/9Tmu/c
   w==;
X-CSE-ConnectionGUID: 5GhTU4grQYyjxcNaDpufAQ==
X-CSE-MsgGUID: sLDXc65ARfel87xExZn2Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750002"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98750002"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:00 -0800
X-CSE-ConnectionGUID: dgjNJaY8TdClE66b9KgO2Q==
X-CSE-MsgGUID: O6aYfBLOSEe9DLfW+WYliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="217015530"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.80])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:11:58 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 00/12] i3c: mipi-i3c-hci: Fixes for v7.0
Date: Fri, 27 Feb 2026 16:11:37 +0200
Message-ID: <20260227141149.184980-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Enatecoding: 8bit
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_061210_665101_9B244BBB 
X-CRM114-Status: UNSURE (   7.90  )
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

Here are some fixes to the MIPI I3C HCI driver.  Please consider them
as fixes for v7.0.

They are mostly related to error recovery and a lack of serialization.

There is a minor conflict with the "i3c: mipi-i3c-hci-pci: Enable IBI
while runtime suspended for Intel controllers" patch set.  So I will
re-send that patch set in in due course.


Adrian Hunter (12):
      i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
      i3c: mipi-i3c-hci: Fix Hot-Join NACK
      i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
      i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
      i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and the interrupt handler
      i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
      i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
      i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
      i3c: mipi-i3c-hci: Consolidate common xfer processing logic
      i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
      i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
      i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails

 drivers/i3c/master/mipi-i3c-hci/cmd.h    |   1 +
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c |   8 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |   8 +-
 drivers/i3c/master/mipi-i3c-hci/core.c   | 141 +++++++++++++++++-----------
 drivers/i3c/master/mipi-i3c-hci/dma.c    | 152 +++++++++++++++++--------------
 drivers/i3c/master/mipi-i3c-hci/hci.h    |   3 +
 6 files changed, 185 insertions(+), 128 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
