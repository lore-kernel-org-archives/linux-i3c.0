Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F08FF8D765
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jcz0J9pQy2t+B/FaugRlHi+LD0ZWz16Aqf/Mjh1TPI=; b=hUQJ/5cOUhHPDw
	bm+cISbXKqBvzWLci/Tp5Jdl4amKkvuo4+CP8AJIGY+j1jdLYwqpJR7rItt/dBrjUnK5X3nm9p4yM
	PA9Xbv6YD7JSJR6HUXwDnRUlXzTcXt6F2e4Ml9u0rUAlToeLWD8vwagrPoFE8vxxaf57cfDKTPFBF
	hI97gHNT5t+bcW/XlVuqb2n6a69TTVFif1T04vsCSNPKgUBWcD/I34MyApVgHtjoDHbogZO9VjJN6
	WJEwDoiq8BjQckEyuXhlYQKjt6l8FB21LQ8fiCYBYOArimdViIF4oC3MWC0119nHydEEMzTZeas5T
	VDUO2EFJouw5J6b09cMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQy2-00000002jgu-0cwo;
	Thu, 16 Apr 2026 17:57:30 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxz-00000002jej-2J5E
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362247; x=1807898247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qa8AHq7Ya99BlLdczjbrUOyOvqB673gXOaxq9lcoP6g=;
  b=T9ZPW8b77u1Zl0JeolePcNWNK0ToqVJnmgjo94/kTOPlQmOSmR649gNF
   KeIXjKsiLMOCTXJlNtF8kUZdzRH9Qr8T7ltrRjNrNVppgccs576SIlljB
   MPgPZ9GSn1y2maKRfstmr6ufcRwnhVvBpIm30bhbJOom27GRpSy2nPdX2
   4Fk0sX9t3BKdpeB+MJ7MavYv35k0povf1oA+KYYaTqoTHJ/r1aWI2SbYh
   Zxco3OJ3dMwOfKeoMyRmkFo3TklLdBuDmBukn0TqUh/ableWBG2yGxt1L
   aho41Fsd5cPCWxhGmcJ02gSfBwiJGvtE07yDp6PMYGTZoeWuQ3ENTaXm5
   A==;
X-CSE-ConnectionGUID: p2o7lJR3RRqoIWW6kepfow==
X-CSE-MsgGUID: 0K4BibrCTye4H6+pqJAlxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778383"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:27 -0700
X-CSE-ConnectionGUID: Yi4MEbDQR4SNhtoSkURwwA==
X-CSE-MsgGUID: yxdCc6PrQiGnu80o9xX99g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784549"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:26 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
Date: Thu, 16 Apr 2026 20:56:54 +0300
Message-ID: <20260416175704.41217-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105727_635102_03B14D4D 
X-CRM114-Status: UNSURE (   9.02  )
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
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index c9852b85d6b0..28e4d38f55d3 100644
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
