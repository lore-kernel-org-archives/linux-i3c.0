Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BDD3B7E7
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 07:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7LwTl0CWlsyYSiBhI4xOAYKNNr1WJBwkn9MrlhcVUY=; b=p/SaKx8SiabUqA
	5F6aMQ8qBW99Vz1ZHwrY6WeiugymF7GruIewMQJgiQp9HrJkqtP8AgMmo1jWs2S5uLUI6nSxnnlL0
	pADn7Pqqq7lMShjxXPQaOe724LIQY/oP7LfrY1E5K0ynTPKuMoE1WobYktDa475Ujcn87GPSHNnEI
	DYJWvUtW/acH1e5QrKuPO1JrFurpuRkfZ0D5Xk2vQ5iK3qYou74/yfbYdkhQ/KsfKindRUUJBn+7j
	BpcMNBW8G1M+l974VNCQExcjmyRmk1nA803Au8V/SCxGNYlU0zBpiGxyPafW/WKsuReZcaFlB1CsJ
	Xo+Ey5q+Lt6X7EMnsVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRi-0000000Cjit-0dyA;
	Mon, 08 Dec 2025 07:14:10 +0000
Received: from mail-westcentralusazon11010030.outbound.protection.outlook.com ([40.93.198.30] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRf-0000000Cjcm-3ISy
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 07:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CP8lGqT0F1mHkrK0/4T0ekIV4O1slrYNUinqVnCQ1/BdV6wKui+s49pvBzjsNowjLp0ByAGlGChCcS5IfigeI615mBYriHdN+LOQU+aIcEo8f3CSxM1iydan7nDqnR92x58r/4HyoDjh3xoVfoiathfvY1t8jo0Ru7OspbOYCNkdyrzxXAvxYXSKxVXiKL2ZaCEB7r8V2Jtb0d2g/asoHesp5wyDeH0dKUAH9hBWAvFkNaF69B3NOdEH9JQWEofwRqxEfAa53iYlRsSRl9pBkzJWakXTMfvZkUrGJUYIqC2UHMbWTz84+YIlickR+SGjkImIhUCwUgiuulGqL5l0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZussLaBiuI8OUlsznCz8+P3edV1h2TWAyYpNaZFRi8=;
 b=D9NZNJy5fJioU2lN5crZzPc6lKQ1P8VMy5gYnxLKPsgsw5XvmwAtwynGk9tXZ+YJopZr594SkSz81mPvQ4hXNhMSqyv+DmsDpKYGD8nP8KzKA3R7t6JcgIO736fdyegpaRcVaB5eIMxkznh/9chDTQWGpg+p3xIRZnwphmUi13XFQuPtHUod61kQ4PWdtJusNpQZdHqbmfiziY2ZkpF1YEwDgy8Lm+CuKtyKoXEEhJ6tYVBUBS9uBN3RLUI0m3Eg8DmWfLKFbE7ifiJKuaT0uyT431VjjGMBB6NXYq8xBcRujpAbNeruhifnEN6BvKSyrlJQ2y+L/bPsCQ8juPB8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZussLaBiuI8OUlsznCz8+P3edV1h2TWAyYpNaZFRi8=;
 b=T3Jmw0a9YPhlWkDzANxSLRFDF5zuB5eC3RGqksCyTOvmh6Nf1Q1UmnZ11y+5vDcu7MEPk4jMa6My/AcyGX/T9sSWCBUkNFhsAl3LNPkbl5jVk0WeJqgtzU3fjWFijaF/mN/npnP5URvLIqm5Rn/X0FvD7azDbmJIm2s15+++1rNUFVqhpGqvUHrPM4mfU5ouOy0BKm9Fqrn3GjQnrehKm852p7v6iHXyl3bsdQI8y9dYK2jbgjyh4nCLP3xn2EkvqYubWcWv6ijOOxxOKNPDq69PWErgdN1ld+V6yXqYCi9hicg/7BWAtocJCgCSAz0LeJFF6njxlVFcCuuoUOxMjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7475.namprd03.prod.outlook.com (2603:10b6:a03:55b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:14:03 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:14:03 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v7 5/5] i3c: dw: Preserve DAT entry bits when restoring addresses
Date: Mon,  8 Dec 2025 15:11:20 +0800
Message-ID: <c458a5217ad963d36f1722f2433dd684fb8637e6.1765177110.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765177110.git.adrianhoyin.ng@altera.com>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::7) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: d99281b0-0347-4d35-2f36-08de36295de2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JVGm1+poL1BIDt36zq46kq0iCAqjMAkNOqH76xU8xWMqV5gbG7P1WISGyca7?=
 =?us-ascii?Q?KJvqYJWK/7RC8dxTyiQNobo+ml1O0K2555pSn92pDIwk1J7BtCbau93/bXhy?=
 =?us-ascii?Q?CzZYGDjrdlNFHDBXEiHO8BPn1OtqcoDk8UA+aB3AX/HzrmjEubV5FFY8nGJA?=
 =?us-ascii?Q?fNnPt8LD0NuHhrvs27JgOI2K3RHcGqGl1rpmdcD50fMVFdb3/eTmDjTIVwEl?=
 =?us-ascii?Q?i9M7V0ToEZ2t9TdxxlRrcG5gjSX7QXFPge6MXtg/an4B5p9M+GQIn/9BEeiP?=
 =?us-ascii?Q?t4ny4bwhO0xk5G+d67Lhgdl4Vcobrdkw6fX+K2DD38kq+7C7CmwCp5KGsK40?=
 =?us-ascii?Q?cAdUelh7JDRlKaaKWEe4kBTAfl+sT8DV7mT1n6QpQMCTkr1z5pyZkcVdn6mB?=
 =?us-ascii?Q?+ki4TGPHegdLYXqefSSohWEqyvIcY3fasLEHn7n/iyWJzPRnLmrDwq52a5I+?=
 =?us-ascii?Q?6eAafdwMlKLmys249Ns1s4eN/45y8SQCQWRnKKsEBK+cOd9RW/eUo6K7+Ilf?=
 =?us-ascii?Q?r/SpyJ1wrtWKrHYEte1+1J5bdYmpy4FIm8ES3EsFSNdhg5KljfE+EslHCReU?=
 =?us-ascii?Q?OuK0xdOU4SoAVtms2wYPITjdd8i96UwinDluYy+aVeZz9nu1j9srEbqeH8ch?=
 =?us-ascii?Q?BrVey9rFIrW2iApU0k3geSK5umoewNIj1E8IGNK1KoKYiKSpNmj86odcC8qq?=
 =?us-ascii?Q?k+GXjvxBv/dengHetDic8PkmdIXLSktG61fIgAze+jpLUED/bVDaU7RK5aMc?=
 =?us-ascii?Q?wui6lkHh6kZ9+xjEg/8lxLLi1OAPeXc+G0MONCGIH+nYfmVsfcHmgEdR9qBv?=
 =?us-ascii?Q?ivFghnJOdAF/YsFWO6KrGwnqyoL+gLsAjaVuH9FmgLF7StB8KCSWQM4VJPOc?=
 =?us-ascii?Q?fhv+G0mkUqGuveS0s8IkLTUB0zkQZ1LEHf11g+H8MhFbuzhgq9ROiARDjMGV?=
 =?us-ascii?Q?XeDsUQ6Y9ioBogmtv3mOSG9kPg+wgRdVXCRGxk75WQ6CtSwgBDFJRu0II4I1?=
 =?us-ascii?Q?IxwMbrVaIporNpEGYyAAbuhDEpyviKtBt3ANp736mdl5UM0/n+7VI0HnLdKJ?=
 =?us-ascii?Q?e9iKt+V0ymZ2aJUtrb3+3xyYX8IXNn4EtAiXRrbfOQaWj7P8dtBkhjfvFppE?=
 =?us-ascii?Q?vUDGXAbFZbZaH8Jgc0DFHqqBrlIjQV0Bv/7bOxNlEc9Ft44ZEyzkiEV/eWsg?=
 =?us-ascii?Q?plYxY9gKHYZQTdvlpNHkx7oF5zqcPejfAhE15Mrb1SULlTODkPVgX8kKyHsM?=
 =?us-ascii?Q?+q9xmVRKiNqEkztm+jvCVEzGwCR52lGaHk3mNO7b7XrPbvbZjuXNW68g2+JT?=
 =?us-ascii?Q?bOnvugPRvcqSh7UZbdhMJ6HD646UvsR95YjiCWejsFwDTHvLptAGvfTNMGod?=
 =?us-ascii?Q?zj/212apfAImCeCxdYF1OF4qh5uRBeT1Lpsp8vWw3Uy2lm6fx+kjc+TrjMwh?=
 =?us-ascii?Q?JHJqaC//HQMEyhz1JZ8ZFz0O3WTF0CIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SYOWR00nmXX0Tk8M6mnyxtx6y9Lv41r13aFJcZrhNGxioLLLJ4zOWcLiGXfy?=
 =?us-ascii?Q?q1LyNYbfsyw+MQILRDogluc0MYQi5AdceZzjpaYwjuuUSm9mY4eJvmPuFF6v?=
 =?us-ascii?Q?Ha3qWQwiMyJ4h1y9AVBPDtx0uUFDj2EheYg4pxg8DyumcrXuSzGuVPcvKgF5?=
 =?us-ascii?Q?uMwehDl5YIFwKx2LezqjnT5cbhBAm6+Xp/u25Fz7XADptvPKQEY7pQEvPZOd?=
 =?us-ascii?Q?DQ4ZWhXTegbWpp9pwQHs06APLuqOdeApI6uZ9dXHNlp1fFYcN4q/Yw5qCjLz?=
 =?us-ascii?Q?7IyM6Dt8xax1lwbeiUoV7A0Jl4iFxv7X0RFtyndcHg9F3s13K7OpcpVDDWUZ?=
 =?us-ascii?Q?EyrmTwSXHNqygIlnd8yMvYWPfh/yE73EHOdVjQ9zMl5BYFaax14JDRLeITJV?=
 =?us-ascii?Q?EvIvJl4DGzmmiNeN2uKnrPON8qyyZ8z4lN/rM4AahCIbEf4YgMvNKG85XFAS?=
 =?us-ascii?Q?IjfC6kd9SPIO87bGSbq2T2RAWpCY+4XIdKH7MPuTbTTueu5L3sljSz7esWLe?=
 =?us-ascii?Q?HbXkopgI8I7+oqRBqwHVpdaUC+weivA4kR9zE8YxrD31Zl5d0tguYyMBYMEz?=
 =?us-ascii?Q?nH6+xShSJythG3EhfM+oYMJMSnB/QUjnemt5Z4Qm/mOMkyj5HKzAZNNEHVb7?=
 =?us-ascii?Q?SXdDNtT2bhbtnwQxetYEapD07CoTIQxZJ6rj15oLGIuH3JMJsBZGxlNmBjLX?=
 =?us-ascii?Q?guke0XzTkNmy3Ya2NwSA1peGoPLtdS4oSpqkPhyoo2/7oMirAzRed4MkrUU/?=
 =?us-ascii?Q?msrvCYNAoGlNlVSJDYQJ80FRq7bxPMivYlAuiTVp85W4B7uT6kVumeWpUXXC?=
 =?us-ascii?Q?5BaBXJ8bG8pk2utxj4JFzGii6OvUeN5i7aggE5qJbfyyBVVCu+p0oZ2tZHOY?=
 =?us-ascii?Q?Arac4vpA4HBqBLB/kQY4efgifAmtZpfV4phJ3eQl93+PoZZ3+KQEH6qA0lL4?=
 =?us-ascii?Q?C4bmhzDbrtIO7VKvhEToa8c+lNgIYEBFQ7AbKr2lmI/IMo6VZjTU8HKsQvWG?=
 =?us-ascii?Q?5UsHACBkkbXUYve5HydRx0zZYLd5aownnxj2An++D0zgyaZ7VcVCEEnj0wBp?=
 =?us-ascii?Q?RMj1INESPnhtEoXQV0KbmFL1k2G1IF7vl1swevw/5QhQZeobyYqBrivLpGgk?=
 =?us-ascii?Q?m6ap9A4lWdZ5QpcChzQto4sE3eTQpLrrlvcnEb9aennlg8btTz6eJYTJq68Y?=
 =?us-ascii?Q?dTWEjlnhsoDw/BCeZ6pGG/JfBRvL2frhqjDBohk42FQs2WVhlpSaswwUNlE0?=
 =?us-ascii?Q?w3WwZHgqHF23NN4w9g0j5mATux8X0G7Z8teY/i2ARmF6rUD9wyOk/4jTJDjU?=
 =?us-ascii?Q?AQx1p6EJTDbBYZTgxRTLE6lZKOO3RvlQ+U0K9d5Os6aT4dsUQngL1PH27/OZ?=
 =?us-ascii?Q?tTYZcoS9AczN5qlGkXWG1gjDyZEl+fSPkDtEy7+UgT3opiW82V4nsO9OD1Lr?=
 =?us-ascii?Q?Qnrv+jj4KYSHMU1vY5jLGNiVIqHMrKNhWcEdDfIXDdC1UV8VTsys6cpyoj+U?=
 =?us-ascii?Q?RGldfDZSqRkLgajA1FMzLalXSE9m94dcASSiBBHo/h0om3rlwo2Vfl0NAqX7?=
 =?us-ascii?Q?+Uo/t+ZfGNsC2oJSa6qcxc2PP1Hw4HaaJ9OkkKn1AYuIGOulBbDvWDNsLion?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99281b0-0347-4d35-2f36-08de36295de2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:14:03.1220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYOJHs+xtcjWbZcodUghuCUC8QiFgFx4NMtdz42kUmoWh6mScA88ezIeJz2cSKeadaxyI3Kak7cgY6KioN9hYJHBriTEQT12gkeCYxDthPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_231407_831487_13E5B067 
X-CRM114-Status: UNSURE (   7.53  )
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
