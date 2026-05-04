Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB7FFF885A
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E10FncSI0XLNWmTF+/tT9ave5pkoVlgTbI9VDzswMEs=; b=d1bKmL7IFwy9ew
	6w7IF8VcMO3sSt6QCW2yTi4WsdkvzSEbgD728rl2OST7QyyPzK/IQu+UZc2n0h/BWD+d4X6Z9AQBo
	XhgtlFGKcCdiz7Mifh1HQ64hT6JTcfSasSAIBfX4CWyGkEs8EqNQewBcweUd36Fl6gN+J6v9040wq
	R60Kq/aVWq/MoUv3jjUD7xB7dXlTW1KPGnX962c/r+nlY606ODiApMJE0z8UwN5wE6k/Cg6+OAVY4
	x9OGiQNvDuSQ0EPuLwTiGBdfmSoAewnELv9kfZL1r6QhS1EHBKYuQTAUs+4U3aK0cxu8fjFx4254J
	HCQoyon90MIDohACZnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ2-0000000D3My-2VAA;
	Mon, 04 May 2026 11:34:16 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrZ0-0000000D3HH-0G13
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 11:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777894454; x=1809430454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IzW18hxU6ryJbCtoN9ZyjWymDMsq+JGKhx2UL831gxk=;
  b=EM1gb7gsz4fHNMFrGB5kuITee/CCl6u4IAMsTCleoXF7ktNXemHZ0gNz
   xvX+/0TJSTF+K/45u0WQkmf+IrrApbU8UGlcE523F2th2j/5BFQzCRPq9
   U/GhF4RBBhC8mawq3HVLeu4RwcjzFRNhe5V1OfiF3E9AnqiLqegh0KhiE
   ZcxBSv0MqGt/upUSePNpr9aMyz4YgMRgxLD2xYeQMTUzw9Dz2qXWK7XpB
   Jhk5ugKYavOzYBaIt9AUrEDGjVA0AZHnTgt/P2R73gIoNijswyRYLfKlZ
   2rN08mLFlvH8/m7SzEgmiUghMds5llCw1eI0LxGa6j88zLCh7MhkLiSFh
   A==;
X-CSE-ConnectionGUID: hdoPwN8vRQCZ2lcAGXtIyw==
X-CSE-MsgGUID: 1pdflFuIT8SyixmbryRv6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81315168"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="81315168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:14 -0700
X-CSE-ConnectionGUID: cye4dEbVQ7iZxk2l5vvWng==
X-CSE-MsgGUID: +YaKoq6jReKxuoi+Z62SUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240478237"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.92])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 04:34:12 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 06/16] i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
Date: Mon,  4 May 2026 14:33:42 +0300
Message-ID: <20260504113352.38490-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504113352.38490-1-adrian.hunter@intel.com>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_043414_111203_8C9DC890 
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


Changes in V3:

	None

Changes in V2:

	Added Frank's Rev'd-by


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
