Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6633D72344
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLYKTInvtDjwiAle+tWzTEPCA+U8ZLbw0HSJWXIPilw=; b=DSnb4F56kRQsIX
	Mt9scC8CvFGLZpIGQuj2pp5ef8ysccc3l9InRCepI/xgVeMiJTHm3Ftrw64NC6CKJ1JVONfYC+2vP
	55VLdhEm7NpxGXQILFUSf3abi2XACAgt9VWeStrzQ6IVbiUdMNhmPX+KNNSPK2UBmW1nDl3EhFumO
	tQNgUEAsaFmbXPfHfJX6JNB87ZKEVxstVU+5EM/32bF026JAj40bsQt+/yFYHjFJHJa00i4Y3stwU
	Ri3UUQyJYK9+1/HS3PjLc1yopAMH5ZVE424s/S9vIW58RrseqCBrSLSzHIZAx20wi6y+tZ1WIdF5N
	rempfcxUOz2o1Vpc/g4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBkM-00000008NnC-2HdT;
	Fri, 23 Jan 2026 07:38:22 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBkI-00000008Nlb-0szw
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 07:38:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYhJmAB83UoS4z1Ybx0Mu+c99c0zNlf4J/141/GDVbdY7Jhqohqv7eBdRXSwmp0QLE6IFYaJHJovAMp3trhdpXkpOmLvjF7Zm2IWkQv5KaYzaBEMkbw4rvpimGybge6d/absGmqzezH3ukQFUw3sWGVPDtTJN9tJhkYQvBTCGrOk2mc6YaPeWaQ8mMcIVkzDNXhWP3lGEvwWFuqHa9tfDtniw7dvI1FIVhy1QQdYE8SxUaGhVwqPpZwYRVp2m+37UUhNs1TehahkWS3qbq2d8oH71FL3XvyfEmCsF0AwzyZEDHjZMcE9Y2lXMrsRUl511Vhkh/p4oWvfehj6GrJLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89g7uUSb7e/x38OLaXxWu0CwCJsiFORH6VVLC12ne60=;
 b=CwgkK03we66BoG5FzI+EyiOljn7P5BsjyYphFtR7uzoimyb91KWfzxuU9OdEtKQbXvQomdOKWm+BCk2Hv5MO5XXIjNBMU4dQ95XCrw39ixT7BQmksmXLEmv07jVC7iSKuJRjozx3pl7rfi42D5dw+BQ6ZttlyAcXXi481JD/S1x43ywSijagiVYKEirEYNd4I+a46B80jXVzO9V3oZO91tw/Gn1r69Ib8XgMNGkYMAkEvLOt1Jav5nCdyBz3BLOvcTNmmdKPvhvuSloEOYaTL1ElGF9Z0V0oQEqCd7STQtrZcZKfP0u7iJXdIh9DheBry+GNewUZX98Mp8sBXJ1PCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89g7uUSb7e/x38OLaXxWu0CwCJsiFORH6VVLC12ne60=;
 b=Xu/YdInIDBGt99/Id29FU42DIAofOTrR/RJHNJSOabR8CZ8FdmAEWbWS2iBxDPUpqTmqlmmV5FfU9kSVck2RDdtcgr4HS8LtpaWOjm2LdBiKFY764vvd1Fox9k1gCkU4N4u6Xhjf/v5YF7NMidkgN8rtgfJtgd7kwBUzawVIEZ1CeZCnoo6QPr0ij1WrKXIHRPim74FO1KIGqFuZIhMdBW/r8H991zkLqgIKspNdrZ/wIyUAJQN7Xr7rOa6MZINHHl7Ind5B+X5hjZkgWMfDasm0fu1kLnbElqr9uie9FswcqJXHT7AjV4GKauvFtLGxbNDzPux6AJfhEuwi0Ot8kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7380.namprd03.prod.outlook.com (2603:10b6:a03:567::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Fri, 23 Jan 2026 07:38:14 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:38:14 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 1/2] i3c: dw-i3c-master: convert spinlock usage to scoped guards
Date: Fri, 23 Jan 2026 15:35:11 +0800
Message-ID: <80774b6019ac3daef5b1f01445e3232bd48ee391.1769151395.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1769151395.git.adrianhoyin.ng@altera.com>
References: <cover.1769151395.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KL1PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::32) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 16994848-b01e-4e23-e0c2-08de5a525d8a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LOJ5HOOgVyiS/2nP6qi51IYvAru1r+Tybs0cpyWoVhZNu8/JGvbgIs5rJIT4?=
 =?us-ascii?Q?axTBs0jpc4ut0w/ighz1jwZE/v+AsNqUxkGnOHdnuoP9CJl6MNYXVbi8DEAP?=
 =?us-ascii?Q?cmJJ+x0/tyul/pN28EX70qGBr7syx8ilGZFvkvz3i8GqxYmyYNPiV28GhpaA?=
 =?us-ascii?Q?lr0Ppad7I6dLqRB6MhMt7Nh5mFZQ1/MfJGJNeFrpMqjOztTvp6WIqoLrin8C?=
 =?us-ascii?Q?CwtlFZ/cG13HFA0nihLStSYq1cpvKmNVXuoLoHiv1+82/1rz+SnZymV+lMpe?=
 =?us-ascii?Q?Qo/mAHnL6yDNcu7MhSieRynH8vyfDStoATJbeeealj95aMq4lLo6+lFpwKcL?=
 =?us-ascii?Q?ilT1/EcigkoCWnYILQz7TUAoY+e2MeKC1MNaJs/wnY/K7ogFoT/7prFPrbW+?=
 =?us-ascii?Q?AygMN/xKokk/gsW0gLSS9nT54MgP5CHnLpIk3264FR+N5364CNyjVK5AdpDo?=
 =?us-ascii?Q?0GJzfkrBvLlv5aXiYHBgo2eT+ezb1IG7GRa3afsftr83UfcHVX3JhFDsLBYn?=
 =?us-ascii?Q?hetpob8M/KRXG2XsN60k+s595C5PJEs9sbB4WVYa+06eALsiGhbT0sQBrJtM?=
 =?us-ascii?Q?TMrk0cVnjfM1P3ZF76FzrpW0Yvjr2oohd8FNazMGViN2aA91L+c7naJ4rVr9?=
 =?us-ascii?Q?qPErDKiFOYAtfn89ZnxRzC+LfARg+Ql7fKcIzeLQbNBDQWrtg7Ko6uDYXUFU?=
 =?us-ascii?Q?QrJPqGYFpi0C9hYPsBO3pwRCAk2hoyl2W7lPB+MzyEjnqgfX9WS2URXHGPg5?=
 =?us-ascii?Q?ZTpwPy/O25K/LpzK2IlnNN3l593fu06hBnjCJEyxvzKdvC+eHX/iSd8XSMoz?=
 =?us-ascii?Q?b/uSziLEApcijxJmbp53FUJriKkDeOXY3Iy0NhgsJrBXSpsTlFZwgkDnCh14?=
 =?us-ascii?Q?msMV/oFYmT+GNbb972q4Pzd8enj6WFoINBM9up97Ac0Brceh59T6KCUHSXpT?=
 =?us-ascii?Q?YJRr8jOFhb0whmbacW2f8bQMPkYhwZaK0dgTFlxXIWo8cauj12Dn4gY7ixo2?=
 =?us-ascii?Q?L6V00Y/GNMavyeZztlrtYhh/Vxyf1C5D19Uid6pfJutNzX3kuuH3TXUXTljV?=
 =?us-ascii?Q?gj0s0meJc1c0/MNbooa0iwRfJZkzv7N+ihv9OVWjnhOsWwGBFqBu5SSqGK3t?=
 =?us-ascii?Q?bJgyeH1NlPhdJ7sKJfZxNXz1jjLKYbPzoYMcakvuO6X5isXF7MkPwiiIT8KA?=
 =?us-ascii?Q?RZrRwNzU+L8ENEKuBccHmSj+F+OLeld+qBftGDjJPI49qpw3Ry5wlTCBEiuO?=
 =?us-ascii?Q?2CnaMcPzElx9u9DIsI/JV1eUTHcthex1olSUV7KM1cCQhEXUbP/gYSY3QtU8?=
 =?us-ascii?Q?9YgTlAhgrBoalhk6rRTsCVk+RKxU3Z0i6Fy+wIJ5+Cdt4WCKGpQMbpPGUS1z?=
 =?us-ascii?Q?H7ePwadn1IHRqI29qwY/UUn6ZvgFt9NG0tI2JSk8C3M6nbkIbcC3/V4V4dJk?=
 =?us-ascii?Q?tdV2ewTOT3L9H+BCSH4FZnbWVVJ7WOgqJxhp2+dRysS4CbFkLV3SdfnMN072?=
 =?us-ascii?Q?+BB0H3+S6hX9Perl7BoChpEGakJCG2MBMcrz4CtZMy1gPbOSgPv8vH1nClfv?=
 =?us-ascii?Q?h77qvI9b2dlmLIU+QZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1mNWjMGniPS9uRhHH5gF9BmNSE7wj7vAVNNDAP6gjH7EX2i/oq41GHBqpQab?=
 =?us-ascii?Q?ku/K2u1HE6fboOsgsbD6UYVMh4UfSzwJmIbUByg1ttK4OgpyBrYjREWZdoYM?=
 =?us-ascii?Q?/9baoRKNdSBbNhMyEOF47BzdxRhLgXm2CCCvbiilUTcuNteTTNBdd9h40PVm?=
 =?us-ascii?Q?g0kSDEOL/q0QwtDHDw3WXHMRbcrBtYNUrzGC6joUM9CALXxDMLdkGRi0b2/x?=
 =?us-ascii?Q?w2DqYYJ1e+v1vzKP36V9DvqqaHqSeXcXHWBoaDXECUk65xPriSK6zUhNiLI1?=
 =?us-ascii?Q?9u6Sxr1CgDks1elpL7SylE2ENzvFA53GvViHnhREH8A+m1yXdDkZzS32248S?=
 =?us-ascii?Q?iVZzG9J5qHzREic23+FfmdN3JiE/u2aoFI296rIpw1cmHpCBiWaKldFoDTwU?=
 =?us-ascii?Q?JXmi8PcxMCNdQFcYoEc6Yc2VZ8CBLWMFdl7CbpzPFOS/jD+tZd7fkqiWSjKx?=
 =?us-ascii?Q?Z8a1TUD5NNz189cj5UMhHD4V3xjPPZd7tDhqAOmlj7hKBTNt1/2GBiJFj5s1?=
 =?us-ascii?Q?SsOfdEt1BBg/znqdT6vo/FlsxgWLPfJTBFv+oqfxzg80j4m8WBSBYhKYdRO8?=
 =?us-ascii?Q?TSTNxTcf2CAgQ0MtlaOMv33FEBUnEjyU/0kZ3qIW3ih9Q7PscBSESynvOZ60?=
 =?us-ascii?Q?WOS9TCTy92ZHtkIIR5cMqyZ7mDg1/Q39eQ1GNBN8WK/ST0TTAXeC3kIYmRYb?=
 =?us-ascii?Q?fkttVeGCSB3lbFL/vOxARI5/jMdBJMwsQHP7azgpH36C13DGCEbXrFeRWt2b?=
 =?us-ascii?Q?NzwrtsL2IijC3ae/5OKfgc7CAKitgr9CHZbOu8RR6xa4llyB/yG++MKRiCnr?=
 =?us-ascii?Q?tMrEgDyeqDs45BlwedrdODsnjoU+S93LD/Ae6DO53CNorY/5EvbQ1eqXgAJp?=
 =?us-ascii?Q?5YmCzqkTw8JEJ3Sz+QRmmKmLvpPF2CWCxMNIokgXsuLF0O3Cw8Dj775BjZLZ?=
 =?us-ascii?Q?aQCEbggEvXIqQp8KnGujulGNTlhCUvoCS6EbnFzOdBFLFF542hCWpjNG9aIj?=
 =?us-ascii?Q?lar7k2Fic1bSTA4Aj80abGr9uydeCs1Ooq97KxaQIGBdA4aDGJff8yVJp0zi?=
 =?us-ascii?Q?Pkj/t4HwEXlrhxIEVuBIG47PzTxuYK3Z77utszctKKfKi45lPsUKC+1SVtiK?=
 =?us-ascii?Q?V1wCXEPyMUDj1oxjPhZ6IbqBVjTmeVOZnLKA/5FMoqMrGX28Ii3pSyRmM4zD?=
 =?us-ascii?Q?TOB33ZG+32Tnf2lQZ1cYWb8LSUc+at5MYXr4v/Ykbed8gTODBa0FUxyFdcck?=
 =?us-ascii?Q?05OuuPpmzWkJuQr7gLEivEPy2M3++19FK/uPdj9kluogMpPVChtIWv0qNySM?=
 =?us-ascii?Q?3mDid3ySrH5FXXe477j7sgBWQoZP/4wVNVKuWkWySMIJdyzqyW2AlIfhtkdv?=
 =?us-ascii?Q?DD3W5y323+qkVFTQf0bRwfKGNGKY9WqeyK05s9aWj0sUPJh3a8f577YzSuNl?=
 =?us-ascii?Q?A8985TSUQTXyeOnnYlVLtGudpgEMqntt40KdH9LT9h7CzUbVgQUykaTqDHjM?=
 =?us-ascii?Q?e7T+jiNTcNfjzU3oYTQMSE+tnVQug/fMV3akzLCsQb/aeXk1ZHHIjZCOlRpp?=
 =?us-ascii?Q?5jL1dD/97eNj0d2jpUEnSHxV+AP/65l2FNfNboiNSRjiD9960Ijt1BG9cQO5?=
 =?us-ascii?Q?dUCtZonJG6+PBSA7bQmqw2nriyh3puFHuPptQhhyF/je/qi1DTV7b1tHHkP7?=
 =?us-ascii?Q?FOTGG0qCXKReWAMr23c9/Nk0Kqup/Nncmg94VdZ4dHxgN3+vPNNwKr4IVUEM?=
 =?us-ascii?Q?YGQ88AOrW//tpv4DBCVOj5A6OvF7olU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16994848-b01e-4e23-e0c2-08de5a525d8a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:38:13.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hrg5sI8QV2GuhRKiQWPWc7gdjElUJdh9sMGSm0h29RyZVu6OG2qbVDxTwfr52FfZtXvbPxUrAV+MBldpMAyZqa3p/5Aws5opEXONQ9/NAbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_233818_253874_BAFE334C 
X-CRM114-Status: GOOD (  10.47  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Convert dw-i3c-master to use scoped spinlock guards in place of
open-coded spin_lock_irqsave()/spin_unlock_irqrestore() pairs to ensure
locks are always safely released on scope exit.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 31 ++++++------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 48af00659e19..15101f41b9e6 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -416,17 +416,14 @@ static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
 static void dw_i3c_master_enqueue_xfer(struct dw_i3c_master *master,
 				       struct dw_i3c_xfer *xfer)
 {
-	unsigned long flags;
-
 	init_completion(&xfer->comp);
-	spin_lock_irqsave(&master->xferqueue.lock, flags);
+	guard(spinlock_irqsave)(&master->xferqueue.lock);
 	if (master->xferqueue.cur) {
 		list_add_tail(&xfer->node, &master->xferqueue.list);
 	} else {
 		master->xferqueue.cur = xfer;
 		dw_i3c_master_start_xfer_locked(master);
 	}
-	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
 static void dw_i3c_master_dequeue_xfer_locked(struct dw_i3c_master *master,
@@ -451,11 +448,8 @@ static void dw_i3c_master_dequeue_xfer_locked(struct dw_i3c_master *master,
 static void dw_i3c_master_dequeue_xfer(struct dw_i3c_master *master,
 				       struct dw_i3c_xfer *xfer)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&master->xferqueue.lock, flags);
+	guard(spinlock_irqsave)(&master->xferqueue.lock);
 	dw_i3c_master_dequeue_xfer_locked(master, xfer);
-	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
 static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
@@ -1194,15 +1188,13 @@ static int dw_i3c_master_request_ibi(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	unsigned long flags;
 
 	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
 	if (IS_ERR(data->ibi_pool))
 		return PTR_ERR(data->ibi_pool);
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	master->devs[data->index].ibi_dev = dev;
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 
 	return 0;
 }
@@ -1212,11 +1204,9 @@ static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	unsigned long flags;
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	master->devs[data->index].ibi_dev = NULL;
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 
 	i3c_generic_ibi_free_pool(data->ibi_pool);
 	data->ibi_pool = NULL;
@@ -1243,13 +1233,12 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 					  struct i3c_dev_desc *dev,
 					  u8 idx, bool enable)
 {
-	unsigned long flags;
 	u32 dat_entry, reg;
 	bool global;
 
 	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	reg = readl(master->regs + dat_entry);
 	if (enable) {
 		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
@@ -1274,9 +1263,6 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	if (global)
 		dw_i3c_master_enable_sir_signal(master, enable);
-
-
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
 
 static int dw_i3c_master_enable_hotjoin(struct i3c_master_controller *m)
@@ -1377,7 +1363,6 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	struct dw_i3c_i2c_dev_data *data;
 	struct i3c_ibi_slot *slot;
 	struct i3c_dev_desc *dev;
-	unsigned long flags;
 	u8 addr, len;
 	int idx;
 
@@ -1395,7 +1380,7 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	 * a new platform op to validate it.
 	 */
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	idx = dw_i3c_master_get_addr_pos(master, addr);
 	if (idx < 0) {
 		dev_dbg_ratelimited(&master->base.dev,
@@ -1431,14 +1416,10 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	}
 	i3c_master_queue_ibi(dev, slot);
 
-	spin_unlock_irqrestore(&master->devs_lock, flags);
-
 	return;
 
 err_drain:
 	dw_i3c_master_drain_ibi_queue(master, len);
-
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
 
 /* "ibis": referring to In-Band Interrupts, and not
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
