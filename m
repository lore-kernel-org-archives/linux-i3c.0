Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6559D116EA
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 06:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/va5NJLCjOQNwKvrofYwtvazK4naHGM/G7Rb5Qcg3zA=; b=kAzcN70LDEV8ZR
	qmGOQxbhU9235fm91bGB7E/XFfwftisPOFYBr0o1BuNV+pN/iQrVVuK8q+85Z53jf5FUfHYsA3M+r
	wpoCjs7XTWm+TxhO5xNUGMUawlkBl4hxId6gOFPa8DERXq6NqoYG6YhDrdZaulVcgvjYHQeXUwps3
	2sQ/eRQZT3WKeCa3BgNLzFytUaEbiG1cZoFL184m2+mp1gC4dlc+fV7qtxw7aRkoxLpylKOYg7FG7
	1q1AO9Yet9AkmSMsuft+vuuYWx2KxCboxcdV71N2e0BpmDS8rX3pH5OfrPyD++5iT3Ge+nbsExd4D
	bIK2Nle4ikOrnSxamqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsAC-000000003UN-2xDq;
	Fri, 28 Nov 2025 06:41:04 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsA8-000000003Oi-1FuJ
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 06:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764312060; x=1795848060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H4eVvapB/XpWX4gQOaMTLSPn+2Rscx9w1/DuYoJi9uI=;
  b=Kdth7wd82fmBv94LX7ZWQixJMWbXFw7RizJwXgk9QRve/OTYjGSrtcdE
   DLHtRmrtJl6HsUbatasdD5Js501lwNb1hQZao9auEiViycAW9aOo4MIDa
   Dgbt63sZ18T/ujpznBaFF5+fy2Nyb2+/uq2zZjRVvwIc6iccOQU//7+C/
   LAIhs/CVSEa/MHMT5KZy3i5gQVss2eyBZvpzK/zm4/esOeLjDV5/311A0
   S8Vz+Srxd4i5su/2lABDoy+wj3566kCwLLOoHp95kqWcot1ZF7ayxTpln
   9SoaKuemN33/ddg0iFgnIa+9MZjxp/qv+JAzcXUHfzch6RjjqpJg+WSpT
   g==;
X-CSE-ConnectionGUID: pCXz8MQTQUqjIZEJ0TJkTA==
X-CSE-MsgGUID: y+d6FrOpQri42vtyY1edSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66059947"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66059947"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:41:00 -0800
X-CSE-ConnectionGUID: X34HIhvDQCq3ggwCsaGIDg==
X-CSE-MsgGUID: SebRnIMcTbOOgqnEMJHf+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198348073"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.155])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:40:58 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V5 06/12] i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
Date: Fri, 28 Nov 2025 08:40:32 +0200
Message-ID: <20251128064038.55158-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_224100_408281_DB735FAA 
X-CRM114-Status: UNSURE (   8.38  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Add Frank's Rev'd-by

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
