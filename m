Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB74E98DFF
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Feb 2026 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4kgZ80Er6gtz71xbqyU0qfXrkIkUb0oGc15kJRWMks=; b=hLHt8CZMo3U45J
	pvdg1QGgBxFPg6TTvHbiBsWY71Tbh5dY1CgrP8t4q7xzxfQTVcvmLpHHPZqRP2xuirjBA7BDesEZI
	2w5QCQ+FpOJuj4os8PoUnEcLkSsGIn2cWG9dvtATVSqv3P66DeS8xFWf1Op11ti/Ya/SL0xCvmh3/
	ZsP1yGZHo6I/gXSMh0Kp95wJzO55ZjZw9vG1YVC+oV8YvHfJr3UfFwGuBABiCiXgCylfneFTb3cN+
	DvycDXDc+Tojm7CmMHUGnGMuUSy4zOMLwUiPVyEkCg8bafXo/HrKGWSwK81u/5TAQ8ErT4dW+zKUA
	/nrX+MCz+OsBKRtLcddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7f-0000000HWkv-2V7B;
	Mon, 23 Feb 2026 09:20:59 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS7d-0000000HWk8-3uI9
	for linux-i3c@lists.infradead.org;
	Mon, 23 Feb 2026 09:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771838458; x=1803374458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uv3jpUhmVoyehRTPjsR3joBh7t+FveVb5u2E+JjKH+I=;
  b=IndEJ1AuzTlYLEndHS10Oq8pXQdQx1AnOmaVALSI3NgTTCMWBcH4ROB1
   Wxg/RCBhtNEeXTQadhs5IsnoMuU6HUgpPpPmaBKX9O0xv8+6SfoaFGJxV
   IxHljUYWd4Nwdq1yxzq6B1dgJk7eFrPXGVhtrQuAul84QIDZL4rKuRtPd
   Acdya8EOqB6TFxVKqBAlk2AGIaMBTRqsN/P72a4t5vB74Mu7qAnlxM35B
   eTFBvK1GYDdmkXd2NXCjH7Ioyx04+sLdEtDjejM2JZEtCnzgCokoqojaQ
   Y9nG5JESVeHb0rcPDY+pdDVedC6dLcNJpV10ntts9IL1mdVZ7I3tMPEbl
   g==;
X-CSE-ConnectionGUID: oLBxHA9MRbGA8DcSwWLxOA==
X-CSE-MsgGUID: BMPuLAx2TYCIn+uYh510Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72928685"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72928685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:20:55 -0800
X-CSE-ConnectionGUID: Gr+vAtJfRF6jFyxs+DZYiA==
X-CSE-MsgGUID: UFP61TU/SyOUyuRrPR4Vdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215346051"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.206])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:20:54 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V4 1/5] i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
Date: Mon, 23 Feb 2026 11:20:37 +0200
Message-ID: <20260223092041.104689-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223092041.104689-1-adrian.hunter@intel.com>
References: <20260223092041.104689-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_012057_980758_875C2936 
X-CRM114-Status: UNSURE (   7.04  )
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

Set d3hot_delay to 0 for Intel controllers because a delay is not needed.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3 and V4:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 0f05a15c14c7..bc83caad4197 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -164,6 +164,7 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
 	hci->pci->d3cold_delay = 0;
+	hci->pci->d3hot_delay = 0;
 
 	hci->private = host;
 	host->priv = priv;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
