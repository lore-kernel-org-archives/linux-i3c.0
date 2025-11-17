Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC38CEACEF
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BebUumnC3AfmxnWThWbDDVTqO+kv8sesETaSb8T318c=; b=0iju+r/gsY29k+
	Y5EfWtGfrkv0kw9K9YSUea2BS5ptJ2H3K6npyKF0gZl62goWmG5cHwHG8r7HJwDJzkpTZk72ppac9
	jx2X+Z6O3ua2o/kO/CRaHM84d/RuuoQPv7ew7R/iMHdxZS3va/30SOZ2JFXk/xpSrfqLtS0/rjJk0
	3w/QZtlUtFEqvqJePzyp4+csZzF/tf8fw/v2kYNCP+s4vRoBiBhhHHIpD1bNmE/Q01JhRxbvzcTsb
	HVd2gWrNEFEQIHPFl2uG555HAY0gYQOZWKbHbyvoVZ+lQ+iCa/E+HE5Ms1Abv0IvhD5VOhjs7e/fX
	Lq5AhHAOQoZt41C+mSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5j-0000000GA4S-2zHf;
	Mon, 17 Nov 2025 13:16:23 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5h-0000000GA3a-2dYY
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763385382; x=1794921382;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IbRAT84dylD4QN22EJXNkChCNTzid1skreAMQH9mi3o=;
  b=Ar/GEJX8ZvKHnOLaXqftIQaR40ITMGRyojNAdN1SPF73DMKOXntVfvub
   Ns2ImCaS7SR+BPoJu31hgT1QFeeBZQQkIqIo2m1DUDFknGd4GFSZOpK2B
   VRkLcJf+chLAGNOFfY7M2E4lwFn3Pk7PNh0i35UNgomgunKP5LblWxGY+
   7wEGzXHl/GKrKAHM6LyJEuCwFBABhVODiCc0/s1IeEnHRDnSfS8yMHAII
   p/VpSWkLvVCryC7793tMjStho8nb+XU+u9xyJHf3TmeVb4Qo5cL4d9YgA
   VF63IauLDErK/pyJ9AqAaR7px91nnQRUn0Kg4fv04VBUKO1V2EAuz0Sot
   w==;
X-CSE-ConnectionGUID: nylEteQcSI60weqVkg7XSQ==
X-CSE-MsgGUID: dCccg7eySYmGMNUv4SlpXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="83009051"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="83009051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:21 -0800
X-CSE-ConnectionGUID: XV4DZDAkSaikWzYywpP3RA==
X-CSE-MsgGUID: jJppa2wtQeGQTdl/WYS5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194549271"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.191])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 05:16:19 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V3 00/12] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
Date: Mon, 17 Nov 2025 15:15:56 +0200
Message-ID: <20251117131609.65988-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051621_720635_E5730B36 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi

Here are V3 patches primarily to add support for Latency Tolerance
Reporting (LTR) for Intel controllers.  Most patches are small tidy-ups or
preparation for the main change.


Changes in V3:
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
	Omit mention of IOMMU in commit message.

      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Change callback parameter
	Improve commit message.

      i3c: mipi-i3c-hci-pci: Add exit callback
	Improve commit message.

      i3c: mipi-i3c-hci-pci: Allocate a structure for Intel controller information
	Squash into "Add LTR support for Intel controllers" patch

      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
	Squash "Allocate a structure for Intel controller information" patch
	into this patch

      i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
	Add Frank's Rev'd-by


Changes in V2:
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
	No need to check error from dma_set_mask_and_coherent() with a
	64-bit mask

      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
	Rename 'intel_init' to 'intel_i3c_init'
	More explanation in commit message

      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
	Change 10000 to (10 * USEC_PER_MSEC)

      i3c: mipi-i3c-hci-pci: Constify driver data
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
	Move location of intel_reset() to get a prettier diff

      i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
	Add Frank's Rev'd-by

      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
	Make use of FIELD_PREP()
	Improve handling of values that exceed the maximum


Adrian Hunter (12):
      i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
      i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
      i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
      i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
      i3c: mipi-i3c-hci-pci: Constify driver data
      i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
      i3c: mipi-i3c-hci-pci: Factor out intel_reset()
      i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
      i3c: mipi-i3c-hci-pci: Change callback parameter
      i3c: mipi-i3c-hci-pci: Add exit callback
      i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
      i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers

 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 238 +++++++++++++++++----
 1 file changed, 200 insertions(+), 38 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
