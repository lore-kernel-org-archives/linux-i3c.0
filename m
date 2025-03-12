Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D14C28B2F
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Mar 2025 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySm2BqNpuKT01KRne9wEWvlUxi/i64GVglXprn/qZLw=; b=jilUmKUgWn5GoB
	KcoPN6IYmrXL26C1S/V/g+LDRNHW9wfBtC1+SvUtuW6SQr0R6nhFlpyl0HQvSTB0av8wpgvvF+I/z
	v3JIaTN6vtVr2bgZek0HnIlz1K3Tifa46LtybFcq7PxZ28WRj8yimoD4W2ma2epIUKkp9b6wfT4/f
	7ssElYAf5pf0Y2maO63UXZjIyet2pf4G/OYvs+7cGNV6DKNfIEVzQR9etb1LlkDdXbFuz/meryybW
	BlJEjCJs6CT2DbyMzRsQTakCcEzT2CqCx/G//K7gP8kPpj/NTc37VYsDb/WR9VJU05OEvHiT6BVED
	EDtUMDetidpEzTEPj9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOt9-000000091QB-2eOx;
	Wed, 12 Mar 2025 16:24:59 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOsv-000000091O4-1ivv
	for linux-i3c@lists.infradead.org;
	Wed, 12 Mar 2025 16:24:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+4/ncXupwMrUtmMQfXoA3ZtaNBc93Ref3BqQgXoJRoifqW/yqRNDmbv9SY9hZ2Ux5GvN9w0ci17JC8ONwYRxD+pgOeSP5eFYoQYTZsj8n/wSHVyfXKR8ah644RjV4ftAXX6IYlYAfX3hcTVHppKbBecoT693U9nawCf65k8hSaWpoZFEPwgau4UPj0LmqtbE7ARPCuTCA1IlzQ6AqgMSJoSQZ58jf1Yv4ZLWr0nCH4Su7O61ID3tDCjn0kGMKy+NNzc5hJorJI25HZQkMhYl6xBx00J+4uUPGZ+JCGhmHTtSm1LhWjBZ4d4DViMBawLWIumtWXXbpF4tHFZZmwWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvlgzijyqfFIXgAfA9p7364hOXNf20ppW3fVOVUww6E=;
 b=J7djtE5d2FrsMH+hvCJn539tZ8vY+pWrp2QeZTQqJ3oxtd6x2OysIBaUSEvSMgFp7nQG0UErFlE7nb4byRB376Dh6HTSIwkBaIN/jZgJgN1gzusGtieAkQIqbTFdIigvYh3/nRUb+5WIVfjXrrAhl2BnZob3GWA7Vdb9ZfuycfhXXkapwoMQ4K4Q0gF9H43K8BC6nTEdUylno/eh/Erpmd16GBzEAgQisDt5uBT/Aaepn5OCPdEkouAu5tdpaTuEpNVLkmYO0nnkqSUH0gOfzPoudLVagXX2nT1DoSgFrqnqG873wJ0q1D1x09glSk1fIYjFqg4ZN+vKzy4ud28yMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvlgzijyqfFIXgAfA9p7364hOXNf20ppW3fVOVUww6E=;
 b=aW1CznPuhAKx9PwRKII3CIh4t8oeFaIeBDdplnE3HQ6ppsMPnXvdYn+gGz2Ny7qz8fqITK5InATAAb0k0bw9AB11Sinvc/otrK+qZs7HuulfgsP+Jk36DTMUjEeMbdnN35PyfI4V2LYkzqNNSOJP3N9hTbDbv4+2okqrqWfw0J1wTFAGCXER8wDUVBRKilDXsGz7uVK6wPABV89ctJg/ZXVeX/WpLLLrqlU2BRgGU3qZd9KEaNlMglRboljAktsZdMm2gB5fJi/e0w1ItRSD4J0VZBeVExPRf82fpI+peN++mUX3/v1h1Do1wOYX7P302+QRZHTa6P5mHQ8g9u5aCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB7107.eurprd04.prod.outlook.com (2603:10a6:208:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 16:24:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 16:24:40 +0000
Date: Wed, 12 Mar 2025 12:24:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 3/4] i3c: mipi-i3c-hci: Change name of INTR_STATUS bit
 11
Message-ID: <Z9G1RDI77BOR9dtX@lizhi-Precision-Tower-5810>
References: <20250312111049.197855-1-jarkko.nikula@linux.intel.com>
 <20250312111049.197855-3-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250312111049.197855-3-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SA9PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:806:22::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb25ca6-87b5-4b33-cab4-08dd618263d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0F5m4YFUK0C4Ou80L9uOIWkC6/czwsjLOAQJDdf0FnyQ+Cg9Jo4c2LtSus62?=
 =?us-ascii?Q?uOoZ0zeuFMwbW+wsJKisz7Fa4ZFdbWdEBGv3mhpdqYdMu+rh/kZmpipizhxj?=
 =?us-ascii?Q?4WI+3N6dPkjhmyjE1i/0E0MF8sTvY7rNdoTaItk0Xa7/3+7vxx07jke1I6gQ?=
 =?us-ascii?Q?fac6+Z4hpxfH7ASD9ykhEx/vlGAWnIW08Xr5KsRcTODTxvVvyD3MZIcOPQZ7?=
 =?us-ascii?Q?McH+x++3kquykbRElK3rvQ2h9PLj0hopYb/ReX20/CUtYGWrWvwDhmJywqMf?=
 =?us-ascii?Q?D2wB/7viqpFLsXPPP3OZOJRHM5VamPfO8iGdKF0sIPAnqxbCEXzCfsqYvsRK?=
 =?us-ascii?Q?yncvxV89BQogAcu6lOkGh2zUxX2HMAKkGZoLC1Oob7+5RMmkMADgrWkKz3Wr?=
 =?us-ascii?Q?dhkEj1sp25z1pcGZ70VtL4Rseah2njVeNMcoNQMT1unw0/69GoCjkvN+sQA8?=
 =?us-ascii?Q?z8jcT5KHQVXhReOu1aRqOVdCHyI4GCmCz+B+vftA5nASR1I1uRW5+5DYFSyN?=
 =?us-ascii?Q?84QVeeLAN76L1crvg8kxnZL6ukiWKAbbYNCtleLKO1NRWrzM4u05HQOG9c7q?=
 =?us-ascii?Q?zlK/6TxxMWGGilX9uivW5u6t39RrpCxR/7VIAF1vX02QPXGQuFzScaIESba7?=
 =?us-ascii?Q?RrPyEZjj81tnnMhsGBJHkzpzF8RJpqtafVgcpOTsTkCxBzeKiSJ4jkVg0PKl?=
 =?us-ascii?Q?sppl+eq8o0ev05p12tjwgbKS2hSNAuSumDGgyDgjzWrubKQcXQ5AgdGnk8st?=
 =?us-ascii?Q?asfr4Nf+X0NR9b80ovQp0BAYAwsBjJdtZNuzMMUPDFCCi2pT3XrhcQBGstNf?=
 =?us-ascii?Q?8AhQcl0ty+gXfei6YE52NlrYlz265iTIrYLfrIZ8qn0dNKalGPv+3wo0QVyO?=
 =?us-ascii?Q?5OM9LrC2Y1U46LJmhdli5X8Oi4+zyKDHeWDt+ZxPruUyrGXqdE/5hEBcAh3x?=
 =?us-ascii?Q?AhFaV7GbIxCqadcHunpN147H41BPt9SuEuP3WHN3kFSXvj3hJSfCMA3liKLA?=
 =?us-ascii?Q?wUdZKgO/FV22mRfJiHMDZDxS2d9cBdalqfreG0qEf5OVpEB5VU0Kvz3IIofm?=
 =?us-ascii?Q?1sRaaK7pN5Zuat5jFAkgk0+xNhNBhvH1Y1NQRyrsLAV176fIK8nc6Y4QTkCq?=
 =?us-ascii?Q?b3QEGszFg7UFp9fbXyxbos9euQzLh+/8/gr9TTNEe2Ri7q6KvDOUYJGU/OSF?=
 =?us-ascii?Q?dSnpZ7fsu2YXlPq38xS5DTRh+yVniW+33HfVZVG+AreEkduohfVKMFpWAMVv?=
 =?us-ascii?Q?0QSj3Rzr1ab0gHvxbhl80dlo0pXMk5yrQyMa+ly//iW/BN3iigd69k5Gobgs?=
 =?us-ascii?Q?e/biTGpSj4tRcl1BYnDBT6N2WITHsRNBOTims2i1pdHR6/brKar6mEEY3ZiB?=
 =?us-ascii?Q?ykPMTykQv1xmwzZ7JIBFNeK5PMPuqtlKFZee7axrvOZEBCW1ACZjSuPRykUE?=
 =?us-ascii?Q?p6B+JgjCuL9z6GcFTHPFdKxE0XBrB67c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lZvqYEewKOm30PxfPPY+W8CXHICkURpl41hlQGCBnZlMejJ5sFvoCYlyGoX7?=
 =?us-ascii?Q?L4LBP6TxTsLvmxwETdzZB49RswelRYHVu2nyLDmRNgUrQ5efAwiYZ1Ss3EwP?=
 =?us-ascii?Q?lqgHJ9Aw2rmfqBYh7ST9uRJwUGESH6PfAPzW8BzfCmUr5BeMhtXcVajj4ldg?=
 =?us-ascii?Q?Um7aphCe0O5lY3bCosXZ8GXZyq4TSwlvI9y+r5XowFw/e/fijLg71wTepnsN?=
 =?us-ascii?Q?O+xDjTq4yGjkzniBXZ43U4Nze4zynALzzvYboGUgpXFl4aJK1/gTp7TiN0KH?=
 =?us-ascii?Q?3LF+L515Qe+S6Ne4U2qcbCQ14Z0k6a4j/6oMwiT5JH9y187kmnp1MmFxdSqR?=
 =?us-ascii?Q?sbLCB4GpKDdtEuuOaqNIx250ynYt2zwA5TIGlCWsRUmXh6NNcnVIbNXUw5b9?=
 =?us-ascii?Q?+UWX8BWwEWKVXDHANzlyedL3X4Oj7m88qyMJUU1+dotGXKO7ThHNmoq0yDQr?=
 =?us-ascii?Q?7vYZhY5sGP25tjL1lG+oF2ZMeXtpyJxbc0cruTBDEmgkLav/ji69oK346+AA?=
 =?us-ascii?Q?7J0pK67D/7IMR5sQXA7kJt62SVFlVQQR2dgbjaw4dqahfNbOO60Z0XyLx6dg?=
 =?us-ascii?Q?USWE08Lycc2MYJtB+FqvqYDRR0CZimJg5Z+eFj1eBXdX11GMQulLLysGNIyM?=
 =?us-ascii?Q?oLy1b3lEvP723RxigbeiBSukBTRYoKjW1japlQNWbJYOx8k6DpIBLVIcHGvV?=
 =?us-ascii?Q?819aHG08GeegG+hhrGVj6352kk8tho9xwvtkuloGhrw1q0x0k0vX14A0fAYz?=
 =?us-ascii?Q?SjXFCx3zzk1qCaLveY6jU93RR1xODzc2V3hfIlLxkG9Y8P6Ys9lv3548aGcN?=
 =?us-ascii?Q?HqUSwBkPhJxZm4DreVm6McluhQtjUGQWu4wVCexSmaL0f+mICuDNYgJ5gq/o?=
 =?us-ascii?Q?WWHXOufDEjaAseH9JDKq6+k/OYdyc/Or4VHARXjgKsdjKApwfoUkm2OS8Xb9?=
 =?us-ascii?Q?lzrpPg8Mpq9vPsSXzaNsndaO2Ylu9+d3/ZR4ocoeJqTM4ABCQMlNWDujVfmf?=
 =?us-ascii?Q?D74NpKLAJz1rCWFY8YZI3l8jPA83GTYXEU7w4sXStE8wxsa2gCRSGs6AvPql?=
 =?us-ascii?Q?r2TBM2y1a2/hjqlMWvDfM+r8smsOP+t7toiJGNQg25mYTjDtkpqs4rG3i+vp?=
 =?us-ascii?Q?PPIoXvwgGpHcjVk2bBABcFM4MgZ8qDbGGPw1aCliPS0z9TmgD37yTSlXYIuk?=
 =?us-ascii?Q?Dz/V6yajriwenNyfLhy/iWAfGYw2MwdtdMzlUum+bjtsuUveJUiQeJioWqoO?=
 =?us-ascii?Q?wbFjzf+qm8Gzahf0YW3HCpA4bOEU7t4zk9CvhzwmjQZMIzqyJApe5MEOAQgh?=
 =?us-ascii?Q?jMtPqFc+yvfLEcElAKbthvtORayO0sWqtitDna1uyi8/U/nAN5uoa3X3gmiG?=
 =?us-ascii?Q?+pIp+nivCpwENn2PFuC+M4YdfYwEye1b1Opdkc5N97vlZ3vbVlwHn7I7Y8BZ?=
 =?us-ascii?Q?5ZEKklGfjJaLEFNa1v0FPMifQdlro8ywrBur3m9RpK8/XhvjvVbuCbBeDRde?=
 =?us-ascii?Q?o2oEzrTYIw1/ceOFgRFGUY/+j/1LvOKhnuHgLX3Qq5hc/hdVJvr1jD8XcAQ+?=
 =?us-ascii?Q?1TXISGbDA4IiKsOFSmY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb25ca6-87b5-4b33-cab4-08dd618263d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 16:24:40.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWxEL6U1TirOKvNx83biuVZ8kS0XNI498BdovWO3mJsqAXDJSdtKATIMLkSiPHQPFBsjsdW55r5gKUC/7iETkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092445_451684_CCE0DDA1 
X-CRM114-Status: GOOD (  19.30  )
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

On Wed, Mar 12, 2025 at 01:10:48PM +0200, Jarkko Nikula wrote:
> INTR_STATUS bit 11 INTR_HC_RESET_CANCEL was probably projected for the
> MIPI I3C HCI specification version 2 but was not ever implemented.
>
> This bit is first time specified in the v1.2 as HC_SEQ_CANCEL_STAT
> "Host Controller Cancelled Transaction Sequence". Update the definition
> and debug print of it accordingly.
>
> While at it, change DBG() print to dev_dbg().
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e5593b6e897e..84c372740020 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -78,7 +78,7 @@
>  #define INTR_SIGNAL_ENABLE		0x28
>  #define INTR_FORCE			0x2c
>  #define INTR_HC_CMD_SEQ_UFLOW_STAT	BIT(12)	/* Cmd Sequence Underflow */
> -#define INTR_HC_RESET_CANCEL		BIT(11)	/* HC Cancelled Reset */
> +#define INTR_HC_SEQ_CANCEL		BIT(11)	/* HC Cancelled Transaction Sequence */
>  #define INTR_HC_INTERNAL_ERR		BIT(10)	/* HC Internal Error */
>
>  #define DAT_SECTION			0x30	/* Device Address Table */
> @@ -597,9 +597,10 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  		result = IRQ_HANDLED;
>  	}
>
> -	if (val & INTR_HC_RESET_CANCEL) {
> -		DBG("cancelled reset");
> -		val &= ~INTR_HC_RESET_CANCEL;
> +	if (val & INTR_HC_SEQ_CANCEL) {
> +		dev_dbg(&hci->master.dev,
> +			"Host Controller Cancelled Transaction Sequence\n");
> +		val &= ~INTR_HC_SEQ_CANCEL;
>  	}
>  	if (val & INTR_HC_INTERNAL_ERR) {
>  		dev_err(&hci->master.dev, "Host Controller Internal Error\n");
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
