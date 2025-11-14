Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA5CEACC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 19:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ACAGT+nN4mGDNyFYVJyHSkYYrIBYh3qWcVPpzyY1/I=; b=fBahV4yQaNudy2
	snhqPjlAmm/aV4szDL9UikQ8tj34bltBznBI8m6guQ0Gph4cG1oMhBR1b6jmf4OvO92VkP1S9R3Uo
	sw2x/qrTmpLNTsK+rNX5wcxf/o0q6i6DF9S8bLSF1zLtxi5C4xil/a88D/kt9Ek5ZRzvoEK/sxDX0
	GTmWlR8gkg4qLBe8fRcCE7jKqghYdEnFKwavNU3i+87FAaEwcjMj7cR6BS1FsjWSe9QCRkTBQyhrD
	uc13nxYNQSYU1ZC3zx9hI6byDorngA/bCabnwjQWdH+2q5mQuW2o0hooNPvMzDm+YZftRF3XOOYpi
	X5EJVNvBOgQSqE6rLi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzhj-0000000D1wf-1Kuh;
	Fri, 14 Nov 2025 19:43:31 +0000
Received: from mail-swedencentralazon11013036.outbound.protection.outlook.com ([52.101.83.36] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzhh-0000000D1w4-1Dj0
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 19:43:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebT6iarbuMW2KYa4Kr8v0aMwTQbPHYpXxdfqbbZGySOhmoX4nDknkfM7AHQ5ynb6yqUC13fg6stO21mNM9JoWUxE9PsQEhuZ4lq7UBzluzc+lU2gdq+KmwbOQFpxpPd9zDPos6wnvR0+75XEhOCtYoIyesZqvmaqqAUFhnsv9YdDvGMQewEi45vksoss+RncGNHMLL2/Nq5rBzYCqk/BK6vhgbKkPVZsHfw3vtqx2kYdsH7Ci80g7bsxY3P1ose9O4P0sodx9MswfBXm1rVk9JtkN25vWpwQNYZwyGLudNsmwCj5C65RK03KJSS4hdv/jBumKcy8lyFsmEe7Eqab6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbrYmyi349Y9Um5H1YVHDXYRy9jY6OGv9cy6qULh2OQ=;
 b=LArQG675Lw62tZwbP0LMJ+RxdFffC/UpLOgHmclFbOnbWNO7DfMIYr85Dp/au85jmG/4N98qbymP1cpVhKiOns/5wbZlNk0Rlkdh3kjT09G8JNE4eKn4n7XUG5aYZR5JQiDnVVcV7erco/utBvsAGCpWhIj6iOosdHHVOhMCw1FbfmOevIryb2aDAeLK8g4wC0BAxI1m0MZT0J6M4WHJ20+wXAOopu37OLQUlVHt83uVOHUBlXNa/UfD7vZFXqkyQ8occyteESYK3n1IYUxmWI5NYWkk3THhwcTQ9hmheDn4mm5IVbwZnRQ27qjWExgW6pBEIuifGGRKCHgC2n9XmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbrYmyi349Y9Um5H1YVHDXYRy9jY6OGv9cy6qULh2OQ=;
 b=YvalaPwPiLFX7TNGNlRBkLqsm5k/jNqJaq49QPuRQ/miEM10DC29xua3Q385bydB49LQ96lcXvR4FpOd7N6ce3mm9ExX6uUMQfFAtwHUMvtph1+FHXL81u3i7D41bCVdIyv2cOOEU4eZkpvg+ZYyrOILYWKohV6ewv+8EJl1g0q9zJfdRqtDksFfhkaGmrwWzG76yMOBoroSwlKHfF8q8B7vUCyZqVXesjabwd56JwYpK7d38QUNFKG5TzHQUjwIQid8sRibRa1+NH4q/xLLbK82jl8JGY9x6gjqQrF4TKHg2xeccv9fRWkVQyJjyFsXxHhuuuoJxYQ2FXuqkCzKFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8475.eurprd04.prod.outlook.com (2603:10a6:102:1de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Fri, 14 Nov
 2025 19:43:24 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:43:24 +0000
Date: Fri, 14 Nov 2025 14:43:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 01/13] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for
 Intel controllers
Message-ID: <aReGVv59ejHGVABJ@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-2-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: e17c7243-c3a5-4f75-bdd7-08de23b612e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J0LWXBC2/SEQY99yfV6pGpVsZzOp9sMsskd5Y5HHMHobRAOkxIoc7/nByXQp?=
 =?us-ascii?Q?dKtla0GAc3ZQ26oOJ17/mWL6bzGnmkbOFF8i1vKTKTs0QmXaH5z6yy3h2yOb?=
 =?us-ascii?Q?YdcqsFvz8mK9CfdsWIbnELRCdSxr++0Q5Xr2MiwagPiiMrQZLapu1gBUzElf?=
 =?us-ascii?Q?wdLIdoYo0XLJ71MAAP6Voxc8MT7IsZoqsuRjLAbSq1YrQW9e0HpK5DD2EFFo?=
 =?us-ascii?Q?/Kov8qLAh02Qs8+sE/8WTHeD5Y9umw5EnE24mR5Q1uET8VsqC3A4AWxdtDFL?=
 =?us-ascii?Q?zHu5TtIIi5IRLUgGD5QpHRQh63yYECFJw8BoUoYERA6sAErp/olR+zf7x4bj?=
 =?us-ascii?Q?FY+KBDokH8TZ7NeB4NxSBFx+OD8rCDr8a9v0RZScULKzfX3PW4umTiVgpr2h?=
 =?us-ascii?Q?vlvDMyMIfCoO0PkDrpmRejRYrjEu0UOEoKVRyKLCftRudS36gX3urmLvG8U2?=
 =?us-ascii?Q?gQiqmlcoPTLAGBJ7IYrKuJmHiC6pLNbI5HDJUxKfGp0w2jRiRAwGaj8PYLuC?=
 =?us-ascii?Q?BCk2KdfCVT277cFi89Pe7jAdDQcIiQ6TJw1qEEPwpB5n/sdOQMScKA128Kzf?=
 =?us-ascii?Q?kGXHjSq8Slc7M2upZ5uLcKbWEwFhZLkcnAdTRYFoIzqd+ZyknQ3x85VJJ8IC?=
 =?us-ascii?Q?Qo32/w2yI+nNUagdkbmv5xpMIDp5LG95l3T+xShVs8CTK/SYPzuL8PyualI8?=
 =?us-ascii?Q?Ou75E8IdLJypkaFA2oXzxfrdE/r+xz0/xqMChpiNIw6D0dxcCbKgGMA68Zsx?=
 =?us-ascii?Q?dckkYHj9fuDIkc+5w+PE+ByQMJsZuzYJe2ui6m7738lM6iDOkIisWoKyyv0d?=
 =?us-ascii?Q?wMjnhGEtJv1jNNHQYVnDWJFgn/oG2MO3bQQsZFL6QIv+kKH70YTVNzk89Few?=
 =?us-ascii?Q?GfauRskQYk4lkdRvA9qNu7aMtE+UgAUs3Guqa5ljqJID5EA7fkuCWNerln7u?=
 =?us-ascii?Q?sj5MTwSlerLohnFaI7Zt8rjNDE+uOqEDzpasP+WyO04t8VZAZOXcHh2fkT0u?=
 =?us-ascii?Q?w7C54igGy/M9vnHjT3Ag5mZv4swa6utSxlKRMoohTpdu4aT5Oo0+AJCKj73z?=
 =?us-ascii?Q?3GMs+J3BJpOx+ej5chzl4FpaJKRO2tAnjkOozZl/P8EKNQj6W2E1lDan0Zwp?=
 =?us-ascii?Q?x6y/fvYIJU9D4+l26tJAas64rxJmsbf+vcs+XFsY53dTLhxFfr0rwIgoojHc?=
 =?us-ascii?Q?6nTESEaDJRJMXOLsYqtFGHvVUIozGuodFTW0ZP/Onv5SBXl2udj4NIT9ti8D?=
 =?us-ascii?Q?t+feWa+R+GKa0lNo+z+WSRC/ZZIqV9Knq+IyZiaG3uIdSsDteoXMjTuOmkaY?=
 =?us-ascii?Q?2hIDVnZ7kiAQMnIGnxMwM+KsmWR3CJMl0jpR+EQnfOS0iF75zp6jrFA9EyTs?=
 =?us-ascii?Q?zTMRe4aazyssSGAHQpUUtSvQsKiTSHmza3Zpw70kfAqU5K1Xg620U/fIlyKG?=
 =?us-ascii?Q?xkvV2T1+uT7yLuuInbnTdph295ievmljnCFeQxfD5z1CSuDtT0l34bjFgjZG?=
 =?us-ascii?Q?zKuM16iEvw7MO8mDw5b/Wo9ZM95VU4p+nAS3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q4iukodWSrIXTKMN4SGv/7UuMQ4UL6VB2E20apOeDs24ZEAthkCOp1hJKEO8?=
 =?us-ascii?Q?votZkc9L2+dZiryA1XDT71XBaJ9kvnq3p69f5SuVrE7RoRCQ08i3rXJtgRFQ?=
 =?us-ascii?Q?VgpsLyoKQz38PyecOiOFNGTwC5v6/6peo+xJn3g71FAtHvdog2hO95ksQf0w?=
 =?us-ascii?Q?SdFQG5iub9FHdevUtBZ3PhP1NzZqwfO5M8t7O6wpw86SRT0hWSf44ihdg548?=
 =?us-ascii?Q?mR4XZcyx6tLrOcjB8+elCike+vDxVInl/3S4Mcvl2leo1kDJOIaw2c2R9MCy?=
 =?us-ascii?Q?ikiLAw/ptuRTCkOhlQv0vCcHBn3HMGvqWaMnS2qYLKOOgXb6lDJqvERQElUn?=
 =?us-ascii?Q?qJwFhofzosEr1JJcMbFDVcUVF4iBdvF2+gHQySrDfrhIqN+u3J8inG7hHseJ?=
 =?us-ascii?Q?0Ft4RFMMD3sG2qplZm+zLxqDqjO20l0FnVWGgWejL2ZQkzCcMZDwlKqBDss4?=
 =?us-ascii?Q?nX0bL55RAx5PWIYjCb146fQz37EBjEPfCMVpI2c7GS2tQoJPo3EXoGH/9+VA?=
 =?us-ascii?Q?lHvTeg9J+yQsE1oBhDK6X4pIwtHWsAZI4U0aVxxfFVefZ6smr4xYe+py2T8P?=
 =?us-ascii?Q?hw+VKW5W/t2nzFPQYNUOl8q/x9TrphfrjG17SOQ7ZHcbqIADeYXZvSjTL0AF?=
 =?us-ascii?Q?BeGaWsmSE3FuvjnaiW/R2JgAfXct93rxmP5W6b0xXf8jIcgp6mFXFNiCIYvz?=
 =?us-ascii?Q?8wu6aFQ9llozUgPebLyXdyxaPzkTuKc9dv4FeHwMs00rqvibMO8KTLa5zUxd?=
 =?us-ascii?Q?SryDfxjlAyU0SoOtgUZdfeR9pPlF2C0YffI8K+cdyeUjMyxK+0FsX91OdfDF?=
 =?us-ascii?Q?E9XO8ATVZJ6WIudsuy12vQAeFmnpFoq4XF7g7gxjrNu6N3FzSDayRw9i/Kaj?=
 =?us-ascii?Q?CgvQ2fLquFKQN2X/XplswY9n4iM41We0RnT25vxfAckXxQw9csOLBmksHVyX?=
 =?us-ascii?Q?GegYR1Cuq/rMAGjx3v5jXBLLeSwMECllTikUZhv0th9NN0q/IEESq/co+z5p?=
 =?us-ascii?Q?s6AnLD2Iq2OByhXuyK/JTGkUq6aYbsM6FY8CkI2+zSdFYjK0w4UlP13Do5Sc?=
 =?us-ascii?Q?w4snekuzRTlJPBAgeE1Zk7cmUIT13rf+wAr4tMqIYqrC7mPaFvVVNl4FF+/9?=
 =?us-ascii?Q?gTyZMfmuj621yRWUqTtkAhQm5l2H4KRhI1clCpA52X6uZjP+9MbAEfGLJ9Cl?=
 =?us-ascii?Q?awe7QfwQXckgk1OQTDzzkxNWwBeiu7EdkpPGJM6cxfaWAcH3YDhb4UJbb4hk?=
 =?us-ascii?Q?/p0POPcdnR8ZFPKulT9Oc+UZFK5hcKz89/OfzkpC+eaSzWYchVeOHyRhjU/R?=
 =?us-ascii?Q?PtFZNz7HHD95Aw1pwmizSlvk3g5lV2EVX//BlHoqgW7CdPFhX8ESNDh/Rod1?=
 =?us-ascii?Q?wIkEtk3SOODT3kE3/3OI/3rlIqOlzzkPxtJKw4KXPzGkf72XZZ4khtuddt1z?=
 =?us-ascii?Q?bc+yrW0kuRHnF4oMqEMEwg+AX5qIMqeY8t0Hokjie7Kdxc0jW3jAAotYQ/MR?=
 =?us-ascii?Q?ZpzB/6xVhy19WPKHaFygD11LDazR9Cu67CUPchgBxOMLVmqceMTk/xUvwTpz?=
 =?us-ascii?Q?KANHDRqzZIqAzGdDIF4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17c7243-c3a5-4f75-bdd7-08de23b612e0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:43:24.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OykYZJb4EujHo2ueghcRDLte4O5DvJkS+jHtc/lSuhS+GiJSAaaB8t34Bdx0JDZQYSN/u9zC5f3NJKA6i7uyEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_114329_329957_1BF52D7F 
X-CRM114-Status: GOOD (  19.75  )
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

On Fri, Nov 14, 2025 at 08:13:44PM +0200, Adrian Hunter wrote:
> All Intel controllers support 64-bit DMA.  Set the DMA mask accordingly.
>
> This is needed only if there is no IOMMU configured, which is not
> recommended, but possible.

I think DMA mask is not related IOMMU at all, It indicates your DMA's
address widith. So this sentence is reduntant and confused. Suggest remove
it if no specific reason.

Frank

>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2:
>
> 	No need to check error from dma_set_mask_and_coherent() with a
> 	64-bit mask
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index dd4484eff2f0..3cd15ca7d391 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -36,6 +36,8 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  	if (!priv)
>  		return -ENOMEM;
>
> +	dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
> +
>  	/* Assert reset, wait for completion and release reset */
>  	writel(0, priv + INTEL_PRIV_RESETS);
>  	timeout = jiffies + msecs_to_jiffies(10);
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
