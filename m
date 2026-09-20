Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D5C982E1
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Sep 2026 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89l6MY5PGwhgJG+oawNOa6TiVBRGNJaPYeUf7Rrk9i4=; b=TWRMq21f3iT3rM
	9cw1c/PWz0EkM688HM4kmLDM0XCOFskRoFEnylauSjhOxtOLTb5cc9fCKD2R2+c88dZ2UGQjSkImP
	c1XWoA3hYuBz7me0sU1TucqwXcyXKfl6+AG+4mrbTvRuyH/xs/ScSu6Bf95lKTASQlFoQyud/2S8X
	eyM0gjxkf7wL9DMtGQe8lS2HAX/oBx4uG4qd53ZArpsIaiV0cGYzQF4lF8Ktc/Pu6acuz+xk/P4dc
	nB0HplgR83MoP2LrryXiHqL0gEY9+tL0I6yBrwRG2N84KkVHvxd9eOub09JNam74HL3vp8DjBQQ4d
	gtEboXfDpIIBTAf5rK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE4-000000002SF-1BVj;
	Sun, 20 Sep 2026 15:13:08 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JE2-000000002QA-03Hd
	for linux-i3c@lists.infradead.org;
	Sun, 20 Sep 2026 15:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917186; x=1821453186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MlFwPz4d9vi2E9sU5ETxKMIIdJYtsgDWl6iaGrPqkK0=;
  b=VFZztOK/6+YWmYkcuVDSkHdpNuXMuhbAPPMNnDB7FaERygl0cpk+YAPX
   UmBlol111hIuns3AhzcdOtwD2QRSKJ07hFNd6wMEH+b5tjoz01i1GfgMk
   iK+D4e4DzKobXK4NBAoZVuHsnImx5dcCs8KVjFlY/pxDN+ofs1xV8ZSzn
   dRLCPNxDd4iw9iakBZTfQYgWu2lAsI290OWC9zT15+fCCem5hWGc/v1Oq
   VX8Xza7AtADRf8Vfx5iOsY4ePn7JqXCSrvJL6ZVaG1LdUGsGGJmM/ygOR
   mC8bg5y3mm2vGMi0XK8DO0OqjYhy2Cb6ral3LEitglx9SQaBesGIGrm+z
   w==;
X-CSE-ConnectionGUID: 110eybdgRW+6wRJmfCJQnA==
X-CSE-MsgGUID: RQJrjG3UQziAbFdrlvsxHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548417"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548417"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:06 -0700
X-CSE-ConnectionGUID: f5ZiwFodQU2mHGqLWRt9ig==
X-CSE-MsgGUID: CN6fCGa/RLSKypxN3FOeSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352377"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:05 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
Date: Sun, 20 Sep 2026 18:12:33 +0300
Message-ID: <20260920151248.46936-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081306_061169_4BB6367D 
X-CRM114-Status: GOOD (  10.36  )
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

intel_i3c_init() creates the pm_qos_latency_tolerance_us sysfs attribute
before probe calls pci_set_drvdata().  A userspace write to the attribute
can therefore invoke intel_ltr_set(), which uses pci_get_drvdata(),
before drvdata has been initialized.

Move pci_set_drvdata() before hci->info->init() so drvdata is available
before the sysfs attribute becomes accessible.

Fixes: 884a33131f2a ("i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index ab595661db1e..af9595009b03 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -445,6 +445,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret < 0)
 		return ret;
 
+	pci_set_drvdata(pci, hci);
+
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
 	ret = hci->info->init ? hci->info->init(hci) : 0;
@@ -455,8 +457,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err_exit;
 
-	pci_set_drvdata(pci, hci);
-
 	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
 
 	return 0;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
