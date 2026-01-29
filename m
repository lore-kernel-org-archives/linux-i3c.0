Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9623D73E80
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 18:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4CIHzYQQzu9xachL/+bLnnXvfLB+KUzLiu9GGH5MYmQ=; b=sljFO4rjbapSQA
	wYEyWSyzA9JYLVitamxNJSyHgCmkBX+Gra3+94362TZZP9tbL5ZXM4oydyTIVwmlt0JIndi2ua+Rt
	6Ok0P0hQT5MApog3RT1owBaQTSTUR3euXfLji+BJf5KhWVQakRB5ZCVH71/yRr6JVsgdemMDbB58o
	F6PiiN75rm4lVEm52SQ054OJl5Nb5MWF1DepaHLdjrB3rv1IskGS3KXO1DsRvdPs89/2RGkcohlNc
	49HA6fMRz8KHNPB90uZuk/f5Z4uOWenShpZg+NZAjO5zJHZBP/FjB9I3EpcLfLv4AfAmgLy/bhgKG
	nOlyFjdpNYKLB+N12FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWba-00000000VSs-0pzN;
	Thu, 29 Jan 2026 18:18:58 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWbX-00000000VQW-410C
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 18:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769710736; x=1801246736;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k2kV1md/c6oz+3Vmgv89T8BHEt7KRo1xA7RQ1bJVq8k=;
  b=PzauM3JQcKLm3Y01cGnlGegQQl5bR6fF3tt0IX5ErngnjJhnHwNgq9Eq
   Eku+JSYWT+L0Wif8xaAVw3whsMllBwAY/HbCVGvVs71GkGhaq7fTzb3qB
   La1Vs700mtFlEXjLL71VEKlOQJSvWT8zSj+nlHshOWVPeCa18kNYABiVW
   Bq42OtEDOGLKh1hUTES66F1RD88kWTaRfKYKA4js9XtZtmpsE+L00KXJR
   SE+McRAkwuAVm8cQZor2v+wGYBEDswZr4xdZzBpsOleVUnOzHeo99gZES
   L08fGKsV2fESGY7C0sptsb4omhDF/mbonUvhQmYgdJXGMneU4sywAeuky
   A==;
X-CSE-ConnectionGUID: yXun6l2JScWq6w2mDdsVbg==
X-CSE-MsgGUID: dVSulkDYQ+WUenqiE7FHLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70158272"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70158272"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:18:55 -0800
X-CSE-ConnectionGUID: dtscTdSNTGWESIdqmkfSuw==
X-CSE-MsgGUID: FgYPC/z8Qw6Ktlwcx4w5ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208255170"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.96])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:18:53 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/7] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
Date: Thu, 29 Jan 2026 20:18:34 +0200
Message-ID: <20260129181841.130864-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101856_006271_C0992A2D 
X-CRM114-Status: UNSURE (   6.95  )
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

Here are patches related to enabling IBI while runtime suspended for Intel
controllers.

Intel LPSS I3C controllers can wake from runtime suspend to receive
in-band interrupts (IBIs).

It is non-trivial to implement because the parent PCI device has 2 I3C bus
instances (MIPI I3C HCI Multi-Bus Instance capability) represented by
platform devices with a separate driver, but the IBI-wakeup is shared by
both, which means runtime PM has to be managed by the parent PCI driver.

To make that work, the PCI driver handles runtime PM, but leverages the
mipi-i3c-hci platform driver's functionality for saving and restoring
controller state.


Adrian Hunter (7):
      i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
      i3c: master: Allow controller drivers to select runtime PM device
      i3c: master: Mark last_busy on IBI when runtime PM is allowed
      i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
      i3c: mipi-i3c-hci: Allow parent to manage runtime PM
      i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
      i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers

 drivers/i3c/master.c                               |  14 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |  30 ++--
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   7 +
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 158 ++++++++++++++++++++-
 include/linux/i3c/master.h                         |   2 +
 5 files changed, 194 insertions(+), 17 deletions(-)


Regards
Adrian

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
