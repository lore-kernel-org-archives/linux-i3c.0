Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20B2C10F16
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tctdQ0HsEWBwbJ9XNwsijqz71s03fX/T9ZDCNSv7bU=; b=DJKKOrn1OAVBjN
	BHk+pmnLdZrP1oCz71E7AK728Ts1a3JGlhbB8neqxCqKOmlWNncaXRnECnBa6059TTXbTt9Rj0VqZ
	lBaG/zG9Ert1TSc3IC097c3mKTN9oSkeOB936xBHcYY18C64/R6fcC0yLmxGDQZHV8X8FTbflx0St
	ZWHCbS8Glavp7fYbZWtUlzMT1voD6OzfJJ5w/jvoFIMLg29BZIq88Wwu3/PMXkcnVQ0l/hoMLj/vy
	abTfy8NliRXmEYdwfGx2+e2h2gvbY199tOctmL5b6NkQzFNyWa6cT5JNL9CGQfr76F9fNvTZ79SCp
	emi0z24PfSVgAKMUaE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vwm-000000071i9-0v6g;
	Mon, 06 May 2024 10:51:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vwf-000000071Z9-3DkX;
	Mon, 06 May 2024 10:51:47 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 6 May
 2024 18:51:21 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 6 May
 2024 18:51:20 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 6 May 2024 18:51:20 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <jk@codeconstruct.com.au>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [PATCH 1/2] [RFC] ARM: dts: aspeed-g6: Add AST2600 I3Cs
Date: Mon, 6 May 2024 18:51:19 +0800
Message-ID: <20240506105120.3028083-2-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
References: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_035145_836628_89AFAC32 
X-CRM114-Status: UNSURE (   5.88  )
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

The AST2600 has 6 I3Cs which are based on dw-i3c along with Aspeed
proprietary enhancements.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 137 ++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 29f94696d8b1..d0d685747b74 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -13,6 +13,12 @@ / {
 	interrupt-parent = <&gic>;
 
 	aliases {
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
+		i3c2 = &i3c2;
+		i3c3 = &i3c3;
+		i3c4 = &i3c4;
+		i3c5 = &i3c5;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
@@ -579,6 +585,13 @@ wdt4: watchdog@1e7850c0 {
 				status = "disabled";
 			};
 
+			i3c: bus@1e7a0000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e7a0000 0x8000>;
+			};
+
 			peci0: peci-controller@1e78b000 {
 				compatible = "aspeed,ast2600-peci";
 				reg = <0x1e78b000 0x100>;
@@ -1125,3 +1138,127 @@ i2c15: i2c-bus@800 {
 		status = "disabled";
 	};
 };
+
+&i3c {
+	i3c_global: i3c-global {
+		compatible = "aspeed,ast2600-i3c-global", "simple-mfd", "syscon";
+		resets = <&syscon ASPEED_RESET_I3C>;
+		reg = <0x0 0x1000>;
+	};
+
+	i3c0: i3c@2000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x2000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c1_default>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 0>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c1: i3c@3000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x3000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C1CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c2_default>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 1>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c2: i3c@4000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x4000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C2CLK>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 2>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c3: i3c@5000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x5000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C3CLK>;
+		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 3>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c4: i3c@6000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x6000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C4CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c5_default>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 4>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+
+	i3c5: i3c@7000 {
+		compatible = "aspeed,ast2600-i3c";
+		reg = <0x7000 0x1000>;
+		clocks = <&syscon ASPEED_CLK_GATE_I3C5CLK>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i3c6_default>;
+		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+		aspeed,global-regs = <&i3c_global 5>;
+		status = "disabled";
+
+		i2c-scl-hz = <1000000>;
+		i3c-scl-hz = <2000000>;
+		i3c-od-scl-hi-period-ns = <380>;
+		i3c-od-scl-lo-period-ns = <620>;
+		i3c-pp-scl-hi-period-ns = <250>;
+		i3c-pp-scl-lo-period-ns = <250>;
+		sda-tx-hold-ns = <70>;
+		sda-pullup-ohms = <2000>;
+	};
+};
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
