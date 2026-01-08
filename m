Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB057D1D46A
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSqC4WXNm8+uyJ85lkFskJr3Uc/aJmaLX+a3xU1EfcE=; b=kudcaPajNvDJsq
	gwdnAdBAp79YDcAWQCp76F7OYhjOHb25UPq52SGtH4yzDFnFsNv3Um15hCurSlrP2x1np0zDxyxEZ
	a0GdVp29lWwjuyrVCOprXvdGeLNP4gfTJAf1iRJ+Wk+C2lAF7jNhSfzgmIQTbvfvZvrEgwQE7MEP3
	h51XTz45GLd9n2MEpM4PwLtTwxfGuaPwPvVXjmdo4xPO6kLhGESOuw9Qrcq2GB6DvMHQfhb0eW7cK
	NyBSGEhM/6k4OfYZgk1tX8Hfr7Svi9DftXv7DgOBfNYqq6qNq6SO5IYurATaJ8pHSczQRBwRx0wzr
	WPRg5qP+Gl045gA1cBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrkA-0000000HUAR-1iOZ;
	Thu, 08 Jan 2026 15:16:10 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrk7-0000000HUA1-1tQA
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 15:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQCN0BWbGQWrFsly0XueHZatrqadoRiuKJuVfMC38VNXmd8xsG745GWHD5+bNF4kiHUENRBa43qCcYLjoVx2Cv0xPNqBJop/fN7Vu7iFXdxmLKcoms6A3WkdxH1uEzuJDMUp9+FGSR7QPfTg9Zmhv+JtX6voUTLDqw2gbeXsDO811MyfTl/jMTtRzJoxHdy3BjeI7EULfIuOqoL7yR/6xdczpDm4vS84/tMwjED3vNQkTAITUBmtKbiDTc8CiKjUHB1paSnOrnu5X9aZB0+4oTVQJ/ZgtW1QwkGe8IFQniW7LtVQU8bQABPB6M6+ep0eK/m0a3x5f8icAN9bl1dP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrzKeFYxPxGKOOsf8tFc7u/GF4H9dI8D/6P4OIy0hA4=;
 b=w6sMYjyD7QLJggoN/HAtCgiQEdz53n+87kmlqOwFl4V6VHXF8I3gRS9/XKEZxhPm3cRY21t0aOc/snyGkxyx8+m518cxTYgGqRk0ePm/XUuzRQASSP7VjYCjob6WwK2QR4QKLyYLlOOusDBaFeopQpr3EhZthMQRHtrOo86iO7lnGUOOJe1QZ2Uk+BW7pjt3KRlaWjMZ8o+teB823li1wWz5/5BRAeqYX8TjnX+/V7l3xi/pKz1vJ1g77dVE/xVx/JMyySyzeY+p1cc1LpxboZ7TZb12fM53s+EOY8jF3MpmwS2r5vlKRAU2ig0RABJAbIl1i0adxaDnwJNiWsnM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrzKeFYxPxGKOOsf8tFc7u/GF4H9dI8D/6P4OIy0hA4=;
 b=O1CNB2NJ3xYS4X8lqGI57Ib3BYBNEPzPpQT3qylxZPH89jKq3fgt9XCWoFC6wTFFEDdXdWbzB+sIGuK440ZmHlfQLg0dmPdLHXOPPv05LFFWdldc7I8zU+67lz5dO+2Z208dP2A0rbKIdRu9LHYsK1AbvUGQ2NxkJTEMhGXyeI0ug2GGY0hZ0xTXLshLGZZBOSOJRi1a0ZMP+KUAAuNzqVh3EgDXymopNAy+1L9HKC2XHv0t+Ib3aK9/mcj4elI5/yEVFqblARxL1sMgiip6Nlv43qnQJmZWwsOrbEhQAB2kY8SouxB8r6MvgI1c7lVtPewEM17N6gQjUJl7qHZcAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB7650.eurprd04.prod.outlook.com (2603:10a6:20b:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 15:16:03 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:16:03 +0000
Date: Thu, 8 Jan 2026 10:15:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 19/20] i3c: mipi-i3c-hci: Add optional Runtime PM
 support
Message-ID: <aV/KLNzxEel+omYd@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-20-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-20-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR17CA0069.namprd17.prod.outlook.com
 (2603:10b6:a03:167::46) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 3012daf9-b72e-4932-ab68-08de4ec8d688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dnPqt0DUFzBGKHnb58E48SKPEv25Dq0WjZkJQyfryBpkOEFmVTf5wTJW8zCv?=
 =?us-ascii?Q?7gQOTLLbPaPVdmX/rfhHGVd1QDJPwh6LBsFIJCjAbUEe9YLv94JnBgPYSwLg?=
 =?us-ascii?Q?L72sDiXU6x0nrt3zfxo+SEQcdTp64WGaxBJ0fjsQAwqk3vV3jABaYfLTfeaD?=
 =?us-ascii?Q?pMYP33rRFdd34tPVrxI3iA6jKIeJkZrQ9+Hf9ZV8PDtHv6tc1zBMUHbDwhQq?=
 =?us-ascii?Q?gxunwPGo4EPeMgLoWW3Z6PuGz+J6J/yW06dXC5JWYGLw5GDcsuuXmotTTb5o?=
 =?us-ascii?Q?TKmw/mWtalPcr3S9LW7pZqaCHP4Azeo/AIVrhA826rX25F+Nty0ssksX1k9s?=
 =?us-ascii?Q?42NlJ0aFsHajBX0jKIa/GRCh57npYu6ay7JPYW+qeMCIV047mY0G4SL4tByN?=
 =?us-ascii?Q?73y4rlnMZRo9S4/xq84YuSh3/4JgRPKi5P08gHNkA62o5UIlg/pKLPGRkSPb?=
 =?us-ascii?Q?x0pU/lVuHq/fe9tM5xneCeT6XNpflGiUQmUctnezMAfrHOKgZoxusxJ6e4Bh?=
 =?us-ascii?Q?xwRW5f3OcTCx54koZVFGY3XW/dmXa4x+qRLhm755CSfhcvOKk0O7C7DtPier?=
 =?us-ascii?Q?NwhvdaH6cnJfNI8qD0IDmZp+VBXDUL7i6PfHSX61cUhhvxXuonbsLDtEQ7cj?=
 =?us-ascii?Q?7izqHO+uVsXogrgOOWLcUx5qJHr2q9kFJYctm8hccRD0qve8uvFCHwxqbJKm?=
 =?us-ascii?Q?Afg0zzLD+GYSkPW4k78RtZHnVUoXQnBuX0xOCiKkRPWkgaYXnRfZm1BlGslD?=
 =?us-ascii?Q?stuFarS5QXl+cpaT+tYLDP5F03XJtigCbOE+tanf6bNudCV0mtS5bN2WcrLm?=
 =?us-ascii?Q?0lwBX38MwRBUvRUd2QbHo/C46vQFYPz4CLtpOOH4gDl176H/xNYRTWUt1V1B?=
 =?us-ascii?Q?TXOtQpC7Sb3CRUfKEGOsfg+wZ7noiswFVEGYqE84V0kg/4u1bUIhozkGwfWR?=
 =?us-ascii?Q?si3vGaLd9S2VTc3hnpAHmnW+ThVXgcR9YNVHgocich+aAt61buUURLhS424q?=
 =?us-ascii?Q?fT9GT4gumkurbrsfh7NiOaUW861YYr8WYb/PtfIUnqWE9GJO11QvjMWUp70A?=
 =?us-ascii?Q?vPFSK1E+tBTEZF+jwiBB/AUiAr/Wepua/vjdN9fEMqo/WMpyiKvV+iDj5XPp?=
 =?us-ascii?Q?mfDDy2yGE/Iu1yedKb/frv+d6gZEfKGVLFE6bPNpsBkjaFGmz+1entKtdEkH?=
 =?us-ascii?Q?830VMI02hIMCTQWDZlx05UUvEotBGAZNqwj9csFh6jxJ0jVC14nn/codfOkm?=
 =?us-ascii?Q?xlfT+wsPYyq12v4dRg947W+k5BJ3lfKfAm75058stm7FBZMbDx9iUFzt8FfW?=
 =?us-ascii?Q?iuwkYd9Es6BkBMIT5tKS+Qy5A8CoBu/7SRcVdzQGADhGIH492YIgU1P59EAn?=
 =?us-ascii?Q?lS9Ya/THLsL4Em5IdhxX0q0/rUKc3lmasRjzvdmhpsal287Gwi3In1IaWm7E?=
 =?us-ascii?Q?K3f9TLORtyTwSLwljXLMcKPLjXrAG9v5zQmd8Up5ejM94ET4VfdH2GqNxDKD?=
 =?us-ascii?Q?kEPx/6exWvaDj9rabrJgISZgFxBhLDg8ECqc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WsRHvvkonDoGz9TKDavlJgn0vZ1RvvoW2ZRkYiDMO8Cqr75oxymnw7Kr1vFP?=
 =?us-ascii?Q?e8A0IO6W2mJ70SxFEWERfBL7K3hPHJxqb/v7wYtJR3uwoWkIZr4Y3zDebkw0?=
 =?us-ascii?Q?7CbiE2izY6775MtrA8vsewwj0gVEpWTIVgsR1HR78+W0GEAdzd663WZXB5oY?=
 =?us-ascii?Q?gcxb/Bofi33yMSzf5qpzokXq4Cpophd6bpFLjZky7g6ImN7yxvRSlPV7te+x?=
 =?us-ascii?Q?PIOTdbuEdU1B3kbBApBgZiUi5xPdN269ywugenQatY8kSVrYfjMgajwZk5yk?=
 =?us-ascii?Q?/pAOPWIb8LCDys45x/5/L4AIgV0RrYWR7QuFbmKFxtFhRmJmAJe4vE44FoAB?=
 =?us-ascii?Q?vGGuwWLwolByod4IbJqxSAkxhQOhNbfjqx4cVz78ehihCMirgAjQYk0crvJk?=
 =?us-ascii?Q?SfXMXpPSRfFbRNCU9e9zb8ehaEZFeKHtyodmNN5m0UkCqGb342lwN9iJuEX3?=
 =?us-ascii?Q?8G8EbDAfXa1wFcCN9ZiADomxK1Uyec0QvS7et8VsWhFi7nqlDFIhZqNAfe3D?=
 =?us-ascii?Q?hxC6S+5XPTYbt9kbtmDkvvENOPHLPb4ys6ple72Wq6FmS3DwKk4eGmVZm8js?=
 =?us-ascii?Q?FryOdNozveXE7LFAH3Jib8Y77hNqtnF/jXzs7hmWCHf4sz5EWKJJ10cMO4Hw?=
 =?us-ascii?Q?3wQu4BW+7BoHMzJovB2kgdLXXOIT2A14egLXFEpeI0bRAi168HZDIJMxfOim?=
 =?us-ascii?Q?WeVdu+v2QpYpzX5WvMayR1Kp6UDVx1AlPvizlnBVd/gLpDNDugy+d2wVIFbK?=
 =?us-ascii?Q?umvD8ueO5xcOSqyDRAjB850Ur+R0lva7sR5y8TwlFjC4pNsSszyh85kuYK2o?=
 =?us-ascii?Q?HuJFNzkxxmROdVFL2ToVSaYW5zLqJzmGJRyf+Nsluwuar0vja7Uho9xFF+5n?=
 =?us-ascii?Q?3fBaw0y6psjmnMkIVTFJgT8JmYKF2nrX8fqpgJ5T+/vQfABpi3XBctbh81oa?=
 =?us-ascii?Q?hKVAzC+i0I/h0r/Ln3hkcDFE+FTeUIOK0ZI5ZtH+HT2P+A0NmQ58q29V0kmn?=
 =?us-ascii?Q?WHVaf3Z4ndMfqZTtx6RmA1e/pzH2Fxxl0YK3lcwKRy8r++QT1QV5y7C/AecS?=
 =?us-ascii?Q?NXXkOLsDsfI0e/tIqShelHMYYEpydsTjIko9xpKBjMDsvg3VTur/raqwF0Nd?=
 =?us-ascii?Q?PirmRJqlG4kPaXM1wNMQ2Wp+7pbHP5uEXOAShTrDndc4d/hzjX08+Z6kJqK2?=
 =?us-ascii?Q?OflkpxRDfKIYCLy+HcYc/m5OLaSN3dgG8vCKitSFIrctJK7lLQDQtLy+YyGZ?=
 =?us-ascii?Q?n3QNTlso4xVfgkY9N8sh27Zlzn92/5Tbh+J5LPYwGeqpZBCVGFl3CZyaux4H?=
 =?us-ascii?Q?SWXMJBTrmTERJUkk+9nG+eZn5AkwpPCsY24fLkgUEND0eQ2kuMwxCF4Ji31Q?=
 =?us-ascii?Q?nyGfm1/LBAJef/NArsYBtSnPI+BB7iiuUsKo2eBFY1TUgcUOf0drHhUt4F01?=
 =?us-ascii?Q?TzbHt9sh3GJxLuQpcfPxvdBZfOzMIOdWbhYWGyVSAgdoE88GZZ0hPhDkpPqV?=
 =?us-ascii?Q?nsI/h8mlJaraPx8JqSpmDXFNUmdUBvFKD20DiKxcY8q4Flbwrehq3X+hkGnx?=
 =?us-ascii?Q?lpuW04+to/63RgbNjBqS10Ka85PF3FQfL6QedB8R0Tz1lZ2YbU3RJIrZ+hg2?=
 =?us-ascii?Q?9QR8PD/c2Tn0XvFtYBTObS3O455+wopRPcObuR8AZxHSSh1OyruPnOKwRcXk?=
 =?us-ascii?Q?3qQrMi8ofVnlR9szafKOL7YAT+HiqMaGGIHWlepQ92FRhEEp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3012daf9-b72e-4932-ab68-08de4ec8d688
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:16:03.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4liilanNngr1gEgjkrbQQYwmLx/tKxsZL0xP+qP09Hj5wwQeR13U2H5Mmmt3R/lJj8G4uUVVcfSTOJhvZvInuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_071607_842912_3853C03B 
X-CRM114-Status: GOOD (  34.05  )
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

On Thu, Jan 08, 2026 at 10:05:57AM +0200, Adrian Hunter wrote:
> Implement optional Runtime PM support for the MIPI I3C HCI driver.
> Introduce runtime suspend and resume callbacks to manage bus state and
> restore hardware configuration after resume.  Optionally enable autosuspend
> with a default delay of 1 second, and add helper functions to control
> Runtime PM during probe and remove.
>
> Read quirks from i3c_hci_driver_ids[] and set new quirk
> HCI_QUIRK_RPM_ALLOWED for intel-lpss-i3c devices to enable runtime PM for
> them.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Use new i3c_hci_reset_and_init() and i3c_hci_set_master_dyn_addr()
> 	Use devm_pm_runtime_set_active_enabled() which allows
> 	i3c_hci_rpm_disable() to be dropped.
> 	SET_RUNTIME_PM_OPS -> RUNTIME_PM_OPS
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 76 ++++++++++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 +
>  2 files changed, 72 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index ec5425f07635..02c5a133e329 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>
>  #include "hci.h"
>  #include "ext_caps.h"
> @@ -182,6 +183,7 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
>  	int irq = platform_get_irq(pdev, 0);
>
>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> +	hci->irq_inactive = true;
>  	synchronize_irq(irq);
>  }
>
> @@ -564,6 +566,14 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	irqreturn_t result = IRQ_NONE;
>  	u32 val;
>
> +	/*
> +	 * The IRQ can be shared, so the handler may be called when the IRQ is
> +	 * due to a different device. That could happen when runtime suspended,
> +	 * so exit immediately if IRQs are not expected for this device.
> +	 */
> +	if (hci->irq_inactive)
> +		return IRQ_NONE;
> +
>  	val = reg_read(INTR_STATUS);
>  	reg_write(INTR_STATUS, val);
>  	dev_dbg(&hci->master.dev, "INTR_STATUS %#x", val);
> @@ -723,6 +733,55 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hci)
>  	return 0;
>  }
>
> +static int i3c_hci_runtime_suspend(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = i3c_hci_bus_disable(hci);
> +	if (ret)
> +		return ret;
> +
> +	hci->io->suspend(hci);
> +
> +	return 0;
> +}
> +
> +static int i3c_hci_runtime_resume(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = i3c_hci_reset_and_init(hci);
> +	if (ret)
> +		return -EIO;
> +
> +	i3c_hci_set_master_dyn_addr(hci);
> +
> +	mipi_i3c_hci_dat_v1.restore(hci);
> +
> +	hci->irq_inactive = false;
> +
> +	hci->io->resume(hci);
> +
> +	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
> +
> +	return 0;
> +}
> +
> +#define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
> +
> +static void i3c_hci_rpm_enable(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +
> +	pm_runtime_set_autosuspend_delay(dev, DEFAULT_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	devm_pm_runtime_set_active_enabled(dev);
> +
> +	hci->master.rpm_allowed = true;
> +}
> +
>  static int i3c_hci_init(struct i3c_hci *hci)
>  {
>  	bool size_in_dwords;
> @@ -841,6 +900,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	hci->master.dev.init_name = dev_name(&pdev->dev);
>
>  	hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);
> +	if (!hci->quirks && platform_get_device_id(pdev))
> +		hci->quirks = platform_get_device_id(pdev)->driver_data;
>
>  	ret = i3c_hci_init(hci);
>  	if (ret)
> @@ -852,12 +913,10 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> -	ret = i3c_master_register(&hci->master, &pdev->dev,
> -				  &i3c_hci_ops, false);
> -	if (ret)
> -		return ret;
> +	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
> +		i3c_hci_rpm_enable(&pdev->dev);
>
> -	return 0;
> +	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
>  }
>
>  static void i3c_hci_remove(struct platform_device *pdev)
> @@ -880,11 +939,15 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>
>  static const struct platform_device_id i3c_hci_driver_ids[] = {
> -	{ .name = "intel-lpss-i3c" },
> +	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>
> +static const struct dev_pm_ops i3c_hci_pm_ops = {
> +	RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)
> +};
> +
>  static struct platform_driver i3c_hci_driver = {
>  	.probe = i3c_hci_probe,
>  	.remove = i3c_hci_remove,
> @@ -893,6 +956,7 @@ static struct platform_driver i3c_hci_driver = {
>  		.name = "mipi-i3c-hci",
>  		.of_match_table = of_match_ptr(i3c_hci_of_match),
>  		.acpi_match_table = i3c_hci_acpi_match,
> +		.pm = pm_ptr(&i3c_hci_pm_ops),
>  	},
>  };
>  module_platform_driver(i3c_hci_driver);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index ed89228ea971..6035f74212db 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -51,6 +51,7 @@ struct i3c_hci {
>  	void *io_data;
>  	const struct hci_cmd_ops *cmd;
>  	atomic_t next_cmd_tid;
> +	bool irq_inactive;
>  	u32 caps;
>  	unsigned int quirks;
>  	unsigned int DAT_entries;
> @@ -144,6 +145,7 @@ struct i3c_hci_dev_data {
>  #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
>  #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
>  #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
> +#define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
>
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);
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
