Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE9CC433FE
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Dec 2021 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLBGklZ+187nL7wt5R8TzhWfVr8f+41dWcxIdJoAW84=; b=TM383zxXcNhIPa
	aju9lG/vWhvFYRmuGPKWfS7785lnKZmKp41v0TMphGrcDLtQdwzkvfI+nq+hAhzzB2LL/19EEcnP1
	cjKXO+cE2IOwFhSHmzcNxwQUl/sDF+rIqk6Zux/r5/5uzg0gbzQPlENc+xeG1dHRfTaaBVjnzPY4T
	afw7YoTPv8Ij+5YarQodp7kJB7rnIroWTtLz09FDnLc9a7v6HI4EwGgCopldv16ge1jrw6YrHnMrK
	S9sc+7lJdpufAFtX+KXmDwy4EMpDZ6ksyalb3mpSsl9ohYPzRLmiMrH3qoBX0NEykCXiW4xqNGeW0
	TsgaubkCfI/68CBdLinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1kl4-00GJoU-RD; Mon, 27 Dec 2021 07:49:26 +0000
Received: from mail-vi1eur05on2081.outbound.protection.outlook.com
 ([40.107.21.81] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1kl2-00GJmw-NG
 for linux-i3c@lists.infradead.org; Mon, 27 Dec 2021 07:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt0fOPFW42nUTM7MvIWlZBu/WColTbIKpFdSEl87KBW6gywKG4ft5WpiW35ZP3ivymM3H44dgsvfutGcykT2qzDI5gCj+9+4PCqf+MyPftZTK9qF+CnyHUDimRUwR0cQXd3sR5WjtB76n8Yb1lU3kJUv2oYyUq16e6U+TGDX6YvFAVpO2L3UxuAiHyA6QSoe5XPM30Yhay7V+59F3y8NI5lzH4JHDrpMopaoJvvu5QXMLBAiVbaXPIS0DSxMbGMpkZk/9E7P74QmIm6T65lpUdAU2rrsFLsr7/6y6/oBGrniswEWeUulQ2f6icSrEfsBUWxVHpXv/BxWIz5Zrb7hFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J85mFZmjgJNx2kYN80ps6fCJtFjo40Mi9coCpNaNvLo=;
 b=PUfClvaZLw+oOVkK/+YTzTP+wOwFXm8reZCrqE/+WXDVLfwH6oOr5SH5q9f8f+q3hSN3m5FOmZMVQiwFB5+Ky0lhw7VYpBxoYSSLEvVY/4qFIpfQ9uN71GhNjh3U/N3aF+26Qo8f80+NRPP98bYcFxPHgnZVGdOGY5fhN9jHszfgLtM5xB/AzCRNF3YZbgb1cxeDz4E241CyeZv7UY+px4pRZAAr+cZvtGT2oz2FzzxBe7MUc/Gvr+5I+avZL5/IIe6jJhUakOL0yltz8uCJZjwRAoy9V8/7AxeicDySqYpZatncwuJX26JfWCgZ54epeGCGnPf1edih86iNOk37WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J85mFZmjgJNx2kYN80ps6fCJtFjo40Mi9coCpNaNvLo=;
 b=srUVKOu32PmSgrRqlgUIzKY/3WYeGnGALExZISLJTiMYLZ9rKAceK9tB6IETOI21pF4yWlonTklpJwFSWMSaH0b4Uk/+sYHYSAS9rwjM9aBf9MXX8xvJBCAG4sRB/gDgoDgb2S/3Aby5fWiuGvsVelA8+4CCSMU5VPIzoxRkacg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5631.eurprd04.prod.outlook.com (2603:10a6:803:dd::27)
 by VI1PR04MB5629.eurprd04.prod.outlook.com (2603:10a6:803:de::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Mon, 27 Dec
 2021 07:49:19 +0000
Received: from VI1PR04MB5631.eurprd04.prod.outlook.com
 ([fe80::90fe:b60a:94b5:c748]) by VI1PR04MB5631.eurprd04.prod.outlook.com
 ([fe80::90fe:b60a:94b5:c748%5]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 07:49:19 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 1/8] i3c: master: svc: move module reset behind clk enable
Date: Mon, 27 Dec 2021 15:45:22 +0800
Message-Id: <20211227074529.1660398-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227074529.1660398-1-xiaoning.wang@nxp.com>
References: <20211227074529.1660398-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To VI1PR04MB5631.eurprd04.prod.outlook.com
 (2603:10a6:803:dd::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa863be0-a184-47e4-bc24-08d9c90d6384
X-MS-TrafficTypeDiagnostic: VI1PR04MB5629:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB5629EFCB981E5F3763D0B592F3429@VI1PR04MB5629.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LijEE+OOirQRD2GGp01r+zMF3SQAwRaQEu7i6XN0p1uPhKlGD1QfZ0gHA41QFVMo0VAkym1KmuwVPUMiBrTEXwh5QWg4rT7egY1HpdMIcEOYAcmgDijKDN6fyHq7baGBmC8NuNpUGPVzgRJNN+vCbdLV1ujFQPlJxraEnIgaOhuiXRz2Y2RxHLIUphNkV1LRNrglqk8mCbcpTFh7XW7E6Oj7zmGVoSvjURV65wFOKwxwCx0wI9jglND0ME2asFVEdWybThCuztj1JesyNntGawceLlyFbQeRA78ik+CxDBljVzfq3cP9QnmqVlAGgkR/86Qe1ZA3Lm76XXYaaHBGB+OBtAJh5Y74VS2ncswconenb+AYJMT6jtsJW1DQITEBl93BPKUp/y37J5LksRufBzlZmdBeYTxzH/KqOVFTSfaRMzWYoWvFUyVb1okpplz/i6+5iYuVWtoZmu/7AdgItzGg1OuYMeshlLesGhcNjgTDnWMIUNGB9zxboxuMa5d/UUWD1QjR6re5zbFynEd0RPuvxBaPcOeucwRyH/5k/g+JfUVCRYqPHs7+8iNxRGLKVSSwcRQGCYMkRFR8co7CdlZNRrd9tKjjAccc9i1whD0xueSG/0Aait82bJUH9gi0ggFRKRkK0gk8OR+hfHzwwVJr/W1fhbJKAz3DYNuzdG/9KeOL8kwCrMnvNs6VsJOT+qrb6iAMY5ZIX0Cj6y3Flw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5631.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(26005)(2906002)(6916009)(83380400001)(86362001)(36756003)(66556008)(6486002)(66476007)(66946007)(8936002)(52116002)(4326008)(38350700002)(38100700002)(2616005)(186003)(508600001)(6666004)(8676002)(6512007)(1076003)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?auG6ID/Fqy1rfcyGK3X4WSkQocpANdrF2ayyb9dFi22le1p1R2NYQTczJu34?=
 =?us-ascii?Q?ZI39F50gPYKTgcpJR+L2T8pgEKKfHLPjweI+uZoOK1u4WTlVfODtr3K//irU?=
 =?us-ascii?Q?DGy66ukCEr3C211s0eZ6lfep7HV4JTUkXfoyvB06/Iaz3vMK07pGp3LrtxNs?=
 =?us-ascii?Q?1qs8616kj5qy60rRe/viStA6DVH0qkM76q6SyZ30N3vfUkY+1W21uLpnk/Kg?=
 =?us-ascii?Q?f252enDRhbq119zQRR/rA5XR/5GaR6L7fPVrq4sF2Nvx/yAYtLH5k+QTUfMo?=
 =?us-ascii?Q?lLNy3eznKiGvNT/SM2qqxaOviKKzaeHc72r+4mJ4vaxvWCIHgf2JRldZUY3B?=
 =?us-ascii?Q?rSOERXIyvfvYTSWgVuqe6umPG9wJyPcXiEM2r4X9Im2QEn01g8SGpdfYUfx8?=
 =?us-ascii?Q?0qRyth68yfjepSPbddoS6gJYMTSXf1Kefz+CV3k8b/eLbxIE47BOO+JIGClz?=
 =?us-ascii?Q?kEt1aXhsnFfGeQN2zAeeKdCyUS1LuKeRzQRWbLW7ARjP7P1R5uKc1np8Bksm?=
 =?us-ascii?Q?xYQxUS2lZaBrnPXb5y1c7J1jB/5fQBz6gu9o7vvRQlSXfWZ6YbsCLpwHE48x?=
 =?us-ascii?Q?J82DNIanhXA22zKwn2+o0GKr4CVwZG0WVrahZJ3QhlVf2Pg/w5EueCg5bdzS?=
 =?us-ascii?Q?LlZ9PstB5YTPCNxhTKeALPN97gQ00j3p//G1bWMuLhoeB8dKGcAhGESgSGHp?=
 =?us-ascii?Q?woZL15w9l2ehyiok9EEDHGQ4ls+zHRsVFUfq2Na6+FzyE1Dg0f2LumFNiytw?=
 =?us-ascii?Q?EAp+KlqLDWP5v//j8R14U034TdScn6YyYZAGrMSWYAmJDfUYEkRdNnym0cNK?=
 =?us-ascii?Q?gCWSRvxl1fCJFcMZ05vRHMszBFwuBzufZvnJyy7drqlPM92cV8x0BvjyopUu?=
 =?us-ascii?Q?6Xx1Gc7dfH9U2k/MPxDj0lqAnJ4OQg2saVQDcqMg/lUly62vKufK3SIUB5Ne?=
 =?us-ascii?Q?Jbye8O7VCVFiTXupUhu4+NmR0cZm6XzLh2vI3S8xMh9fobawZPVLMto1qCbG?=
 =?us-ascii?Q?T67b+nk4zDEVvcuG6adYjzFheYzP9R8RfFcnTZABES3Hbv31UCxDoPy8eN7v?=
 =?us-ascii?Q?r8oCu44INTl0ubTG5cpENdgiF0XoQf3/6PttCWrpK/l+iDohBnDiJgBOGpU7?=
 =?us-ascii?Q?PyQmhUGPFUptrHFK5GSONWGXF9J0dk5S3hMFVMNlCg0byoLKYBgkPGgiWeA0?=
 =?us-ascii?Q?jgPj9vvL7VkHfe3JtpJ11AbZ0nCl/QYVHXRutKvKnhlL8n6Wje7AdcGtEkMu?=
 =?us-ascii?Q?mvcjwrQ9uWxsz1TcYsscrzRV1xrSaDEi1uIRGiwEurBwYvdOIRCZSDX5UCiZ?=
 =?us-ascii?Q?fgHhvwp/pN92Nl6OZ+X969GfF1yqVz2H1qlo4q8D1xW4GlHUoiAevYpAJxO9?=
 =?us-ascii?Q?D74hzSrnbb21n75erM750rs3lncPI+zGaJOAGLOtj8OHe5zMQCNQCCn3m/or?=
 =?us-ascii?Q?vq1z8IfSxEgaIasniyRqMUTArdVtm2SCBv7j4suphcFSclPRVH6Z1nYL98tE?=
 =?us-ascii?Q?GO7y9APqZ3aaogbLDkobwOeEWwQMDru8dZ5hqHfw031Xta8eNXz8aWcd2Yvk?=
 =?us-ascii?Q?d1uZIyoGvXMnZCdRNQ7u9Vpqo3q1lDJhzD33rB6EQUm3hP03l+pae8eNQZE1?=
 =?us-ascii?Q?VNpe2tgYB6idAQRtSNX9TaI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa863be0-a184-47e4-bc24-08d9c90d6384
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5631.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 07:49:19.3855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLSZyK0ni5uax0u9SfS8DWB0lPMvKo3CA1p5SUAzsiD+TT8reCJS7rhGqwmwRT2ao9lfRe/M8RQxhXQjLICvIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_234924_792021_46098B67 
X-CRM114-Status: UNSURE (   9.37  )
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

Reset I3C module will R/W its regs, so enable its clocks first.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
---
V5:
No change.
---
 drivers/i3c/master/svc-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 879e5a64acaf..c25a372f6820 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1381,8 +1381,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 
 	master->dev = dev;
 
-	svc_i3c_master_reset(master);
-
 	ret = clk_prepare_enable(master->pclk);
 	if (ret)
 		return ret;
@@ -1419,6 +1417,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, master);
 
+	svc_i3c_master_reset(master);
+
 	/* Register the master */
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &svc_i3c_master_ops, false);
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
