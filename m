Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418BCD1D467
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VV4/51Ha8A1fQsC58/5yvrBBvp07lEVVYoCAIc6b7wk=; b=Lcu/O59Jn2Z6iS
	dIxCvD58hPM7LnbMdmh/ha4/97o8Rd3vis39rG34YFQwgmqCqVPZCoM6WymWe2hdV9lsawJrcUQ39
	28X/dkRnld9pjsH3fubsjKhUQ5RiYpJkr1KvxPFyVaT4mYIzO4cXlYoeHRGDQdgwdkyOoZCptpLff
	//WGDRjim6bh9MeoOeM48Ozj9v05e39KBcwNQZnkyJ4ETtvvsE/tDyED9zoFM8pegeFf1X68KYFAN
	xszwhLfUdD3nft/IWUgnjYAKbFOhgl9JsoY8piEs/HXYY/wtNPMnsHzgFJuRzUZRZrjeYqhO6116m
	UV18QlQE2dgDqeKQypjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNc-0000000HPvF-014Z;
	Thu, 08 Jan 2026 14:52:52 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNY-0000000HPs5-43Ml
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 14:52:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKexkcxlSVOMUeNUoRa9WdiiKOmNnx22UC96fZJ3V4PEzEDPfQ+G7UuQ5kY8+z+CfBH5RYfKdsl1+NutLoHMHq/ybvrG3Rd9glWQUyExfMRopME8R7qAGz4CeDKTe+x/3WfDxKSWylPLYeLww++g0bl8TZRU7n4vQ6guf2cF9tQg7L2EU92vsvtWc1a9SZxxUfOOULKFUMclzQSgX0ilO0EVZIYLvdHuJKdW/S9krWTUbc11tS+ComcH2cctP82kQoVJvwH0VmHjqGnIRQWzIhpWclpwBvwmTFsrwHNJPgeiMXSj4F53HSEoYgdjr0e1JSN8XkSv4RHaBdezNreYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJboCVUDFGRlq+lJ0E5LKOOM8ibAaZMboXb2CcgIg38=;
 b=bWhmPK8boJb3KtgZLXaNmrIrPKDmsj6XvcjFHp9x/E2czI0lL/7coYFEulRVgRjxe9Y9PWHfpWk2MANnWcBBwXHLg4GSPoIOK9dOL2R+sINj9NkiFYDfXqSSoEeBBt+h1MElrbMoKMAZgGJpsrhc92d47ROkvq08vfcmMAOfd1npCSHWr7dWq8kRInG1ChKXZ1hyLm2w7GLdWDCyUMwdbQ6bYVNgK1KCL0FsBnHt4OMeCP8xVuvJ2LFQL8nwV8FgOxipuc6k1gEt+6agh0ph7WsWY1F+g6F7xOKBZ16tp68ZQcV8vW2JZvNKWXW8LEO64/Q4DhYhrbiDIeFCaZAbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJboCVUDFGRlq+lJ0E5LKOOM8ibAaZMboXb2CcgIg38=;
 b=dl8XoO9dPJXipru369b7BYTrrzejyjo3BrZ2DJSiqs2f2dnA2SWCa650ARjSnK44l/hyhGuBJ3FdDoE6RvdzNZxCc80tFqjB6rFFpXvr4vCc8b7jSIPBwSH5t506qAzjBT37uMd5afA6otRV2SY+eYz0mwTG5IvjR9LCLhYIsAWJ/hKSZEv0IbAVvbc7ExSviHfrxGlDkmiF1SrxmsO+rVRfklpyMq9HevKkY9mIo24KKqE0YfmvCaPtM4LtmCHaI5Nf6JwynlsWGHsZMisgBSYkk3lu+k1kZI1tbOl+COPqpiOkwePGzJGkVyoEDcMsdmpdxgVNVeh+0Wh4VnYT6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA6PR04MB11945.eurprd04.prod.outlook.com (2603:10a6:102:51c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 14:52:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 14:52:42 +0000
Date: Thu, 8 Jan 2026 09:52:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 03/20] i3c: master: Update hot-join flag only on
 success
Message-ID: <aV/EsQ7J45lyACCQ@lizhi-Precision-Tower-5810>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
 <20260108080558.21767-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260108080558.21767-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::31) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA6PR04MB11945:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f317cc-cb34-4d59-628c-08de4ec59352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FZtbfSWgHHxEn8ZuJF0FjejTTu3vabUFQTr/A7v6/+4yaOSSQXC10Ha8trBh?=
 =?us-ascii?Q?iVaQ4894Y0KCMdiZXlVK3HF9pNekprjAyZlNqrmNhRC5L82ejDXQunouFWCS?=
 =?us-ascii?Q?MKSOxqZjtdL4KD1zmu0t8eiv2DDlRz5GHyUJgmVzAJhTSNPVilCPC0bLwCP2?=
 =?us-ascii?Q?MmBJAeWr0KcmLmsY27uk+DxHaNORFyeAw8n8cgHFjTN01xMCuxW+v/wf0MmI?=
 =?us-ascii?Q?XIk2rqkdc9wisuA8zQp24wPfQAvX7MzgDtW/ENCx5wDYRJ7WIjiOzs0iAqoF?=
 =?us-ascii?Q?qPuxp7I6CH1Pzu5euQ+41GZu6nx+Tc+FNc+l8jwtIugZiGiVkjKMUC/GAd6t?=
 =?us-ascii?Q?hd+0Ap1yUaURD2iuaTP90neDzVGMr+f0ufmz7U8I0MWecFlRParo9d6/k0dJ?=
 =?us-ascii?Q?K9r+4iPVL7X8wcrIYvuabhIGMIwKfpHF2xGOY8h61D+per3CkX/B5TxHk8ic?=
 =?us-ascii?Q?hnTZtntQ9BoMg4cHnbdjw0davEdVgrorWD0vtTtWVw21KMzCRsmkhajS5wza?=
 =?us-ascii?Q?7WxGBfjgnbxLD8OAXLpDsXfBoVA2n6P9sEonya0OUDRLSOSFZTenhZl2YlLn?=
 =?us-ascii?Q?AT6KsRE85ttQ1XRMrNaO8mnyR8j8glrqfHbCX/jLQ3lqLC0YInWcs15DV3qE?=
 =?us-ascii?Q?wu1II5yYVJCqMI42AGMu1guva+IZ1Yyqk1NQzSCb60AlXv4QCl0iOYSqVshO?=
 =?us-ascii?Q?M426V4ESj+byF6qodKPkousm0rSFNvSBoBtZGw38CoIvYC6wLZuH5X/oyC9U?=
 =?us-ascii?Q?HU0K/jhkYRcWgI7QhsFq7AnQuiF8zt8sJiqXfwOClFTinUUPoCLH0zm1HMeh?=
 =?us-ascii?Q?iDr6H02tFgkh8RRFAlwSlARRFG6aeFQzNBg5vRnMjCSLp9W0CmaKaPqv0Ohs?=
 =?us-ascii?Q?4z2puemdYTSwE76exl3anquyoKWE0DwHlJmAjur33df8II9PoIt21ZO6mLOs?=
 =?us-ascii?Q?ZOcCxDReuSAyG6ep0uNXVs9ZMKTJC7TeS+HMnGY8Oj3RR3/3kwHZh+dcy05e?=
 =?us-ascii?Q?WYx2Lq4AocR2yFzo/d7r8rTrjx+rnRIZbcKrYpvOZ7rPURoqI1d/IYnoIzQm?=
 =?us-ascii?Q?m/knJ72r/wve0QJjPtkzSTqcFwuOHkyr9WK425qCcmGOhZBNnvu73xgA6eOZ?=
 =?us-ascii?Q?RFFh247Gin8wv0JVPq0UY4PvAZKiPxeYgd90feFa0pim3r+6GvSxsQY+mywY?=
 =?us-ascii?Q?jrrLAwjAJ7nF36rqlClgazSjQwmK5lF1fsC5vPYTtZy+L6q/ZciRiNRWZIGP?=
 =?us-ascii?Q?K7QIwU2nMPOyJzLoDVzeHbY/yvJpqmeDCeElIQJ4snI871xalrL0OUSkbAs0?=
 =?us-ascii?Q?+T/JA5moRTe+3y6gW/QjAg1FjcBnQ7EpPDyEFae7ztjGYDe+4ysOjVmXtcBP?=
 =?us-ascii?Q?vpY6qHZVk5HQmuWL3QKC/r3YFnR8Iilalpk3zR+BOhcYJzxd/cYJbXG3GBfS?=
 =?us-ascii?Q?oJ3TANqVtGRHvRsE/sRGFKsW0Z4XiWUmDp+6yKkrIUHXAeHYVhGaNPJjx3oG?=
 =?us-ascii?Q?oMmv6m6XPQOwE31oulT0gjrXDrZJro8jC5ae?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jiPe83BRMqEETtTjv1zeFw4b58WywVJVEExSyRa6dbQsHuBH6/C8cEPuF0dd?=
 =?us-ascii?Q?wkF9RTdIWgFmS2sM6yRwjBnps3xY8j3wzyS0XtKgJYVY3tYjmpS2CfAt6esX?=
 =?us-ascii?Q?5QGxMt1v3mWppGo0vCNg6eDCS5V7cmMlFqX8VWBVq5LAUXJ7S2suXdxQNMb0?=
 =?us-ascii?Q?gKG47c33ampv0GW+q8R7+YDcTymftbNcfUSAcvxtr7dXoc2yPQ4sQXw5/jxN?=
 =?us-ascii?Q?LBiaVNsToApr49x5U9D4792Qzlr5ivlnaWlUwZGPgkmIHinBrnP1Wl54DvJD?=
 =?us-ascii?Q?9ifJhPmDViIjbNwgvCaLMxhJDFB/A32XSolHAb8a30KgsXXpOLKMe/heGALF?=
 =?us-ascii?Q?rkyAIrI8jzk/Mo4m1k58tmw2WJJOge7r+mmMX5WLBQH6s+lKbDyuqlcTBSCk?=
 =?us-ascii?Q?UaJ4hCrY8Wcepv6E02CWyKFvP7AJok425tZ/By5FGcXBtjnVDQ0d6b6WLA2a?=
 =?us-ascii?Q?y4rWxUZeWLb2D3ZayrCjlbYvbjz7eENGp5aG7OZxgmJU+bDdoRzB/An03zjg?=
 =?us-ascii?Q?eSDVQJyQs5pGUjseSEugkLNWzzKRiDOb0VqoFiBbiWc2Qr/jbxuYczTcLU1U?=
 =?us-ascii?Q?FClFpswiBazTe3T/AneCisogE6c/Dl3ZHpY4FezRGS7cjYmQ9f8ULbaaTJz7?=
 =?us-ascii?Q?9D0G7skty5lkQe0ALgM2zEf++dsi51CunYxQBLVhApo3QdMZoMqYaP+C69v8?=
 =?us-ascii?Q?LcSeKkPMiLWCokQcvgcCMQvRiNrXrpwseQSwkm3L5AEijmLoJp6CDB1XHVD/?=
 =?us-ascii?Q?2MVDNERJbE2QP1w+z5bMrjYtrYCstuHOIpHRkv4s3S8iaYXeunrad2ACyNoF?=
 =?us-ascii?Q?QxZdyMVrlaLBJYzYutZItAR1F92DQ4Xr5KjcC2Wwiw9rKdjrhMGWmRoPDdox?=
 =?us-ascii?Q?3XO6XuKgPHTWr38QWfiVsb9Y9zRTBNXa5LmttoP0KQScx0bKmgJdvnRRGr6c?=
 =?us-ascii?Q?FiF0+HEAqgBLe2E274i9kXnh60wpzoP0goOY5MOXNHk3LGI7mYaVjhjcxSVX?=
 =?us-ascii?Q?Zb3DVvT5rXKCJtYl8nu49NMeSz2whUIdgLkbsd1JcEN59qKD/WDL7SYcpOx5?=
 =?us-ascii?Q?05IT2nwqM3HzldqK5VISn3eeU9BvNx7q7mCEltZyAlnL03Oim20tIrhDkwPI?=
 =?us-ascii?Q?L5Qd0V2uZlw/rDft1Z3kOW8RM4hNv1RjZxO4vBKN926xBEK6lHjxQMwdEYVi?=
 =?us-ascii?Q?PhvAFtEGUM+QH6x6fDelFRB96f6o3lb8GaaYr8iug/Gc5cI512b8qyN6Hyrk?=
 =?us-ascii?Q?Y9R8eB570rUboIBFZ0f44yRz0T4K/U6I6x+IbTY81LiFQ1KAe7N70NeNkheK?=
 =?us-ascii?Q?eSjQbR/UctlfQOuXr8HUvgk9qKpP1uFlyJ3zVUsoj8CtJS/kW5hc+KEmuWrw?=
 =?us-ascii?Q?3cKU4SUHOTPxNsece6RYguI6mm8C+H1E9ZuX4glwvzlt2vcnc/2rv8qGkdBD?=
 =?us-ascii?Q?rGArFsAY98D+VGSDrynBDy03zGqkgs3H6NC1ssNn6M5g7mYaCkzp3YwzzLoJ?=
 =?us-ascii?Q?Jjab/dQStqpUFLXHOTArjUpNt39GZtygi35+8BToujN7p7m4NTjrBVJY0tYJ?=
 =?us-ascii?Q?94Gb8vzUgGHqdF5rqlE7aBL6NTL2VYVQigu2os9HYbfAUQBNVFnkmZKHNOyv?=
 =?us-ascii?Q?+Du5g5loUV/42FLizae2NpYzV0Cp1uxNUd6SCa7eR3hmBBqr88s6urA7z5LT?=
 =?us-ascii?Q?WkfZ1TJAC5DD74Wc1bm1HwRxMAkQOL7CgoMY12qeA8C0nqyzDOqEdaRyY+KB?=
 =?us-ascii?Q?X3Zw8O4F/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f317cc-cb34-4d59-628c-08de4ec59352
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:52:42.1316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEpV08Oa0kBTNT9nSniCxxQGcbAogtGG9K2I/QHtCVsmneiQiSeAdkUefJfgMsIAgAxvSlM0qflfYCffR9lKzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_065249_059110_56D610B8 
X-CRM114-Status: GOOD (  17.05  )
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

On Thu, Jan 08, 2026 at 10:05:41AM +0200, Adrian Hunter wrote:
> To prevent inconsistent state when an error occurs, ensure the hot-join
> flag is updated only when enabling or disabling hot-join succeeds.
>
> Fixes: 317bacf960a48 ("i3c: master: add enable(disable) hot join in sys entry")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V2:
>
> 	Add Fixes tag
>
>
>  drivers/i3c/master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f606c871648..e6384bffd4ae 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -618,7 +618,8 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  	else
>  		ret = master->ops->disable_hotjoin(master);
>
> -	master->hotjoin = enable;
> +	if (!ret)
> +		master->hotjoin = enable;
>
>  	i3c_bus_normaluse_unlock(&master->bus);
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
