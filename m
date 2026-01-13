Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B597D2F33D
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRyt2HoR2oc7KznS8yP8C7L48jm3glpb1cIUQvk4G2A=; b=fMzxua8ZJLKADj
	jBotjjAR1bHC1jEkFro6qJiXXm9ZhYaQ7E2DPu8+FjdUaUzBFB9cXw+x7glLQCpkp7DY4E18MpWUu
	YqKN7xLxRK55hR7ZH3w1dwb22mwQVSL8erz3PDpTuwNIBKZneuqVHF20d1iHnqBztvNdbSvSarUT7
	KeED5/UFwGLr/wvsSdlaDaaY/mwVeQzMJ2z1yF24aKYjsd8j9vEJa0rWxPz/6XivgN+MrMPbtykwU
	xcrT0/vMGKHfd+evN761n75GxHLGv4owKJ/Z2HH/YUF+T33AR8bgEfy3v4Pf1Ivv9RvHpfEUuDviS
	2RdcRejRdtTSHaZKSEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhIy-00000007Tup-2lfP;
	Tue, 13 Jan 2026 16:31:40 +0000
Received: from mail-westeuropeazon11011062.outbound.protection.outlook.com ([52.101.70.62] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhIw-00000007TuP-0di8
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 16:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDymJZ61BZWj+gCehinHCtHwTRKYoDUehpukvQhw4Qry/lzJFv0u7WNyWwydQ5QU4XIu+gwhzrY/3+4NRB1QP3o56SyaTtez5QY+SFbyobCfQSdbLSaKs9h2px+UpmIlPQkmVTVVx00H8VMNw48GN6bSBhgYZSft6a9jYNmNsudkfMgXtne+rnYxuU9Umppr/OQsyEvOMIi89DJd3HuDiPaIIGdDWMbq3QRfWAGrrchnMXKu/u2unrbo4Dp1UyLZeQdP9CmIr7bizZkIShG3CfDCQ9xBmgkCSbYPS0JWjzeLVP+bn+6dR39152csVJLnXPYjeddGlftR4N19wXCD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkq1/8lWdNH9ImgRM/YXDjflLO5u4ZFuIWTPiqYZW6k=;
 b=iR2bdeC6vR+ckQpV3SD3xSK4MHL1pHgvAUpwgAzsC60ASyzIAdhtovhf9U4h2GsnfFiIy85CAzjjuVAAhFgg+/3eQJR8nPuY+2J0XunH/TO7cw4xgTHUwqtFUJcZCS19bobS/z/wWvakYJd4OpzGiVUrKuo91buyACvexMN7WeMAjzpQMDxueWDces8BcqkvgSruNfQadBgLlV/Eh87TWUZ0LBhZu1PtWkUXuba89NGkyKnESyJLhe26jsstSw28opSlxekZb19GwPQetYrFTAKng+M+qnx3OJ6M/0ptyj0ugKFAmfYQamlkZsqEFY4mhcSRO6a4dSq1BZ6LcQuTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkq1/8lWdNH9ImgRM/YXDjflLO5u4ZFuIWTPiqYZW6k=;
 b=A8RvbsSNaRF4xjDrJ87jRmkPjtZlGTLQgf7op5JSmqsOYhyq8AVGNaLCYZLs9btGw4GTav8bgfvuYVjBTEkYmzNkl6wSP4hRix3RVPN8mgFjsWLoPvOuXQAk4taSoiYtRf556yqwisJgxIDGYomehSBr6bZYhLYPSgYmmoLOM5ad6MmXJTTXeWelRvQ+HOGCV+aXwKOp2yCCSSbwY0vlSxC9s6DmNXvyd4mU/yEhMayKlc0Ahu2NZhDqpA9YoQwIrI+9ZRU2t6Ath5bkiX806epQ/9ddmlev0SeWaWuLozeWFZpWXk1z1wb74yWRzqxDK32lxaydTowRm0lBBawxdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by AM8PR04MB7377.eurprd04.prod.outlook.com (2603:10a6:20b:1de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:31:34 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Tue, 13 Jan 2026
 16:31:34 +0000
Date: Tue, 13 Jan 2026 11:31:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 17/21] i3c: mipi-i3c-hci: Allow core re-initialization
 for Runtime PM support
Message-ID: <aWZzYCZdjb2eZGsY@lizhi-Precision-Tower-5810>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
 <20260113072702.16268-18-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260113072702.16268-18-adrian.hunter@intel.com>
X-ClientProxiedBy: SA0PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:806:d3::14) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|AM8PR04MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: b3908cac-2b0c-4a21-35c2-08de52c1370b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8tU+5o7Y8as8TVCo5HIwbqCf4yTM++NolwDUK56VEYHRWe5bp4uAKjsOnal?=
 =?us-ascii?Q?udMP7lhFJZFwxE/4T3/pyqq3m2nH3yUhy/EZvn6uRdYbB/WnDDqWgcLKjyZu?=
 =?us-ascii?Q?QpyaK/ZB2OTyKkfEGiFpzmWt/Jxy+HWrM0rVt90km1o4YPOrq+K9FJtPRhaB?=
 =?us-ascii?Q?Uv4wLns+05YAiOz6l6LWNvd51BnC5j/A4ZUGhfhbAJmCDuZRIPqv1HK60SoH?=
 =?us-ascii?Q?gNqoZp99IknLDn63dYYdmj5Iy3/yx2GgZ19sfn6x8656mxPEYXmvVMrwTFta?=
 =?us-ascii?Q?JtMQ39tBjS7FaUrEivyjepRRJvx4CHXpOoJvodGRf7CKb2P9sgoOTdJJDua8?=
 =?us-ascii?Q?p/1Y15Q+b2HyXAUAGoE1YQ2/1/QNJZhwejxad0uS5w/KpH5rvC36AdlyuwF7?=
 =?us-ascii?Q?glJgU/wZ/5C88jvX/szihPpIsJiYYJSSX/0jKKLJglSPp1xRUe+pxJ3DyjFM?=
 =?us-ascii?Q?2w0axrrHbuX8g+SHAHWdT8Pgi5Qbs6xVF1j0j0iSnvJc/DBSAx/wztasY27o?=
 =?us-ascii?Q?wuZepwpQR3VMJxaH/X0kyH7Wz64oNMarPJbSaGcjs681TboWqIJJbgNqwaru?=
 =?us-ascii?Q?L7aHpszFhK1suoA1yQbvsxQxvVAP+WoTqZiPjaKWsKpBeBcstAO9iHSWCO4z?=
 =?us-ascii?Q?eUkSwLK3/Yq1Pj4FGK+0LisU/RCzuc694e7MHgJOApKZW02uWKWhGgxWiKWE?=
 =?us-ascii?Q?IClpx1bFhOEHWBU2kC6lkYX/sWHhl4A5iY7z6gu5JKSxaUsl+tgIKs7o6H5C?=
 =?us-ascii?Q?ED41pSAr/Xlxjl8JU67R8RFYw8lFwfcSyFYSfh0rlCYuurw8nzV4EYKN3TvX?=
 =?us-ascii?Q?yJWW/fomAOxIYUM/MagRkdH2ZyXfEYqjyNILjAPYP+VZIE1cci3BqfBzeFtR?=
 =?us-ascii?Q?/fldLh9fltQ3Ux3gJVeHWnPbHwqS1iqpOaBBTlxkopIYR1DnkJ0I8CZosdE/?=
 =?us-ascii?Q?LdqdmO6kUk0j29XO0zX8L8QZuDwGLMvHBmC+DB60WFpHnmK9GllDqEEva49P?=
 =?us-ascii?Q?REMpaUZ9KzP6/M4FiQYm//2G/mEszIdA3G/11KOn5Zi+GNH6kJhN5oJ3z5Kc?=
 =?us-ascii?Q?ruka9i0tthAINmatJ+xEE7IRHT9kHMfc3RT/T7R63LvGeBlRUUVhq5pI4nm/?=
 =?us-ascii?Q?jDcjB6saZn7YEIKH4oKCk4dN0xRfZbmkTW5zdvoYsa57jGn4h35LLa/1ZNFH?=
 =?us-ascii?Q?+r7OUseaBb386a2AhOAAnp9hY5uVPe3SqQs8KbZ7WNtlBaaffJ529V2MgcZQ?=
 =?us-ascii?Q?5ue+og/jqgZfH0RxyYCMvZs4OLAMl2BhebGdvF7cSffIzRfx9LbA9S1l3+cT?=
 =?us-ascii?Q?upvVItk3F/kNzYaFd6Q6/psy13JOlRarLP3mCBCpE3UUD0U5o1/rL/B/G1Wb?=
 =?us-ascii?Q?8/JoOlbPwzOlDexE1gT2LaJxI/9WHYRzgISnJnoplVtUM4kiaSnvUiYGMyI6?=
 =?us-ascii?Q?t25PJerf5wWXs88ApZnWKcSFT3DohNX6mdHQZAmegMFJMOXwvv2rNfjq49TJ?=
 =?us-ascii?Q?Kdn3MkIUqj4wBCsjq1ZBTxobqikfy4l1zN7v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zcFG/X5qMXeNcL3pkDqv4V/1U3LRvn9OTYx0UGXf9VSUpP8/KDGE4a4AjPrV?=
 =?us-ascii?Q?7JsV3oBRiXmr9Ky7fnhcyz3imalTDgOdMMIWsVumNG/JwR8p9KQvLRnzIPKS?=
 =?us-ascii?Q?E/j3gec0lGCS0xFVAN9Z9yoeK8LjxiLas/nchfHMu0ZJs5K2TuNpgb63S1Zf?=
 =?us-ascii?Q?FiStySEtx5DeviHhLSl4Uuor14GAqFrIJfhbN307he3Ug9tWHtVb0y2+3veq?=
 =?us-ascii?Q?NW3riaaluEziLLL5vUtEK/5J7rCTqX8f3HmhQNFqrPWJbwRvoGcpEX3cDfXC?=
 =?us-ascii?Q?xSGKgC2vZLcFj2MK6rhSJxIBXevTfY18caz+eDWnrNMR1iaSJnSn83zCKDaI?=
 =?us-ascii?Q?a7+0owy91iWxv8IB4BuWOJUo8VNH6NdYdoGlKmw1sY++Ekfn+hbWX3khUN4q?=
 =?us-ascii?Q?hKGMP7obJhmfK2/ZjB/DfDXYtPxYmxSq+/9yXp2Yzr8sgVDmDVxKi0CUaKnK?=
 =?us-ascii?Q?Z3JG+cpBo/B4hflMC+RU91RmgHirZX9lsIFykdREg9LKbY1p/XMk3foTwlfO?=
 =?us-ascii?Q?DpRAvCsLcJCx2oODvKZlZ/rmFq3keIUuV7WgdQZYkS58so4D6g+BUwdurGbY?=
 =?us-ascii?Q?HPN2wQxTtufitn+pe/aTRBU3QtJzqDBCdGwO03wZb8K9gBhQMPO9iISb/Det?=
 =?us-ascii?Q?PL9ndOYxlxIcdiacyarRt3XN01J00nDeFgqrj4GPewp+LFz4CY5epoCNlwNq?=
 =?us-ascii?Q?qLrUT/uOeY8QmQXQxiPYFILpEoXcXgW6XuFr7gGD7jpDPN+md9kl/wuJiMBC?=
 =?us-ascii?Q?9rTmOC9XkCeFQ8rXeB/TD1kVSC+0OsYbkYgrDTzWpPejRfQGjlJxaR5qM9ZX?=
 =?us-ascii?Q?DC2ikcA/jx63lCko6oKS5JbY75PiD4kI/DnELIx/RkuMaEWyCepK0b90twdB?=
 =?us-ascii?Q?7Yn5oTftC6IGo0/G7R3eDOYvqJGSVPlUjf+jyxhhGl+xw0FIgTnJPoROA+Q+?=
 =?us-ascii?Q?IY3qq3aGh1Q1Une3o6dB2RywJUT5v+//2oVdIDJ1Z/JNqhHy3+jEY7VQjsPa?=
 =?us-ascii?Q?TdYgV9fhqHTsdYo31HWHJZGlxFiHpOVj/B7nY/DjZ4sxOhHS56ePiZS9geM9?=
 =?us-ascii?Q?lGfH9wVNUVHlEhlBdoV75IQp2IqKm42/GenLo2VkbKzP+4d5Qw4XS/LgZU4a?=
 =?us-ascii?Q?nbv5tmFYJxU4owEzkrxBO+n8ebmovCmwYIw7fgmhOYlD//cHAo+B213soGeS?=
 =?us-ascii?Q?FwZuxyto2YsrtJnXd0x1AM0H8i33kicdEUsOBMroQIAIRgsZeEtX9U0YFlG/?=
 =?us-ascii?Q?q6SsZxfUdh1N+TE4c2XC1d1dxwapmQihAaSkywepC+35px8outNKXoot9A9Y?=
 =?us-ascii?Q?wrnHqsED97ihGFbbin/qth2OgmTDlLUD8J8aHgY+peRDNeBYfY/c4ohCFKeC?=
 =?us-ascii?Q?ngJLIUenb+D/XpQ/hMY//ZOQQmkc05a+8pRRyYziaThhJV8n3Hy+XucedlcH?=
 =?us-ascii?Q?2sf/6mL9IyP4a19LKK0etwZJqRsbAfRM4d1ojLCc6KYega/uRoTPqUkFPpgG?=
 =?us-ascii?Q?SZwGBpgSV7a1d+zqvnWgoZa+MrEldXyeu1zuEhz0422UgG/bFX9XVg8XIblH?=
 =?us-ascii?Q?m6uLwRxCO7plShXowINO2huQ7KfIBWvenwWfLfZ46QFOqAo4Ld4LEVycAoR7?=
 =?us-ascii?Q?OK706SRO9GZSO63jFGXl+T5MAorvQPWSZGSGwBHpeVJAfn1mgLCBLkgM/fdT?=
 =?us-ascii?Q?Nbi0nlpHhDV9H06rB0tP2Zozg1XKgCLS6SmQ2rp3jLh8p5pZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3908cac-2b0c-4a21-35c2-08de52c1370b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:31:34.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPr7FRdgSWXtlJClqGuUZPK1IuKZD/8fmGwH82K4rx1oHhqaLiktmYtJst88DTqtbPvEv/mUjpgrOBAWpBUNlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_083138_194218_F573A31B 
X-CRM114-Status: GOOD (  20.07  )
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

On Tue, Jan 13, 2026 at 09:26:58AM +0200, Adrian Hunter wrote:
> Prepare i3c_hci_reset_and_init() to support runtime resume.  Update it to
> handle the case where the I/O mode has already been selected.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V3
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 38 ++++++++++++++------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 8b8e3952d41d..fc0a47a36961 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -681,27 +681,31 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
>  		}
>  	}
>
> -	/* Try activating DMA operations first */
> -	if (hci->RHS_regs) {
> -		ret = i3c_hci_set_io_mode(hci, true);
> -		if (!ret) {
> -			hci->io = &mipi_i3c_hci_dma;
> -			dev_dbg(&hci->master.dev, "Using DMA\n");
> +	if (hci->io) {
> +		ret = i3c_hci_set_io_mode(hci, hci->io == &mipi_i3c_hci_dma);
> +	} else {
> +		/* Try activating DMA operations first */
> +		if (hci->RHS_regs) {
> +			ret = i3c_hci_set_io_mode(hci, true);
> +			if (!ret) {
> +				hci->io = &mipi_i3c_hci_dma;
> +				dev_dbg(&hci->master.dev, "Using DMA\n");
> +			}
>  		}
> -	}
>
> -	/* If no DMA, try PIO */
> -	if (!hci->io && hci->PIO_regs) {
> -		ret = i3c_hci_set_io_mode(hci, false);
> -		if (!ret) {
> -			hci->io = &mipi_i3c_hci_pio;
> -			dev_dbg(&hci->master.dev, "Using PIO\n");
> +		/* If no DMA, try PIO */
> +		if (!hci->io && hci->PIO_regs) {
> +			ret = i3c_hci_set_io_mode(hci, false);
> +			if (!ret) {
> +				hci->io = &mipi_i3c_hci_pio;
> +				dev_dbg(&hci->master.dev, "Using PIO\n");
> +			}
>  		}
> -	}
>
> -	if (!hci->io) {
> -		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> -		ret = ret ?: -EINVAL;
> +		if (!hci->io) {
> +			dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> +			ret = ret ?: -EINVAL;
> +		}
>  	}
>  	if (ret)
>  		return ret;
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
