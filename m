Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90862C43602
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jul 2026 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0s0PfWL9v9R9mRqUBX7nxjH3vhVJdSWI/Zb5dt7XMIQ=; b=VBKsPDpFoclQL5
	4hZWsU3mDyDPTM7STAjy75AaM5cSazwK0kVxZ5p623x7GIGeWeNfixgiBo/yk/1TixqcaiTxsGW0F
	fDO5VWasIdVgvF+J6ZHbPaYYk1xZ1xIzt8VrCD9DHZDa1unw46D/zOho7orTYrPNlzcxP+kuawfiJ
	pPw7MQMn2S/ZG1x1DXxCSruJahZ+DhLDOOwOIWU7zFHC4tOLPZRyLNAxuj46GzpYTcB3nQIr+lveA
	hTX6vclzuETcOvIMXORHItQS826qqpCT/26uwK3xpIUDUxfxLunOPbkI6GX4sC9WHM6q8O6ypePw+
	hdRx9bfgTK3EB/UqXsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMXo-0000000GTvO-0utG;
	Wed, 08 Jul 2026 07:18:08 +0000
Received: from mail-centralusazon11011009.outbound.protection.outlook.com ([52.101.62.9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMXl-0000000GTqb-0IGV
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jul 2026 07:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7de2kT0lTfYrCLTr2lMuQXWoFwyPv3/+cQnfIXIQyICHEo7PP+jUjz1xf+oWjFy264zdW7qXsyuGC0KzMscDn0bWNSSSfSoVQqxByeoAOdkCp9fSwDEDIS1dLtSMx+SWW6++AngMpc/kAc5jarE/a/qAcnn2te+LXCjsyDzIXCPyj0E9bqnz9zTRzfJys696fJ6M/YnptU3yMz20eO19jb2R5yoswlC59um8CiM/l/PwuA8KBZAcYJlPMlTy8BlknBdnGeS9S0zQivTGeA/qupt1cDa8EJf/+lhnn/XVrmRc9uZZPZxDWPP+48stMFrYOox9DPa56JphtfylD0RuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v29QzvaliuZXfJVwAgQqkSX2B1Xc9FGXZNdhm8wX9L8=;
 b=nNvqkWIiWe8oUrg7cGdSr+didKJX5m0ppQwJ/ZMxdgN70lSr9/LDZSi87bwKJfTZxubvfU1Ps47Vl9WE/kRuSvjtM0T7TWQ1W7WNO/Bamu5BB1PagWGrsvD0EF7QAEujSepFZ8yJPOF6pZS4OiHzvMreTZzS/iuYgDFoGGd+QkRa64tXvCP0SkewKQD8zcRxLew5qRrX20myuvzXjGkAS9tejARUWAFAU/srZmah1a+YyDNUSDOivHucWYZ+F3Rn9QfwXxwkspQlXuIifu+mamOn7wB1Ib9XRkfNsRbRu3Vi8pH2R/ALC6ocJxXPy0WjYIgv699XgjgbCizklCa/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v29QzvaliuZXfJVwAgQqkSX2B1Xc9FGXZNdhm8wX9L8=;
 b=UZyaL1YJRZh6+i+XbecqiYHFGARBAIG1ICPv9fj00u6pRR50RxsDt2Y72m9t9k3pBnouBCATTO2jNTw18suafWqfk692uUux2YqcbpGHQR8fMvZl/xd1PD+h6C4nkefHotJEyV8w/aLrbjnKxJoV/DHNVVHNwfrYLllff2JvuJxYXLAf/26KTCwKDAJoZlJGCz0ENJdFD0wfWpsfcmhNQi8nUymKEOK6ve39i/6zxhLGrj0UhH+DxIaL9qAATnGoH5emkV5MmhPAoo+ULZqKTIQ+epKjXpa7hDZbH+GwEXumWhZSAXVuwh3BCgleLcXxT8DCy+pM8EPQ1NzH84EbUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 07:17:52 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:17:52 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v6 5/5] i3c: master: Add optional_bytes for variable-length GET CCC validation
Date: Wed,  8 Jul 2026 00:17:41 -0700
Message-ID: <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY5PR03MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b56f0c-64c3-4e3d-ee03-08dedcc105d5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|921020|22082099003|18002099003|56012099006|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info: 0RMB5rX6zPIRWC4PNEsUQIImC+Mc7MeyKlqjGSV3ktW0iiPpKGRF9hKxgTEvy9p/upDSfJ8WYUXWXMNrLX1wF+ct7MQ3hWeIjqlyXOr/McRBVV1w0tSjNiW6EQ4fv14IYun1GCOizBVKLgtTErcVpmFlId564IHpfCFt7LXEXw/dWlp2BReVJD8bFQzw0ohcRZcaErCtvADoiRW0/hLEWvlCpYJ90O1jdU18wX5YLtWAng3ahanYaBMJaUWKItYyhmpdtJ+F1gIfFmuFxJNDjY/+3E4daoxIEkWqFcxUypvOMqEBNGn07b8Xp6JupW3cCIEpTCHasth9nIRuVm/TRouwGj+H/kpgZu59/mjbFO2a9uJpWex/4+qefZsWCExxvo7J2XsOwMnRb9QeuuVhbzRcdXeYvP0MSpmHXboBxU5q7gnyw6Xm65TELM4GADZp/pbW/AejW+4ZvXS87XW/w/2jczvkX39uDya/wF+o80/iszkFwsKsEpe9WlunfT+j4Mnr8mPQtLMMXWYFEk1dsdYHwhkYuyjL5ke+Nhn+XNF5SC+igFpfqI9pDiJHHaBqOOYPQZowOczBsfs8mPi5rjSr30wFn4J6tx43Nnn2veOhq3p0TaqNyiuouWJnD1DT1P7e8E+AN2HJUmSKTPbUQpDTLzArrGsZQ1KfrRdUqkachC8i9wel9pkqRsUmk7YyziKXJukAobqSjrqB5wn7rA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(921020)(22082099003)(18002099003)(56012099006)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YuX5H1GBORCyl1X6GeAkHjT1pGFGELpRT7NeM8tYvu3fZbMvLiQmB/kl5Gr5?=
 =?us-ascii?Q?1SNPzFPoq/qH+wObtbL3FXWjDX6InYHqk5VbNCdZSW/2QtWxq/dwyGu96UFK?=
 =?us-ascii?Q?0eFTp/q/IUJ/7wqCnbXlD70PDa0Wc4QwSLsrfDeZyB4fMpMXuQgVICEv9sIi?=
 =?us-ascii?Q?6jf1gVimP92LeEcAZBj/7ijzBRhshOQWJPjFPK7v3CT8grnKPFHaaFQrJ+cX?=
 =?us-ascii?Q?Y3+zCIuEU9RTT/y2ofyi34VFBOMirbeZ1aQ549os0ZpCIPx2kbP2QIGHmuL3?=
 =?us-ascii?Q?lmG+IyM3xpHtChvTxFcoZRKhQ7lSXfCScaj74xkUs5dAFvhftvSiMtmvrdEJ?=
 =?us-ascii?Q?opPxKyz15syhGsQELG5wj3afxN+VNmmtL3RUI5ksXNa7D2FvqlYXgTafbO5q?=
 =?us-ascii?Q?Bn9IHzOteGyrddFJJDvvedcsQxHKuFEbKvVrfZcx62XfTiWE5MGSKwCh6I3t?=
 =?us-ascii?Q?TpSN6soqT4/7mJyQOFXnr4Xhy0uaULY+mn8SFuIdVvxGRBdMXzTEOgjdU3Hr?=
 =?us-ascii?Q?VCV/xgumc0CN0r3CPFxUDnKsDlZUdHbrQ+wycukHfg4ax8CPsqLazAanNzTO?=
 =?us-ascii?Q?MkigabFrqfBeujnuZMdI3udrs4mLhuLHbUx8j3uBJydtjE3WOdslr3aWacc9?=
 =?us-ascii?Q?AESX/W5LlzDvoFVqNJftXTxg6MktjSnpFAgH5V7JiIi9uUrDBbExbpEg3sWE?=
 =?us-ascii?Q?aAcTufTS0yFQQ09WETai93/0/w6eVXZDhARzds2DE7EVntK1molgI62hOT/A?=
 =?us-ascii?Q?ec7fTyuOoy97PdNVJPBK014ZNCpO+LbLz8gn/JTx4vgifP3fVQ66mth54FiB?=
 =?us-ascii?Q?+IweJCsOwLaZTAt6YUPfzu/qT5mnxzX1LiG36la+FeiTV1Wvm1YItYsFm1h4?=
 =?us-ascii?Q?kFaW+w/TTQsIOtQlHUBHP9jVzp6azpgwl+ShQJW2P/O1ywK8qXAQYib+EAHt?=
 =?us-ascii?Q?QjeoSHcHob469jMGCdYKq1+iXBj1UzwzhQyf2ZofKn+Gkn8kS6gYMIZYRozQ?=
 =?us-ascii?Q?ulOMURCdwMk32/9xddUB+yJy3iPAyG4YPHHJDaomqjqcmHIHD9DxHbmjkAqV?=
 =?us-ascii?Q?MlkuWF/Qdo/Tr4ivFroyrG/IQbRwUPr5uJ+6Z+B0Vo9+/6j+nAL9BhzkwTf0?=
 =?us-ascii?Q?NyKUdvs4KB9Vq38wNIXTZYYTNkSY2F2HDgDo75fO/tnXA6A/FoUOEch2s5rG?=
 =?us-ascii?Q?vHCORaF7iRuwOy1DYWgPF090y5T/cREoBOtjjhCBgI+rSj+ydCJGJKVVi7Z2?=
 =?us-ascii?Q?1mSyi5iAjIWMq6yzE32H1bnVRK8KlmM/zIX7Ttl0GHZ0RjbWO9PjYto52mGg?=
 =?us-ascii?Q?6SPm5R+rUDY0aADW3iU0pe/cKFP1jvxDcPEatytBoXeCpoUoNquHhkN+pfJu?=
 =?us-ascii?Q?sirl5dNfcrzWwb8L0PFLwOfRmFH5j4aNmotrWlKdlfObjBWgw6ci3YWOPSAI?=
 =?us-ascii?Q?vexR2bzXkULspQpZUfUwET5xveCUKcsTsDruk1bT/G3E7GipQNxSQkyPqMgT?=
 =?us-ascii?Q?OLO/JwrZ4M+TL85WrwMmgP6UbfMMrzPFafuuz2nP34SeRj/bC9+aZusNGRRG?=
 =?us-ascii?Q?KTVRIMAMi45Wtr1RV1uVe+dcXT+vn2Mo0n99n/hEAgvMg3oTqGUUZufYFQ89?=
 =?us-ascii?Q?KNywRgFtbS92hvpToDYtlqHk2XDPhv99updRPn0QmyiqdsesC1FpAi2Rnogm?=
 =?us-ascii?Q?9NthNumOKhHVK8zcLEvo2Bn2va0rf5qCleOgORtU63LuchSSKHUq7668XCtm?=
 =?us-ascii?Q?x/BAMjxd9w=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b56f0c-64c3-4e3d-ee03-08dedcc105d5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:17:51.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: af7/rvYul3rFZExr+KrB1sAKZGxT763lvjUmM11y9LJSC0k+CRSvZb99PpHGyhiSOuLz0iW9kfnz3AC9h4lItQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_001805_238859_B4A1EC5E 
X-CRM114-Status: GOOD (  19.77  )
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

Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
at the call site. Extend i3c_ccc_validate_payload_len() to honour it.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- Split from v4 patch 3/3: optional_bytes and variable-length GET rules only.
- Simplify validation: drop redundant exact-length check when
  optional_bytes == 0 (per review).
- Clarify GETMXDS fallback: with optional_bytes = 3, a 2-byte success on
  the first attempt no longer needs the fallback; it remains for when the
  5-byte request fails rather than short-reading.
---
 drivers/i3c/master.c    | 29 +++++++++++++++++++++++------
 include/linux/i3c/ccc.h |  2 ++
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3b6d3ecd9d12..12ca7c929ee5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -902,6 +902,7 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
 	dest->addr = addr;
 	dest->payload.len = payloadlen;
 	dest->payload.actual_len = 0;
+	dest->payload.optional_bytes = 0;
 	if (payloadlen)
 		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
 	else
@@ -944,11 +945,19 @@ static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
 
 	for (i = 0; i < cmd->ndests; i++) {
 		struct i3c_ccc_cmd_payload *p = &cmd->dests[i].payload;
+		u16 min_len;
+
+		if (p->optional_bytes > p->len)
+			return -EINVAL;
 
 		if (p->actual_len > p->len)
 			return -EIO;
 
-		if (p->len && p->actual_len != p->len)
+		if (!p->len)
+			continue;
+
+		min_len = p->len - p->optional_bytes;
+		if (p->actual_len < min_len)
 			return -EIO;
 	}
 
@@ -1342,10 +1351,14 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
 		return -ENOMEM;
 
 	/*
-	 * When the device does not have IBI payload GETMRL only returns 2
-	 * bytes of data.
+	 * GETMRL returns 2 bytes (max read length) when the device does not
+	 * advertise IBI payload, or 2 or 3 bytes when it does (the optional
+	 * third byte is max IBI length). Use optional_bytes to allow either
+	 * length when IBI payload is supported.
 	 */
-	if (!(info->bcr & I3C_BCR_IBI_PAYLOAD))
+	if (info->bcr & I3C_BCR_IBI_PAYLOAD)
+		dest.payload.optional_bytes = 1;
+	else
 		dest.payload.len -= 1;
 
 	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMRL, &dest, 1);
@@ -1414,14 +1427,18 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 	if (!getmaxds)
 		return -ENOMEM;
 
+	dest.payload.optional_bytes = 3;
+
 	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	if (ret) {
 		/*
-		 * Retry when the device does not support max read turnaround
-		 * while expecting shorter length from this CCC command.
+		 * optional_bytes = 3 accepts a 2-byte response on the first
+		 * attempt, so this fallback runs only when the 5-byte request
+		 * fails rather than returning a short read.
 		 */
 		dest.payload.len -= 3;
+		dest.payload.optional_bytes = 0;
 		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 		if (ret)
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index 2506d83b8255..7ad677baf761 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -347,11 +347,13 @@ struct i3c_ccc_getxtime {
  *
  * @len: requested payload length
  * @actual_len: number of bytes received on a GET CCC (filled by the driver)
+ * @optional_bytes: GET CCCs may return up to this many fewer bytes than @len
  * @data: payload data. This buffer must be DMA-able
  */
 struct i3c_ccc_cmd_payload {
 	u16 len;
 	u16 actual_len;
+	u16 optional_bytes;
 	void *data;
 };
 
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
