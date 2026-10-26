Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD8606A332
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Oct 2026 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DsSj4xqy;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HEe6eyoe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8vObCkJcmKOwTYzdAYpyyW0FCLkWHcnUaOIKbNCljDQ=; b=DsSj4xqygd/o4NejJcoViUj1Ws
	fzSEewTckPIggkxkys9MjbxnTA3XmAEiCCHfRvsifuBmd8QP3Wox8EhAPI9cqfMJYT7NJ7Ivt6eqF
	phxtTe7UvWdWmEk3gKfu6kqXPQEw+9mDo8Uu6B0i2cQReJ8HkviXSX3O265Nn9sB+IYjxc7e6Hn7d
	S3sMy/3zU0/DNwSup7L5caGYmtvT8LFXhGdn12vNzetLmdMzZJTUvrSzCVwKfdL4kQLB3DuCxfI4y
	F0HDhWqyC4Vku+mkkaMPZc1LcAnw63i1BHlanb96FGop3xqfp7w5HQgHphd8NriFWGcsEQiDrDd1R
	SgdI1LdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0t-00000002OQP-0UCC;
	Mon, 26 Oct 2026 11:37:15 +0000
Received: from mail-japanwestazon11011030.outbound.protection.outlook.com ([40.107.74.30] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ0q-00000002OPa-3IkO
	for linux-i3c@lists.infradead.org;
	Mon, 26 Oct 2026 11:37:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnhFZ6mDmZ7T7S0joSyoZIYRCBBiYR6mTRezc0PPB4RYqrQ37za34ixYuugsJmzXT9gLkcuPdJHwh0NGLiTNLCmaOZNfcHgzZdJT3Sw+zPS/D46fnb3fKokEoP2w8DpI1f+mEmVRPbNjoWcTonayoLVAGzfutsbD+tvjWhgGwPT54gxtxku2BoiFN3eJaRUuOl7YkxzZ5T7taXSvg3aOBN90s9e+npPRAwpSNc26yrqI0drsIgLZenn4V/qOPAkdsqxnZfHTwOWrBO+JR6sHM7dBRKgvUyaySPh+RvSLaM2iuXxRu576V8Qlk6p9hiuOfzcm7tfKGh0hKpiTovcIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+Hcok3ibP/Nr6yesasTw7qdlqBS1/iaoQdVLT3tpmQ=;
 b=WZt7DthuoZdxor7CZXsuvXQAfz6uiHXUokvaKRp9tixCZe6t7GoloF7Fdd4TQ81+WrxLQPJn6365c8U9OsK15bmOdL496XROqajtT9wtqqGGU++uvtzBz56aQz2ne5e+0Pe9fblFm7cfeUs1DUC3EoCHhYeclso+HXJVUrrqWhBqFb/gpTkUdGh8hSvxgF30KVRAoqguIgm0cW0AoPS1MasfxbnPDAVTDxd7ZQ01vsr1xhWLqBS432te1cHNfntTLkSJcyhwsmZ0N0s1QbrksaJLnf29v0xTFHAvJCz0GexK2URbkEPq0epAhjYCwdcM5tCOATXl0PjyPCOQFdfjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+Hcok3ibP/Nr6yesasTw7qdlqBS1/iaoQdVLT3tpmQ=;
 b=HEe6eyoeI8C6WEktTlDuC1+L+VqT55R61KOeQPutVq7gNNkXxMzf5WvM9txA1XJP7w2M4cG5uJhO1raVV3/OtrpEMuMdPzNjgpTVg41tnd252jHyx5+Ue+sxHQLyGr1vSv7SdNRGaizwnI6CTFeCFmc9duiOYX6KkEYp8kw0qe4=
Received: from TY4P301CA0053.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:36b::17)
 by TYYPR01MB12904.jpnprd01.prod.outlook.com (2603:1096:405:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:36:51 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36b:cafe::16) by TY4P301CA0053.outlook.office365.com
 (2603:1096:405:36b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 11:36:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 11:36:51 +0000
Received: from [192.168.1.82] (unknown [10.226.92.223])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 5B3FC3000253;
	Mon, 26 Oct 2026 20:36:43 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Mon, 26 Oct 2026 11:35:49 +0000
Subject: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793014549; l=1616;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=DItrPelhjziLcs3xqZAHjNF5Y0XTuAjbo39jZtrbEXo=;
 b=4MpzPjDQd1JXEH8wIN21X5p6ypsKhiF58YqcuzRjBtJXrwbgRUEi+7Qm50rggpE45UVGWcsWs
 zKu3It5gjZLAujDVnwTzvq0ygNn5f5809PyQgyhk3ExJdelb6yTBWqN
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|TYYPR01MB12904:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea2f011-4def-4db8-5c44-08df33556db7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|7416014|376014|82310400026|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006|22082099003|18002099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: HCS+s06sjyHghHt3WQmFc/HWDa6ZArn1/3VwrmTD5fgt/XprTdx1PEDKyqVofqbEeztXS7x7elFKJKoJZKPPMKCWhvtZaZVx6BCEqOk8Uf2AytETjnnMix9c3IU0SUgJNX75nfVyhaFYiWBhY0rmQSjQ4+JgW/7MV0MZBUSSybWMU0sS8z5T1rPps9eP7UZ69QKIi66yP+ohC8Txk4YtY1wCfLucQrKjHVsiXLSRXblx0uYD7GGyvGqE9nSS0jnYVQMkeHlV1HDG17az8gaZvYkNuQVOWa1qsGogTrSVfhCik2FU0W/jwPadxSk0quXEVsEI3YLiKHpW8deEF3qF0uxL3DBv8DECmK4bPbPopLbe7lJ/q073cmkLw2nmOCQ5jqi+MvnSXhY8FT8OCPMgy4Pm3OyvdQLMbJnhf9xg8WJ7Bc07z6cB7ntYX5om+xUIPigZvbV3lu1DlPYuqBb9iYwl8ZzkF0230f9y+QHyAIjvVKEVTLF/yUB6GGCEBCESOeQNGmwLhkpxu/+f7vKKur6XVSmzuMqFDw6HGOYThhxRft9HP2XWM873bVkownoVYCtnGSskWUXnPqBoxOESWxlsJH3xF52QjK0TPq/ZktHB9a1n51E8NkGLIIeYCtJE+/W8MPjHRTadanmgYV9z7Yx5hQ2hNsO/g622H0JKlxMnjcB/RFZgBgx3Uf1xyhwqiySwn0hjlFtN5XRjh8X39xMhzqR2MIeli6koV9VtnJatQJUp4OpETrqWkjdDPffx
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(7416014)(376014)(82310400026)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5RZgCaK8E4qGtfwTUJEJ+dsYENtHVbA1UrDvbnI7A6G/wiDzaZs9eLO9AQtdOFBfmpzxo4/GaHrAWN054+MutiLRi76yTtSV1inT1Pkft7sH0hqEKyUZz+tmgbBhh6HJtC+dP8mSpGdMXvdDjSXZlf0m8b4TaYYnMw6DxivIR0gnoJ6OQwfFYEvkskVeZRL0dp5c9QDK3XymH/Juil0XUklwFmC88/y5G2288tv+QZJPYb8IuSlbRlL4bzPQyj6laLUZfcAJvSpQ+bkrZg7Y/B6ij4dGq8miehQyyVtvYT+pIslz6PjUwOM0NBfC2n0+8+eegu77nAgkDK9tUehz09xJdkzHSL7zOoF7Bdn22l9rVNkp9r06WG2pFCIq6Zk5n9zX6RDnfCeN84G6EeiWTm3szXKzaYuc/LdG7xDR7igB1fskQZYzUxZopDhGbNJH
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:36:51.5361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea2f011-4def-4db8-5c44-08df33556db7
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_043712_845107_DFCEA035 
X-CRM114-Status: GOOD (  13.53  )
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

The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
pin controller provides a register to select between these two options.
On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
the Renesas RZ/G2L pin controller driver to allow selecting the I3C
power source on RZ/G3L SoC.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Changes in v2:
 - No changes
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
