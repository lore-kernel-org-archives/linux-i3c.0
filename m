Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4376C433F5
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Dec 2021 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1GAlT0uTLLcp2aHTHEHUoaJXQJFE8q50gx4fop71fQ=; b=N2hMkT2ta5TMX/
	OLA3YfmSfMNqSxBmM06xYYXryI2iOU8cqrGq3bt6ETGH2RwjVjV1zXhLXvCSzocsLaQMH3HN908yP
	7po5o6Wrd1K/SNOYWT9Lh6cbW1V4+ea6aGsq4ozj6OBCeHclaX/sj6JlgUWjSTd1QR3b2z4frtS3G
	bnp/2t6sBTxXN+w3WRHPrlw0+xRPW7EDWk+Dcy6hPxT5XB2BzoKZQCHL3sR6bWGhd0DAp1gjQuroY
	Lf4SyUgUlyp09ul6HwubzajTlxp94QpEYYdbRNzqzWjSLxx9PREC9+zkLI3JKgBepYjEyctzs8CsX
	NXO/YzE/tea3EttZerPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1kl6-00GJpd-VS; Mon, 27 Dec 2021 07:49:28 +0000
Received: from mail-vi1eur05on2081.outbound.protection.outlook.com
 ([40.107.21.81] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1kl4-00GJmw-AI
 for linux-i3c@lists.infradead.org; Mon, 27 Dec 2021 07:49:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC5WgogYSLAwBHn52bpLPF+l4os3YFO+H5ZXWCp+wtUImqfzuWXnrNAVvJaCK1LH14bNwq7cSCprLq9szXZ4lpRsvEj7rSTwOk5k8PrIe3K5VN/ov2P0w7aRD+siwMHORm63hA1JLX7hNz+EUqn+S65MjAASuHGaEklBY5+VPGoarboxup+0n1/XJMbvTK6LkFK6Zo1VDVXsOiCLjnsqB119qHecMR3N33JpLKtevYyHwkiiNyYs5a3/DDCAXpPt5p8a2Zf0P8oXmSe260i+h+Za/dFloMiYKPZRzImvZaiNhCc/RHJArnnTkmZw7WPaEoUPyadVBKSvVYPa8KjtgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xamtvSS69zF6+fXUNR9DB2PrXOBmOr10jWFtmiAmeHA=;
 b=VvorUfSnVQiynKBvAlEfA66vkCglIvjymviSLhMeBDUM71ppvHy6vg2hhPXH3nLWul0f4sRtXAWIP4j3jBMJJvu5idou/xapRIWqsgO5mhHbJINdE2FD/yHs0Cf/9OQ8spobhoi5Clk2gKATAreKnfxjVQMYL5aSrsZqh5D4lr5N6fx6xqiBuOCHNr3mqLb5At8SaaDCkhknQU20UyzKTJmRs/NZgub68qoc+H8ezPyhjl2Zz+GxoWkbXQs0IsLHmCeGlikVouWFDC9VRGR4o8Rwxzu3jqHgL2PAhmm/TasPJch382sm0I6vITccFxIOZt0oLxyYBUxi+A987h1mCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xamtvSS69zF6+fXUNR9DB2PrXOBmOr10jWFtmiAmeHA=;
 b=PeIGqA6Bs9Iu9tQHR5bulnndEdy08VzsE73WrIEXCfqho1++7DaPrbWtQSHW2Pz4iL4+B1E5oeCIJle8AFqknvtX5wcppbXxxImmWFJZgL8DU7aMCc8PV3QGkml/Ttt7ZXUDbJMsAxeg2yBf41iSPVRw7D1gVbE6vbSLWQ1WWnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5631.eurprd04.prod.outlook.com (2603:10a6:803:dd::27)
 by VI1PR04MB5629.eurprd04.prod.outlook.com (2603:10a6:803:de::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Mon, 27 Dec
 2021 07:49:21 +0000
Received: from VI1PR04MB5631.eurprd04.prod.outlook.com
 ([fe80::90fe:b60a:94b5:c748]) by VI1PR04MB5631.eurprd04.prod.outlook.com
 ([fe80::90fe:b60a:94b5:c748%5]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 07:49:21 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 2/8] i3c: master: svc: fix atomic issue
Date: Mon, 27 Dec 2021 15:45:23 +0800
Message-Id: <20211227074529.1660398-3-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227074529.1660398-1-xiaoning.wang@nxp.com>
References: <20211227074529.1660398-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To VI1PR04MB5631.eurprd04.prod.outlook.com
 (2603:10a6:803:dd::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06c1b2ca-85ac-4346-db96-08d9c90d64e4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5629:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB5629957CE0AAC4EDD258D213F3429@VI1PR04MB5629.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OvCcJ2s2kXen0EkvNV5qAalkNmxzSLzbVkScJNCa/LyC775QAAEm3U/r3OSLP0zVp4T9I7e+bLs5vukQqMCVF/EcmVhxi1xKLdbhK/IGuP4iCkBspyV7/sOun7/TTQOoo95FTN7q2V9K9YMWcQJ0EyfEHT+4EOas0g7MYdRPzMvQ2GS7Bj5kErPrU+liZ6LtRj2I0ohrjXRjRLjPghUWSByREBM7xEubSdwnimS9M/vF5cuEuZgXzJnKXG7ET1qCEjYxhqS9QCclq6US0stTFX+RsvuzqBEHHCovJCae57eD2Qex7oBrySFk1+0Fft9ptxAu9rVx5hnQIPxnCQqF4p0gXAUCjZgcYok8PDXGEnlrpwu2ybkzOFtfYQ+iesXGf0cTZd1DSesfjC2ay6YffassjBm627hMH1pJCBYqk0aGBREJv9IOm1Zw2pyj2Go3/g1nqAgmkY0XouT/0OFBbA3iSRfvM8UZ5FFmGoHAd2Bek+gKYD+PDNuv+7HT+kpxlt3hRvwCfB8en/WYbNf5NyPyP1FH+b3R22VU1gtd4ZlnDqL2np/c53gKtBWIcAQyrj0hCG9y/S58mtVf7QaO91V7v3702iVPu5NIrFcvybUF/w4OmW5iIGk4qhk2lEF5xnjBJqJLndjVYJTzuBnOU2J/J5lV2Hhi8oExfwdN61EwmGe7yAs5YX1bRa+Fqj22WhZ67RKdSeVo9jtFC9L70Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5631.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(26005)(2906002)(6916009)(83380400001)(86362001)(36756003)(66556008)(6486002)(66476007)(66946007)(8936002)(52116002)(4326008)(38350700002)(38100700002)(2616005)(186003)(508600001)(8676002)(6512007)(1076003)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N80L6sboLEZwnPZcZYuy+UzEFwL7tdK7PAY/BlY1RddWfE4OE49oyByKGOPv?=
 =?us-ascii?Q?OS3iNQrZ4ghtkhEFmgX5ytry6AmtRe74qDAhfyod85smiEjYWi3MFN9vIOCV?=
 =?us-ascii?Q?DlwVc6/cLpQnseeRZcbEaFAyu4aFmkaswO3Ajsyjaw/cPM8Ti2wXH7BGd1us?=
 =?us-ascii?Q?lbq+YsAkMuiq54kHuMcwild/DrhM91Zyu/D/QyNBMWvqEhohohY2iS+5ZI2d?=
 =?us-ascii?Q?iwkz3zQEc6hPK6VcPF5DfwQ9nWVS2RnhcpVpAfsKfEdXnp4n7pRp7NCntXYN?=
 =?us-ascii?Q?0bKfRogxeUz4B5JV0VEpkVfGHA+4bsJxiGl48WKiro/X1L7tnqp1w5msDLUT?=
 =?us-ascii?Q?F5b74BxkFdPEKkkgWutPxIcaZAuzTFgdK5qRiJWkgGY8Teh5NhzvxEZ+no6s?=
 =?us-ascii?Q?aardz5CL258U03a0TJoQhMlxBCCXzCM/L/U9If0FBPZwAXpvXA/uymascOia?=
 =?us-ascii?Q?XhR9++hsnSc6Bl5/TvhBSMzJcrIuPwRrp9ptz2VVMrMjB+0pIb1A3Jq65b5e?=
 =?us-ascii?Q?lJHKsLC2w8MaXL04Zpn1ZmirZmiZMjPFZ+EEvxxIts5ni5K0PRYXkFmpTd9d?=
 =?us-ascii?Q?7byPLPOjjzBggMAZl9WohKc7sRjJZwpm+WBVdW39uQtj7ogBEw7YTktk8YVI?=
 =?us-ascii?Q?fv9EnMHcGCu89vz0XWUGNqxVyl0Qu2NAoXGbiUy0wNpInaF3icg9aOrNgjEN?=
 =?us-ascii?Q?SGhlk5tYkhXK0gT74rN//rvItCfu6LIAPlMwkGUjMPRGE9Aczx2wmfREKiJR?=
 =?us-ascii?Q?kZ6cfVhe+BC5UaNbpqbssX6+pQvWYsZm5b/6EWLL6XpiZ/9bDgGiA8kUrjej?=
 =?us-ascii?Q?a3w2dTAwpCxS2DJ/o60hSEZm2Ubzbp+w4FFKIgydq3SvoV9QaMBRd0YTiJfY?=
 =?us-ascii?Q?IlEDJPYas+t+XFjO5yxxESop3CjbNCeHqqy2xlpTlebi1Ajd7MJwtCAEqNzc?=
 =?us-ascii?Q?C4RU0KSeW4jo42SNfGWMLi1t3emR3zCrkGFC6TQFNfWcuATh5EDQU9zDKkTh?=
 =?us-ascii?Q?nFEweWRhqk4kYag8wJzx+XDSsUc1ZTepnkXhAvV4DvwtgKGkRaU2ArdNn/Py?=
 =?us-ascii?Q?deRSND8su3sxpCqrCsR1xuwlJCn9tzPfGd5npTPlkmQn7ycTkrH/1pQeNPvj?=
 =?us-ascii?Q?3/527LGPyqsO0poUlshkqWXN81hJuQTX2BoXzE6BWdymunLpiSaRBGhFJHYu?=
 =?us-ascii?Q?eqp0Q78YDYCL6uxz+N4GrGmUVeBkXKyNzDdJbWxu0lx8NdpcICJexKK0rdBP?=
 =?us-ascii?Q?TmZnCUV2ZbVNAJ6WIxbI7DpZpQJy1YsEua9YjXm+f4P+o/iFt0KyxjASQouW?=
 =?us-ascii?Q?/iImSsfqTvd8DDluc6e/wIp1INi0CE+Mi3mv4kpmKwTxhX6HWuVZ3lDnAy6R?=
 =?us-ascii?Q?bg1JMwD8pEVjGyq1AM95zxzcj2UrTqe/1X+o79lptxZqamGEt6oJnNSxC/OM?=
 =?us-ascii?Q?HdTOp2x+ox7NegTWhgQnGDAVsrPW+NJFwlpkH90ogy7VA0ZTYtPqV1ZpkCJ/?=
 =?us-ascii?Q?52rhx09k/KwogqUfXJ5bpBtgEqIOXmlp06JuCiGl7CAC1MewD4rnKR24rYSr?=
 =?us-ascii?Q?dZJ9YKc9CHTQ+P51Hm47PNumpQUfHVZbeW6U9Ym9TRstlrjpL/42j59DzrXP?=
 =?us-ascii?Q?R2BTfWaq7QumIFb+GumuEmc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c1b2ca-85ac-4346-db96-08d9c90d64e4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5631.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 07:49:21.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLC/meowtXmj4R1Zt2bNPKD5imdHFP9mrKSa13e3satWfoaz9ghfnLSI/9f5ct8dSlzBX8KA2qXcF8ofzhnnKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_234926_383389_CC415E86 
X-CRM114-Status: GOOD (  10.23  )
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

do_daa_locked() function is in a spin lock environment, use
readl_poll_timeout_atomic() to replace the origin
readl_poll_timeout().

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
---
V5:
No change.
---
 drivers/i3c/master/svc-i3c-master.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c25a372f6820..47c02a60cf62 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -656,8 +656,10 @@ static int svc_i3c_master_readb(struct svc_i3c_master *master, u8 *dst,
 	u32 reg;
 
 	for (i = 0; i < len; i++) {
-		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-					 SVC_I3C_MSTATUS_RXPEND(reg), 0, 1000);
+		ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
+						reg,
+						SVC_I3C_MSTATUS_RXPEND(reg),
+						0, 1000);
 		if (ret)
 			return ret;
 
@@ -687,10 +689,11 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		 * Either one slave will send its ID, or the assignment process
 		 * is done.
 		 */
-		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-					 SVC_I3C_MSTATUS_RXPEND(reg) |
-					 SVC_I3C_MSTATUS_MCTRLDONE(reg),
-					 1, 1000);
+		ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
+						reg,
+						SVC_I3C_MSTATUS_RXPEND(reg) |
+						SVC_I3C_MSTATUS_MCTRLDONE(reg),
+						1, 1000);
 		if (ret)
 			return ret;
 
@@ -744,11 +747,12 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 		}
 
 		/* Wait for the slave to be ready to receive its address */
-		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-					 SVC_I3C_MSTATUS_MCTRLDONE(reg) &&
-					 SVC_I3C_MSTATUS_STATE_DAA(reg) &&
-					 SVC_I3C_MSTATUS_BETWEEN(reg),
-					 0, 1000);
+		ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
+						reg,
+						SVC_I3C_MSTATUS_MCTRLDONE(reg) &&
+						SVC_I3C_MSTATUS_STATE_DAA(reg) &&
+						SVC_I3C_MSTATUS_BETWEEN(reg),
+						0, 1000);
 		if (ret)
 			return ret;
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
