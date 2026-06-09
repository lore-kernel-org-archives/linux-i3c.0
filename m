Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9ABCD8CBE
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoXWRK+fZx0L9wTRSLwoJ8Gt2ioq/LmmEp8PzO6eFek=; b=gasN8bJ8285bVs
	UD9q2z21lbuEoBanASko4qUJNVtnp8lVPlcibr2XSAWQnkcRc8LVE4B/6hx3LsF/tE1aPwqoEIaPf
	bw3XFHvr7zYVhCOAjCbE+qAnMrFUWSKXhtv1B5qtibCQoHWRkV6HSnfWaG632r8sz2e7+6mfvt0e9
	HGO8xTmeKvJJ4kwjtCcFTAGs7l8fM4bymNxXP2vHQn8jxAP2AY9YBMfma81aVtdUvUQfQ6ZA8FTo5
	4V3hWqEezPOFrg0mGx44za5cOg3rxhfK4+D7kKQzLlWtblVnfoqgmwRGsZ56lh32xzUtq9DNflDjQ
	ugTfD5zqwoPOQdBtmeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXJ-00000005KZU-1xBJ;
	Tue, 09 Jun 2026 10:18:21 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXH-00000005KWP-0YZT
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 10:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiL9TuW7VPXutAkXFE7zSBjwz1JUNm/bCV45JZdDmYlxn375aZla6WWSiejqeoJEF9zBaB3JgPNRs6j/R/sqqbTC8Zqa57uIT7wAU12t5LurkjkvlFcMcY16beT+0tydbSv3BfDGOn+fpnz4ys1cKTRPUi3PTQGx3fZQSECvF2DzvdqDNxuU7hBb7ZF0toohtbaPWsiiP0p9OwzO/wsm3Rij8hwZ4aSkMpuv25EFQj3naPbi9NTWpA+Go1+vbbq1p1YLbfJc5FvYzbVESMIqsViWsd7q/MUryQgwOsuHH6cIYVHup+TOtLWo7wbEt96S5SVfyuhkEXiJzDVCUiR8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqnRLkFvtHoMegZS7Efv8yk8m8wzOuO7oxPnrrZrl5Y=;
 b=cYIVEdgBXldAA2GuPwxzq2Xkmr3ZRSaC14YFi3QDu2qJx7Gjrt6ARNN+6BcJY68JsxcMvjsC9UTqtlXHXeixWli0xt99mWpJRkggo4/ACjxiqNy55p5b7bKthPIVLtgiu1lY5CeoM1rd5YI50TxMY2aebNMogg8TXDcti1/J2JvTjsh8WD0PL+o8V8LplAr3FdD1JzHDxnpz8PiL71s0+7t6D67G6FgY68RxfEzGW37zJO5sfRrU3iwH/anXknKjhoJmXnIq5rZtXhrah4x5LBlhWAcKmJXtyJ6qRGDrFDVQenY9FRmLvSrgDN23D9O8KKSN0hwG0KKBpQc2QrvuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqnRLkFvtHoMegZS7Efv8yk8m8wzOuO7oxPnrrZrl5Y=;
 b=ikQ2hSvpAptV69kx1lcUqsi4V/4XzIt/HpOiCmv+UFGDBDEC5N+LhynNZSSybuqUqQ3Mz73uvj8u9QN97OGGGCPcvohhY+Q2sytJF4TTFm2xoPv+TueRB+v3/DzAmdlM8x325ANbwOpJpgUrAPiCU6J7gQd/K1LGMGe91ylx2Eik86d51N+BCOu74KE054gMGsK3FQMxdLWaOBjPDpKu7C0vNecusFcPHJGTzkjUePqn8NiDN0G/7fnfqzIOC2Egi9TwWUnYruUrmQydI4vQ0IcKIvx6ktLI6fWumPpCmolT2LAbs9jrfjNzYHChEIu/6rpTQ7pGtvs2F5IsEtE7VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by SA6PR03MB7759.namprd03.prod.outlook.com (2603:10b6:806:43e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:18:11 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%4]) with mapi id 15.21.0092.010; Tue, 9 Jun 2026
 10:18:11 +0000
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
Subject: [PATCH v2 3/3] i3c: master: Validate GET CCC payload length and retry M0/M2 once
Date: Tue,  9 Jun 2026 03:18:07 -0700
Message-ID: <352ed29363b12d1d145ffd44316564bd8e33444c.1780999511.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1780999511.git.tze.yee.ng@altera.com>
References: <cover.1780999511.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|SA6PR03MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 111ef661-223c-4e32-4400-08dec6106881
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099006|18002099003|22082099003|3023799007|55112099003|921020;
X-Microsoft-Antispam-Message-Info: hkC8iAdz9HwmMOWuJvigmOuI/cWGA3oiXPYQ7HcFtySfkqnoNby6HAqBnt+Dv1FKn+6DgGuWbC/F+s2DsP1u3+CZAeK11pcJ0k1jjzIEw84PLUrW7KASlHT4mc9N53ffJuZ4j1drqD6cBAuixDSmgKp4AVE1xkWQP6sC6c0N6AbzReuu5j+02mDhrY95uv7aTmied9p04+23SHZRknf70DD554/h/Qf0lhcAEfFC8a559ULJmptrSU9YR/YwPKHPAozRHEkWrYhwy04XKvSaPXnyyHm6wQtLcKsHscBlXxWV7VdYykd4JARZItt1S7rmybMb7fr58l0KWMocUQLNKRXJx/MRCRWn8afBpbpzob6XbcS/87GPUG7kDmnBHgYfeczGOdcqh7HO3S9kvZm0CvVXO+BjFiOZ2OuNi+w06TIPVj5T/nO5H/6h5oYvBklZTU/vcGvxryYEhXxCif0MVOmMTow5biHWmMZYaIeDeGdb8G235g9k1JBNjT7CSTfU/uatuorBHN4VXxp0DLxDvohLRu1A9EovkUydAC5bdPbudCZo8TDGbV7uNRMx2cPnOXiO9rBoVoITdt3ZhI/n6tlDBnIZmb8c1l3Ii0hwAd7DnlFZ5tLv+bR7WdrFwQToVmDTto9ZyJpr2AJ7iAjR5mF4cvAnLJx+1dIO8YrARFO099iTQqENxlMmgmUC3rhJrqRHVLeGBcyC3O//5wHfkowtWOpqqVPM5Mg6il1WUII=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TszfY3lYKTH9bpdQcplWqszZ8muQKKoTE/yJJ47r7s+T+LMDUSIpNyXCoDsf?=
 =?us-ascii?Q?hvqahaoP+nukZhYsyQupiCpwO+3EkiHwli94eUUvZlj7AVFMBJoS1qs+OT0Z?=
 =?us-ascii?Q?1Vc27OndJtsGDg2Ur9fJwPJU2e3X2uUpdjOKZQNlGmeOBN75+V/9+zoE/oGK?=
 =?us-ascii?Q?e7dSGxMO4uSi7SS1sitJRUC4m5wQElJ2Ts4EbStrrU+CD7qp/BFCcWB60ezG?=
 =?us-ascii?Q?2s+LzvImCigzp5W/BUITJ3GLNxvlRSJrzkWPe+0+BhQdVyjtHeTFJRNQK2yy?=
 =?us-ascii?Q?0bqmxZXPDdyHIzGE0x3N4BHyD3UJCy5WAMbt2pMVVUXPQvBsvRerbAVSz/1+?=
 =?us-ascii?Q?veOhbKbq4llmlz4h4Hy8HWo+rOx5syA5fSAZqYjiuYowsA6DeDf/8uI1tbFV?=
 =?us-ascii?Q?22hAnnj5DN48ui6F+Tb8vsWvXpfmZdt0D++KYI9LuS+P51AQPfEeJR1R72Ij?=
 =?us-ascii?Q?iQXPqowyo1zT3WeGXul2tREXyWU8UNuWTdtq9qM5K0dLbDYpOfusFgAATLVA?=
 =?us-ascii?Q?xjyN9nymSKrISFR7lRKIq8pA0thGXOhsoEPYLfAQ2NX08ZrpyUAtH1t05eVx?=
 =?us-ascii?Q?4ZRj5TmI3lbc0OVtjkGrz6ShhDLeiiG+AvBB+8RywTFoJCWMJxXeueyar3Lu?=
 =?us-ascii?Q?TYHFhCojOvhqTgtakKoueK0NOOj/xwnPj+zfoKzxGAVXJPhRS045y765EjEc?=
 =?us-ascii?Q?vrLLYq3H4ElZ+PcxCgAGFu1EdZk5lQXzptl5EGrveIPpEDka4jiDx7/IIk+E?=
 =?us-ascii?Q?RQLyUHEFkZAixlNptyLX/Z5TrmXX27tf1SpftFM0ib1EB1bBkAN09Nw0MeAR?=
 =?us-ascii?Q?AIZSyWgZbW9w+6m5EbpB1VkVlkBcXtdUkiLUWwty4sNwEG6XWCG1s9ZegB9l?=
 =?us-ascii?Q?oFbf1I18kAAL3xuQuOLt1Vk+eX8muL3ds7id1LRYnaG4Gde1Cf0FfQbJyOk/?=
 =?us-ascii?Q?Dztj52HMlbuyohCXPoJIwAqxAOI0TiFdB70pxmpN02LrydQSDSYoWfjwIIaL?=
 =?us-ascii?Q?qokvL6RhwbSPJTkwE+UzqvRpWd1yL0zsnNAl+CjszRn+5lfllsxdWCQFCw0Q?=
 =?us-ascii?Q?SQnfgwyCoeXvNcmZpfSe2q1zl1PSViTMgkG3P6bH7n0jrfIteufjaKP7vsbE?=
 =?us-ascii?Q?b6yumNUmVrDiZ/BF35al9PXqlBS0f4bTsuxOkQ46ktIilJzjCaeIWS61ZoD4?=
 =?us-ascii?Q?VhdQbooRLMVZ47cXy5+O2dUUHLQRsL3GBGp4OZK9+2BWMZahE/VQ9yz9Y9JL?=
 =?us-ascii?Q?3q/UTh/iOM2SOZdVs4/PV0h1heUa9tDWp8A6QGtYKWkVV2YM5Lcgzra5a9/Y?=
 =?us-ascii?Q?T5+C3yUV1VLsRRbF21Vs2dgyF4+0xfwU00RgnTW/3uxc6D4zlUicYH0FJhn/?=
 =?us-ascii?Q?H1I4MuQfi4E8QZzn9xKnrNy1/rqYRQHW2LrHu4vfbqHAnv8pQOWzUEpOUAq4?=
 =?us-ascii?Q?2Xvwn6cfleCKp5XVNeDb0XMeie5N+uoz4APEH4ZVp+YivzU+7Hj+6Szuv1FH?=
 =?us-ascii?Q?PvB3fP58qYslAc9KKz2ENz3M+LLqksuLo+2/3JfsSfV2DHtjitmMPl9iYeqS?=
 =?us-ascii?Q?dJwuU7xk2mN29/DwDqpRGwjH+R5tplUHJJu5gsIBtpVFh5Uw77QqSC0uagYC?=
 =?us-ascii?Q?Wmfc4y98yDBxuDk4g2+m5NqPgUwoJnAp1S3S3OXfFb0E36i0dkwWtqx37oVd?=
 =?us-ascii?Q?728wNFA5eOjF+pwVDvJIsuMnNPl/9pC+EJSyxoL7r/IQum4iyxmffiDqDQ5m?=
 =?us-ascii?Q?1KCrZYfofw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111ef661-223c-4e32-4400-08dec6106881
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:18:10.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AfKFnHO/0ztgjlyipVXKfijpil6B0Qw/z/pSmxpryfy2KIPCqRe52UeUSkXd1ICL/BPtEjXuw5R1GcuLhaq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031819_197424_CC796634 
X-CRM114-Status: GOOD (  18.74  )
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
 drivers/i3c/master.c               | 111 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.c |   2 +-
 2 files changed, 111 insertions(+), 2 deletions(-)

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
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 45bde92d0342..fbd1c899e728 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -493,7 +493,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			break;
 		case RESPONSE_ERROR_PARITY:
 		case RESPONSE_ERROR_IBA_NACK:
-		case RESPONSE_ERROR_ADDRESS_NACK:
 		case RESPONSE_ERROR_TRANSF_ABORT:
 		case RESPONSE_ERROR_CRC:
 		case RESPONSE_ERROR_FRAME:
@@ -503,6 +502,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			ret = -ENOSPC;
 			break;
 		case RESPONSE_ERROR_I2C_W_NACK_ERR:
+		case RESPONSE_ERROR_ADDRESS_NACK:
 		default:
 			ret = -EINVAL;
 			break;
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
