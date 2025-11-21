Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1597FCFC29A
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQiqpHhBoClyvBPZzm53hEbAoCVCq0HMXN3LcGzatj4=; b=KlNmvbMgCm5gIC
	Gl8Tgtfxn9qjzmsGNhiXUm9DFgVGfsSj6AK4EJLMtptJE0025WKTKk3NjYMPxu9IfzwHsgU23EBAV
	tsqQAUKpe3jwNpfLKHspCfCzdseQkvS6ALzs9I+JxL3du2kuB2NCwWVDnU2XtMHPke4AF9ecJgBcs
	+bEFiKXwAhp92gW9Tjbz7gGQ90TZFI7OCK18Lzh+0iSJQdypN9OzST4UkhMWkiQ/2tfmhMuhbk+l4
	rOw6BKOVMYeUz7/jsJOS0dpvWy8Jr69FNv6sLULaCtG8uGQOY4eAu4wOvyDjQZ2F3pBlPJHZ7Fu3k
	b8IRGDv6gXpkNEKFZ1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTc-00000008pLv-2rkv;
	Fri, 21 Nov 2025 18:03:20 +0000
Received: from mail-southcentralusazon11013001.outbound.protection.outlook.com ([40.93.196.1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTY-00000008pIg-28lj
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 18:03:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqfAhHeqlYPXS8KzK3fDp1PgxVvhG8R88D6PjNTPuTk6I551VmNdS8E7s5mKwuCZ7H4dum1OD79SDBgL1MOkAAxavr2mg6m/rfpm4xPCMl2/cq2qu2cpDsiNNbx/NRlNfvpl8mKNPxHV3GvZLVvEUf6bVze3EdEsC+ma+OV1Hw1JLOctvA0KUwftxhDTIqjeKGl3CJRw8X3fFR5kpv7ylSIJ0cyKu/wwQ2sb6OSK7bo6iLpXTd/2Npj4o5FcZmdpvTQ8BN2kZ7iCSIDn+6A+arvHtWmKyH+YXzLoMqNZ3up11hgAidq2Mkpkor3KAPVvLXiyaVIntmQOhWs5mx9j4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kkhM4wTZWstIHv6jvBpyzvbuCS43FJKrGOP1beEIGM=;
 b=JG9M0rYZedx1c8cUmmGuf53LJ224Ngi+xEXHncQ9H2/x/tHV+EfQCPMMRbK57J8AOqXjoTbIBEh1+sjj1ahudUqUFnWC/1pWW7TrX0TU3FTU31B1kmtYuHKx1VQMi4pXeOtza/gVDM/mP+llddnZsy8i0J0maywoE1JpXjIA1dsKa9dhg2ri2e0BcCP44zWh/cqI4CSMpTGKlatKWxWqHR0uaUS8Jgp2aroVwBDr7SUiF9TtHo1Wf34Htuv8D7Uud5HvF4XUth4AmXDicjQlq+/Y+e3icqGaklHFbHwDPN4icJgYoJytMBfOHClwYOM3qJCJtQrpiE1joX6164vgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kkhM4wTZWstIHv6jvBpyzvbuCS43FJKrGOP1beEIGM=;
 b=bdEbv8J8yo+zacR8YK/VeQgMhcv/A/wfOhXndjwyf35oa486lIui47W4b+DGqlLidNRmHsFDPF05IvgQkS3XpsRPs9FBSIpPQW6FTsI3wkMVWA1QJNFMVAThu621XMURG9i2zu2rZ59fFAE7eK1zz4gyrzREow93ZAWIklychyk9xOlgs7ycFezjIPxvt0db0LMoUsFy8lz84soH5rTpt8CG+VzXfILsN8LGJJQvAhJY486/xFeaGoU0vzYJboF1yb+VzWARA1Pi6Zy3kBBetmMiXnno8mVTvf6Y+twjBEqokKsxqqX4pzYnme2DWnewwgeo2oJCoCyBeHVx32QHQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MN2PR03MB4926.namprd03.prod.outlook.com (2603:10b6:208:1b1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Fri, 21 Nov 2025 18:03:13 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 18:03:13 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 3/3] i3c: dw: Preserve DAT entry bits when restoring addresses
Date: Sat, 22 Nov 2025 02:00:41 +0800
Message-ID: <4e73b935ea8283114a4bbdec1a1ca38ff9f5df92.1763747151.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1763747151.git.adrianhoyin.ng@altera.com>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KUZPR04CA0028.apcprd04.prod.outlook.com
 (2603:1096:d10:25::12) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MN2PR03MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5f86b3-1121-472f-0e1d-08de29283ccd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QzAnQquIqQ/ABZ9ASVeYtVcxS6VjgqOej16Be0ZpvlXEwURklCGfssShg3D5?=
 =?us-ascii?Q?6RAhm6w3+OAmRgVZPqc6yGw0bME8/xh275Xigsur38DC3pB9TfmBFoxWdcWP?=
 =?us-ascii?Q?nu+01M/LbVdkhEwSapWDfiNLDCDBNe6Xv8OFg2Z5/f6huBLB2yT1gzr3F3Kq?=
 =?us-ascii?Q?86NSzZ6hpW0tlZls5NmVjzE4/JuG+15mNlc0yiR+iwagdA2VATwYT8vsePri?=
 =?us-ascii?Q?8TS9sC8dWMhFQNP+vi5pTkrsbPjrhtMl5OENTxN9GX9dV/BrIxU5j+Yu5jPy?=
 =?us-ascii?Q?ErMlYOXMTeOdeZ391fpdXbJiAjsLo+vt1m9qe80Wn68TS/FgOV8YHkVE9XIh?=
 =?us-ascii?Q?LusfQEeC/PFIL5KDAlSBEvoZLvsh7RXaVpF+t8VR0MoWnqdicz5b6tehR8Uk?=
 =?us-ascii?Q?sbPhUsrVvbpsBD8EKQHfmLSWtKPotowJ0SIHyVBh61uE/Zb3UU7+Fgw4CY5A?=
 =?us-ascii?Q?f/GvdNZSO4w8XKVUv/kMGxrPa3CBk76e4rDWenuY9TpDsuqvlbeG+CJuQmbn?=
 =?us-ascii?Q?yoBoHcUqYjBDEJiTEOyyQOu7x++Gk+djQlo2R3MDlAuVpCtHoFUi5PZPgfOr?=
 =?us-ascii?Q?dMyMS/1b709qJJ5ZoFTbCuKq8w/6E4qD6Ff/hrR420xvYghyy9gB4iYqxIp4?=
 =?us-ascii?Q?LpCQGvg8Bq9p5jpPDMAhofLCZhGAJC4K160rW7by2fZRiBQEREZW9R5PNrZB?=
 =?us-ascii?Q?lNzELy+fYRUOOt84aJPMnu4EUf+DFtG5YySvZUwnL1s6pFPHVUaud9wMxPFt?=
 =?us-ascii?Q?bVD7eM9jMzoJyduX9kbmermMAarfvDkSoCw5tjBvO1+5TMcaOcFLkV4c2C5Z?=
 =?us-ascii?Q?V9eXhuSrVlonS541IJcaBkUJzaJA5rBvvE9y/A+ewH4ZlL4rQuzKqrxH3Sbj?=
 =?us-ascii?Q?UpV4AMB/UZ8xgeBFGfwjeMYM7MeSQtYIGlRoyTz2mNc1xU3ylUin3C5RhSiZ?=
 =?us-ascii?Q?xDW2XgIycgjvbPeLwzcwJHxU9yI7yexX9wmKnFaTz1nhr1vwRD+ehibtn8IY?=
 =?us-ascii?Q?/4ZmfWCzuk3j+tBoyx3ozekQBZ/v6jZke1kypizxTYEQvfALQjVQ6/nDUNbV?=
 =?us-ascii?Q?mJSlbonWM2k3OBPGSkTQVP4zYSz2W0hydvQ5ZfPMTE196W7UiTiEvPBIvcZN?=
 =?us-ascii?Q?VWauXvU3lTO3J40geSjtTcCZytuVxLwm1VgmIKaNB5X+HOD1v6ncpBj6Rlw8?=
 =?us-ascii?Q?M7Td4m5IsjkUxT+hkBySa+h4e5pGpUcESUmnbgLn2fHF0BlcL1QDq4lJrion?=
 =?us-ascii?Q?/HU6mmXEyhPewADn4q6mRrJ9WnwSEmjTod3/mJSORdazso8wUP/UaJxsT3B7?=
 =?us-ascii?Q?hm170/sFb+KP+0LkZSfaOH1am9DyD9xxRrqI8PClh5l2xzZnWzdbB4QisZTD?=
 =?us-ascii?Q?uhqVcvMOhL9HXlkqGbxsWkM2Nz7v1KAmVkjyXZTLUWJ1vwLFd3OPloubJEIh?=
 =?us-ascii?Q?SF2gdGTieUu+N6aht6FPW0KmMuTjCU0Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jydl28KTvSGtPmKw8UjDnEuQw4eD4DgoC9qWhyPZAbowZb91mq1hyiqvKEO4?=
 =?us-ascii?Q?9R11T9nGtbzpW1yjppSFYG5jngU8IFpADZQikU0jfAUzoRn+jBy9lP9Z9xSj?=
 =?us-ascii?Q?i4WPrPV5cBprGjr2TdlomSHjJVn/8XR1j6lE/2fB5y7BU6Iy5Lrh07tVlYKm?=
 =?us-ascii?Q?4B7QxJKGeFeKxP6l7iaYmlOB1QhFeL3Jqrx6PAbN7p5rsjBV6PAs7n3ojgDl?=
 =?us-ascii?Q?5X+uoPpkiVW4mLeVhRAaVWYknAdx7VvavySmDKsitVI39B+PETlvP37UQICE?=
 =?us-ascii?Q?9HJnrdcbQBPm3zuseXDio+2kcSph4WImOD9k/Nh1iZ/3v/t8rYRXqLQO1RA7?=
 =?us-ascii?Q?a7p3c3/dWD4ZEf85nQqWPdkGU8QVxtmncJzZ6BdcqZxCH0OzaFr1ny+vZJHm?=
 =?us-ascii?Q?+mguixdanCvYdN4owZewhLK64uOzMCv9kXnwRI9YOSAn/L078bVDW4ECLHM5?=
 =?us-ascii?Q?WE4Gqn6O8YqOaipzuUiU+k8QcLpWlzZi3riYhbR8ohsBl9+Hs42faejLKeA3?=
 =?us-ascii?Q?FliA++cnmafpqvYPX6FjvHCDMmGLh9JC3HIKr1/P0BLud2WB/9HHeYD2AXf3?=
 =?us-ascii?Q?yDgTIl8SHFSFWP/G7eL3zkJXVRX/arVC0Qf2ovfJnm1GTT67FZ0fWiL1QW5r?=
 =?us-ascii?Q?XORAA78uW4NnDQb+1w8W128tOgC+aeZm3JAbeDstkYzzbcpoTVbVFhrRXh0g?=
 =?us-ascii?Q?1HP16eJSMewIfw7t+RckC/MWyOP2XiRI6Cb6semkzHC9yBcvuZ1mGtTI0qtr?=
 =?us-ascii?Q?sp+mU2253YnfkVBZsaxkHOK8f2UOTt/VBktt5dfobYpCZ2buSTGmEoFvouCJ?=
 =?us-ascii?Q?AYMJ42XOzKUpSc4mwzhD2LP6XN21E4/xw2LFB8OJm9S2hbNRntNWLp5nyiWQ?=
 =?us-ascii?Q?W59OluQ6+QagNmKds/acX0gSewrFUKbwUNkuvCainMMfkixwZGi9Cf6z5pfl?=
 =?us-ascii?Q?Ges2dUTTms4xPXGnBPQ0JBJxXMq0A885GsOyfUVmy/zlcij+q63HH/KR5nsl?=
 =?us-ascii?Q?xi+CV5vUCBHCPueHyubEzp3zyY1OeMozIE3iZyDkb4+ccS498f4YTnEIAdSE?=
 =?us-ascii?Q?ESxCu6ue7q1Qdsa8WHtMzK0zNLAx+O2NuZzm7JsFY+G9nj9d2CNpbj8S+pWz?=
 =?us-ascii?Q?iMJMYGoouZla/IUo4OK5h3kcjtFftxeOJrO87FZ2YhhnolukiJwgGuhAgq1U?=
 =?us-ascii?Q?5mqbvRd1OCXOCBHUpgH39wP16QUTX6Nd9zVgrCzThuMn1QU0Bacriv53rK+z?=
 =?us-ascii?Q?UYxvwm5SkgYpSqoeFjRxAbBEOLts5xCqj1zgLvHoehfsu5WPb/AWXwH0LO1k?=
 =?us-ascii?Q?ORDBgDgMcB+vp0ALBtrJnadreAQmENuwKu5QDl7waPRJWOdnZ0Mm0yXmUMgM?=
 =?us-ascii?Q?cBv/b55buLJNHp4AERLhNNQFYx+tURvhjMUKlemEJ7EauvNGIFabIxKLgOuq?=
 =?us-ascii?Q?zesk2MxbVhzeiGDJwUsgm/509Bxir1cXzdEOWmBeJw8FiXJ4p/mAuKhoOXyG?=
 =?us-ascii?Q?VvSllH//q0meVqEG0LM4U2WDmVUFD8zGoe94GFpdxihqD+HWBlyd0a1OR7ey?=
 =?us-ascii?Q?a2jhdWpa4YM+vRgK4QFSgBgtSsMhd687dqaqI6QL4tZkA6e7njLoz2TPlBBQ?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5f86b3-1121-472f-0e1d-08de29283ccd
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 18:03:12.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zM1FxrnmrU8j+d6rlg/nb+7iVlDHs9gIDyzMU0zktiywVje3v3Wk9Jk5ZviioO+H8185/IBweptQfpIw67Ch43OVmZsDZ/MXT0EP06ByuQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_100316_552772_1E34D48C 
X-CRM114-Status: UNSURE (   8.42  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Update dw_i3c_master_restore_addrs() to preserve existing bits in each
Device Address Table (DAT) entry when restoring addresses. This prevents
overwriting configuration bits during PM runtime resumes.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index e228c60840af..37275f7b6c61 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1723,11 +1723,16 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 		if (master->free_pos & BIT(pos))
 			continue;
 
-		if (master->devs[pos].is_i2c_addr)
-			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
+		reg_val = readl(master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
+
+		if (master->devs[pos].is_i2c_addr) {
+			reg_val &= ~(GENMASK(6, 0));
+			reg_val |= DEV_ADDR_TABLE_LEGACY_I2C_DEV |
 			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
-		else
-			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
+		} else {
+			reg_val &= ~(GENMASK(23, 16));
+			reg_val |= DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
+		}
 
 		writel(reg_val, master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
 	}
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
