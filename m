Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07071CAC5A8
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yimwQZH7waiCGbLjfTTrVYzJgwDUp9ZmaCf+7vfOaVM=; b=geBo6nl+LVlkQh
	aRk7Wz7OR1kyio8egm42riaH2bM7nvNJb9uvNgR3/zOiphw7sAFcNe7yLcU022f2QC45ymI46eCIy
	fjp0wnMGTLVIt+i78UJ8YF2dCEoNFXBjI0SVzvItmBhjcrypgfjrjs7cZMVlyUh96/M/dZ6C245R8
	+Mjbi7pIar/+s/NrF/YL4aUU/QWgG4r+2OutH2MbRCLaMZamOwfMmpnwg+1achE+lPLyhJHPr2p3H
	lXrNHdH+OGE1dTMRUoNfGKmnE6J6Q+hSBxVbmmKyBYJYuAhyY2g0KIQLINaztLUYwfbgspToECwq7
	oTdCvcv7tUpKxIzRvlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBM8-0000000Gwfb-3LNv;
	Thu, 18 Sep 2025 09:55:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBM6-0000000GweR-2D6P
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 09:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758189310; x=1789725310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LVDuLILG0rHg7RJ4jCcHsn8yRzwBL0hGBrsWquovBqM=;
  b=fP4XX16ENssVoy0nrhTLQ/O7oEvt3vZbg89iNIsKoHusEDPRGOYY6iSF
   Jv2qq4VxPA7v39PwzP9Wu/qU7DRSRwfj7QTAo15QZZF93rDukF+SRSIJd
   HRM8KIda7N4EVKQCHruJ8tlVAxVumUKl0x1aEQndDm+trt8kRRt53nTf/
   s/44tlK9ir3KPbsjapfDDU8RTxrIZeaVfMTpSh+uTn7ROgKzPbhWJD46s
   1+OOCfzoAzJCY83wXcBjn+BkRcHdWWgXczfWjk2+XnvEt10HkwifwQ8Mm
   DIVw/M83K9Ydjf011dL3YhrjYASiAoDFcoDtu9mqJFEDFEhvYzCbG7+SD
   Q==;
X-CSE-ConnectionGUID: O8aTGVqaQjOx+eu6DgQ62g==
X-CSE-MsgGUID: f9VEl02USAaSQcCXZL8aPA==
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="46088874"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 02:55:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 02:55:00 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 02:54:55 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 4/4] ARM: dts: microchip: add I3C controller
Date: Thu, 18 Sep 2025 15:24:29 +0530
Message-ID: <20250918095429.232710-5-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918095429.232710-1-durai.manickamkr@microchip.com>
References: <20250918095429.232710-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_025510_625295_23ECBF86 
X-CRM114-Status: UNSURE (   7.83  )
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

Add I3C controller for sama7d65 SoC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index c191acc2c89f..3a5da27f7d83 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -721,5 +721,17 @@ gic: interrupt-controller@e8c11000 {
 			#address-cells = <0>;
 			interrupt-controller;
 		};
+
+		i3c: i3c@e9000000 {
+			compatible = "mchp,sama7d65-i3c-hci";
+			reg = <0xe9000000 0x300>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc PMC_TYPE_GCK 105>;
+			clock-names = "pclk", "gclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 105>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_ETHPLL>;
+			assigned-clock-rates = <125000000>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
