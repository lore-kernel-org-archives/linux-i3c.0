Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B3CA0FF7
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLTnimz/sZAXp0BtKSbcL/p4O9USeOvjaftPb6p3z4E=; b=eg9yQn3roQlj8d
	2EJ78u+0b5DATy0VAvbswCzYFPTIvg+XDVTHiVAbaY+EJgdig297XTvNPtpXdtJ8X226XvqZpDDHr
	vuzB2cfatNMoygNJN3+OTzdZUgCwo/e9RNCjBaUS6Sm0MKcIMf0xds7qrNcwQCG5cCDO+CNpppxsm
	i6JqpVF/pW+Nyf37Ku4CrUozdQUWuA2BDLLr0ivJrWR6QkoLc1oq6h4cERgwjhK6+YarvVmNhtpKi
	aUjgGhDZJGXO1nKKx+DCRq0bj77ePW7n2RQwaluLHXraV3GVCvU37ZHNiZj6qOURwAWD6G/XgXepx
	wv3tC4HIYfFwd9aQIgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE2Z-0000000FDQ4-28CX;
	Wed, 27 Aug 2025 11:10:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDQ3-0000000F4fD-08QZ
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 10:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756290619; x=1787826619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=womuvQUg8qEtNVovlgovV7MkuFV6YivhiQq7OBgijWI=;
  b=IEfHwGAfGm0BF+lH3faOkD3AyjpZ10mIDzDdK0QFmMkYhGmxXbTL0dTO
   WqK04ow1DkG0tmiiJVE2EyzWar72Z23T6KNpbP2Pt1H+D/Kz8bBj+oaEy
   3YpYEN9bYX9ObA0k9twp4Y7h59SF74pBJt0Pl41TgU1hFMXSDQg8UFKf5
   jdWD7sryITuhFNBAreFG/d2smKGBM7GIEtnZp6dUm8JS5YvZEqHeZROfZ
   HYYHiKXJ4WwUFFTGq9f9vk/UqInQpEgbqgWvZFdh5diCsSrzAG9Gt5B6C
   HHBAfGAk0CmQDhp/ENxkrY00ShC/DNTH0PfvaXte7C02UedpSNZP1O1Sk
   Q==;
X-CSE-ConnectionGUID: TuJXNYLpQTaZQ1wMxcBgmA==
X-CSE-MsgGUID: 3iITAcQjTFCytNXiktkPSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57741012"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57741012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:30:19 -0700
X-CSE-ConnectionGUID: nUd9zeIBT/mhVSpnk6fzXg==
X-CSE-MsgGUID: 8OuIVaNpTTiJ1hvzea9Xng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200761518"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.51])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 03:30:18 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 3/5] i3c: mipi-i3c-hci: Uniform ring number printouts
Date: Wed, 27 Aug 2025 13:30:07 +0300
Message-ID: <20250827103009.243771-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_033019_079122_AF505D21 
X-CRM114-Status: UNSURE (   7.95  )
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

Use the same "Ring" prefix in all prints that print out the ring number.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 8bc9de189543..3fadacbda582 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -775,7 +775,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 			u32 ring_status;
 
 			dev_notice_ratelimited(&hci->master.dev,
-				"ring %d: Transfer Aborted\n", i);
+				"Ring %d: Transfer Aborted\n", i);
 			mipi_i3c_hci_resume(hci);
 			ring_status = rh_reg_read(RING_STATUS);
 			if (!(ring_status & RING_STATUS_RUNNING) &&
@@ -795,7 +795,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
 		}
 		if (status & INTR_IBI_RING_FULL)
 			dev_err_ratelimited(&hci->master.dev,
-				"ring %d: IBI Ring Full Condition\n", i);
+				"Ring %d: IBI Ring Full Condition\n", i);
 
 		handled = true;
 	}
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
