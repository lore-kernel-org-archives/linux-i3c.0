Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B391CD98CF
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wb5UI73nOWqTYpjUZpNvxjFyrxBUyR6ulsYQEJ3N1sg=; b=bHQ9Bzw9WOqq64
	4JdAV27vR1xlA5wMHkh7EktGMHeS7543cZKb/VK8f5y/LqWE2GS0UpZmJgeboNyu/SYCfZqS6ehxt
	nrsNAs+ZGxgdZdqImLRpKTPw9+PhhTd2ncuU1jK/jd4CCwa8EPFMVYGPuld3CC9l+7A71RBffK7Ow
	6frZUSibjyHy+ZQEUmobC69unwi5/kNYwyflHyQBi6NDx49GWKFQicg/BDYaRvO0faVlSTw/9lqbR
	rSW98IO9PKqG3Wgm7mCM+bO4Ia/B3SvqKM5fiqavYO1ADSdRXtlxb4xZ+8rWfGOqJ382Otq7n0gc5
	pmgUcUVTnVbXzY1358XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUcf-00000008XPP-2kE6;
	Thu, 11 Jun 2026 01:54:21 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUcd-00000008XNo-1K9x
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 01:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUjFcsfmAYkvbFxJ+7nymoe/USpQE62r/UnDd1jdXbRfyrLh4sEmiDpoELLdVLVzlEC3oXhBnm3yCCS6BwEjMs2eO8I8/5WqcS0ehxHzwCpRLqnvlc1UnD2hyy5Tb4dhF1RQczJDXCa5+cdku54xTQmct2G6HmHAVecP/TY3RYQNyPSkiE7seF6f9BdYAM7ZyzjeFVGKAAl25CeeyrXBDy+jK7X1LjK377YjJ+rl6KPFYyz6bx3pjGd1RTQ3hb9CJSDvGkN3cAIhjgGkli/4dU2YcTiQvD8CTU4BNQEidyZOMjwX3sz9ihpvteYaLthkzFSzPnPSfWDtgWu/7TDQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqVHWkeWiMddro6DfBS9Zg19qypQ1E3X0GtWpaRSbNM=;
 b=d1pJQJFR2BGEU27s6/Bzxygz/3RrYT+O4Q2UMaoqPvZgfj+ocwzwIQaaA60PlR9IbGr7PNHIPaBSOL12dkrElzedacoiW0MquPP1KmoQwhwAm8n/IVC6V48h0sjtnKlSNmaSLQ1WCc5B1IQ6c+RS+Zn37R5J8v5dDvx4462wjLZHuqrWKhBTijBZizFDGQyBsSAeoHIVk24t+EQvSWtKll/Q2z/dFYs3TfAadVFkx8dJfqtmm7pcAzkHRBDGlOSy9bD0tl0T95jboGHVPCauEj5W87ImmmW2IVEuA2N0qs4OfzuE+Qh5MTbal/SOxmdtfXIiCnpdOVv2XHi6UbC7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqVHWkeWiMddro6DfBS9Zg19qypQ1E3X0GtWpaRSbNM=;
 b=Guq6eWmdCEtm0QNWfMscnuufbIV+z9qKgNlyAbP49ibuiDVlfyW+Fgd5Q2e1F4KsC7U/FQ75URMDwtOMnpXME8lcdxewsTs6kcW1sY/ir8scwUpeKmQwbzWvFzmOGFCDAKjvW4fGPEeCasWG+ZwUlnnSpExqwffLDJeSKd9MbWw3MbgVWPBvBH+JMwqwkLVaXnpXetUsZJ3Ds9t3f2T4pbxvrHcF68BP9M63FGm0YTp2z8Q4UL14/6derlf7LHT55+qkMeh0F9Nso1jklnSdTiwZKkwfztZP2ThWKFM8akEn/u8pVMment9hgZrBQDreVRepAVNAbB07SVVF3qlMDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 by PH9PR03MB470143.namprd03.prod.outlook.com (2603:10b6:510:3ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 01:54:10 +0000
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf]) by SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 01:54:10 +0000
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
Subject: [PATCH v3 0/3] i3c: Improve CCC reliability for DesignWare master
Date: Wed, 10 Jun 2026 18:54:05 -0700
Message-ID: <cover.1781142158.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To SJ0PR03MB5951.namprd03.prod.outlook.com
 (2603:10b6:a03:2de::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5951:EE_|PH9PR03MB470143:EE_
X-MS-Office365-Filtering-Correlation-Id: 12508ca1-e0bc-4d25-b702-08dec75c549b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|921020|55112099003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 1qD/v6I1KL7Eywyw3fKMuUgUKHaaW9Z+Ahfy6Dm4PX6ehWXHnBqzna+Zg8WCixK0mZYKvuOxiEM1F47xt46OGUJOgjDiEeJqkZrGUYsQnBpGr1G+zga52OCWuEd/p4aJDXcclQQCRpN8njY+o8vDxhO2Ha9T2lUKJJZDypeI2uGJTizfuTk0qU1VDP5QiOu/M3zfSk1D3Ju7OMUH3eIRniGyq1k5WBA/obrQE4rtJU19kMzdX8lNQ/YKLUInC49K+KWBBewkVSfbYqQ2TBjVL5jCi9+0lOubnIbes+DdS0sXil/ESd2xUwMknha6wVJ6p+fdITmjB+Bau4Ip35y+fSsGRKo9noxLbVXS0ZEQT6TOPYDypgeQqqcreqexhIlzIGnRMrSkgxClIXEfOpcHe97pRtA3VtDDH3xmMIt1ZMiiuRL9AcnygRNYK6XvwJH53Weq++Lx2BrbXCZ/kvVdxtCUgWTDZ0n+PoExFUvX3sMUQWhtQvTXurithfAI/8GorNQUJj3yjLKsODG0WAFJNNBPo1hHGxqB98MZB/FEKTkjxI56TMa+gyzWJ0TlA6CPlgrWIUsvddud3lXFbF8eXAa/vSHf6deJyAwmeEPamZSGGB5l7Advl29qkKCrzDt/yg44yos6PmgmXTWLRiaGykHlP0z0pxk2xOilT+8kw1JvSoBTmqfz6gCyovy2Dg088nJM4sVJtsEOPp1BVxhCi/DM34zKjZegzrQO7IUbeiX3Yw5Vqy8eAthGbPwNA/WE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5951.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(921020)(55112099003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gFoYvSYwGoemOxnPeDfLr/pQQzpbR/gslgcMsir3Xt53a21WqcXKVOJ0Ke9m?=
 =?us-ascii?Q?oYj9AFC2trp9paLFZk0PviDjguRMP3d5OifXA73B0SxAD6UaR9ksLZGOkU4B?=
 =?us-ascii?Q?PbSnsIAA5bT8PrsgydPAimXIvehOkCW9w6RiEEMvpUBwXOXEFDaAtnUL/s+o?=
 =?us-ascii?Q?0DyycJBkmGRjTNvwZ/a+Mp6888a5kI1gtLTZ300U9MIFAEcSg2U/9McDcdGo?=
 =?us-ascii?Q?liDRI1qs5u6dOpvR5Z5RtdnXOzaLs69oPgTLeC01B9KUqmj0qLuaTF/QO0+H?=
 =?us-ascii?Q?++jcRHi+oiVmxHoxT//hVOsGd4V8I+h90x6QRloS7pakRN+dmvPZP7B8hF9M?=
 =?us-ascii?Q?CrhP8luF2rzG/7EJyCVjiG7J+qtToBRoWG6jdClr1ME+bJxrLs3FvFmecwKM?=
 =?us-ascii?Q?ifmRpp6zdHn1IHliXtZWEAwC7U6Hv7FFp2yELF1L+RQfHCUQUS3P7jAv5bBK?=
 =?us-ascii?Q?EQjybqPG6QvmneEbu69RVxTFt4KcSdxVykwIvpZBva/ra3yKvoyiy7KNoinv?=
 =?us-ascii?Q?znhwN7T1XwP2e/LSzG35mHBbulUSzcRwWarp5AIsjAzlxZ3yHcdStX93qBGv?=
 =?us-ascii?Q?wMJDoP2Cq7pZ74QFGrHZRxvx2+vmR/MDmMDeKYPI13StEOh2nqAKzHPWo3yp?=
 =?us-ascii?Q?kY4cZV70AC6dtxE5u3NUROSvKx7sI1BNCCIu5ay9bJ97trP8Vwp4SLU0qVLz?=
 =?us-ascii?Q?uL4o6N/Dz/T2WvDKXEREnhlfu6/Qs82ckN05Jw7OHvqR2b3iIJBJzTY/W1vN?=
 =?us-ascii?Q?jFgzxHjBgxPsq5BcZu7zitUMKTo+Ni+7Oy5Q+Lw6E1lz8L1FBIFHJZdJEwXW?=
 =?us-ascii?Q?/I08JJqzmjwzrHPpJergfmKsf/Y8A3PTg343MAno4/CHnRo7m1WXFgDcrlqK?=
 =?us-ascii?Q?zSWbdspt7XqSHxSSqJBtd5hAT4caSIiJ5DBkS9tMF1rRiHdeVj7A7oX4VyRe?=
 =?us-ascii?Q?YtXUeqdZ7bfFWgrhjp5ue1Dm6CegXNct4c4KxFZ+G80Cn/Ys5oCwLAFMEC66?=
 =?us-ascii?Q?T/On7ndm4MD9sAzkUasYlWbenOPXzhOuEPsJGiMZoA3jk1aiY5B2OUrggsMb?=
 =?us-ascii?Q?EQoCg2jO7+7X5N6vEbrTyxKCT2qrT+RYzEmmVzAwZY0dGMD1T7dcMZY09IR2?=
 =?us-ascii?Q?Wfz984JRfnTbiDDX2CZZAo6R/XLmx56JM4P0JaeESp75zsjgp49pJDJ4PdjY?=
 =?us-ascii?Q?p08q6k0Rf0b3zEuTSx/3wILtCbqCosPzvRxdMUrnm1AmFN01EcTdMqv1A+KX?=
 =?us-ascii?Q?ZH8Vtaj7BnnkqWACv2q5j1IcG+grvieZ5/4UAsd42PQCy5ThEpeaZBwmnezi?=
 =?us-ascii?Q?HaH3hyHMAC12Ru5dlW728ipn3Xs8jP8KmJ9wc0tFrUu3TcMk51iN3NLg+KSb?=
 =?us-ascii?Q?FQBcymBRpQncyQL0SVNyJPPdt9gjTHaHEnsrif9/Pjm1zWfrS+Nn0835cJzR?=
 =?us-ascii?Q?wetelimkXgEAjCb7VrI7ub40/wzYjaib15cjvfSlqgQEljPi1qQDsqhnc32E?=
 =?us-ascii?Q?rupoHMhyZ2EuaVvqD3ajL6WMv2/+6cVKltInYXf/evqOGilAgc4xkiGqX+Sz?=
 =?us-ascii?Q?wPjgyrpNGYmYvGTPrLbYyvnUJVYAvXb1Y+VkFZSAF49jVOWgVZxYb85I/m1/?=
 =?us-ascii?Q?vROVvUAOrtSddUUHOVj5p9qKN3MtHMYn1vJWJuW67UNRwpedFVPbrq8GGq1p?=
 =?us-ascii?Q?xnfC00Rl113BRLgCr7IQGGx5YolZA40gcH+qY2G9k8hpH+P2RBrej61RmzrE?=
 =?us-ascii?Q?ah2mY+I2sw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12508ca1-e0bc-4d25-b702-08dec75c549b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5951.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:54:10.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZjWXGHBurdiuywhzLbhwnlS1jItKX7+BLrM24mfr/gYQ1jWqJGqt4boWV6pxrVlsdRDI+69TIovw4n0OHB8AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB470143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_185419_355245_F566F907 
X-CRM114-Status: UNSURE (   8.39  )
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

From: Tze Yee Ng <tze.yee.ng@altera.com>

Improve I3C CCC handling on the DesignWare master used on SoCFPGA
platforms: report the actual GET payload length, map hardware errors
to I3C M0/M2, and validate GET responses with a single retry for
transient failures.

Patch 1/3 fixes a DW driver bug: on successful GET CCC, set
dests[0].payload.len from RESPONSE_PORT_DATA_LEN.

Patch 2/3 maps DesignWare response-queue errors to ccc->err (M2 for
IBA/address NACK; M0 for CRC/parity/frame/transfer-abort).

Patch 3/3 moves protocol handling into the I3C core: validate GET
payload length (GETMRL: 2 or 3 bytes; GETMXDS: 2 or 5 bytes), retry
GET CCCs once on M0/M2, restore requested payload.len on retry/error,
and use a stack buffer for the common single-destination GET case.

Changes in v3:
- In dw_i3c_master_end_xfer_locked(), move RESPONSE_ERROR_ADDRESS_NACK to
  return -EIO.

Changes in v2:
- Split the monolithic patch into three patches (per review feedback).
- Move GET payload validation and CCC retry from the DW driver to
  drivers/i3c/master.c.
- Validate GET CCCs only; drop SET payload-length checks (DW
  RESPONSE_PORT_DATA_LEN is 0 on SET).
- Retry GET CCCs only; do not repeat side-effecting SET CCCs.
- Tighten GETMRL validation to exactly 2 or 3 bytes; add GETMXDS
  2/5-byte handling.
- Expand M0 mapping to CRC/parity/transfer-abort, not only frame
  errors.
- Restore dests[].payload.len before retry and on error return.
- Avoid kmalloc on the common single-destination GET path.

Adrian Ng Ho Yin (3):
  i3c: master: dw: Report actual GET CCC payload length on success
  i3c: master: dw: Map CCC hardware errors to I3C M0/M2
  i3c: master: Validate GET CCC payload length and retry M0/M2 once

 drivers/i3c/master.c               | 111 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.c |  41 +++++++++--
 2 files changed, 144 insertions(+), 8 deletions(-)

-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
