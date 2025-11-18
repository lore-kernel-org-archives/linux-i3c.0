Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEE1CEE33C
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvwp/fumdr4CLYkNyshRMM3u7OD6lLyj8mDV3X3QtXo=; b=jTLQNX9mjRoNjY
	fKBO3SQT+5RqfQ5PeVLUUBqLtExwzmnSgnmYcfc91N8G/hphZ6yFeT3MqIwCTSz1hJK119EAkySOg
	PB3LKm3nYWQhTwm0vNCChW0v/+fBqpw7KTa2XpCQAraywL7qVGN8VS1niHE3D95eUIllwF/QFFIeI
	JVjVF1Dk0yqgbtksUz7E7vNvyb++9x1hZuSb0iH4hiiLke3BadIoup2Tie9kGCCvsuDCcG4oT2zss
	Wn306GHrZ40niIlGIB0NDX3DAABeISMXBnt/xKHmK28T0cZlKTMBquQXBapeSovLFqweUM9YDmdpA
	8dldA+BMWhfSaZoZQciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpX-00000000lyW-3p7J;
	Tue, 18 Nov 2025 16:45:23 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOpT-00000000lsT-3I0j
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763484320; x=1795020320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iEUQnsKp/QDiXGpyV++dpD3k8cvjxN0TKcJfT42XVvQ=;
  b=Yr4rwmAWiVE224XnNbgygHsGleakqmJLQY/cU8ispsydohdAPnr58ZfJ
   So7SZDC3zT+Dl/nqRjPEc88OkAjW5gTyGupdfPUTkIBIRU5QAYZg5GmDl
   q5P9J2fTZnxDRvAPYGvrJu0PH3V6/pK8uFWMdd6cRbgt0LkKRKudxp7DH
   CXSDajl6D2MIPYsojtuRZ2EvwHzSorprc3+mAd9y8EsQgBqcnhFN8FmZU
   cr3gQL2mcPhLUmct5micuAyDZeyrIbRZpf4lHW3zMvz5Y+ixiYX7Z8spj
   tvbx7dbtXKPZU3NuXbQA5B6yBpuEMYp7cR9Qg6KZbLAOE871N7ONulLkA
   Q==;
X-CSE-ConnectionGUID: +4u0AEMLTHyVPdXcY6gB/Q==
X-CSE-MsgGUID: n97GnSx9SsehmzWVE9FtDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64510694"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64510694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:20 -0800
X-CSE-ConnectionGUID: BSRg8XG9Rk+Rhl0IpMmfJQ==
X-CSE-MsgGUID: GZ/O48YlRjGRsh15OCFcyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221462963"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:45:18 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V4 06/12] i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
Date: Tue, 18 Nov 2025 18:44:47 +0200
Message-ID: <20251118164453.55532-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118164453.55532-1-adrian.hunter@intel.com>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_084520_869800_11C83112 
X-CRM114-Status: UNSURE (   8.69  )
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

For neatness, factor out private registers ioremapping.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V3 and V4:

	None

Changes in V2:

	Re-based


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index abc7bad5e069..1e1f2c42bd74 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -27,14 +27,18 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
 #define INTEL_RESETS_RESET_DONE		BIT(1)
 #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
 
+static void __iomem *intel_priv(struct pci_dev *pci)
+{
+	resource_size_t base = pci_resource_start(pci, 0);
+
+	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
+}
+
 static int intel_i3c_init(struct pci_dev *pci)
 {
-	void __iomem *priv;
+	void __iomem *priv = intel_priv(pci);
 	u32 reg;
 
-	priv = devm_ioremap(&pci->dev,
-			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
-			    INTEL_PRIV_SIZE);
 	if (!priv)
 		return -ENOMEM;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
