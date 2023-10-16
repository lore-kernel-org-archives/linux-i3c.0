Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DBCCDB482
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Oct 2023 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZOZ4lz25KhmU/c/qmtHmwjznN0CTc2le7tcGZSpwcs=; b=TPd4WEWTEQG3jV
	onro9p/oGw8te4LGIhbM2wTVSLwvgT1G9CHDr1oDcKO/taZzMvLvPtAOWyM8yLoGrcclP4KemOJiJ
	oM9jWemYQ88lZxlhE9VP1YRSCgOAnGysSsk/lnMaXnNdmiuc34MHwgoKiILj77O78RXEdrulRTPqD
	TMTlEtfazEJcD60LMHwe7GwOonlILZVxv1wFM3+PSjTJzgdx59+TzT+FC/ZjD0kkuI8vSuyCCM9aT
	zSWzzBYN6E3oQw6uB4/DhhFhYGfJYFWWnMZovdPDIr43Aj6V4j8s0BvHoTciS9lEG5gXbhYd1JP1a
	lEfZAS+45ivvXoK4A0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPT4-009yAR-1E;
	Mon, 16 Oct 2023 15:25:18 +0000
Received: from mail-db3eur04on0600.outbound.protection.outlook.com ([2a01:111:f400:fe0c::600] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPT1-009y8x-2w;
	Mon, 16 Oct 2023 15:25:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqCJ4beJLL9Wih5Se+kT57zWPKDw4ObxcnEQiZRvmAsLqSdrfwXtY6X6MoUyJdymGoisOq8PrvGJuJYYr8YID33f4GBP1X89vKPsg0wgLP82p99dXhk0GMDvwNMwWuVF2vIcFuQE557KbPChVZd3n+IxrJwZocHa+nNimKDFmc03/nOCA/Y6b9LjEBxS8V4wFFaS2+xAACnQfRDl5out4gcEo2l59Kq8zvJI3MPtiF0fxHUkEYpW0FfZG1WH5lC1X9gbQajEy0njuez1t1qTpSpfTTkL/paQCTN2KmNrLnjVv1oUkmNUQXTh6LXg6ZqmDArqRUsR04YZ+baNyZkZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU5UxsGVuxW2kAmnkRY4NXylyfszEUhsk18zodLTk0Y=;
 b=Y5RvP8Z5N7aKsVkCGBHgU66j6ALaNEDCHBjMU4RSuMm0KT7U/GnFuQK0GUwUEvUVbTMzgeZPJYY3QCkcRNt4p5BK/d4NcX7RWoUk0j7CPl//WrC/3ts/Vz0eduo+4/S0+wimcShe7sve/PDm3+KOSzKgi8Ru1f9Xw0lUxAiLlmo1w0NQPzj2rwkQBztCQq2o/dSDD0Shg8I3DDE8qZZQdVo/G8PU2RjgbEbV3+PE3vQ674w2SAWa/jZ4Pii2Cr1mWqopBRa6Q+aGkpJXMv6cafd+8FxAmMDlv/j8aApq86JNuwjy1fIExjKHHdGM9gz2ETUPjSRs+grrsyJ5M15XoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU5UxsGVuxW2kAmnkRY4NXylyfszEUhsk18zodLTk0Y=;
 b=GJ+JySdhtOOkGqG0N7jLuc2RGnwe9SQsDlHHP1I/ntKrC3oL4CG5Pe/c50fWG53ru86bMAV1JZWiXAPgV6FAD1b8NpuHdwjlk62fK8Rj/6QYHcZM1M4qNm7suoSeGyD9zYQ8vsxuaeHBguCbUwnGqO4RVV0+L7gGt45Sgrn4ITA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:25:12 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:25:12 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	joe@perches.com,
	peng.fan@nxp.com,
	alexander.stein@ew.tq-group.com,
	haibo.chen@nxp.com,
	ping.bai@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com,
	sherry.sun@nxp.com,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Date: Mon, 16 Oct 2023 11:24:50 -0400
Message-Id: <20231016152450.2850498-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016152450.2850498-1-Frank.Li@nxp.com>
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 65559ff4-2093-4862-c3dd-08dbce5c172f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tU+6fTIcP/Utm9DT3MNzeGAsi1wd5AvGTndcmNXHqUs5QtBVhvI4rNhCMuuuYWgss2zEFKh2VhL/57hbGW3mgxaa58p8AZzudhtPdrzom7yNRx29ErKNCWVBOEVt9t6wGoEkaJJLvl7FV9Y/uT4CbhZ1FwJsKOpd7LSDSCMipO+hHYmZQwPzCIHUcw03mOZgXRYPueWGYPiZ+V2cXVEzB71rM9XEFxLg1aV4mwxUIEZOcKtyV7qkTQ8Anu1hRy8x49blgCzf/kM+ybLMSBrhvgnmQ/+BrzNfiiesN6lPwok3YgT2Aa8mHjwQRJR0xTyKQJeEMD2yCz5v2I5ek3n1Y0jeoQKPxNX8LgZplJPsFirMvXrrUXZb9zVxh9EGDJSBUurbRg16/Eee6hLQUAdNDOOBSiZAqB6+54G2Dnc2mCrivche+/EFnOH6uA2UpFYGPejYzOeeWZkNXnn+XyWk6Jeeb9hgH0+dlfoTp2kMowGMmnZI80TLvPnpNCubCiN4pnH+KH7D42Rw0awzhFAqfIBjDWIQcKGn/O3FNjlZYDXFDkqUeW2N7llE3CIfvBz4zCjZutaU6cgW/7ECI+LAbq6yZA3ef+tU4wcX304qeHftQN4kg6dWmIxDACVu08bZpuBZECaXId/Z2CaGjJXblVEXANw74LE9wDtN5ohoOJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(7416002)(2906002)(5660300002)(41300700001)(8936002)(8676002)(316002)(66946007)(478600001)(6486002)(6506007)(6666004)(36756003)(52116002)(38350700005)(83380400001)(66556008)(66476007)(26005)(1076003)(86362001)(38100700002)(6512007)(2616005)(921005)(138113003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+P97d5s6VbhfRm/qan1UMpkpiTcuPko8WbyG+ol7deb/yRcZoUvqf1i3fwcU?=
 =?us-ascii?Q?AobK2dOTBV+d8Je4WC/iZfz0bjtoOO4fchoCWIP9KTQlKcvM0wdutnURMU9h?=
 =?us-ascii?Q?TiSikiNzHCjIf9qPorTkyPHBqtuG895YxspXCrjQN+uHZAaDMDmXlnPGEcsP?=
 =?us-ascii?Q?nq0DPtwh4GRjasHGnEmjwFQOOnEB3uCLs9IHmNSbPGt33KV+qFcXWo2BXlX0?=
 =?us-ascii?Q?rYTonBEwNEp8zADLiKAyyfBQCwVGAjE9ujW2l6BKt2E5VGYyR2Zsm8mp9f6N?=
 =?us-ascii?Q?ABnnf129MRxLKxu0nlyXzJTwMA6GH/B46mgmX/nwr5J/+C1W6BHEf1j6IUck?=
 =?us-ascii?Q?LRzdP4c2zkrbGVFajT9liLVMAFnPCExogdb890srimBpIhqWASawBoM9ef+C?=
 =?us-ascii?Q?Wb0odP6Mk24SVbymQYjwwJNLbwsx77fRQpAU7o3ygIDAZTbQvTspCUsrsUAx?=
 =?us-ascii?Q?xst99My/HfIsvR+iZouBaPN7QQ5xx1YL6M3m2v8EDEF57lGMAV5psIraB2n3?=
 =?us-ascii?Q?JVFj1QWu3j8cA6676dAt2bJdN2Aha8cuzhI9qzmyh6Pp51F+OGimnKeh9/mP?=
 =?us-ascii?Q?JwLZJx9TdknSMNUyLXzj6mJxXRmW9UO1m+rXaVGcmYiyoRgkMasvBDd7RYfz?=
 =?us-ascii?Q?l/Fv62B8BU8EaFWPj9DImzCQXRXs2aHy0OiQ0tn3lSz8Y0xLiEWzKcpHIS7H?=
 =?us-ascii?Q?Lv/i/jQ0+tVn9Zb+odLmEX6BTfN2BQGw1EfR4HlzI74UfSDhsW2Lb2Wnt40g?=
 =?us-ascii?Q?EAbCgBdnfjvXVbm5nDHkmFARODR+4OQM74cSyXR0wSTBUwQWfCOcmcTQWi6s?=
 =?us-ascii?Q?xdk7ytSPZhwkLWZ+OKxH2NzgK6kzpKMG7Boq0vzdCLdy9UkvFrLEkGW9h4Z9?=
 =?us-ascii?Q?MCOMMfXYCWiu6eYR7e1hsoKoHIM0qEO7L8Z7L60SXuZ4ypoRFxR73jqa/Ygg?=
 =?us-ascii?Q?cEsThQILt/k2vZTzpxBpq7m5vsLEz5BfoawoUuanPRj3xRKHBw+or9Cn5FuQ?=
 =?us-ascii?Q?xjU9JkiJItepSqgFoue7E4cjNxIWuaQzteVgN4oSzHD5EV9iHancTavAWkWo?=
 =?us-ascii?Q?AlafTKRitzas7FOpP3nbj15vWEI8gL+2DWLKqp9ByIRYhpEno0nkVolK2OJ0?=
 =?us-ascii?Q?EM/70taQaFjwx0XXSyo7M7RkjLydmL7+Z/X0NeK+8PJGRrDSrkEtbS4nKM1h?=
 =?us-ascii?Q?OREy+yjF/J1IhESzG5l6XAUHxxZpz3jZZtTxsWx1y2MHXuSwiZdXTlbx5iBx?=
 =?us-ascii?Q?ed+5dAIY8p6YPXZULy+ub5SRqjVxb0z+s4pXfDeaT5gjMldgPn5S7XnD105J?=
 =?us-ascii?Q?ZXk9pHql7qYecc6BjEjJWz4c6+ACoL7SSvVAgpotf8Vrw6GIBlHrXE0QCDkB?=
 =?us-ascii?Q?DGMSV+wLrx+HAIlPvIzsaa4UP1r/J2+5CoM5MSpJCeEAYnTf0ZzAKgOpXPJw?=
 =?us-ascii?Q?7k4E9P/heCTIeEqltSzj8+qRUTxt9S1szq38hwK7USJHTWA5mpdQXcPqo2pa?=
 =?us-ascii?Q?bnE6XHcuFBruMbQqsEoW+DFlsJN97i2mN+ZqTFnO66ScKF1sIrYEMManmt5y?=
 =?us-ascii?Q?tpsgq29soF/aRS27d1NC2Qs/sG5UkShlIqXCJAtN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65559ff4-2093-4862-c3dd-08dbce5c172f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:25:12.5927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqZKQB7tr0+83fObvzjKUoDs/ZYEwJgARTmLtPavxe6EMSBuid5b04Br/T3i08sJi1U2ENWH0c0jL15EHj56kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_082515_954830_30F2E48B 
X-CRM114-Status: UNSURE (   8.64  )
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

Add I3C1 and I3C2.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 6f85a05ee7e1..4d9ed0b32853 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -242,6 +242,19 @@ tpm2: pwm@44320000 {
 				status = "disabled";
 			};
 
+			i3c1: i3c-master@44330000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0x44330000 0x10000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&clk IMX93_CLK_BUS_AON>,
+					 <&clk IMX93_CLK_I3C1_GATE>,
+					 <&clk IMX93_CLK_I3C1_SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c1: i2c@44340000 {
 				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x44340000 0x10000>;
@@ -496,6 +509,19 @@ tpm6: pwm@42510000 {
 				status = "disabled";
 			};
 
+			i3c2: i3c-master@42520000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0x42520000 0x10000>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
+					 <&clk IMX93_CLK_I3C2_GATE>,
+					 <&clk IMX93_CLK_I3C2_SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c3: i2c@42530000 {
 				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x42530000 0x10000>;
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
