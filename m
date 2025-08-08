Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1493FC87FD2
	for <linux-i3c@archiver.kernel.org>; Fri,  8 Aug 2025 13:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s5of44xv0V2cbiEqMmlGzsIx+UhbSQp10feNyCucD/Y=; b=YD+2CDyxeIrZgU
	TPfp9+p9bBOwIxy7XrWcpJKsk+dR8v6vCoXnQ9W1FbSj1ND8sUwxmWBi8zHj/ipwqgnFixRye9Rqo
	FUXe801WunX9agkW7pYH4w4RLF4qa8MKMtPE0Ty0OFx01eAmydqlX3mRYwt0chXVsB4nB5JH0CxdW
	R+Ravt4aMWKI1a2ZMUPUJyCRgvE9sEFAaLBh2+m4VOi7w0MJ50nLPzGRz+GgMr5WSc9ZJPuxrnBrA
	N+J6azyAY38fleiSPzGo9EW7UESsjL7N1wDt7Rhyzoy9vcTYDRyKXbHIWve4l61BP/eWSisYd+PZl
	ZK/0zhzbAd3YCIF2prOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMyc-00000002uAc-3Xp9;
	Fri, 08 Aug 2025 13:17:42 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMyb-00000002uAG-16lT
	for linux-i3c@lists.infradead.org;
	Fri, 08 Aug 2025 13:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754659061; x=1786195061;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZmFgeioK87HMOIepHDdADOamovxHp+7XqNva1wX8SQ4=;
  b=VOmEW1loeseO8FUgFsJSepm7v8qimUq+qG0jcLJH/89IpMg6Gr63vtmO
   I6uETToFWbeJG93A6RFJ49j093sKV2UlsvAuvYyDZrhh614PJemdPyBo6
   KGS0KOhKoYe69QEHhTYzQryBLyNGodsRHPUP2VAANlXqSjxAqGXeS60KB
   nvYg3wbQOQQAFE1s0WiM9e5dx0tQcAsduzu3X6NP/uZXLgibVHy9FhnZK
   MJW0shsZ13o8/wx6n2DGfr1jN056v6EHsOZAuFWyJ+aGH3+zDosInlOjV
   muRTQdU7AOnB2p1lMCdtKh4CM5TdYNU2/ibFDssQjEAdtDtQWKnjHeeeS
   Q==;
X-CSE-ConnectionGUID: cF77e/QMQyOzps4KgjHlvQ==
X-CSE-MsgGUID: FldoO5VDTnGR2BKoMhizlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56970271"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56970271"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 06:17:39 -0700
X-CSE-ConnectionGUID: 7Sgj/qdzSpS7kha6tG9GZg==
X-CSE-MsgGUID: KY2uUsqOST6nq3tWY+LjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164565200"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.50])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 06:17:37 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Wildcat Lake-U I3C
Date: Fri,  8 Aug 2025 16:17:32 +0300
Message-ID: <20250808131732.1213227-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_061741_348550_E61CC174 
X-CRM114-Status: UNSURE (   7.51  )
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

Add I3C controller PCI IDs on Intel Wildcat Lake-U.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index c6c3a3ec11ea..08e6cbdf89ce 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -124,6 +124,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 }
 
 static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
+	/* Wildcat Lake-U */
+	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
 	/* Panther Lake-H */
 	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
 	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
