Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE80CD98D0
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 01:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qazqr1X4OYmrY3V+BSBJftVytc8zZ7tFYBi9FX8SKVo=; b=ojXlM54KsDiv7C
	swMA5KlEZ6pN57ROri7TBfzj4f1cVJ3Jn+gE0UoA7LNPqaHXdQeRZ2BQ4vAhXyE9y+CEs/tYqUzAf
	TWBm/nXVkjOhbG+AzQPmRokyh/1LPKruRP0Plf+RO410e5yASstuTQQynAufyqTS326Z9ktkW2fkG
	NH7eqoRKR0Q6vGEbKae+M1a6olRoAvF1S2yEciF/qONXjNplIkaOP0UKgOa09McKQnlnXGsm9A4rY
	qkgyddcUneWNYB5sKqGWuPI++s8YMp0bULm6V3gtUEeiORyJkwgb6BNYmCVpyeaPmg/J9vgGpfEhL
	9Olplg8kphCJJgpjlPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUcg-00000008XPs-3IF0;
	Thu, 11 Jun 2026 01:54:22 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUce-00000008XNo-2cmL
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 01:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVMgwPdtukXhAY1zz24PbSVDbvikNm24MwDOBET31uZzbYasv3K39TAn3Nhp/Q2exT3O3Epe+M/oTjvcORSXl+kVlB8C2vOOsTQwr6yJWyLT1RlJfh/YiLnDBGIYuuuvJNi0AnsVKKAQZA392QL+YkK1JcnvGXXf2O50d9oVuHMy7I6TZ2iF1F9JmJ7XsHHvwXFfaOSfvskEKebgDoiscM37U4pt92ZF9sCVg4pqVjU9IVGLPkfKMnYN3DIgqtnT6AGx3GT1jyUIvyfETt/PPYpnI6LttnQ/0w4B4Fc2mN0pz3ErBrIeVAg9gX7yzITiAPu+08MGiHf66tTh0yLcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7d/aNqiy+koJMmbOHu4Yo32xdAiTsdI70kQi5NY4Lg=;
 b=Je+e1/2neYtyY2ZYOXM14p/O3O9vhQLMqxiOaP3ovNh9fBybkS8aaKswQkJpIKcZGqawYQEJ7Da3xtrF88mJiDoZBwtLFRYKNo7xzArTSraAtM//uTJHXuP1+mrrbEuPvAToUWhtfzRnOKrEuSm4zootkN2X+sYJh1Vwa1Vrn42kSvGV3T+i5zBoYv0uaWEgtG+O4vABcUuLNfhBtMLgzTHeAz0uGlNgPCYfWq4rc3R+E7skhPXWjalsEKsCRmdkaqBgeSaNJPFzIXsAYjNhCQE9PCNO3f2IlczDDZljBEf5YFN8EuaNn75g9gdaxcsoFkU3QnOv1BYo07Ab/CKV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7d/aNqiy+koJMmbOHu4Yo32xdAiTsdI70kQi5NY4Lg=;
 b=V4HOXC8a93NDLNwf/cpT6TeWg/QSkZAKuXuuS40oFwXieoEVM4A+4i8ejCGpmIdrkkHJ9OlPdEs7x8rNHXbI0y1hYWQp37WaJasgHMwsSaR60gEL1PAryBWEvxcm9RvdkUGEESSCF674LBXlMtEL5Q55NkabVkbpZgOEXatbUNyDMnQXhBkjPoeFNFj1piDulgNs/1jsxk7eQbMOXRfQIzHs5/mXUsJ05mhzcal2ccFi4ulbEvcid2d1+OtdvL8Wky8eGRKxRNb3qcRq/YbWx9ReCVsLX9LQi3YECEXkNAzCnX/g6FKYABFTw+SQOwP5IJWBC4eI4SD5thxYOhu7hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 by PH9PR03MB470143.namprd03.prod.outlook.com (2603:10b6:510:3ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 01:54:12 +0000
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf]) by SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 01:54:12 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] i3c: master: Validate GET CCC payload length and retry M0/M2 once
Date: Wed, 10 Jun 2026 18:54:08 -0700
Message-ID: <cfe9e0f7ce49e268cd582a939206dc0b6c4e42e1.1781142158.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781142158.git.tze.yee.ng@altera.com>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To SJ0PR03MB5951.namprd03.prod.outlook.com
 (2603:10b6:a03:2de::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5951:EE_|PH9PR03MB470143:EE_
X-MS-Office365-Filtering-Correlation-Id: 188f0259-9494-48e2-9a3d-08dec75c5577
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|921020|55112099003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: a3E+RjJirg83Ytm2da2mRdnnpZGb6tvJkQ1l8XkT0DgRSFAzJhBJnNsixxduYJ2snaNJwKZLQadlOi02KNUsjNV0g3WV6EBd4f910D5M8l781jOykCa/Zck69Lnxkn05jBACCo0DIgYJ3zJ4zS1QB27ddHnuqRON/pR7XPNAj+3ae9aNdSmT52mdWK/7yll/s02i64+NTec6c/fZN/JN9YnRa7gpVQuBZ+K5eXHvolYX8UdPREYGeKoyVuf3j9XE2CZgl4kNCByfKZYJb3OI2LD4V0dak5X2LwzLmWtSjJxifc7pCUzuI6UhUpitgiIgfRxMZy3r2btdKjnn39FkAetmkkwDpsIYmjNJctSibzK1oHRNiVnN4VZta9PJGu/DOkf+2svLiouYtq+4hbK5ccfftk98sziKw91NWF3b9phrM7tuqqTfUN4VNMKh1vvz74cfNS1QZPCDKJbGOZo/ov/7p9kC16UudURnkabQMZ5zkBXwDCvwDgcLpe5vvh0x3SzVY3nr7uL4/qWkELkiCq0BjVew1iSbwLhwzTIPnKcm9Ktm/ntPJ5d//KaHsjJpyMFq3DLM2uJmOjXDx9hKRicX1pNqI6O3wxT9ES88XVnYxLfih5Xh0XYPTpxPXWLkW5JSVCq/JZTEzCe3cYw50ipbZKESAzlrvT5qKv4nBs+Fb1lkStw3DAtdtlFueCYNQdGYBVjIK0xAwNoq0Layezutick5152AKxknkGyuctA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5951.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(921020)(55112099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jsJNHh0gD3q3YvXNG4P2g1XCBkPdc8Y+IQ4vnokkBHLLZbyev+1CZpU6IuD4?=
 =?us-ascii?Q?mw0caUdQzyyHbsJGkH2KCf6HmSn6LthmjJ5lR4spa3AyQkb2tN3OZ5F0UQpc?=
 =?us-ascii?Q?BfTWaTfZn7utrDnrjwtsFEyHzABKdbvTREq95ZR+Em8s5csnMzLWh220od5V?=
 =?us-ascii?Q?5CHlzENgviG3Zokp8n3GsfzGwpHSlQI6P4EcNhJUF/nY1rET/gFF9vbjEUjK?=
 =?us-ascii?Q?fmdOMd8RiS6QhdORE7J+JaY7Z0+SkDyuYZn72vBtYWYBdykMAgO6rdFfW3Cs?=
 =?us-ascii?Q?zEVB1pjil0uro0B7Q8e3jkhlspG793JRHdo5gIEoEQMgUd+tE36PXBIsfvLb?=
 =?us-ascii?Q?0QkKOMWQXFvY4V15Q/spvn4p8m1PgL031Q7VwJ/eFJZCMikop7u2rNvc/Ruj?=
 =?us-ascii?Q?tWWifv4i6lu03ZBSvxvcewiG966Xl27U18XhZIRT0jVqgnfc+WuDdYeufBWf?=
 =?us-ascii?Q?FOmY8d2nLtj6z5nrPvSJ/k0aRX77t3xCeaT9eofHDzCjP//UPqvD0jWq6or3?=
 =?us-ascii?Q?klqw/RakIdKTde0fTej1wg3mvAmVA0yuICmwDG3/9QdyGWO+oES3ynsMHDKY?=
 =?us-ascii?Q?l8VH5VWcJF3Bdv9KmCTtALeK24HhyDaa4CwvY6Dq2MUWDF6iYuZLUgmceHlM?=
 =?us-ascii?Q?/ZPxebsyx4X2P26Pd+uQwQleH7vW00Jm2Tf8jnL1Wpl7enMOSJmIPBSgcI6G?=
 =?us-ascii?Q?TIsutZr/Wu3CiGXi//Bp5aKkfcAvQOP6zWirERlu6rYqMh3FQt/qLS1uicsT?=
 =?us-ascii?Q?HFBmRoiBSs7M0NKqYriMfCy81Vxt4MspzGifO+nrxbizOiBqCGrSIk2IxNAn?=
 =?us-ascii?Q?5KZvmIsHMMyw+oYwx3IO5YYV0z79juCElf7lyykLj2jOPtVCCL63pDWu3EDR?=
 =?us-ascii?Q?ocxoBo1FpYPMCUQ5wwa1Ez4wc6GVhYrfN1+QIO1dRd7bcVNww2Vdljd0BQQ/?=
 =?us-ascii?Q?AOldnWs/PJ+fQ6q3p6YnZdCKgePjANGxkJbYLH7h64wGwj5v0RWouaHelgiL?=
 =?us-ascii?Q?52DOUEmljAq5gXPQaJEnS0Y0PeyEHyyvWO3APjhRBv7iBlqJtRLVs78bM6z8?=
 =?us-ascii?Q?HmC57bJER1GLQsiMhuCsWnxbEoAV+iRzADRd13wa+YaT+7wji7r9uSkKfL4Y?=
 =?us-ascii?Q?w8HzqBDV+rBEOOV38ITojgjjt0pLI9LJRJ3qrIzoC7l6a5oCCB8uLc3g9OnD?=
 =?us-ascii?Q?Sj/Q7Oab/vwnO3ixbidduK7tqbhiNK1VOp+0gXKqVyFypuHQ8OexHmvbhoUD?=
 =?us-ascii?Q?cQF9q/ABxqYH0hMg1hJWQui+6zDniL+zB2u/1KEoGR0EiRFLrO+9FTwkPVFS?=
 =?us-ascii?Q?oIiaTNnYrOMaLZn4OHbqjvorozttk53mRE+pP42zcjQcwjbAsL3r9Tli2s5R?=
 =?us-ascii?Q?MslylmCY34i1FI3bAPZE57NGG802aFlyNUdGW/mSEVqKYaYz+ih95FfI9MlE?=
 =?us-ascii?Q?lkBb5tPb0RSS1Xm1bn727EuDCctQe4OUy14vLLgm3qzeK9my4wgB29CrDORt?=
 =?us-ascii?Q?qpvrt3Luk/DnpuPe6JPZ58V+X+UaOUN5yVayY3k5eaC3JQmYKETeUqRUA3Sb?=
 =?us-ascii?Q?QKPs+ZlRAozu7iGGXIWN17PDGcDrmv7qEnMHOp5tPo33ac9NbvNdrknbhDBC?=
 =?us-ascii?Q?5a+BAyQnfn6qi7uP0b3bFPiYvsClcPH4/AC7G5b/6o80MXIPhdvMbgy7sAya?=
 =?us-ascii?Q?U9nVWVd/RUPz3U9zQb4IC/x4zdPOYNyRy4QjSZXJOetngqNCySm3XFMqGXRP?=
 =?us-ascii?Q?cc17JFwlKw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188f0259-9494-48e2-9a3d-08dec75c5577
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5951.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:54:12.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTzZ30uLYtuCC9RN+wnYu481G4MOXSqt+7AnIVdgKkKcInrBvwisJMQ9GBS1hqmBWbo4RgAzfAvyl89XD/EZYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB470143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_185420_675730_9CED50D1 
X-CRM114-Status: GOOD (  17.79  )
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

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Validate GET CCC payload length after a successful transfer. Treat a
short read as I3C_ERROR_M0 and return -EIO. GETMRL accepts exactly 2 or
3 bytes per the I3C spec defined formats. GETMXDS may return 2 bytes
(format 1) or 5 bytes (format 2) per I3C spec.

Retry GET CCCs once on retriable errors: I3C_ERROR_M0 (frame error) and
I3C_ERROR_M2 (address-header NACK, e.g. IBI or Controller Role Request
arbitration per I3C spec section 5.1.2.2.3). SET CCCs are not retried
to avoid repeating side-effecting commands. Restore dests[].payload.len
to the originally requested length before each attempt and again before
returning an error, so callers that adjust the length on failure (e.g.
i3c_master_getmxds_locked()) do not underflow a shortened value.

Use a stack buffer for the common single-destination GET case and only
kmalloc when ndests > 1.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Drop the change that moves RESPONSE_ERROR_ADDRESS_NACK to default case
  in dw_i3c_master_end_xfer_locked(). Now dw_i3c_master_end_xfer_locked()
  returns -EIO for RESPONSE_ERROR_ADDRESS_NACK.
---
 drivers/i3c/master.c | 111 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5cd4e5da2233..c94d37cd8b3f 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -26,6 +26,12 @@ static DEFINE_MUTEX(i3c_core_lock);
 static int __i3c_first_dynamic_bus_num;
 static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
 
+#define I3C_CCC_GETMRL_LEN_SHORT	2
+#define I3C_CCC_GETMRL_LEN_FULL		3
+#define I3C_CCC_GETMXDS_LEN_SHORT	2
+#define I3C_CCC_GETMXDS_LEN_FULL	5
+#define I3C_CCC_MAX_RETRIES	2
+
 /**
  * i3c_bus_maintenance_lock - Lock the bus for a maintenance operation
  * @bus: I3C bus to take the lock on
@@ -925,6 +931,61 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
 	cmd->err = I3C_ERROR_UNKNOWN;
 }
 
+static bool i3c_ccc_get_payload_ok(u8 id, u16 req_len, u16 actual_len)
+{
+	if (actual_len > req_len)
+		return false;
+
+	if (!req_len)
+		return actual_len == 0;
+
+	if (id == I3C_CCC_GETMRL)
+		return actual_len == I3C_CCC_GETMRL_LEN_SHORT ||
+		       actual_len == I3C_CCC_GETMRL_LEN_FULL;
+
+	if (id == I3C_CCC_GETMXDS)
+		return actual_len == I3C_CCC_GETMXDS_LEN_SHORT ||
+		       actual_len == I3C_CCC_GETMXDS_LEN_FULL;
+
+	return actual_len == req_len;
+}
+
+static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd,
+					const u16 *req_lens)
+{
+	unsigned int i;
+
+	if (!cmd->rnw)
+		return 0;
+
+	for (i = 0; i < cmd->ndests; i++) {
+		u16 actual = cmd->dests[i].payload.len;
+		u16 req = req_lens[i];
+
+		if (!i3c_ccc_get_payload_ok(cmd->id, req, actual)) {
+			cmd->err = I3C_ERROR_M0;
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * M0: transient frame errors.
+ * M2: address-header NACK (I3C spec section 5.1.2.2.3), e.g. when a target
+ *     simultaneously asserts an IBI or Controller Role Request and neither
+ *     side ACKs. Software should re-issue the transfer; the controller wins
+ *     arbitration after Repeated START.
+ *
+ * Retries apply to GET CCCs only; SET CCCs are not retried to avoid
+ * repeating side-effecting commands.
+ */
+static bool i3c_ccc_err_retriable(enum i3c_error_code err)
+{
+	return err == I3C_ERROR_M0 || err == I3C_ERROR_M2;
+}
+
 /**
  * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
  * @master: master used to send frames on the bus
@@ -936,9 +997,17 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
 static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 					  struct i3c_ccc_cmd *cmd)
 {
+	u16 req_len;
+	u16 *req_lens = NULL;
+	u16 *req_lens_alloc = NULL;
+	unsigned int i;
+	int ret, retries;
+
 	if (!cmd || !master)
 		return -EINVAL;
 
+	retries = cmd->rnw ? I3C_CCC_MAX_RETRIES : 1;
+
 	if (WARN_ON(master->init_done &&
 		    !rwsem_is_locked(&master->bus.lock)))
 		return -EINVAL;
@@ -953,7 +1022,47 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 	    !master->ops->supports_ccc_cmd(master, cmd))
 		return -EOPNOTSUPP;
 
-	return master->ops->send_ccc_cmd(master, cmd);
+	if (cmd->rnw && cmd->dests && cmd->ndests) {
+		if (cmd->ndests == 1) {
+			req_len = cmd->dests[0].payload.len;
+			req_lens = &req_len;
+		} else {
+			req_lens_alloc = kmalloc_array(cmd->ndests,
+						       sizeof(*req_lens_alloc),
+						       GFP_KERNEL);
+			if (!req_lens_alloc)
+				return -ENOMEM;
+
+			req_lens = req_lens_alloc;
+			for (i = 0; i < cmd->ndests; i++)
+				req_lens[i] = cmd->dests[i].payload.len;
+		}
+	}
+
+	do {
+		cmd->err = I3C_ERROR_UNKNOWN;
+		if (req_lens) {
+			for (i = 0; i < cmd->ndests; i++)
+				cmd->dests[i].payload.len = req_lens[i];
+		}
+		ret = master->ops->send_ccc_cmd(master, cmd);
+		if (!ret && req_lens)
+			ret = i3c_ccc_validate_payload_len(cmd, req_lens);
+	} while (--retries && ret && i3c_ccc_err_retriable(cmd->err));
+
+	if (ret && req_lens) {
+		/*
+		 * Drivers may update payload.len to the actual RX count;
+		 * restore the requested length so callers can safely adjust
+		 * it on error (e.g. i3c_master_getmxds_locked()).
+		 */
+		for (i = 0; i < cmd->ndests; i++)
+			cmd->dests[i].payload.len = req_lens[i];
+	}
+
+	kfree(req_lens_alloc);
+
+	return ret;
 }
 
 static struct i2c_dev_desc *
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
