Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA9AD72345
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbFB/XvMyyDZIadRUtwrb9yzHuRvyP3tiVRqUqPxwtU=; b=3EBKu0+c7qzZke
	QH3uH8iL1ty1doCSGsCcq60oaIiwpAeFQUffnEG3mwlEbqgWNdHC1zSB3AxOsv9pvsCcGPk6s16kc
	vFQthO+8NBnq8DgW+m0lCjl0Mulqbp4v/XS3EqI6RhNRl4HF3iOI1VzFjw5Nf4JYwXav6hBoFOwwO
	5z8SQtI2gC1C9yMyR3svnt/Ii18UdqwzapOEfZwr2YNFrIy3TQvAZ6X5EqD9l4lFhDE1lbtNmiLFZ
	+Qe8CpaTxv1EXt7E3uqLt4QCPoFH1gVlDaQVLoQGyYWDBXwwjkHANE+AdPrYMhjzoux7Z8Z1dp9Pr
	o8Jdr2d4/ELwgY7uzGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBkN-00000008NnY-3Msu;
	Fri, 23 Jan 2026 07:38:23 +0000
Received: from mail-westus3azon11010038.outbound.protection.outlook.com ([52.101.201.38] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBkL-00000008NmQ-2lFS
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 07:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpiTS+YDQkZF5AeWZ1SOTUtvOuzJoasiJUgzVKPgEYwGFYpxh1DMpE5/JnP1y5TquB7J6dXJWC000Ios6CxEV+fsSmqMWRVec78kWClxAXT1mF4DUYAu2znDLeCxeEN7vBJiUtz3Md3Qgd9XFEebqpGgjfJ6994HKFaniaV7EXIbNRUyKZG/al22OnRRmgPDdIFdMsmpqcRg/MrMB0F2IT+JM6MvoXb2wGbu8w8wMcPloC9h/rD1yXsjpTfuFFYmhQJRPLeSm7tNt99gaLJuvRVy2pfmUOeZ7RjSEaJIZtM9eHV1h6aXD4UAnG4o8wYxOuE7p42QmhxAvS02BAvf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/yJoD6kK0hv62hkJ9VbZ6TrKsgAVET1jpPxyAOe8PY=;
 b=jlHtwhn5pTkxlGc5aqLXb+jl8MFPNzc9whj6zwuyo6gA/jGx7s0j63I8FX8HtYofhNrAwxfwjDjPuRP2vvgbTYQ7qs8HZvJ9ASIL5pfYKRjLXtwr9VRb5GsxbHJIk/v2xofDXcIoNOVsp1YjJ5rypf7vEApuwiw1FO33j//88vSDu2NiEqLL+1goCPQrLlW9I+F4Ioa8vzRvFkUYEy6iN8E6Zw8VrnTkUFJX9BuXspBHUxCFcOuk7RkNZbUG3NT72Njzehb19Olt/dTN00r1Qj458j+yttXoOhNjLQlT/Mu7JAHOkka04XcpvJ6GnXg5qPR+H5bPfgRpe/QlilmEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/yJoD6kK0hv62hkJ9VbZ6TrKsgAVET1jpPxyAOe8PY=;
 b=Db0l3Au88QyeP+k8qEzVJhvn4I6zFdXjUGOQLsLt+DLKZKXNvXe9UHb0jOKrNXKeTvVXMX6os4IsWA3LvCcINmCgGvTJ4StDaVoHswcQgldeCs3gbjD/iOwsQyDQ8f3cgsEeBLS8hR1lBnBgYDT7oaon8jO3aLGR6BgFReMWzTawrb60DeDc9uESzVM+NhDoxbOJbx4g3pQm1ewLe7bpVP80Fqp8PhJnxj4+o/8gKwgmKvSP1/mQ3zWEo6HkhhcVuHisg56p4n7yydeybL7Pd+kqrC0Cg3ydZliPe4kR28Af3d/kt91rBp9ZCta6P+z0NdffvQ4ExZMpsBS0X8K3Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 IA3PR03MB7715.namprd03.prod.outlook.com (2603:10b6:208:512::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 07:38:17 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:38:15 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 2/2] i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses
Date: Fri, 23 Jan 2026 15:35:12 +0800
Message-ID: <657b5e305abac836fb4884ea530e6526d3008942.1769151395.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1769151395.git.adrianhoyin.ng@altera.com>
References: <cover.1769151395.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KL1PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::32) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|IA3PR03MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e944e2-86c2-45ad-29f0-08de5a525ecf
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vLKP4DTlTuRLBYvdQ4GTNkvXNrQW2qFX+WoB5AhMVj5tATmashr314ODOp4o?=
 =?us-ascii?Q?LnOPYLMLEGM5xFi2K9bftAhBqsh5vkjqcXJKb8AXm+4Joz6mViW+3Ke6UuE4?=
 =?us-ascii?Q?WpFTf5j4fKjicIy88WJJgPkXdehs+dT0el8QCpZdVYZw7JPqx72zHX4emq/A?=
 =?us-ascii?Q?aCyr5SJH8OVY/2xgKRQ0FHInFcEAiH/KLKBIO1gEUwCUwi4k//zRyEUrCVwG?=
 =?us-ascii?Q?AcRCyqZNPZDSyCN3++xPb817PqpMB9+M4bXNs9EhUjOS0OVjvoWhSFRw+7dL?=
 =?us-ascii?Q?udLN0H2rRr+BoU+3pmcLZpv18l73YVvkrO2oH05StAIm4oiJZ6P0nMFmMb48?=
 =?us-ascii?Q?MKBGtxnbgOCwwk7Wb2/bpuGhCGeuIGG2YyEO6azPOM5qDZFCCeyoQN0npprU?=
 =?us-ascii?Q?4WnWJyfgPfxlnZNFj/kGKBYahUparCVtMmpmNPQmc6BNXRmRETffOEaT3+7i?=
 =?us-ascii?Q?1kU0pmTprRC+8C8VGwgWcKmo08wGPwyzRSySVbhSpDRna1eAXt3irMuC4UF3?=
 =?us-ascii?Q?JzBkcSyMIfh0BZHS2RISHVIrnNiLBQRZed83vrJJBVCQUQu6tmwDY6VxvtFD?=
 =?us-ascii?Q?AAXfjXybTA5Lk/G+8IpfozA2lTFMEhbe/f3LbLAKy/x+hRZIL1fvKJ4NThKu?=
 =?us-ascii?Q?EP71t9qrYuBpjPtP5z8u00Q2/v+q46igl6xeTIVMJ9r1r0THvywevC0wJylm?=
 =?us-ascii?Q?ZCKbT82pPFcgtJOpAglbhZt3f6Q3ND7z4wmJliOP3eXwtNGWvLG4q2po+RQo?=
 =?us-ascii?Q?4V5Ke4VY2azlMLrHsiPzH3TMIqdx0DRhQr8LEAW3S2SvvWOQ1Rk0dF+o+tIy?=
 =?us-ascii?Q?G7eq/8pwr0yzIYO9nejZfHxXfem/m7s6A7uyCXMZw02Aa2/afixHmI7DSj+c?=
 =?us-ascii?Q?znpMPX5OG+GfAbcH/WHhtyqaX4FRR+P0s7wN3Ok/MFUDswe20cTafst4Bjts?=
 =?us-ascii?Q?xuKdmC7dLSNj1HOe7qURjP3Xt7p9JWUtt0Q4Qora6HM7B6D9KnP1IxmfoBcd?=
 =?us-ascii?Q?LQ8XkKNFRS1D34rgwOZq8WODo0/WU1So7evygUYCVQNtfrTYMlB1ZbFUKFu3?=
 =?us-ascii?Q?bLzCfoBgaTzCNUCOlqN+v7qScHygKOUJIjc2xCYV3oLBOXVJUKiw6b2JihfF?=
 =?us-ascii?Q?XL6rKjsrrRZhQUrcBrH1P1BiLrzxpXfcLeb8YgxIoynO6hBMOrx8+pSRf+ik?=
 =?us-ascii?Q?x6Ku957ZtucBTmOdsTSD7Hmi30WLF7SbGQ13qQ7o5fRsMzBnbVqKDkQw9kIG?=
 =?us-ascii?Q?YxGAorXZaJxFL/7bU1iMxQ2oPdhkfbJpAiMD2OoRDbSUwLB/AgF+ghAHYupR?=
 =?us-ascii?Q?oFbB3d7jNUklbEX03w6uE/i//aDXpD8iGkV5dWJ86f5MHgQrlDucAsnDS+97?=
 =?us-ascii?Q?kOlFhijHVOj6peHwT+Xu4eECp5f+ltaD6PD9NmHDzBJhGi4pFuGWjTpMRKgJ?=
 =?us-ascii?Q?ZvAgvjS5TZp7BEaQkqwnL8v3MebN0v8Q5pj5Fp2rIpI9K7VZ+oirm0JqicBq?=
 =?us-ascii?Q?7j1v0TumE88C9smNeZSdePP4pEnHqbBnMTqX0kjPfdv312rHpia4RRL9OmZP?=
 =?us-ascii?Q?ndrI2h3436cNx1P1pyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9E7QU5DlJG9n2+D83voAAEoDMZAJ28XYPZ5vo8RNSTjoOa2XVioUIH0bWQi?=
 =?us-ascii?Q?bh6Tqv34iPC0ePOnj/k4fb4bfYozV0EdWAZggN23LJsFJF76tyI1WCO46fa1?=
 =?us-ascii?Q?6xDHb46E8zuzO99fLW1Ex3FjFqdZy7egL8uZi0HY49JhGqDExb0IrIEgDaiO?=
 =?us-ascii?Q?9sxLMouViPPBAUFcyyVEIxXXm2RqVZrnuqABx+B/ZIaSxFxPERmS46UCNRCj?=
 =?us-ascii?Q?glC1cg5TKkxeJ0Ud6caCIg0XMzUrBVgW276d3+qaIbc8h17krEcfBl1vDM8L?=
 =?us-ascii?Q?0NsXfZ28tS9wgZAe3UIrX6pFcyqOl/JMneeKkQeS/Tc5DXeOkw6zB/4HwmtE?=
 =?us-ascii?Q?hD2WclpqNzbpO7dxup2s/+PtT5teb2D2mWXdMASvPKTsPpmvrNkE4eDLn2/E?=
 =?us-ascii?Q?Q53etbvPLiRDZNRwuG8U9BNDxtwVXouAaG7Gx4BjrfbGtzl4j6hr13Z66dbs?=
 =?us-ascii?Q?nOQCdfM64a9x4wNAg7X4Xh8MHeAf4LyOL4eQBB2BoElfh5pPK60y5esYRTFh?=
 =?us-ascii?Q?yYlquaCJSJvxVQdP6FcXVEdZh83pntklIpnsqnmEFUzDerzFf78X5FAgxFeZ?=
 =?us-ascii?Q?lDgTvoAmTB0xXaEs0zcGoV6RTxu2fHY8kuiwXUx7Po9YH1YG4P3DFRIU+s47?=
 =?us-ascii?Q?350umct5DqoQLglHn32PrNWy5muzr7i9f9HoBQv8gLuuY5eWzbF0NNEsAgwM?=
 =?us-ascii?Q?D5ZaexsqyNzUI1gXSMdfuoEf7K++jh3VNETAoFD6vGBogJdcClLly0ouGbBA?=
 =?us-ascii?Q?A5uhXl56aZxhEuIpdCh7aN9W1t4+1jlbMxivI9Ko05kdNq2QObJTeon9CXMn?=
 =?us-ascii?Q?RNM9mZCAiQSpZRdll0zIny3SvmfPBFnp6ouoyvYFeKs918aw6BYujYAvPa0S?=
 =?us-ascii?Q?nPcj9kHcHNcH+BgsnUyS/yIukUUO8Y+rM6KvyMShdlYawZz3jmIFAEkjYwnh?=
 =?us-ascii?Q?yZro5PcESHh8r1ymrBYaCMYbxdiwuvW3svo895WhmxLHLgNulLkieZ2NVw5y?=
 =?us-ascii?Q?T+bQUooCjckGI4w+w/Zu7Wf00WEFZFVYdSBXAzxB9D7LhxIsC8AkAJwtk+jU?=
 =?us-ascii?Q?WUFSc3zlWgHx1ZVasmaiUbTEmGffLBZ6ztrv3DKxOLaqQL0h0sDJv6GqVxxo?=
 =?us-ascii?Q?t89XO/+RrqH3wdU/V4dAl0arm9yDwNri5M1l7j7L4MKdVbja8DHs7NzaAm8j?=
 =?us-ascii?Q?BQbkvYlAN59RtPyR1apDpUQn7DSxgGKVwQhHFwopYNfyu9qS2qZuHKtkTo+T?=
 =?us-ascii?Q?fT1PGzp7jwR2EM0tP+rkdRlL89Kh5/E/3Re1IxRGmD4zrNZNTAWy2t6VYjxq?=
 =?us-ascii?Q?QFHEzvHUztUVe/8FapQNlilXk1LKv6m+xOERxdtCzi5VqwIsGMJH0EczuaB8?=
 =?us-ascii?Q?kN86i7YewQ18cg7kMcTCzs9vpvSOoKNf7vfoCjppUPRiE9GWizltyQ22ibj2?=
 =?us-ascii?Q?33Ttx3Tc+KMbR4L4F+iZgT0Ok6fngANyi4TWhAl1UpdQq75hMUEWlPkmfpyU?=
 =?us-ascii?Q?ZCZOwfoIMjrgZXjGSCvU+Js93UofJF6SFJBlVjaNftYmHoqlK8qSXRaST++q?=
 =?us-ascii?Q?FkTVWA0WKQwi2fGsQBFQV+EMgXqW5TCoabL3fp9zLODZg81SuKaPvsIFlsj+?=
 =?us-ascii?Q?woyX43s7TtZyN/FLosaEQ7HYfEmdm2CHOgwBRLq577iqn5E0z6iVt5eDh1aK?=
 =?us-ascii?Q?Inaq1SD07IVcJgnfuelREXKy/Usaz0+ogjfnfztSj9fh+mQC1Pi8UdStC+fJ?=
 =?us-ascii?Q?ZRuPSHQpe2SPSHLmZsKG4t00EhwG+kY=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e944e2-86c2-45ad-29f0-08de5a525ecf
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:38:15.8522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2da6dJONdfT1r6KK0l3wPXQK+9dAryFLN35UI+B7WZ5jCcKyZctCKKUfGGhkQgc/YbzWisRLDRPkX+o2m9KI/wS+VfJSZuVrhgbmbRVBDSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_233821_701963_7A1DC3A9 
X-CRM114-Status: GOOD (  12.96  )
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

The IBI_SIR_REQ_REJECT register is a 32-bit bitmap indexed by the
dynamic address of each I3C slave. The DesignWare controller derives
the bit index by folding the 7-bit dynamic address into a 5-bit value,
using the sum of the lower 5 bits and the upper 2 bits, modulo 32.

The current implementation incorrectly uses the device table index
when updating the SIR reject mask, which can result in rejecting or
accepting IBIs for the wrong device.

Compute the SIR reject bit index directly from the dynamic address,
as defined by the controller specification, and use it consistently
when updating the reject mask.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 15101f41b9e6..ffb1edd32097 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -205,6 +205,11 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DYN_ADDR_LO_BITS		5
+#define DYN_ADDR_LO_MASK GENMASK(4, 0)
+#define DYN_ADDR_HI_MASK GENMASK(6, 5)
+#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
+
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
 #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
@@ -217,6 +222,7 @@
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
 #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
+#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
 
 #define I3C_BUS_SDR1_SCL_RATE		8000000
 #define I3C_BUS_SDR2_SCL_RATE		6000000
@@ -264,6 +270,14 @@ struct dw_i3c_drvdata {
 	u32 flags;
 };
 
+static inline u32 get_ibi_sir_bit_index(u8 addr)
+{
+	u32 lo = addr & DYN_ADDR_LO_MASK;
+	u32 hi = (addr & DYN_ADDR_HI_MASK) >> DYN_ADDR_LO_BITS;
+
+	return (lo + hi) % IBI_SIR_BIT_MOD;
+}
+
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -1235,11 +1249,19 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 {
 	u32 dat_entry, reg;
 	bool global;
+	u8 dynamic_addr;
 
 	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
 
 	guard(spinlock_irqsave)(&master->devs_lock);
 	reg = readl(master->regs + dat_entry);
+	dynamic_addr = DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(reg);
+
+	if (!dynamic_addr)
+		dev_warn(master->dev,
+			 "<%s> unassigned slave device, dynamic addr:%x\n",
+			 __func__, dynamic_addr);
+
 	if (enable) {
 		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
 		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
@@ -1252,11 +1274,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	if (enable) {
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
-		master->sir_rej_mask &= ~BIT(idx);
+		master->sir_rej_mask &= ~BIT(get_ibi_sir_bit_index(dynamic_addr));
 	} else {
 		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
 
-		master->sir_rej_mask |= BIT(idx);
+		master->sir_rej_mask |= BIT(get_ibi_sir_bit_index(dynamic_addr));
 		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
 	}
 	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
