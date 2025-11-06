Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0B1CCFA13
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Nov 2025 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xLWdon/OEoTAaC99Gf2lqpKrAaYwEYjJoyq7amJf4z8=; b=b7KynBntehQh57
	/D64/FWXoiEjeD467B23gxXnr7U+jirG5GL866DP/0ucUVjoK7BKkgUAlgD0zwxrQ7wnF1ERDToSZ
	QGSNNal9gvfjVUuNG/PjcTvmCDmlLxBn6Hc0RXdnN0FiHmf+G+9tKI9LEyLJ2++tLNAU0pBVP+s3X
	oRrirhRohCLlgAinJHfjEoar8yZg8wOMqlqQkrJ1NUbtn+8K9V+Km/8JEAd0lCCFzM/UJ+O52JGII
	SLV1Bh2779Ov405WAWmxVGnn7U/5fMDrsjfJDbqHBiR19xzjVX9WXzFxra0Z3M1fcaatd2ARjXO68
	AmpdU86srprfwfP57RQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Zy-0000000G00f-1aUP;
	Thu, 06 Nov 2025 17:15:22 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Zw-0000000G00K-0kNr
	for linux-i3c@lists.infradead.org;
	Thu, 06 Nov 2025 17:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762449321; x=1793985321;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zga2CIOUJZA6FK1LoTW5loTbWPupHAIooJhs9pd+5vY=;
  b=mgMg4v2iTRyvX4hOLQPCwA/8MWL73PbsM1eqRhDEN5FL/zm4/2NSDGAB
   WqEwuHU7Fj+bgJQSQIhOmZMIfpccLL3bitLxzzSQ3hAengeUygwuy/5j8
   /4MIEqCU6onvkOJUkmdoeHRfRWjrx5c4QOLtf7rpqjReGsVrr2y8DoDPt
   Hl2T3VVbdoDUyOCUx0SRF3E9t76CfCV/imzq0KuXTpNoFEecITTm1+0sb
   Sgs6JWIHQ2W+6W7mo1nucjEu+ESAGcV3p15+FQPuk0HQyGWEs87pOq0bA
   wzvAjeiFjyl+D2HjA3kEvmoHpPRIWwHsw9/b1aEs97RlGW3UQENRjgRS7
   Q==;
X-CSE-ConnectionGUID: cZLXF9yQR8CiPF26384IDw==
X-CSE-MsgGUID: cG2WZpWTSo2VX8W236LqLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64523364"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64523364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 09:15:20 -0800
X-CSE-ConnectionGUID: 9OxGao1ZQYWFcZq+KQhIsw==
X-CSE-MsgGUID: GAkHRMBURv6JVuml1zpnfQ==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost.localdomain) ([10.245.244.138])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 09:15:18 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-S I3C
Date: Thu,  6 Nov 2025 19:15:07 +0200
Message-ID: <20251106171507.70147-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_091520_257831_E5C38329 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Add I3C controller PCI IDs on Intel Nova Lake-S.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 08e6cbdf89ce..dd4484eff2f0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -133,6 +133,9 @@ static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
 	/* Panther Lake-P */
 	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
 	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
+	/* Nova Lake-S */
+	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
+	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
-- 
2.48.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
