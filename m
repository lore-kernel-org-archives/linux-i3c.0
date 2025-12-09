Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAD4D3B980
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c2Y0Nsv3mEhl0JY+n3ngzm804xY1ZUzaEH+Nmg/IaE=; b=jF25omYJjDDbZA
	zSqgDlvmZQH4gdsk54Pc3oS9WYjHokN4TQJh+Yo0VlIziJPdvGal7dVC6PTrh+/K0bgdUvzrY9p3P
	3e04PW97RECPfqEYpG3sEYKbUdji7y+PpWXo/T9Vhm/I3dstFI3SzzvBTL0tIYdQa8DWun9B3mgoz
	MSbDleY1cRDSUzXbik8AJ8wNvIY1H0swiV8a8xVddYIH1BZLypp1hFEJbB05kVN8M/bLjSjDY53lW
	VRcGsKoAL3oHJX7YkS769XplQ30wJVhPrV1LdTfQzO4D9Dqm4fn2Cde44tVeulJ7xJ1I3uDJwLxVF
	FklYLqAiFeIEz0Pv8MYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0TW-0000000EVtB-3gIw;
	Tue, 09 Dec 2025 16:22:06 +0000
Received: from mail-northeuropeazon11010027.outbound.protection.outlook.com ([52.101.84.27] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0TT-0000000EVsL-3MiA
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 16:22:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOCwdgcT2x1qHyMtFR91068e/zOaPJOa6FPye8N4rSQMOZAeIfDB3YvN8QH1IfrKTA6LNDQXnGYhd0vfu0vxgkt8QLkQn1GEBBJ13jucd1/e15N7x6UsjgnRazidpk2euJjX3yum+675ZRPKLcOfJjHs7ovoIJ2InKeQ7fqhKVH/PzDusn/wYtpGhK409KEYXOgVcckq8OMAYZrRLYwFScMoqblpbc0HFzIpipgPNDZ6HaWkF9yUvXNhsYcSn8rIRCBVG7OS5aNCcyPhHOgozTH9T2rbpm9vsPnABpahghlxrePTapOaMJ6dKzCsMzrGSGOYDZlv/GJ/m/4B2sg4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4dGnd7o26DsHSfPNjDs+kr6Tg1WwVL7ypzz7MY6If0=;
 b=HwLZqaeqeT6USLISQ1jmkPifeJn+NohH/Lg4WRXn3349hdsRBCnmLisuahCIQ3lu6vwA7qPOrml+YjxQdYeAuNjjNfGa5VOx9/ojDTxJe23J7fGYDTXv8zEZvDtnkC17XjvymSOJVKOd7L4XRYCOXzSNo4eRwBCSsvQLTXV02F6AsxL6D3Xhjmc+ubqhEGdL31YrwP0tR43DrsQfx5xHBJPeO7goj9r7/0uLBi+t/njgt/TXbSFBq9MFgx+h8gFJpJ00yJvuFq7SDlsz7jqcvJofK+I7J9BBs7shlsHty+1jAQ9NxIEQDbZWc1AOkExOV75BmKkmcBP68k+Tf2xBmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4dGnd7o26DsHSfPNjDs+kr6Tg1WwVL7ypzz7MY6If0=;
 b=D677dFoHZlcv7S+U0Rxn4VTOw2HanZZTuliI0guMeD1GmuowTqYOvDwpJJiyInafUMzkB4tEH2kasOXOe9Bu2tJEMZmYMwSGnMkCYrzFMnQW5i0ltT5UBZicmN97P5hSMqCr+IlITwHb+XlhhWmudCbQ2Tw6bNHRa77tNYFZiR0bpwr3zEJgzg5f6dGK/cJf6XC5MeV8wYuOPN9aGgIbZ9HWMd5uKHixkuxuxIw99UoYtyTW300ne0/VnlTE/MxDH3yLKuT4hKlwcxvaSWrrx2rt/lTnK610PAWp68AOXg8gb3rgqT70ilfCITHBGf6IyEVLaA5bPJW+fopgkeS/6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:21:59 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:21:59 +0000
Date: Tue, 9 Dec 2025 11:21:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/7] i3c: mipi-i3c-hci: Remove duplicate blank lines
Message-ID: <aThMoGmjufQ5OtzU@lizhi-Precision-Tower-5810>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251209115104.124156-2-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae6cf99-561f-4f9d-58c3-08de373f13cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|366016|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8Js+n9ngAuezM5HgNEivPC5V/BBQA2s3cd1JeMsUXsHj8uBVpvZFd9A6FmK?=
 =?us-ascii?Q?Rv4Fg7QNXmIER/jhGk3xKJGIFepleDKS1U9ktnnoR6JtWmSWZbR2/MdieVCP?=
 =?us-ascii?Q?HQu7bnV/GFVSbixSCIDwRkSxz65zCwcj/GBu16x6tWX/6GGToJE2wwU3+xjf?=
 =?us-ascii?Q?tdNw2vigJNrJbn1ulSaQHvZdPuKKi8Er4PyhXmVoFU3zydkucb9k1AnvDGfk?=
 =?us-ascii?Q?LVK1FeElgZ4mc6BwqGwUS/ZYtqbW7d9xkTx9bope68RGbaErYFZ8hMxQ9o7X?=
 =?us-ascii?Q?wzWHQLRPOa5ZmYMbQX3dqQ7gL2znKsbs3FumbpyiDttbqfXzFpm+qxzAZJyQ?=
 =?us-ascii?Q?HWNaWKMLCSxLx4iE2JrYW5WND3Zit4w/b3VWbzfHSfT1PD8C8uh06L1R0vLL?=
 =?us-ascii?Q?EWnq0kGuR9hKQB8RFhudqKRV8V1kd3C8AHfOIglellcWiCf6yHh8Ztfeh95B?=
 =?us-ascii?Q?6qZhy9neTOAMIDas3vATgA/PhEXJkG624zlrMUSkMchrqHPMHKuJUGuyRA8P?=
 =?us-ascii?Q?Mu/sLQkpsvU0qi2uAtjV2bgMhJkwnBPv80E7GOY9horAcmNU90coawF1gEce?=
 =?us-ascii?Q?vZio4f9JmasZQ3nz/XUjpdZcK7lYvc/fWYqEfRdf7cLhRK7vSJQLD31dEtes?=
 =?us-ascii?Q?w1H5BR36Qw4Tluwz1PBFBtrhRaDSGh9mX5FXT1d4SEqMgxXuTywy+x8ocK54?=
 =?us-ascii?Q?QzKK4eLqhhGs/Pbq5gVQ76JuC1vVId5cXjzr9GhUN/wRAhFfDChfHzIefGR0?=
 =?us-ascii?Q?6aI7I2HR72Qa/vPPTwhgMqggsuRB3tcTo+NjmJoSoH5LG7szn0+7FPFJCU5O?=
 =?us-ascii?Q?Jaeknerqg0idytMuonO75F7+HrpUTWAdYTZIzVgwjy+XO/Tf5WXnVPD/lOO5?=
 =?us-ascii?Q?8KHEPGcjzKvPk3Kz5ORGfQsQjmr87IcEPy/Qywd6Wis23nc+TrkihEr6Gq66?=
 =?us-ascii?Q?dmbkM9fdSvilgEYpQaJk01lMsOTvEbncx/Vf7thNVE5IPSzgnO0Jx0zLKnKC?=
 =?us-ascii?Q?Zf3Iweqx5A+TP089H3tOTSAIUdvA2z7in0lr2lBhCFe9/cuoYss30H6zMWuz?=
 =?us-ascii?Q?QsQVEEhv4/6AoxnIXE8i998BzrC1f7aGThXoNo+OjLeW7NbphSAPbn/lUVrB?=
 =?us-ascii?Q?MdeyFgGxppmJNwkmoJFWKg/SRo1CNEsYATi7BigiTLBY/pHfSEIrDP3Yes1q?=
 =?us-ascii?Q?WyAW2EEP1lcb6cMRfgUYL+96vjJtbSpAtiY5Wh5JNu0vF9sM+u+TTg5P1Esd?=
 =?us-ascii?Q?hkMMkJKT7MGa0lczxLsft8P5Qa0F2z1SNmWzs7Q6PkJsRY4Qxl1U19lqexhd?=
 =?us-ascii?Q?6aV7En9KHMiGkNg7smMG6A2UsEXGpADQ8+j7pM6mEnMw1mc6OXVYUwaD8N6D?=
 =?us-ascii?Q?Jd+DZPz7gwTYOz6sdIZ1G2qHqmZqhGmUDWrrfwdEHG7bduQ6hqMS5MysKmEA?=
 =?us-ascii?Q?zH3xaWi9CNVzc1FpTqHbrtsCqZwTsv6bonv/VJy4u6djm02gadxhpQPI7NAC?=
 =?us-ascii?Q?U0FcOKP1ges6NtOkJ0NImyX6cOFj7l4ztAX3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qeVktndpSI1EuavG5/At+90GrxBMyWyQNXWe8ceNhvsqJPZ4T4hor1BZ2xh?=
 =?us-ascii?Q?VbCE6HP8MXCtRYdmfbMjIPkRR9O/0z7DQC9KdDoGyGLFL3qHJLx8KFoQyvNc?=
 =?us-ascii?Q?qMbM4XiEo0JQGdw9bdvGSLwYM2VToTV/50ZQYOcmmk/BauaPXp5/mbcebr28?=
 =?us-ascii?Q?k1uOVFd/3yIC2oLbSi219fWtvLAVU5UcSj7wuhe5hKM8BQTR8o64Cq4GdztG?=
 =?us-ascii?Q?ERwEwVpFTbY+hFSqjMq7KyO53Zv7oe1gMuT62mYSMjFQEnDi8QK388/NQlVZ?=
 =?us-ascii?Q?Y4k11dSrGWaBKQf2Ogtnvw3MmgjW5fWZd65YqvW5RlfdughDTJ4JdA13kSuP?=
 =?us-ascii?Q?5v7pajjGQV10m1YbDWrC3v3kMmDMDg2axeueZ3FJ8vYPzYeMS3RPzT8l+exN?=
 =?us-ascii?Q?hhztmr/vycNCKjiLusyLGYZVzOm1Sm0ilxvTXAbYrvxDlIdS/59xuSGVsi01?=
 =?us-ascii?Q?96FHhchug/8hHiIk+VyzUEDSNDnwcNBXfa9hjY1Pl5Ov4MYSMFNQMhflK5qV?=
 =?us-ascii?Q?xfui8Vbn1nBGzCbV71EB10dpOkJEiXAGcyyD2mR5Sm07yt0o397l86nVrGXz?=
 =?us-ascii?Q?m9dEJi3Imhb9KDhN6nnJ8e3egHqr4IH6odizkEJaogU8Nk4GDR5AgXH69uk1?=
 =?us-ascii?Q?2thbkIhc//ZXptENDWtBFDIWyHz33we5YLagr4DkQP21EFStGItqbX/J7ecf?=
 =?us-ascii?Q?cTSyq+jy8urbYpHTG4N3RP3alP7DmOFdMek2YEb+ewNE20wegs3BiXfzYJ4K?=
 =?us-ascii?Q?nCFAW2lJalDfw1Hgw5DSZZfXH9izlimHrP0N0hmtd1XAJ5WzX5A329dG/dkk?=
 =?us-ascii?Q?8wpCEKmXVCTQhvnBWfR0LscCF0iapgkn+5j+BPK91+earFLwQvEMaOLVLsPW?=
 =?us-ascii?Q?xA92eqqqOSkWuJypE029/DFaH//1x8JgJXQ1ab9ABQ6uJuAdOej9w/KyoOTA?=
 =?us-ascii?Q?GDIGjWUwKP/l6G748V2OepVdaslz2wpyXrvn+4JgEAD0eZGtxHces83HFlRs?=
 =?us-ascii?Q?xqzRZsXcb/C7BOJ8muG4ekPjNFfMtaK6TxHsGnaNumzjmbcaFZRgKaGzunhQ?=
 =?us-ascii?Q?wbrW2A35vo6ONIx1p/vJYvX7n0VjuvxLrAZbn9Q0hckZtmlUCAEFB1EzpN5i?=
 =?us-ascii?Q?DIG01mJDUgWCpRs5QAUNYyDJt6hU19WuBbDfDaP86jjhM7X/3vXPPg2RPiE8?=
 =?us-ascii?Q?5qASf/GJ20N5oI3FHAVTP/xSGoG/otaad8n4shO45XLfZSQHjrgEch4VNtTt?=
 =?us-ascii?Q?sZUJ27oRVyZ3ZSueGHP2L72iaKhJtMA+T7IWGf8eqcapkSGOEZOil3BQCsP2?=
 =?us-ascii?Q?0lE+EV9xHAQfuWvQyO86F7ZFc84iSdrUDE99Px8aBys3vYnWwS/d+wH6xKu+?=
 =?us-ascii?Q?NNEDTa+6JdcAW4pazRbzuZbs8enHVbUGFNwTct+F2CqaJe9/8PjU+Mu5ZO5t?=
 =?us-ascii?Q?tlnzHkt8HmvBQmM7BoFnUy4+YoK0GoIF1ezls5Kwk7kzNKFDnQF2sS3LdxOk?=
 =?us-ascii?Q?pr4FGoisFs4TBB4qNQf1Q9v1EWLjFe1XGfzFuyF4hnsyubGrp+cRWUdl+ZGx?=
 =?us-ascii?Q?o13HDVM7LH0h2F2GGBsxn6E2/K3bRc6upVNG0L6z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae6cf99-561f-4f9d-58c3-08de373f13cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:21:58.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jnh1htXSlhIv2NhhNryAA2q4iKzJOYF6SLDjG32FrhkL9RM5wIJjuY/WUIy16uebYeXp+/EE47nwggQlIWTCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_082204_015487_95711490 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, Dec 09, 2025 at 01:50:58PM +0200, Adrian Hunter wrote:
> Remove duplicate blank lines from mipi-i3c-hci code.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   | 2 --
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   | 2 --
>  drivers/i3c/master/mipi-i3c-hci/core.c     | 2 --
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c   | 1 -
>  drivers/i3c/master/mipi-i3c-hci/dma.c      | 2 --
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 1 -
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.h | 1 -
>  drivers/i3c/master/mipi-i3c-hci/hci.h      | 5 -----
>  drivers/i3c/master/mipi-i3c-hci/pio.c      | 1 -
>  9 files changed, 17 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index eb8a3ae2990d..fe260461e7e6 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -15,7 +15,6 @@
>  #include "dat.h"
>  #include "dct.h"
>
> -
>  /*
>   * Address Assignment Command
>   */
> @@ -100,7 +99,6 @@
>  #define CMD_M0_VENDOR_INFO_PRESENT		   W0_BIT_( 7)
>  #define CMD_M0_TID(v)			FIELD_PREP(W0_MASK( 6,  3), v)
>
> -
>  /* Data Transfer Speed and Mode */
>  enum hci_cmd_mode {
>  	MODE_I3C_SDR0		= 0x0,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> index efb4326a25b7..3729e6419581 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> @@ -16,7 +16,6 @@
>  #include "cmd.h"
>  #include "xfer_mode_rate.h"
>
> -
>  /*
>   * Unified Data Transfer Command
>   */
> @@ -62,7 +61,6 @@
>  #define CMD_A0_ASSIGN_ADDRESS(v)	FIELD_PREP(W0_MASK( 14,   8), v)
>  #define CMD_A0_TID(v)			FIELD_PREP(W0_MASK(  6,   3), v)
>
> -
>  static unsigned int get_i3c_rate_idx(struct i3c_hci *hci)
>  {
>  	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 607d77ab0e54..211321f73e02 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -21,7 +21,6 @@
>  #include "cmd.h"
>  #include "dat.h"
>
> -
>  /*
>   * Host Controller Capabilities and Operation Registers
>   */
> @@ -109,7 +108,6 @@
>  #define DEV_CTX_BASE_LO			0x60
>  #define DEV_CTX_BASE_HI			0x64
>
> -
>  static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
>  {
>  	return container_of(m, struct i3c_hci, master);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 85c4916972e4..cc5d2deb23ab 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -15,7 +15,6 @@
>  #include "hci.h"
>  #include "dat.h"
>
> -
>  /*
>   * Device Address Table Structure
>   */
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index c401a9425cdc..f20db2899989 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -20,7 +20,6 @@
>  #include "cmd.h"
>  #include "ibi.h"
>
> -
>  /*
>   * Software Parameter Values (somewhat arb itrary for now).
>   * Some of them could be determined at run time eventually.
> @@ -124,7 +123,6 @@
>  #define DATA_BUF_IOC			BIT(30)	/* Interrupt on Completion */
>  #define DATA_BUF_BLOCK_SIZE		GENMASK(15, 0)
>
> -
>  struct hci_rh_data {
>  	void __iomem *regs;
>  	void *xfer, *resp, *ibi_status, *ibi_data;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> index 7714f00ea9cc..40939af0b0e3 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
> @@ -16,7 +16,6 @@
>  #include "ext_caps.h"
>  #include "xfer_mode_rate.h"
>
> -
>  /* Extended Capability Header */
>  #define CAP_HEADER_LENGTH		GENMASK(23, 8)
>  #define CAP_HEADER_ID			GENMASK(7, 0)
> diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.h b/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
> index 9df17822fdb4..b15e629951f0 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
> @@ -13,7 +13,6 @@
>  /* MIPI vendor IDs */
>  #define MIPI_VENDOR_NXP			0x11b
>
> -
>  int i3c_hci_parse_ext_caps(struct i3c_hci *hci);
>
>  #endif
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 249ccb13c909..3f88b67bc5cc 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -62,7 +62,6 @@ struct i3c_hci {
>  	void *vendor_data;
>  };
>
> -
>  /*
>   * Structure to represent a master initiated transfer.
>   * The rnw, data and data_len fields must be initialized before calling any
> @@ -108,7 +107,6 @@ static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
>  	kfree(xfer);
>  }
>
> -
>  /* This abstracts PIO vs DMA operations */
>  struct hci_io_ops {
>  	bool (*irq_handler)(struct i3c_hci *hci);
> @@ -126,21 +124,18 @@ struct hci_io_ops {
>  extern const struct hci_io_ops mipi_i3c_hci_pio;
>  extern const struct hci_io_ops mipi_i3c_hci_dma;
>
> -
>  /* Our per device master private data */
>  struct i3c_hci_dev_data {
>  	int dat_idx;
>  	void *ibi_data;
>  };
>
> -
>  /* list of quirks */
>  #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
>  #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
>  #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
>  #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
>
> -
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);
>  void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 710faa46a00f..142f3f79415b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -15,7 +15,6 @@
>  #include "cmd.h"
>  #include "ibi.h"
>
> -
>  /*
>   * PIO Access Area
>   */
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
