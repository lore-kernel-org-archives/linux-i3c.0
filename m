Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449C3CEE33C
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BM09s4CPr+Pf3N5nSuoCrlBl9Sk6wLk0fUCjYbRl+iA=; b=kGruwlMOHvWKlV
	d4E1PO6Gkkk52jYtGJ78gDXQMXESGP5uWncicTLVNLw2fOGllB9KQ9aX/Oks4q74VNqZsJayqKLrS
	kFIMIbsSNo3CtM+xRYwImScRRW1NX5bvR+GsMfiBg1lUBLL536ZOHpyD4BSxLMTsnySt10PQew3/w
	kh78lLTZS3xtLvls6F+zoNWBnIDrd+8Ohfrzeeeu+C63oD4m1OER2wT4OhvbdipyoQhDNgzTYjVY+
	c2HyAT6+bwzu9Nd4iQnWC2K7L4ZCy6Dd1ByhRL5WogLXaUekRpKnJOgT2Niiz+1/jSMHEUDTUZ+Qf
	MjBuReKW3EeX7NARZqKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpf-00000000m4U-2OUM;
	Tue, 18 Nov 2025 16:45:32 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpa-00000000m0h-1v4w
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484326; x=1795020326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q/ascWUmlY739x7llqRCrdfZFiOmh/kWZVZEK8/uZFw=;
  b=kP/us27naizHnbrgL6hI3BaUsJ8NzPChirDeh1t0+h/d+jvielXdchOO
   vnLkeXkYOspH4rfDsudDz7JbGbXJTYC1zGhXhFNJ2kaQgG/AdT5dgI9lw
   lmGtDydUpG6qa5ebne1FlqE6rVTX/Z5IbwVyYr1+rke/AxcfRk5/qnDS/
   c2wjwXwqx0Zwop0AAg9HZVdRI8EwdvbPu4dv0GcE9IVAxW0trpYKJP36n
   1lr1rfvb5D/yfmPhZU1nR8wSJzYhvp50whpJ6fm5seuJs6SxVSSnij+dB
   50YpJ652Dq1YcQ+puRbvjBQtcGY/D8iSYkgZq0ZK1Ufn1Ou+1Vhn9fFAB
   A==;
X-CSE-ConnectionGUID: UifD+dMWQRCJjnf4FJ9XKQ==
X-CSE-MsgGUID: w0m9bTb6TXek/RdwgMu5fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510709"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510709"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:26 -0800
X-CSE-ConnectionGUID: DOGn3v1WQK2ByGaZ+Cox8Q==
X-CSE-MsgGUID: EDoYyqOaRRy2ZVFwaFP3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221463034"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:24 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 10/12] i3c: mipi-i3c-hci-pci: Add exit callback
Date: Tue, 18 Nov 2025 18:44:51 +0200
Message-ID: <20251118164453.55532-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084526_760831_57939532 
X-CRM114-Status: GOOD (  12.55  )
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

Prepare to add device-specific features that require cleanup
upon driver removal.  Add ->exit() callback as a counterpart to ->init().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V3:

	Improve commit message.

Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 7bfb9fe337b6..b962d3c2d510 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -17,10 +17,12 @@
 struct mipi_i3c_hci_pci {
 	struct pci_dev *pci;
 	struct platform_device *pdev;
+	const struct mipi_i3c_hci_pci_info *info;
 };
 
 struct mipi_i3c_hci_pci_info {
 	int (*init)(struct mipi_i3c_hci_pci *hci);
+	void (*exit)(struct mipi_i3c_hci_pci *hci);
 };
 
 static DEFINE_IDA(mipi_i3c_hci_pci_ida);
@@ -72,7 +74,6 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
 static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 				  const struct pci_device_id *id)
 {
-	const struct mipi_i3c_hci_pci_info *info;
 	struct mipi_i3c_hci_pci *hci;
 	struct resource res[2];
 	int dev_id, ret;
@@ -114,9 +115,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err;
 
-	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
-	if (info && info->init) {
-		ret = info->init(hci);
+	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
+	if (hci->info && hci->info->init) {
+		ret = hci->info->init(hci);
 		if (ret)
 			goto err;
 	}
@@ -141,6 +142,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
 	struct platform_device *pdev = hci->pdev;
 	int dev_id = pdev->id;
 
+	if (hci->info && hci->info->exit)
+		hci->info->exit(hci);
+
 	platform_device_unregister(pdev);
 	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
 }
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
