Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D605F01812
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Mar 2026 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuMMKsto+vOGUCBiy2qBzocpkvdB3rwPgoJWcBuagQ0=; b=a50z4ZDRnQr3ye
	DXNZn+1MfFOzojerDkU6ksVhQY/zytUVvKsh76UhWHTQ9v2qcSw5s4bx8cVLvxPIwC9QDUoO9pZnP
	H2zYk279i0SIgwLgPv2aeXNWofIKo7X5dIfd/Q6vgWHL5MwzO6llK1tVBFvnNQQTsdh8l5osYU97U
	DyNmAWXCGvl2QxkuYxuk3WCVSzMnFBLhWf6nCE+mXRBW2FEe/X8qlFdho3hTN4kVj3zpHGR2Y/WnY
	FqIBTtxbhpQL0dTq68cNJjkjapJotar0XGdeGmxXW/2Swftk0oZxa1NSfmUGB+636PlOdgt2RQLC8
	qTXAWThQxYDtmqVN17sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQwa-00000003J4v-3K5v;
	Fri, 06 Mar 2026 08:54:00 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQwW-00000003J3d-4B5q
	for linux-i3c@lists.infradead.org;
	Fri, 06 Mar 2026 08:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772787237; x=1804323237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oy/99Kw5MyaWysrU7BhOImMVNi2DTO3ASdtXxX9OzTE=;
  b=S5gPw5FO28xJBR4wf0MZk5T1CToPB3NkMHBQv8Ds39fH5lRyGdFwI9ZB
   qQuyE4x7l+1KRQVJwQAyeIQAg896W/Q0PPK+JdagUaQy+2Atef9YOpJDZ
   /tBWjBPqty23SM8RwiMQ6sBC9jw95+DylurR7ItUNSUoCbwQc+HkpPSEo
   HtlZ3HkuZVcXrvX8WGIoCHd7jTaLusoodw1YLErj2g6F5hxyRrs2LXqPk
   qj0ULPEYd26u1dCdcscEIR7Uxb35is+Uec3M1z9kKuNAZWi2gFXqUcp93
   /emmaQEBBNqy+aXVvP/xPXRu9KAoTs8OoMSfXPPLh3+lYKfoFQK0YmX2v
   w==;
X-CSE-ConnectionGUID: Q1ZxmdAKTZ+uXvn1YGGSPQ==
X-CSE-MsgGUID: h0J2tIqJTyGaORpXD6QHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91467217"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91467217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:53:54 -0800
X-CSE-ConnectionGUID: mj2sFsy5TFOicqVCkKu/zg==
X-CSE-MsgGUID: wzbbj62tShK3Vr/vBYr05A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223641473"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.171])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:53:52 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V5 1/5] i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
Date: Fri,  6 Mar 2026 10:53:34 +0200
Message-ID: <20260306085338.62955-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306085338.62955-1-adrian.hunter@intel.com>
References: <20260306085338.62955-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_005357_072473_A54BA47B 
X-CRM114-Status: UNSURE (   6.86  )
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


Changes in V3 and V4 and V5:

	None

Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 30302e4d08e2..26298d80a3fa 100644
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
