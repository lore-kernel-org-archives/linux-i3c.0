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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B1BC6377C
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:36:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A475613DF
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A475613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3vW2LWizz8o7o5t8F+tngoSt/U86VMTjk7FoSkgs+0=; b=II2bv6/5YIlo5D
	uJL5dyOVDfbP7LFuH+qkc2XVXStPIL9p64qSZQnERfK48y+aQNlUTAsZkwSBg3jMwEXwt5iQ/RlUk
	aznaCYFwxN0kbzu5daYxChy6Qn2dhN0+8+91A9/0Pr3xoHb3xw30PndpsseO+sCXtdTSgxysdVHUF
	jW0XOow3G6TRseFZ5mAXwSfRwrOIs76FbdtqGZSZtzVTaRP3JHTiN0ZM+32A6vGyLk2lLJIOJ9prd
	xBRn7rHpukWhe9DFJWy3nCQy/zDRC9TfOSvzS1dM92pHyWdTxGSUbszxURUj9+StqOT166KArp7mV
	kJMiLS5vyYV4tk0l0UFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IOT-003XrK-Qw; Fri, 16 Jul 2021 07:36:21 +0000
Received: from mail-db8eur05on2078.outbound.protection.outlook.com
 ([40.107.20.78] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IOR-003Xof-3c
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 07:36:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVf4YLHSVY3NNzXttHCUo2YKSAvuEbdxQl2VvyFvmi1CtdbJRL4NsCI9QybSpLyRTBXeMv+8mR4m06Xib5WhNoHza+nevkg2Nk6gkWPfuHv3KcqmEnWYlg2PyvEBMc1hST8k3XPTbtnoA28XT+LzjMBO9540fgOw1B6rVAqGJn7oLJFKHSmTZBC2oZMDieaurUjzuV+6OQTCitDDQ9ffnaUdnGQfQzTuUjmc97NXwLDr7aA9iZTq/I8gAkgKBX5Nt0+oyzJ3hLAXPaQ1+IVWXhucv2rxO2MOhY8rGcckuCL8uz+Iy/Gfi7WW748nijnQGlv4bwTE9sS6kjZ6NqWFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZV565itl71k/JX1Rjy1rKPFPig8Fjh0EGUEid+lA/iA=;
 b=j7gOELOvq2V1tmxAJvOgG1V5tEx0vCsd3Kq6K8kSCKXr8lLtXLniUnmLQUTluaSJ+oupq+Dyraz6ZqTr9mVpjTQQWpADh4W+/mnKQQyIBG9vjG/jpxEH5NVyTd2lzoKiP6szTuHtPA1QPIZQroAx6Z0v7Jt3FPV6tCOpqOj2Gp0KQ+bZ8BeMpvkdsNFzrqp9sViI9sMlXwn7WMrjOdNycrBCABGHdCQzAPBc273YOFm8Xub6/saNQzZdw2zq31V6RBjQ5Jc2Cck1bbwODSSVh7eNy9wgIJQlyt9wRInefUYZkEvvJlBIf2vnG0Ob6C3KeXJiXlZMCy8kI8FEWIcMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZV565itl71k/JX1Rjy1rKPFPig8Fjh0EGUEid+lA/iA=;
 b=gLmIKK9wxYBSy+PKZGIv7IIX/UqdyiXTcN3ETeSq83bAGqwMTU8+eRnC9nucXZTA7/cnFw3focw94PR3mInD1w6a+OK6XqT3JHTqApz03M+EZ8hHcEv4pGo5e78YcYbKEUv5DmUx+PpC+Ihs3pTVKhQrPRdT2BwvuSPCqbfA78Y=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 07:36:17 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 07:36:17 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH V2 2/5] i3c: master: svc: fix atomic issue
Date: Fri, 16 Jul 2021 15:37:20 +0800
Message-Id: <20210716073723.3490180-3-xiaoning.wang@nxp.com>
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
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:36:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5334e41-5321-4573-4e16-08d9482c6579
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6997DF1000F5FB073D2F9701F3119@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CoGJq3/IN81+UCgg/0RKxxu2HTxoSck3j7sJ7KIG795jN7T5EIVXEwLx8ugSm1V0Q9jxMp5H/EQSi5JUcrabC4oYgQPaeem9HW2AIdxy/Cl1cFHG3IS74frUVT/eZICT/ONLTDRU97m745o6wi0kwd2UlAmbIt3upX1TQFmVe8yzIftK9GdumIcA6ZfS6mYBk99W5gENFxXCVDxTV/v2J1G4lpyZDQfO6xLi/4D2G+0HPNt/fc5sC00Vc8TSrcQxVxawjDCY7EM+UtZqgeRlEJjMwUAcOZ3VzoI3IiWQju+5Fk+qLe3pQ82XG+dzrimxOjKMYxvinyjStjrLuYitJIxYdU+6awPlrXOyhPzsMF1JguyFdVJwM4IBDrFB0jTbWtfi7+aQ3ZlHiZoyjav2X3hdYOgEM4UAUSYnog5w08NwuGAxfQYjoj62kGt4XMF6fc2AtcMfpZ5h4R3wvJWxAG0XbaVV1r6evdyo9y1yG3R/VC3zIeekVN1Bqh+MxLarsg7KHAwqV9q/g1B3mKez2tlVCjLg6ew14e9Yz/R72AxvBjmheN3wfQaQeTqV6eADCbKb+YX5J3ifWA/XUkHZXMJDL5zyaCiV1pJYj8Vw6xphdTfgaBuwMI5Hrb2s3abRIueKT1axfFWkWdeZyJaJsea/76AqcyQyjyVcNzSwg+2mriwVXTuQU077OGmcQ3AD2vHtGEfIkeHjdfDNt6Nciw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(316002)(83380400001)(2616005)(26005)(956004)(38100700002)(2906002)(6666004)(6506007)(38350700002)(52116002)(5660300002)(86362001)(66946007)(66476007)(66556008)(6486002)(4326008)(36756003)(8936002)(186003)(8676002)(1076003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?APQGJCY6N16yFK0O+ZtUiwXZ/Bz+w0suPliNR2QUfZunZ68jj5LFbLSc0VVo?=
 =?us-ascii?Q?KZVylRU9FHGpOKeBFQuIRjxaobLRHFEIBzd3zaApuB9J/jYQ2cV8dknbITC8?=
 =?us-ascii?Q?jmMvNOHcIAY3mI6zdaE4utwMYXMj+N05qa3D1eHnDEYEUWV8VnzNPfxyxAPy?=
 =?us-ascii?Q?+O99XunoSJ3+aMQoWU0bBaKDd9m6l7vmti5XguWuVabpcV81k9Osx1Yxyk6B?=
 =?us-ascii?Q?s33POSdSk9EoKXHKcP0nSm9tTS4JB2xjKASM6zF2zY89n6jQa8EmLJ28Q5un?=
 =?us-ascii?Q?lMZid34sfd5354AGd68zO83QL5RSUwOobD+CgB7nXHPcyxlZnwLk0P9k1QFI?=
 =?us-ascii?Q?+SnAojv6FDAl857HVVgdx00ZBxGztURRVgbtS06azCVoI56z15eLYUEJAz2Z?=
 =?us-ascii?Q?cFdkYCN0MmA2LZFj9ihRfK2M0aKLVU1Z8QiVIvySTxeIVOrAZrgjp9snA1VQ?=
 =?us-ascii?Q?EAo33IZaktToTyJJbhgMsMUQs/O43PN31tmCQsNaOPFNJw1kdjrpoOMP2Z6q?=
 =?us-ascii?Q?SnG8IT+90uyJU45HXKeXxw2Dvj1TW9RscLQWO6KSczG1LKA1eEcb2rDXbI3z?=
 =?us-ascii?Q?NdXTVZ6XMmOhK9IVK6UBCAv8snTiD2W6bAos6ERk4gIs2sHmHSrj7QvvoPHN?=
 =?us-ascii?Q?WkWIjzF9oPfSh3Ee0QrNBSoAYD7vC5lQaxYQ/PHpI8lWjx9sqG5zjis47YTO?=
 =?us-ascii?Q?s+iTYZNUdrAeT2x8OmmwfdC6Ri1pGgfjG51soGX3kxFUdS/RDfP1RoXEfh9u?=
 =?us-ascii?Q?BM58+u7XGkCPYKa79V5JKcWgp7BiGKGqJLmPnj+ZdUnh2Ntp6BTRctIcwPlj?=
 =?us-ascii?Q?lj5AbIONAzmnPoc7NRnF0klVcS8INH+WB6XRrdwBTTzX93HNtSn3AXMXuYge?=
 =?us-ascii?Q?luFW3LvXDx4EXzQAZ/FXncq/NFY38ABjqnKYKztoDSuqTCLyeKtTGMl0p3zz?=
 =?us-ascii?Q?E6FC8VIAy3g2cx4zP9sLqFUdamU1UNplrA/knHN4tfA2TeZfc0XDiYhd5wQu?=
 =?us-ascii?Q?toHqsXl5jE4iz2Hvokix7r4+T2ArC6Bk/TBNSLZHcUy+6WYSwq1Fg9M5kYzn?=
 =?us-ascii?Q?dSHZRr7TjGjZKEfgRL5A2UdVR6maa6M26KJf0gq1IEYDzSECjJ9l3qKNI/c2?=
 =?us-ascii?Q?khh8OTl12Wn6lEJ60l6Vpy4wb6Et/CxT6trjOqweJAdOIOAHZIBeZkC1TYTf?=
 =?us-ascii?Q?Nyn8TX82RU7BaQBWtHUTTuyxXkUkZOKBaFllDiAC01onj+9NhXnzKUZYvZKo?=
 =?us-ascii?Q?TUgBk1CnrqeH4FRPd82TMFaTZ6T9hUgQTf7OfEIur1rB/7B2xgNh1nNsf9PV?=
 =?us-ascii?Q?HHtQrEYma1mUE+HNj+qhxNAo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5334e41-5321-4573-4e16-08d9482c6579
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:36:17.0553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMr4dx6SbRLIeF57kQguOEnMDBFWE2hL7LwB1BzhSVCMXHsFI3Nq3aSGtLL6S1i3PGjoLxEy1Ab9Fsr3ch6/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_003619_172916_3E04B34B 
X-CRM114-Status: GOOD (  11.60  )
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
---
V2: align the parameters of the function.
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
