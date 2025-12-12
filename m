Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1729D4414D
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYXiGB90L73KnEZ8I1/wteswf7GEg4rd9iXzCGm/Thk=; b=xStWFf0W2+REHf
	aRyY4VkdutXBg+KMigSN/ZlfX2UpZ0CE69MlKWehlkAgI+lGW9Xp/diapDrReq2/R6P0bqtfy+KVW
	wT+5TPK3L4JMh1jJFGCiqDO3JfHXOP4T/zspZM98qUnGUW3pbdGi89Uqp+0D0y/GG7xdYWThpJv9l
	+fOcxBF8lY1UcBNqXsdEyifyZCJAryoMCn8DUd3xCVr/gfzEdFcQw+xRLIGccWNLeWjJNBheXeJZt
	tbETYvWs2ngnRrCOYlJ7R/0kgK2G/exbRym/igZuuk/t3d1GwWOYMU0cHXlI05PGkxbQ01A7H2Da8
	jZxPD8H0skEieguXmPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5s-00000000Izo-1vaP;
	Fri, 12 Dec 2025 09:05:44 +0000
Received: from mail-westus3azon11010058.outbound.protection.outlook.com ([52.101.201.58] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5q-00000000Iw2-38WF
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 09:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcmDsgO33rHfNK5ghhGdQN+qlYmfoVPbBYXFNuWvVKoqjOET2MybaaRDXyuIjg/SJo9JaV63tAT5pXR3js8JDALxfjdS+fw5QKD1ujl+hVzINdsmDt7s0D+Jb9CPIjJSbpKpwwITFtO27dipgxs4GtiVBgER2oRnevYZ0NSkxGv3zi5XYlIZX0NRYBFSnQhDEDvGH07alTF3DvRO9MNU4HtpkB9DGHfp0d/Cbx8AN0pl1wTxg3LbomOYWRUcEHlzRZ4Bi1UHkqdek8T7Gf79O/N1jkLHshtwKjBFCf3owsktm8s1TIhOEAgHK+ojwTqmFeDfqB1SrrwoQhdPJHr16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wuWCiudNRThSPFhuV6YNVPxraS0QNnlHuVqRgM9UCQ=;
 b=CF9vF0tMexX9q4+wgE0kXYe4zR41YAEcJsmzWIoZGmkNmu2J+mhaF+KsFSHf8bQEPUALkZj07RAPE+4UdHRdh2hNeZw8K+Ao+n4Q3SEK9YBZuQqBhvsXy8g3gGhew8f5ojT04l185sedik/iQsZyVOTBna38FnEKy5gdjRYg9KetyDE5NK89Itha3Bm7NfOX2chIfllJdepoHmjIWPFavz10Sxodud4WPy1McpYydc7ZsycPtqgvttHjQVwsOEe8MilH3+Cdnwbsqji3RSyRglxvAMy9pSPl5RGyJHUhq/AbDS+SBEkhHiS0A7R4HfdsHhk+V2NLdCJdNqo39GABSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wuWCiudNRThSPFhuV6YNVPxraS0QNnlHuVqRgM9UCQ=;
 b=qZUjkqhpQV/Gy3Q9BKb80by+JVOGOChu4zcafo7qOyph4LTZH3lQpyfFN2O0uLmMEgYU8170aQkdJ62r/lsNEjrwxV2in7RnXC3vUp/htB4L0mdk5g+h20JTw9CwIS2r+TrjuBGIJONyPrmHXdRax+zC/3aBg89TmvtjCSaZSk8Vf3OwBbi1Y5ALSyW9j3wf4KwikYwrzWeR3akm1Z+3KwC9LNKSqldcicW16sRL7RMKF85X9q0ftcQ1mMteqbjsDcWAISEI3sGw4bGxgB9h2kSpMAwXsWn0ZIb4KhEzgH1+0AsrDeP0bZ7jlGRFsPHqXuE/IMGBcOw8/Hs5tx2kNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB4916.namprd03.prod.outlook.com (2603:10b6:408:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 09:05:36 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 09:05:35 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v8 2/4] i3c: dw: Add support for Device NACK Retry configuration
Date: Fri, 12 Dec 2025 17:02:56 +0800
Message-ID: <f09ee67e61d31f0a12a0bf48f01e9057ca9e2fb7.1765529948.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765529948.git.adrianhoyin.ng@altera.com>
References: <cover.1765529948.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU0P306CA0061.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 589297d1-3c1b-437c-ddf4-08de395d9ccb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8N5u/EDiv7jnWUGlmh2x7taAao8gF8U3uxledfuJfYcVOcD7xg1scGhbY4yG?=
 =?us-ascii?Q?czprJIajaX4WRx+cIcYoZfBVfan0anrNvpX7+M4HxFHea9BR/g0eWT4BnyWG?=
 =?us-ascii?Q?IfYRtS69ZOnXH4+k4LhLWPdS0kq/5cw6ygOvaBEaDvmLW3oba//vpS7M89uh?=
 =?us-ascii?Q?V/iYzwL+Y1l9TQIIpSzsac8v/9leHfjpHxazq5dbKuqXiKWBQylwF76e/k4j?=
 =?us-ascii?Q?MBz0j2OEvxzTdPHwpkvBhy+YPW0tY8vipznUIN+hzTHw7zOJxxn7Boaw7HGl?=
 =?us-ascii?Q?Rtr0S4a+UaqU1/BWsHrTlUVl1vgBVheWGeKdAMTzzKyS2XslH05M4mRZDY/H?=
 =?us-ascii?Q?yJP4jqz7wnNwdSzpgf0tOLV8JuHNHYHD/XtLHA4WBIW/FBBJB/aVAF13ucnp?=
 =?us-ascii?Q?5/SFNqarSVGW1J5mTwsWYI2BGsDGa3mMc/eHQeAgJGGaEU0vSvtG0v0hHLqY?=
 =?us-ascii?Q?lYdJ5RZAyCtCXhKf5oCsEgQW0XHnKaZQDJUkxJKwix2LOJBkw65+6hJpRbsC?=
 =?us-ascii?Q?X3KnKhXKXFwQe3itADxSkpujvcmX2vvUuJ41hA963NmU0RohXHTc6shIRkbv?=
 =?us-ascii?Q?tZe/L3tK/m6NRvE013GbLHI6oqvlcAb6UhIcNVSDYzH3PLWnQPfgsEglF5Du?=
 =?us-ascii?Q?9Yo5ffVMpkIkDqRDj2o3n0Jtk0elMUAYhMSCqaBhQaTPheM46FZau6GywKfW?=
 =?us-ascii?Q?pfhHDbv0N2+P0uKgLX7hTIV/rilBkHHq+y4v4L1dEYuz56kKGMHpiYQv6tJa?=
 =?us-ascii?Q?OaeRQsKXbuwZmX6QG35AP6thhINpXNqVidAWs/xcao1pqIH+lgqRcum6E4Ic?=
 =?us-ascii?Q?aex4Taj3k2eOCJ/E2GRuV/dlEDyK6mWBvIw6NNww+Gantm4m5hgYUiacVxOn?=
 =?us-ascii?Q?dXDnJCQQ57NOw6m5+XZlv/0odfMGqKIPrDc7U95J79flP+EOTytQsBGi4X1V?=
 =?us-ascii?Q?gvWzLpjG++DHIIWFluNPSmKyvvCngNKsZswdfMpaPw1GHBR5LncBJUcYHpKB?=
 =?us-ascii?Q?h8NHP8whDXQxcumpleVG78+LvvpWlF6Teng12nj2t96d0L4hxFFq099K2WAP?=
 =?us-ascii?Q?MPZka2r3xeEQPdXy3jSI81xU3J7dW8Sra9nHXcAbfKNCK/OL2pxH+FlCW0xs?=
 =?us-ascii?Q?20KWXAupbxwSaatOvUjw4pz/woJUROD6y0tVSLo/qXnQe9p/vMyoNOMIcsgg?=
 =?us-ascii?Q?IPwUeLMkp81QZLOauWYtfP8+WqhiszIXJ6fkj4BSLrQPRkce1gwdbchjPf8V?=
 =?us-ascii?Q?gE44P8Zu7k0+1YRTd+1uQVNY+CfSeLSSwdzVPXWFbcCV/3P9VZn1cO3g9nS5?=
 =?us-ascii?Q?5l69hyDrThPPFb1FsdSNZfUFw+JLYaBT55DzeI87+sx5NnMOUsLdwNCPsdgH?=
 =?us-ascii?Q?7mospwJuN20yiXTJaAXc0ULOa6nk6PNOFTNH+F97xpOvRP4bIcxpkvLVHVey?=
 =?us-ascii?Q?HHxR8pyGr0zCj6oK6JAHjW9c3y/S5TI7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SsOhl8RfM31sxr8P/HeU3fJaWIbAFqH8c1oQrn6PDXnSnR5oyr0+k2+aDdx9?=
 =?us-ascii?Q?ae+ys8moXmYDqDC06xf3bYziWH9Yxy1u7CupF3t3tBBtE2Yww+YpgP0X2xrK?=
 =?us-ascii?Q?Y3sVxT7U/NfCndlJJibZsLSAHt6lKEjMttxOEtsfBFP8nsxeE67iyqbJfiHO?=
 =?us-ascii?Q?8frhRk07G4adC7ewGHZVPQ4OKBrNuYaw0+DUfNUG58x5EMay72Ph7q4Zerr9?=
 =?us-ascii?Q?k35N3Pr9mPh/1G1hqOZEfRMohtNWeKWXsvdU/EXpazcDO22pp/SAwi2NtZJR?=
 =?us-ascii?Q?BlMAUXlEN4MI1JFhPX5Zit3rL1dnjBAmwkqbv/sdenwdKvFYVJk07RLs8MS8?=
 =?us-ascii?Q?OjB7F/UGi7ytIL94578xei+pGBhWCtk6uYBP3GrDGZlWGKC4JFLcYuYwLdt1?=
 =?us-ascii?Q?vakHtrp5elVrMLbbybYPo13oQQ551K/qc5cs1CHyXRvQEFnxkDR/8wOD90fw?=
 =?us-ascii?Q?ZYn24p8JFz3ddEbfb+0NAx+qDwFJ1DtuAPPuWoK390u87okKodmbsRfGcYjA?=
 =?us-ascii?Q?fFLJD9YMS0fLI5SpXP97hPROLZwTMVI4v1kmqhyw1pqzdQsWUtnZSWfbLDDH?=
 =?us-ascii?Q?w4QLxGU3ywky+hL0Bd0KhadwJ46KcOzxiMZxijK4Elf/hFgQopWlTnBS2yy8?=
 =?us-ascii?Q?uMYpmKfT3pE9KR2kedqj4zS6RwlgQSe2wLflbvTpEZNbW3FIzzTx6kt0ScZo?=
 =?us-ascii?Q?M6ruuY9Ds5pxw8c4PxKMXgN08TGmUxPeAg7817ngK2bnF7hCSxnMfmoab+Bi?=
 =?us-ascii?Q?YrNBB34KKd1cj45aHcQqPBnkZcSqjOWHxsW/cGDKryRMYgG1tRVkVzbb486C?=
 =?us-ascii?Q?WOnufuX4GAmQ/1HmWAkutoHAL6IP2rwOSbrLUJ4Z4QboSvLThFgzkNbsmfnK?=
 =?us-ascii?Q?pWvZV+4GqQff1/cp3NdcxQTu9lzYP6ygA6yayl8k3ZaVyqMVK3JtVcCGGwnO?=
 =?us-ascii?Q?HoCQEa8Pyx7CzFjtYg4Mg7gX3fM9u+S6Ezo4yu1c6V4xzE4M+qc+abbvYL34?=
 =?us-ascii?Q?hmmx4VFBjJmoq0ZZZC7l64Wx+ygVZOF2P23pJoH1W+GBNLoA2vX6F/bx6Bh0?=
 =?us-ascii?Q?bD6AE6N2LyR/uDmXfjWSbRy56sFLegmS6wPnH9G1D7OHW1R1YHERra1ozWZ4?=
 =?us-ascii?Q?4PUNsn7Ul1w2QWcJKH8Iy/TfvgmGkM7lJLDlERndbtbY5LolRGoX44vI/3nX?=
 =?us-ascii?Q?6A1RqmQmR4abJaeW9Arx3n+rmpE35qmypSh6o9sgHjeli7ZwxQmnC2ywZ5/W?=
 =?us-ascii?Q?H5s/AM0+DqQBVodqO93O1Iqlc+EMIeqvyUW5Q0mMyiRNMwDnJBmdLOhyeKW4?=
 =?us-ascii?Q?km/4XRVKsh/z1yvg2PFp5QnxHw0xvW5+BSHlYBK+E/xyUrU1psU1Neq9ZNqz?=
 =?us-ascii?Q?MczDVNncPuVUFwnwx2POszFpEYUJQ3nY2C4wUsoLjYe9qKuNMKHsgOzHhD3k?=
 =?us-ascii?Q?S1/kA9jRx83lVPn6Hi7DB9FpKPNryH0BB4qyqef1pWShtK/zZXaTbZgUjh5s?=
 =?us-ascii?Q?+Ap9CgS1Qwi1Cojz03ACR95dIrKzYxVDKyppjJqrBXTDkHJS234BnCxhkHwS?=
 =?us-ascii?Q?QVgw5RJJSPEFDGIkWmH8wmBNNKkN88t3rusS6XcAIHqrV/yy5r/IW/8Zsgbf?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589297d1-3c1b-437c-ddf4-08de395d9ccb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:05:35.9692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XT8t2U8uigdaD1rcMK8osAVhGmH8uYxtL3syvOFEXeRdvl2HGkBP3gPCFZjn5d8cfxyE74xpNm+vM7RTnGNrk1Uvq49bXOUuUX5CU1aBA1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010542_796723_F80D3C64 
X-CRM114-Status: GOOD (  14.23  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..ce33600d4c5e 100644
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
@@ -1484,6 +1489,40 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
+					    unsigned long dev_nack_retry_cnt)
+{
+	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	u32 reg;
+	int i;
+
+	if (dev_nack_retry_cnt > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
+		dev_err(&master->base.dev,
+			"Value %ld exceeds maximum %d\n",
+			dev_nack_retry_cnt, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
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
+		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(dev_nack_retry_cnt);
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
@@ -1504,6 +1543,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
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
