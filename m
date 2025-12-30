Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6127CE95A6C
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Dec 2025 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYcij6prOxDxJvfdGirjp+Ix3McparVWZEVUnhIicoI=; b=aQgu6g2VjDHXMc
	jh7CdxXmToPDo8Z+oQL7etvkzyeUyuo3JzAEQTbPRSzgO5M1C2IQ0+a2APMsCWBzIZRsWxjFzi62z
	rmlm9pmtnqrhuAq8+/0aT2Z7Ns9bmOs1+9Oj3K9qDdu2PaTSAfQxDca5ryBOM8PUy9Ep55cRHldYI
	ZIItxfdS2nwpZPOHi0olrm4A6Wp0Zj4n9O9ZEe4ehgsz2orKC/GL0UDWoFkdG8l9GRwFPOLG2cUiC
	0OaNrblgf1GVcVJcoJHZjfRFVexRkloN7vQdSo6DTv602GT7bvBQR4aEou/zhxpEsGlUhPyP6qADA
	AbAMvx01toAyHli+7gfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaX9k-00000004ixc-1tao;
	Tue, 30 Dec 2025 10:40:51 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaX9g-00000004ivu-3cRd
	for linux-i3c@lists.infradead.org;
	Tue, 30 Dec 2025 10:40:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMKv+ZT9eysgYVTBLoVY9SZbLOC02cWuj9xA7NPWaiihjJvQipD76+rz6aEkWcSttlk1Uhi01W+XApow2f3mLWZ3EQ1jBmo8hWf4iSjMCllzruXOLzPGv/oK1MtSxeEepbnvsX7LvcQAEzsoXKQSc6bxM0DRJ92yYi5bSE7u9L4WFcAZSinSI5Le+/8SwqiLAVrCUiCUS6Og/lASWhA73/bA2hiQdoM09vJOlvTBPcbN5OQwQNkytmj+wFUlgeqahFsCZ/QobIlPEohOA6Yha93A0E6NnuPtY6u+IZ4uJpCXiRHicl/xRtgsbgtQ/kZwefbFLr6xaoZyV9YcnycoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10s4t7+RtFTAcdQODx67YIZO/ZPHbH3TmNS9M9l8BLU=;
 b=B4tUcEKXVKbkKdkJCdCGD/K9gNks//3KM2HS881ky7aI2QsxHCPvHOA7iQESTM7V2rhf/Pp2S23TsQBJRYiJyqY/5qyvSsglcyi9Hkll0RZBQDXtk4WyFJoxAgzub1dF1UU9jdUO8JSlEszU7forsU4dYuIZ1/IxCk8/B/fM3KXJvxgELza0S/poZUwl8uRqDdkNok4Gq1qsy01L5sDazB3IyOAjmLIrQGZv9dyl4KoEIBfuUdVS0zKDfsd3UdqyutLZjC1CiIV969MA8yBaBOcZR3mqg6DzFWTcb5U8fFWbe/8HYP1+QLuAchL4R46qTpur2L0oxVF9Uhdcnmy7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10s4t7+RtFTAcdQODx67YIZO/ZPHbH3TmNS9M9l8BLU=;
 b=mwCXGmF86YcWAzHvZA7Fe1Z0//6tmOajJOEmdUmuxSm/N1uGYZLmyUQDW5evqzPYbkLjbQbKS9Uhkpb8NELd+G5kaCmcPi2wmrQoDyGTCQ650e+vTsVFmqE0FMrESMUnDF3CfhRcEIyUEEX4pQKXO0KXiuNLd+wJVmYsvX2uZzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB13563.jpnprd01.prod.outlook.com (2603:1096:405:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 10:40:22 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 10:40:22 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
Date: Tue, 30 Dec 2025 11:39:36 +0100
Message-ID: <29d6558c381b726f53c22088a5a2ad5adf9fe142.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY7PR01MB13563:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb91ebd-820a-44d4-01f1-08de478fd56d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0btH1Zu6BzDONpmx5ySbiZ6BSTH7GNy1ilM7Dyfuvsxw4goO4Zx54YCLNFrc?=
 =?us-ascii?Q?zGJrfccxTkSQgha5VZiSZU3suw8o3cmc7tyESoAd8Rg9XT084j8GhphvBOWk?=
 =?us-ascii?Q?Az1R3K4TAwbvmmrVYdEPFrE3u58Nf+xqqp+B+fClI2h4c6GCAXdHqSPDfMer?=
 =?us-ascii?Q?I0C26BkjEDUyhtOiIkqvz92t37MX0jV8EF57/K21uzfGwwhSji7N1HpHB5bv?=
 =?us-ascii?Q?5Bgon3SjwwhqnpSoLdMo7sOTQjXVJ9t0gIwGvVlZZ9S22/s4G9Oxxw+6RUno?=
 =?us-ascii?Q?yHqWMcshhuZ3WjEPmVW4dfKIV8Vo/VQPhq4mhsqgOCSy3TaAubUUo7e/DtoZ?=
 =?us-ascii?Q?4T/rmsKtczV7dmMYz/uEI2R3EkxFIfPtsOurKXBcIHVYv4/SttdUG0vDeoGO?=
 =?us-ascii?Q?rZNPADx9PCgiAnczTgg6Cq0HEzRDIxvHFqvZurS55ojd75il3sOiEawNbCa5?=
 =?us-ascii?Q?Ro5TDcFA61OyvF4BvugxPhc+fDFPq2KXpLLzHthndHLNZVy/tkmAWNEcotW8?=
 =?us-ascii?Q?QqeBxH5h0csQVeApOjZRaCjxruqwkEq01XPl9r/xBIaWTd9ed4f+eEsZKTZh?=
 =?us-ascii?Q?DgtH+tp2yv3C8g8PmK7DV2CJH3OQ22FLaIUsUkEIh11jfrb8hNCFy8NHwhOu?=
 =?us-ascii?Q?4jab5EP25aN5cQLtic3a1mK6Xc5/GYuGYO3B9kW554hO82lNdHpjKWNArXNs?=
 =?us-ascii?Q?D85cu6HrtqU30jHMyHju71v6H6+NibGQAX1mKHSjkNCRmgdG772yB8VF5MfS?=
 =?us-ascii?Q?CLBpz/GvMM5l6AmOaTfnCmdHhPh/A3W2laK4FXOfyXSKCkpEF6myIiogunAQ?=
 =?us-ascii?Q?3oYOYNhR829qkdzfHcm1lO4XTDbrnvy6aktucHsPncgYSyst97mfrwD7b5z4?=
 =?us-ascii?Q?v+kEzbvkoOTf/G3yTlgJmE9Omqfngep006VmNHOckxVXs1oLoTcUDEYkivug?=
 =?us-ascii?Q?dyqfvJgFCyzp8hl0V1XDkYXrWhmZnCNOgq1iVvl2goVB9C7E95TcNmYI9hXE?=
 =?us-ascii?Q?s4lM2R928K9vOfTMg2JYpY+OtEcRWugF9jNqHoYv9hUePvb53gjc0gjde4Fe?=
 =?us-ascii?Q?iyeXQCnvCwXQrTVD4f5gzww/HNYcIxOHJZXeD6swfzrPXjEiaXtwL6h1Xgt8?=
 =?us-ascii?Q?86Mxa+0tHzJfG1ZQPB/7tVSSYJJju+TEVt/zsRr5Ks/twROhGcoGcmZyMig1?=
 =?us-ascii?Q?3VxwlaYntqM4ZUKE5PinboHO+wm1j0BDDxyiKvT24zSAGlaljcQliEKzn/ha?=
 =?us-ascii?Q?HH0yVkTQz0K+v24+YeY8j7yJpIL1AXWjRn4mZoJTuJKEB8sigQvCOEYwekQG?=
 =?us-ascii?Q?NF34y2g7M42qOnEqFDqjK2cm1O2X4oLs3NCA0zyN0GLEITAOjF1QsfI0uTIM?=
 =?us-ascii?Q?9Af1qQgk2CGulz2B6PWXeT7R9Uypv5bC8oQQMj8vhg1/PMzimGnHQJpLkuTT?=
 =?us-ascii?Q?yXup8UvjImgAM8SBaLE4ZKPbpkgQhU14vBD6ff9Oh3yoM8DJrWJ3rk22v6+d?=
 =?us-ascii?Q?HvFyMoNUj6iHyTL/zx6qebRz67wvF6VHbr0t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xfrlXhvthsPRqLP1WNk3JzI5l/StuDRmI26YbaMQgNtbkJoLF4COOkViDlnK?=
 =?us-ascii?Q?OX2hWK+R3MpnhuT9mhurhmhKNOUJ//xwjpZP+kCXXTH1hNMZywX209pq5KZX?=
 =?us-ascii?Q?cpnyd4mANVVQvuyvbkAeg2Jzt1iF0DbCMRM7q7FmLtPbTo7T/QBjljcmDuVb?=
 =?us-ascii?Q?mUeZx0fJtvgui160e7osMzx0MH9vjUG+0E8kGEBsN0cJFsfRn3DdXUemLNFN?=
 =?us-ascii?Q?9/KtaXtZB14qnJgh9iJ7xHSS0773S8ZymDXLKBWe4dTJT8FJCh0cPWwYeG/x?=
 =?us-ascii?Q?0aR43lZ6R1I6hCQse0iWE6M6W37PVCv8zZCXh0i4OyWa7UJQ3S6oI+5Upy2e?=
 =?us-ascii?Q?9RRepf8s79iI4gk1OTvbPoVbMuIirZa4H/o1pZGKOOalJL8QzZKfywKJWGwM?=
 =?us-ascii?Q?1uxIln1ng6PFN8JUTTntUricnk3NNzWSZHnnpckQcnhMMNthIJb3rRi80nsQ?=
 =?us-ascii?Q?I58KTn2+zi5r4HzZhsI2csmmZUlJNbNhcVOz+hNPaeYXys/RH4gwFw1fl2bW?=
 =?us-ascii?Q?OY+QSKES+rA8dksKgEqXaP7rctIX9gVxV+9G+m2kHbJpIw9HiIxK37iTDSTv?=
 =?us-ascii?Q?mxIO8qS2ICbFyiZPHNE0mCMet0ZzDScp4xt6p026ppc9E1lrmod7YZBp5r9q?=
 =?us-ascii?Q?+bdWiQZSrC+s4BErn4XucFyyiEM1pyLNrl2f9m9kqbUJign67FE7n7I8DOHE?=
 =?us-ascii?Q?tS55Eq0supuK3IwMS3d4MQytRdkeoXGZuZj8rIJKX615NKdNFQO73rx62v3t?=
 =?us-ascii?Q?PkUKL8D3aBCj+xr21iC6TPpwdhPJVo26XPa2Ic1y71Sm9Q+Qtcx5tAsDzM7a?=
 =?us-ascii?Q?k0f6DAU3vOXJp1RFhEjAgkhREs512PnFnUiHYMPp5TZTWmFgFSo4a2AMPFjC?=
 =?us-ascii?Q?BKfxEf0k4ATM2ouebDohd/BwT7FoRiiaJKoOBMw28fPQv3uNDRHoSVUk80ds?=
 =?us-ascii?Q?UFacV6FHf4NOrt/30yPL5C07UIxgqb9ysE4vFFj9SdjSNHz6Q+rvAZ/z1pIi?=
 =?us-ascii?Q?sHbX8I28oaSErs26hXmQuQgTmyznzibzuPRd8VwG54YcRS3aq3ZAst+WfjPG?=
 =?us-ascii?Q?cTEgLdIGygiBzwxJmABNODCiuDf6enSUU0+zKIseq1q/qrquoTVHRm6uIpmA?=
 =?us-ascii?Q?mAMOoREhTSiW1yuFlYMnh+ietnpHwd3WW2sdyPioD6n3iZOstPRGUJn5n1Qg?=
 =?us-ascii?Q?8lPZJZZIBBhoX2yEz2wrQBlXc9y0ouVn+ia9jYPpZKtRD69INO8EEEh4wOJ7?=
 =?us-ascii?Q?YLiRuayl0b89SbaCyml5E43mRRyHJDliAGjP2luqORSgl8JuWD6PfkbD4G4X?=
 =?us-ascii?Q?aTTsTM0JozF8mgx5qNAgV1rnZ+T3hfs0Ozau09wcCvwVOdzcYDm8oBpKJart?=
 =?us-ascii?Q?BJ1YBjWWnQq5K8nn27aWCfp0Uw9lZMotEtBvpmVIGGx0QIKoLc27WeAml/ej?=
 =?us-ascii?Q?d6cmFq4PcH3IUccXC6/U6PdTSnR8ojqMauB7z4Sk/Q2DmQZObvgeTuVNiQfm?=
 =?us-ascii?Q?1AniBTYH15BLAEO7rWlwUBYhj0aL11GSdd6a54N1X0pzzv/MBeka3Ct5I59G?=
 =?us-ascii?Q?qeUuxx3QpJsRKHBre2SKBWHRH3/XfbM5iBOnemyYbkkrX8ofz9QWDSo7VXUJ?=
 =?us-ascii?Q?fbYiEpthz32i192LlNwzcMuj/oA7+OUXqX2fK9BB6NSpWcAOWaX9jdJ08GSp?=
 =?us-ascii?Q?4z80BO4BlH0HAyToVgTdnqoNcBVTea+h6CCF6p1r4knE8tqJ9g6CdaULZ2mQ?=
 =?us-ascii?Q?ytv3WgundHEb9ACYoWFq6VlrvF9r1VEoXGiS/aRcFjpZujmxj4bC?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb91ebd-820a-44d4-01f1-08de478fd56d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:40:22.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMtNKdUm2aBLNkpOEuQ7P9UVzEoffAZFz4xq6aiYagVo2tSyYDOQx0nextVBXNliW0yB0OWPRBcwzZoh269xlRyGsgxuJYJFbRG8dAgBOPDCyqM1j2bSZqb066pfigWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_024044_963706_256CB5BC 
X-CRM114-Status: GOOD (  15.85  )
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

Replace individual devm_clk_get_enabled() calls with the clk_bulk API
and store the clock handles in the driver's private data structure.

This simplifies the code, and prepares the driver for upcoming
suspend/resume support.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 42 +++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 426a418f29b6..8ef6ff06df90 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -259,7 +259,8 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	struct clk *tclk;
+	struct clk_bulk_data clks[3];
+	u8 num_clks;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -276,6 +277,10 @@ struct renesas_i3c_config {
 	unsigned int has_pclkrw:1;
 };
 
+static const char * const renesas_i3c_clks[] = {
+	"pclk", "tclk", "pclkrw"
+};
+
 static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
 {
 	u32 data = readl(reg);
@@ -489,7 +494,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->tclk);
+	rate = clk_get_rate(i3c->clks[1].clk);
 	if (!rate)
 		return -EINVAL;
 
@@ -1298,11 +1303,17 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 	{ .name = "nack", .isr = renesas_i3c_tend_isr, .desc = "i3c-nack" },
 };
 
+static void renesas_i3c_clk_bulk_disable_unprepare(void *data)
+{
+	struct renesas_i3c *i3c = data;
+
+	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
+}
+
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
 	struct reset_control *reset;
-	struct clk *clk;
 	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
 	int ret, i;
 
@@ -1317,19 +1328,22 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	i3c->num_clks = config->has_pclkrw ? 3 : 2;
 
-	if (config->has_pclkrw) {
-		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
-		if (IS_ERR(clk))
-			return PTR_ERR(clk);
-	}
+	for (i = 0; i < i3c->num_clks; i++)
+		i3c->clks[i].id = renesas_i3c_clks[i];
 
-	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
-	if (IS_ERR(i3c->tclk))
-		return PTR_ERR(i3c->tclk);
+	ret = devm_clk_bulk_get(&pdev->dev, i3c->num_clks, i3c->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_clk_bulk_disable_unprepare, i3c);
+	if (ret)
+		return ret;
 
 	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(reset))
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
