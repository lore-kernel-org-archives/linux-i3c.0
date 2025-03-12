Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80185C28B28
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Mar 2025 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9sgTCpD5fF9+Usm/lEXvBOvp6TLn3xBu8QO9OA4boA=; b=xMePwzdLYPt3k1
	UmQX9WxRSAQ/cVZtrZeo0zUzGmGcgY3n9x+xAOHeDiqPBL2V31SZEevjWFlJDNR0C+5c0g9qOvCyy
	dpWUzPnzKCySrPpdYj5vlbn+fPCTcTdeQk7M9dcobjfwF16kNIplkfUcMnK+pOi3gI19wGRfsaS/S
	wuobrngobO0h75Q/tPvjnBWOrfzmnqDt0pHY7nxmlQK+uQjJGLsjphdCOeAdpES4/DGBP/d6cdaQI
	X5rp94X+XGEVjiG/niee6z0EYhGETZs5f4uQBYA+Xk6ZmO0mAK1LSRUemBVGH1iqH5EQvHJeuTGnz
	cmuujKzff8SR48mxZKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNWz-00000008lff-18I9;
	Wed, 12 Mar 2025 14:58:01 +0000
Received: from mail-am6eur05on2060d.outbound.protection.outlook.com ([2a01:111:f403:2612::60d] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNWW-00000008lbd-4AKp
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 14:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygOZTqPw8eZJ/OsRLnkRlKDc5GW8TXIOvzK5o2IV2nj9ZBVyPC+q8dQaI+HtHxCjxUkOnfSPYELSX694jFmVWoQorX4ZDiWBeKURLzVANloelDcMLzukUB2G+NQaF4ukyKx4YNs+TG8eOP9ubI2FdRS00MMC2H3VtGc5hyJp/mZ15fLgIBb9kdUSsVqz5hktCOeA/Gy11jAwdHNMFBgeJskvD14YweWAaFQ6NS6+2Q/JwEny+hC/3/TCb4i7KJp9xIvjcoSfWa2qi97lrAb5z3RtQSgqL8NU4VXGiShPVpE1QGl80b4wd6N5dNj+Or/rdQKOte3MPWzrlP0d/PbFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+FB2ZAeoIHb+eRORcNjGiooHs3ej/cMXjc09xbbnZs=;
 b=x+XgvmkeSrqAp+JMDjbIsQMWLyuxbHfCzl6vNpF0FlfXJmJLIBD7+MEFAyKWC+HxUksfJfKOrWaSYu3yLNf4P/uoPetv8VQ61odp3fjkA3Ru0TTFVF6G2YsFe0Gu+FcFUzW4bmnh+ac8WxTQppEy01Gk9bHPQM2H7NKku2ryXcYDEnIt0lZqbkEnQd1XlFX/U0DlGyUF26zO/4fJ/gbiuPR/dcRrqThaeAcoJcorL3LE7mdMgQ1+AU0XsFoL/gPtj3KMEZN7JeqeIogCQbEuoFOCAPLZtgjMOXZxAr40SA42BrMOlLIzuz6Cw7iVFYLyvcMBmnVvRqWRdwhmFAgykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+FB2ZAeoIHb+eRORcNjGiooHs3ej/cMXjc09xbbnZs=;
 b=l3t0WWDgp1/33uq7z2GnZmLWnxZTTSSY9rUGjX84U/H347Wc/KQC8ZbkWHrFXQ4NJGj58Ssu7RYNB8itDtahVc+BGn8PlhkNQZdH3Ky1Xfll/56IA5D3B+bduKxvXZ8efTSlUrxU1y9YgF5dWue8DFNZWue/vx+8x0rsFSPm3FJmc0MIdmu+P5/adqjsK2X8+S/X+OuGytcfqHqzghm3tHB2UfYPAnF6bRguzOOVm/CgCq0WrkSkQwLV3lWh4GR8HSOkqkfn7pk+CJFwEO2jsel35n+SC9Nnl7TNLyiM3kU8ubfTRpxEIsqjW/+dAf/iycIhgRmu5HrFFNPGaLsr5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB11098.eurprd04.prod.outlook.com (2603:10a6:800:293::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 14:42:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 14:42:07 +0000
Date: Wed, 12 Mar 2025 10:42:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 1/4] i3c: mipi-i3c-hci: Allow only relevant
 INTR_STATUS bit updates
Message-ID: <Z9GdOOage3rBf6aU@lizhi-Precision-Tower-5810>
References: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB11098:EE_
X-MS-Office365-Filtering-Correlation-Id: f5eaa54f-1238-441f-725c-08dd6174101b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+mOIeVVXeQGbYOV3aSbTepCGR+eA10Ha8k2Urgmx5eyUCvzPwcIb74tgMxp3?=
 =?us-ascii?Q?thGumx2a7/uwR1UTe5hKBJoMe9OexX5DDY19GONSqchXkDrCwk52cKSwyt+E?=
 =?us-ascii?Q?9ETX919jwtnM2uldVtJjIyZ5M7MwcXm3xKZ0fLlaamIn14u8dMA3MMfccUEK?=
 =?us-ascii?Q?S27latBtOFzBs3UZ+hpqCsVdUy4qV/GBYEaiAGjLBQWkuf4kcJ2AHFNLYM+a?=
 =?us-ascii?Q?lqvJPyNzlvlHK4msiLhCp9eZKNUMD8ZwlQpgCkfPZP7t153ZlXP+gKW/fCqk?=
 =?us-ascii?Q?2hYHdDiLz/Ajdd1I46Z6OQAFKncjCpKsIXOu077ITkdOFEcXS5mqskW7tEIf?=
 =?us-ascii?Q?3y3On5XDxr3KnfFzJ7dBMqknsPIei1kKss9i+RsC66Ho1I6bZcXNjUPkViic?=
 =?us-ascii?Q?5qSbltUamnpnGe8y4QSmpNDOBizrwgOin7O5Gp8VPNie58xYIBJzcnvwitkQ?=
 =?us-ascii?Q?pwQ8fzcog9rAJlhD8joRSAka/rzoNq9UnOokfVMUtJ9J//dJ0w06FLG50itB?=
 =?us-ascii?Q?Nrd10ex8jcokG9Tq90FGMuR2MCJoilG+0UEUVsj9rXP6PdRgfyQF7IvkprQk?=
 =?us-ascii?Q?PPtiySMN86SycRQg2JEDnvUQOQrJkuKzp+8BWUxdxE/68zUcpKhV/NsV1WH9?=
 =?us-ascii?Q?1MomXB3EL6V9HZURXQ4jQgmeGJEjlUC/ylvtXGlDh7jFnWB08pV9kQvV0u7P?=
 =?us-ascii?Q?NoKdaxiGiq6ZUBU8b8byyWGan8Yp7j+NYzn0iIChDKkrXSobPODxmBQ6nbc0?=
 =?us-ascii?Q?FwNaoRDn20euHe0d9Dzd4T6lBHuLlVA+3JlBDb+Rf6hvyUO39Vu6mCog6Un1?=
 =?us-ascii?Q?3R8aDHaYY5GbZRGcxld2pRCAMYN2JXD6RTLfRpuNCbTJdZhj3sBWfoaKeNfb?=
 =?us-ascii?Q?brNWFn72U9+ijQZ0y8c1UF32VmNQqsJ+3JAJr7ZIhstxjlwAuh5SUBN/R1pW?=
 =?us-ascii?Q?iNs+ltxvYObB6ytI44fr5+gCEy479ZFaAPwFglRTJNddiQkK5Q542x5gH+pW?=
 =?us-ascii?Q?Xs3MNdE8qzrgzHZzRQlLUqLWsK4EGbq3mVaETp/Pn1tfA+RRwvp97SrImbtI?=
 =?us-ascii?Q?7dyJWDi6DHz1CiyUTZp2soVSu9A9ZP6nR/DCXqZWcmYmUbS2y52b4vXfkRbi?=
 =?us-ascii?Q?wK+Zee/ffb32W0I9V5twQGJR6qtcbm/3Vd23drNyBCid5Yk4paDLP0/jc1gF?=
 =?us-ascii?Q?X+V3vLHMlGDvzWJf2K2KRZU3bR4MWb4nHN5d8WljI+FOZROIwqfZchPmRIPp?=
 =?us-ascii?Q?wtc5OydA3VlDrxS22YCR0Nvo8PVO3EZHWeqZNhQ0j2nEKKGeCUrgP+km0xQK?=
 =?us-ascii?Q?K0dK7JBGpvy/ybRgbKlD8CPMFYUoCuKOXxAiaROJo7MY8MOW22Qr1k9RDYxL?=
 =?us-ascii?Q?6a5Zqa7wMRaEiQHDD4amg3xFSN6LYK89ITnrY4+uueoov+0Psnp6EPNUJG6d?=
 =?us-ascii?Q?VhQ4VPRWo63P8Y5a22CblZOtcgkHRf3+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BfSWS8RKZWG5VbYMY8LtSUW97byFr7PUkxf8dTEBeZtevLlV2TnD6Zd/W0rg?=
 =?us-ascii?Q?lPLIi4jU7WPjmsCL+k3OTvrVRwBEls9aYZO/uYsAv51LFWvoGSj8sE16BSq4?=
 =?us-ascii?Q?m0U6WB9twsPWXdU3wt93/oOJChb7SZi4x2g5AzhvhOKMBbWCQOgw4Rfho1Jb?=
 =?us-ascii?Q?dLO0ejdfczzHI6OUcC5CDpMY8xRbA0+jot1+Qe5x54ygOMtQ4D7C3TGx8akT?=
 =?us-ascii?Q?gjGAgvYPIT1gcmLWLXtQvxQtSxgQn4Saytcee9/xbEqy+K31ldw65boWoEWE?=
 =?us-ascii?Q?MxuxtS4mM5LIZy8jA0F58YuMlyYIBDX7Z2oSy4fn6rkmJb75A2xyf8WU4vFp?=
 =?us-ascii?Q?uO+OQO6AN8HWRRSFXg0vHittRUXmuAGtSi1sDlaiWfH15yNk9ZplRcK4J8ep?=
 =?us-ascii?Q?0cBVBtpD9F9of18SKKjNOqVXltoX330MNPu+ry4pcKovZUyqtnXKfyKaV5ZC?=
 =?us-ascii?Q?HKq34g8HegV/2IeJN7PH3/Kge0vncQdMhqoekJDMnqi3FUlXiK7C/bbxTVgx?=
 =?us-ascii?Q?yB0laYNXfpFLkyZfP8wlNBF2rNVba/mt+CS9KYOuoIb887cgptlWYmbsDcle?=
 =?us-ascii?Q?a9NXGLWCfAk/oiZbNVXVjmM4qtDf1YaeHVpAWhMtQSjfrDxPJvAxtyZ7XNSF?=
 =?us-ascii?Q?gsCm9O/Cpm1ky0enZKtrqa0JBP6BJgSv7f3sv4BaODICNOTYcxeTtQJBWsDR?=
 =?us-ascii?Q?Qzn/Ad5pB48oTst8n0yCzbtXczbuLThSA0S1K9Oa4aEBAQFnh+LlrCguXzoD?=
 =?us-ascii?Q?afCL5P1q+Wkrow9GyFLcnZrIhJDXCUa+ko2qt2vSFOabdrFT2A0uAHszbILy?=
 =?us-ascii?Q?9SsjJyCYX1twpcMwG/UwA7cMQvN8Uppbguwv6c3BJkxeumh2+z+vm9othpL6?=
 =?us-ascii?Q?15QKddSjvDrEODZHvRzQi6IGWjHMdnVxDwmGbQEkeoJ7Fln7u+MgMZCPzyQo?=
 =?us-ascii?Q?TWuGXfEm12R7hQRNf++/N/v8gU6hYOqQMgxKiRHfspCqU3FPX06Vkn+s1lD2?=
 =?us-ascii?Q?i1exM19F4gXU+/k0jSA1Z0GWnLCoC99xhZX87HWIl5JkVyac3CFa540v9+kw?=
 =?us-ascii?Q?bfYrsJwnkb0y65wUtBI8a5EbcmI+2xUgA0DlVizrbriHgaQjE93hO4YRJgT+?=
 =?us-ascii?Q?RZTmVoolaWEy7EnP7NpFZ5zn+JuEDsJjeEpIHQjb5fofA7MIIHSj9/6dc4VU?=
 =?us-ascii?Q?d05WGqzzVU9fXwFlSEq9DD+KJix7dy1VQIMHcm9f6DLol96hFzJ+AquhDrk1?=
 =?us-ascii?Q?HHukldz5FQNuz/W3Dg2uiSTGUH8fMwn/jxifFkgafridksLYj0FTZR7vWgrO?=
 =?us-ascii?Q?x5dwTsOvR+hwEQv0xtyZ/EQN0vzGDGnAeBtUzvPQFBm11YjGYU/mhrRQ9ErB?=
 =?us-ascii?Q?tYWqy2DQv5UqlTkiCjJ4nM3OcEusVKD7+pWrD3nOefzPHTojybQ4GkxIWwxk?=
 =?us-ascii?Q?Hjh0tccdXr0OjaCzaG5CnmBXr8KYsbgooSO1SbnFo+3usMzXYwj7olEF6XeT?=
 =?us-ascii?Q?UdqfKMy8zP4wd+GDpAaLUISnIkQBY8Ylg/jiyTCUFQgvhmgGwzdCGfYk+xWX?=
 =?us-ascii?Q?/C7ncx57bfuNPcsHPQ0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5eaa54f-1238-441f-725c-08dd6174101b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 14:42:07.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye8K6wZaG85i76WZketiqZJfzdhE4yiEpiK7xUuQR3j6p2EyKxusO+PvVmg89IvvPxFjanAYgqcPF/9yXjk75g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_075733_038509_160F0A37 
X-CRM114-Status: GOOD (  21.33  )
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

On Wed, Mar 12, 2025 at 01:10:46PM +0200, Jarkko Nikula wrote:
> Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
> reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
> current driver code and not needed in DMA transfers.
>
> PIO transfers with v0.5 would require changes to both
> core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.
>
> For these reasons don't enable signal updates from INTR_STATUS bits 9:0.
>
> This change gets rid of "unexpected INTR_STATUS" on old v0.5 IP version
> and is a no-op for later versions starting from v0.8.

submitting-patches.rst don't perfer words: "this change" or "this patch".

Get rid of "unexpected INTR_STATUS" on old v0.5 IP version ...

And below nit

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v2: Simplified the last sentence according to Frank Li's suggestion.
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a71226d7ca59..e139d7e4d252 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -699,9 +699,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (ret)
>  		return -ENXIO;
>
> -	/* Disable all interrupts and allow all signal updates */
> +	/* Disable all interrupts */
>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> -	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
> +	/* Allow signal updates relevant to IP versions 0.8 and beyond */

Nit:

Only allow bit 31:10 signal update because
Bit 0:9 is not neededed for DMA transfer when version >= 0.8
Bit 0:9 is not handled by pio driver when version < 0.8.

Frank
> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
>
>  	/* Make sure our data ordering fits the host's */
>  	regval = reg_read(HC_CONTROL);
> --
> 2.47.2
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
