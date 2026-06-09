Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A38CD8CBD
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuGE8IBeBo27xif2qEqXWi64qtErvRVuR56caljoNGM=; b=nW/N9v55rSsmk7
	fX0N2EnSwZK8dYKcn2+rPePfhxRsYFd0FZnXKCenFsIsooXQTybupSiNMgugXLnu0WYFEquPUnjrM
	z5uMSZrA+V1bt0NqXza7HunksF2ftMQsr4OYqOGwql4XQpiueuqQMO9hX8CdtMC+gQ7H/rJoMYdIE
	6Rq+cMJxiIC4UVlY/ck7k8on+uV9Pl6RyFK4kpK1kHQ9oGFcHtUfvNTk1ggDszig63x7wKWOgXl5K
	TIHsJ9mkHedsDLkCZmAk2CSpt1ZcHQAfVSugD6XI7hhqT8CbI7t8Jyks5PiCDxBTa/ObHcQP8Wk5x
	gulmgotqMKq3uDK9asmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXJ-00000005KZN-1Y90;
	Tue, 09 Jun 2026 10:18:21 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXF-00000005KWP-3Hqi
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 10:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAgMmrpNnkOHMZrKgQImnaKjgqZMiWNr9vMEnV+YghMMfkxiwDFhHM9I4/mtliumXTaoYt3qVlsp5tqg7Y8rTGUsUoQ0zJF0SutYzKvAsK3pSgW/xn6zAEnTMUPECXMjG0IbaLznjSrHXgMpt+9d6zc7OA30jIkH0FjJAr1JpSjlUgkxJescrSqneIPKntHetAm2DaLV3a65tpOzqhR5bt9rIsZg2yobK1uY3qEDbnWxSFuses5k4ZaR1kNrFEUDQISgJENqKq+aHDSS7oYBPytjCuBSvkcJYg1HaKscoIBypzSj/cToTJnE5ME8CKfwuMvCelAsKOYSRqHqUuMxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMyzClFfwSypfrzbuN5t4SH6Wsl0YMrZA2NVqdeLDOE=;
 b=vYgN5wTUDfm2Ot5495bOGcmgZNsAcN28E36xnM9nibK7Ot/PC4eKFRbz+bRc5XBeoWw6zqny6Cniu8zhSgCJGkqUEzGk41dbyq361JD3h4Q+n6xZ0edqdo45tGTwP2322oqTwm7C9a7RovSg/3LGRfyMdwbuXtmI1hxJ1zayg5cuqBMME9/T224/9gT9AaviPIGrMSpMytuHDC1bnNmv5uIk4Lj0O4SZPQ+udLdC3CkQIkkfAyutnRarnDsMPlPIbJLoUqCH7d6ictLgKu6cCsmJYjk2f7iNDAdyfZBf4blkT9UsU4K9hzh7ybVZKxr4noTxkC0sJNDxXdpzKQvd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMyzClFfwSypfrzbuN5t4SH6Wsl0YMrZA2NVqdeLDOE=;
 b=lyB3JJ90BvwDbGIZPWepmdjIKnCoSkmhLIqUXaxg8XQjENUN9b/y+o5YG6A8vkh92c8GNPjLinHjI9HdSnIgz6I+d8nVOxLEoXxpfsoZVRQFk4TwAzxhNKRT2oDRK3AkcE4x4t2w3SaVbt1k1azYE3u90X/1j6xOMeqcveSbZsT+8umiVYTqoc6S73UKXJE7Uov/FZygkUNitEjRQvOkMUTcu+KOw6nAZWNmd5ANjTzMsJQfo0e7DRZXm5/tvENRXHadw+sbwvHYJYVWCJrx4+fxykFrNHUPDs+flnzAmaxJvp6+NmoRLcVmyW9VDKoD58Zuurs6su3RPESgmZp6DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by SA6PR03MB7759.namprd03.prod.outlook.com (2603:10b6:806:43e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:18:10 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%4]) with mapi id 15.21.0092.010; Tue, 9 Jun 2026
 10:18:10 +0000
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
Subject: [PATCH v2 2/3] i3c: master: dw: Map CCC hardware errors to I3C M0/M2
Date: Tue,  9 Jun 2026 03:18:06 -0700
Message-ID: <a4d909479fb8d78e930398fbdc94289d0a173a09.1780999511.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1780999511.git.tze.yee.ng@altera.com>
References: <cover.1780999511.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|SA6PR03MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd56a8f-6ab0-4e68-9f39-08dec610681f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099006|18002099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: mUn8lQvB6m2Hxee5JSnDVkxrMhXpUjww/T4Xq8qPOL216XE57X3i6EMEyzOOLbLZssrPRWioUMPBhuM7Kujk3k1Z378oyKw2kspwzwwSwIO0GvzlWHnpX5cmhM+NhuxnoG/x1ZXTVph8uD2/XT9etWfPqXJM0vPIAeVS/6jAxyRLjpzA+BKLyHrKS3WbK++sm14TAB2tBgNluJWDAQ0mLs0++ojTFVsuK2gjEh0BeFCg+5v9K0PIQuL9Qzkugm3NLHsRl6iFO7H3HVb4yC1sFJml0UShRwlB8NVUoazhbpc/m7ZZmL7adjsBr0SlpPx4d0/ujRCQWSkeDf5DllasY5FAmZcApQiTagaHsw8n5Ye/yDx/pM/62ZOMv5EMqxAawMnJGA3M3F7NRfVTR/5ic6LMyADPFsrFCsGCzHwwEhGBbKdWXweOE+CHBKIe9TftYnwj05RE8BOZSu4Kl0CtOLWk356DbTNVGIe0bX8zPbIMDwz68iyTb+gYZg1jyn7MUyoc8dOp99eDTu2YfBMI/O6WMcnU8LU1+spy98d4q02oe6VvO21MmFMN/m/xJ0rCm5+U7BvUwIDxpQT9k/KgFuhVPbEwipyiCPdn02om77XkYevjDLmBPvz2ShMTW0eYCq0acv8MDwHv//d+x6EbGozTMQGm106PSqQ/RDuOR1kTB0UsDRdCzL66fqouNPlL+oD+KLdrW0uzVGBtn0HpdG1D3uOdRCSliv9zu0TKj3j4FWsdGQ6u+4Fg2oNmPL/K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oYcNYnnWeQTopx7hkzyE00tAtdTUxVd4yKhsB9FtLb/1AeTWtDydeuVhNcao?=
 =?us-ascii?Q?wziMmoviZ2hqdNT5a+cvnN2ZXVsyW1kLNFQ6Ls9f17NqnvmFSqPxdv/SU1iT?=
 =?us-ascii?Q?YEipDwzMrxIAvvTf9P2qmXjmvUCN+eTNJ+kMrQmoHHEtSrKW0f4njUopefN6?=
 =?us-ascii?Q?mxIVbG4I5Fi8upHvyhmmJnUn0DryzRVFRi3ATxv5fyr5d0XVU70XcxoYWCTb?=
 =?us-ascii?Q?uuAe+qvkmizk9UEV5E/pCoTJM/NAos95qPf2UgmxDguG7drQPrHT9LfFqmF+?=
 =?us-ascii?Q?ErHMZdYxn0cIomlQVr7mMgDf/6rFfITDqCIeV+I2g2a6escdDpTYUtbwWNII?=
 =?us-ascii?Q?/wqFgjx8OnWfq3bhGsRoRA727ZAZz3S8noqqo+lytDvKsx2xnhWX9z77fP6o?=
 =?us-ascii?Q?YJz0/ytrAxL97PLGqIe2Gm3xuK6R4uOLWyYXJRjAOprIKv1GZZqLeqxTxCu5?=
 =?us-ascii?Q?WDp0cHiES00kyYfyvJW98lxw/vlJMHP/ACnvm8OQTQzfqk33/1Y2XRLoNGu3?=
 =?us-ascii?Q?RK0NjRzekOmgF7KJe0PlWdj1c5NTDCBWlAiZz+/ylTU4kvYrMGERdOMgQYTi?=
 =?us-ascii?Q?0TpNR40Q/NV1TXJrS/+nOQqC386geajWlGJ67JhB9p3makKm9YtaYqh0FEDY?=
 =?us-ascii?Q?DVcaOe3X7IBsnfJtp1Cng1oay8Q2KknOX4TFPJ9N/rGtIk3PMriHcN/Y7QTo?=
 =?us-ascii?Q?lGesC0zpDi7ZezZfSy/atNT3tQx/ipI32tMw2kSX1tA5EQRtfDN1rk/P14y9?=
 =?us-ascii?Q?2xH7HlJnwWky48tzAEfXt+834vzsOSyEyZCLhxj0afn8bJi28EF8/ZDDaN0C?=
 =?us-ascii?Q?jGjzm4nkb5POLcUqC14Zc/Sqcjmj5gmms5Smtix6i5qnmpY2EO+Pr2/mDvsC?=
 =?us-ascii?Q?9Q4J2Nyav7jahvuQBmNAsG3MXyTEnYG7abTVV/SX1Cb9m3yzZF8vcONanxEn?=
 =?us-ascii?Q?MT9tch9ZuILOPNenCpp917q9xtokcRcZAPTDT+W5PjmLOXkFWTqRLpBL/H7/?=
 =?us-ascii?Q?vX+2VM7jfOi6VuXJsy9QdX9Es9qc0lO0PSnCK0G+ZPzU1CBzw4IEa+AFq6mu?=
 =?us-ascii?Q?2j+bvdiJTSiLvQL0UB68SbaxuNXLMnP10KGsp1Jf2F78pIYiXehpFTbllGcd?=
 =?us-ascii?Q?v7T4Ar6SMykWxQkWlZXTdWUw21OLlF+5cbklLYmfourutEfXq+2w/IlR25pX?=
 =?us-ascii?Q?E7q/QPJK15zc5Rufj5xbosCgeuH5v02pcBa0eQJ0lPU3ivptD30e/ldNj/Gf?=
 =?us-ascii?Q?m/FrqzitfK/uk7qAx9F4bgaKB6do8PVqk2MZ6BXkYGFfIOXIR08ncnLFTn9W?=
 =?us-ascii?Q?MskCqbTXc21DCqi5MVohwbu5pMPJfWHD6vZcon8Kx8NuRNzW/A3kQH2kcqxe?=
 =?us-ascii?Q?I1a0N4StUVAE4lN5U5BY79N8MyhZMSalwO41Gxjl1mKP0aH7JUYc+7+5oi1d?=
 =?us-ascii?Q?9Iq606I2+vrUT8dUDgCjyVMW0QFENPSErnrQBrC+VcCsLPUcruSZlvYDJA8G?=
 =?us-ascii?Q?+Em8jB1ICrtD7/Bg6aL7jFYM9rcMqsuOtjoBbIoKZP7Dfj1gYMV7rRrzBAvx?=
 =?us-ascii?Q?GlZ5DRa8U3MZta3wbWWSuzM4MxfzTwuEGwxWxqETKoeBqTzbnYusTw4benfc?=
 =?us-ascii?Q?SAZ9+XhYNr/buvGYo6PKJ9eq4znKUGpUJCCoXBFmW0zSRszQVEwMgWowzwks?=
 =?us-ascii?Q?iONsd00qbS8CMQIoHByhjJ8lA18kJEtoFPR7ZSvsXjttkOjYV4URQui7Bqne?=
 =?us-ascii?Q?g1mTk6tX6w=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd56a8f-6ab0-4e68-9f39-08dec610681f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:18:10.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJgVEiQOL8fiPMw2m+ccJaZTsjewJbwOCPIf9wQBbpNFu4o7hXRG7dryA+enPL7tMbtrbdWedGRXpJdYMHZniQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031817_848787_D5F59012 
X-CRM114-Status: GOOD (  12.51  )
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

Map DesignWare response-queue status to standard I3C error codes in
ccc->err:

- RESPONSE_ERROR_IBA_NACK and RESPONSE_ERROR_ADDRESS_NACK -> I3C_ERROR_M2
- RESPONSE_ERROR_CRC, RESPONSE_ERROR_PARITY, RESPONSE_ERROR_FRAME and
  RESPONSE_ERROR_TRANSF_ABORT -> I3C_ERROR_M0

Return -EIO for RESPONSE_ERROR_ADDRESS_NACK so bus NACKs are not reported
as -EINVAL alongside I3C_ERROR_M2, consistent with IBA_NACK handling and
other I3C master drivers.

The M0 mappings match the generic I/O failures already reported by
dw_i3c_master_end_xfer_locked() so the core can retry transient bus
integrity errors on CCC transfers.

Reset ccc->err to I3C_ERROR_UNKNOWN before each transfer.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 31 +++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 06fdf8857b9c..45bde92d0342 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -493,6 +493,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			break;
 		case RESPONSE_ERROR_PARITY:
 		case RESPONSE_ERROR_IBA_NACK:
+		case RESPONSE_ERROR_ADDRESS_NACK:
 		case RESPONSE_ERROR_TRANSF_ABORT:
 		case RESPONSE_ERROR_CRC:
 		case RESPONSE_ERROR_FRAME:
@@ -502,7 +503,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			ret = -ENOSPC;
 			break;
 		case RESPONSE_ERROR_I2C_W_NACK_ERR:
-		case RESPONSE_ERROR_ADDRESS_NACK:
 		default:
 			ret = -EINVAL;
 			break;
@@ -708,12 +708,32 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	dw_i3c_master_disable(master);
 }
 
+static void dw_i3c_ccc_map_err(struct i3c_ccc_cmd *ccc, struct dw_i3c_cmd *cmd)
+{
+	switch (cmd->error) {
+	case RESPONSE_ERROR_IBA_NACK:
+	case RESPONSE_ERROR_ADDRESS_NACK:
+		ccc->err = I3C_ERROR_M2;
+		break;
+	case RESPONSE_ERROR_CRC:
+	case RESPONSE_ERROR_PARITY:
+	case RESPONSE_ERROR_FRAME:
+	case RESPONSE_ERROR_TRANSF_ABORT:
+		ccc->err = I3C_ERROR_M0;
+		break;
+	default:
+		break;
+	}
+}
+
 static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 			  struct i3c_ccc_cmd *ccc)
 {
 	struct dw_i3c_cmd *cmd;
 	int ret, pos = 0;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	if (ccc->id & I3C_CCC_DIRECT) {
 		pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 		if (pos < 0)
@@ -742,8 +762,8 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
+	cmd = &xfer->cmds[0];
+	dw_i3c_ccc_map_err(ccc, cmd);
 
 	return ret;
 }
@@ -754,6 +774,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	u16 req_len;
 	int ret, pos;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 	if (pos < 0)
 		return pos;
@@ -784,10 +806,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 
 	ret = xfer->ret;
 	cmd = &xfer->cmds[0];
+	dw_i3c_ccc_map_err(ccc, cmd);
 	if (!ret)
 		ccc->dests[0].payload.len = cmd->rx_len;
-	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
 
 	return ret;
 }
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
