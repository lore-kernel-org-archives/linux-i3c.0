Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D925D116E2
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Dec 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqlvIXiQ+sYfo0OrgsFPaTtS7kWoTkG4kjhuQYhrEQY=; b=OY6xi2EyOV053t
	eHOGan/zq17/5I65y0gqmH5QEySUXQLF7rewklEWSj9vRQ6hy26So417zeG6nVjB8DSchedA1uRgP
	uNG8U6zaaDumGqtpjYOUsdnwyZCjc33XOKINVNiTBy9y8sRgH2ogu9N43LVdnHM+mWo3FfBiCZuA8
	huz/7fU3x61hyFl3cUdLyJysjuB32aVD4ALR/UUaxmiZUQe+jU3j1Z2lokHhmpC8hBR9Z0Lr/3zia
	obuWdGjrM5PihFGsiVpuLEQIuSjpE3ExCPb+ac92t5dhi4ppZPwds1OoHIxvUG9iy1V2jlOSDea4s
	xfNx0d7c8vNutAi5IQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeO-000000030kd-0SQr;
	Mon, 01 Dec 2025 06:44:44 +0000
Received: from mail-eastus2azon11010056.outbound.protection.outlook.com ([52.101.56.56] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeM-000000030gH-0uTg
	for linux-i3c@lists.infradead.org;
	Mon, 01 Dec 2025 06:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF1Ny7etY2JnlnrIEOQHdHqcFXwKIVIR/MdTAsD39/M3cIwJy7bO0G55jGusj8SiA+QBbl9EGLLmGGFggX80S+HRkF8pr9LZ4iJLNHnZN9Rwz+22xFw2l66qvtNMdlI55bDj00f02uQ+AFlHwwXqfRPy2Q5F8wtNblo6OlDpi+nHPMGu82XqfyNrv0jbaNoG+MJ7a1NCjTpAtFIFVGBw9qQDgKc/A/7tjam6j9C2pclMXLNRnKlzVTqGpL+hvovqxsZbJZf6opIqK61qwEih+TXyNZ63yjLYr3Ym3v8Ht5xKugBHQIHMC1t6KwARy/4eQbyb6gSQt1XGiJgUGYfIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=926/RUaoRzPZBRW6VXqQT0CG6uKv6Ump4UA1KPyhBcM=;
 b=s3awSJ1f56TyaQDoQGT+ulw/a1WKsUCfXRbqEqjFiPJMHVIWv1R91v3Rm38Es9UEOYzD3SZyZMTP5CSQ7uYq+IY1gOvxfqIUWP9g5TMiBFaO8mdL405UHlF1vmn55T5gkDis0oQ+ogAW+wsVK9/JW5IXBAZApoEQk6jhxbES3WVunfsuV7IK8n85SznutMrxkkyIHMVj4UACqZOJo/ITqTX9zHeuKEcI6Bosw+vNOpTwqQGBKC599ehoXeFXCKJ32czohs4yTZBSYmsJNtIWxc+EvAkUqJTroy82HV0zcoosygl901U+aKwgN8EJopWP7g/IMpobb6f2PuvaMeAkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=926/RUaoRzPZBRW6VXqQT0CG6uKv6Ump4UA1KPyhBcM=;
 b=RI6VaEakgPw9ahMkGqhFPoEiz7sh+Fj1xLvvRp5ASAKXi3IiKBdbKxMZvyxe+GIgYOD3Ne+PwrK6u7UHLQjeoZCE59P7JshrPocPV7iw9dNANNRPSwrCN/pCIbMWktRHhcIxTVx7oqZdoJnkx7Trxl9GNNM7qSa6R8k57OonO0uKvzTMnida9NwG2fio112EabGDh+ENYaZdGa5jZ4+j6TcN/n7uWOzvcXo8iOAx8yWOlfDeXC4OAde363CTw5APrSRIFbB01oCzRHQpO2mMgd0ceDyNOwx3/7Gr+4txOTMTXmM1fA2ViFce4h4qnEtV5nIJO85VeaDBT2zsaon6nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 06:44:38 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:44:38 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 4/5] i3c: dw-i3c-master: use FIELD_PREP for device address table macros
Date: Mon,  1 Dec 2025 14:41:57 +0800
Message-ID: <3ac5353e09a96029444e7f82bc70dbbc6e2389e9.1764571045.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764571045.git.adrianhoyin.ng@altera.com>
References: <cover.1764571045.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d149e6-72a7-4630-9e9f-08de30a51933
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0AlMsTJOr76ff8I6VWBtE1Z1DQ4xse/WglzP3mLuInUInbJDwsbtBDJzSYSU?=
 =?us-ascii?Q?ZJULfIu2Me3RYNeHCM6Ncp9tuoZyhjZZFdElvU3/Rhau9qvP7p964B0qSz6c?=
 =?us-ascii?Q?DS0P8k6cghx3i/ePHhCjUkxchiw483dncWsG2jc1hJ8PxMsDVPjcZuQL5wkv?=
 =?us-ascii?Q?yyq/N4F+6KUbdydyiNHDyuHjOj8IoE4m7KwfreDR5GGTfxZ5/fkxgjOyGJo7?=
 =?us-ascii?Q?cMrNSXFO+VDQ31Zw0rnDInQa7x+phgmoMmEktlfRq8+ruvcXr76KxKKizJBR?=
 =?us-ascii?Q?d2JVDHevzQJg9KUxxFtJlEsA2lJ4ksLbHjZ8wi0xMyjF+oVq7fpBnvnwATff?=
 =?us-ascii?Q?cGFpldr0Y84D/o3vYEdpWJLwgBQgrMyd1KkqEFuuBH/YfPkKIalG1ZFV55PL?=
 =?us-ascii?Q?376wm2A5Ecbq6wJN9j490kSlfcmVW4XhmUNoNkQzAcyB1h19Qd066v28df+n?=
 =?us-ascii?Q?zWHizPVi1AqlQaa6eBBqfkCyh4xlKfHF6A3X7/p2bS+pnXsj8EZ6U7j3sUcD?=
 =?us-ascii?Q?c8EDbwdMH/yEeOJ4R7f7ArCSXhyfutj7xV4e5HRGYZLL6cXLlS1x+E0VyPxW?=
 =?us-ascii?Q?KZ8tAHHs/VjyG5xQspT4KS4wUTwQYk57yf/1MrXs/v+qmZ/6Ib9unuwW6yB2?=
 =?us-ascii?Q?Eyhj8UPFx+2EyuVR4/MsFWyiKhRYKwsWMBUQ7hOK9q8mG8m5qhCWU6nu6Qft?=
 =?us-ascii?Q?4mAGHb9jMhowQVcFrMX1LtW7L/mGsNqYjQGIP/0dRR5oKfw/y+JMLjmv0y+F?=
 =?us-ascii?Q?WmPbCT2W42xmQvy1KiwOWRB593JhGuJhlDp/5KCD9dulP2fUyn9bm9orMlyO?=
 =?us-ascii?Q?kGzSZs0Aiysb9Z6titZ6NR5KERqXkidKnkXVWhoBZUyMSi7R+HdPzmQP+5rA?=
 =?us-ascii?Q?Z7egoQMCjL+d9ctvCTQ9HNuTv1tqBXY/YNfn6TaeVDjJry1d39I3Q9/SiUOF?=
 =?us-ascii?Q?kU2qoBbpycXQCsQaI2x+4oyA9MT1p9e3I/msh0I+yB7nC/aPTJnqYa39LO4k?=
 =?us-ascii?Q?CoNlNq0d60QoEYPkb/mjxj/ZsypjxKK2+TEBnrYmvxp1QvzJVE94Uz1JVLqk?=
 =?us-ascii?Q?9rG5TgW35IDhwDyH4MTJLraMNWYkIqcFBL6VQJHFkBrQhmEkZ/grzVIxTitY?=
 =?us-ascii?Q?fN5y+9l/dZgUaD5V4C/UgG5fFYTMmDg+O5SiZOcJ50iQmnVrgyc6BNXA7m9E?=
 =?us-ascii?Q?VR9283HG9eUOloasQm9Ucy0s+zT7eVeo5LeCwz/q9xEn2ZBXiYN/PlJJIlEG?=
 =?us-ascii?Q?RLoZPj9q5YksdbapzU5mPIF1XsUU57FLDIc3aqMNxGFJYJvacLtoA/g5fbF7?=
 =?us-ascii?Q?XVqFuoHr8Ii918a356jXKm8NlJLlx9+zVmY9QMMsATmjINitLqE3UITWIqLW?=
 =?us-ascii?Q?PoI3hDXu8loutc8Sfm2kWQuUlA6KnPpOKevaXPnnC0AmHYKjQtaqtev/cbmZ?=
 =?us-ascii?Q?zwwnfRxUSPRo2iCvI5wbOSJ28mP5QE8q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JqrcYC8wyEI2tA5anU8WSoK/mRfwrR0MTDKg2MRaaAfhXKty3M+BkQYAIWxW?=
 =?us-ascii?Q?JxPqt7JUo4U71wO/6HIyMhz6pMLWJIMawaexLsMEgFjBH+6G3nOHitKHlfIx?=
 =?us-ascii?Q?I6KCSbChGLQzPrCbG2XWi0EIH/015SxVvwPWApS67NQAhgEBV6Eh0xXUwTnB?=
 =?us-ascii?Q?GyYRq22/M1WrJwm2WujgcGAOHywg7DmLp64OjphNOTdLIAsJ7r/yE8QsIT5G?=
 =?us-ascii?Q?Yui05411quWOqUaINB2EAc6nVIOHIJTYealnhgl1G+inFsKLHA1ixpXmlBxg?=
 =?us-ascii?Q?mKA8HBssPcVlZz/Dj0gtXukIaTPywIfzKk6Zb3pzHtreTDrUxOA/+FP2Y8RP?=
 =?us-ascii?Q?niv0ZyzV6N9z+eXETlM18F6AhYeTP5dtHrQEjagxN9d5/Nu1CERM8cnXzCtR?=
 =?us-ascii?Q?zmikl60mz8MVFZ+OTfoMc/EizoTQJYYw7EBNDhzhzP8WXdG8zf4nZuys8VU9?=
 =?us-ascii?Q?9bzRpvk+tJXZl3Yyv/qWKGKN74oep2jz5FmMthUsNRC+70e0GIO43OKvf6ib?=
 =?us-ascii?Q?8hFqD6LB6MR+apQmJ0/TFLGgjWSjU9UhCG9SQwA1ajqoAAyFMa0lMof0NdMd?=
 =?us-ascii?Q?65zTS2OB8GSLfLiJavLeOfTAF0Q+GNYYKBC1Ksi4EQUunupkHJtMyZQmuwXj?=
 =?us-ascii?Q?1qMt3hnJ4YfRczhI5J3SDmBTziQ0wrRXXQmQISoeZ+GBNKiWjSXYw26Xp7uL?=
 =?us-ascii?Q?0xSueiUDuJYff1RMMN2waipcajgzXMv49OkZ88i3AeYri4zPW1/fqJeNIEyu?=
 =?us-ascii?Q?vqjjXDMym+z9bq8kGMVdIxAxaKkJZmWI9NeNqmsaPg65cti1HBdKTfnq18Y+?=
 =?us-ascii?Q?vHfe1Ghg8wzQpnLbucGj0tu4AxMHpHQ7PuZWZr8y32G7TcjxIScz1EBV0Ehf?=
 =?us-ascii?Q?++hXYcmftcYdk2Zwj8hE6KsOflv0sAkFtnqJ07xqiejIiCzA7v1jjYXstKyL?=
 =?us-ascii?Q?ojeQpsT2Km7VEuqR3LECfCJ5OozFi8H8JxF09XJZ0SZMV1QdZKT+tixddt/w?=
 =?us-ascii?Q?kGCdkI+S1ACKjbKX6ie/FyFHy233nNQYRdh0S7JE/taXVU/IgtUlr2ry83am?=
 =?us-ascii?Q?wVgbZy5OZzmpbfog7couJ6Ya57WTJEZoI6apVmPfOyO1cxjpto7rJ7BwiNtr?=
 =?us-ascii?Q?dXN+0M3qXM5bQBhshC5kPOZKfl6qTgQ++tLyZrxkMbkVsJJeu/sbNMOh0GLU?=
 =?us-ascii?Q?ue/ocnN+R7CSjVWzSaRZkAHcJJTw0QkE+qHneq1p42PKIHOGRXU7eBTM91Jw?=
 =?us-ascii?Q?D9LGl8G9GlAcPJm2/v+Ldm6dLOwsvxfn41d33W+JcE7CU+K8/NWMfRSn0cy1?=
 =?us-ascii?Q?U0abvqDZSEQ5OtcDo0JbuTyfuYCT6oNpZFxMNM2Eg+ApaiZ6yyvLzqWuN42g?=
 =?us-ascii?Q?bw6gJRnsn7Go764615jhzJZrqDQTEP8SATQ5qF3mxK93D5jDS8Wy6BWXUdHL?=
 =?us-ascii?Q?1k1NZfFOWYpkq2lmwDXT+aYXv/ovPMUmhl3G/4Dbb/yhqXQGHc24ZlCw+eVQ?=
 =?us-ascii?Q?MTPsXGvBaY2x0Ar6RG3lUHCUgYAFY1I9wUVEdhOjd4dzVHLVWI33A/vYbF2f?=
 =?us-ascii?Q?6fWEi82F8jKYuiIbiQH4pEehIiN2gi5Zx54+JXUSiMSD4ExIYaiyIZXLW8cx?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d149e6-72a7-4630-9e9f-08de30a51933
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:44:38.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wkyHRCZlfFVf5naD1XUc57GIw7TeepIiv2x9f45or3qKymkUzw4D5Yxd/AfyEExpnvS+JzMWcYiqfMay4G6eUSrDeyWSxETHCdgXJgZ6DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_224442_260432_BD01A1BE 
X-CRM114-Status: UNSURE (   6.91  )
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

Add DEV_ADDR_TABLE_DYNAMIC_MASK / DEV_ADDR_TABLE_DYNAMIC_ADDR(x) for
dynamic device addresses and DEV_ADDR_TABLE_STATIC_MASK /
DEV_ADDR_TABLE_STATIC_ADDR(x) for static device addresses in the I3C
address table. Replace manual shift-and-mask with FIELD_PREP() for both
dynamic and static addresses for clarity and maintainability.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index a34b4f05dbd3..007dc53bc9f7 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -205,12 +205,14 @@
 #define SLAVE_CONFIG			0xec
 
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
+#define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
+#define DEV_ADDR_TABLE_STATIC_MASK		GENMASK(6, 0)
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
-#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
-#define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
+#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
+#define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
 
 #define I3C_BUS_SDR1_SCL_RATE		8000000
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
