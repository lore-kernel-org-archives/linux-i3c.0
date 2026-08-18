Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D816C5DF81
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNagTIy/iGypzFWDWYwHEgLh4IRorECk1ic1LamWWNE=; b=qMy2aghex/LJDS
	UPWtTlNVtkTgbZkqPmU0vi2GeGW9WTFLUZp0JImdFpYFu+gKsd+g9LfHlofl+1IEV9eKlGTNlHJVQ
	OAR2grMdiI0sEqreMNKk1I4BwNdWO9tOJu+KtzyMchd3Ch6HjUfp2DuHalP9nzdWA28PreNab04WJ
	D7+0In47KtC+heIMq5KPHKImp5jmfihczXOJ3UKQnR2KLk6Q+pr3wYq4HeD6upXtmTEzKfoWR3jEz
	lC0dKWQxlvEvLaiYmTdnSLQlZFL+FZsjzj0EigH/iATkdql5shcYZ+IwonHOzVY5PEFatvPOsElNe
	ukI+INIk91dQOESEWIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPhs-00000008bix-07jJ;
	Tue, 18 Aug 2026 19:42:44 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPhp-00000008biG-21IY
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 19:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sy5c7qOl1xbj5h8lCZkaUdDCkA+2eNBn/ofre+qIDdMfy7pD1U6gXFYV/g+QbCpBjaylw2k0XCKzSuAMEGvNnxe/I8B8vAko8Nnr9wCjR84R77aY8ZoVgqXAdCxj5WBI4K09VZRvn/LE/tjwsSKJJCav0NBPvQfKmKwlE2xMDz7E0ijgL7q5iwDQlKKsdG483DuwDuLK68qnPJKR3Gtw5xv2jSvkQZ+POaSoQ6ZtWLe5tnUpXi1tLGNiZ+31ZqHHmqPwoT9hL3O4BlCaNMh5sqTfaU/tstDNdJ9ASOzVbbaRgyy/Mjse2AwDN9fot3VP5VmxEUXvWTCJaty35qRWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbsK2scZXDN/nyB2w1YSmJj7aWh7O6dazZXaeWWnH3c=;
 b=v9fFdu5gOoRKe+diOUzasvjtSENWoPZTUgtAXIs3NnEs9Ooc+p6Jx/jN+34hszI5LQALH//XkLLmJuSP74g52U5ECIgIniIhBUZ1UJZC9Uc5Xu26H8/QFJ7sJXuTViFjyy1n+um7Z9wqio+B4s+VRpTCF2GegNYekC61JaAL4w7k55dHvMCLpDgWy15/pFNGm+N5IAavVnzGpiSAXBg4+g1Dl+HAiNtSdg67PC3GwCbrSxbmKR6v8K/qWfaVhnu2loNcpLiOdte5/kQ4kKyhsz4YqjUJHDj8EF66WZAV+kHpMYDv+aj08Xro6dT8PWTARRFLcK6D66QI1tSktLpASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbsK2scZXDN/nyB2w1YSmJj7aWh7O6dazZXaeWWnH3c=;
 b=iP3LmSKrNzbFP/tzIC8y4GGG0XWnoyNDlH3kX1eCgaQ9clW5QNyPmL/3kfa/h8t+OxLLfKruBWQeUPPuIfhHgr5QHSPD+3lGn1BeD/030i8NxB6BIb78G8pIGBEXR1fh9WDYMYIHarFw5VH+VdYcAdk0GKK21e9VbvdK6g8Q6+Qb/IsGk+zp4ZxzDMB1X+dXU+70MIco37znAF1wmG8Au+xwvzegGHGodB3kieM3lFgp7ZGEuHIwbkmBO64iaaHRTny7WL8Bz8NBf7G9/7/t1n3RPHuvEEV07adv7y+SeDdGuxpxWRM7LFtu7EK5C565tjXiWIn0k09eoIokTXi3eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by FRRPR04MB12617.eurprd04.prod.outlook.com (2603:10a6:d10:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 19:42:36 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 19:42:36 +0000
Date: Tue, 18 Aug 2026 15:42:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	boris.brezillon@collabora.com, linux-i3c@lists.infradead.org,
	Patrick_Yen@asmedia.com.tw, Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw
Subject: Re: [PATCH v4 2/3] i3c: mipi-i3c-hci: Add PIO queue management
 support for HCI v1.2
Message-ID: <aoS1poPng3geJo03@lizhi-Precision-Tower-5810>
References: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
 <20260818104106.763772-3-Jm_Liao@asmedia.com.tw>
Content-Disposition: inline
In-Reply-To: <20260818104106.763772-3-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: SA1PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::12) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|FRRPR04MB12617:EE_
X-MS-Office365-Filtering-Correlation-Id: 65efc173-b3ec-4bc4-9c7c-08defd60dace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: j3IUitYM4/AXp5u0xsRA6GNgom9KdIGaVTYInWhqJxtR7Ip3EZ45CVoNkD/F3gvxlNG3Tf/tI3ymxnxsf2oDSOlQ+2IKtchCFPgooFYjHLamGJKfhEoTUp/UCavRa00fm+9A2f/IIW6XNkQxApmkdSE87tXr6NueKbfeltNDdDvPcnNTe4cSPmFamHtjKv//As+v2y++OKQiA/TendD/CNWyWUeiZ+5OzD7C5yS0Xb/ha/VU0UOWh0EQMqjKCc91062R28IHMPXRKqXjw0Yjev/iivqQ8gCy7G0f87e5ASPXw/jvQ8VdoU83Jcv1zuEmXoVzs/5+KeE7ZaVXQcI6r0nGMvCr9nNh+zCzX5SV6KSf7kHjsZ9kjUSR6oHmYKPHiIZ+aPi2BojbmgaMP62uMbTG2mXhQLixyzu4PuX5MpQR6hb8KnTYvwVq296xoUgVlA1jFIqp960oBKCeoAUeQH4gRmrsQ+dmt1AKR7ZWMNcZ1VV+kox17Wl+XHXuhaof9J/Uj9UUZunDo45B5VuWdZldTGouwzX4C4MG2K8RkWaykE5tW8WIdTSg0oZqDhZM45HAHufUsldfKnGMEamV9V0r1l9P0q8X5+mPTEkwWZcNi8/X4w3+wAKJ16/yAh4nFdgWM2bIF7jgDKzAU1vELzwwMg1R2ebj07TLJwqZ2Cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qVsGRR5n5jFloN4sUHzsLDgbF9LiNZv2oLlLB9kVhmq4Y3XuoZ5yHgCDcReK?=
 =?us-ascii?Q?wxXiYdk2Md35NIfv1/IM30cAt5D5HpfCiQhpn1cMZah/+e3Kpx3UI6OSIeHi?=
 =?us-ascii?Q?LZDi/4XKrzCE4IZzMJHuM0+9//G8A22kbgQ1bXaz+DAmaIJbPRtyTl52C4JW?=
 =?us-ascii?Q?4Y6MRLsChDuXO+kuTbgsrp2VWENf4YvV3PDsvpR5e2C76y1Ha7dDQ2PiqQ51?=
 =?us-ascii?Q?LPXWVXzw1JyTRQgxWF3Vjpbe0o9TZQNzwt24Qv0HGs1mkZJ2zlKhycMyrXvN?=
 =?us-ascii?Q?vzSPQuyDJhEFM6UpVwWsU3xllxZtJWONgWNQ+dh5kOw8ISXMkvtLPlK14AAm?=
 =?us-ascii?Q?9V+P9o4aGDjpfvB69rmrrMcn0tDYA0iCKzBo3HQSMHUBUWrnXXpg3KC9U3xa?=
 =?us-ascii?Q?1NfeA75ig73ZvQcnhkZrWwqKP40CvPapQdjT/AFZeP04AMkP7unZ397jIrWp?=
 =?us-ascii?Q?p07PbvL9/KHLWvgJCn+nJtnZ7yzOlFfPY/YjNCLSK2UOPB6veC3TvsjnM9DZ?=
 =?us-ascii?Q?/ZwDpUtpjmjGFCg69UOPkytzg/LRu+sa8fX6k9e9/ZPRvLyWsfNDHMF9+uTC?=
 =?us-ascii?Q?JIKFR6UXQIwuwoje6RMXM4JmAbfdtxFQ1igZ5ifItokfEO8XGsCIaHBAP7Pn?=
 =?us-ascii?Q?UWbcjK4cWZW4d3Pg6Odb2u2w51aJaFLf419lDW+C76Ncs0zi+4CXvMmezpwd?=
 =?us-ascii?Q?K50Kc59cYUpbVvinbcJmUaA8R82nAuVA/BS5zPBtt4bY9DjMn2hlYiSa95kO?=
 =?us-ascii?Q?75nqJdL/4WWJAeOrEoKf0BtPTd9aLOgzNQr2yXqZpjprAIpBi8sSfoVnl7yq?=
 =?us-ascii?Q?Kk8z2WXzOmGhSvVVbCt2CgkVYUXoBlJ4ds18FNcMGMhz1t3FjZba+YFyEkry?=
 =?us-ascii?Q?5rByoRcDpSYTttJrbq+v2EOuQrMD23nuDR2JTbUjBVAT9U445w6Qger4wzw3?=
 =?us-ascii?Q?0bil4bkLL8Ah84TXctCgg8pZFA+rDqdXV5zes7tpxv3N60E1QV2o5SSnCzM7?=
 =?us-ascii?Q?1M/Z/huwdv390zV+IcWd0bqBDSoxkk/DViLfL1ovzb70V76Cw6JpTa79td6Y?=
 =?us-ascii?Q?k0W9leKKil5rcEf78tY5ErJLK1KTyXpfMSqkD97ELXSedwtcJDSBZFKN9Z1t?=
 =?us-ascii?Q?ggoFGSysXbzudfFBrhBpXtcsmcV+9BOA3CAbsYyg4trHgpkszKGeqlNrfRbr?=
 =?us-ascii?Q?qbVMha7LsHPfwrc9hunfu5dhMCmW4CV16RoC8sxdZ7fzAJBNIxjlAwxymESx?=
 =?us-ascii?Q?G2BHGylgtBxcB5/L62NSmPbl7INo1flrScCMF68WXEWKzlKsKD+u4/8yY5gX?=
 =?us-ascii?Q?9044pW2y72aSztHb8TmIEuhLhzBuC72Wb46jU7PrbLEKQ76tteYZKMyNsZgE?=
 =?us-ascii?Q?H2d9F12K0oA3lQEqd4rKZQgCYAV9sMCPTtDvkW/IFsTI3dl3ELpgZSY7z0LH?=
 =?us-ascii?Q?PtPK4Qr+o3E83RrV+nmxbWRkv0tnnpUWIwitM7hn3AwUu/f7kQIXNvTktMkT?=
 =?us-ascii?Q?DZZ6Qv6A16phTO7/cCLMQFFp1ZNzkd2uc6A+77jFtbd63rCRKrlPWYSjl1eu?=
 =?us-ascii?Q?VF1SdBgP7YiBlVUz8Euop+R3csbam5jUXL6hLktShBy9ghqdJitTTdgQmc/z?=
 =?us-ascii?Q?9B659qH5heploM7gGh2mW0VhIGR7vTZ1eiXqBlkUXBGtFxXRCglAVCUi9XRb?=
 =?us-ascii?Q?lE85zGWzFdv+ee2jhgp7KnFehfjzL78rkoSOFp6u1RjTJm8U+ADXW/0qHWh9?=
 =?us-ascii?Q?d9+LM2Itr2Q81UmYGwAPK91QdtdDMpzTy7OPkkSXIH6o72F6JVhv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65efc173-b3ec-4bc4-9c7c-08defd60dace
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 19:42:36.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tict+vMJVKXTlF5Pfyp8b1Phng2vCkHG1alnDg1RYR6epyZgbm/6/isY+QIFiczbDxY8Z51wkG2FQn0kt3aWybkcLM9g+HosO3X7RXWpHTJglgrH+Ziz5GELrk+0xm4H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_124241_669092_43B70F1B 
X-CRM114-Status: GOOD (  23.78  )
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

On Tue, Aug 18, 2026 at 06:41:05PM +0800, Jian-Ming Liao wrote:
> Support explicit enablement and starting of PIO queues as required by
> HCI v1.2.
> Handle alternate PIO queue sizes via ALT_QUEUE_SIZE register.
> Implement explicit PIO queue stopping/disabling and restart logic after
> errors.
>
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v4:
>  - No content changes. Resent to fix From:/Signed-off-by: address
>    mismatch caused by mail relay configuration (Frank).
> v3:
>  - No functional code changes.
>  - Aligned From: and Signed-off-by: email addresses (Adrian).
> v2:
>  - Removed '-' prefixes from commit message (Frank).
>  - Aligned GENMASK bit definitions with existing macro styles (Frank).
>  - Reverted unnecessary dev_dbg line movements (Frank).
>  - Removed manual kfree(pio) as pio is devm managed (Frank).
>  - Introduced helper macro for HCI version checks (Frank).
>
>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  5 ++
>  drivers/i3c/master/mipi-i3c-hci/pio.c  | 67 ++++++++++++++++++++++++--
>  3 files changed, 69 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e80aa1f5722e..dccc974ef15a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1031,6 +1031,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	switch (regval & ~0xf) {
>  	case 0x100:	/* version 1.0 */
>  	case 0x110:	/* version 1.1 */
> +	case 0x120:	/* version 1.2 */
>  	case 0x200:	/* version 2.0 */
>  		break;
>  	default:
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index b3d9803b1968..becccb1a8cf5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -30,6 +30,11 @@
>  #define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
>  #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
>
> +/* helper macro for HCI version check */
> +#define hci_version_at_least(hci, maj, min) \
> +	((hci)->version_major > (maj) || \
> +	((hci)->version_major == (maj) && (hci)->version_minor >= (min)))
> +
>  struct hci_cmd_ops;
>
>  struct dat_words {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index a1341d66bc65..439578a6eb54 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -45,6 +45,11 @@
>  #define IBI_STATUS_SIZE			GENMASK(15, 8)
>  #define CR_QUEUE_SIZE			GENMASK(7, 0)
>
> +#define PIO_ALT_QUEUE_SIZE		0x1C
> +#define EXT_IBI_QUEUE_EN		BIT(28)
> +#define ALT_RESP_QUEUE_EN		BIT(24)
> +#define ALT_RESP_QUEUE_SIZE		GENMASK(7, 0)
> +
>  #define PIO_INTR_STATUS			0x20
>  #define PIO_INTR_STATUS_ENABLE		0x24
>  #define PIO_INTR_SIGNAL_ENABLE		0x28
> @@ -72,6 +77,11 @@
>  #define STAT_RX_THLD			BIT(1)
>  #define STAT_TX_THLD			BIT(0)
>
> +#define PIO_CONTROL			0x30
> +#define PIO_CONTROL_ABORT		BIT(2)
> +#define PIO_CONTROL_RS			BIT(1)
> +#define PIO_CONTROL_ENABLE		BIT(0)
> +
>  #define PIO_QUEUE_CUR_STATUS		0x38
>  #define CUR_IBI_Q_LEVEL			GENMASK(28, 20)
>  #define CUR_RESP_Q_LEVEL		GENMASK(18, 10)
> @@ -173,6 +183,14 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	 * IBI queue size within allowed bounds.
>  	 */
>  	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +	/* Adjust actual IBI queue size based on v1.2 ALT_QUEUE_SIZE */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
> +
> +		if (alt_val & EXT_IBI_QUEUE_EN)
> +			ibi_val *= 8;
> +	}
> +
>  	pio->max_ibi_thresh = clamp_val(ibi_val/2, 1, 63);
>  	val = FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
>  	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
> @@ -190,6 +208,17 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	 * (will be activated on first xfer).
>  	 */
>  	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly enabling and starting PIO queues */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 ctl_val = pio_reg_read(CONTROL);
> +
> +		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
> +			ctl_val |= PIO_CONTROL_ENABLE;
> +			pio_reg_write(CONTROL, ctl_val);
> +		}
> +		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
> +	}
>  }
>
>  static void hci_pio_suspend(struct i3c_hci *hci)
> @@ -208,6 +237,7 @@ static int hci_pio_init(struct i3c_hci *hci)
>  {
>  	struct hci_pio_data *pio;
>  	u32 size_val;
> +	u32 cmd_sz, resp_sz, ibi_val;
>
>  	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
>  	if (!pio)
> @@ -217,10 +247,24 @@ static int hci_pio_init(struct i3c_hci *hci)
>
>  	__hci_pio_init(hci, &size_val);
>
> -	dev_dbg(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
> -		FIELD_GET(CR_QUEUE_SIZE, size_val));
> -	dev_dbg(&hci->master.dev, "IBI FIFO = %ld bytes\n",
> -		4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
> +	cmd_sz = FIELD_GET(CR_QUEUE_SIZE, size_val);
> +	resp_sz = cmd_sz;
> +	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
> +
> +	/* MIPI I3C HCI v1.2 supports alternate RESP/IBI queue size */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 alt_val = pio_reg_read(ALT_QUEUE_SIZE);
> +
> +		if (alt_val & ALT_RESP_QUEUE_EN)
> +			resp_sz = FIELD_GET(ALT_RESP_QUEUE_SIZE, alt_val);
> +		if (alt_val & EXT_IBI_QUEUE_EN)
> +			ibi_val *= 8;
> +	}
> +
> +	dev_dbg(&hci->master.dev, "CMD FIFO = %u, RESP FIFO = %u entries\n",
> +		cmd_sz, resp_sz);
> +	dev_dbg(&hci->master.dev, "IBI FIFO = %u bytes\n",
> +		4 * ibi_val);
>  	dev_dbg(&hci->master.dev, "RX data FIFO = %d bytes\n",
>  		4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
>  	dev_dbg(&hci->master.dev, "TX data FIFO = %d bytes\n",
> @@ -244,6 +288,9 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>  		BUG_ON(pio->curr_rx);
>  		BUG_ON(pio->curr_tx);
>  		BUG_ON(pio->curr_resp);
> +		/* MIPI I3C HCI v1.2 requires explicitly stopping and disabling PIO queues */
> +		if (hci_version_at_least(hci, 1, 2))
> +			pio_reg_write(CONTROL, 0x0);
>  	}
>  }
>
> @@ -764,6 +811,18 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
>  		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
>  	/* then reset the hardware */
>  	mipi_i3c_hci_pio_reset(hci);
> +
> +	/* MIPI I3C HCI v1.2 requires explicitly restarting PIO queues after error/abort */
> +	if (hci_version_at_least(hci, 1, 2)) {
> +		u32 ctl_val = pio_reg_read(CONTROL);
> +
> +		if (!(ctl_val & PIO_CONTROL_ENABLE)) {
> +			ctl_val |= PIO_CONTROL_ENABLE;
> +			pio_reg_write(CONTROL, ctl_val);
> +		}
> +		pio_reg_write(CONTROL, ctl_val | PIO_CONTROL_RS);
> +	}
> +
>  	mipi_i3c_hci_resume(hci);
>
>  	dev_dbg(&hci->master.dev, "status=%#x/%#x",
> --
> 2.43.0
>
> ==================================================================================================================
> This email and any attachments to it contain confidential information and are intended solely for the use of the individual to whom it
> is addressed.If you are not the intended recipient or receive it accidentally, please immediately notify the sender by e-mail and delete
> the message and any attachments from your computer system, and destroy all hard copies. If any, please be advised that any unauthorized
> disclosure, copying, distribution or any action taken or omitted in reliance on this, is illegal and prohibited. Furthermore, any views
> or opinions expressed are solely those of the author and do not represent those of ASMedia Technology Inc. Thank you for your cooperation.
> ==================================================================================================================
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
