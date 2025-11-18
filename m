Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037C1CEE33D
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIAI/N5bJ/driv5bz8uz+tvbroornnxodfkK7ZjaAe8=; b=mPsKCme1mb9Gah
	aZ571Lm1gYOnMQyz4R21izqxpXhb94yQ5UXETn8ibQm8jz39PaQgZ6nrB9n1F8jxRpoFzLGD2OHej
	hpc04LlnDhUOA1qVNi8tR08BJf6R75aa4fSLevbcS+rNqngfYCnOCYPWqnhRH3ScZsKauut7qEMrD
	655357J+Bq60cONFh6qoTv7jYzdwohdN+3y9XrCeQ6vsUlcgX31NhjXFN4hDAsLM33DPVZsRl0tJw
	uwenP5laT1orkc7WDwh2F+YliDtAYKUnpeOnObVdyT8q3YIDTkghbHzMAW7EwKbaHGgGJrdswI/PS
	elaAqJTzFluiKTxddeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOph-00000000m6A-3BYP;
	Tue, 18 Nov 2025 16:45:33 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpd-00000000m1S-35yp
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484330; x=1795020330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=70nrSsDakOBntfyoqSyu1TVCv6x9xdZXHu+J/X3DS6o=;
  b=DMKFO2Qew+VBvxQnwtKuVibiOJzoifFcPK94ycWeJMpzhzH/U7T226jp
   qP5QvvycYrEnExdOX1pFKR64XIqFVuuHiz1msWohwuEV+7xpZFo3ac2HT
   er3kOXeb3Se65eAr89jz8oojFYxEzkWK2h3uEDRxPOQGz7IzbuxlCEyBh
   CxqhpDP35Tl59UJWItxRvZ0wK42FyqrTwX+7rbEsdrjjfX3qLfKEj5eCC
   mKnN3cvTKIDEQpGM3P4YJnjeVrr6s/ZYEypletpykpI8B20x7Bz3zSESx
   imUoyN2e5sQmTM3ADBwfup3SwvNYjeLykthoKja5YQc7di8d8R/k5hIXF
   A==;
X-CSE-ConnectionGUID: JKVbsBdKSASMXhso/8Wc5A==
X-CSE-MsgGUID: 8294xm9eRXKo7rOMMBeuzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510718"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:29 -0800
X-CSE-ConnectionGUID: 9BJFjGyaSKiYy0CETnAIpw==
X-CSE-MsgGUID: 8fuhjwsJQsiciTeXjP876A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221463064"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:28 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 12/12] i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
Date: Tue, 18 Nov 2025 18:44:53 +0200
Message-ID: <20251118164453.55532-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084529_790491_79868FC7 
X-CRM114-Status: UNSURE (   7.34  )
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

Set d3cold_delay to 0 for Intel controllers because a delay is not needed.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 7d7b769e7b5b..fd008a990fde 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -160,6 +160,8 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 
 	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
 
+	hci->pci->d3cold_delay = 0;
+
 	hci->private = host;
 	host->priv = priv;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
