Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C36D19511
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Jan 2026 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lINZdLZVOxra0ccCECG/zCK31H+tVXdYFZQbr8HSfD4=; b=uldDRcxSAEolnO
	eiSkeRlCdqx+hjo7eTeitg+WDPHJWjKllMNdqji/A3BWzVsZa1SPeAmtwbuHdpRwcT87WTXSdTuq0
	SuR3RaGi71/d0gCwl4JuOpnnileE3U/Rj8t+LFBjYgNAPqArx8gjbQmXD4hYboSnM80omFOmW7t2g
	AidNd/Zusbj1AvNZaW0Ib5MBKpMLqVFWbrFYQULTBn1uwXr/MdWqNxqVFgrH2eST1y/55PJPqIZBN
	3TYEJiC/kxd0BeYKudFufRG5ycZrl1wD1WeArXp76YWdoyyeNLQD9BMmKSRYOW8U/T2xlNx+kqE5S
	TUXAtStVgVZg5sR2CeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYV7-0000000DTCJ-1MTK;
	Tue, 27 Jan 2026 02:08:17 +0000
Received: from mail-eastus2azon11010037.outbound.protection.outlook.com ([52.101.56.37] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYV4-0000000DTBG-2z8y
	for linux-i3c@lists.infradead.org;
	Tue, 27 Jan 2026 02:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuEB48jIwq2OAR4/j7vv1EsyLA2WKK9LYubN57j3+5NyD68lCLM8FzOvFXuhteWqGezKHKWD0UDsZG+pHmOErbR7zcdt+THXFOV3kZyZ1ILSltvseDSMpMF+kMjrPoxt9NHgMT+rFTZqF2/iOYx6qyeiKt7/BJla9yIMIHKUyKBWvdop54MWsH6bG1vHmc4zQZYCnfXJhS/z9kBcFXpkqB3PaFXYX4FsYyXdvE03cETLlAQ/sqRlmQdEqLGKrrdMAufUaxc0ptnWwt4Nyn6PW1+T3tOD+r2lBby0HQo+Mgmc3iqotll87hzXJz+pq9Ng4C+0XQwWCpo5iwyvGDjElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjcn1f8cUBiThMwa5gaKICbmWfYaC8u+RBKmtsaXnZI=;
 b=Q0BjfhT7mvQ9a2JBS1XdAC6TW5ma6HnEbvIfBWAT+NC/p9AsgCnWGBoTKAOF1QIp8T4DS6xZ/w1SgqQqcFtRZ5Z7/4tayu88Eu93PYjXlgSJvS4qf09bCfA9RJOOushCC2vE0ozLAVZPwFyYjJnOX2Ua41qe9SVrvcqhnwfVgb76y+7GfK5pUMxZz8a2HPqfb+hNRybre79NmCom3rRPV/iEoXdEszNc/JfSNZfwkvBcuF7t0Aezi3XVBa9aDans2NT6xCMWWqsc2MEjbwiBMeR5OtUy3PV4P5Wqfz1s4i/B/+fPcKEvw24/hwy1+/qlOeyCSRkYeuE1O7TzHzF2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjcn1f8cUBiThMwa5gaKICbmWfYaC8u+RBKmtsaXnZI=;
 b=nzb2hYD43QcWsBh4wUZfszZhwVl/FdwcuctPSIG7dZ9zvJa+QJyMw0ozSVhUFVptp8b90LCq4WIPjojBGiFVbjX5q8BkD78XVJTYkIxNC0qnZlh7WbxgCEkGMslGa7Y9u3dhurAZVigm+rS7xZgczV3NANaGMlyMQv4gIvWKL3lFbWyLQzoB/6MKhFHU+ujhw6sVVAPehTv1GdOY7uCoO5+er+DKLsFSUIZqyxoVWKOJQcWQgCBejoeHoGo1nIrYTCBnbtYto0gg8JdlPjnFJsaRLAbpldDeYXMOl8M6azpgoS4buGQcrv+ek7FRxIuwQBXA1i29bCFX0UdxyeQA6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BY5PR03MB5218.namprd03.prod.outlook.com (2603:10b6:a03:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 27 Jan
 2026 02:08:09 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 02:08:09 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 1/2] i3c: dw-i3c-master: convert spinlock usage to scoped guards
Date: Tue, 27 Jan 2026 10:05:06 +0800
Message-ID: <79020c006c15dda9d057946530f16cfb4650d450.1769479330.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1769479330.git.adrianhoyin.ng@altera.com>
References: <cover.1769479330.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BY5PR03MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf41079-86de-4b9f-1d12-08de5d48eadd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zp+3gPJZVpz0jYuD5LtGaD8Qxoz/8AUjtmw/0gupjqKUK6qg6FYQ3cO6L7AR?=
 =?us-ascii?Q?JNGZklXKxgANiOcGLbpkKZNm6mW0g4xWOJBNQdkvcjFRDnzvLgScj4bRY+XF?=
 =?us-ascii?Q?uSx2DBIynenmDF37op4IlYh80GAzHVz7f/998RqRYVQC4mfdb4xatzXP7fUG?=
 =?us-ascii?Q?vqS5T3Ek+DaiJJZ/UR4MX0YA+oFPMsx9riqyNJQNoNJrn6X8CFMwldTHYei/?=
 =?us-ascii?Q?C0GGrQaJrw3J0ccq9XAIQ3HKVZsvfiqpqM3llcX/djKZKJRGOHmhyT3MHuXz?=
 =?us-ascii?Q?TMPfdIPtSGSKNt7QbVjxm4nZ9ikKe9e4Tz7ccDFPnv9K/dha7gfSuvVZGAdX?=
 =?us-ascii?Q?QqnlmYdN+v0y3nNFZ8+1BTUTIqYCz3Of0lGoQyO6B0YGR1jcy/3AdaXoTQ9b?=
 =?us-ascii?Q?lXW5sdK4fBZ1/iefUWbud3NADQJMKgHbP9J7nbkv65TlfCy3KtCJde1T+3/A?=
 =?us-ascii?Q?J4bwxDBu2y2hy9jyzx8n9qduuCSjOjkJWC3l1caPHe7Hq9PEuPnzgtJS+CPH?=
 =?us-ascii?Q?kefIycqqueQHoIHdLuEQvedtUySUcVNnzcWBHxm/bwsy9zZq+ZijowHVxq+e?=
 =?us-ascii?Q?C4XLg+XqSnoQxI0ZXNgecb+lRJhz4auESPcd09YruC8rLwZrl1hzE6OSifmE?=
 =?us-ascii?Q?UFzYUsOEUgw5oMQVekwdjynIAzVNmU8WaSihuUOAUXFNcH9IOcwlJIZMNLT3?=
 =?us-ascii?Q?NbYWlgnPzMU6cgPWSxnD+X20s7SfK1gYb+yfI6bTZzwsJb/IkvA6zzNKYigd?=
 =?us-ascii?Q?V811FdOP/JyNYBHLturjgul2FC/+YZfBFnPuPwQ1jczsJnmrpj+za5y/UVgS?=
 =?us-ascii?Q?QiUVjNGbpqGP8aYZEjtFTCQ4J2P1UT7DfOmvs+ELBe91exm7Jbwmb6rTWREt?=
 =?us-ascii?Q?P3j14skygltFy3E4n8YiwVw0BR9RySIkWJTj0i+WoHvcoSXVnmdBUVdcKNu0?=
 =?us-ascii?Q?yaVG7Q2pB41NSpOhLDxy4+b6ZxOhS7t2DUF6wskZleTDx6aKfszwOGqY7HhP?=
 =?us-ascii?Q?lSDN0UeDFmVv+yecOYkcFZ2TBWRC7AOsQJ27MUb82DWe/L3x3sHkHRbJn7yX?=
 =?us-ascii?Q?IOZbS/5SY2N92p1MxWi9V5UvmdQ+lXRC+QOYx2vixxMaPfP7ME2Vjn0tilrr?=
 =?us-ascii?Q?VGelGQ97+JqQe0Z44Dsitw7VbjSU73I4wp0Xyydi+XDrPhjZY1zXcbj+HMKa?=
 =?us-ascii?Q?XRdqpHimULQvKYEILH83ApVeedxGvgieO+AIxelz0llFsRGX62tb7Zr5TfxT?=
 =?us-ascii?Q?kVBOsUVInIntgArucMoYmJDYpw8jorPGB4eDIhyT7Vl7CsT7s3/R/PFV85wh?=
 =?us-ascii?Q?D4/ULMsRKKGv5gZA6fMT7ybq16so66xIWLdzsE9UOwDKhqlK7pR+/6C5SWPW?=
 =?us-ascii?Q?YRQq6YmPXGlJi6lx13UvzHGIEaUBT7k5yAeRpEUxwribESfJIA+ZmBYra2Ex?=
 =?us-ascii?Q?ozKuQtoF3HWeQWS5QVlXxs+yWd6UjG5lXZ2oxrmOSU/GZMCC/UQZuV1OzWd6?=
 =?us-ascii?Q?5grKiDhuFTT1F/bs1wF+lXiGw3qLvxsr+h7qVNMIUiGa4IfN6K0eEx1zXFpQ?=
 =?us-ascii?Q?/2bFaa86cRZXNxUV4zE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r5t71Y/7F1HfQtUA06cihsEqU/Tz85yCDtufLD+NDoYV3molRwOskL0N8PBc?=
 =?us-ascii?Q?OvDll6msP0D5+DwjCTPcQGNG0oks2K44IzBBDeEoO40ypNTEbPsSBWA++sQt?=
 =?us-ascii?Q?B43vOl44tAEwRd6KsUGu4JM9n85Ro2WtTl/G+en1L3/MJp52iuKgitApSCq0?=
 =?us-ascii?Q?hjcDLfvwke7g/76OKw4YwLlvZHo4roFm0ZYsADXciJ6Q3p8N5xAIqYf/3lwQ?=
 =?us-ascii?Q?3k15pFYseXEwkmuHw6UNVvD8/RFwaQYxekDnkISi4IKjxd0e033Qkh2zxg4m?=
 =?us-ascii?Q?emqLMjsBHuFUgBovT6iTByeEWNDeddCJJEDgnGoG1rox65srlMwPjZcBzpMU?=
 =?us-ascii?Q?RBnYO6N49VNIi9doBr43A5ih4XXPEtR04JUr5Gace58ll5SnRyll1IpjW20z?=
 =?us-ascii?Q?k2pXQmPmfhsS0wyyEDWeNaUcBgEu6vCREoNg9JYERKpTaMMsys/ofmAEXEE9?=
 =?us-ascii?Q?Aghhyr8SkWCOd/Rg3zViAZnQmBjHG+gYmw9sRoJjHiRw0Jb8JTKX2BOv2lHk?=
 =?us-ascii?Q?dSEAFg6IZPEX+X7PgB9JXsyelcvQB/tlmSppjGhUIl9W7My58DMdb2G2vqGB?=
 =?us-ascii?Q?zDkP/jm2znSUN6hklgf/CMfgdE4E+U8O928Wj2AUJVd279aRpR9M0mIKVMJj?=
 =?us-ascii?Q?+yUJHoVRdZMDwz7RSCSaQB/QMwXwW2PIVpuveKcRBLmKBUy2N4V0/kffrP64?=
 =?us-ascii?Q?noRQ83oMxTAz+4vtnn6k9de1+DKB2ycF6nusSdhKzbWEk7kPvIV1y2f95uM8?=
 =?us-ascii?Q?3lDKyVufgQ8cYhsxvI7NU8GViHepRUViOtAt6Dh2EEEeDmJ2ySJuE/w/911Q?=
 =?us-ascii?Q?TSVATnzBebOEcOdFUSL0b52n2+uLnt/HojjTjOixLOfarZH6xupZib4cNEq9?=
 =?us-ascii?Q?GOYVdezpFUX0AWlU0uRYhT+woPZJJwJlEZCjv6/j3Md3jflitbrI8u1VSU2e?=
 =?us-ascii?Q?dHRQ2Bpvy3ivTzbkTq3schuB5FtEfBuxPwmT4udv6kDhqF7YOZKx2v+5hzpa?=
 =?us-ascii?Q?pLz72nbUhjyDFZHPyf4W8V+3/GnYkCQwKqb5kmKRr+/PNu5//EDN480S98Lv?=
 =?us-ascii?Q?7rWWSLlWBGFC7IAmYXb8euyuxV4RZYzSPQhkBX7wrOmzdnX1nClUOwKiTgea?=
 =?us-ascii?Q?tLcmrz7ZcZMLwr65yQ6Il3BIKhdUnRwWmV/Z9hNS6fqozX93xUBwKIJ3i3SO?=
 =?us-ascii?Q?WG1Ixz8oiklTF5dTIjMRwNPksqfN0SanIk682G9O8u1XJ6NPY7X4is35bRQd?=
 =?us-ascii?Q?Id0NtFW97aKVZ2RMdIWsv/RyIYl9+0/k4/OxjKBnzRr7SbfPgDC0LaIXHcn9?=
 =?us-ascii?Q?n8GalNjTmNolh1yqEdkzETie+vJJFh9o5cPEsH7EfyA/9wB6c4Sa/soHQ/oD?=
 =?us-ascii?Q?BmIUDHoWP++1HoJmFkKu9NUqPPBqUP2bEqmkNmdHz5Ru8BXuMpP8GbVI+y60?=
 =?us-ascii?Q?Shu+hGeGw4tz3Zfkiv61Bnq9UR5o7+j/pvdUZQvW2gWVLnve3dRk4BbJvG2A?=
 =?us-ascii?Q?ddoj0ZkTbaRFMO1GSE4Eb+TMdkbIQNe0LvX0ZaLH++Baha0DgV4wNJGy+31W?=
 =?us-ascii?Q?dNLdCP7nQxBcIavfYO8/sYcW99Zun6J0nHgmFNyejw8GvKQoUZbhW/EFszKP?=
 =?us-ascii?Q?yBwOGx/1uRSyV0JAmU/uKeoYSunc+dWUEhNe5GVN8inuftdwMcIBaqWUsX98?=
 =?us-ascii?Q?R722VwecClZyrTLXm0VuQScYOA4TiQ/dPB0NZxX8IgNX8mYTPpSrzqZIzaJc?=
 =?us-ascii?Q?ldXU+VuyzmtmViwA7b/UX/PZKK9jEps=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf41079-86de-4b9f-1d12-08de5d48eadd
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 02:08:09.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL+BoFZSNauGHxHRedmU4Xrhav7t/rYe5oYreQ3gLrqfZ0BALNy/nAuAOo8vOEVCdHkygzpwj0uQpJ0bxap3/7Z1zWVaP0LvmPLy4RNN7vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_180814_757260_90D03C67 
X-CRM114-Status: GOOD (  10.90  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 34 +++++++-----------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 48af00659e19..ef8a38620e0e 100644
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
@@ -1212,11 +1204,10 @@ static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	unsigned long flags;
 
-	spin_lock_irqsave(&master->devs_lock, flags);
-	master->devs[data->index].ibi_dev = NULL;
-	spin_unlock_irqrestore(&master->devs_lock, flags);
+	scoped_guard(spinlock_irqsave, &master->devs_lock) {
+		master->devs[data->index].ibi_dev = NULL;
+	}
 
 	i3c_generic_ibi_free_pool(data->ibi_pool);
 	data->ibi_pool = NULL;
@@ -1243,13 +1234,12 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
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
@@ -1274,9 +1264,6 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	if (global)
 		dw_i3c_master_enable_sir_signal(master, enable);
-
-
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
 
 static int dw_i3c_master_enable_hotjoin(struct i3c_master_controller *m)
@@ -1377,7 +1364,6 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	struct dw_i3c_i2c_dev_data *data;
 	struct i3c_ibi_slot *slot;
 	struct i3c_dev_desc *dev;
-	unsigned long flags;
 	u8 addr, len;
 	int idx;
 
@@ -1395,7 +1381,7 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	 * a new platform op to validate it.
 	 */
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	idx = dw_i3c_master_get_addr_pos(master, addr);
 	if (idx < 0) {
 		dev_dbg_ratelimited(&master->base.dev,
@@ -1431,14 +1417,10 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
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
