Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07275CAC583
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Sep 2025 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBkMl51rprlltZCoB2ipZneU2xwzY4/MrRb4uTBeVeU=; b=fwXIj/PEZW/A5e
	Yrfjdm4HK+8LiR432nkFz4dhYuLA6aN8vFNK8MrV+8z8K/qkdOwhuboPDeMIdW2WsIlrj0GNRc3Ym
	ihspfy9bookkR3zQAwHx53QM6cBEmeQyvdCt3ZMtHvdoij4qz6FWWeqHkKgy8VqbH/xvwQaNVFimO
	zs6HaPy5SIn/jAcPFrWAbdrxhS761X0zgKOnNa6KlUmVdvLBjiit4rrI2JG696BQQ1Nc4UqXKNuKW
	1BlJw1d1VbO+DoFJkPpZLiAahacjjKsA8XglIbNVNCpXIGQT6R/JMLNHfaMReTmzhPfGXizUiEfwq
	t8j+6yEICH+nddmnc4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0VF-00000008Dx8-14qo;
	Tue, 09 Sep 2025 15:43:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwJ0-00000006eQq-0xqh
	for linux-i3c@lists.infradead.org;
	Tue, 09 Sep 2025 11:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757416475; x=1788952475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GZJmWMk93oXyxDyZivakFznXcmsnaFRq2N8vRJ7jwuw=;
  b=R6OYSxYhrRYb3cwlsOn9gADHRPv4o8B2yhWpK/CZMzjng7s8mhvC7wcZ
   PTFCyK+ZyHvLQ3qUpzSJOKVey6eyTbNdb8tj6NkOKl/YvJi+ERw0IUWZj
   3c49lMW1aCOF61qD5s/RWRhCBx0Uuj2H6yIEwL0B+DeV4LtUc25tk53fg
   7ko7dCMNlq6Ti1/8MRPBA6yg630IKzwPstCMtT9s8Bo5IeP6XFFKpMSAs
   6KtisgOLkvH/oUmNoR7bG+MDPd/w1gCIc0We3DXzUQw/rtDZ4GXQa7CnR
   +Cyj3ATaBBAaRpsgjKpeQtM9+hxv9r2NeLDb5HaJryTOBamhBfN3Aue4F
   Q==;
X-CSE-ConnectionGUID: zXKKnkvnQ9OWOnJoRLg38w==
X-CSE-MsgGUID: b4n6CbC2R8OPedHkPkkdCQ==
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="46245765"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 04:14:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 04:14:13 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 9 Sep 2025 04:14:08 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 4/4] ARM: dts: microchip: add I3C controller
Date: Tue, 9 Sep 2025 16:43:33 +0530
Message-ID: <20250909111333.170016-5-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909111333.170016-1-durai.manickamkr@microchip.com>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_041434_276733_FB222315 
X-CRM114-Status: UNSURE (   7.77  )
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

Add microchip I3C HCI master controller for sama7d65 SoC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index c191acc2c89f..fbc80924daab 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -721,5 +721,17 @@ gic: interrupt-controller@e8c11000 {
 			#address-cells = <0>;
 			interrupt-controller;
 		};
+
+		i3c: i3c@e9000000 {
+			compatible = "microchip,sama7d65-i3c-hci";
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
