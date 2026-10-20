Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BA8606A31D
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xJMqMn0l;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=V2/nNkcg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MHKi+AT+w2xJ0Z483wGIFhrW+/kLUtr0dotAJJZ0Fs=; b=xJMqMn0lJdc85l
	5wWsQ7slMa4hJKMK/Zf+S5ivY0ei6GLa1i+NF5r+/JL31VPQEUPA+njn/WbgqnLapcFAX3DWAFM3l
	mArDAE1Ef0G8MybM+SOJpe73h78Ty1HkYXf5ArpXKnB1Y9Tvffp/gv8vwWMF7gZkpPOESyY4CMwb7
	h4X0ybP+lpPsWIowASj+WMx1sbBA6j9gYOzK4f9SXZUd1eV3wZsKKl6uW9YxE4U+an1PYOfHj/SPr
	rhxiPHjveNHl8fa+wK7cA2qlEDkYTW6i+LaNr1J/Eq+poMbGZYMn2xP5AshNVDYo1jYvZTbXqGXn8
	QTw0nyBZBZs2DTj8UiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wp-00000009H2N-3fiY;
	Tue, 20 Oct 2026 09:15:55 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wn-00000009H0u-1OlL
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:15:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7CRsoSMxEVa0TtUNjFnsNubNzbWKhUx2ZSzgUrveI29QKE6ywHddtqflBTiAxCkY/N9xcHBAioDOcc5WH2T9iJyg+xRltcekXIK/ELSg/XUuSbKqtu+kw3BecAvJSu3ZIFh0QQMMbfzQHa56iUc8iIDYucjUHeHByCw2rIdpS5l99NbG+OOS26Pw1PvAywIVASVoDTtOlIprQ5SxpZB/pb6jZyFAvmru8AEh/RBn0hpvNo3F7TRlIApC1lHUGQCXNOsERQC5hkprFVixu9ptkUdFUh10bYHVlaoNY/NxNO1c3DTZtfdaIHYiPiZbdnCp+N7PzmTzWj9rnj2BhHUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygODenG+il8Xl2UeL9QPC3wJ2r0M5nRiOqHi4p3NBf0=;
 b=JZELQxupN40+w+gAEZ32L9qWBbhoveChQ7SVZBl102nGw0X+Ya9dmEgW3gy3Auz3TFLCdeSrLBjIlNL3k6F5rIWvmK5BJQKpANDEgnwyTOSWM5hBL7zjmGqQ1L/7LazDb1koQqr2gu6odPyg6pv7xw5GDXt13jVKyKkHcOZes4QJm0NUjjkWGhTeCb2uUPWY5aCDeHJhEav21j2jDZrV4RQWWKxhva/DjxnV6Q01s68YoUYI4mJR7P8B3gOY9UYkn100bUwN6QnisNBMGou7Cha6kAtA4H3BJq6MhFqfZaGPVZrpThVAdXd1x6qMTT2y2+baHocSYvTEsJWrcj5Seg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygODenG+il8Xl2UeL9QPC3wJ2r0M5nRiOqHi4p3NBf0=;
 b=V2/nNkcg4OYsaNHWs4Tha/ucBklzyVba0Xg4qOUmcPwBFmA5v0KQoP5uhBJNPdO3xZ8w2WX9py0dVJyORPWcgXZ7iRUKcv7Lj+6OFbY9cK4Joua8Df8dBBeWR6qb9pjjAsXDPpL4ZJ2Xi5Gl9Zs4mmaGp8gIWW+zMV+bogOa9rk=
Received: from PN0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4e::15)
 by TYCPR01MB6833.jpnprd01.prod.outlook.com (2603:1096:400:b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:48 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:c01:4e:cafe::97) by PN0PR01CA0034.outlook.office365.com
 (2603:1096:c01:4e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:15:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:15:47 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id A537A3000278;
	Tue, 20 Oct 2026 18:15:40 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:14:59 +0100
Subject: [PATCH 5/8] clk: renesas: r9a08g046: Add I3C clocks and resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-5-30a47f25e515@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=2140;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=YyMGVhblICNM+qkkhUnRGnUSpv2T3ScdcOceOAwC8iU=;
 b=LX80XZci1rnFlgjoF1by27DatYbhh/nWqtMPMX4juoLa5n/41MieYMs3VRx0H39oiE7f3GFka
 h1PQrnjufIODCiCS5QJW55vG7p78brEdry/WWf4SW1UYQ6pW3StxG30
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TYCPR01MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 4903e5d7-e304-4897-4288-08df2e8aba29
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|23010399003|1800799024|82310400026|261009221227099003|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: 6GKNC+QukUfi8xj2XIP4/+sr+2/dY5bPnUBKVlUkOodXonZSI7Lf2QUtbNxVnHxwv/iHNICiAVFeLUJs3MrQJ8/5t85eN91I07257EyHpAIhaANsAjRxQspt46//FRJ/c4Op61vjkVmp1iQHsUvSHdNMHWNpbXQsT8tkUVlWt1rkivMHF1SHbAeW1rXzgO2Ga3OicNF9C8RqKsbc7D2cCJojd0Rwl4zDG8ilKbgZeGToj2c6x+F8Mmgij3MD5o0MALk7Wvh2NlydzDCkWZADmR5WXhyJk7bKclvcG2++vB8KHBJrQOLa+PTzKH0btdi8JNTc1T8Fuw27PewqmAKUSNVtkSwFRLrt8eP+NfrL8Xg5tNKWd04yEuHThwlhCrC4yvcgEz1+sbfCiZJrTgZRDVDBd2OKNW40BdVzI2RudpAbh6BFExt3KOzAFzwy9+ZOJ97HjK4SeNClotQkLyzEhhh7T3tJjE8RM7RCp3ez828y1zsRswx0bNGT5TdZYleJlo6ZQekr+GS22zuArzMgpq/R3HBMrFHoKq5Gnn6YJiIw2Vfqw0G4XvrBInS1a22ljBLhryqnES3lWngbJuzMtQqEZoLVs5S/SDB9n5CoB3XzXyCNDzuVra8AR33KywqseUt5kH9UQIN4UjEHsGIa2WdkodTfclV1TsqAQXpl2rE1tUQyjs0nk+cLDlj/qpb/jYUPDa2P4Fo6jXMvCqsseq9VtZfTUXJIaLcF9F2f/rSyd/9m9I5zfWv81aKbGObk
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(23010399003)(1800799024)(82310400026)(261009221227099003)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5NqpTaQuJQacz/2ytNkAsSQuiSNuEzlhao0hxSUb96302Hn1y4E/dqV4EXJRVQ2+6Uw/HcL6hihXV9v9qAItfX/zgva6N4b/onJRA+6l4uaxcwOkrnRdinAhYKxkN3tEGKAwARd8VfOFpx0Q5yXncZ7jW70T3X6Rbn2yIa5X2Q9znm3z5vk8wkYi4DGhe8Y0C4wcW+P4kFCy8x0yEFRPYikiDf2eijN2b4uVdSrWROzqR0LZVZjg34lTx4H79nJ/w7qjlVozobZu6R2CbLGoUfR64Udk0U3EPMgRDFkxbeaw2XEEkIfL9meE90sNm+GH/5dNUHRFjVcv+4nnHt28r0ae39c0kBKyrDYwNx8CSWCqnLOIo3PrQEek2SCfHjsIun117tJMeu5Fw8Bx7PdD/ZTx0R+tEs4m/kpplCdoN8RB5Ps4LA3FECh8qpT9TNU0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:47.3024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4903e5d7-e304-4897-4288-08df2e8aba29
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_021553_381540_913401AB 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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
