Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FBD3B7DD
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 07:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFrRYg2ErFzBYCAO9vM4KV048q1i2cdF7Zm1o0kPCnw=; b=A2HBZbCnUAzddT
	/kGv32RGCqOPQzvYiO5HjW2VQDwmew4yzkqtfmf/URWWavZmjEJ28KFcsiSDSAmgtHZZHuMhneEQn
	y7ArvFT8qDIi0BBCvNjwZYeK/WiKNnswVJPLwwiYwz8ToSCLaJZwtpZpB2lXJnw1GVEhOnPQiTp4j
	z6TmdLdYxD6bjVwryvb8DC9/ZTEJzlKCIB55w3CAWgsbgLfDU+wuysLgoQiWSVh/S+jdxPz9W2XJb
	k2JddrO149BdHPHJRnXqs+0yDNrl1pBpA7eQwjwBUd4pZwDN3SfLiB3F1uhp/JcGSKgUHHVpM6hzc
	waiwUWGXoeJK88FSX5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRg-0000000Cji9-3WmW;
	Mon, 08 Dec 2025 07:14:08 +0000
Received: from mail-westcentralusazon11010030.outbound.protection.outlook.com ([40.93.198.30] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRe-0000000Cjcm-1ixi
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 07:14:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRzuR43iUwEYU5PUN1KO7A7RQyJj89q+OImXflAGCcbVtQB2yfizHDyshOa4sY5XpLVyK5uLMaLGow4q/SA1Cwx+dYSL3Ga/TkQ9PAP5P9VQl83O5K6WHIon8ec9WUebI5uLodP/Pz2O3BWjqEsg4VOUivH77svUUD+s/E6ohHoGNpjtMi28WoEeu9zxAwdqr0VCZpflmJMfHA+jaW8Hln3Oxz9plodMT+vTkVEzFnyxtoyuGmBcV/7qjX7WhOkGoL/MkyCk3cQuwL8rJQJyilvWjObJxtVTsTlVVOqPE83LdXns2hEkqmpkvIyPAQRs6JHbpNvunQjOn2Ixp1OviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBQcYoXnCA5aexBrW1l/Zv9dgGm77dX1yyKyPswL0O0=;
 b=rznaJU2b4OngisI696EYFOohukZNuINKvsznlSRJFPR/zzZixaN3gHLJxWzN3IQQwJsnU4CCkvLJHuDHrLkMWDRWlOunmR3Yxhwzwya9oJ8K/J7jCw1BByL3PmwFCWkNhOe4A1pL96YlGsQUltqtt/TsyXa83n6vdeW76apz1oeQq6hIQTBnyHhj7OoO8Krn0AuBonWcqLq1tNESvlP7W5uqnl+i7iFQ1uFD4ErcPbzGCOxYia7vAaO3/K421tNYNj594UcbvGE8ym0HcBPaBvgpzis0sVjGs+6PvCg8AV5Q/k68pQ6ThoGqJNrgQSy58+itweuVHs6Xfy9/F+EU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBQcYoXnCA5aexBrW1l/Zv9dgGm77dX1yyKyPswL0O0=;
 b=ELmcLLvmpo73zq0UxVoD3TjMF2fSoZXTEhG5yURHBmVFlRSXF+wPngm+69kqJ7oXlavuFyfnkBNKDN63jNPLMSSOafIYoHyWRVg9WBhCkw4RlL0nfQN24sexjdQyyY4NNH10NanJTZUgflE24q2d5Z5tD+9J/9UGaM+2kZKc0Pof8IqX5I4PVUg2Ne5sqG1S5X/JW4FBliPxDiPQscnSGFgKNci75MMKi9s86G5jlqJMfq/D+rFqWqCuHeWgwW4GJ51ObZT5I+LHnc/SqheBs6PgK8T5LzISfYKexxZBAQgFf4bRtjv8Gi93E+1Ht/byKMPD3ZjyGD1C3ayJxuNuQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7475.namprd03.prod.outlook.com (2603:10b6:a03:55b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:14:01 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:14:01 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v7 4/5] i3c: dw: use FIELD_PREP for device address table macros
Date: Mon,  8 Dec 2025 15:11:19 +0800
Message-ID: <fb68fcf8b634d644107212910358f0afe98b7ced.1765177110.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765177110.git.adrianhoyin.ng@altera.com>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::7) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 4320df58-75f3-4246-2bf5-08de36295ca6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FnKwZGTy2rNo3JLYkSE4bU/8UQ3Iyl8HZhLq1PSSHYx7X+r8DCibynEWvC0e?=
 =?us-ascii?Q?Soc+v+Sg9uATF00Wv6YkR31984dMyt7HwzT95Eb1qhtxTN2PDMmi44YkHVew?=
 =?us-ascii?Q?UkSpa1t0E4VuQ8yhXmP0K6WpOHwN0C3rBjMn8lqHFYGOuOA4nzlh4n8a/ZMw?=
 =?us-ascii?Q?NxLrQoosvXpw93E35GAf8l3htR2146o0861STA6uw3qTMcCGxcsTPI0p94rU?=
 =?us-ascii?Q?nhBs24KXhVW1p/R6UNHM+xE+8czw+twMpVrp/2k8kRl7wKzds5Sai98lWZqa?=
 =?us-ascii?Q?wNyZy8pdB2LtGZMYo9DKW1cWor46RWN+hcj3Uwm6A6uSrIc2yJ3hI4f4Yidy?=
 =?us-ascii?Q?Bbf84ZBieHqfAH3DRIdVEotb6qKhIzaw2z+ceGnnQGQVG8mGBeptcCzEPDeE?=
 =?us-ascii?Q?Ss2zO6hmz6Ad5/RZpf2k9lvzTj+SBjyZ5dBCS3Sn9B8ozVw0szDwO0TlmJ0B?=
 =?us-ascii?Q?LDMgxBy/RaH56XRXpueVSg4tzzbUSTjaqvXRc62+8sQchfnMMLasA6Z8j/i2?=
 =?us-ascii?Q?c90w7BOpfUR3/nAfgEbMWp4jCi6ExH+y2q7oimiPCF5vOio/tjZseZPyS3Ak?=
 =?us-ascii?Q?y59mrsYvXQC4Ju87vkVW2d7/RxkV9WCrZ719/o/EFW/AkRiEP3h1hoaU81yc?=
 =?us-ascii?Q?4Hy2a+a/+SnT3OEG64nqnICQc9abQ4bQw/c/nw47cNr1JGup6qgUE6ezET4n?=
 =?us-ascii?Q?Hp3Pind0cCDM8Wf1cNLpSTY0i1r0qRRGg3sp5AxkWQqKUfxmrrrFNfw5U9xj?=
 =?us-ascii?Q?2+AG/NTa6nW4IfVHdWvFT4XjWzC9V70m8ZK1LxbK2AsobebGC2OmOjjC7gRZ?=
 =?us-ascii?Q?DllRs/X+t9zJFE4jzDBbZ8hw7mZul9FqQUaZZNfaeme31HJh7BBU0xyKFZs/?=
 =?us-ascii?Q?ttIo6+2KPDzBTSALE9sd4Pxp1S0N43t87bwwKoZW+ZwOugLLORXvd1ilpKlj?=
 =?us-ascii?Q?tH7/k95qU2rDorTtiXk2UcBOCsFvRMD6JHr9f0uZgsfP6OwjJ1XhM2fq6iPa?=
 =?us-ascii?Q?GypB/TezaaL+FRm3MEEhgrnVyGTodJi1BP8LawIEA1nAGW7DUsz1IoPyQr6r?=
 =?us-ascii?Q?Jx3XsgeWhJAKkU28ycUulUIxiQLvfvoPtDMCYgTyFQ+btnoZOwJvrT7R9JB9?=
 =?us-ascii?Q?ClD9i8DD00/jRdq0ik8GOtk07v40uOPcYaYq7CmtwPXaNWMvN4rQARlRFMFO?=
 =?us-ascii?Q?5jXFLvVR20/t8FfGQodjcFArLJKZ3viSwqLBye+qQ5TeCpGDMOvZESLC6Qn8?=
 =?us-ascii?Q?kvDEQ154G95tEpLvCqll/WUyS5R5Hk1mnWdfbd4vRL1BRPV+aGPIgQgndW0N?=
 =?us-ascii?Q?N8BAbZqxuvH1JXGBRnEoZgSc9vq11cS/pX7Akjze0OraFWQW8sKb+PMzl1jk?=
 =?us-ascii?Q?W+nmBS/G/YkY+fS8yS+UPvY/JI3qhKV08D42OUHNmIpmx9nM33RGYl7KjEe9?=
 =?us-ascii?Q?XR9aQuGGz3p/ybxlacNpRxIShv4P7xd4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QzeyVy+JPjSzqgkCnMMSDvVA54jm9eWJveoPHB3C/BMVIRmBxMq0SpvSxf4M?=
 =?us-ascii?Q?cVPMcx2bG5EbHpqISxaeUADDRhkjWCCyhPvhRG3XhM0EE8bGiIOzW35+qvN7?=
 =?us-ascii?Q?/2sjqVnaldp+BQCUbq2E368/u+tMg9hankXlh/H3/KenUuhbr30G5ulZbbil?=
 =?us-ascii?Q?ZzOu0Zy66fDJRMQE3f54xO6BPnle8N83W3ANsz8DyLp9FBEAa2rcauEmFtCh?=
 =?us-ascii?Q?arMYR+BgHZtI+FECWLscDRd1BpYsNX6NLMApQkNvO09Y0CM9xymlWZrTOOWr?=
 =?us-ascii?Q?PJD5sZm+82dQl7TNoMN4UGu8J9yAHzZpDCYbrZc1RCNEqAN458co1w3jLtpV?=
 =?us-ascii?Q?5V5Ge0jhosdQZODgyaXzV63Cu7Gc7AnTSrFgiiED/gaEgyF4ewc8wpXyh4mC?=
 =?us-ascii?Q?OZka71y7P7+VqxOg4w+xHWgrrEuJlvtdhRShJKvG1IdhH7toaZyrAcz8d8Ue?=
 =?us-ascii?Q?gjwDztid8vwcPCTS9Bb2wd3j6NWpQSfr2iLww3B3JsveX57VKyvtcjRs++h/?=
 =?us-ascii?Q?zy/aJcKjbftcuC6rCFF2Lx0R1HBKu6fzqEKQgCSuBOy9KDb+DRvu/6z93vPL?=
 =?us-ascii?Q?/t0tSRK4Cuhya4v+FJN0N8b/SitkiEtto/+NufgUEQ5htsCK9ZJ8qdp1cE/V?=
 =?us-ascii?Q?H6QRvVdGGlcO3FAT+50fFYlnhtCiKPbxYmo+g4a5QZcas6ZkJMEgj+JghO5b?=
 =?us-ascii?Q?VhAgYNDOzsdWjyzSObE+xdaQcmayq9TWttU2j0QpUnAgpl+UsKSfOmeSs+fv?=
 =?us-ascii?Q?TLmpK4BWKnFz2cYBIskR816WbrMHlJiEt2TGMQlahD2PfCBe4+VMcZWqE13Q?=
 =?us-ascii?Q?kXnU8U8z/GCkbj/r4bvLNrfhDjbSj6xv0fitZ7SWmS9Pz5bkWgnJlm0RSyIm?=
 =?us-ascii?Q?JpLzkVYzHTjOSRTTp4TfPTBODgSkqPjgxaCJDbc2gX4lHNBzhfihQPtKnDUZ?=
 =?us-ascii?Q?nfzXW/itFJa9j8M3Upshsnady3s48ElGzr2SuqRE2ZdX/lznjs82V9m9nEuQ?=
 =?us-ascii?Q?8l8yXe7oSWmTmWH4BwcSNGu1c6Wk3xI4940gXimX4E8vPRn01kCgSvQ5eIXW?=
 =?us-ascii?Q?DgmdTUXZ2SuCdCZBlmN0HTsOw6sEX1gBKJN/pybTRS6WNK4GUqFx8UZjPwc1?=
 =?us-ascii?Q?Oq/EviKuxIY5/Uo8x1B4GV5FcxxyjBWDOv1CXw8TwOGODhAdMmZjv7A6D03Z?=
 =?us-ascii?Q?0+Cf/3BABS1AEjW3Z/Kj0tAAIbwEyiMS5FBJe1WNNHBDW46S6CrLpcWMP58a?=
 =?us-ascii?Q?xgQikSSwK4mWiV+54OJqMlc08yB+4rApQhLib0gxIsesg0hIPeIwDTkKaBJX?=
 =?us-ascii?Q?W5BR0PPiTnhrm+PeKg8Viz75QKIbKIEjLnoSG7WTFZQSKly//3M8IXz3m2wo?=
 =?us-ascii?Q?fGgOEuUvK6tE4L/oJ1KWjzYMKogNnmhdRzHdwrLVx9YV10JBMqQVPDeBFcsp?=
 =?us-ascii?Q?skzjKGF1mkDm2f+OcXc2LUzgEEwY/KAt8jHHSUOtKURRQvz70vResvFBjP7e?=
 =?us-ascii?Q?rGNdDoFUjnijMlDuUYWxmeckizrxZChMt2/O7doM8Y5WiechbFXPAxxsL8Cq?=
 =?us-ascii?Q?THjEwL1bOc3OJR5b2BNgUrwySRJJFAQhVdSIJmqkdXgP4X0TzJH2ZVebVXO+?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4320df58-75f3-4246-2bf5-08de36295ca6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:14:01.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfPQdInFL+8W9j05fOW5cNKRh91arrHneqv8gm1F/T9JYs3hpZvNhcTHo1Mc0MXRtHleTeKBE1aEDo8Zx5uTD/plUMsTi1jIIJSgkozZldU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_231406_462782_5643E5CA 
X-CRM114-Status: UNSURE (   6.76  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index ce33600d4c5e..f96b30c4cbfc 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -207,13 +207,15 @@
 
 #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
+#define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
+#define DEV_ADDR_TABLE_STATIC_MASK		GENMASK(6, 0)
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
 #define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x) \
 	FIELD_PREP(DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK, (x))
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
