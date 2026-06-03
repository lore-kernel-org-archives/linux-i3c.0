Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058C7CD6E69
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NZkEQ9c4nvPwu3J3jjnRGTr41y9QGo4AyrWb7pspho=; b=EuMWmaWsm5orp1
	UPVhRXTHFI/nxhF6aQYamAy2ytXr+tRuEOBcMJnM4JYl8Zw5ZbpereBjn1a7xPbUBME402jjtXqIU
	wwfkkrNJ2aqn7yD4wvYJHib/CAQ4P+FXaqgpzS4NC2zJimfoeEhEF6Oq81oD91Mc8t/W9PpH5LweH
	++PricFQu9QAg/WahFLoLkaG5gftvuGGCTtGPRGzIzpjAdrNjVJMRiU6tiwuBuV7wA2zP0wX5blBH
	AAbgviSpgMStoRdADgUTRqGeBtnOMf04bW4R43c2dQVRDB2RPe2h9vRxCPQGoZFU8G26x11pvdIQQ
	fDEmBzAIZ+gI50MCyW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaJ-0000000EflP-3B7i;
	Wed, 03 Jun 2026 09:08:23 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaH-0000000Effy-3449
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477701; x=1812013701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fjly4b/P+XgttOawOIC4WzsuuSoePATtf8QIEx432q0=;
  b=k2nDYrrJIpxpv7wI8Nr+mnAAPWWvVX6Sr0WNJ4bMxLv4Ak3U/k9qeisd
   PLlw7mu6G+iL3gLfaniJEBS8LG4AWIQFHKY/o2ojq3goTrXRPtJCTV7e4
   lO6r94VffUn2QFhW23T38DFZUJfLtCN7VEKcZLoVGA2PAd5mZ1sqBMMSI
   TFt8h86n3DHlhXepu3zh5AtjW216G0OvQw8KgzYI4X15ftNR9/t48W2od
   C6m+nA/ptYQZzSdclmTyuZnPjUzmFzegz5tMI2rntwJ1y+bKfdTi8imRh
   fupOS253u0pJMzqd65TI7wh/VM3TdoKoBPWr5tUStO9kcHoe86utyAL6B
   g==;
X-CSE-ConnectionGUID: ohkxyjDlQCiOz54SRzfoSQ==
X-CSE-MsgGUID: 9w94UKSwT0Wz+Kmd6uBF5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852618"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:21 -0700
X-CSE-ConnectionGUID: KK9ETWSZTpuyb5BGYY0tGA==
X-CSE-MsgGUID: WClP+1otT0aP9dQXeuW72A==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 06/17] i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
Date: Wed,  3 Jun 2026 12:07:43 +0300
Message-ID: <20260603090754.16252-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020821_784374_44AA00B7 
X-CRM114-Status: UNSURE (   9.08  )
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


Changes in V3, V4 and V5:

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
