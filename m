Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D42BCFD376
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ar1Oe/z/tgxuMBWUlP5y9XN7ymcA+ooUY6e1hRdlSwY=; b=HrwNn0aUWImL7R
	Sj3sxYIfazuB1J30opTE877ZQkSKFs+naO/TwR5C7XSvsXkaYRBhQxeQyHJ87rDRzkKuhUhloDi84
	rlIdQwLxx0sRL6+uMtPH672uoEZ8zZve9JuWsGAEEbisove0dlCClJc+P8vzdYParmPtasIWAPjwn
	mHvIhZlz2SQKJGbGJKDE1HGcKCVWQIKe+98r5cMX2Q5dxM8CF4KwoWtLi0cUH87JYMc4ee7+1NnjE
	vMq5r6BYqcekFC1XR9AyVVinWAOTDR/qiG+/VEHELfJDzksz4UzsUFSNLRdFbxx0TwJnScEivfJnG
	DgjWnjis9jWN3EgjjOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAM-000000003c2-3h64;
	Fri, 28 Nov 2025 06:41:14 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAH-000000003XD-3RZT
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312070; x=1795848070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qFsVgnMKEsuDe9JN+8tc4vWjNbF9DNZEkgrXN03e2sU=;
  b=fKesb8sDpeZRTEIyTS9sRU/KsN4oZ9bBtiZRPidC3uSVu7ye9A4Pq/ED
   dqvxSRnqDuq770fKlyDs2zcPOOqMWu82jZLrvivYDbvfI/3NXzQrQnGCq
   FB34yuhtTy/S5SxjQp+S92t5LZU2ROMY/aG0ViwS1FP7g+Y0u2NC5S4cV
   dpqjAMF6EQnFswVcU9DabAjqV4F59xHZQZhe5y9QLAOTAUtKv0e4b1hJ2
   SPM4P3xdlPNcEJjMpUNOje20Y6UjIHw0RhXsikJ7Ec6CqQZ/meyDi6qKY
   maA7fphy+xs8wcBKwJCKf/YG1JbtkovBoltyidYGYE8FmG7OoP9/B6Ffu
   A==;
X-CSE-ConnectionGUID: QGLbIxP1S1eBeXNClcxdLQ==
X-CSE-MsgGUID: WEfQrPlySJiSptYFWK8jZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059968"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059968"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:09 -0800
X-CSE-ConnectionGUID: 4e/Pa4KCRW+vGzANRJVkHg==
X-CSE-MsgGUID: 67ki5su7SUOqtD4VIG6qEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348130"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:08 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 12/12] i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
Date: Fri, 28 Nov 2025 08:40:38 +0200
Message-ID: <20251128064038.55158-13-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224109_980204_FD7093AD 
X-CRM114-Status: UNSURE (   7.11  )
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


Changes in V4 and V5:

	None

Changes in V3:

	Add Frank's Rev'd-by

Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 25c129a856d6..dc8ede0f8ad8 100644
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
