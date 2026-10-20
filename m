Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5669B606A33E
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YoJle9x9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GRCZDoWf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=h3qhTb1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZIJjhS4EVth5ZxYCGk5BJ/9vucbFv0SocA7b5s2cgs=; b=YoJle9x9GfAiBO
	dXL4ntyY9efpSqFmyta9vbGjbD+p/MwbGMPf/FPFVL0/86QWp/GzqmWtPWtzC27VArBWCMsMb0OEA
	cNp11Irkx5iWweBlyBR3fuu77M+oJRr+FMN+oi5ILy2fd5XX98JYf6GZqvoGkMCLDRlTSOnX0cXgg
	OuuGuqj3zIoF/9X99nYloy3wWzLGOzvYDUEG0KVLF+gGpKrIhjxfaojHhW9Ghcg5MD+p5KjTKGz1c
	sQdDPtxRXEcU5B4DFb6AIl8ii+rahnA/Y3GoHbTD8WGpM9WEmhHWfUseURNLY0ZOUperAe+kY2fbB
	6EBJwDtehNPphsLkJx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xD-00000009H7C-0MWt;
	Tue, 20 Oct 2026 09:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xB-00000009H6V-2Oc6
	for linux-i3c@bombadil.infradead.org;
	Tue, 20 Oct 2026 09:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7iGyiysZaKCBmOuXzYgRBERUHlAa2VJBh2oUOIDJClw=; b=GRCZDoWf/ojZMEJaDI0MguIez2
	BHs6Wm9JSvvtEk+0tCPvLs65ReDmLmZiNpq+dkNC05+qiTdWJazjjKqM3pdZrd5KdzA01gjALuueS
	pW402ysaBPPUCr0MdWtBt1/SUtI31by02X7w85mMRAjwgLsxn/ZpNXe9o/7C33PgdAZP4ALoA8xp1
	Kez4/ENjbp+rCkmy2FlTLQKdwd8kbDEsmsq0VvlDEdFpld6YgFizy51DA6pE6PimarJ34wbn7UnJg
	lz5sRY+ejdTndhlH/C/SZBoc9UO7DGPKzcWMDsyq0BdWKt5zACsfpYEPHhFk0D3lOkRTkXevDs3j8
	o5SjlSow==;
Received: from mail-japanwestazon11010048.outbound.protection.outlook.com ([52.101.228.48] helo=OS0P286CU011.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJ5x3-00000004WAn-2dzt
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJP4vcMoo4/HXXNA2OW0A9lgTwyBIbgKug0qeF/SGBCG5j4hSsW69FpkHzSZFBrZAokkEBxL79JG9vsvwzdRx3GBuhPsDqWA1l2KPzFhLEI3UEdNm2xrmvhZwOwM4P6kXeB6Q6u8RDMMOs5KAaXqg5k3c38gGsyNehN4q9q2esDa802jlAbBcwLkyw1d3efftMxzdZYrRCiqW5tLyTjFC8vMFOMhRA+Q1N2KAA1cGOv3Y1pV0PZ9mhmC0asd86SQtBSZScQchq3R4AsdIWOj6dCJMnnRDTX81/Li4QRh2eAhTnDiSUJrCGlm8mGgKsOkzcAQqKPPB8PZdWf+kBtg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iGyiysZaKCBmOuXzYgRBERUHlAa2VJBh2oUOIDJClw=;
 b=xwad14PZPxG7zTCQxP9DYy3RzTXJFlovDgf8MubFZkidQIRsdHm+wsHCbvi4WbuLHqYuMZTiZRlnKsLCftaX9+Rli6rphmhni1vEVrLs/wrRZVs6wPiozX6zuVRT0xcBXr+3WEGh6P+cZ/ktSdjJJSQlOIIzyC8v2p7lnpNZvgkQE13Pc5NmsobBBjdCeAcyk4pkmzCC8O4VZNjuNcWCC9dsqI3Yxj2CmtnU9oHbEmlfamFBpanMS1RsCfGwoD+jkJF9Pfatg+x+cABWgzagdpX604ivMSnDgwY7r1Og3YRdqyhCo5vRL/QesCkgQIMlhPlXJAcUfgWQ7RmKTqwJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iGyiysZaKCBmOuXzYgRBERUHlAa2VJBh2oUOIDJClw=;
 b=h3qhTb1+wNUMAgr6fs9s+VZm3ecs+owmmGKhqsatAyCAK+nr/samlblNVAcwJITQU46rrFDfMsYRLnkON0MgVT0/HhI/dLp8uMcXb9r4ca/7ZqaNzn70ciVDMa/J9G+fgRg1r8VIDIZxXeucCi8dJCDBEXXC9lA01MiOTpySRUA=
Received: from SY6PR01CA0135.ausprd01.prod.outlook.com (2603:10c6:10:1b9::17)
 by TYWPR01MB11963.jpnprd01.prod.outlook.com (2603:1096:400:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:16:03 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:10c6:10:1b9:cafe::24) by SY6PR01CA0135.outlook.office365.com
 (2603:10c6:10:1b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 09:16:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:16:01 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 1BEEF3000276;
	Tue, 20 Oct 2026 18:15:54 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:15:01 +0100
Subject: [PATCH 7/8] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-7-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=1580;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=tbhxNFUNCKR8ngWpy93hxpyKrC7Wl4u89qQjBTGcwcc=;
 b=Q2kOsYkhBEu6sk6i9sA6/LjrSIyMoZKA6XHuXVfooWr8uQHoIUSHPKVCZzV3GD2wSPTerwiSi
 7iUULGqu/KHDEQr1kxMRoeJk7UvBWV5JuHhM2PO6qHJWOX/WbOnuu+n
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|TYWPR01MB11963:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4b518b-b32f-4393-d2a8-08df2e8ac2c3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|18002099003|22082099003|921020|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: O5q83eGf4adIL6E1YW1OCpVWQm2EhSwCMaRXlYuQsFdUj55yX3v5MrxAlsyCpRDdQOzT1BLCfNEIr0C4KYHrbeNfiKikdGqOtvTN593wIx3rHJMRpPt8lZRNJ8IDBUKdSmTGRIgNlrP5pGn+C0bdgKYFgS/UdwY3f8ZmWcrTNx7InpFAYsUM0Wwh5gisCjq68aQHsiA5wmdYz7LW4LmaNGX5gQZ8le76pPzoNnuTRtoWjGr1NOT+IELHOUUn08Pz26XNp6KHpTdP6EQxhh9CVRgNsWa02tiIOR0vydik8/acurO52Nv6adn9QEErP/zixxbKqkudI/AmC3RrUjsYmBZruEgXSWfqsAu1N5o5p6gWivb2ZRToY61lYwRBEsRVusn41fE79tFEbjWqFiMhUupRTO5krubPgVO+2/aUg0hEa/rlZaKh+rOz8eI4AFR0nrChKeGf/DZONeMPHGA7D4syTqWdX2Tbqknsqrqja4p24pAEOsPOke3pCNB7Pkt7XbIj0cZAow3049aNzvUy+mbCpZc9SZ2Y0NGpyqBFLhdiz/xxAO+jO8HyVfoVNBbcqzDmCk+xa5tZPpX1ig6fHr//9dN9RL0Q5X9XO0EluohsODp9f/VZpOvtEhFVmZ/bCv0zkuaz+DgBv+86Wh/Ea3R5IM8gaWJaXigFJ2YDBfXrprr/dyjTbYhp8D7+/ksPDCNsLkI8S570q7wWemBuGX1keEHaDGT4Zka7ky5Ywedf5Um9tKZt3EJ3itV94h8U
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(18002099003)(22082099003)(921020)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7A5BVJgIwlh69DwIu2lhVyhskFBRN9krweCueaZSfzLQDS2EEE9C8XOezkJUB4LshGMnzdHWqQh8cE9/RXDsolwI9aivKgbwnt8rG09HMbMoG/DUYDLPISMOieaJ6gXQ/Jr0Pl1FR/c4ql7OqQUShYXMVo8Bp91fZK8qwT/9grS/GHtEsXK56uUVqCc/oyb6o650Tq7cd/ZKV/n5QY/kEihLtvnGovxCMaFEM7akhUDE6up4Zd6TP3fyah9URJnh9gY9uSgkOONG4imsMBpeB8Cr5/ok6TW3nUiNPE8nohnStgjWd0Y0HlDyBUs3pg+WTN/lcUXXV5yahZIBzy1kej+5gv497NziW29gfi3WqZIdOM0aTo/lQFzzpunYS9vE6nvoQp0gYv74HgLnzmv7xUrfG1GzcIXlYEZQW4x1EBCyQh586kOHqEo3qZWCpbY+
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:16:01.7380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4b518b-b32f-4393-d2a8-08df2e8ac2c3
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_101612_520798_B3FBBC9A 
X-CRM114-Status: GOOD (  13.66  )
X-Spam-Score: -0.2 (/)
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

The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
pin controller provides a register to select between these two options.
On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
the Renesas RZ/G2L pin controller driver to allow selecting the I3C
power source on RZ/G3L SoC.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f73d273df362..192da9f9a55d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2431,7 +2431,8 @@ static const char * const rzg3l_gpio_names[] = {
 static const u64 r9a08g046_gpio_configs[] = {
 	0x0,
 	0x0,
-	RZG2L_GPIO_PORT_PACK(2, 0x22, PIN_CFG_NF | PIN_CFG_IEN),	/* P2 */
+	RZG2L_GPIO_PORT_PACK(2, 0x22, PIN_CFG_NF | PIN_CFG_IEN |
+				      PIN_CFG_IO_VMC_I3C),		/* P2 */
 	RZG2L_GPIO_PORT_PACK(7, 0x23, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P3 */
 	0x0,
 	RZG2L_GPIO_PORT_PACK(7, 0x25, RZG3L_MPXED_PIN_FUNCS_POC(A, ISO)), /* P5 */
@@ -3933,10 +3934,12 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch = 0x3004,
 		.sd_ch2 = 0x3024,
 		.eth_poc = 0x3010,
+		.i3c_set = 0x301c,
 		.oen = 0x3018,
 		.other_poc = 0x3028,
 	},
 	.masks = {
+		.i3c_set_poc = BIT(2),
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
 		.other_poc_pvdd1833_oth_iso_poc = BIT(1),
 		.other_poc_wdtovf_n_poc = BIT(2),

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
