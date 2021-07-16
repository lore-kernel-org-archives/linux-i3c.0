Return-Path: <SRS0=KHFp=MI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60683C07E95
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E6B613F2
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E6B613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bn/PiOWOPI+FsOwNlro4ZCGhxkF8BN1Gb5xYMMQNfik=; b=K6BoduWAXBIkTS
	rawZ56ktNFPst2nLC6Crdm6oPb+1tCrxbWMm3HC4/WEdPppHIfa8PGlF5/faDHJwf3Mz+xlnRc3am
	f7HAy8cZN0x0/1uJSZJ8Itand9Eib1ce9/M21feAoDTiuYwKRXkXnaBXKRNaFc+sIc5g5YFmbT6MX
	9E1oRlYJUlfCNf3mTElN9bLaIrAjF2kWTJaXY1Bim0c7IewWNlGSAacgratfAl0S3ErMPuyH3784A
	Y4hfXPl74R24HjJt7Ni1iGcws6qQPAKHSu5X+KVsb5XYTGSM68XHmKQLZ61gXsvZfmd2VaNd4XEWd
	jbPxlwMTadq1rvKvzMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IOS-003Xqa-Lj; Fri, 16 Jul 2021 07:36:20 +0000
Received: from mail-db8eur05on2078.outbound.protection.outlook.com
 ([40.107.20.78] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IOP-003Xof-Gb
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 07:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXGeOafYwGbQPZ6sFW0uK5nmS76uW3rm1P/equV1HKRxX80O4mVGeXtjL2Oiq+6HNV4x2obnQ9gu9oaV8YiI7cMrIh8MCz5ExQB3mkcetD4y4Tx/9W1IfVa1cpQM8WN4EovUJDx0zcl89vQ8nRpGSMh/cVq7cA+seXgUq7a+r9up44XlvsD9K1rtD9e6aMsJZuFhk4Ld00AKniXYUJpNC5vtW25xRgByR1BcWlyKB4UnR7zJ6yHYxrkIvBj5+q6LM1dpm1blY3TxtwmX0rcwY9jgKDGedyzEPV3bjC3QBMA/YS+llRDLFNNTc3skedILXC26Mg7ZRW8TtdRnhT/Vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yk8hrRAIbCocDf+HCEtdZ6+HOTrKPE878c/SGfwEk8=;
 b=JeH25rEjRLLXIu+n9MMD6Pnl9qYcHmak+I1p1ShEg4Wo8Px/55+e9KMMY/0PXMYa8lPuGmFd2P2dKzwDtKjTvkKcnNOIoZDux0bjT5LPf0sSgVwM3MVWFp1Zbh4L9n+O5lgk22SeYyR7kGenG3O1MNaQJQ4l1NtrIfElFMcG+uIuJMkIBJiWNuXJlaiDXag3xNmX40lTUKZmqvsCghWzkYLzb+zxxZNNwjQX4FWG/cTPzvH77KjRfnmPJNLevKhhbV8kAe3eeJpPcQ5pmFtctSFHgS6KI0DmNxiCF+6egnrPsCa1/Ps+KyjbbYoC15WpI1nrcz3v9ksDYy8QFd2Hiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yk8hrRAIbCocDf+HCEtdZ6+HOTrKPE878c/SGfwEk8=;
 b=AF6hA2TDlnMIBb0NYDloTFDqfF9iaa3esMnLJouhnjJV/hhdY/rR8KoP9d9JxnKTSdr48V1ISrmtsn8vQASse0hnaq0x5YReNpyOUwcjOuHKqyjCG91l09eeD76nl+Q9RuojFGt9Lkf+KpAcwP8Sfv0aOBRX34IbyqR4VsH834A=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 07:36:14 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 07:36:14 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH V2 1/5] i3c: master: svc: move module reset behind clk enable
Date: Fri, 16 Jul 2021 15:37:19 +0800
Message-Id: <20210716073723.3490180-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716073723.3490180-1-xiaoning.wang@nxp.com>
References: <20210716073723.3490180-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:3:17::17) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR02CA0005.apcprd02.prod.outlook.com (2603:1096:3:17::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:36:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6ed5084-ce66-421c-bce4-08d9482c63e2
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69977EF9CC7831336C0F3782F3119@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8FJ0xvIxzE3wKmql0lxgNY5DeOLIWl2P98ysGnRZB2hMJHDe4LhJ6jxU5saa6nN3Wisya+rEQQcWUMwhmoz3BDHuhUz7WMK0kpck1TOAZFdFTFdifYNSedv4lh4hSELnsCGN5hWTZHG/YyeCrSAU9rZuY739ZpunRMccvqMefaDerLxnGGyUn1oFoyFsN6SK9X6HxdwcBwpUq55Qmj795dBGrnyetb9o+Pt7ftAZ7/rXlCKRkpKTKi/acCHTuJkYe6knN3XxodBx9KdVq1gf1cuBaIGPkLqsoShZdQHdsh5pZ0uExLWQeMw7WP4CrixFLX4zk1sbDRkNLJew6ilGfIqTB1iXGd3yuofm6cBKJTRisPB4y/jm8eIE3JJ/T+ZoFNAzcTHY9GVIUMyGspm8nVVeQCBUJFDaYAnOCia98VRrjQPazG5hzzPOspGs6hwSj12C1Zmg2FkrVsjsAd+moECCOCR6ijZ7rnWPpnmeFNW158UhEpsW9oR/inP1Zt2eMUpUm5H5DL3pE5v2D80dLMxTU7wtU7ym2JmAahAg7eJhdI/B+EIPd5t64qyATnsvSgi8T2C7lBHtK0si0zVA3v2gTyUOO2OZVKfD0m1QxZF6acJ3MBGmortmLZN6YInOR7ex8TSslgw8Hbj+v+Vtz7kqttGuJ06umUeHVDEFqhaGmd336Bjo096jvEq6hLd7aDBK1iEbE6lX00DP2hQ8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(316002)(83380400001)(2616005)(26005)(956004)(38100700002)(2906002)(6506007)(38350700002)(52116002)(5660300002)(4744005)(86362001)(66946007)(66476007)(66556008)(6486002)(4326008)(36756003)(8936002)(186003)(8676002)(1076003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l/rrzlwPHKtUNPap2oaO78xtBP/S+SEsUfVMDTNHw5p3n4E1CVdyh1s0YP7u?=
 =?us-ascii?Q?KHhmD2cQn2IOCv961OO8OInu1skFOMcPB1JFH7vIzxmXH8Vi53enkHvPYBQk?=
 =?us-ascii?Q?QtvhdTOKyX8/cNuybWJKV+/hCZMpDA8h2aJ0VMZnsBFlnxNDdHc84gokapNR?=
 =?us-ascii?Q?i45xv9scV6QaYeS9YRuj0F9gJcBD7ChF67dv6O3AKJsVEU4Qeg/dDb/aBYA6?=
 =?us-ascii?Q?26vl+vpYm39t64jcpfpRpFVs+PmqdmD1ho5970pfxrdUJkVfYJkLdyDVyOEA?=
 =?us-ascii?Q?krbGF6V8Y3nqS1JMADV82Pr0H+gwMNJyP61bhFBb16JULnQCCQbsvTxnlaeZ?=
 =?us-ascii?Q?uybHUXLv8ezgzyOls31BzrOPEP+GjJXNbWSVVymyv0zteA0JaTL1RR+YeMtb?=
 =?us-ascii?Q?VbFr2Rn0oaPxgbHhQkDfCdvdgdmWvbECpU6InpCtTXEl62MaozJkSwE67wwN?=
 =?us-ascii?Q?jKnsRJJE4tNaZESCUfnUB7XCRw/7M4KERbeltj/d73SxhhWNUClC+x9yUnww?=
 =?us-ascii?Q?xw7SEZyxSPoIY8XiqjO6VX49xLGN6CnRtG82HlrffazyJrPYZvdhtN3hnZMx?=
 =?us-ascii?Q?4YkndiV1iumX+5GIeAjsvgPgghp/jTOICxyQJHHjwNFjpaVwEnacsF99656S?=
 =?us-ascii?Q?QEphBDlvxpVIJoKQ5nUkuyuZ0Zz6vnVPwy39+yfp3ZKsf4JALliBGC+ruVZj?=
 =?us-ascii?Q?tNCmivxi06AJ5VKH9cgSY14RSR1+lHa90D4PPRGy40neU7AFh1WgriwupBql?=
 =?us-ascii?Q?UGfEhCcU05Hkc2rpquWArwdK/27dVsGiSCb5I6Q9UumZF/kxl0LkHg6AIlSQ?=
 =?us-ascii?Q?WX3KOGmKQNN9DXtOJDYNBgMLflct0QXxLb2G2jfZXG7D/ZJgT7TNdcqIO6+k?=
 =?us-ascii?Q?9dbJS9cl1BWp9r39fQgZ0hspEKNVeFP7c5HBX4834lu8cu/YYhQXiaw0Mgbi?=
 =?us-ascii?Q?XkYIv59BUtzR45+7FKTWufbGy1UxFh8g8yn9Xtf3XLdmGotbVdF2EeSdCJ+R?=
 =?us-ascii?Q?2+Z63l45qosI7OS5A3Mk+VlTGn1le8mBpY2mIenL9SGclRDjrE4FVQQAhNRB?=
 =?us-ascii?Q?5qo4MD3d+0Wmh5DY6Ye7FgUbs2pyUOEdiNmllX8LFzZngFzKlMu4UvFemIe1?=
 =?us-ascii?Q?84fTCkNTvkVg2/oHxC0E1vU7uefjWL7MLfcw0rn5V524NVwTjkMJN9FJ4QIx?=
 =?us-ascii?Q?RNaIg+iptGj87lGyhAab28imtO6yfPDNoRfsegleJeiNEcREIjQIU0niSHuX?=
 =?us-ascii?Q?elKJUUvOER+Yu7iSP9XBZZPA/pIQmTBxjElG6dobb/h0VL643WtPblbcZk1W?=
 =?us-ascii?Q?UgcTpHNCI2dvZZbrQgjlVlsS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ed5084-ce66-421c-bce4-08d9482c63e2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:36:14.3939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KM3T1fIYGQHORQWkAtu+vbtekHPNi9DLPb+8tbgNXiBviEJJwCeb8lFz6OE85qF7ql7WmidzR/FHHRTSil6NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_003617_575000_53E9F618 
X-CRM114-Status: GOOD (  10.28  )
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
---
V2: No change.
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
