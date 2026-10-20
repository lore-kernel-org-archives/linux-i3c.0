Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109A1606A32E
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=17BSKOoB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=YGL//roJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ckj1LbJ62tWY3bYd/JqdBI7MWt9iSfddWCI48R4zNY=; b=17BSKOoBXBtKV8
	fFjYAf4TXKf4jl1VmMGLLKVBG5UonOyWvvosbacGMzA9UZeqWay5UCaZpx1AtT3VU6up9QukDk071
	0+bKwhhqNZTWrLGqw2J1YAIEHvNumgqmokOPiHv7V5r6qga3/H7vSxqHxmzIqj+3WHcJP6FFFhQG9
	grsHBTcIMWDAtGJMnQ2RuqzyVU27rxWq0WltbqH2UaDDod8HixUQIaT+Vgc7oYB0XLcNzmLAFMHZy
	X0AL+3lOCT7tXWX57YQ6F4eHb5t6wpJdK/LfmS8pXali2Rnz6CPxH6uXs5r/hmYLVbRUSwecu8FLm
	oph66RF7aTASGSWAxOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wU-00000009Gxm-3Plk;
	Tue, 20 Oct 2026 09:15:34 +0000
Received: from mail-japanwestazon11010031.outbound.protection.outlook.com ([52.101.228.31] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5wS-00000009GwR-2fhr
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swMZTDQvWyiMAX5HhxoE7ipokuS2as5qx1iWk8XmXQGkp7L1IlcaoYwlTB94rQebOo2Ug83wQ0TL/3Ia5Z9bza4ltMFvDyB9JKbf26msp9e49gRfVRnsjtqt8klbfiSe6B1TG4G9LA+ICD3WEZUI+rp+iUOIBKWECGiu9Ro+JIQjjzoU8WYscetpzXsDsErqXuXUHnYaxK4sXe0n2ADD4GXh8usXGiS0yeVAuoijF1TSqBeEAEyAaYZr6fXZD9Hdi0siXn+Pvu7nP16zUpKRk8N3u2g0PZ6qb/EhVOvbv9JauCxblI5Kh6A2L9u1YZMoI6poi5MW2hp3RNlTAG+B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NH+QGx0wGthKAS/WdE79a2UfZb5IxKaHJ0yio++Y+LY=;
 b=yKj2eF2CN7tryTc6NpcmK3lZvGfXpR2DhWGS66Ej5rqQqrJvEzSV02ETgXCQMfOOAhYteSNWsXBCsxc05KLG5h47CMewpeFNHNNDWreFWf0I2T/JbjsBuRvIl2QNDr6ZfLdxKTzaDA74lpph4PdLarQgMYzj9giRZm8E8cKb1SYph/0ljzvDM45tA7N7XnG+V0Kb/KoKhqfDGE2CptRU99bN70JntJryowneaQJnH7tf+s7jbk2yLhh9Vk5m95OHGxcj432J3jBtEQ73+8JMneSRHsrDO3FxSMAX/IDBMYSXl4e5ycWcNeX6UsPk0ZsurxM2te5Ve0XhpuGj2xRmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH+QGx0wGthKAS/WdE79a2UfZb5IxKaHJ0yio++Y+LY=;
 b=YGL//roJfxpzjB8EGskCXVE4kEnM6WMo83+dMgr0x8IzuTzMfKvJpo4cQfUBpuVi2ex5kMtwDH5TULZkUVcC05Cau+Qbs83oygj31kJGBW8i8Ef4JLcLeRqccW16hyosIVaqWoVAPAQUBpcfhOzM0CQ677KTsGktHcD6hf1OpnY=
Received: from TY4PR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405:26e::8)
 by TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:25 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26e:cafe::72) by TY4PR01CA0005.outlook.office365.com
 (2603:1096:405:26e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:15:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:15:25 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 700133000276;
	Tue, 20 Oct 2026 18:15:18 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:14:56 +0100
Subject: [PATCH 2/8] i3c: renesas: Drop comma after OF match table sentinel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=796;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=sDBd76AGNOnOLbeDN4wvOjDiA35G1W9kveo/8FoUMFM=;
 b=lCwlzH6idYlG0XUGdnC/epHH+lGZJywOa11h3xf8mJaxSmiv6foZ2UUU+gCPfXZEhnL7EojFa
 IramzAUi+LvAIHUDce1kO5m9MRt8fHRxg8iP/UZM1tJ9hutsA/U6MA1
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|TYWPR01MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7ee5dc-6dc9-49f3-3466-08df2e8aacf8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|921020|56012099006|261009221227099003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vkKkbJGYs8qHGhJLKkFg9HwzfDZyMoJGJyEc87twhX/ymC6blXoDhNnlFbba/2Jq92gfuVIRJbeaMU0/fz0HVkxbL33cooGAAwU8nWr9++iss8m0MuCxXfPBQVZh6IE6pZKNtXFkYQ1xFT4BwtPK+aPN9Gw+LoizKdwFLk/sTQy93+N8GsKpEtujvQeGMDoYoidgtS30OnPCyQ2wsgvgtbCM3+Zk66mp8jc9HVFTNkvRj53nq2g+Uad95s+sceoAGP2cgmhCNAQAKsUY/0DmQJaFj9SMQlXdQBUsGjkJYqBbLSefAhtOFGZacrcYGECRZf7o+eAkSl+KpYpmhJWolc5UmSelHMR/9pabSqEAN3E0h9CDuFrfytP8R5ZjOh2NOoagRXQWhVZ2O/2uUzdaIFh9ectTHQKtEyAPMeocn9E9YgB4XoE7ytJNbgGWMeE3bPLjhIPe2N7Q9dV02Mjfj3zhEo7iw7UfZ0+RkjfUScwGsqgg9nirkjO6FFfRDaAl4OuNGkckAb32LiNvYcuWzf1zL337gJwxZQ8DVTKoEr0ml6JzGMwQX7W67J5YA0iKUTfh2boBdh33fOh796ryS+1G+g74yKeUsn/YgYFi/DNrnWt6tFBr7kSdodNPviCHXgIaN++WGTMfkzPKBUHZTaJag69noLktupPSk+Nvc69YUF16SzygkGIijKSW6H4MOMSQChL4nexcc+795B16YV7a4zYwPbLbHu8fETO+fEMkWna/fbTP89pK3QaDdIam
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(921020)(56012099006)(261009221227099003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hdWy04KuGK5iWi5I8No/I+249xTMmZHQSpAOYS50y6lbHAIxQpqcwlmFxl8VcBzICMgp/t9XYyswcwBK5cUaOKuEIml1LdwEXcfF4Omu5YfSy5HhBOBzNx0MXInxe8MDB1c01idzkgm745VUi7FflKVl2DL+F4MBW0yNMvEmHbkXQmB6O50N52cCBgiLk4BOLBjrQOR+GHNODcuyjDUL6YZxyabL14CucX4mHjWYmW26Pe4+VIO454a3MZiS503jQJhlGywpSZPp6tmd9/3qkGLJ1ry7kws0vkqpwuuyuauPw5TpfuRNqAyvMdN0oZ2pKnjEpXaBuQOcx43WfgsBmqwKrcYULU651xDthAslzI4rlANPp8EuzK05ohMRpXjMyWNPjqyYBCSoJMH5y18vVLLIpOxXSVC/KuAzkLOcuW8YPgm3eygHwvyuef6j1VFZ
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:25.1716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7ee5dc-6dc9-49f3-3466-08df2e8aacf8
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_021532_680596_8B7886F0 
X-CRM114-Status: GOOD (  11.21  )
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

Drop the unnecessary terminator comma on the compatible table.
No functional changes intended.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 1fa115bdab6b..4fddc1b4fdbb 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1626,7 +1626,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
 static const struct of_device_id renesas_i3c_of_ids[] = {
 	{ .compatible = "renesas,r9a08g045-i3c" },
 	{ .compatible = "renesas,r9a09g047-i3c" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
 

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
