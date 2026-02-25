Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EFCFD45F9
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Feb 2026 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WRFN96etBb1JiAqWeTvnKIpoc5R45xqZ/qAHcxzCQg=; b=Qzyw1djmcuSvHu
	zF3oE55rcxG/vCWgqDGuCIAeuYA3SNflQeJ1Wk2EeArBtn6+M0gVYkrjkYnFZ76i6fLepAiAyzf99
	s3IGuYA1Nl3kiAvq32RQglR5PTsXKq0YEmbED231DviH44vuq3qa8iiB/kLPRmnuoLA57KwK4AeUs
	OWWOL+lM6OSvk2XrdfSiaaRD0kH/Q8DMnI9s4timjQsmn95BVDvdiczgmj1iYd6KZTfUeZZ/dO7We
	ai2oe6H0fhi6h4ahzXNtafWOQiGDAiuILHhughJ3jYgPnB2vssQD9RPYyotppO8K+JZhPo9rJO6fM
	HgYRKGobsWWjJkB33MiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNwT-000000052I8-0cig;
	Wed, 25 Feb 2026 23:05:17 +0000
Received: from mail-westeuropeazon11011026.outbound.protection.outlook.com ([52.101.70.26] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNwR-000000052HN-222x
	for linux-i3c@lists.infradead.org;
	Wed, 25 Feb 2026 23:05:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEJ2Fja+Q2qDE6qib+qGEWL0pNWFHmVivOAsHaQZ4S17b/jPU7X1RQNLTqQPDlXFWCsWL+bp1O2LMr2lPjmKMwXh/yumBC08jXLvt5xEmLBCQVIgUj38uokrfeYoXWXiKnJWQnAKlffYkUTtxn0P0H8kDI2E0uOQX8Uw4nwboKsf5P3QaFjzktFgYSCLpRueZFAs5+9qTcfo48+lvocztQ5U6vwzdLGMQ3Cu/jb6pSrXEyld5yB/s1fqG6PLIAuqTVl+eOF5C1NU6Jnh87pNmR8lSJa2MT5iSdXwzzqxSTkIhYtSr6uWvDqtp0UdwScxhHIoOKPXuV61InFLg88Tzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToZNko8ulHXKYewgAgaxgpY4uaSWPaEUnU8wXb7wZp0=;
 b=uepIBgdtjKVZ+S1Gbyf8GPp34krEE2SEAEY00DNFL7cJiJaAITIhmub4pjUl0ulKfjIxh2UUFHy+FO0v7kkMH2ufOtOa+Dm5D8eKDp1ap6flsk5UIhlcTxmyNSPkM/AVWd1vi5ODZ8NzFRDibZhXrUwA5icFrvN25SomLN8vZdCcEO2UFlclUbNOg1oBvBf2zTMohodi0IZCJ6h2uUwzYpGiKk/HAlaqVdRBDmy+0FEy7WE3f3tpUWKe5CQckbPknO2ejo5MWSRuIEXLQW0WWBhwUpNkd+Tt4RggiBU6k4feFbsADKvC3JJZYDbsFkmogt74cNDLvnfzDVCbDvtUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToZNko8ulHXKYewgAgaxgpY4uaSWPaEUnU8wXb7wZp0=;
 b=SjixmeuorLuBvBDOEXfpgyn6QM0Jpq3PTQLP0r6DGlrvRzrteskjMnyDqzdDN/jZAgOHyg4VpC17xbraNelASCuHKX4FC+kLrZ6ll1UcNFg8VwOJ88/UegNzxGsiaJ90+Yw4v17+9gHvV/4jH4JX/r6UZ+4FvyYfXGHcor/43kNcof1toskMQoAMrs/4EdnuScA03yiOdNHR/f8+iWdpC4MXlIE88yo2LkBSmTGgKbEbdUiUl8tBypZmOeLV/wQjxOE/rv9plXKrqaLUSGPSyIWftQYJGWqU1p+gkonZ4iHljNA6iYWVRlQvs5nPQnt1DDgoyTv8lhg0MwLKHPVayQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10394.eurprd04.prod.outlook.com (2603:10a6:150:1c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 23:05:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 23:05:09 +0000
Date: Wed, 25 Feb 2026 18:05:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: master: dw-i3c: Fix missing of_node for virtual
 I2C adapter
Message-ID: <aZ-AHSkUKIBtb7ZZ@lizhi-Precision-Tower-5810>
References: <20260225093755.3696236-1-peteryin.openbmc@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260225093755.3696236-1-peteryin.openbmc@gmail.com>
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10394:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0d0fa3-1e0d-40f5-6ebf-08de74c2525e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: VwYtqr4KPqLb1OJka/IeQPjINW/vc/6Ck4I+HefuJpa2aQfdggCwLMCyqltapaa34UkLJPQZ+iNMsqYtFZE+pnSthB+Av1A/pojltbLfXWMylYhOank5xpY2wDmDm8SKuKxokRnR2KCpYfUe+zhuTUhKs4M6+NAiAt2TW0yMBDHs+NbQ8rpiKvyW5LJ2qRld73ALGvylOIeADcvZP4eBBGy1IJMpQ9SxU+EFvf2Ixh6m2Kb/t8Paxedk4lN8NoPpRm9HnXu0JOlrbfhzGX34SRjHo8XTNiODy6VhlUsyrfJUroACb0mU1JFkGHxGTMMdwxfbf52dfzADZkdv2F1MV3x03b7/3JSHY+sBobhmEscz9QMnv8E8twHsV8t7ljB1NIXL5hiH3bqzGeyJb8Gzjo2PgN4stFRNDpjWjY8GFneZwFk42zkSH107FOj7z+/sSuG5z6iSZr/XNPi1W6vfKxhnsEYvWVLbbWn43bkbfgA/tVawqnG3BTr7okmjUrUKQYkc9qKVvcvtuh3iZOp/c96LA6uV1jhy8U4fZ/vNmaEulAYOYMI6zbwvtWSADzraYDX16+8U4oa9d/ZeqixDggxtt+pa+RG4iyF8RlYyJ6nPC82a6aADtJx4XNf5g/u4g83bCBDO80LsDlF0/BjzqlyEyp2tzEanS0VZiO8cByCirEFsDH7/C88WUJgL034i5i7DXnX9e0JnIT0QZIPx+8PQ1RBAU1biqHjdnOXaCkedfsdox6BATR3zb7FkwhLzvARGI5uo/S4nnnw6gNcfoWzvK6hEQwludnBH6onrcqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IytAGZl+aO7j/5O8+Grq63pCCANgO1sHhYpvKA4P4MayVV3W/uTcc8kDCYzo?=
 =?us-ascii?Q?X922AoavijRDxndUAl2Q3G29OXhGvUwPLaIzWjJH4/QbcJU0Bcn/JLhIY5qI?=
 =?us-ascii?Q?WLmMQiWpBGKQCHTKB30tUUli7yM8040KoorEeuex6FDAgXebrTbWCiOc7wBq?=
 =?us-ascii?Q?qfR5c01vuMYPlweatgEzK21c9snFH9F0sHhoPu0DuyoQcMEAlCS3qwRZdN0a?=
 =?us-ascii?Q?IaaBAuKFZEf7P3IzhkSQ2pRwioqDKparSFFJOK2oCkURTsigZrFrN6bXq9ZM?=
 =?us-ascii?Q?sujXz5pJaTT3GzR/byrpA5oCH2lV+FgFQuJ3pc50UigwXKwxmBwTzewI/HZL?=
 =?us-ascii?Q?TZy2JRwVF5yltiixaAifYXp9MY4v5MMncKn75siytgo8ijHobTQeY3dNoe7Q?=
 =?us-ascii?Q?Mrr5nCfrt4nNzKMsADBMQ8GMcUubUa2NQOjCyb8cYJ8OPA6/e8tOB2qkPCYw?=
 =?us-ascii?Q?5AEpMwjHTxDQyVuVPa7VyanVmea1JyoTv2vSCJVPhNsjobml2pglrcxr87Xs?=
 =?us-ascii?Q?I05I1ntwXGVw+onNiaYs6mhe8ODXZm0usPb10Fi+Koenn69yMZbyfcEzIKmc?=
 =?us-ascii?Q?/zxHrMj7s41CZxKBa5n2VsO2m5T3A0PMKmG5m23f2ZCMxY7A60GMSYoxpktU?=
 =?us-ascii?Q?pHg6z1njkgKj3rfdj2sQX3jBAO/u8eBIZ+wwuT3+i+ZYbG2ypOeit5oKcvg7?=
 =?us-ascii?Q?SIk95HogJu7BMfuaZ5l8QhTvOLITbQUQpyJ+cb/vPf8yEPWpengfLKbPmyKp?=
 =?us-ascii?Q?TOTA0iJ68/uRsXDI4cV9/sw6j2BEyeRd/utEW1akNYM+HnXRHDdIL9p7SeIz?=
 =?us-ascii?Q?eJ9sX9UUz75UmWIrZ79bWG/4/PDmM7fzini2FjjlTVhZLuWE4zSnsomYWhz6?=
 =?us-ascii?Q?i5gEt0fsKyQ8f6fMf2DIUiFrv9jFgJ/ZbB4luwSp0IR+VXqyzyus8gZXPnoC?=
 =?us-ascii?Q?BFYS8+qUoJYgFrcvaQvuwWGwJTnKrHMMSr0ZxovTLa0LrWw86IGhcsd3OQcS?=
 =?us-ascii?Q?m+tU/T35vgncwxzs+dUVghEtGJ6Hk2AGAVII4HNLjh5JqqLf8ty965NI3nkk?=
 =?us-ascii?Q?JVxBPxZRvDYIVpALINJgvHiKRoOPm+l0Oa++9QC9zmSTZYbxPl8zkDWMHAe6?=
 =?us-ascii?Q?b+YikU2IMuaM/nfnTRlbzNVFerNy5gIhGyU0Lkr9VCHBSxVtdEHZz5l7mWkf?=
 =?us-ascii?Q?OQhBQ4jG6pwcKPzB854V/BU9pT0DXDpeEu1H/UT7isEYBsIT9R7+c4AoQqZt?=
 =?us-ascii?Q?o2bOhG/HB426KK8tvsGqB6WzCSs227H/z32H4iclhcP3trsCWQwwdqcbtdEa?=
 =?us-ascii?Q?AwmzXjzVZQd1iAv8Bv+eFMa0+ZvEcORtEWk8hiiHk4iKKvZK4/zhX/5jhrIq?=
 =?us-ascii?Q?Q1hM08nqF3i06ztfoeqh86JBuFbd3J8y6J/r8etSy7zn+loKTsfw2xn66lYi?=
 =?us-ascii?Q?w4FrE6d9DnX8fuQyH2ddzb8fk/vyXEjb1gOC1DbVC5f3ObkoEfiDjsqSHH93?=
 =?us-ascii?Q?os1H/OC8IfTkVkJZAnvDQf3gBBT+rr7f9sNsTPfzN6O8ellQDdY22dd7Kiyn?=
 =?us-ascii?Q?J2vzzMdYKyvjIpT3jNbIAaU3t9UBPinKWfhFxXJRwnZZP/K5288ktYToqYji?=
 =?us-ascii?Q?O2zl2/Tju3S8t5UDQ/KdI/s5ayZuzn6l6S4tpsd8zn/ZjwPYpfgogLmshyJh?=
 =?us-ascii?Q?n6SuwTrFEgC4ql7LSS6ds+SFs3FROzg6Tbetdy0NWpVOZMk8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0d0fa3-1e0d-40f5-6ebf-08de74c2525e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 23:05:08.9970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8h2xq9gIulD81X3dlvTXtJdsgIffOtZThXll9tIuMKgaumYjW2cWASIYjAzpH63J7B6qDNTWwQktif/y2QS/ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_150515_539707_8DFA8ADE 
X-CRM114-Status: GOOD (  17.74  )
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

On Wed, Feb 25, 2026 at 05:37:52PM +0800, Peter Yin wrote:
> The DesignWare I3C master driver creates a virtual I2C adapter to
> provide backward compatibility with I2C devices. However, the current
> implementation does not associate this virtual adapter with any
> Device Tree node.
>
> Propagate the of_node from the I3C master platform device to the
> virtual I2C adapter's device structure. This ensures that standard
> I2C aliases are correctly resolved and bus numbering remains consistent.
>
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>
> Changes in v2:
> - Move the fix from the ast2600-specific driver to the dw-i3c common
>
>  drivers/i3c/master/dw-i3c-master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d87bde3f7700..adf618d131dc 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1659,6 +1659,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  		pm_runtime_get_noresume(&pdev->dev);
>
>  	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
> +
> +	master->base.i2c.dev.of_node = pdev->dev.of_node;

It should use device_set_of_node_from_dev();

Frank
>  	ret = i3c_master_register(&master->base, &pdev->dev,
>  				  &dw_mipi_i3c_ops, false);
>  	if (ret)
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
