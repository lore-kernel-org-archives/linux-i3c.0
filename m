Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4FECEDDA4
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Nov 2025 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fY9jHCVKYNjDv5STQ37PzjYMDEupKuRCftPquFQLB4k=; b=cboEgaxN/525+P
	Up0nzxOZU+WCEQNd/nRSc4rREbOdBdr8/Y9TOErYSjhFk1CIKpF05VplDxKKox50B8Mm0m+xhJR6/
	zgFZvxpqQG/zTZnGrXMX12o3Lrb4t7f9x30CfYEQmtqOQQFfhGurnRuaIrdKgxLQ8PXhqjMsuMQJ5
	4wVAq3MNUNzZtjfeAifti10KyARkHF7zUmyPqHy+246qc42wbf5Kg1vBvyJnCNRpwa0iRhq/9KhR9
	oycj36HEXNui3RLAWWEVHXwiECZRDI7Irdu9h4gzNx271dnVr/QrCSbi7dadAZDxhetaggsbncdoq
	fQR2lv/TxMFzoFIo9fAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOuI-00000000mdi-4BEg;
	Tue, 18 Nov 2025 16:50:21 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOuG-00000000mdK-311P
	for linux-i3c@lists.infradead.org;
	Tue, 18 Nov 2025 16:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIQlAEXy7lYAAfSKowFxPlplzii458291CXByzexYasdYThxjMDE6xnYb+Tk/P2GZcyz3N3vZFup3IXssAVNgLkqbSe2nLBUN3gSEtAsFvKGaDByFPw1Kd941DmYl/ISPS9eaQrHy6GF82pHntL3gtHZEGCacKGDlY9t063cdfMDTWpef8rFdBAlolKLiMNZJnL8Mkz4hsvvdknH1VWce04i2mA88z0oLco6J+YTbH6Kdqunl6+xuzLJ20aHidrLMOOAEhsOg7ZpjApMhk6T75wcUt5CbtQKH3DBbm1JTVyvN7YQbGogQons6AXF4gw3WlEdnWmYuGTCulJrZYYf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYICYOqarbKDGQyHJkCWbkjCG6dN5Id6YrH3By2M4zU=;
 b=IZcTYGMAF7F3KLvuywY4XyRrnGEFxkHORqmEUEszWRioYNCrfGFkAJ4CdJ+gtGF6fpi6++JBZPdS+SzFlWH+GqLAMFJ8raR35j3BB0ACd9UWnXKUN6NdIa21bOBUqEE6WfLtfElM0zd0P02upZke2EBRyR4qc3tdNDcA979fWBAqONSd4m3+4SmCQjM5qGsgOT2/l2ndxZaUt20Dhc2NIHgbs0XU/GED1pN+zbiqTImBWQpr1MmYB/JUwb9tVQVj5LvG2CYwCqdi2XWv+qdAUscKEerRpyZeBiALyKfNQmsV7g+YHZcg55TyJRCGcHXsqLZL4hmd1+lKiJ+i9esP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYICYOqarbKDGQyHJkCWbkjCG6dN5Id6YrH3By2M4zU=;
 b=Guxlm1s0+OGN9sDvSQnYMmCFx0C360loww8krkardwVueYlJQX77nlWMbKEDOYUIR/fBRi3wNIxJyiP14blDWd73/6eGul9tnige1K9Xof0ah/k5PiqMh0tQRHt2N+5KTZy6MLC5o7wvMuo8on1HQM9ji5HQtKmuFep9tcL6wu1fkuUZLWgfLc/GA4JN4ztfpmyp4MnwYFtz9rUMOAZUlJ4gK0962/9sNgol4OQGpxXgM3heKbf/TtdbymQNYUOA1ufnbrtjhZf0agJP2bN5RbjdvFhE89MDan3ou3E+aLRQaeLtlZ9vI5AjxF3uVzeBpbvkse/O8JPDc5K3Ju8ieA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AMBPR04MB11811.eurprd04.prod.outlook.com (2603:10a6:20b:6f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 16:50:06 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 16:50:06 +0000
Date: Tue, 18 Nov 2025 11:50:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V4 06/12] i3c: mipi-i3c-hci-pci: Factor out private
 registers ioremapping
Message-ID: <aRyjubgI7pMeruEj@lizhi-Precision-Tower-5810>
References: <20251118164453.55532-1-adrian.hunter@intel.com>
 <20251118164453.55532-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251118164453.55532-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AMBPR04MB11811:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bb2e90-e5d6-4784-0b32-08de26c28705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hMeTr30nwIKZ3fj/a9tcEjeJ90Aq4Wykx2KFEq7ecICo+Y5IEV7kFSZBB2fQ?=
 =?us-ascii?Q?btHRoTeCthBP/a/eYc/bLJg9TpGbe0qZliNGA9VDxwJpoilpuAOWrRTyW4pO?=
 =?us-ascii?Q?i7I855o08zd9wSs9m1JY5WxV5zTFq9YevBrrSQu6Mq0J6mq4b14qlczEUHyN?=
 =?us-ascii?Q?H1x/fODYg9T+Anl7LeZnovDw3xECw62Jl5pFMou9TeVEKTK6hBTPY18/pzui?=
 =?us-ascii?Q?p1KoQ8/T8Ew1QvjIyHSvjkLpu/IjUqoYgEeNapoQpXfZ+m8jNUlW7bjEGqqB?=
 =?us-ascii?Q?RSJkHcYe/dEw4hnyGfz0RdoSMMRlp4Wxaxu0x2H4+2aCZVN7AsfA6UJesrBA?=
 =?us-ascii?Q?tmZ7ShlNPtHhGAEI4RkGFRheiT2qJOLGVr6KFqSO6hHTgyGLbQDI1N8YSszS?=
 =?us-ascii?Q?xZDw+JgD2rAVEY6z+5f6nr0EPM1LL84hqv953gxcS+nDxhA3Z0gNv06ZQxUX?=
 =?us-ascii?Q?b6L6QwM3LwHYfFUQu79PMErwuB+upfAJ9AsVooYzDXpA8YLRfEmOBvpqt+z0?=
 =?us-ascii?Q?QztVCq3O0EQOUnV9JGKZow/axa9ZR8VeIMbG5G8IwFkFtgHiCt/H/Mn+MXFf?=
 =?us-ascii?Q?3ljMPtIIlFXMWZ7YO6GIEF2SWsg+BrsbwslTiZR6C2FvGXK+OE7oV5VU7C4B?=
 =?us-ascii?Q?9FmngsL8ab0pF1+bVT9kJA+TvmDSwUxZ0GNzV55Z3NicsU1lDRlwgVkcmIbl?=
 =?us-ascii?Q?EXebbiTGLHrgu1QXkx823FZHKFBPGrRjY5NMTGwjNWocniUVOkBOCMtgz3ds?=
 =?us-ascii?Q?fX4dZIbhPoozf2/nzVUMYeIvf5gRsabAyRAmJQPdyUeNy6i+i0eYpubX5zDt?=
 =?us-ascii?Q?OupHKWSXJL3IN6F0AADH2ltEoUpyB83T80juZuaknfKvRPYTPgUoV8uAkKVM?=
 =?us-ascii?Q?knEueJylMBVH6ZLBqwxroByrHikJ1MMq5LEtucq+5VZwWnt8mURy7tIGoiA/?=
 =?us-ascii?Q?/bacr+g8T4vqUhck64Np3gu2EsdH6AIK+XEXGzW9QcIch4seoH96jli9agOQ?=
 =?us-ascii?Q?XaFjf4Hg8MEG4Y7Wvh8xoaxbkATr3ljbD0ifGG/TU3/LkEMSx/2zkTBXhKSn?=
 =?us-ascii?Q?o/p9HoaUhjEAhQKXODbuqr4EajaHtLwHJm7w9XxEVSUVjibKkI3JFBeUjymF?=
 =?us-ascii?Q?dwy4z50Nz1Z264CZZRTrr5pEnDeVkXW65zvZ1cTzb74CKFE9zyh8p3SWHFhE?=
 =?us-ascii?Q?FzFXnfU3rmz8u7UmdiBfmKHSzp2s//e9AtAEF8MhU+xwlh66HsLrYCSmyra0?=
 =?us-ascii?Q?9SS4UIbK2EYvZCALKcdca/dy2wG98YU+7bmWFrBWfv3SN22Lomz8uHjAxjZx?=
 =?us-ascii?Q?0M/bov7LbQl4Cnq2CBIL/qZbYdia0qHYySAO8ZTx5hzPrl2IMPLJoiDmuvav?=
 =?us-ascii?Q?3fF5JvXt8ufnYldt/x4mEBpjwxsOq81t6g8ORmDYpgkVAozjU/UcfMlCK4mh?=
 =?us-ascii?Q?CIFRkhZuSnX06ECwrc7PyWXPupZ4cC49yaAORcsFdoZctNB03A7RZ5e6IYpw?=
 =?us-ascii?Q?FcFPQ9Jd+aacnw/tYdja2U+MP7O6EiRHXOd2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QxtMk8R1NzJuc9IL5swubagC4rx8kxfQBUn2VPT56CbUwgXYQL42/bWWzAV6?=
 =?us-ascii?Q?1k36+yRQlFbV5MXSYlIOAOcA75I1etyQP6C/fA3idIjfk5RM/CHZjxkTJ+JR?=
 =?us-ascii?Q?oy/o8vm0R5TXHMvUS21yNgy4hRqfgPgni1L/l+wNdtuBeMizXaNjTyfMC7U/?=
 =?us-ascii?Q?0uJRYPsJI8u+BZQP6pGp+7K9LB9S0CG+zzR5GJ8G0ILPWaEuYxSrx3BUhxJw?=
 =?us-ascii?Q?jvnWSWzLxF0WqJtPTY62u1wkCjx9B5OAPcXtMitPHx2ftR17529uEoOzgS1A?=
 =?us-ascii?Q?ziu31fcAOWCVQ00I6herrmwTpz56HINhuTvx3BToH9/bDUmxS5DoaDW7hugk?=
 =?us-ascii?Q?9JYUPzsyv5utmAGLDqiIu5AQGHxvtEPx53zqFjRshReXt3MB/lv/3Jrk3hpY?=
 =?us-ascii?Q?ki697hChUf302wrinXXj74tB6WHiDSiB8Ohf3UoiUQ7Ug/W0NsnZh+GkUxyL?=
 =?us-ascii?Q?ht58IsH5paQFPn5CCVq/Jl9CKIT6+bZXAITDBY/FvsIh2iaDBMTGTMI636ZW?=
 =?us-ascii?Q?Kvx+fb3wI8kFNNltYcrDVbU50QbUSYRQmLRH/Q3dpoB8OPv59iwt4w/jcbAX?=
 =?us-ascii?Q?Un/bWPPbyh/ldaI4L0K9GoHA3pXyRU4cjxuq4ZLutypXe2IuYJDON3BsoGQY?=
 =?us-ascii?Q?cR/cUmKZAwYmCgpyjvsQsrjWXDGHI5V4gx2v4cvI/1/1uOqoJi1eHxrb+7dD?=
 =?us-ascii?Q?rJnKUOreHCHnWDLwRSEpxwz+FV2uIUVfAcQrOIjv6gt4wbmH8JE/0HTIPXam?=
 =?us-ascii?Q?PWgrzCk+vLw7dd119Ib8aUL9OfEPGgaU3J86ydjSuHeKiejveOPqWrsM7tta?=
 =?us-ascii?Q?q9LT1vvDM2dxwvYYWz9irRUtp2YRYWLNgWr8XTB5sknFFuAiaKun16XYpVGV?=
 =?us-ascii?Q?Et1hCNC5ntBMSpWNmhiHxJgQQ6eb7Y1xG1ZzCX+AWtcAKROsw5lnJmgtm9PA?=
 =?us-ascii?Q?WZW62V1egMnktYuIWSP2/xWqQ3TGlmei+ue2X3mxYqDfhnMzoDV11Qhu/iTW?=
 =?us-ascii?Q?z6RlpqyWAaENZljfAxGcH2iWjeapGy/+4C+Vjrmw4RfNeUNyarkXU7GMw/r9?=
 =?us-ascii?Q?Ohad5pPQ6hXIqJlqCdcsllrI91edR0lDvTxjz0/CJXKleXb84NKUdIuWlHCW?=
 =?us-ascii?Q?4p95uk+YQzJ3Co9IRJXuHGozcTcYo0uGIeyqmi6Ttrck5Oab2ur6hetEQtJH?=
 =?us-ascii?Q?SooOBffETIK+K59+XMX4NqNmG/tXpwzznqoT1oX/KZBRSH15wAUhi0W5Vi//?=
 =?us-ascii?Q?GtnICrQ4jEvXJUAYbfs76SjdcREJqo0vEoygOSZt1FX+T1TQ2UZJN0HO/CpX?=
 =?us-ascii?Q?3QtSMICk0HRlJlx2sl4rMbrgbOWL68at58Kt0AHrtPyjyLEdkRAXnDG8Zu4E?=
 =?us-ascii?Q?hQ2H+QfiNwY7XZLGde4n7uZV7LMhD0dk8lynq+PF1fRqfNwl4rXeqHVZ4yLc?=
 =?us-ascii?Q?Ed1EPEi0WFM7/I5q1O5ysWX7WQFU2ARtkcRUxt8BG+2UVYm0K9vDecxSuiE9?=
 =?us-ascii?Q?5ozpMwbpEVbtApvkUu3BXYoZDIqaxL/66FnYwOewzDkixawfJshZu291lAXW?=
 =?us-ascii?Q?R5cLITE73uK5InkGJb8s1hS1+7SAv8TxLPWb0xTF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bb2e90-e5d6-4784-0b32-08de26c28705
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:50:06.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4BnzFRuuOK5W1wovl+P8XnO/lKTXqr9HKidhfFMKhPaARNn/KRz0C9ItbV4wj3HxyA43ISU3RiFOTcZqhIe3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_085016_781724_6D6AAE7A 
X-CRM114-Status: GOOD (  17.69  )
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

On Tue, Nov 18, 2025 at 06:44:47PM +0200, Adrian Hunter wrote:
> For neatness, factor out private registers ioremapping.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3 and V4:
>
> 	None
>
> Changes in V2:
>
> 	Re-based
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index abc7bad5e069..1e1f2c42bd74 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -27,14 +27,18 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
>  #define INTEL_RESETS_TIMEOUT_US		(10 * USEC_PER_MSEC)
>
> +static void __iomem *intel_priv(struct pci_dev *pci)
> +{
> +	resource_size_t base = pci_resource_start(pci, 0);
> +
> +	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
> +}
> +
>  static int intel_i3c_init(struct pci_dev *pci)
>  {
> -	void __iomem *priv;
> +	void __iomem *priv = intel_priv(pci);
>  	u32 reg;
>
> -	priv = devm_ioremap(&pci->dev,
> -			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
> -			    INTEL_PRIV_SIZE);
>  	if (!priv)
>  		return -ENOMEM;
>
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
