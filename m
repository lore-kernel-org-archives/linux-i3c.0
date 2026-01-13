Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F84D2F33E
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVrYfnc1mPBCa/TsPvH4sSS14lrb/uSSvC/tKudOX4c=; b=d2XkW47XGj1h5X
	MNlaD19RNaG9gPYPT8cRepL+/4FN4XQ+Pvn+OYkzRZWLHAm50iLQDwzasctMlycyG++pkX5iUMSIM
	+t3s0vYLWn2rPXgatzExvvJI2hGpCbT4C/oShaGVR/69UvRiaysmTKkBgEdDxUXJXuQJ9IOssEYnZ
	ErvFx/ClsPShEzPv+YXGcIA/ZwL8KqntrSFUS1SVq32kSN+62Rq1hdRQHo24VY1uMzkCb5exkbbAx
	ACEgUjEGcRjE8LNZOu+lHggoc31natqL4aOM8UoIziUHukZqG8EjV8K2/ff00OIhatf0QIkXwOYiW
	ql9WqfeyEFKbIwiYmAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhFh-00000007TfZ-1Lod;
	Tue, 13 Jan 2026 16:28:17 +0000
Received: from mail-norwayeastazon11013059.outbound.protection.outlook.com ([40.107.159.59] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhFe-00000007Tf3-30J8
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 16:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhQrr38fXKvPiWJ4Rqw9qkU3fYZ2zK2CgFcnznhzLwNArNojKd/bQnSwjhTnch30ML8f4egk0FxspeSyfaX4wprPWrR3ohSv4qme2ozN8NiC+x6qHOCy2lnAwVj+yiWkNRDarFB+bG5kvqrk5DaT+6GGV7vnbzbn0S/LY7k8ytT/PZwfwiAwsoSVKKf39vo3ZH1g5dg4sTAOxKIXdARjaTbm8L+sxQdft5k4bWeu+lnGB5V5i8jpoPWiQxMIIaQtW8PRU3r55xlXCDmd2XtGoLjw47DyoR8SK11n5PhwO64p4yErCtEGGGpToNbVlmD4jFasYxKZ6W05MIu6uPLeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf4J47Tef5KZ8D60TmRxoPxxP8ckd8C4HoiTQs0zGG8=;
 b=pMECxj8SeL0DLEgcmw/2Y8kLMZ+eKGoaYTvxS+HXDBPd6aYPrNds1Ltp+kgHjSEAmt/MteqY4hTH+I5Cy+XFKV2wM10LWtwfWfsf6Ugz6NfZ2KJY0Y8JLRN+ZDhyaTkqIbbBhlyVJ3yC2PtX0vvZ+o1OLnSBGI4D+QEWnY6rlSI851eHfv6FVLohDGD821XqcZ1I7bfbQSXZyVbCbcWiGXh0NHSPTQp/aph7i7W6/uLTSsYPICuz7pmgLjnvfdG1Mbjf52o9X1AYarDFVBiXFhDqv53+6LwY9def/oyPQpS2kd6Bc5N07FYDXbxYBZY8bnqxH+fEmnzIUHpC3JQ0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf4J47Tef5KZ8D60TmRxoPxxP8ckd8C4HoiTQs0zGG8=;
 b=dOya98Uiw9qYz81w9idKW8rp05FVOTfnVM7XASAkg0ltsTSKGowlo8c+Wxq9I+zM/fLkO1lp3vGsEQDEyhoOJqe5iWMvxH++dp+X5ANSaoDWRCoYwslKVMB/nY3Gn2HtjfbiL0o77rjY5OWrnWcl4kfbDYyrQKoql/LWA2cCxa17874cYnkidT9xJ5MlWZxS6GS/FeXMZX07BapVEEBX5sOkBCOOtfgQdSAYoYBj2nSrLd5VE+XBY4xjPOLTMOeIjNvasxdDwFcwuqy3iIiJak1uHYOs3pXI3SHtiNjzM92Xai5IALWHZD3LiHxTU7Gxajpmfx+krKi+jADlj6DWaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by PAXPR04MB8427.eurprd04.prod.outlook.com (2603:10a6:102:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:28:07 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Tue, 13 Jan 2026
 16:28:07 +0000
Date: Tue, 13 Jan 2026 11:27:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 16/21] i3c: mipi-i3c-hci: Factor out core
 initialization into helper
Message-ID: <aWZyjxkuXEb2CH11@lizhi-Precision-Tower-5810>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
 <20260113072702.16268-17-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260113072702.16268-17-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:40::40) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|PAXPR04MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 3878a11e-6f8e-4c28-8715-08de52c0bb91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|1800799024|366016|38350700014|7053199007|18082099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tgE5Et5zR7NqglDm1GFgsUiA2D3na7DCCfiEOR3sc9odFFYYsLaCtOb6MKm4?=
 =?us-ascii?Q?3qjM34NaHtMFxCxEjGkGrrlxJoj/+0NYrXIv6BeuJf6DillKG4Z5VQ84YR+x?=
 =?us-ascii?Q?XUJSl8E0bZmFio+BiKdDOQo5Bd7kKTwRYkw9aJ/ckj2OiI2LH95tsg9oguTB?=
 =?us-ascii?Q?/8We6HKrLtSg8oFyLIU9GV7PLU4k80fBz5jFU3UFIXmC0xCpYnBgYnU5YgAi?=
 =?us-ascii?Q?lLsiG64i/Pn04x/3W4KZGclbjzpUbQUpYYLzQak04glyx4Qx7cEN7ETnbkoB?=
 =?us-ascii?Q?u0iy7FuDPaROH3xmZaSSGEFnsvWqUullIqOnD9c5MKuzudZo1W69FUWwAn83?=
 =?us-ascii?Q?pADBc9lB9eB+gBTLWrf/9dCamAZUwUynTYcASot38klK7QIijwrLk77lbBkc?=
 =?us-ascii?Q?/wQ18n6/YgZokC+IVMyh408xvh0/OkmzCKk2pNDFcvoDkWYITDpFz0621b6h?=
 =?us-ascii?Q?3oEGWiKQxS7XctbStuBsq2QqbNIkphXOGOi5vtKbjGD209j443glLWdgqlp/?=
 =?us-ascii?Q?uLJ9zddHYsYI25NqAwno3IzfRhXjf7SqHf4FGn0O32m/rkK7W2S1WlnhVgKQ?=
 =?us-ascii?Q?mE8dcV6yk0h/yYI8MmYck9to8lmo3tcKuAg96I//9WL0mmzF07VCeQrdeLPc?=
 =?us-ascii?Q?3nmJVh0663WiIHSeYuuQ3scQMRHFFZe8LZMMRw1UeOV1Cs3AS+8K9u2xIo31?=
 =?us-ascii?Q?giU+Wsa/Eov1WqVkgnqT2Gg7PpEzE0rKAYLYXsOuIegU+ZBqsRXh4a64Qh1/?=
 =?us-ascii?Q?p298bZ7VQL6zDSHZA4yyF5ShDk/q8iE8QjkQhKn+xHAPDE8cNmCZfmBkEt3C?=
 =?us-ascii?Q?pmSqdLGHkIZ7mduL8H4/iNFHsatwdmICDfB5ExcrS1Bex6G4vrtBaOB03ncR?=
 =?us-ascii?Q?L4Bmtd7Z0YPMG/QY7H0+NGpbN3yBGwBfXjdopMfvhscXGGHMQYpwiNDaRX+c?=
 =?us-ascii?Q?AfRzBQrpBdf1HsP7Uir0xPAfs0CsXtHXSNwSiZ2g4gigs0uCmvl6IgYR7uiY?=
 =?us-ascii?Q?DwO6MMIBhEUybhR+NS58MEMO1PENqOUGIP+0ZgvI/Dwz02/R0fLqme7oEVfV?=
 =?us-ascii?Q?nQ8wFxrokmtd/rCKei7GfdRDyoViA2c/2SHCZMlBeUWa5cK+P0usDRFQc5uM?=
 =?us-ascii?Q?0+d7djoDlLNNn2ADb1JRo8TF9WCWGGutn648V+dA+CCWnONiBLPdOTP3NzBo?=
 =?us-ascii?Q?Z1b9GWKQIQ9Te5x8HOJqOMBBDaGHej5HEc3FH1U0F3KWS+EHNy7aKU3PUlDK?=
 =?us-ascii?Q?Yl6/GrO3LpcU3a9Vjpc+R1qvNmPg0+5urYAMrQWfXCFb9g1dXPi84MZoGV2p?=
 =?us-ascii?Q?FDNDokUoeEPHkkQs3w5eLwfzej0hjw2vtiZi/cQ1OPOBz2x0Vvu5JfMBTBwT?=
 =?us-ascii?Q?b5yBXUOTBCFVlqa1D2dazdCmj00I1JL4Im5AX0HthHi0boMOEgvMHMVCTx/L?=
 =?us-ascii?Q?JD51CzqhXOm5BYkrArUVelWH5g54AzJksvV0gKdCp/zIJkamcKO77zAEfadz?=
 =?us-ascii?Q?WpGRTxFWFH32B1e79U63DUbwxyQHdODY1KVZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(7053199007)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qxyjrffmDocEN4ZM8Wj6YeGetiC6+sMSsJ5IZwj9MF0dlLxRUAe55Wb8nGPJ?=
 =?us-ascii?Q?E+k8UqpKGQ6EvKHgjozdafOJ16bH0IKVitJ7CaBjMI6LiIZ6LBA+Tj7OjYEz?=
 =?us-ascii?Q?ZvCcXwwa3bvJ/C42oK49QE+gpCAv/kjuXFM0RGPgJwz8qOSUIFCbZR0SSfhp?=
 =?us-ascii?Q?2riOcB5rflNRtxPd0zTKF80DR+UJluigHRFqRJyusZ+rbXRoRnJjK+5IybK+?=
 =?us-ascii?Q?mw5xT7jJqyvFnVfHuiY6bOTnLANqw62mJEvpIsQMG9xm7E/fWE0RSKioGLi3?=
 =?us-ascii?Q?Z8QWtakwG1UG4ToXRacyj6Q2nCfSR32mEbsGWibaLhsEo5saygW8nKzW8Ck1?=
 =?us-ascii?Q?hDwHdgOBpssNd+9qhtV4PXTqLGwTGVYk4GCPOMh3JyzHmwdaCSUFcEqBIN2i?=
 =?us-ascii?Q?k1BL6cqVLTxqjAVhJ4uNZAnViI1cGNHTIjUZwFpF339hHDGBWuoBd6qXwZsG?=
 =?us-ascii?Q?ZMWFmnxpbVqRCLL6GIjR82SirjzkKdE95JrnN1rlEDru+RR655U8/UAF3Dug?=
 =?us-ascii?Q?hoLh2Sf/wdQBHlGvXnaLg6/efwpBhHZBAV7WCEZPqCi1neW98GXinXzYRE9o?=
 =?us-ascii?Q?3ACKiz1S0qFOkYi9FNCTofq3s/Y3jHcXRPu5mmZt6MpAzXSjc0PXNc32ut1x?=
 =?us-ascii?Q?/VEmm5jeXkkzCKyVhnGdi7PQGHrtHKLp3WlIt8+65kTdxBH0ANM90PJ2DHjL?=
 =?us-ascii?Q?YNzl/dXtTk26sUYfbRJg4dP7VElKjg9TQU3nBgSWGDfXLo+qW4YnIgO09Fvn?=
 =?us-ascii?Q?WoWtSULYXBKlo+3mqhpM9owXfeSSA9HK9sXrXVfpJEIb5X4gCLCXrqtCCUKZ?=
 =?us-ascii?Q?NGHHr1etfO5qZGt4B/fNCq528a/DwaPQJNQpvB0LdJjly9Wo0fHWr46Ww5TZ?=
 =?us-ascii?Q?iwwIO5jLRZI+x5vLVBuEJd5nRQKd513BMatj2Mo3Y9hBAMX2xbOpHSmxpKJb?=
 =?us-ascii?Q?MuCMQSAmdrEyH/OU3fy/eKFfStqWwuPxqywgNy3QZMUyx2QoCUDDtrSN+RBN?=
 =?us-ascii?Q?DX2DmUQGTawI/0Ng9sGVnyZux6R8OJtsnUMlUIcolvfrlLgn10fNc/S1IqrW?=
 =?us-ascii?Q?gIPuD1bwrgcAHa4lu/5BLoJ0Ws/0wFKVX0vX7mLEEX44ad9iCxUbl5hALpPx?=
 =?us-ascii?Q?x5zPuFUsWW4pwNPvRdx51UUndIkhePfghG44bFsAzUX3/fbXpK49hVFgD4OP?=
 =?us-ascii?Q?NdWHIeUNPQrHu62dTKFFLdmUZopMSUSJQA8TKo+HYs+zJaWDWu3v+vIfiM/C?=
 =?us-ascii?Q?bbk2d05kCzoP8fvL7pjYPLUAlIl4Dd+WCA2d+Lgl8nJ6tOVrKxaXzcLmK7Iv?=
 =?us-ascii?Q?kKcqWrrXp8ao7u0WHuBUQKPtmiQT3N0F9Fia9l4jMowvCH/YeMvvEbRAl5DZ?=
 =?us-ascii?Q?E0veZQ5dBksCIszUAO9NxbWF2oSqoZMzv8MYAH1vCXhoLjW+oFrPgirVEaLz?=
 =?us-ascii?Q?0s3i8h1CTIqaEitKNkOXJ03rYT7fEIEcReWHB/AeM0tJXbkTxEpQ65/9cVQf?=
 =?us-ascii?Q?DdCdQauG9vEMi2LGZNAat2ntaM/Z9aXJ0Rx8C7wBEMuAW+iYk5y8xjp3hEbV?=
 =?us-ascii?Q?tz1A92048+Mvp+UL5mmAKNAafiRNJkWfHKio5f3IV4NczK5ODTSr+ZVx7kZ6?=
 =?us-ascii?Q?n2mOQBkuAgL5PQdtun8bzRx24nD5euXyVncY3mgEau8tB9VpcSYKQ6tl5U0A?=
 =?us-ascii?Q?QMIf+e1cLXvDcnigttNVx6+Vd03EObJhUdG4fFOji2lymBNWI84i6kfyQh+q?=
 =?us-ascii?Q?mpP+nT/DmQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3878a11e-6f8e-4c28-8715-08de52c0bb91
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:28:06.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzesM+9p47qQ8RLYXhtwCQNMmeNEMQFqTPYHL4WdeyrU+5s5rT+C5tCOrSsb8eN6AIgXtV+duu+sGx4NOfAQAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_082814_760326_D9C637D9 
X-CRM114-Status: GOOD (  27.20  )
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

On Tue, Jan 13, 2026 at 09:26:57AM +0200, Adrian Hunter wrote:
> Prepare for future reuse.  Move core initialization logic from
> i3c_hci_init() into a dedicated helper function,
> i3c_hci_reset_and_init().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V3:
>
> 	Move I/O mode setting if I/O mode already selected, to a
> 	separate patch
>
> Changes in V2:
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 142 +++++++++++++------------
>  1 file changed, 75 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 569c8584045a..8b8e3952d41d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -639,6 +639,80 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
>  	return 0;
>  }
>
> +static int i3c_hci_reset_and_init(struct i3c_hci *hci)
> +{
> +	u32 regval;
> +	int ret;
> +
> +	ret = i3c_hci_software_reset(hci);
> +	if (ret)
> +		return -ENXIO;
> +
> +	/* Disable all interrupts */
> +	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> +	/*
> +	 * Only allow bit 31:10 signal updates because
> +	 * Bit 0:9 are reserved in IP version >= 0.8
> +	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
> +	 */
> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> +
> +	/* Make sure our data ordering fits the host's */
> +	regval = reg_read(HC_CONTROL);
> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> +		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> +			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
> +			reg_write(HC_CONTROL, regval);
> +			regval = reg_read(HC_CONTROL);
> +			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> +				dev_err(&hci->master.dev, "cannot set BE mode\n");
> +				return -EOPNOTSUPP;
> +			}
> +		}
> +	} else {
> +		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> +			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
> +			reg_write(HC_CONTROL, regval);
> +			regval = reg_read(HC_CONTROL);
> +			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> +				dev_err(&hci->master.dev, "cannot clear BE mode\n");
> +				return -EOPNOTSUPP;
> +			}
> +		}
> +	}
> +
> +	/* Try activating DMA operations first */
> +	if (hci->RHS_regs) {
> +		ret = i3c_hci_set_io_mode(hci, true);
> +		if (!ret) {
> +			hci->io = &mipi_i3c_hci_dma;
> +			dev_dbg(&hci->master.dev, "Using DMA\n");
> +		}
> +	}
> +
> +	/* If no DMA, try PIO */
> +	if (!hci->io && hci->PIO_regs) {
> +		ret = i3c_hci_set_io_mode(hci, false);
> +		if (!ret) {
> +			hci->io = &mipi_i3c_hci_pio;
> +			dev_dbg(&hci->master.dev, "Using PIO\n");
> +		}
> +	}
> +
> +	if (!hci->io) {
> +		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> +		ret = ret ?: -EINVAL;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	/* Configure OD and PP timings for AMD platforms */
> +	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
> +		amd_set_od_pp_timing(hci);
> +
> +	return 0;
> +}
> +
>  static int i3c_hci_init(struct i3c_hci *hci)
>  {
>  	bool size_in_dwords;
> @@ -708,43 +782,6 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (ret)
>  		return ret;
>
> -	ret = i3c_hci_software_reset(hci);
> -	if (ret)
> -		return -ENXIO;
> -
> -	/* Disable all interrupts */
> -	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> -	/*
> -	 * Only allow bit 31:10 signal updates because
> -	 * Bit 0:9 are reserved in IP version >= 0.8
> -	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
> -	 */
> -	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> -
> -	/* Make sure our data ordering fits the host's */
> -	regval = reg_read(HC_CONTROL);
> -	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> -		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> -			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
> -			reg_write(HC_CONTROL, regval);
> -			regval = reg_read(HC_CONTROL);
> -			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
> -				dev_err(&hci->master.dev, "cannot set BE mode\n");
> -				return -EOPNOTSUPP;
> -			}
> -		}
> -	} else {
> -		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> -			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
> -			reg_write(HC_CONTROL, regval);
> -			regval = reg_read(HC_CONTROL);
> -			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
> -				dev_err(&hci->master.dev, "cannot clear BE mode\n");
> -				return -EOPNOTSUPP;
> -			}
> -		}
> -	}
> -
>  	/* Select our command descriptor model */
>  	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
>  	case 0:
> @@ -762,36 +799,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (hci->quirks & HCI_QUIRK_PIO_MODE)
>  		hci->RHS_regs = NULL;

these parts have not move into helper funciton.  Is it safe to use
"hci->RHS_regs" in helper funciton?

Frank

>
> -	/* Try activating DMA operations first */
> -	if (hci->RHS_regs) {
> -		ret = i3c_hci_set_io_mode(hci, true);
> -		if (!ret) {
> -			hci->io = &mipi_i3c_hci_dma;
> -			dev_dbg(&hci->master.dev, "Using DMA\n");
> -		}
> -	}
> -
> -	/* If no DMA, try PIO */
> -	if (!hci->io && hci->PIO_regs) {
> -		ret = i3c_hci_set_io_mode(hci, false);
> -		if (!ret) {
> -			hci->io = &mipi_i3c_hci_pio;
> -			dev_dbg(&hci->master.dev, "Using PIO\n");
> -		}
> -	}
> -
> -	if (!hci->io) {
> -		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
> -		if (!ret)
> -			ret = -EINVAL;
> -		return ret;
> -	}
> -
> -	/* Configure OD and PP timings for AMD platforms */
> -	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
> -		amd_set_od_pp_timing(hci);
> -
> -	return 0;
> +	return i3c_hci_reset_and_init(hci);
>  }
>
>  static int i3c_hci_probe(struct platform_device *pdev)
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
