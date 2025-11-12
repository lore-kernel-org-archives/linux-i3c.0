Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B8ACCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pqlkkn3j9+/tyOht05uf+oSI5TUQupdrUqpRcvbG/Sg=; b=HG9376L4EPcy0F
	Zojt+Fy1fuMqDd2dDYzbFen7et2kecRtDBqactYMnZkPwVsX+sVnv70bTUru/bxU64uINFc1neWj8
	m8rZePrmoDIpXy/yY2aN4e84yiaDBws0RT1/MCl30fp0huhFTiadatFogU52ctAMMgn0lQbzkFm2h
	NdHGQcBDF0YjPNb1yWDCI4KkQUnubyt9sluOTsCB/NgNm3Wo2J3ro6nw79P3uuryqROcJEJiaOY5y
	ifvJdtXB2tidfQXHOOycDc048/DepFiPnTkNEJxcVEmkdaFbGS6ihxBKJEwGRv72lvThDGSVVDQ8o
	MmG58Somqu8n+nS3WO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDAq-000000098JW-1Ypc;
	Wed, 12 Nov 2025 15:54:20 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDAn-000000098HJ-1Xtv
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 15:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnF96zRCrv+DaIeaMdVI4Y+RDKHHdJzc6zUwtMlDSW3qaU5x09PkFduLxXlIigUtVHNsEAHwrWKR1OHsrFn0eFjGXFfiu9/+WEqhnrErZYmCeG3NhAod7A6KGc8y/YxoXQKWlBcVWNy7rxO4233eXfO6flFGjvzPcRN0HvTCScW0MzaAN4rAX11jO8cVt9V5OeBMefiwQMLXuNGXqHE9l7Urha/1QLl0UMKneQa0gQz+deI2Xd56r81Oo3FhBalKjOLsX0AmkLPOaH2hs1Et5GRnYS++209NMoBtSAdo+v5129TAB+0kU7QRToKz8BLQglyi4h/MXo8UXdn0DEcuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klt1fP6NMXwDxy8xrUiZqU/jJqsQLWacIiK/TAybMR8=;
 b=EYrIeAK8C28+Cv0OFuS8ySG62lQP6eIs4j/U46E3wi4n0U0ewEklztAkYxsZD5xxfYa37Bgva+cCRBizr/FchKzdvn7QUImP1hs5UiVNvh0Zj/tZYEuLQEpdjxn5nM2Wr58p4aDeCHGpYZwRLUWTI2vvVFN5mTEMhChSqTaSRN+Y4a9s5CX9ANwFu/rpYbNy4G3YeEBdi4y5gRXhirNbX1gDA7BAhI+EQVcOuIk924GN0p/TBLLSs1MyWoBSMA11G0Nuk1y1SHKLNc32RaZoyl1zuYcMBPsnr9b+TP5gA2g4mEkX+EnwUPJRQ+nhh/ov5sHm2bbYKeBN1DYgf7O9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klt1fP6NMXwDxy8xrUiZqU/jJqsQLWacIiK/TAybMR8=;
 b=cF9oi72jvrM6VdH0I6ZHrR6mFU0xB51qtk/jHjY39Q6/2fBrIRF2stV9nUrz/S1AsYVve+EEe7ZntfZNQHoq/k9olKWC0Hfwomjevyq6Ssjha4dXFklAN3PrM/YMLUB+Uv6gaiVgiYJPZFGYUtZAiv4dgaz5Y9WsQetZoet4xz+B7vtRrMEcuxIYIrj3COETxaZZ0BK17pvuJ0aeqDxmva6neDW3fh11+AYHzpMI4p4DmknMQ+fAM6Se9QhrMvkQY0UBZoJgtNHJ3+MH+gApo+yJN+Ny23Xe4hkb2Ky46d7FnTnHzFajhBGBJ5T69WsOTwckoQpg02QUDopjaBKOUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:53:25 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:53:25 +0000
Date: Wed, 12 Nov 2025 10:53:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 02/13] i3c: mipi-i3c-hci-pci: Move all Intel-related
 definitions together
Message-ID: <aRStbZ082OGTc9mz@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b5905d-7e37-4eed-725f-08de22039d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ak0ISNMI23nLGd+jDjL+2WYdZuMknM4epxY/FpL3tn9MMXNA4tE09FBM4ugb?=
 =?us-ascii?Q?C+a29p3vWNbIvp17z/jLr6Du0hYmGJLM1OpvAHLn2/gizm2gS/A7A0MpeM57?=
 =?us-ascii?Q?qgeORH74Wag8H6tuuoF2le4BNuFfPWcCZuk+L/ZyVXSd7oEDpm43m51wrKRz?=
 =?us-ascii?Q?s4TyAIa6beUnzuWq8iPDYU2mK53P/mf85rRbgmY9o0U3QByK4b8oyQdoXXh0?=
 =?us-ascii?Q?icHbFSReN2yNpicPCkCIQeRxugc67+9yCF42JX4xIp6h+eJlqiG5vBmvvnvV?=
 =?us-ascii?Q?4S9Gh5pmHzr7bCirEAHIfzLkeACJQ1+oCd044VEx4mCljJ5eOQhDEkTFmW2C?=
 =?us-ascii?Q?SL9zbsotoNQn2e8iSPQMUSxfcwL1BiVKsCzB+3dVBjG3fHFZwzUAw3IY+id6?=
 =?us-ascii?Q?p2KysSom10ALTcPL5h3okpPzzu7hXx34/LJlJf3AC9HsbdMY75nuSQYrva9Z?=
 =?us-ascii?Q?HpvoamRam67Siksn+bPgIaF6QfmxtewJUq/OlT63jCGLn9N3iDZsv1dwPdbv?=
 =?us-ascii?Q?FAshESrTsXDNeCNsrk909snHYUvAyNDX140qMml9lUewc9TZYEP5Rs9m70IX?=
 =?us-ascii?Q?y9mE1ibGxpngktcLSCiQNyKRrgBoVaKs+NLEwB/r+flajNSBQTw9pZzvba1X?=
 =?us-ascii?Q?pNZ9esJh6DkuO8uiTej5UefT0tsWmI0AG5dE9fnE6nTBtcjIdcogKznYpDpg?=
 =?us-ascii?Q?BNmwjise2banuQXrgRhxdp5u/KSTrScIwBGzuw5vZO16FIlQzBhXvFOgMfK7?=
 =?us-ascii?Q?AG1FuX+g6EpfuyrZNyfYvNv/VlgkFaK1MKHdFSKhmEa+PwAITHTVMYIGIqhE?=
 =?us-ascii?Q?HySpDRmMfAdMj+K8l/lre/9Wn5+mVOFXGgY8YRZJQayUyGW+58VHd0NKg2aR?=
 =?us-ascii?Q?H9UN383hp2/zlPlrGSRTTFsiX6JtQzwzgXpa9G+1Kw2H7arA920PjmwKe75W?=
 =?us-ascii?Q?OUTijE5s7GDXsArHPpxzYLaadQCAbI2kGlo9dIQVD/16DXX5tyqfzjpMUn3B?=
 =?us-ascii?Q?nHVjTkwwvvyGVK43H/Ve6qgm30ZCPYsU5wtDwarGrtZ14PadmGqPDvXgD2Nr?=
 =?us-ascii?Q?9dgvSPrYhDO3U00MtSBqCHS0hTs5Bu5u1jx0Lc9Vn5XD+c349tucrntt9WJj?=
 =?us-ascii?Q?83qx6ojDufs8zkx32InlOngoQF4Y6L+XpS8qgzaN5exVWmpj5N7xGlooMq0M?=
 =?us-ascii?Q?TjEZcBaRCOxTId+wXg9fz4kAgPISb66uWwWFB8KM+n30MF+YsUqa44yfNX6r?=
 =?us-ascii?Q?V3o2giODodCHs72k/U9OeZhCE8I49AY5avLK4sGuo4ncXj4+8PkZ7L7yBhV/?=
 =?us-ascii?Q?zQw2TuP2YPxvp/P6IwAN+IPRT7+zD944pO8GepAfTRj+ib1YcS4QN6k8Lyj7?=
 =?us-ascii?Q?/NBHs8A4rVPMjJcpQ/gkcXqhYYjcYjA0xOQF2phiBdlPJIXo7XbxGkVNN+45?=
 =?us-ascii?Q?3pKQ9ywu52DfgnalcR9HQOXlrky+m+6/bkpAbKvsRpyrP8eGqoC0SQgr/HgE?=
 =?us-ascii?Q?r0pDEQJHbx84QIqw0+sKzcP/Y+gHPq+0Futh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7k5X5ymhM7uFsB4gD/6zUrkwH3vect2qr3Nm6mw8+mxpuo5A3CxW+3w7pylG?=
 =?us-ascii?Q?cmvW7d9X9AYJ19Afd3VJZjIJMIdbMhFRxjO75uAY0jqXyvnVxMPRhw2wg5dc?=
 =?us-ascii?Q?iIW52qdHzXOvFDYXjCq68HmRIPTkEQRhb9S/LWURfSEezYoiXTberoAO2RPX?=
 =?us-ascii?Q?k+rBcMHQERFDEX74DidXAvEt8cXUqqR8d74IxIYbVIOZTU+8qCn56CUHidft?=
 =?us-ascii?Q?Po7NPfXr5m8q3xlcK9QG/+qf7eSq8jygqIy4MG+mbBirnkrPR9MCWSSX+tj4?=
 =?us-ascii?Q?XqPc3IgXqoHnU6xU3lp4mVvnJ/MTiL7vklPsq5VAjX1iPRNO49Nm5YJ+pY/8?=
 =?us-ascii?Q?ADRm3RkwqDODdvKE954TkrWJhSDFhKnWfgzmLyKUQHwugzfJY7ma+XDj5+8z?=
 =?us-ascii?Q?nNd8GVs+XmQoJ5zRR4ISw1QcwFHaPuWcSjAA8zlFA1M3bF+K0Mlcyrl0VTit?=
 =?us-ascii?Q?BkphLiOmDDGx8Xvhg/BRMQRMDfqFkgtSsRpvhp/kjCkVfsP2ZgEvxu1jxjb/?=
 =?us-ascii?Q?6O7qMuDqxp9YQ4hYmoYbeqVqz6yl0fqvUkOy5X/UXB/IE+p9ALRzO3uGLsEn?=
 =?us-ascii?Q?MfD1B+Jv2Gnp6GY8e/aNEg7FoA06c1GR6BTuGMV8bs0thKaFshIapFXT5QML?=
 =?us-ascii?Q?mIQxHnu1g7IQZp8OfVkxHPDFf+9srCuXMztJb2J4N9t7fWjk4jx1MzROpitt?=
 =?us-ascii?Q?TGQbE9Q7t8uRdEkI0gJKd+n49aXZua+1tYmWLgESUTx1l+0WecKbSEtT6T72?=
 =?us-ascii?Q?yWlA/OUkKUcY0VQ47qC4KsdTuqBXtxSy13TpMjjabgeBWQusvqldpWusibtN?=
 =?us-ascii?Q?kfXwdUxRF0lst3mGG9XwZ8K1ipkBGLEKphHDu5ZrjRp+bho+dEhFgRYv19ND?=
 =?us-ascii?Q?08MU1R6qIdi4JPZCxg/XYS5+m1/hFpS/XLA4NqhJMu3WYEjFSaIqx4M+8eID?=
 =?us-ascii?Q?hXNz5AHZIzbGakd9JcIqCYfRVNHlGjtsImarkJTPE/t6kPc/6sf80DgGQHD4?=
 =?us-ascii?Q?jQF5NKBhc9JguA05m0mes6tJv4BmflKVr43yS2DdnxOu4INnKzrcbgtV4oTu?=
 =?us-ascii?Q?Z5RzsDf+wnZyfX2r0WdbvXM3+vwaR563N0ckbeohQbeDufz+83uVXOndM8H/?=
 =?us-ascii?Q?gHMb7oJmP+InlAWY/8EY3QX8ShqQVQ/pHvgJ85/LNv2RRufrymNxO3ovPb7O?=
 =?us-ascii?Q?gbnibSsLN2BtHdU1xfpiKaTjKzkjBZ19tsw1HtdDYQl2PL/dJZZJsyk1IhvH?=
 =?us-ascii?Q?G8UcjUBPpMa8CgdXPwlIqUzZ/XMny5dPygMzZAYPBw2a2KssyODfF0zT2k/s?=
 =?us-ascii?Q?/7sLX7w9dFJQkPc6NKAsYEmlOPKhdQ5kwRmy2vXrzYSgwHFwL02b5zrthxKW?=
 =?us-ascii?Q?xcLuirAZn3QJxIXDj6trAZ2xBB0kK2PXm2j4G5hy5c0G1f52fDgKCANqd/Jx?=
 =?us-ascii?Q?XxJBT/SVmUufOvIFYvNh4DRSCylyuywBXcfuV8e+sTo+72oA2tG5YswoUEIj?=
 =?us-ascii?Q?6kyfeJiV7ovyZz/e6FvF/ksDSQ+QTBupf5VWsPvmisAW/DJOPfIn7LDXfNLP?=
 =?us-ascii?Q?w4nu9mQ87ih3R0MLeUNWa8aerolL0l3lsll9+8QT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b5905d-7e37-4eed-725f-08de22039d47
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:53:25.5403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPVqCGK2rbtrpvRrCj90afQ5QxMw+N7O0vP50mSSx6MXOkRRNXdjVNN5qOn03mdhVfgU9VmRbROfY2szZm64pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_075417_408157_3201E45F 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, Nov 12, 2025 at 12:03:28PM +0200, Adrian Hunter wrote:
> Move all Intel-related definitions together, to tidy the code slightly.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

looks like not neccessary.

Frank

>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 850fcec4cacf..617826628dc4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -17,14 +17,14 @@ struct mipi_i3c_hci_pci_info {
>  	int (*init)(struct pci_dev *pci);
>  };
>
> +static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> +
>  #define INTEL_PRIV_OFFSET		0x2b0
>  #define INTEL_PRIV_SIZE			0x28
>  #define INTEL_PRIV_RESETS		0x04
>  #define INTEL_PRIV_RESETS_RESET		BIT(0)
>  #define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
>
> -static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> -
>  static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  {
>  	unsigned long timeout;
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
