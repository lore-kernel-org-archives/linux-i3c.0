Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929FCCE8D71
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 18:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YERemx7BlcHmQJfIKJHQse+5GcInfEE4d9NPkEDHccE=; b=xVcI2j86U+kWrz
	XSqfGxfiPhz8s/4yDtNDQynHjUyZZaiDJR4pDHd2QBMAWgt7CY0Yevdb/81NkZM1bzA7eHopPK1EN
	Wg9POUXPfwJxX9zw6ElkmrxrFEVv3asYktLU9ZhmJKA+RLJ34gJFnLJJ9yLQeSg7WEonkYgv8HBye
	etb3rb1Xphz7P47VuBxLGenT0sMVu8Npg4CZrqSYyABpeGkWANuhM8A/q68n/k0GZstZadUwX9C4j
	BK831RgcMui2ll8t70SUtiMddDILgj2/8gHH1dP+7GIwMSsufprDH/z+UYCEQ+RaG/lc7B9sX/jBv
	VnvYDJNbJdO+UZAQrU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJO-0000000CwOU-1YnD;
	Fri, 14 Nov 2025 18:14:18 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyJL-0000000CwM3-1OUT
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 18:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763144055; x=1794680055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oAvp/GwZfWG1zka4qYMZqypRw5eIz7/Wtj49AcUcr6o=;
  b=Zmk3PqJk7J9uSDXj68sgRVcLIINBC64jLGdHx/LKyUpUUt4+baASzDlF
   SrOAb56kU9F47ffnyv+hBBWdEWWypway35c7s4NVS19GPqiRd37gtbUSQ
   aKcKpIpujYWwy04sFJDozGXV865hSdvkfEm+9bSwrI8qPI0rdEJczTjWd
   iG3MlcpAfkLgZkTHha7h6VfKTN2onwDDRtVLz34KrRXhpRUmMb4w+YMeg
   NV1YvKMZaSyKbtMSKyg9iP0uRjx42A2fpJ9lh1cTRic9Zhow2BmXktOcI
   d4ZLTVblwImvjfpsHWIjOe2Ra20hs36Vh4ICOF8WUKc7P13SCe/StGfUU
   g==;
X-CSE-ConnectionGUID: kFlCLx7PQUSxB6IAK1VoFQ==
X-CSE-MsgGUID: StazaYFTQjidKnMWNm0gcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65129306"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65129306"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:13 -0800
X-CSE-ConnectionGUID: MJHonQoOTkuZwIrUwljnPw==
X-CSE-MsgGUID: RMQwpOUmSbWYsFEDd9o9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189668963"
Received: from rvuia-mobl.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.231])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 10:14:11 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 02/13] i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
Date: Fri, 14 Nov 2025 20:13:45 +0200
Message-ID: <20251114181356.66515-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114181356.66515-1-adrian.hunter@intel.com>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101415_419119_C9F39A63 
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

Move all Intel-related definitions together, to tidy the code slightly.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 3cd15ca7d391..3d854cee05df 100644
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
