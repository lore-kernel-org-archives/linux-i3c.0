Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CB606A33A
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Oct 2026 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U5tKr6FZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=V7cOq71H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4cFandipkBaKN4sP9+YU0H7agM6oR8C+OYW29RE4mHk=; b=U5tKr6FZ/TeXNMzcQn0tWKXy6V
	1YSOwTgaXjjah4oDCTyV4vrbwmNjxBPwLsiqoGdv/fDkyBB/+V26BCa5FUgVKS+bMm+w0zTKVyC0w
	xkXP4WdYlTYM3t4SjPudZm4pT1wYTQAapZjfV7Nza8rRb0SfPyvO1DjJuGG7mRQjZc8ESOJLT27Cs
	xB3tH124h6/ZRqKpjyE2IVL+P0AmR49zMoCVJiZ8XMlnBT+DudeGUTaVzKBp94bQCAc10jZht+MWe
	DAZhNUrzsCIpaAQpqZiDY3y8FA5c7Ahqkqc24r0tcwFsGjS9uFf7PIgfHSkeApTRUWxXSilrMOP8D
	/rP2gf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0N-00000002OKn-3kkj;
	Mon, 26 Oct 2026 11:36:43 +0000
Received: from mail-japaneastazon11010027.outbound.protection.outlook.com ([52.101.229.27] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0K-00000002OKC-3ynq
	for linux-i3c@lists.infradead.org;
	Mon, 26 Oct 2026 11:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvpcGXA1WEH8zk7Hg/hBvery6R99NCUgPMHM93wRp19RVYJwmvFukZqtzrNJWODnYsIGV+bbXZHNCzYsHajn9r09qOiqTGaFtIAb9fMLSPtRRPxRRvisp7DKrALsDth1a0SelPCgaN2aig/J+shS4CPX0CJrdbnFwGrgtHs9x18NIQw3sdjvoosNIi/R5BjH045SguQnqAtBJFpjfIUqwK2MneMXWQkFPnrZU99f8NTqjINZpS1MA2LErIExvSlv0ZJoOToKW/OU+AIf1vPEdtFfM/am8liL6U+QRAuICPbl3z1PwngU9DeZgvriSl2MyaH4wa0Gg5DTWdKmTnouSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LisQM9kfmvL7IObli87gxOFnt+77bFWJLJFuFp7+FyY=;
 b=GIMZ/8Yop8ZEwSEPFYubyecmR7/AUGWXX6ydK0nr17QX9xxSnwS61IfoYhlkei3785uUKQpCqQhR1mAesqyL6SIXgQSIGyMowlMkmcdsoqPQ86Hf+EEdhCd0r97OYANcNO/5aXMqSvT0k2HGeXxAUM1qLEkmrNw6ahAvlQzECm0gT8uY02ZwrJXSQV/5qb8MWh0jiKLr7+DxPiZhQ9K/pzfULVyj3y7+IO8T9KX2znCFefCy6H7ttfR6DeZLqdxiJ+eXSs85YqL4ldb86vpapxivmQNOCo7XxADifyItkxW0h2N6YTc85xcn7JnafwRZmZERYxYKGPCxpQVdw8so7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LisQM9kfmvL7IObli87gxOFnt+77bFWJLJFuFp7+FyY=;
 b=V7cOq71HWJWwfZx68Btj9nHaKLFktBV18Al7NgDUYR0QdBE4vxgwU+ysOXuKCol0LG4rjp2gKf6SA4veFPxHYqIED8gTgagy0japwKOeYT7b9mHfTW1+k26HoHNUcJW3Nez/wnR8AcC5LlA0BYlsJEaIQmBJHggjJZfwhvZv7ig=
Received: from OS3PR01CA0064.jpnprd01.prod.outlook.com (2603:1096:604:de::15)
 by TYRPR01MB13572.jpnprd01.prod.outlook.com (2603:1096:405:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:36:34 +0000
Received: from OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:de:cafe::18) by OS3PR01CA0064.outlook.office365.com
 (2603:1096:604:de::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 11:36:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003B.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 11:36:34 +0000
Received: from [192.168.1.82] (unknown [10.226.92.223])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id BA4553000253;
	Mon, 26 Oct 2026 20:36:25 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Mon, 26 Oct 2026 11:35:47 +0000
Subject: [PATCH v2 4/7] clk: renesas: r9a08g046: Add I3C clocks and resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793014549; l=2176;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=QTzq+MSIW0idzRA36XujOyrghgo/dqMcKOLwy44n5og=;
 b=s0sjIiGZG93QYoZSz2ec6gi5QrNNbSWVwi6M9k8QVjY43mCihKrJ4uw7ROhEMQqSsJ1N9xa/3
 orHMaJx6ZyKAdT8Wp04xXV9ppJ85Pi4XqiPDQOXSnDh82+7ffR1m0IL
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003B:EE_|TYRPR01MB13572:EE_
X-MS-Office365-Filtering-Correlation-Id: a71e1fe7-6832-4cc1-2d90-08df3355634a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|1800799024|36860700016|921020|11063799006|56012099006|261021135927099003|261021121427099003|261021130227099003|261021133027099003|261022115727099003|261022105027099003|261022075727099003|261021123027099003|261022113327099003|261009223027099003|261009221227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K27/JFunEFItxlH+KiDMbVGXWxFT4SONBD1/lyoCu0Miu+ab5sk/C9oUyA+Dh8RqCEgmi3TUZDxJm++Nq1U2uOf+5DGX+C/6/QknuEnrsZ4mPWDUI1o/Y8Wwi+KORQ+7g1C7ipQw2A7RLrmSFy2Y2FjYwDaruv+1c9S/Ro02mudQyiheQktY9mlyxlDH8Dy8edacdmKlqUp4fImu4BUKYjOJ+RJHHEN7Bb1OY1Yg8NTh4Rbqx788ieoWuM6j5d1Sa6hp+gU6Z85UZT9hdOTJKU/XR1cqoiE7Kjiq6Dufw1cwD8q6NBN+ncaZkG5hZCSUb5H0b+SJvg+cBQMzY7JrW2+/DafROGjsrwFpz55gvy4ghF1GfRBI9SGfulWofE9s0rkFYjwWlZsx+d3j9NbZyb1ssr+ldivLW1LLzKSmBKqXc+l09NXPKGMcLDDYRf4zj2xgwSE2h01ntm2L5rzzH5Xm85h3MAPiXXlYV8kupR83wFrdEcP7Ri42E3S0IPz23d7rfFfCkgMQa48PYU9lp3AJlUfEm+3cx9/rFplJNBbysQcIa1uoYEe4OQVirvH8sfbNPXx2wLEQETmrGY4BF3EeNT+CLZ/IJ7RsWosN2IQkWpEfGyi+PtGYL1lLUUQwqok6njSud8nky/QqkiVBib04YnbCbLf4bcpdWtA0XyetDdf/6mPclI5Ur9nq6lu23ETPyCBysItEGqL6LUSqmk2EcE3xzzZObOdGAWQYw3Zafafhf59T9aKx1ZFT8vFG
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(921020)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261021130227099003)(261021133027099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261022113327099003)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OFNAkJ458pupumYGDkuepJ0CGlv2DG21iXfRarkoGn+ALIPF3JNedNSCJchcqO+FtAcj0hBSB9C0QRNlBkOQiOb139A39VXnAtm4vcLc+z9UdREzuhpJH9CmvQmLzJYZDPqbVvu0NV/1FJmK2HjxChrvd1fRGuHeXIY06ELdzQaapRNOXOwRHWumyAdbrxOXS9vhPjSrmc9A7ESJuYyyGe4Xzy99vJwL/6V8OtyD0lt7ga0s5wOWSFVH2iVmMZqofodMxFYGyyjm3hDv7UY10wBqC9IpIpJbVQN+n1PPESRgGh74oUwXwsWQMlHNmsaU7QJnDuIBrjhGnqS+F4h6z1QEzl+KEBXFjqDEcls5H2YYZPhl/wCduAmkXTRuk72G4On7MSH5lIFKOpJS9hEnN9RbWAvL5KaHVjHvCMaO/NsRnR0kMKvGhWf1bVNg+Tlw
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:36:34.0312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71e1fe7-6832-4cc1-2d90-08df3355634a
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_043641_015366_BFDABADD 
X-CRM114-Status: GOOD (  10.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the P5 fixed clock, the module clocks for the I3C Bus Interface
(pclk, tclk), along with the corresponding module resets (presetn,
tresetn) on the RZ/G3L (R9A08G046) SoC.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Changes in v2:
 - No changes
---
 drivers/clk/renesas/r9a08g046-cpg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index b58057db9c4d..3833f88125ea 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -340,6 +340,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_4_128, 0, 0, 0, NULL),
 	DEF_FIXED("P4", R9A08G046_CLK_P4, CLK_PLL2_DIV2, 1, 5),
 	DEF_FIXED(".p4_div2", CLK_P4_DIV2, R9A08G046_CLK_P4, 1, 2),
+	DEF_FIXED("P5", R9A08G046_CLK_P5, CLK_PLL2_DIV2, 1, 4),
 	DEF_FIXED("P8", R9A08G046_CLK_P8, CLK_PLL3_DIV2, 1, 8),
 	DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
 		    dtable_2_16, 0, 100000000UL, 0, NULL),
@@ -581,6 +582,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(10))),
 	DEF_MOD("pci_clk_pmu",		R9A08G046_PCI_CLK_PMU, R9A08G046_CLK_P1, 0x608, 2,
 					MSTOP(BUS_PERI_COM, BIT(10))),
+	DEF_MOD("i3c_pclk",		R9A08G046_I3C_PCLK, R9A08G046_CLK_P20, 0x610, 0,
+					MSTOP(BUS_MCPU3, BIT(10))),
+	DEF_MOD("i3c_tclk",		R9A08G046_I3C_TCLK, R9A08G046_CLK_P5, 0x610, 1,
+					MSTOP(BUS_MCPU3, BIT(10))),
 	DEF_MOD("rsci0_pclk",		R9A08G046_RSCI0_PCLK, R9A08G046_CLK_P0, 0x618, 0,
 					MSTOP(BUS_MCPU2, BIT(7))),
 	DEF_MOD("rsci1_pclk",		R9A08G046_RSCI1_PCLK, R9A08G046_CLK_P0, 0x618, 1,
@@ -662,6 +667,8 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ADC1_ADRST_N, 0x8a8, 3),
 	DEF_RST(R9A08G046_TSU_PRESETN, 0x8ac, 0),
 	DEF_RST(R9A08G046_PCI_ARESETN, 0x908, 0),
+	DEF_RST(R9A08G046_I3C_PRESETN, 0x910, 0),
+	DEF_RST(R9A08G046_I3C_TRESETN, 0x910, 1),
 	DEF_RST(R9A08G046_RSCI0_PRESETN, 0x918, 0),
 	DEF_RST(R9A08G046_RSCI1_PRESETN, 0x918, 1),
 	DEF_RST(R9A08G046_RSCI2_PRESETN, 0x918, 2),

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
