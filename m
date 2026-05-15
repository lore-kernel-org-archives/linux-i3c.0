Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55679CD4F48
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mcB+q8nDc6wGCFMPtCTDPy/Miagf7EISadB4npSaVU=; b=ym1JyHtW/icsqm
	G/BqC1EaLCX8MSvOp/X/pjFBnawZkbg16Afxtk58v4H2JDyhR6BCGJVv2A+GqK60je04snk0tykDw
	2dFK7OjCFrh9CDBu2m5Y1aEcZRUcp1GhhUKRkCtUEoWnJsgYEILogoCn+hMKMzsqg0W/fQAljz/5y
	67YF7yWo1poB4u+MGeHN2ZXyW3TY0IwdakNXeSQMRRTOWIELRTRYrCJWOH7LGzI5o6jNRnnuwqaCv
	jg9TQW4p7f6iA8HdZOhwlCLu6PeAiFcuN2lDicKT8lV5s2JHdMcm6IaFpk9dBgr/hGyGDBHWleein
	JQOoQpvnHahjqxmB69qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNA-00000008rPQ-0St0;
	Fri, 15 May 2026 16:26:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN7-00000008rJ2-1vyA
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862406; x=1810398406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RXfFB7UJVDGcBk6zbniffn/NJbT+BI67ap0XTvRMXCE=;
  b=ZbWNwyNkzSyq/lIiAq04mVBFGoyTtZWVMO0UqTp7vNHqUieRUacMGw02
   OgaV3s7nF/F3pcK6zNcgVBZTWm3WDRYSP7F9pnLi42/br4KH8NWB9Rk1H
   y9Pmk6U81VJkVsSC3MS8wcoETna+Ud4jTnldPKHnuJkuCn2o7QthVs12D
   hilgnbGpYZkfcvwUE8/GjrKjA2BS4erwRhfDvd+gEzreW2ZOBCrn8uEif
   VR9YjaC1Qf37HtIjcr2LPLFRgdgMt9RFSU0c/0Vj+BfE4oIVk6DvVa1xp
   YjpKunkop33r8OejJ73+bLKJR+405ki9rOcMKec+bnp9njyYQhVmaKCj0
   Q==;
X-CSE-ConnectionGUID: 0AIux90ZQEOaZzMM8g3mAg==
X-CSE-MsgGUID: GeiHzdvXQOOmp1SrRKjt2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785251"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785251"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:46 -0700
X-CSE-ConnectionGUID: dcBzboy5RomFr2iIVMRUxw==
X-CSE-MsgGUID: DpizpCdUTRma0NRsOBln+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857197"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:44 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 06/17] i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
Date: Fri, 15 May 2026 19:26:10 +0300
Message-ID: <20260515162621.57719-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092645_558593_4CE632F5 
X-CRM114-Status: UNSURE (   8.90  )
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

hci_dma_dequeue_xfer() relies on state normally updated by the DMA
interrupt handler.  Ensure that state is current by explicitly invoking
hci_dma_xfer_done() from the dequeue path.

This handles cases where the interrupt handler has not (yet) run.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3 and V4:

	None

Changes in V2:

	Added Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index ad47bb2890d6..de0f17706ac8 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -635,6 +635,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		}
 	}
 
+	hci_dma_xfer_done(hci, rh);
+
 	for (i = 0; i < n; i++) {
 		struct hci_xfer *xfer = xfer_list + i;
 		int idx = xfer->ring_entry;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
