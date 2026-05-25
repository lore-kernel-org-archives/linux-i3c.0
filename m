Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807B9CD5BBF
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxGFlj+UUVMR2l7t9vkLCJwYi00wqBfdr/5OkPG+EG8=; b=X0aqRyPlMmwRgW
	49jzs/jsBTJ3JVs7YB/bFEJz2Zk//xieP8X7RZ+cQSuYcBcjDe9v0JFKIKGtqD6fLYT83NV8jvwNi
	8TWpfb2pDpadANckmOphQogNA0fp6Wv6Hdp33Sr2qmXVlYh4YIUvBvEflj/n42eBZo+ownxqkw8aY
	c/0O2vSRSTR0o0jo9wErFs1xkhAy0FyKbszF79zy8OLr7kdw5emaxzBkZtCBLXFOAWJhlAvcaKoBR
	OjrROImwigzD7jQKHlA6z3Y+fYqnhbFF65gh79z+IgdG/IHY9PNgsh5q8dSJsxG6aKD8A3P3cIgQe
	5nZ2Ds4E62UVjChAsuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYJ-0000000GnbZ-19ix;
	Mon, 25 May 2026 09:24:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYG-0000000GnYV-2VCO;
	Mon, 25 May 2026 09:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701088; x=1811237088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JOz8CyPvTuEnYMyTAQgQxItg+5IUdou+jREaprkAVvs=;
  b=2cwM4DkanOR1TtMcmtHTM+8Dzr0iWrQhEwruQSDVGDUr72Oy8cTxbXts
   0EoxNmfxYuIiY3a/S8UNMJ9FFIt276fx00aah4kEQOmufxG4SsRCbw93H
   qeL/k4kWgxs89N7BFmKbOQXfOAXOkjbnOsEEu4kt7VlAgOqmqtGKYl/D+
   5CQ4dSAlhDLrxJzf++p5c1e05eqwWDCRW6uH9iJP8vSSFE2MrYyiG40B8
   ABfGWoaWZypTY6PGtHms5tz2SCfq+FVrQPJA9mllYoYwEvx6ewX27XvUV
   RJe89kI9uIIlLHgOiHHreoCb3quUPPTnD4FE0khAfR759O0ny2pEvkYcT
   g==;
X-CSE-ConnectionGUID: B8MMbkFuT/KNheQJC2z/Sw==
X-CSE-MsgGUID: iAMsBOFnQWaGu8ORH0hQSQ==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="58412018"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:24:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 25 May 2026 02:24:46 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:38 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the required quirk
Date: Mon, 25 May 2026 14:54:03 +0530
Message-ID: <20260525092405.1514213-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_022448_699887_BF8B2576 
X-CRM114-Status: GOOD (  16.08  )
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

Add support for microchip sama7d65 SoC I3C HCI master only IP
with additional clock support to enable bulk clock acquisition
and apply the required quirks.

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v7:
- Use (void *)(ulong) cast instead of direct (void *) cast in
  of_device_id.data for pointer-size safety across architectures
- Update commit message body to explicitly mention quirk application

Changes in v6:
- Reorder local variable definitions in i3c_hci_probe in descending
  order of line length

Changes in v5:
- Remove HCI_QUIRK_CLK_SUPPORT quirk and call
  devm_clk_bulk_get_all_enabled unconditionally, eliminating the
  need for a clock-specific quirk flag

Changes in v4:
- Remove the clock index variable MCHP_I3C_CLK_IDX as it is no
  longer needed after switching to bulk clock handling

Changes in v3:
- Make use of existing HCI_QUIRK_* code base instead of introducing
  separate MCHP_HCI_QUIRK_* flags
- Introduce HCI_QUIRK_CLK_SUPPORT to handle peripheral and system
  generic clk in bulk

Changes in v2:
- Platform specific changes integrated in the existing mipi-i3c-hci
  driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
  specific quirk files rather than a standalone driver

 drivers/i3c/master/mipi-i3c-hci/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b781dbed2165..4cdf2abd4219 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
@@ -969,6 +970,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 static int i3c_hci_probe(struct platform_device *pdev)
 {
 	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
+	struct clk_bulk_data *clks;
 	struct i3c_hci *hci;
 	int irq, ret;
 
@@ -1001,6 +1003,11 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get clocks\n");
+
 	ret = i3c_hci_init(hci);
 	if (ret)
 		return ret;
@@ -1031,6 +1038,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
+	{ .compatible = "microchip,sama7d65-i3c-hci",
+	  .data = (void *)(ulong)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
+				  HCI_QUIRK_RESP_BUF_THLD) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
