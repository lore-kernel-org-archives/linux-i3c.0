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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB32C12002
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C5C613E8
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 08:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C5C613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/T0l3xEvp54nzCnuU467360fQNhiO9jYX+MtLV8fmQ=; b=qntnWboW5HhqB4
	ghHJjD+GmKSGcfviO+XbFF5xsKtIp+vRW2O8F1ilaxD0s3XcOz66IFVbYm4n3ZiVRi55czoMCqgKW
	Z7nvf/T9MTOl5aKsT27IwuDLOz//A+Njvn7IGAw9tudg708TNgfVl9tfyIjjhWVauF2xZHzJd8id9
	0nSX4gYA3xmzUHDbn725H3+Hs4ViEsLuRCDeIFID3757SeS0Pht2r1kVPS/4HnTN0Jt9MNqJdMTcC
	gQlVF5o3QjE2RD6+mJ9cY6wikvy8blSfxgYuRlvWymLvBEaM9nnlA7E3aGGOpcv3XPc+SA2IW795S
	m8gUuIipFyUb7BB5NSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4JZy-003rTu-F8; Fri, 16 Jul 2021 08:52:18 +0000
Received: from mail-eopbgr140074.outbound.protection.outlook.com
 ([40.107.14.74] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4JZv-003rSM-3r
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 08:52:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAZD69AM3HLbw3X/wt/qDEgIukECVTdex5co0FGJVWxmN3/iJF/HitVoW7Sju+jExPHBi8KfZ0F8UPfC9XSxZfmPDzK0A/c9J+5HG6ldN0ibC/BWS9a9sPsq5g1X7hCTGwVCr92rUF6ejYkUFY4AfWaevHgBr+mvOQxQ/rkEnOCJx8ti7ILb1SRbI78y0zH46ntstO4Yj5YYqpGZouyylE5BGLn0VbyjRB9yanxVHkNREcCK8GP8ti9eKvrCCSecph0XPxgRWaAWwH/B1yrzksRSxJRuHRFLr8fU3mCCXw5s5p/iQiMgJdJFyYKVc9l1luV1o6vR0/kH5YmMovkrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqHELfMAV1jQRtFCJqhUnZzmkjktMKYpui8R0icHono=;
 b=NLUyIBXPEwA4zw6Bg1OsTFm1aazkZJwx1AeN6uIg6w0RejHFmeBaoQ+rzQuGC7ejRC/dQ7cQjesGISndjGdkYSLNz/plFuKV2myRB0GKccsJpT7Rd38QjhGTKLLgH9hfAF1+UovH/jA2HtSWwPXPKnd8Blk8Qe3hukOimFMXTwCpcPKo+5JcCL/dGlt5ayAqqOoV3U2Dzz/PDu0qwFpT4oynIcGewL7SjCoLiY6nv5kdlj7zkXvSFv0nH0EQ4UZOgXiBJwaYW9SaeqgxOkGLUG4VHu9/UN4nGBEl0KmGBmgllswNFqYZwnN7LB4+gOyLvH2z/QhPYTyMaXVrsWMHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqHELfMAV1jQRtFCJqhUnZzmkjktMKYpui8R0icHono=;
 b=iZAvWpOfDt1AJIOVmb6cXZ5BzEsBqcuYbAjIPsu1SZJS7PMuaZ4SKPTjlPllftywRUlx7nPYPGij9EWykavBtn3Gn7H+fKoroQ6q7A8vBcoBqIcVXRe9kzzgxysD8jIFBS/k0HsiksOBqpn/0vEOsiFfvNiUf94293M/FIvxKGg=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 08:52:12 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 08:52:07 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH V3 1/5] i3c: master: svc: move module reset behind clk enable
Date: Fri, 16 Jul 2021 16:53:13 +0800
Message-Id: <20210716085317.3572224-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716085317.3572224-1-xiaoning.wang@nxp.com>
References: <20210716085317.3572224-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 08:52:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dc5e029-6a4b-41a2-7178-08d94836fd2c
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71425BDD825FC624F7959FAAF3119@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8C0lPnSDt/mUO9hQIEL2QZa0/EJfs+Zw+SHPgJeH0MrJmBBx0z5zo9s8pRRgM12VBpz3W48Wo04+vpc0PM3G+BRNIrCAUQeIy1Kzsw9POKZKECaeN99Akgis8HefW0+lp8HGosqcWXD0tqDBoBJMH77YQMpk6/n2NrhqiBJT9PXM8rmNdN9QHoLMPoW+IyVq0IXa5+xNd/VVnF6datvVzeGEGpnIREppr0wiFPq7ScWEFYP0XD4Jl/MVfZU/wbc0wKchD74eEY+clSUgBwtontb1Ocg876jal4zNRi7WQQXqDR6Tepz4V4xvHF+s0CrGfOS9ds6ezwIG9wglY/iC9FtZY18zpdcLPtyp73fAdhhucamkAbVrZ5NWEou1gUa1JidTEycOpF3fv5yxYisPEuV4aoH4V7AkeB7z3GGP8/vRAhFnoqFG6zl5jE5iDmZuOHNarYlWSl9EY9t5zhrEBL1JQ7QpWPWWybJxeh5y0kGJwvfnBVCDJpEPYhefXM2i5oDVHiMBaqarLLq3n0yjZrBJzfNZ98nMqcAKqBfSftr63v2GrkoObVO1pDCxA4gtYC6c//FhzY3TENSVRlNXafwcsGFmN3HEOJzkzvXNeGnd1oprPWn9hupiPe2WrgOo84+n4qyjF1kbkDzWGd8eb4S/9+2v5XwhWZmjaoJabYcMYL4e9oMu3RhqUyOjt6JimmZDKiM2msaMo9fCrbl3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(36756003)(478600001)(5660300002)(8936002)(4744005)(316002)(66556008)(66476007)(8676002)(4326008)(86362001)(6512007)(1076003)(66946007)(26005)(2616005)(956004)(6506007)(52116002)(2906002)(6486002)(6666004)(186003)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJRDL0SXwAKiFvZID5ihuVyg2NW4mPIGsZx7YwWizVqmqVGC2m4NZxeISmnh?=
 =?us-ascii?Q?wRHoiDYz0R3SIRF4SwChLalAuHssKOs5e0TvcKuBE6jWrkGUSe7/k4C5XfWT?=
 =?us-ascii?Q?7Sqe1UKssQFVABPNKUaFmrd0mf+GX8fd2eMAaqbOgsrIGiQ/C/vTP/NAPzcv?=
 =?us-ascii?Q?HtzaeHptu1tTrlkqbjl74bwO+XcVrYqRcJ/NO+nx4JtYRZ/bbFUbJr8yz2jW?=
 =?us-ascii?Q?Fep+Lm09t8WQv0ptQ8WPjeIGfwqZs0bMOge14y/HvBdDR9+3edAHJFHkqvYO?=
 =?us-ascii?Q?nlbiqCKEtbzQm4fZjP3kQ+jg3qtfNcyV5a0CHSWbsk5pjntl54zylkJrWRqI?=
 =?us-ascii?Q?c1icbVp6I81PzBnB/jgx3iNchu+HvgBrVPaM5uAU2r/OyKbw0ZZa1iM06Aig?=
 =?us-ascii?Q?VmngFyK7GGE9W8lt6QANgkmHW3QYzSv5wdUZGy7qTJ4T813VdjATfpx5sYVy?=
 =?us-ascii?Q?i8XEPqAK+5Lrsp8imRXEoUJ+z8pXvVb5NRIahK17nLvH8M9W+YJg+8MpKDaw?=
 =?us-ascii?Q?130RM59lWhAZJKWFb5M4tYyqlft7Fw6l9iI708MPKiBJoLIlrP04C7GO4xYS?=
 =?us-ascii?Q?08C8OTg9vHKS9zp5hGAYzM4wq5Pts3UYsOW+GvwdCTyY98Fydw7NVVCpJXun?=
 =?us-ascii?Q?6CL+mmjDpbkNn6ZW6fxQNOy/+JtvDf0vTQyiDjHVCP4AiIA85Ii8G4lYYbg9?=
 =?us-ascii?Q?aPyePzuwHHNkSCoESVxf0Q7duHaB5Smh2TVuA82nW4viWwsPTuJmHEXpFNkX?=
 =?us-ascii?Q?PJ2SvV2JpRyPRIe6Pp6YM94EsPcdeaS9P1T1pAfOGjf1LS15HJStH01FQYdz?=
 =?us-ascii?Q?z/SU/ROjA98NlvQN2IRjy50nBNwFBAXV76z2iguzcB7eF6HT2pmjarur0zZS?=
 =?us-ascii?Q?JNOZ6AhhK1WAZ5OCuxlc0386KiajMHIex4SgBIDz5zjhDJOGX/3s7vIvBP5i?=
 =?us-ascii?Q?SdnkNtRBHlCbaB5Xt2+lIpVqYQ6nWRBzg5DETk6wlGoHzQiBC3zq/XV6znwk?=
 =?us-ascii?Q?KyitfAUrPY9CWLdC/Lk1fImyctmXjpaZJWK39zkfEI8cWIuvkvh4hqDls67p?=
 =?us-ascii?Q?C6cF6c98+11X6ntUI8YA6hzVBzawrpcdFbt6Ghk+WJLVkcBx9UHT7TU6/bAM?=
 =?us-ascii?Q?b/sNBBMCYRTk4GtAHRfhrZbhoKcv+V2svqXMSvs+w5X/wWPEluG1iS7RP6i7?=
 =?us-ascii?Q?N68tJFF99T+RR6rtnxCvs4ZYqdC4UVzmuoQ+MMG2BbZi3EZ/krgAzB1dFp0C?=
 =?us-ascii?Q?GRGNC92lFFJ+lxzPc3UUErPEf26WJdcdQmhhpqOIP1pOtWKg7YD0MnsP5HW0?=
 =?us-ascii?Q?Q3JM4SNKU3DBciAFhfghBpdV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc5e029-6a4b-41a2-7178-08d94836fd2c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 08:52:07.0513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPa5EDi53OzUq+3rAMvn0m/KWulNbyZ4TM4gfeY9AO0oXmEYjNXZPWyhYwRZHeQHezwGG2bHziGI107MEytZ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_015215_203510_83608AF4 
X-CRM114-Status: GOOD (  10.36  )
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
V2/V3: No change.
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
