Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF6CFC29D
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 18:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4p3pleZIp8IcGuTNpyTlIygnegVD3ymgghrSUjPXsI=; b=K2sSWIIocdz+hm
	lZa5Rl3ODu/Kk2cp5u1n7FWXfVeNhYuvu4SFFzqrLQzBU3iOZifSrN0pmoToY0SX2Etwdc7OOKxEq
	nc0/RqpelrcOt3GiY3daJTCLoAoywc2+Ur5VJa+lzJS5H5LClyhzdJGN5zTLuGXouD94amkd1Qz6G
	fYi/Hig0Oy3Ht6BVT3GDrrzc6HTH7XBVAMMrvPwY0qZD2ANoxIhnZ+CFbC0xh7p2oSAkePTvnPsla
	N2/E4iAhoG4jUhLHA5aatrxUWLztE2JgxGFvbDCqtSb6MDmvPzE5AmqSwdHta+hxLsjZPwo/reFie
	5UqpwsrNiAKydpzYRo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTZ-00000008pKi-1mxI;
	Fri, 21 Nov 2025 18:03:17 +0000
Received: from mail-southcentralusazon11013001.outbound.protection.outlook.com ([40.93.196.1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVTX-00000008pIg-0ewT
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 18:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfgVc7l4NhQYYyh+FrnaawngQ6lqtIn9d50AsSqVtauRwLocwgIE5LUslsVayv5pZ932F5BnA2YS0fd6MlPagnKsx6upxhQsHCLjIyQNUZj10+ln5+IpkDTV6xYahph1MqzNUEA4fKjrpPaUfLs2Mzzplfw4LFlv13Xre84qHTuTYZZUOnIuzaE9H3rqoGOKk5S4fW4zGwC0Hrckm07gnjrVJZ8j+YkfdpLZtNxCufrTd1HaPGl6CNaJA9uWt7pUw2TToRJh6tJv/Mkw7aS4YHQv6HODKlP6B85m5V7muqW/UVCuTIE6uekXMYn6/N4T7QEB6JBCL0f5Zk7unLf53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAp1n/Po+i6A6JSg5qjFdur3KSd27pnlZDYpfgDZWNo=;
 b=eHvGCSgocpnCj/Xx5CFOH2RkRxUnbUowCfw//t7+rj0NCNwJsj9Cv2ogbJyjDT9W/+MYKNNqew04aouChdO4q3ygJLS5ugH4Ouhuw3/WJy1E+m8MEO0UMIdYdrk+DcN14hJ692qu5OWeoUt9JuM1i4JZeV/zVIFdpS4y2T714l9PAcu+fJpu/rv6YYP2LAhcnYn8nRhr7nSGFy6IL+xCqaE5db95g9XF0FpMaIqPQW/Ait57O/gvRuyi6Nb7c2N6c7aWM7nIZFTrwODUx79x1bAFbn1WOtGoGHNyKyNbA17wVxSb94LptcObeq3/DJ8VxYhZWlkz3H1CUiFqROL4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAp1n/Po+i6A6JSg5qjFdur3KSd27pnlZDYpfgDZWNo=;
 b=B/AAzz0257ZT3vyw4o3mOm3qqs7+dDshIBgDHUU5KozYfNmBOsp4SBQNBGPoz+1b7QAsiOZU2+M9GqaQQkkDz3jesKyh5X0iZH4Uu/y8NtA/j/wXS04MrCNubtt3elcIy8BeG0MJ8Z9HMsKu7M4Rhl7OI9vVNs/hcXGKavXB4oL1TtmvDe2Mo0onu8qlcdXC+D2mZOVCXwvkUKuPpsIE1PqMgwOyKIT9ORiaRhYfVgvl2MoHN3HMMxdMhtqKpHoYzezgzdNT9Pr721Zt6Ddw1l+6eQ5YmYDtwsoLzSh6quWN59pK/NHUJRpuklpdMKZTLolVfi4sGr6512zN8v3HFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MN2PR03MB4926.namprd03.prod.outlook.com (2603:10b6:208:1b1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Fri, 21 Nov 2025 18:03:12 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 18:03:11 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 2/3] i3c: dw: Add sysfs support for Device NACK Retry count
Date: Sat, 22 Nov 2025 02:00:40 +0800
Message-ID: <a700d805a5f3a04791bb4516d6f67f6bd8a80616.1763747151.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1763747151.git.adrianhoyin.ng@altera.com>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KUZPR04CA0028.apcprd04.prod.outlook.com
 (2603:1096:d10:25::12) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MN2PR03MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: bb63c6c3-3b6d-468a-7e4b-08de29283ba7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/G8FGgrwEguKCsbck1nDRpqDLzJRUre6K5Aly46AUa/Znz91Vul/sS9RSOch?=
 =?us-ascii?Q?egtd3k3ZUVNmxebZaLOYV5fa7nbvSyyBKOcLYs0O6mG557fcHeB/f0r1+aiR?=
 =?us-ascii?Q?onhh7yxL0oW6cvfv3l3NZWDJOwTySSPwUH/44+akZnxmGlAb9T70leRgN9N6?=
 =?us-ascii?Q?OxndmtwbSjW1Xg7R9W4iM5lQJkC1xyHJqnKM4rfpHdCJfNKaSP0j9lyz6jkg?=
 =?us-ascii?Q?tKu0pNMmgROiYiTYCsZ3m1PFt1UOoReu+Py/NOfrYhshr/gFmRO//eOgiU81?=
 =?us-ascii?Q?SNlMzTytC4zJcz76QT0FWn/S9jTBD+JI4ww99X57PVJ59eznQNqZejsspfvR?=
 =?us-ascii?Q?+IrDifpulGtZ3Lu67CoU184kkUYgk/hfQMoG0UKufG6/LLeiHUJK6SF1G53K?=
 =?us-ascii?Q?uc4IuAnv+NI+fOf1MjSao55wZBt/T/hlo0CjA3mpfpIUT1AnHdBF3SYOcdIT?=
 =?us-ascii?Q?cALAM+V3okGtFtQY2ebOvsN9HZd68KOqPiUVwuMmNj7G8wC876A/hCUijiD3?=
 =?us-ascii?Q?WA8aIopOpB5Z1J47igR6MgJIYGzawAv1q0qoeFaadGDhoIusYuWkTQoD/V1o?=
 =?us-ascii?Q?f8I0EXXCQZHv6mkCYpOVzfMrocLe6sG+R1KX2WgCIweuc5KYkUcYG2t9+fmn?=
 =?us-ascii?Q?WDktK2WjmgVRAXyORPhplt+e9DXH+ShJCiJpTOBrqype6aflLSpmOo3pUciR?=
 =?us-ascii?Q?TZ7Gu1G5SPC4Vi2nrsv/qILHNe6sFY6JEkDGaH84Xl8wZEcFNGD1Z9bXjeNe?=
 =?us-ascii?Q?1gr1SyAHeXpAmgUlEbQg9n5oneoWtAXtlhBlOMqQmfHsEFsAusPTiYhlwgW/?=
 =?us-ascii?Q?vrreyTSUZtOVrTdcorSCRxJFu38kpFHrUZMW7JpVnl/CD8hB/5toHF7zJe5a?=
 =?us-ascii?Q?hBFe1cW57rW6o4auK8+r4aiPzsm6L+i67czFwFJ7CHAiXVNr0jXTQkBB68Y7?=
 =?us-ascii?Q?xEmtM/yNJagGU08FTDfnfzcY1x+kg3xKYY8S+qp2jd3B+BAaJDz6CyKw928L?=
 =?us-ascii?Q?kAAAwT1YqDA5V9L2DGCdS7jIfmiy5EUomaGyanRX/RhDDo34+xypaz2/C3XO?=
 =?us-ascii?Q?3WRJwZo9bTrKws8ys836fz/blE9tMKiAhoW2QFKoVWBn4AbtO6m5yMDSiDce?=
 =?us-ascii?Q?4O4GAOue672iHVKn4Oe7gccNCJ6mgZLLV3EJgokQL6aQQbrDp/mdSEXwFY06?=
 =?us-ascii?Q?gdGIvpEh7QY8x1BelDFrAgwDyVvob/0wv9BnQOB7lKSjflxdaIw614oOZUhy?=
 =?us-ascii?Q?0a36DpLbLrPTN76JMRPwRL2TZuLhSCepdVDoAD6fr8cIAzk4qqW5dwUBdPRu?=
 =?us-ascii?Q?3OjdwoB1eLi9etJ7Geeoezel2b7POjdZa2ctv432YeOTr/HEF96c2YIuAfy4?=
 =?us-ascii?Q?him4bHbVRqv9XHyRVdCnmP7yf8xlSb2Fsr2FnjumKFKTFtRGU9I+w3DX25C8?=
 =?us-ascii?Q?uld79xD87E9s7PZPIXaCXBlUOajmkqGn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2zC4ckkWzzi6SnDV+E1iCxEgztIaIIzKhvLgvGgqcPhafnheUZcWwWHEq5oO?=
 =?us-ascii?Q?Ae2unaO6qOWGvb+YPo8tdg4kXMmc/WW2ddW/6M0qCqNQwErNQjFlFHVP0xfv?=
 =?us-ascii?Q?0+OJ6PBDGHsbAliuPkFz0tQns0hGQVrQPLlONsu5AG6fLbXzed6XBsy9Jnkt?=
 =?us-ascii?Q?n42o+jGccxfiycn3PwDlvoRSCCMpyhEgnOc/zcPm6pnnTOZSJrZmI29L6SHE?=
 =?us-ascii?Q?66zBqKPT/k5eTh6zbSkilB49jiFkMh8GVllBHzget+qdmky1O1pj4eXnnWd5?=
 =?us-ascii?Q?KZLv8OsUTj7kl5O8hv1m9fVaSbYz0lU1xq4mHWaF1EB++P8BXz7G4U/97ub/?=
 =?us-ascii?Q?0xscBSJNtEVjz8Oh6UWazLnft4PLpEu9/WcqFsYFgKohpXsDs6HbwXqscXoi?=
 =?us-ascii?Q?m8M0f3ng7bBfA8K237OA1fcrxo8sivMCFCAkPDquyZAYOCXnhp5WjJICpZ96?=
 =?us-ascii?Q?8yrLbVEiqUVDzmQ9WHUTrgeANbgMpUqBwnh/eYaaDB5GwBJwsqixE7GcN4q6?=
 =?us-ascii?Q?kraYnbkN/0a+Ttq3uzvJaVd0yLKV9EaTe0mJvX/QYBMbSeaFPcBNe9fa5mW2?=
 =?us-ascii?Q?wkiyTW//Xx6eKIfuKf88U6s54JhItuAWpszzh8SXfN9+qaZIIT3mW3+vPy2G?=
 =?us-ascii?Q?bB9ZLF3Q3vMlpSdMPvds4kBlzgpbGV+b4GxFbaa1K67sYuyfbpdiAY2SyNmS?=
 =?us-ascii?Q?5d8nSbKgtxLtaGiCYFI2wf9Uc5e9vzg7ZyAIWKOWHVsTU1B1SsA53CwEXWy0?=
 =?us-ascii?Q?skoWlOtP66maqYC60pLTmOwQiui59szYkv7f0FqXHRxGmvzNOrkgKUNjavhP?=
 =?us-ascii?Q?xnUGebv0//p/r1cn5/Jk/KyYy1wfRrEx10q6QAyhxGnLk3P48qamr0fWBKwB?=
 =?us-ascii?Q?7TL+fNQu8pcxhlGNuo5J/cIC5e3XYEpbXXIMLQWOgQhm4nbG7LGWd1egc/dB?=
 =?us-ascii?Q?S5m+6Ae44csKuCzxmajU2Z29rlCw7w340S5zBDSYW0+aEVmFvFEYl6fSVtzk?=
 =?us-ascii?Q?QSmYJdnvQy+5nIgrcoZy4vFnIbYOcBcHy2n+iCJkV6H7MH+aTYEmbVVwbmpU?=
 =?us-ascii?Q?9LBJ5El0zf8wPK2wsZ0yfpF/LWbimyh+AFE5498UNYyfIhoX+PA+x6XkYAsc?=
 =?us-ascii?Q?kwkLnJrNBSGclCJo3aHOPZz7prQhlaQX2AGTOFx3YH6HA2l64h0VslWa+CNg?=
 =?us-ascii?Q?SMC8tpNLUmPHoA2OLUWtKhzdTCxMfk7VCzcuXslD9ich+I0hgrTae0qg+j6j?=
 =?us-ascii?Q?GoqiHS0uCdpLjXQunHdhG7UioOUqBOR5J8hV6hOm14VwX5//gcTxdV4aF5t9?=
 =?us-ascii?Q?SYfXquCPhyv3vduCyFAA/HsZuNl4oUHyiwRgFxq6Sl3WEA92tesIqHfj08qX?=
 =?us-ascii?Q?YEbPMhc17sM8T51WjD4+5+dM3IWvlK8insm6hVFCZ3phoBuSkGSmjcxFN4Lu?=
 =?us-ascii?Q?NeuALAD/kBRXujxd7T/AXh+L61DtVvZrhFV2Jnob+e96qhwwyL9XM6KN55ev?=
 =?us-ascii?Q?MKM0w56vBzSNB+Ibo9n1YR++ylwdWO4E0zHpLcD+INY99XVhmb/XPVSPr8tg?=
 =?us-ascii?Q?4xOm/IX1uNeX2wON0yI0HwvJIe7pptJTBdkM2TY4GxeQsYCc+Czs2I6+0fYa?=
 =?us-ascii?Q?kg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb63c6c3-3b6d-468a-7e4b-08de29283ba7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 18:03:11.0297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygVQF/kdJvCtnhDtsi0yJ10r1PkF2inzCXc9fkQCXvUh+hXId51TNr9SXxuB+5/IY1ysYqscBQCGefIcrsYLqk00DqB/1MHBWtYMscvD6+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_100315_198711_801607B6 
X-CRM114-Status: GOOD (  15.40  )
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

Adds a controller-wide sysfs attribute, dev_nack_retry_count, to read or
adjust the retry count at runtime. Returns error when value exceeds hw
specified limit, and the updated value is programmed into all active DAT
entries.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 69 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 70 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..e228c60840af 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -204,8 +204,10 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
@@ -295,6 +297,64 @@ to_dw_i3c_master(struct i3c_master_controller *master)
 	return container_of(master, struct dw_i3c_master, base);
 }
 
+static ssize_t dw_dev_nack_retry_count_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", master->dev_nack_retry_cnt);
+}
+
+static ssize_t dw_dev_nack_retry_count_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+	unsigned long val, flags;
+	int ret, i;
+	u32 reg;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
+		dev_err(dev,
+			"Value %lu exceeds maximum %d\n",
+			val, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
+		return -ERANGE;
+	}
+
+	master->dev_nack_retry_cnt = val;
+
+	spin_lock_irqsave(&master->devs_lock, flags);
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
+		reg &= ~GENMASK(30, 29);
+		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(val);
+		writel(reg, master->regs +
+			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+	}
+	spin_unlock_irqrestore(&master->devs_lock, flags);
+
+	return count;
+}
+
+static struct device_attribute dev_attr_dev_nack_retry_count =
+	__ATTR(dev_nack_retry_count, 0644,
+	       dw_dev_nack_retry_count_show,
+	       dw_dev_nack_retry_count_store);
+
 static void dw_i3c_master_disable(struct dw_i3c_master *master)
 {
 	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
@@ -1598,6 +1658,12 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (ret)
 		goto err_disable_pm;
 
+	dev_set_drvdata(&master->base.dev, master);
+	ret = device_create_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
+	if (ret)
+		dev_warn(&master->base.dev,
+			 "Failed to create dev_nack_retry_count sysfs: %d\n", ret);
+
 	return 0;
 
 err_disable_pm:
@@ -1617,6 +1683,9 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 
+	device_remove_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
+	dev_set_drvdata(&master->base.dev, NULL);
+
 	pm_runtime_disable(master->dev);
 	pm_runtime_set_suspended(master->dev);
 	pm_runtime_dont_use_autosuspend(master->dev);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..45fc1774724a 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -51,6 +51,7 @@ struct dw_i3c_master {
 	u32 i2c_fm_timing;
 	u32 i2c_fmp_timing;
 	u32 quirks;
+	u32 dev_nack_retry_cnt;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
