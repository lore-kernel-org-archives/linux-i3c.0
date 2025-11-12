Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1291CCFA1E
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxrFt+3wfJ1tSBA6xw3GAhbRjkQO+7BrIKqJy/V+d6M=; b=WVETmVpx+jKUSK
	Ov3IrJ808w5Y4pcxtjKRD8G7p0e1SD5gyi18rObiWvglBl9Ca7//TjVqzLp61e4g7GmtwYYiMUe6O
	ZllqdoY3XwWc1mfm5J7KZiFA1/nb9PcNusaiC6JGcSDsE7hQyljcbaG4r3K9tPNFKLgs1/htInxr2
	9BB0KiT9kqp3OCoY25x+rzZIAefmxJthPpn5F5UT3YSio251Y2HS0MBGi8X87Lr4LJQVxwRXVcja7
	N/paReQFCpgM/jiKO4whL75nSercsIBQNCxzolu6siHgon8RI29hcfJd2Koqg0c2RyhVsUbgnbVS9
	8p6XyqT1D4DyxZ6i14cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hm-00000008WM4-2Zvy;
	Wed, 12 Nov 2025 10:03:58 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7hk-00000008WKj-0dGO
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941836; x=1794477836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WUn4hGHltvZvTgjzY9CJsQZuMZlbLJ261cnpeEcgfuM=;
  b=Azrj3zsXmdb6WS0tG2+qQfBF6ekOaIEs9NBofCfQ88kAbvKl8t2XoSjX
   mxgXJpBjL0tp9DuYgnW6iYm8HSd6dlSx+eVVNgbLIU6I2EeufVStGx06L
   ISLIHaZW7cYs1utOlMbb9HxLBxWMDxh253r05DCTxWvQiGhpUKdzE1ivp
   njZsr8y0Loqul6nJVg1Vnur7nY7EaCHiqfsckibjFOYd3iIJBDTxLKDWZ
   99BIY/Yr26Nb1VeWUdUJGUlbvhbRbgoCTz4FqDGG+vH3AWGo6yizWeREo
   9DG+/chEJ1DiGzhEU3D8luyF5gjKP7GcGPhCLfiIM6pbl5sSK5rZzvAc6
   Q==;
X-CSE-ConnectionGUID: qBXXSi4vQ0u5p5/2wGAmug==
X-CSE-MsgGUID: 0wxfGa4gQweDAmjqxN5cnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616207"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616207"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:56 -0800
X-CSE-ConnectionGUID: Jut/JfABR/+fRiPRrMcCFA==
X-CSE-MsgGUID: c7Q5Zn1ZTtuEy8qV8eRwYw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:03:54 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 02/13] i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
Date: Wed, 12 Nov 2025 12:03:28 +0200
Message-ID: <20251112100339.51726-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020356_198542_9B0E11DF 
X-CRM114-Status: UNSURE (   8.31  )
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

Move all Intel-related definitions together, to tidy the code slightly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 850fcec4cacf..617826628dc4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -17,14 +17,14 @@ struct mipi_i3c_hci_pci_info {
 	int (*init)(struct pci_dev *pci);
 };
 
+static DEFINE_IDA(mipi_i3c_hci_pci_ida);
+
 #define INTEL_PRIV_OFFSET		0x2b0
 #define INTEL_PRIV_SIZE			0x28
 #define INTEL_PRIV_RESETS		0x04
 #define INTEL_PRIV_RESETS_RESET		BIT(0)
 #define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
 
-static DEFINE_IDA(mipi_i3c_hci_pci_ida);
-
 static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
 {
 	unsigned long timeout;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
