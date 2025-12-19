Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B38D78770
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYw3FNLA/jPQpMBAMwyXgt8cththIRtsfEkOhKsi1F8=; b=W5whQHEdCgOyx6
	fuRTA1wJr9o+2Ais6mZguhdpLEfInbgQxWU8YIULXXNCiAA5GN7Q47sfnthHuMASET25n+HJrwpnS
	J8KDByyIpBHHH+WOooWjQH6oOnhavZUFHcCa6e6lZ4+WMJqRLroMmZU9LAQ/HwKT0xPz7WPk1QpF1
	tZjWzMF98aiHQ+VQlW9JamxSeJMYhZVIykk4tnFk9VJD0Rw0uNqF3c5CW7sDYfIBG+mSPj5quJ5Id
	amIwXLYyBNYPdDTs7S5+e7p6NKx6x0xXpiL2nE72kK6P29weOyiJrrE6xKxp4tCtFe3WsgeOXLu6e
	kkwZQWwT/3rl92ulOD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdIq-0000000Ae7x-47jV;
	Fri, 19 Dec 2025 16:26:04 +0000
Received: from mail-swedencentralazon11013003.outbound.protection.outlook.com ([52.101.83.3] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdIn-0000000Ae7V-0ni9
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8xCInVO6mq0lcvNHdLlsUeofANpXge+AXOTamQ0xxWiYnKHB1MqHh61Z1WpwKZ7rYQBLAVQZHMQIotM/aOGxxlTP4SN/mJ6KduWCDULtuTOE8cFle1qWvil5ltDGiRGbJq01UrHMIwW/NlcgqKF2EoWJ0kCPhy2Z6BVrMSNDfNCaVgbOYuNtXP8RJgpYq/l1FJt9m/OkJa6Q/vZ+cw1EQkkO2udrFt8q0o3oYmScyyUeRXsb2WJuTYKZywcLeS85XORZaphOD40yS19qObMtNiKIYFsWFHSeFe/ZaUaA8DsG9H8KZUkK2ulTMDS5USf6pXQIzZuff2m1cyBCj8eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWvqvnm67FKTzSo1DTHjyluo+JhpEEVvosTHqeI828Q=;
 b=jJHtRHTKFGt9k/9PFWT2KOyHpoJHU3Irjzh8seDxHZsAWcqZsvChCIIPXt9pNS52N6JrQ5ggY7J9FpB7ul2+n9q4+NiUZ7gvYir4Pin4p01KBVqpFD67vCnOR9UtLBtJhJ03XqdFo0ldoeMc8SI7VgJ3j1TgUQF1j6HdVRbUqKAAXWwhZ4PfMztQZfL6OAtXkiSUYo7xoN74Xfg6z22Ym+629z0L7rURINpYORRL43Ec8RuLxlI07bsipGeuNv7YyegOZNYoQXWIYx3sMJtCJIHXGEY4pQSAgO2icpUF2Tw77A/patAJ3RKG7Q35CJJW4kaETvUjbar0PNevsEYXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWvqvnm67FKTzSo1DTHjyluo+JhpEEVvosTHqeI828Q=;
 b=Q9vS1S4Xxj8ep/s/6xmHyvzXkGEBGNEV0Di9E29eVnG/YrvLQBvWSe1MAbbYZAQaUVyTwVNw2jK7W+szE68tMbnp9RgBQGwJ06s55tg9Tt3ZKeZDpk+ZbW+pspTs4dUjqeVn6okGa4BTpJwW97CXq0Aa7nBWpg1PdqPrubZclF72MFWlRJ7USbKUMxItP2bOkFEmgstmua6UUDqAfCQ8mitP5OqYR6bPJes27T/QSP5bS0AO93HRCWHtdT1jDcaXBWD8iQJXMXYoCxqkKaw3drEbrWTpceOLsLMPGtfVyijCddM6QLK7oA/gK9qRbHjADR6QBC1hUYYdbDI4WYQulg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB9320.eurprd04.prod.outlook.com (2603:10a6:102:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:25:53 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:25:53 +0000
Date: Fri, 19 Dec 2025 11:25:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 04/17] i3c: master: Replace WARN_ON() with dev_err() in
 i3c_dev_free_ibi_locked()
Message-ID: <aUV8iuapAyI6udok@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-5-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b377fdb-6f11-4f93-5e6c-08de3f1b474e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ed8Hl/FBCmtEu4RBVRvZ0N2h9xnwoLKB67vzHqE+hQKlRfVrtaWk64EjZKas?=
 =?us-ascii?Q?YQjaABX2gN5jWuPcpCit9Wc301fntnjMTIV3ZjbLNrKj+Bb2Q8jPxxpn6+2B?=
 =?us-ascii?Q?h8gUxCzcndEbUC2Szfj1KXivDP8Bfq9Zs5HyakiMGFu+UDTsGRZUzpOIwitu?=
 =?us-ascii?Q?udKn2qg5lqOEOFvP7SOOhbEHzVQ3qTOmhGQjgqmm7tiP601agH/WQp2XYV2c?=
 =?us-ascii?Q?fthvh2a88gFVZdDip4OW32BHIvLIeplZZF1hql1YYYm+xCmN7jjfvylzNx8S?=
 =?us-ascii?Q?ji9QziZWh0FqiBO3yu/uebv4G6vh94sXEii9uDHWgIo519XwDf/4UtZxtqa8?=
 =?us-ascii?Q?2UZmVYz6nzR5YJfE+uhgqKt4ayWcarkiw3mB8TbOWK1p0/u4KjJ7CpAzR4Rf?=
 =?us-ascii?Q?iWw9l4FmrOQRyglDoCLOWSPV+ibVKToDtjUqoAhqJNh4oLsydH0qyjeCziJU?=
 =?us-ascii?Q?/2bbMq9g42Zj97S7ny6hXpWpbQRftqDGyP1dCX4rDafQzQ7jYgwBljivZ0vG?=
 =?us-ascii?Q?obWxAObZyyw7CwUc7coTwp0ECsMgqXiiZOK2FsRPBk1lc6LHRSELt7AsJp4N?=
 =?us-ascii?Q?jpJC+guQGO/dpLbZOVw7TtoxS/50xzvOV3DXv7bJAYt+JO4y387JCvJQhz9Z?=
 =?us-ascii?Q?UJlfhKHfIK6LIiocMdktVFQdPB2iCves1tOOfPMvB67GLOWGV84Nm1wNbRBw?=
 =?us-ascii?Q?6U7oC/FwZzPsLZDzGTKHN8E+fD2miPJSkN+zqiOgPNDzkVe3f8yF98aTpiZp?=
 =?us-ascii?Q?bYbq/FHRaAw51Y4UMTKfzjBjuUbQN6SpVqi5jEm35B71MFnuQ80foppY/rwW?=
 =?us-ascii?Q?mhnNDanm1V+yw8cIIavl8J8XDhhk+bu5rTrP70vaZB7K2jmm5HIHyHw+DV11?=
 =?us-ascii?Q?flO3NCCpEVRBl34R6pG3xJYeelxg08dXzDLlEclUV+3IOgFgfzE4fuLXMWXE?=
 =?us-ascii?Q?Q7SNrnOXfRYsehAiiO+NAGrvL5hrqslRjfa7t3ENuiEdGnFgR5ANYTf2ONal?=
 =?us-ascii?Q?lEF8ibMC4OLfDVarkirTAVtx2o4nGuoZ87ClD4gJPLdlX9BXeKUStzc4Czwr?=
 =?us-ascii?Q?pXTsBF5h1KbBN9277fClMCbHzxLC0a07zKp7SX+oh7i6QzOBZOjNhaJdRu88?=
 =?us-ascii?Q?A5CVGF5GkwCv6nZrgX0boDzW9+rczhC52kUhxlHhMh2vVfY52X06kX+kabu5?=
 =?us-ascii?Q?7KbloWosx7zMcHmZVrZzDFLNMWzslNNL624ZJd2rkScLBX+C7A2Fm5xRsZm4?=
 =?us-ascii?Q?VFv/5Ow4GnijzQMhi2G1QQTh7cF5dsmEF02wbGqGqst/MOuGPz/FNlu5yLFa?=
 =?us-ascii?Q?Oi/wLrXPHF0HbLx+HQoShg7T2Jpa5ZjVpc0MHgV9Vqb2KMmy7IODRCUWgdzY?=
 =?us-ascii?Q?2ydDS9JGmXrRr+xhVYJLhBVp8aI7SZogWZ109V/xREDx7LqTjDV+qk48nbKc?=
 =?us-ascii?Q?zaNb0/ySSy48qNl/ZHxC6wIHE3FW5rli0Zx/OrMM7wlpFP+LwzhTYxYLWn6Z?=
 =?us-ascii?Q?W+FcyAf8kVLxtFI2tVv6jPxhiCVNsI39buuK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MhTJ6zcdbfvX/Mwx+t8U3suMMcNefbF4YIy+4IoO1tA6ehqURWJ1k8k/5x3G?=
 =?us-ascii?Q?hgcv0HQo9kTRBuwxJ+gtRv5bE5gEsc4LsaH+qdEgnbzIVwRPB1Pmzyn0bo+Z?=
 =?us-ascii?Q?MPORsEa1jNXVK0hnBwvmj+yEaeGiXaHzvmKUO/RtF8nJ3VV7PZRgRt/+Upzg?=
 =?us-ascii?Q?kSI+Hvq0cDenMw6jNlTv/h+joPwQ/+xYfgHrYOVQkNxpk22xPdI3EL17J2cj?=
 =?us-ascii?Q?HmqFZzQN6WA5cqdRcomZgpJTbyh8jUB47SUr1l556inLNLr5r1xOh9xNrwig?=
 =?us-ascii?Q?duoVcKSRiSkEX6WvKKyC42mz3UIFgrqmCekg5dtUEPZqFBviywbz1XudaBsR?=
 =?us-ascii?Q?4YjcXLmOFzmz1mVSNeI5u31opI3IpL583JyjvN9005phAD+cHm9yWAHLYPan?=
 =?us-ascii?Q?vml7G/knoZBvH5ioT4rFJy2VDRvyO7WzGqvQlOPeQ/xR4uY3wU1s/Dgu87Ow?=
 =?us-ascii?Q?LAKDn+4h1upIN5MlzxcgUo8axqpRAy3NfGA4emuf2Fy+xjUpIXUz9+R9icET?=
 =?us-ascii?Q?Jns2IHJT+iyLH1cf57VuhKQyGJqLQGXnOVAYTSSj0Gh30xDyPeS0T+sJeTsB?=
 =?us-ascii?Q?gGvo78GHeDJNsGWW4eVu/PnmhaozXXKEQySmvNiMztzz1fV7tTv+zsUuLLq9?=
 =?us-ascii?Q?Pn3zYp7ngKKZEbqXbPDTrIA7q/LnuNoVY22VeQl7HlgVjMVCsfbzmXqlCx7B?=
 =?us-ascii?Q?pWOdGwDcfiqSFyF5IA2Zhc1e4EWdbjv1diGJY8kGEm3FahB1iSO/H4OtaTlI?=
 =?us-ascii?Q?0jZd8l31DLY6x8xY7vw/5LuGNGCYrEHt4lWeUamXtZAs3JRCV+AvWvB2aD3c?=
 =?us-ascii?Q?BaR7beYPte3tWy14zwLqR9IXgf51k7NaZ36Ym+kVemBRW9xgfQyr+sVeNNzl?=
 =?us-ascii?Q?IqH/IZNXGHs/h2+4O19j8jxPMI+Ua/lugfIbYIP7B4P/mVqCsQ8a1O+nLiNf?=
 =?us-ascii?Q?Q8Y20uBcCcMYoZi8OqPdmm+a/YR9HBE9+vT6U5az2v8L2mQULoL50orM+rYr?=
 =?us-ascii?Q?csGSM2mf8UgMMcOgd4UyVjm7VuQgPN2C1tZVFVojYP/nVjgLDhuD17Ev2BXp?=
 =?us-ascii?Q?v7GziaPzcccGNSZn6M0TycryraYIvwPCnfKZYU6GawrmcGzv2TqkcCHmKxxK?=
 =?us-ascii?Q?VpmADWA9hQWgL4yiZ75B7w1lXZb56sYX701MmLrllRrwYr+PjgfYWBX8QhN3?=
 =?us-ascii?Q?Xq6kpx5qwXkJmd1ItEdvza/mY86HuP+I/LLWOigS8i9K2/sNtF4U+W2OAS5H?=
 =?us-ascii?Q?GznQe7i8wUqpKvQIY5aKASG9nRrwyBGj2BR8DXHTpqMKKo+D5MraBc7uooAP?=
 =?us-ascii?Q?Nzb+awD1RWrYqcOgLP7V9u2vzzMJYdiIsw7CM+ic7/l+UlKXpI/Bj9kVLtP7?=
 =?us-ascii?Q?Mxnw9hvAg3ybs1YdtNHsWYW8VpToo/32hxZtKTgF7QYlXxgZ8wcH/va34NNA?=
 =?us-ascii?Q?4Bi5zqSwiSz7lcsg6TxycIhd90IpRmpvS9nXC0PMYN8C0OBsQHV2A/1ev9jB?=
 =?us-ascii?Q?rx9Hkowf6EMSUmMi2gJXHx1OBrk0mc/+0Bwgbw6Md1ylxqRSi9G4AmnTOfe1?=
 =?us-ascii?Q?Zg2B2aE63vwPQqcdy8LKmISqX8fLj7lsHofE0pb95QmecGaDD3kfvRityIYX?=
 =?us-ascii?Q?X2iWJZBaUByNo1U8wyGNk26zJGlMbqz67lTTtGUPiHGeDOAdLtn/YyYtEb2m?=
 =?us-ascii?Q?yQI2/kPKC+4ea0hwMOYunsbHf2uxM9KIlQDiisewQH5vDP02?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b377fdb-6f11-4f93-5e6c-08de3f1b474e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:25:52.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaH7Neufwjf7s43FZ9gt79WFMLbGsBz33a8Jc1FZ6LTkyhYo/v5rHd2wUhK/DQ0O1ETe61nzowJXYOEh73aRrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_082601_244495_D087B39D 
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

On Fri, Dec 19, 2025 at 04:45:21PM +0200, Adrian Hunter wrote:
> IBI disable failures are not indicative of a software bug, so using
> WARN_ON() is not appropriate.  Replace these warnings with dev_err().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index e6384bffd4ae..ff6cbc044787 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -3113,8 +3113,11 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  	if (!dev->ibi)
>  		return;
>
> -	if (WARN_ON(dev->ibi->enabled))
> -		WARN_ON(i3c_dev_disable_ibi_locked(dev));
> +	if (dev->ibi->enabled) {
> +		dev_err(&master->dev, "Freeing IBI that is still enabled\n");
> +		if (i3c_dev_disable_ibi_locked(dev))
> +			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
> +	}
>
>  	master->ops->free_ibi(dev);
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
