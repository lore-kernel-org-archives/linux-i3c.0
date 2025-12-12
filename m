Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EEED4336A
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7LwTl0CWlsyYSiBhI4xOAYKNNr1WJBwkn9MrlhcVUY=; b=APltZbwad0W5zp
	7kjo0QJTbiKaEgVcyjFuBuvYQVR5jOXc/U30Zj10tqKXJ2yLTinX+zfZmZXOdhEf38cBccY38TEVg
	xqexf6b+yjtHif4VTv+zdSO8v9ft1ty+idIPJtM8rq/c+odlxAm5uzhiVa7rvGLRCAgY0lVXRNGsv
	BYKNggi2LDKOVFfEcbIsLrVzD23MlgCvrtyzAYJdq2lrOea3OZJXcKBEZI5Y0+u4QXlpHotLpE1Ru
	6hJbWF6SdedTeUkKveX00IATcdJ9SV6UQW1qCIyaZtKhy8bkCC9IJ9TArYH/MgUBNj11Pb51ceG5M
	bVmvD/9QTyBJLs3qyg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5v-00000000J1x-44MP;
	Fri, 12 Dec 2025 09:05:47 +0000
Received: from mail-westus3azon11010058.outbound.protection.outlook.com ([52.101.201.58] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5t-00000000Iw2-1yau
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 09:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaJRYHaNfG0IDuy6kuSBql4J43icVviLSJzos21zIHgV6CjUzO4zBlBVff4F8dWJoTj0BTpdeOPMdDm9JE9jg00JRfCDTKSJ4xIoh8B7WEPKRRG+XezZkyvAkL7c5a2f3OMlEPILLlaIs3n3Jg0AveQVr7C/zR8/SjcEwuuz/qeCUC5qR0HY5a6m33H9ldcUMwEpaLpMxguMm9SbpN4rGJoEoTQoufVX/Nw+jqz4m26c3IZaINCWQBuzFG+oetQyHisxz8KrGgL4yqKxlfObInhb+DsuasOOa9VNe3isM88qJeQk7K+X7h4gmAGk0K3C73kSx9iEOcVlZyCod8ktmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZussLaBiuI8OUlsznCz8+P3edV1h2TWAyYpNaZFRi8=;
 b=VndnilrfPMWPEjrgYo6p58/k4xiW59ieh6UTmsmQRHUQBgaruHXbsDKM4EfYMr2bEJBJotb18BmF55ePOo8RC6xIt42WzLs2fj174CyZjVQ879eNxXaVcdkn0cr9fhLd02AeYZqcTsYdE446g/ngv/c3l6Z500JKIxakwPkJxM2XBFUvFWEwinQt11eBZ97JTW9krJsLcCKwCL9D8xukYAyvGspilMWzpArHGwmxKUeoDWD3JInJ0QZhEAtVlGuGyfmMp6JqhhakQqbBx+/ybzXRsUEm4bJTqs7yIufw559evXCtvRK0GoUheEnjPnWGGohvh/g8MAFrlp2q6QbGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZussLaBiuI8OUlsznCz8+P3edV1h2TWAyYpNaZFRi8=;
 b=JP0ENFZhD4RLE2qAwi4snHufrVgKy42ORxAw4Ci3pkxNsJVOhjZOkPsJk23Ysz/7qtmdKauwtqGNM77uRu/n+TzuMwc83WfKr+Hm7XuMNeCysUzwftYHN/JxtgckN8LFXESiNtG5D0XesuAEUhP3Cd4Kqyj6Tv/V8M9yLmDYF/yo4KI1zk/VqSW9qYY3vhWNPAjnQ4MQGFvSd88N+hBzxqC0QU+sZlLu7cQ4TsCISh7vJwf6Cx5o8wpD1gqOcJV6hl3AO7f9XWdKx0EiTLMdHnHKWNFfIqBkwKgTMFUvcsZ7ljQtLOs38UUGpB8dO5+hloe/TOresGOalNdohH8XHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB4916.namprd03.prod.outlook.com (2603:10b6:408:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 09:05:39 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 09:05:40 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v8 4/4] i3c: dw: Preserve DAT entry bits when restoring addresses
Date: Fri, 12 Dec 2025 17:02:58 +0800
Message-ID: <46112c0da44110f46709cb0e7a4595e312b95c10.1765529948.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765529948.git.adrianhoyin.ng@altera.com>
References: <cover.1765529948.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0061.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 364de879-6d41-4006-c524-08de395d9f27
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qBnfxV60i5IDnvQW0piuKFon6OQKyXCtuAxoo5HK9+tlo17ezITC1XmPIpEh?=
 =?us-ascii?Q?rYxEb7PzkVx+zLPn2YXGttrG5FRajOgWet7i8ZNm6vDFOaOkqn4mAUXgVBkb?=
 =?us-ascii?Q?XofPhSxBkzt+xtKc11gvE2edVJdb20nRYyyVbEsFyhmYxoPvUAhj9UY9QzVU?=
 =?us-ascii?Q?xK3m2UZj/TyqpTjXv+CPgNqgQZgBw50+16SwqQM48+ZoDObhWstqsQmMbb60?=
 =?us-ascii?Q?5fAhMEeOb9ekA0sF/gFpcMh+DainWyt943bIdmOW2Miu9hkdtvHGopbPEaK+?=
 =?us-ascii?Q?558e4nWWhJapaqP78DwdKcsUVvYUqJQ68DZHQcrDgdU9hUWuyTa25Yz9rJRn?=
 =?us-ascii?Q?ZFs5MjN5XSe2DkOw1iGZybb2E7E+b+HJdvkjPmaxWBJE07/GLPTGe2rOZd7g?=
 =?us-ascii?Q?0zjIuuuKTMI0JEFW81OL5liYu+19rqvUB6wOMUe2kEsZ4h/376gZbTKSYcFV?=
 =?us-ascii?Q?lKV128R7cEKK/ivVCZS6HEAzqh74WvJTjX259YhXVz68Gf7kk6xaCrWUeO9A?=
 =?us-ascii?Q?Gr4DAwOsaTdrIKQXL6W91qCv7sHrdETS2Fp8JruWCbefWplkPef67Daa32gv?=
 =?us-ascii?Q?b36OceJjbTBj1NI8nBtzXRK2/3swZeaJPxWLHwJosCNSEYNCMl01cEqMgGi1?=
 =?us-ascii?Q?JcJ7YV2NsT2E8nU7uhTDTfai3ls7x8eElgF/uLlVwxYwfI76IX6ImyFKkiu3?=
 =?us-ascii?Q?hudpJ0fMQrUh3SeokCQJ/CpaydtZrZgxKKTonEtIMsIdRuvg87m+9nOfX3d6?=
 =?us-ascii?Q?jgSQmhYYKcwCXoKEkHuaGmX1oZfhd4+OhZFWnwLk3GmEVgxnAFVslJD7gL8j?=
 =?us-ascii?Q?sCaG5RQ25b7IN/Eh3fy+/65d8F1NwQ+ZZi/NS9kF+Jxds8ktV965j5HMLbgR?=
 =?us-ascii?Q?JUuJ2QQz6KtE6FLf49JIwL06i0/rD1t8MusiuuZ0BzslzQuTIy64fZV/Q0gR?=
 =?us-ascii?Q?X1rRiohJvQLjQfNKgVMXs+jiRGwPuoulLVV4wffVylmlXKRZ4VpNJhWKsU5G?=
 =?us-ascii?Q?gzMg8XsyrvVIeVZ3aGkq0qINJMcrT3N0BlVyD8Va2hoKMh0HFA6/EHX44tRj?=
 =?us-ascii?Q?RwQxIdyNOtulcIjC+Qs2RTPuW3R4JdrrWmNtlbkQphbilD656istAhkxgTMM?=
 =?us-ascii?Q?UKniw5quGFN9RlQYjON3DqvqrcZ3EA4dlrg6NsTLZuSgc4gmKZbhtsUG4VcA?=
 =?us-ascii?Q?tfWGOePqZ6dVlYmrJTETPlvj34ReidPYBPK3rx0tLyU/UGu89LhAXc5sC5LW?=
 =?us-ascii?Q?RRGEBz6+ODtMF60jpBbwAonGwxGQNSlozZR7xAeh7x9eb8Sie0LrEXNnSiuV?=
 =?us-ascii?Q?Cd1vc3ogsgmFG+KpLIDA3uSHNtionD/XjGaew7jiPlQfsauqXdRsHJxoCihL?=
 =?us-ascii?Q?wCCy+RUrzxFY4vgGsvC6FTyzI+au6YwJ0Ms+Fom/aXdb5zOSOWgSj1GNX9Wn?=
 =?us-ascii?Q?zDVhhq4EZmiJtEX7BXv3+BVvitKIvDP+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OILvv+vcumo0rYEhBwzWUr/rgnuhG1S/d5WsRuKQNfXvTj098jXpoCYfG57y?=
 =?us-ascii?Q?qV8hmmQg1ncJuG6RJb62XPiv2LzmZQI7BcNKUyDHU1BZuqJMopjw/phsym96?=
 =?us-ascii?Q?O9nn/4nsxgp31PYDoqpBpjwvdvJx1wmf/lyoIdwFOLE3OkpZGKniRH8HjH0u?=
 =?us-ascii?Q?uEUFLvOYLOv4rVr2Xb1FX/jPf4G7GrrFyI/wF1dE97aFcE/JWjPiXBX6+QuC?=
 =?us-ascii?Q?e6Ssh6lApUj3GLYJbwNPeXy2XCS8XqxT4/pjrEVneMptaql8/VVxu7DuRDJw?=
 =?us-ascii?Q?FdKGE8pEbfqCe8a/JbJmOKgfvBhP6jWnGV/n/RJhl0xYlvfvJllVfWDIuRf1?=
 =?us-ascii?Q?B9wv3bg0DeuihWQvCb4Es2ecT8//Juw8PLR3QqMrcifIr7THS0xNNtQere2v?=
 =?us-ascii?Q?t/m0za/pytDg0JR1r9m1mVHLMw8OqIADCOX2jlk5aof3wPCVShr00+vLiDfh?=
 =?us-ascii?Q?RQNLQJxrlZV45YmpsVfjEtp7IRU8c4DLOk1zFZ7mnGZmm7jO360pje0ObSku?=
 =?us-ascii?Q?roO/pz+kXEjg4KMDCtcl1g4o9vUlBKFS8WfDJUdOuqVqUEvdPoNlgyiSP4+/?=
 =?us-ascii?Q?h0IX3Pf/K9z8xvbPgt7pu7wi28SeFbSOWP7qd4LYNVEKq8qKQUV0MxS5quHH?=
 =?us-ascii?Q?KL+dtJTjqy6JugfO+8YpUdwKz7xDsczGdbfkSSBDvx2k6o6rSOkZn8NOw9fx?=
 =?us-ascii?Q?Q2su2F+4HBai/MbILTe3bGIU8Ui4LhuGmuB4HZw55icZpzl54rXTa9Ui3F2A?=
 =?us-ascii?Q?eeP4aV70j6IRXxGv3mLgdSw2MHjIOMrEdCQoaKz5YDiq8y+5Y2c7Ks1gUxth?=
 =?us-ascii?Q?0CiYemhNQskacl0cOnxi8ZsdJjDruMwUPUZAym+A972N3NyOY3xakgNMja+b?=
 =?us-ascii?Q?1HlVU2wsg/LNRMLmpHAhDS2r7hOrI462u9kgtnV4zzIBYjP359o5FLqsQyek?=
 =?us-ascii?Q?Tjgp0cUfq66oj44XQfvR8e30OQ5and7i0yc23dN9PYuP3iqWG0TBXB4She4A?=
 =?us-ascii?Q?7dWjZ7aQH8G1hlKvJLcZLks5/TFsvuVVQySF6x7JN7Pz75x7sIQbo2JhDTVu?=
 =?us-ascii?Q?6q6iGPZ057lHspqco1jAqNg630Kvclxi8jq8HefHx71Aw/NfVv6XAhxU3npw?=
 =?us-ascii?Q?ynNFh/H7GuLAerIhFWo7eO2hrpFcCUTYLDhQq+CJOiepNYyO0OXPmDJPb5Du?=
 =?us-ascii?Q?LnP7eVqGxbJDbtw9ueoRh5tPiOtM95lMECW14TKkWqJf6pLaoCGRwNFF0V1N?=
 =?us-ascii?Q?PEhBSW2+zHUatq/pZXrwBE/W0ybU9/dba42F+CQJXvf5cW9RdIrjqInb7NCs?=
 =?us-ascii?Q?O11fN7fi7jBpudrLdryV1yq1tXpO06RSwvj4Ur23shuE58eSUlgN6fkWkH5Z?=
 =?us-ascii?Q?wUMeWM6Htm2BrnZVylToZlMvTnEHnIcUPtS9521JhWUtXaxfyqtwi4xPnELF?=
 =?us-ascii?Q?MzlrQNmlvDSeRgnGnKv6r6/caJa4P+mQV3XhcvPrdeuYj+zv1rp0/4VaC7tQ?=
 =?us-ascii?Q?C7pq8VzpS439kx8BfVnfLsk7fxi69ajAmd9qJGBQraVaN2yMPcdP1Zk7msKB?=
 =?us-ascii?Q?Q+OTWeqKOik5Zv16j9CItfHDBRiw74mrczNtYGFbQtgMoJBo9sA1BaQ56BO3?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364de879-6d41-4006-c524-08de395d9f27
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:05:39.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbY+OXFU4lJfGdEQaNyVoxFc+zVzEgBZxo1EXEdeBnga+Gy0hoqWyZ5uOmEXBrqODOLUWtuagihWshkdGgn7+vjO01uzWxVEfF++hID/nOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010545_516358_B214B292 
X-CRM114-Status: UNSURE (   7.74  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index f96b30c4cbfc..9ca609df593f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1696,11 +1696,16 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 		if (master->free_pos & BIT(pos))
 			continue;
 
-		if (master->devs[pos].is_i2c_addr)
-			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
+		reg_val = readl(master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
+
+		if (master->devs[pos].is_i2c_addr) {
+			reg_val &= ~DEV_ADDR_TABLE_STATIC_MASK;
+			reg_val |= DEV_ADDR_TABLE_LEGACY_I2C_DEV |
 			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
-		else
-			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
+		} else {
+			reg_val &= ~DEV_ADDR_TABLE_DYNAMIC_MASK;
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
