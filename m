Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B35CCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG9ADtzwzVFetnhmVQujdFgZn6JUZyMT6z5Lw7IxXnE=; b=OmBZMzD5kehNcV
	2ct7AvdxVDBBMPLZo3BlMGq2Zh4NPfgdiEmG510eyEEvz0xxXR3Q0AYSgBst+lj/I7ZfDoJz5qgGG
	0DO6MUIPa6vi6y2CKTkr1AfdVbCPMxHIBD2S2GMGQmJoEtoIqc8/BBeU/C+udXgsgFAx7UzphTcLZ
	QpHzNRdvefra8+c+OZgx69xaKBQn1gE4Ozvjd7Ic/nPi3Y3njDdBiCpoZP+TWdVy85RoGwqIHz80Y
	cW1riaV/47DH3M19UPDoy7ItSUGDaQmRFfR+boKD6PUe4QKR8sdTQrZvIJy35xkIdqi/D2VCELnyC
	xyoHmKZFUjUz6H8AqS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hm-00000008WLp-0TT1;
	Wed, 12 Nov 2025 10:03:58 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hi-00000008WKj-4B3I
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941835; x=1794477835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NcVdzZVhqU5X6VmYfU+NQD57ZSBo4o2iEhGID/n3MvQ=;
  b=O3FIz1GzA+fazoHZjpMKamDENxByq03GihACqGQXd8eiYjvhfHroEDs7
   YoKi0eEW7SDzgUB7B3PavE1wYc32jllvighZQRs6fB2qqqKIbOdcTF8nW
   NKSNU6mPjOsepWVTusOhWfGWkmf7/vAXD1T60otK2j2vfMsSbieugIB9+
   D7MW5y6D0tbDRskuBghCkRAK1LcV44l+RxNk6VfqrgDzOXC6TwLgr195Y
   bGzIKa/JhyWQK17+9IW9Ua1aCjMTwZUtrTlEnVtPN1s34A0rCQIrWhF0u
   6v16+5cBF4sgZBG7AwlLZn4QeONso8qlujjHB5goj45wJYtiJhqYjp/w8
   g==;
X-CSE-ConnectionGUID: iVjOhkdpSHGiXQHWP6Cbrw==
X-CSE-MsgGUID: YNgjcS56T3a62X9a7lk65Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616204"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616204"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:54 -0800
X-CSE-ConnectionGUID: 6d+4RGdoTZOK55e/1l+lfQ==
X-CSE-MsgGUID: 3TIoSCk+TGmlHnKFX2xhNw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:53 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 01/13] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
Date: Wed, 12 Nov 2025 12:03:27 +0200
Message-ID: <20251112100339.51726-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020355_046412_4E166398 
X-CRM114-Status: UNSURE (   9.25  )
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

All Intel controllers support 64-bit DMA.  Set the DMA mask accordingly.

This is needed only if there is no IOMMU configured, which is not
recommended, but possible.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index dd4484eff2f0..850fcec4cacf 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -29,6 +29,7 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 {
 	unsigned long timeout;
 	void __iomem *priv;
+	int ret;
 
 	priv = devm_ioremap(&pci->dev,
 			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
@@ -36,6 +37,10 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 	if (!priv)
 		return -ENOMEM;
 
+	ret = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
 	/* Assert reset, wait for completion and release reset */
 	writel(0, priv + INTEL_PRIV_RESETS);
 	timeout = jiffies + msecs_to_jiffies(10);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
