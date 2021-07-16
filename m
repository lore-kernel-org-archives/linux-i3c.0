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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7005C12002
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF2F613F0
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jul 2021 07:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF2F613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3+Lv+6z3LZZXZBQIWZGhw9l5+pHKdyov9fRa1vJGeM=; b=ACZvqFE2EOJZNY
	s1Cj2KVllrbR6IZNABeG62SJ/Zx2ULqkW3Y8leAs4/Fm+6ajORTA5q4YV5z1tjGvvltC1OGf6bZ9k
	xCsCZ63+DMw5an6UNUdajNJ6z58GDwSGlm4D0hNawY2ZG07Js/JHiuvdwyC7AsWE/N9Qej0MtVDki
	ufH4JtTqoGh7ajzuX6FXnb0ZphoeOrXkzOWFNgbQGHO/fTPfnIzHs0lKf3ZbiuE3ByM+yyMPgpXD8
	sZMlemQONXPbWuLokibQEsn91l7ymZGT85xhuSy3utLj6bhx6/oUUwJb1dPfwPh6avKmrxz9R4mVj
	Z9ZNr8y2352st79geRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IOa-003XuI-8E; Fri, 16 Jul 2021 07:36:28 +0000
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IOX-003XsB-SN
 for linux-i3c@lists.infradead.org; Fri, 16 Jul 2021 07:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1NDRf5zuEU9W9DPWW71dkcfrbRB9GakA/fzmDPacZxZ0GfB0RmC1VymtIXvV+wPHFGKQrJWMRa1FrgB4Yx8ybQseR5CfVpUo6MCX4PHJP2jDaOeQnt547ndMlfyP+F4Wwk0od9zqQ6eXwT3Hv47QfiU8ceZikjHCo7nnwuTvkp2SLy6i1W8ogbeSsXIE0qzqmzVhoHcUk9OGWAwDfEBOBX9Fs+0ek1ZZH76Hw9tWewwhhX6wbNJBGJkW/rQV9XIsz87aFm4lJp3JtAqbINgXIW6tLGsEDgXFfSNIQEuG6Mx89AaSzMv3IJi+K+5wqOusd11xzCv4ADF37xY8qxIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51AyBAN9vBpW76g8MjCYD5e6O+JsF6fl375MG0evAac=;
 b=BV3iKK9fl5n0Nc894DfIBV9O01UAVLF7Pi1AEErfUFii+7sK/NadXuz3tf6rr15G1Z6PWcnDcewvNHCyqO0pkH/XNqUSL0j7q/YkD7URficPnaeK39lyE8oU1WShnj4sg6lvnlGPs3IJNk2gllgz/AtH9RMEUTwBp9Nhr3sod93KQHAg7eF0sCDkwnLDYVnHR1NK81e3WJ1CEo0Cn2dxqtaU4Mg4v4VmARCinA4jPnSlHZQB3f2ksVsQJa/E2gXDho5pWFlx4GIbDOmf9fBsjVInXsUSvLmG4QKhvGhmhxIyKWYJMtY0ceKlWfVREyuK3SccqYxm11C2IybE4UHbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51AyBAN9vBpW76g8MjCYD5e6O+JsF6fl375MG0evAac=;
 b=K8VqzrOIjWk83Bg7ylttG5a92Td6Q0FudZiSjOt8XEMVhpycCp8lcRCAvH+c6cA241EdXD0+qQHKSUai7C/JTCYtPSzGJoN/0udhP3/8+S2muv2eQrLQRYvKWE+4M5TzmUPwQ+5NB+XLYJng51NBEdCdXQrytY8Ju5fCDd9kf0s=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR04MB4759.eurprd04.prod.outlook.com (2603:10a6:20b:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 07:36:22 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 07:36:22 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH V2 4/5] i3c: master: svc: set ODSTOP to let I2C device see the
 STOP signal
Date: Fri, 16 Jul 2021 15:37:22 +0800
Message-Id: <20210716073723.3490180-5-xiaoning.wang@nxp.com>
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
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:36:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92cc5143-a929-48b4-bad6-08d9482c689f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB47590B9759AC39D432B98864F3119@AM6PR04MB4759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGYzIIBwoM46dvNBM7xBpcSFsjRQywWW+ZrnqTRbr7Wk7M7Ub1Bc6huZhV4R5W2TJH47FhRDjAGTE7AL8o+Hc/4FqV+9i4x70hSX1wnW0UWwIDrnFQHQLzm3y/yNWQmt2YjXbEm7O6BF0+V60LLor3X5EHK7LZBaUkUKU421aDbXzbOthkJh2hr4ZxobQP9y4cc+tSWqIGJq5M0bjnXNV7gszqIqnYZE79h9Wy2r9BBfkBe8S7IMMMv6ie10+xnAD4kMs9xrsUyJcAMW3l/RnKsCNM4wCvwSJfRusK9y4L3JECEB8cbbhKR4KqJKeRSGBBo7lbaLx6Ji0bjKtqk1ED82cYbSlElm2ISXS6zxNfzO8OLfj5VyNH/uhB3L5gLFpck/mTKXlDXIiFn4jccLXJDOdmXUsZ3bB7DxPkgRZi3pzd8Y/ex/Kqm80XjU9WFFY06Ls0NktoF7ABjlS6qOq5jI2VbkcU0xEsFmeTWFSJ3uE+smj1btbioQK2Eg74eWGlqvezUSkLUa/VQU90m0FShSTYYSghr8P6j6rvqtaEnYXQ+hW7mmqljTHvWIPLYmEl7oBkPChNoh7Q9JJs7gykFTyhyHBwXzJZVmgU7NjboQb/7buW0td1d+hoMuOO+URjf1IctGK23uv1c2pRHvdEZMIWToKlSHOVvP9mYKeE40SMhL82rX4QTsA+2IlXHsfDUhohmOKYa47ccPjgk7sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(2906002)(478600001)(2616005)(26005)(956004)(38100700002)(83380400001)(38350700002)(6512007)(4326008)(86362001)(52116002)(66946007)(5660300002)(6506007)(36756003)(316002)(186003)(1076003)(8936002)(66556008)(66476007)(8676002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WGxlZgSKCy4/9HkobHkgvvFnKVu+03W3NXC0PcmqNFib2w/DRsuecle1fTCc?=
 =?us-ascii?Q?JOfdQVDW9PojwFu8FAwFNZYu6K8UY6HrVepJO6a6w4EUt7DWRFIl3g1WZ06L?=
 =?us-ascii?Q?a2HUDa2MfxQYA5IrjZvey4jdMC1R5Uc/ubV98FgOn9Zo9hEIWvtljZCJnAAM?=
 =?us-ascii?Q?XyMH2/GxvngONMdU6m+FLHWgd+xfBHs+D12QvXZ0RcrQuEqneP/r4K4577LX?=
 =?us-ascii?Q?b51lIniZJP6ozlbNpRoJJ+92uaqUd6lawkjaoy4nA0pU7FWwoThYEtRXE+ND?=
 =?us-ascii?Q?jHnaJIp3iei+FUIMR5vxBk9kohbzOt6Bw6StsHWr1phh2JZOI7AJa9Q8UKDP?=
 =?us-ascii?Q?Y3RdrRAYT8Rur7eOUd7drJ6QyLlQH6Pr4BbaF0feXuljxLruqJ0GMh1oJk6b?=
 =?us-ascii?Q?hwVzcYxmsytMtZ5mvdSVRnS2Uh5MV4xPBBmJNiZN/9FdQVld6aCnCnAmRqaC?=
 =?us-ascii?Q?rERbGN4ClZ5rKBp/KWCl7y0viVmdbS2cbCLsKkTvGDzbuwUFQlPkVx5OhxLU?=
 =?us-ascii?Q?+tmamBlDDkhSov5JD2ZnigzHf/0So8jN9ELS6OEAI8t+XxcTRTuUgCkF1x6c?=
 =?us-ascii?Q?0KwAZJ8EHxQPFx91wIrgOS0VXmeNztcZtCvEcHztC4xN+Fbyzi5LvDYfjqUH?=
 =?us-ascii?Q?2q9Flm0o0d7ZSBND8RfA8bxLefwdtRdQdTiGooDiSaGNkxhQxqwwBaxu4Rap?=
 =?us-ascii?Q?NOKxiAzbJR7BE8VWmGokVXhxM5FJp5o/B1eFN6vWFmiX717uTXoMK0dBhxnf?=
 =?us-ascii?Q?LOLmgWvR3jBvHVQzHiWEVemRPedRHpUiCmAsT32VYjqLIai91iWDOQX8+jvM?=
 =?us-ascii?Q?zddF6u9b7M35hpGCcAfhMd9lMK3aSPdeBOEf+zhbwrCCXgoOs1BaVz+1e0JK?=
 =?us-ascii?Q?JKm/Py2rHhqUkv9eqnRk9Vt7q9IzFq50kD7TtrO/6Aw7eRnqK1no9mXltpk2?=
 =?us-ascii?Q?rm8vRpe4OyHGpB+b9y0Dga/4oGmbAfBmQiSiaZbjsJnlAsyToi7NBzrG3vQt?=
 =?us-ascii?Q?lUaug/TCDcyD8aeBQH02hF1R6yWd5QB41O/N35M8Hjn2JHdkI7UIjIQFkO6/?=
 =?us-ascii?Q?hiQNfCrTc8pJsIi7oCaVoACYWJdwE0IjFG3YuJDDYL0hXZbXcsIvt7QfYi7v?=
 =?us-ascii?Q?fp5AUo9K9UlymUtTDonF9i6U1/g+m1kZaFxEY3zWB1gIRqYoGZpKpAUVMSKQ?=
 =?us-ascii?Q?RfEdo7ejv5J69b6w3CwPTUnIRxCP86S34EkEh3CDJ6ZDmFqhzuW0NH8jHY6b?=
 =?us-ascii?Q?rkBCaqpgz0e8J4eVexmWoJ8h7PD8slBSrxwnHsg+PAeO6dJLgsPqlQJ2pX0V?=
 =?us-ascii?Q?ups5ZPeIn50qrcjIC/iARfSc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cc5143-a929-48b4-bad6-08d9482c689f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:36:22.2754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RWMX7I2/Ba9FiCbZ6ZN6lmEPlHKj2PvGjl+aOt0vbB4orizArGoxDasrFyBq0cYJqn3QStelneZEOwvWzVQ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_003625_959636_8813E1BB 
X-CRM114-Status: GOOD (  11.87  )
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

If using I2C/I3C mixed mode, need to set ODSTOP. Otherwise, the I2C
devices cannot see the stop signal. It may cause message sending errors.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
V2: No change.
---
 drivers/i3c/master/svc-i3c-master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 91358cc5ca07..5677b5b31a86 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -449,7 +449,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 	struct i3c_device_info info = {};
 	unsigned long fclk_rate, fclk_period_ns;
 	unsigned int high_period_ns, od_low_period_ns;
-	u32 ppbaud, pplow, odhpp, odbaud, i2cbaud, reg;
+	u32 ppbaud, pplow, odhpp, odbaud, odstop, i2cbaud, reg;
 	int ret;
 
 	/* Timings derivation */
@@ -479,6 +479,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 	switch (bus->mode) {
 	case I3C_BUS_MODE_PURE:
 		i2cbaud = 0;
+		odstop = 0;
 		break;
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
@@ -487,6 +488,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 		 * between the high and low period does not really matter.
 		 */
 		i2cbaud = DIV_ROUND_UP(1000, od_low_period_ns) - 2;
+		odstop = 1;
 		break;
 	case I3C_BUS_MODE_MIXED_SLOW:
 		/*
@@ -494,6 +496,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 		 * constraints as the FM+ mode.
 		 */
 		i2cbaud = DIV_ROUND_UP(2500, od_low_period_ns) - 2;
+		odstop = 1;
 		break;
 	default:
 		return -EINVAL;
@@ -502,7 +505,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
 	reg = SVC_I3C_MCONFIG_MASTER_EN |
 	      SVC_I3C_MCONFIG_DISTO(0) |
 	      SVC_I3C_MCONFIG_HKEEP(0) |
-	      SVC_I3C_MCONFIG_ODSTOP(0) |
+	      SVC_I3C_MCONFIG_ODSTOP(odstop) |
 	      SVC_I3C_MCONFIG_PPBAUD(ppbaud) |
 	      SVC_I3C_MCONFIG_PPLOW(pplow) |
 	      SVC_I3C_MCONFIG_ODBAUD(odbaud) |
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
