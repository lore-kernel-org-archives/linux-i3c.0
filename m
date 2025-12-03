Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD61ED116F3
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 07:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFd/iNKIAZFhn09eCkLgLjZklz2+/lYcg6zU5ttHuqs=; b=wHDCgiwQWF+VU0
	9yQ18y+jX4E9/LlFLB3OxERbhuoZ123clUGvnWopzMXjlc4+BlsaZ5SWRWTUnWn4pM3e81u30fZat
	wirCuu7lweVyyPJGMWgtd6KLO9EaxXyDRmQIJfQCQEVoPEESMEH6FZDwlMIB702d/4M0rDRKwyCM1
	GEHGSz0LgCMR+ycp93KnX7y+lOiAhzX8GjU1b/39VDJqSdmjFhV2W0DjLCnXKjrqxCPMbbZAOW9Ro
	lQPc5NaXm5LSvZYKDbSrq25wZPVxX18ybWietS6sUo1j0Ru/AvcmCJPif9+vhJYuJiJ3enTlx0Nsc
	bv1YOnIPmZLXd7Ag9+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDJ-00000006Fnp-2OYv;
	Wed, 03 Dec 2025 07:23:49 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDG-00000006Fkm-33bf
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 07:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYzRSKaQ5orerv6Dj73ubBhQ2GA+vWxAtf3/lduC9i1vNE3cG9Ohp/pv4Umx/e5t9PqFwmCmT03qLODTe2AVEoGqVvu7SIVCknrSNwYBU6SeWVI8OrRnzFgn0s9rNss4zDUrjLXpC+EgR1pR1r6tX6NxYM2yAgal7qGC/Kc6VwtbSMUoD8fOfXOKzj2NEITaimF2+KqWkLQ91Y3k4nRkL4oPZSNB+w5xUXqlICva9i4UXKUaFOYfSGo+W28s+LVtBLDrzHjZ1aCQfPPPLTqyKS7fD5xl7ocnGxgqPOrtPK65Wicks0fiT0JKs9xg7e8euiglR+2EjoprzNTHAhXo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS7opTmVYH0Yax3Ob292OREWKqcsTT31hoMPwB9vu7A=;
 b=v83km7+ltaop/qlbyUPk4WSZKLYV3j4PerkN+KPCjsblkB/1VDz9VlepoeOkXBc5TdhPZ4xWbpa/CwfFJc6IwKxr0hEhKL2JXJIVIXODr+3Ywy7Lld9UHxlnpj2VWX7cPCXXFHAzBFSS55NHx9YbpxEn+rdPBPmVxdumUkmsJUdFvMMO68K4OoAmgpKnrbnObWYQI0IEYKSbb3kw/rsekcQi44lh5LnNfnbcH9uR0Uia+vsgVqgDYuyhM5YKHwDqMdOHe2gPZLY+c3pmYgjQ6DirtdfQdz4KXeixngXG0bFMRzaFWhVdFE2/a4gdwwN+Xxuyy6Bwtt8RukwEP5+1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS7opTmVYH0Yax3Ob292OREWKqcsTT31hoMPwB9vu7A=;
 b=hN1czjsJeIwcpQ8ujz6amBGhjNrl1P5ZyFC37IEeJmIbxVdy6LDEc4vgQlWp45RFLX/s91uwPhN6pzGIqkId6wAiPB2HMNAr2yTvmsIS2rbpH4n7YjCHAhl8bJ5M4MKYcK0AGahcbClzBVZ2uYGH+seGqewqgLq5c1OynI1Hh8GwjQSFoPCwmKTdd6SFJEg4tgqYN7Q6q0xa0cPCJGtq4flPUEQEVPmLpQGMoEYIky8VrdyDNu5mrD/s85kAwTvKBzyoXgHviwXFJvU31CKYZcBmO6446Gj6jS1gH4X/MQdkBgvYuNpvfihXB4Tx6hKuti6RlJ/Kf6S3XOGgvxk3iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:23:42 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:23:42 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v6 3/5] i3c: dw: Add support for Device NACK Retry configuration
Date: Wed,  3 Dec 2025 15:21:04 +0800
Message-ID: <c66b447dbf6cfbc0f306ae78f0d886c3ad65a3e7.1764746266.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764746266.git.adrianhoyin.ng@altera.com>
References: <cover.1764746266.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0025.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::16) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 56785835-771e-4cdc-d711-08de323ce2e5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LAA4mfTN5gG3Gmmo5+b435WiiR/tSr7JYw3IoSTpi2wbexa3OvTKe1us5y9j?=
 =?us-ascii?Q?zW7jVi/W4prb0LOALgRAwVzs7FcXHG89lkCrP2nn4298/f176v2bnxgXgQKs?=
 =?us-ascii?Q?TrONJEMxdwlwArwpnr81+k7xB2kd1vrDluVa5Zr74d73thJ9LIjfcrJQCITI?=
 =?us-ascii?Q?5mdVmrPGQOpjxUdcWMui5ApFW9fU4L9hlX80pqq0x/S6NAEyGqWf0ICOv90u?=
 =?us-ascii?Q?r66PiqGCxRtDA0J65ZY84gI0PO3B9aDsQKSVXYQ6QltIGUHiuiKY23e6acmE?=
 =?us-ascii?Q?4MERncWrCD8BKKGki/56Zt3sctWrepPURJkh+lu+R+TTcSrcYXMji3xgmIoX?=
 =?us-ascii?Q?2NRQ7nQXTlje3hPLO1W7DX64CCVj/3G9UMcddVtmxvTQqQqMiIUqPlPoqAMD?=
 =?us-ascii?Q?co4XPoIDRB4tIfce2/+0VlA6uxvFEQbS3Arb0AeQR3rTOj7UFPfGUF4LAcTA?=
 =?us-ascii?Q?GsDSz0rjzfqVmFaTXZjPPTmOWww6x3QFZY+ggN+NcbzSt9uwGo3Qr1F5/2fX?=
 =?us-ascii?Q?WhbZHhN9yBrMIo46Bw6hqneVvVfCax3cvQx4CAs8DmMk42zEwO4JP5BADHKH?=
 =?us-ascii?Q?GVOoSvM5zsNCiSXg8VNm7vm0iC0DDhbSjdmWrxSlj0P0r3tglR7Q/eVqdaXZ?=
 =?us-ascii?Q?xFlAztE040PnUGp6QIM418eZCFH33CvZwG+5Gyahl2Lf3xFfB3RorQKNc86Y?=
 =?us-ascii?Q?wV0txa31rRDkogjILA3yVlhk37vi+G2Fs1nzRWYpLnB3FiFRVhVALHA6MaGj?=
 =?us-ascii?Q?8i3+iGNfHKurkli6Pkp1nskXRZoZL7rJKjh0lIco6wWG2rfCJKLhQ04Jwj+G?=
 =?us-ascii?Q?ggvuvx6qWp4vpexjJfayHWsPB4naDVexQln32/X1M0H2GXZY8piPK2L1fUp4?=
 =?us-ascii?Q?AFo88s9ei3cbRz/StphDVL7NRvI0Fwp6JK7VNm9QfoWJkuOSq5W1p1e3fXtd?=
 =?us-ascii?Q?rfs6coSzNLWSyomJHg4LleAPxUVsAM/+mK/0ExHMrAjhbXBc06ou0oczCp8Y?=
 =?us-ascii?Q?QDPdFiCUIOe7TLTt1lKafLr4SEE1M9oRM4YwWOWCtz2SHz0YOCTBqWq5qPFY?=
 =?us-ascii?Q?ADEMbB5a6nWnqCU89jdNn6LhPCH3cbhjNSckZPLf56Mf4A5EJlE06IHrv938?=
 =?us-ascii?Q?rBTIZcqDupq2qmWUihiY+GfbQStpQ06c2aUT4mf8+Ay+CrmIOa8ISbnDLAp/?=
 =?us-ascii?Q?lrHIZG6B1FIUvkTGhcK5yF0A7FAz8I+5OZqAgTJAUffhW5i2l5+iqzcSMoM6?=
 =?us-ascii?Q?gDxBfPjKWkxvEnuGNJpQcXcQbEWI8xya+djDMpIZmjSdIQsz3o11I0zpy6lG?=
 =?us-ascii?Q?Z4Dx1IN7JeWJ0lnLJ86ZohNeSCJzuO5yPoe21WIa2FqACFUxhlCeFCXCJn1q?=
 =?us-ascii?Q?f89KX+vBT8ZDWvJG6F078fA3xsYZzJlT27wo0mrvfjQDk/b2vcrdNKaaJFBr?=
 =?us-ascii?Q?MSpOnJYVi131CoUKT7pFFSMelCL1EWIr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wni7pBAsbYS+6ljpk77pV8FzMKcPwFqNQfKjEV74xgQey1EXPa1n96pISZde?=
 =?us-ascii?Q?sXKSqOMlZdum/5wgdJrbWROm/OP5LuLR+9lo8/jfZNLS55+yxnFCEh1x86WM?=
 =?us-ascii?Q?q7QytiQpvvn2S1ZDNH3AX5TmC5va8JPvm1UW/9EWQNJSzYolIEEDSlXSV7jW?=
 =?us-ascii?Q?fx9Kvk27GXMIn2TAiA/URsQgTa+SuBfmBltZjraLn7MhCmKgkFk7qXvRloRV?=
 =?us-ascii?Q?KEwYciABvoHlgqukleYPw4Lxowbd03GB4p6gbX9YMf5eDNKqxC2/TK5eYcL2?=
 =?us-ascii?Q?xaVjIlsOy04rAL8SdbAf1CXCOZwpnkIK8s74hDSgBhV48lZbxY75ACsDxe+s?=
 =?us-ascii?Q?A60Vu7iXztfaNqC0DQpNB5F3p+u8kbXdn7YGR5pSJz7VXg06E64slDha6hG0?=
 =?us-ascii?Q?KJoMbUlDDcwCLSki5+GEuUrZzE0ElLc2a/th1aaqD4SIhPpsNDxgW89NNXNq?=
 =?us-ascii?Q?ii9A7VVxMNSfdq8dgGW6Av7lbrjFzrNc4HCbd0+AJPACa8CV+qSWg1M1Fo9l?=
 =?us-ascii?Q?xKgS+yBrFXsn5tbsyVDPTayRJ+07g0I4FVieamW3yv+5acAe1ssrKo3fzsyG?=
 =?us-ascii?Q?s+xf+f+iulWHH9NcRZWMr8+NM9opEsWuoS2KjT8pgIk9K4V3yDR7XZWFTAe6?=
 =?us-ascii?Q?o1oV9Iu7uc27SFl8mD0xPaNhmXv4GknR97F2XpfZpZx1ILQvAQNcmUGbDJ6f?=
 =?us-ascii?Q?IWJaSTe5vqknSIfAFX8PEsct2RI0tqqLuRDipFtCk3xa+TdXDkTceB2ra5Vj?=
 =?us-ascii?Q?BrmEt14o0bp6QSShDsQ8ro85ye/PoRu87B395pFJUUAFtUKVcOXNg9m0cZSf?=
 =?us-ascii?Q?lvpVIfEKhzN0REQjsJ92qM++QYvZ7k4WAwBcDLSqnLPpK6LGMtvBtLmK9Yu9?=
 =?us-ascii?Q?g2rwgBwkBJTZTzkQUnM96kJHWiZ/uYbLgKeYFFk52NmbY0rSuFuCLgtTTHib?=
 =?us-ascii?Q?HRfMWA9+zpGzbzFBFkIzfb+JuqQ0hrUZv+azNToMDAGNqPUm93EXHCRvtvqz?=
 =?us-ascii?Q?KeZjs6GFh0QTpmozV60yICQcbsiTkvfPvC4FoXvOOA9vhOKe2dKS4U02EasW?=
 =?us-ascii?Q?T1OZ3aazwbOOfW05Uf8jN1xYZLWarjcoCxICcZ14eSsVBJ7cumpTUgMPFORt?=
 =?us-ascii?Q?XxxsHvvQh9sn9NNKXN1DuUauYDEnYN10UrugaOTeQ/cUzB0meo1NDFfj62bb?=
 =?us-ascii?Q?Zh3HKVc5y+tBDV2KFHdSl4TxwrdRjqqrqC7gR2tZ1hqtiC2I7L4pVvT+QNEh?=
 =?us-ascii?Q?qSnGa7ut773p7QdBMmnHuVcY/UuOQtqx1GHGQBB/VDB5C/xs1jT8ONF9QFUQ?=
 =?us-ascii?Q?XAcpCA/KMqv474Knldlrk7oVS1DqPrHHxfIOHutLWlpiDFeOp9ttjciTLhF7?=
 =?us-ascii?Q?aJVh2TeZVRh/AD7uabGWF29eE9TxnBoJ6B4dYz2t+5POzNB8mFYZALA0AblS?=
 =?us-ascii?Q?MtlPlBvyN9todFo4eX8iKx/+AusqPEnXxLtw8uNgWJij4Ip3YvusD/ZqKFy1?=
 =?us-ascii?Q?xlgttWL2awzRp0noesbfXZFdZ9jTD2PcGMJithE908dnUqC5Ds5dLbIKwYA5?=
 =?us-ascii?Q?HmYeacgAjcB79tViUDBukk9baY6QongVxCGewMI8pap2kX5YjfmSdDdAyilP?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56785835-771e-4cdc-d711-08de323ce2e5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:23:42.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eal7p5fOMgqLH/fc77qogvGuONGVNIRw+XiBafmRVDMmp1FGdouU8ugOOV5Ox6Nj8Hvi6nQ/KBpknGvfyNoIPFgYniXwxJYiiMVqIebRzgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_232346_777820_817D3498 
X-CRM114-Status: GOOD (  14.59  )
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

The DesignWare I3C controller supports automatically retrying transactions
when a device NACKs. This is useful for slave devices that may be
temporarily busy and not ready to respond immediately.

Add new ops to configure all active DAT entry with dev_nack_retry during
runtime. Returns error when value exceeds hw specified limit.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..252559ee2afa 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -5,6 +5,7 @@
  * Author: Vitor Soares <vitor.soares@synopsys.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
@@ -204,8 +205,12 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x) \
+	FIELD_PREP(DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK, (x))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
@@ -1484,6 +1489,39 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	u32 reg;
+	int i;
+
+	if (m->dev_nack_retry > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
+		dev_err(&master->base.dev,
+			"Value %x exceeds maximum %d\n",
+			m->dev_nack_retry, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
+		return -ERANGE;
+	}
+
+	/*
+	 * Update DAT entries for all currently attached devices.
+	 * We directly iterate through the master's device array.
+	 */
+	for (i = 0; i < master->maxdevs; i++) {
+		/* Skip free/empty slots */
+		if (master->free_pos & BIT(i))
+			continue;
+
+		reg = readl(master->regs +
+				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+		reg &= ~DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK;
+		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(m->dev_nack_retry);
+		writel(reg, master->regs +
+			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+	}
+
+	return 0;
+}
+
 static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.bus_init = dw_i3c_master_bus_init,
 	.bus_cleanup = dw_i3c_master_bus_cleanup,
@@ -1504,6 +1542,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
 	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
 	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
+	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
 };
 
 /* default platform ops implementations */
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
