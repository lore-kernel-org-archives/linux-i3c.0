Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC53D116F3
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Dec 2025 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFT2x8nVzufDhuBVoagNZ8ZkgJnhNNW7Dl6cpdKxHz8=; b=TXJZJXAuAoT32L
	J/HPkNHGty7owNvinqwslUyOrA2DfTZEL23LRIAd7UxPOL3ahISTGW9NnoLLbya30oOqqf+Uq80Ac
	nF7Vt2imNjpAYLQqAmZUZ0O4TlcZ6Tr/Jcfe/OtmXk2kOJVmitzxqYyaJdFFoxwHUZE7zOeLy0ENp
	E99/IW1ls5PAfc33XRdwTr4sAzKF4lkNtGD9vF7k40wIe7z5fZ1/pYsZ2gZEH0DaARQbpRETL/3Io
	mNhiSJsKEm0V4rIKjuI4FCxC8FJofQyxGE78QNAvcaWS19N/YiHVwJf/6RQfxIS/XyZp7m3LD9egX
	b3zmp+kZ7UDE7a0h6JvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeQ-000000030ls-2RaF;
	Mon, 01 Dec 2025 06:44:46 +0000
Received: from mail-eastus2azon11010056.outbound.protection.outlook.com ([52.101.56.56] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeN-000000030gH-2p5g
	for linux-i3c@lists.infradead.org;
	Mon, 01 Dec 2025 06:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWMEuKrXJwlZ0XCEkbKs5qnybPZj4+JMjbc68mC8Gg6YTcuC7N2agqL1xGuB/rQH4WUxe5sevdtZzWFMzgGOk0E2RWSpegmKkk9g3Byr2TiGm4BTmEYZ/8EDgTMb1Pj2WPVgS/obIYyrh6LPUxltAiDeOedKHr9IGDoIRDxyheaSro0NjGHT04Hil0n2fIesXLGeX0yB9Rc4E89Uf7U47d+XCOqp7DjAb/GSDJOm9ayrXmyyeMhOfLTy27kRMHLt1Crn0SVKm3t5tJNod1J8Oxrku01u6viPMjgkxh1Xh9p4o1z4gzqzvxJthRiNo/2D1uOWOzDs/xsdwwjdGPhmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cy9sCGl/LW2SHGmlgltW4oseU7oVWRD8DvEak8bFQBo=;
 b=i+B/3mWmMLGGAb6tdZJXX6DjlgZSPCX1i+MqHXoKXw6McioVzz1M4xovIZ7m/nIuIA/LIeGSUVYRfFnomYbjjV3KYKGrwqF+AHI3m0cbA1wbVvBvkwUqGE2ONDoZY7NVw8ayUsBAdw1JI/tPFFSL2RoLqtM7NrWlZVA/AZ2pGYgrNiaMCKxog8zvqra00CJ9xMCCFUAjgJMxvSrI2xNU2w+6XhBoOPb2KNjQbjvh5crf5CIChSeEI262UO55GZcfOXFvIKwixK97vrqn6QnVnqN1PlyIl+jYQePWD411uLkh9T9pGfNic+1vdNYtVTKnE0S6oSqocJrkCVDFyuffnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cy9sCGl/LW2SHGmlgltW4oseU7oVWRD8DvEak8bFQBo=;
 b=ODkqgquaFq3kQoRn2hD6QNxEIMV29Wb+SXG3/4xDFXaCTSYvVWRIEFYCGZretPexVCgTqpZKZjEi8QoJFcz9uOZGA9KdujPrYww0kynfY5PIMZKVjrNxhJHFA/g/91+8BiNh0/J5UBFNyPOz4BkWg66smMVvaiydRtBSd17oc6vCFk31zuKwczOIOi372iBPzr00NV/jJGq+AmHfINKGo+r16gsR02uaY3dVovYiYsJ92gxZOWXY50lj5Env811EwKyQoXPtND/WlfIylLcXh+hS3bJd8FqAtY1DTEH97TwWnZEB5IVNSHotJjAXnOuczH0z+/iMGkprHpCqtUK96w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 06:44:40 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:44:40 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 5/5] i3c: dw: Preserve DAT entry bits when restoring addresses
Date: Mon,  1 Dec 2025 14:41:58 +0800
Message-ID: <26b7e6b4e4f653325a7ba3d7bf791bd749e69ad7.1764571045.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764571045.git.adrianhoyin.ng@altera.com>
References: <cover.1764571045.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 92108049-50a2-4c68-672b-08de30a51a77
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gTnE4RoUmLvtIhPXQKzEcvjMBvOIetTcoYmEnAisHs3R8VkczEho9vzq+iDw?=
 =?us-ascii?Q?dPYhB2JnriaCfYxJlUxOYhxfTrFXVAT73dW8tb6RhwmhZLweGU5PH7X68yjs?=
 =?us-ascii?Q?V9sdsCxXnPMuVo2yj4Vb2Toe24Fw5nstNsVspo1BQLVxf7uYj+nPW+qdZcWm?=
 =?us-ascii?Q?2Jz/kz/T5FsRZhGrwRrXsz3SVLXluyoSPZP3ecp0ITW93fFrJX7m7sC4/G8W?=
 =?us-ascii?Q?4PkS56hGupLkpsNChhX/z2o+KELR1QUwlfUz48EzIfTbMURvZhsgDwaN5TqD?=
 =?us-ascii?Q?8lv7ZzSfr3ZFZ722gbHwA90VWGCLbbWXr3ZVulgymf2kwlsnnuqDCsT1ZcNo?=
 =?us-ascii?Q?HFUO+8/jYgScZBHV6gH2TZ+KNtHFOFl34AFi0RlBvJ4ZLFOWBr74swbKNQYV?=
 =?us-ascii?Q?o1+EzIshm1Km/ViEF06Ozm6j3Iia/b4vXpBOFjfesOQgZGKX7M1hyaeJZItY?=
 =?us-ascii?Q?BQVcACHLzGA4j//dvsO2E+R90e7IXeKarAFp6NUuvVFSvMCJVbJL3KOLKQqJ?=
 =?us-ascii?Q?KF5j2BmKyAi5wfivbMgXDy76N9CFjp4I6EY1/DTqCWnYsFgTRHyLY8G0xUN4?=
 =?us-ascii?Q?qI62Le1z7+qPWYbAIGT7BPAJsWCGaRJChsQF1p2EPYVT78brLXKBwxfIc3eH?=
 =?us-ascii?Q?pHX1TBIRQ14W29Lya/Nu64kshstUxhnWvBmixLN8iK7lLpOnbTEec8Cf6+No?=
 =?us-ascii?Q?9Bqs2zIgCSZGadUsm6jymVO4c5lL7HR5PDEil4ki14tcOW6L5j0nYnkMRbqN?=
 =?us-ascii?Q?KxA8NKyLnTJuObd+LglEEfKI8cznLTIGBs9LQDLmV2t7iNGGdk2SOsrgjjXd?=
 =?us-ascii?Q?LJvfNT0CSIBIKH4ePgxDu2cO1X37TY6PxJrXBtwaJL20t4PVAqeKOsT1wjZ0?=
 =?us-ascii?Q?380ZqUi1yZp065eDkzuq9tkNXkkooC3OQSYp6YmWYXQDqujZVike9qRCxz9E?=
 =?us-ascii?Q?mucO/KNqAoASKveU4CZhNNNH/482NaEmshEbcposV6HI/5tcL8n6apX9dT7g?=
 =?us-ascii?Q?2Q0AmCZInWivdmXin2z9Iy9jBZ+mNYfQ1Bzq8DK71Tn61sZqAKRQ1/v2RiUr?=
 =?us-ascii?Q?7OtCMLKURGf934WJzrgLLdiiYOtVMCjeham+2sLDkVOc1ciENPLzQzPRdw6s?=
 =?us-ascii?Q?e9/eyqsUacDD3VYa7Bi/hgC/5hryLSNqIdnqjy5GDxMEk/kPsi3AVV8Nkwhv?=
 =?us-ascii?Q?TXorpoGhXjJQocDEv4DMNsogflH3ce9vF5sfV+ekDH3YPfIRU57Sjy/VX26r?=
 =?us-ascii?Q?5B2XkucREOcAuXkMOSbZjZ7JdiuObzSfosrSGJFQ+XyHcNEsp6ABd8bpwwHR?=
 =?us-ascii?Q?rC9KfCvlM6Ho0O1RNIXj9MKbFID07FMOpp09nX/aB8fIKFr/hrg1u57iAGso?=
 =?us-ascii?Q?3xaSTBGvXYUssOEp0JgaNdUvx7sq7BL8Xxpz6dPX7e26pqZA13bVrQJjyT8J?=
 =?us-ascii?Q?s0OgSEsevhU2zwlebKHko5TO8s3bA6LC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qt9GNILBLlv/ZttmECmBp/itLYtmb5+BR9wq5yiVWXI3MyuFtRi11nfqxyYP?=
 =?us-ascii?Q?cULg5YrbdS/vAwEw/0y7VsLlaLA01jDNc+MEpzslZMz76DjnxKtpUF4ct4cS?=
 =?us-ascii?Q?hKXTp+w5Lch/vZmKfJtynglsGxVdhiA3N+xF3o36+/qmtnEzNk2QqZ1WhqOP?=
 =?us-ascii?Q?hLzxUSe4m5T9KQh+JaS9leCtgdr0vIGOFVdJVk0YA/GzYtf9W48UqaW4vm8V?=
 =?us-ascii?Q?Ut8jlt/M/gfnrBW+txOO8t24inhXCrf9Z0n0+X2orFHVAMHWfw8A8iwQxxiB?=
 =?us-ascii?Q?4jKCbld07T2gWqXykIep+9ms91ub8g4jo/aiWurIAji2KVk9ZPWoJ1PFgi/C?=
 =?us-ascii?Q?sX2+kMlrugsBsPYFIPxoUUNiuxxyvwNy4lBvNdmHsulykRI8OSyX2sZIoD4t?=
 =?us-ascii?Q?glrTKkR6jmdFpQsKBDojyiOJi/DuPJ6jngL3N4nJl88HXkVielres6hDfBsJ?=
 =?us-ascii?Q?0m2X8hy8Eh8JN2VIsGLXLVqX/6dj7lQQeS8WohMZ7qFa4HUPjGSvmGf21zAj?=
 =?us-ascii?Q?vgVyfAi1/fOxDloLwmrJU7iwU/ZELlxU4KXaRg44AhwlOztX0W65MipwBsrh?=
 =?us-ascii?Q?j0bwqGoA9iOhK35f9RpIgsApEej3KfcvBJpQZmYwzRGQBThuiqrYtBccF0It?=
 =?us-ascii?Q?laULiaYHdlfEJ2T48zbnWm7l5peSprnkj99JC6i8YN0k52hzKELn8C7IJnmG?=
 =?us-ascii?Q?ejoEceys2mmqvWtYoaQ6dMwCSR2m5srsud1IQMAwMhcnsv1WNPT5CNwGJ5Bv?=
 =?us-ascii?Q?hAe+fuv6x6mvLlYRAb09o78NDBIZ8CNkpgy13bp14fftEIbL0PwO3lp1fkYC?=
 =?us-ascii?Q?RNYNLxsh6oJXH/rKBQaZOxcYcFr8AULgmI57BCfORvitBMdWC6KC/62fpDvo?=
 =?us-ascii?Q?f5CnsTua1Zns4vG/VPb1KCeFaRI0Pnw9GUWM851cF34rHPU7WBCbZspz5eAj?=
 =?us-ascii?Q?Om77cuZFo5orrZcpibOOR91F36fvwRMT5e0IasAgPKycYZwEP3H0rRD7dFXP?=
 =?us-ascii?Q?sHlavhrQewJ46icZJ+0Qld+gpiVv0UCujzQ84l6/fFUtPC0eLYIwRAPpFFY1?=
 =?us-ascii?Q?q16jYQo/qVA3rmqna4PR4RqNbGcgqJkBlVCfUxsUGnTSRGC8izpLUFvgniao?=
 =?us-ascii?Q?KcrkSmcaSqmh1JxZLNecyq4dU+h0J+6vmOYen2yyWiZPDS/ugoLRjhWnraN0?=
 =?us-ascii?Q?sYM+LX9Z016GgwPNrD4FTdhesHFTZBqIwqILa/D5n4Hddmfkd60h4NLANVgE?=
 =?us-ascii?Q?hqrrf9vthrQ3B3eYxRwaEtihuLKdfdaNQL0l0/zNqXnkE5EEC5IVu2aKYoXo?=
 =?us-ascii?Q?X396gBF1+KWtAkM8Vpw60E+OAFjZBFZ9xgj7IcN/+zOnzBN5d4fhF42A9Ogz?=
 =?us-ascii?Q?lJQ3gizJJnb21VfW0GuglTZFfiUvfdUJNBg7Yk4GgF45mzBGhWKPy2nZnoee?=
 =?us-ascii?Q?9Z8+7MIaoq1wpCuOlcCwON5Ik5VRlUfVfrR+uSznuzXkHRz5YLXppeWtxBnR?=
 =?us-ascii?Q?6Qp4eajBewAGOkBm4kVOt1Yf6xDxM+FQQ7d22YzvRAOlh/1HsuqhT43ciJXh?=
 =?us-ascii?Q?LdeOD1+vFME9gYgwGtE6OGwwfWFaiQEiSMdAaaVH4ak5TxMNI2NRKi5umNay?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92108049-50a2-4c68-672b-08de30a51a77
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:44:40.7415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsE8nz6FvZ6X3BsPk4kRTmZlBWrZ8lg/zx3YFT1ZbsqerJD7ZkpPwfndAbMBmeD1/aLQ89YGdsP9/yw5Dt/q1maDCTfM+KAAZ9gbVdeldn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_224443_714168_663797B5 
X-CRM114-Status: UNSURE (   7.67  )
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
index 007dc53bc9f7..8378067aa58f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1725,11 +1725,16 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
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
