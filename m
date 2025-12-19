Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD59D78770
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgyWbGlcAT7kdUHtIkwUNs6azOFTqv6C3OcZRGVzZ7Y=; b=QtU05EMXe+XFKT
	pw31h5JdERd0//MlBnxYY/CcsEPGJDhkSJ6tUZBadoEMnD25J8jHMm+ou0RF2J5qkGSRD/Lv34//H
	pn7wbwTgUmgSRFmaFUF90EySo+ehy6ZhKzATBXoaxMFoMYPV5dgQU0qTjltRRcy3MKACOPGeEisL2
	wxPed1p++RVVjupPP3ONbuVJMWa6Vr5zhj+ACxwrT9MaIaps3wooaDI0pE6LeKmYU/2TKhV87Rx2U
	MuZ76A+X5gUR3MWLdwQGo60JVt+0WYkEtzpasM695f8LOBVkM7gP7Pj9qBkhdk9HU+fYqHLZdzgB4
	oRYiGRZL526mOW10VwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWddI-0000000AfPm-0mWD;
	Fri, 19 Dec 2025 16:47:12 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWddF-0000000AfPJ-1lMX
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:47:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEnAXDTWX0+mN+qUcmCvN4FFbKtdyx0oEEieTNvEHaosPrBoDeje8Y+q/1t8oaJLKtFkn1xkR9xkiqawm6WZJdQtIMSfH1tT5OOujlaeF5OuUXytIEw9w56Drg77+4Esl0Y+srOQCd6oGj8UFlCtlNReVHiNxmQxk7Wbro28hj+UT0hUMsqof9y7eF3ncz4+ab6Qpv6ZUGl+FaGLuu92SuYIUaZaYkizOmsUVVqqTC1xpNtdf3y+7y0HTd6QK1b6J67tNFyiISBRpkLTtXzPvhNHHtleaDt2b6wdAri8gP9PP78yKMPZadN58dT3IIQiMFJmoY0kjf5Omz7rT8pnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/VnkJMtfHASOkXjZbJ6SDpP5XeQEJy2hlMk02Z33Tk=;
 b=KvCwtZH0Twk8ZWslR18EU/9SQMdUScxa6X13k92ONH38slc2VgGHEYwutETy59h626f49Jg2OcikhzuZNg9JGBGO8qMJNux8rrqkNH9l8roh46mq97/YjFQ7o9AGTBls6fiT3P2Bw98z7vUWrh4+CBnDMHMHvcNSAsbZX7zDWwAotCWck+zbjQK4zaf3hPoPUd5Ym9gRlqcHNEXPiXZlF6iS/y0WhRODYrDMZP8wLZfptNnGly6OLqbocJiAvsR+1Ax72wgzy9nsZ3+g4v7GNv1FCUbncNKR1Oqh75fqeud9obIvmG2qXNEhZkLzkZN1Qx9B5BXxYFFjIuFFdc+r5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/VnkJMtfHASOkXjZbJ6SDpP5XeQEJy2hlMk02Z33Tk=;
 b=B/t+jf0RBX1NqzcjkFFr6wOAHOb28o+jT3Mt1gcZIXP1jpInxXJPzv8kilFTBbJ19z/t0VZspj/tUYLMj87I2tv2PLIGdR9b5MIiY3Pgs82L+vvb06LP/VHGlXXjplxkeWLlZOylpbs981Nz63NNC0YXaStWxDCHfsbA1crIFb0SbB+8uQqeO22ODYSV21nwTbJ7b8bXSymOb5Z9Rlbt4KTPLIgWXdxOEdrVc+22o8PNj4f1hQeNmiJDDRQx7r/T2HPp10oDLwz17Bh7zI9ta5Nu2ucVTD6/GTUzO22eV449GVKWnjkt5lrF43O53LiSaRFqez8mW0HEqL7LaWXsUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:47:04 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:47:04 +0000
Date: Fri, 19 Dec 2025 11:46:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 13/17] i3c: mipi-i3c-hci: Add PIO suspend and resume
 support
Message-ID: <aUWBgQj9Ckowhj39@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-14-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-14-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM7PR04MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 144114fc-1d10-44d1-ed01-08de3f1e3d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ab2Z1wrhsWW9BjgMr4+c+q2INtN87OUSgx8PsIbFVVlhpSK3f1gg6FZWy6Cg?=
 =?us-ascii?Q?NzOZPYnbIy1/nmlFdeL+GtQ3I7AhPXGMj/Nypks+N0kMKiHbHCj643A3+zHV?=
 =?us-ascii?Q?rVc4cBgxWDLrE9t1RLfCtg76hkT8DV5ZPr42JdNX7tqRLTYVhaT3/v5ldGTf?=
 =?us-ascii?Q?7HVDTzGpydAO0K2k2dOhiaeXq+A89OZzRSlzJPOUHusTtJA3CJaXilGNJAae?=
 =?us-ascii?Q?/K66SAZuJWesui3GCCWlu/G0N7BYwYe+esIXER6fKoPlhZK8yftmxzgXNvDQ?=
 =?us-ascii?Q?yyqlGrmtaJWt5QONX6mFN7zCo0uPmnlEBSnrNMFoERGwOSBqLqStb44o3AOe?=
 =?us-ascii?Q?JFGWL0eb4r2thjRJkaI4XObG5LtJGOHFrW6mdpc1TBTdBr+m2gOdXBUwe4VS?=
 =?us-ascii?Q?oYreZj12LOaYTDM+txnEZVA1CQlwl0WjHnzC+zAuTeobypU4hUgFzTAjc0f8?=
 =?us-ascii?Q?L8RuVXGdU+IeQlsszgRx6SE2sZuybNx6exWy9nPB1MKd6Cr+NWYvG2sHgWkB?=
 =?us-ascii?Q?EnZTMQ6F35CNwu3hqDucHSbQ4Xv+fCHFj1tlKqP00u+NiZwSa1Rke3X4Q+Oe?=
 =?us-ascii?Q?l8mWRHI93L4h1I4GJs8ym8jjIEJCfMN6cFybEScBk1uBKS7vf0p3/fxdgbQr?=
 =?us-ascii?Q?n9yCE412v2CWeTzTBYPNNIwPwD6042fR5x2vy4WKHOzAbp2hmSTQHRKjkred?=
 =?us-ascii?Q?rBwHuLWsKUEr2cV3B/S4J5k5K+7xcWZ09bYP67+hATvzrZNlYA0KzjM+NZ1J?=
 =?us-ascii?Q?QkJyBJygizapia2BUtno/bXeE4YP3imQ34u8zgms+qOo6jaWznj7yzbGOrWv?=
 =?us-ascii?Q?MVlq0OZBwtsCSVW29yn7Y9dVoSuDTZ1CUzk4hwnU9KnKjhoaBUVWT8Npg4hB?=
 =?us-ascii?Q?IAt1Zd4hoqyi5wPEihR2qYEIsjRn8Br7ShAou/nXaeMccYOHHaAo8UIuMFAS?=
 =?us-ascii?Q?T7XKohATQEolyBDZeWZDqYt04m+ewolsE6G7KDXp8pAWEPaRcWUjUH5pQJvl?=
 =?us-ascii?Q?phomhmaJorP9xdWcDvwoMZPVrq9W7InzBvAABhUTfdZ+65Pvt21hFe0IQof+?=
 =?us-ascii?Q?LeDMi2qsRneIKXL99InFyW9e3OOCOk0630OkXmKqsYpq3ENSo5lMRv37E1PT?=
 =?us-ascii?Q?EY7JrmaqKvsj6zm/u2GjzZSgMTGzTnX123gmTCF6LuobFKqpDoOCMGWXTgVo?=
 =?us-ascii?Q?wGjOrUVHWLNOgKs18dOhYfapxucAcDml58xxq1I5VGaZFrHNIzc9Id2UbpRf?=
 =?us-ascii?Q?b2S3ydP8B1ecD0O8LwluC1nct/brDAlyoNbCOD17w4zudl0YMXcjDOV1UN2P?=
 =?us-ascii?Q?xpMlCrYWFLmKk0kVLAuv03p1rBNj2Ti6NE43UAZ3E+s1WZ4YUSMuSkkhAZL1?=
 =?us-ascii?Q?xUhrO4JfkKdowJU/dVlGPU/ht8Y/N6SwPBOgFKum9Ic/8njDAVMRQ5fzeqtQ?=
 =?us-ascii?Q?6T4ySxonDRoPfBxJcgK1nglXLsxrkpDIjmefrMpElDjHHnI4NqFOINFggM5/?=
 =?us-ascii?Q?zgqS0lYXmtr4+f2hF31lC13ASX3z8Se/TwF/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jvo4n2RKTrZMcUatsgyCN0YwFHq7dy+HCkPFPXQe1jZaDhhr9DlbTzO0zbEf?=
 =?us-ascii?Q?WOYBNzLXReV8Ei83pOYpdZ4hbUytEhMMc4dhyTkPm9u6kQ+0pCeHmtWSynXp?=
 =?us-ascii?Q?q5FoCc/0VtXxi9cZ6/hjXX7szGQqFbZ0JFS1LCBkIfvcbeDCdNQFDZdL6I7W?=
 =?us-ascii?Q?2O2z2zhEevqYytLBXKNapmed0B+eKAmyawYNZ/Zq/q2cRK2Wk53GkEc6INPv?=
 =?us-ascii?Q?kL9/mPO8gKdYdGxBD344DPb/Gay4+lSvOGOHe7AhsOax6GTyiKjKLHAvPvIO?=
 =?us-ascii?Q?UgpXDTXvb2lw3H+kFc3u01Vx97mYIJfiDAFhdSGz51FXApFQHGUqQQ5NJWYf?=
 =?us-ascii?Q?0yWX9Rjuo87bOFZ4rFhgbAQ58URKgK2kmKPy1ZCTlgUtNw0fjMJBTPZp4qEQ?=
 =?us-ascii?Q?ffON77uwpV0thSwBFVgeov48RJw48Awqj441eJ1gPtDeiRgNUYiv2uN2KGef?=
 =?us-ascii?Q?7GckMSnyHhEcMuJSJ9Zf2cQ6N3KJO3sBGNNFyT3BqCzctW5G67i1HpT3gFMp?=
 =?us-ascii?Q?46GVG70H9Soy1+PIsXdBPxmCCtAW/3tnJ1xV52DgVRhmb79n9YLgdF0O9ush?=
 =?us-ascii?Q?gFaSRsuO76jJho+43Q1xY6jkEjDgSvrWfseaJTOnMTk+TMHe9OLaPFWZ7lv4?=
 =?us-ascii?Q?1jeQJHHiVrnTnWQef7PJTsJjAelQkOLuIXb01SDBat+SssBci+GKrvBEaWty?=
 =?us-ascii?Q?+78BDKXW+Y1gFKj6BjohNxldBOvXUq8f375RWZeX9qd7d1QrQ/4jkQE2yLYb?=
 =?us-ascii?Q?1m50vBsw0CYs/7IBj2evhOQNIRN5hSGKS/sEW5d5FCRyezd2QTI5SpoN1JXA?=
 =?us-ascii?Q?+fl0VKmD70eCvCo6ssZyoxbx3TppiUNZ+S3hs5l97xRttnanucrg5AH5qgk+?=
 =?us-ascii?Q?RhCl35ZwpxJ2jyatbY6MdYJuXnu9KvCDbw+U1cUswXizvymte+MAytRHKKpx?=
 =?us-ascii?Q?1CRhDW3088VJjCX9UxAPX1b0Lue+iiJNN1PhagwCLW8Hk0yF3MBID3lPCjtR?=
 =?us-ascii?Q?FVFXcevX6cMUT4fkhOC9/DgYFY1kuFTB5lFQJSENkOX98c0tei0RmdRPjqiF?=
 =?us-ascii?Q?CNp9QfqrWs/+oZv4qxU58LTfvd3JlhJ3raMpa0rVaqYcSubsYk1B7vbgBFbb?=
 =?us-ascii?Q?581SsgoM1MXYG+QZbpzKzHbp6DmFrfP2amRo+ClDrHuzYGW3zd0Jh+48klLs?=
 =?us-ascii?Q?SlsWzEDWiuKCiemKE4bvpbAeH1iPEpctplCngjK0AIysYNFGRzS4YUorQkDO?=
 =?us-ascii?Q?yXaaH3YOaJd3HHafowouwP9Z+QH2N51EzkACuqlOhmBia3h9uMzfUwqpbmDq?=
 =?us-ascii?Q?5kZG5awkKjn33LtbEF7rcVbki02G4+ERuog3xTQ1Oz1vBmNuZ8/zHxNliPrd?=
 =?us-ascii?Q?v+MDXtwslr1sSA3i2YRr9++aGHdT9MEIAyyaWLn5dYsZE9xnzapuLTcgXglP?=
 =?us-ascii?Q?BbzNkVkkbDTV//qwYcT09Jg/y+9JQu7hGIJob7kZNHpNnCcA8PVc7ZJOoLqK?=
 =?us-ascii?Q?PFAgIFhGPD3c+/r9+lwNI5IQDFN1vwDgU/OCV2n7m+N0pBIjZynu2UHgBQlV?=
 =?us-ascii?Q?r0TyW7nfRiViLUzMDiyv0qOzeLEelgsz5IqbB65pzn6cCWO53tGypReN9ZSq?=
 =?us-ascii?Q?+/rVD2v2MHAqqkcKiKBJhHkmtUeY81ZI31Q2Fs/kCwlZPGfMHOOHCKrCNvm4?=
 =?us-ascii?Q?SJBEvX6YuejRlFfHEWNUE1JeQmNAWe7fpofWF09e09J+Z+HPVIOrlm7A6XLZ?=
 =?us-ascii?Q?w8t6B7tDMA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144114fc-1d10-44d1-ed01-08de3f1e3d1c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:47:04.1557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUDUYVHpsm26G2WnYRJ4raCRxxZ3PD4lj9TbJHha7898+u7UZGOcrIbtjDn2+17wJrTY6erlqfPs8XWCKPHVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_084709_480017_F2D3D097 
X-CRM114-Status: GOOD (  16.09  )
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

On Fri, Dec 19, 2025 at 04:45:30PM +0200, Adrian Hunter wrote:
> Introduce helper functions to suspend and resume PIO operations.  These
> are required to prepare for upcoming Runtime PM support, ensuring that
> PIO state is properly managed during power transitions.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/pio.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 52d9f01d9ca9..8e868e81acda 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -190,6 +190,18 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	pio->enabled_irqs = STAT_ALL_ERRORS;
>  }
>
> +static void hci_pio_suspend(struct i3c_hci *hci)
> +{
> +	pio_reg_write(INTR_SIGNAL_ENABLE, 0);
> +
> +	i3c_hci_sync_irq_inactive(hci);
> +}
> +
> +static void hci_pio_resume(struct i3c_hci *hci)
> +{
> +	__hci_pio_init(hci, NULL);
> +}
> +
>  static int hci_pio_init(struct i3c_hci *hci)
>  {
>  	struct hci_pio_data *pio;
> @@ -1059,4 +1071,6 @@ const struct hci_io_ops mipi_i3c_hci_pio = {
>  	.request_ibi		= hci_pio_request_ibi,
>  	.free_ibi		= hci_pio_free_ibi,
>  	.recycle_ibi_slot	= hci_pio_recycle_ibi_slot,
> +	.suspend		= hci_pio_suspend,
> +	.resume			= hci_pio_resume,
>  };
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
