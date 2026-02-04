Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A7E9537B
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Feb 2026 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukm0cehOh4N8jz5x4xRabnQ/7PShkjw02BxNVxDUQbc=; b=ycTyvPHkSS+iMZ
	mG8E987Xh007Ewx+AyhinxDdmcySeuSHobQlYTCGhSDm0/hEQRM84kglg4Tvd5n6zczBe3b3qH4p5
	pyxIwSZYGp7FTmWdnlL1hJOSX9OLrwjYCIL0Eq+WhaqnKcgsrnywiJEMOjJV1EsudUnCEFOfAEze2
	MvyHN+1CVQqNX9IcD9QzkDb9wS1yVo8iQ33Wtz+vpTyLqQ3Sy+zgpo/xNMNexUSpb5fD8wN2aVRr8
	SxSOVL4Ym/wILVXn2COP11NbQukKdPn9r5ado/UJmNyj2U9/SXoheu8FY45K0Ql8Y3RQqs/1j4Ru/
	RlYxq6pKP6RkDm0cUzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnar0-00000008LHz-3u2b;
	Wed, 04 Feb 2026 11:15:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaqy-00000008LH8-0tR2
	for linux-i3c@lists.infradead.org;
	Wed, 04 Feb 2026 11:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203724; x=1801739724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1LR0jNMOWOcTc3yDkCe9j2hyAXae4IGjcC2V8uLYor0=;
  b=NtbYC092AZkkRE+X6Azqvj4zTVw21ChlEbjsCM+duAB2ojH7P4uuC+wY
   mGbCnl3ZGrj9qQ/5JdiaX6pY/QSVem+3cVr/g89N/QAgNKMjd9CdKHJkB
   ti1dueG30FVEAUVYnoKGm0oVMg0Ub+7DhcANafV5bciLgRBKU/rbeHkki
   1a2psq47DSwuxY7uzEcJPyhabgMDPz70zeuM3uIaX6OMW/RKXsd9n35K6
   SjnHE7+gXhbCOITSm02vMv8/+Zgw7Y4kAlB8PSg7252xQDv7XVJNKPrCH
   CjiZitRXK4HCSwClqQoZ4zcQwW9z5/2X1CBPhqdkEwzQA+plSdAW7DDvg
   Q==;
X-CSE-ConnectionGUID: 3mCSBzFoSR+3s8GC9BdCUA==
X-CSE-MsgGUID: 7kdr0y+6RhivR30xYM+v7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70406045"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70406045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:24 -0800
X-CSE-ConnectionGUID: hWsvumg5Tl+nyabMW8g7BA==
X-CSE-MsgGUID: M+wjN3+cT0O6lELowOgrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739274"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.181])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:15:22 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V2 1/6] i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
Date: Wed,  4 Feb 2026 13:15:06 +0200
Message-ID: <20260204111511.78626-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204111511.78626-1-adrian.hunter@intel.com>
References: <20260204111511.78626-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031524_258821_6437E070 
X-CRM114-Status: UNSURE (   6.91  )
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
