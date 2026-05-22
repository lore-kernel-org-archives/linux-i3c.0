Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F245CD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g82ZMD0E/LDHFj59JoK8lGjG0vLaiFTL3/UGHZX6vPw=; b=PjDhotp8hd2qil
	qZMgL5k61pfahZytN/NJZ/XwDPZAs5D/zalOjUduKp+CQu/H78AjoGt3vH4mI7fGHnvbX65FoQd0i
	wqu5uUme6u7T59RwtRqigquJ1NsvEp5Zs+6xYgeGZxfI24Y9cNdEjsNJIwC54yniN3V4VBTpnionl
	kbRksxDZaUrXQkIROlHd+zbRosP4QvbqDQ1dWdKUSXhdXuRAEBIrsfauz8Lpr8pnmiQ6se8KZIgXt
	JipV+FMrkU0u6CuyfBZktlm40VOs31roitkC6qeLz4KguTuxTnPp+ZLRQUaAw7pbpcYcWmO8QNQ2V
	jB7GNbpEaADrLKx5xhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVvC-0000000Botb-1fDp;
	Fri, 22 May 2026 19:52:39 +0000
Received: from mail-westeuropeazon11013026.outbound.protection.outlook.com ([52.101.72.26] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVv9-0000000Bosr-442D
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjQkWoh2WmKPu1Njpl4d42De2VP/XzYHBpon9D8AolDmzqfzMSsnu/yGAx9xPJ9bk/FZyZayMY9TA65lvcz2uM1Hhv4JH4qB+Z99zeSK6MCPqR9nrzEz1sFCsO+7z9ZkpAtgMENTlq46TuG9s592kALW7nTW3tuASdNRB/o10qtDrLW3rfwp1mRh92JXEVekKsbnejIHvtE6MFs6zsubtzoX2/nvtAyVQkKcLh56bSYEmsip5oEfV52PQ+gHmW7kDwquFHfap3Brtxt1V6NTcwjW7tm90Gx6X7ylMxiFc8OR+j36ooSkksLvjnpEgAO4HN5LXU4c3eJ4b5pX0KdVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFgfuS3KAuqxYvw1T1vAZGXKfrVWmzjlvu8jXITZpbA=;
 b=DGcn+HF5yNyyeIe/JXAuB5tqNQ9pDKz2/72qtJs1NDMLyMPLY9Nl+xVnccCglxaEaCVLbRzU8PXGxeHEBQB4J37nM/LwS5iis4xZ0C9hR88eW2c/DwFJIfDBbgN1Pvp0MQT9gIHtskkjtZnyZnFV+IutRWtTiyBrQaxEa1CPUj7wlzFGzGcp6rmJtOrgnUhiObecFNOw84V9Q5db4jUujo5PDtSjvfD6veh9e/6herRGdzqKK/t3pUq+Kawpg3N4csPsLlIeDKwIJ+sa+PmRz5yCDSMbQ9al3pXda9BbpAauhHs1Bxre2+B1zj5ygP5EGwJSq1s09cb9p0jtfO360A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFgfuS3KAuqxYvw1T1vAZGXKfrVWmzjlvu8jXITZpbA=;
 b=WhHEuJkl8SY4tmcN9xXqGv3tuXFA9c9pHZ3voO74JJhaBcCGE9k9pi4gfBbT0GOnWAALFt95UgZlKeQ1yu1zuwyPQkqiWQa9k42rgW/NOu/fiyRJ73zXsowbSYBfqNImIu+vRyH1fsc6mFsImYxZQ1h3CIsruTjSdwvsILUUtMQERcU99MJSMjqGSuEyfSheaxHFvTTARqDX7RhF6w+KRoxYonumdDGCRdlX7vnH6TLhxUu1nR+kZjkIzXM49PJ5EHfdaRsQJ1q0sx3ekm9GuNooYa//dbpsOnuHnagyAyQhYiwcdvacBsRlcFmGkHx/W8csjrRJ5OK2V7WeKMpnkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9906.eurprd04.prod.outlook.com (2603:10a6:800:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:52:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:52:31 +0000
Date: Fri, 22 May 2026 15:52:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 16/17] i3c: renesas: Drop unnecessary tab
Message-ID: <ahCz-TeibvzeKUzv@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-17-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-17-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SN6PR2101CA0009.namprd21.prod.outlook.com
 (2603:10b6:805:106::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4673551b-c17a-4766-c93a-08deb83ba91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|19092799006|38350700014|18002099003|22082099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: jGa+Q6jwtn1QIHEwp0RQuxQySCWbozp7E6P26E+t7FJrGBkIQk622WPiR8/1yzCW0FrT9+riyV/m8jRBzOzZzYKLUeOfTSweqAeMhzXuyFBGAlcfoiqaSaVZWRnWhwQUh94InB0Fjldhbl806DNNS1dqGBqIwftuc5ZqOMSHx7LZG5uti2VVSQ6QPhBRVTzoyiKLUyeZt/z2pSlF0hJxhCSvV138Wuf/RtReOPJ9zBcMfJq4pp0wqIP7o1cJyziHcYDahpPqNYfd4qYakf/DXj7wkRCRcAMW283dvpRA/eh07Yaxh1ZkYaed/TcSDRLWj0tyWcRNcqhIku7+9fq2I9PT8CbbzQ84rkh3ZF6cOnWTtI7Ppu8p2tcuyZ7jGCKpZdaMAVLkKkqCNUjSd1lzdJ0mWp+fwxaWx0SskpAN1tgJnS8M4madhbdpOO6Kh3td75H0LMzUjRqbq+AuRBxfJVY4mgglHlEau5gs+TspbTLAg3Y7k0Hsv0OPeE2mkI6xv4EqNS+R3liZkrb/XtjVyOKSqGQlCt5wsbUHnNZZKVpAiBv0Eck0jf3r/UueymFpBbxdijccU1fw4bjmvuixBJbPB1JsLIA8XorYpKmP/8jKS5pUQly9zMKOEq+eNxKsuXOuqg46Z2D6qL4jkrhZ83uLqC4AsCXmQV9K6dEWTkwfvPHrOI84YnQliu7vnGUZk6F2TotsBpef2O1lAUA6yDlEl8BUkvIjUvDnCawmFJwT96SdO6tiZ8sjA+Wnn6Vx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ahv8vzMGUYEzoWNTuZW5JFapH7x/POSzE5Enptczb0zz1cGEuVe8R5sYnmBW?=
 =?us-ascii?Q?/ulSi6q8qQYaT9vxPD6FXYm+1ElVOVxfHChT3i2kbuHHLQN3Gjk5OdDoHa/j?=
 =?us-ascii?Q?dOJwZ05NvdT8nSzA6J9GEPCMhJh5kfAEUiQ/ke+9Xn0PZ/EyYJyXgYe0m5Lv?=
 =?us-ascii?Q?DrNdFsHIWMDs5wTtPdDNcBLaS0nUtus7Sm3YFDOJEq6rWEONbxrRl3uP4q53?=
 =?us-ascii?Q?UWU1Rt7SVazsIhqG8PJIRrwWC0Hj68NwM55ap4H3af9DtqziPc4/KHs1XnCk?=
 =?us-ascii?Q?Zp86pSLTieeQgE8fJNdipEpPoJSxNIj3f6ATCBbicBUIBkR1rCtBJwSQKrO6?=
 =?us-ascii?Q?mdZVNIeOzEFo90NfIS2oq9cewcbRUPzY2B0VLjGyYbDhL6RLrlmuCoZB093B?=
 =?us-ascii?Q?K3UEkWe6Fwx1JXqROPRiiNDVpsSD0ebunpSUPY1rRiYfxUCD/0vEKr7N4Rzs?=
 =?us-ascii?Q?L6EEBL5g/4htHidR0PlqhiiRotOpyMcmB+CIUo4Ycg5D3wc1wtMYySyd6GCY?=
 =?us-ascii?Q?b5RgfB+pUCbKiZ1vUVKCJN6xW0qsvA6ZCQ0kaubAb/lOnOQQn8K8Z4N+YW/B?=
 =?us-ascii?Q?RMk6waxdlfS0yfCL2vEo4WDpLckJzEJzwy3mZQNynUdat3WnHI6Yg8E8p/Eq?=
 =?us-ascii?Q?ukpcjiTu44z+hGMF61mVZjXR7bEb0dAOiN2w+gz6F2+A8PTFDZo5tql6zMbs?=
 =?us-ascii?Q?Y6vOfzDcMDzkbdrGcdZtqDg1ZZ7ppovWZCKyp+Q1tYkxtwh0i9QwScd6gQzE?=
 =?us-ascii?Q?XMv3V2Rw5w7uzHyAPXAkWnL9+4nlJDCdYwe8775aLDd1r+vOllH5qztCOpEO?=
 =?us-ascii?Q?90E6JhxYos5BbWp7Z0mbh52mV/1NUINNyJrYBD+ymIwZ7FFpbaQnz7sUUFhh?=
 =?us-ascii?Q?hSXevh071oVgxnVHKM95UQZcPXeWbeWJ3G9MaTU2N30bsnGzbaiG0nnmfgwO?=
 =?us-ascii?Q?QBS09HZFJXmTYgT11cGJyqE4tpTJxi45VXEVw9ITn0Or+zhzgBqs2Hg0HNi/?=
 =?us-ascii?Q?MD8UCa22LdvwloT05ZFDahwQfJgZ6/fxlkFrJtwv7U4OZDtM/rWd+vY/q8W6?=
 =?us-ascii?Q?//wzgyWUlbee9AZuratC2zR41noH5IMDqPPeFBfC2qNlhtXGoyxIq3YGKLTR?=
 =?us-ascii?Q?Tecke4kdlEcL4rETIOhm5uYR5r31QOnkkPHTbMj0x1yKa2B7LbRnaVklz12F?=
 =?us-ascii?Q?A9IEMegL2xicRJ+3mQj5FTrybtvbkLaT16uQma1XST/fF2LoRAdQqfs9Wtlj?=
 =?us-ascii?Q?FBpG9vDCBc6RFAln//+6R8pfYi9kOKWo/16olaykX2zY9FGxXlZNaA1m8gf+?=
 =?us-ascii?Q?mW71iJu7qsjIq39MxMdGXacrXhL+EP1lzhAiC3YazbnlsRozvqlHuji/UhCW?=
 =?us-ascii?Q?ICuaFcWPRlmNP43TWH7jQd/h8lWbfDHCH2s1B/Uqdx00h5KoO0j7vwjmkHj9?=
 =?us-ascii?Q?jC2pp0dM++qZySU/C5Vrc8q1kRuod9xWoaqfGTDNjmvdR34dxbZZF4HSIbQc?=
 =?us-ascii?Q?ccVOK5ySB5ws6VnCG2pt7nrvjHiBEC+nlZeDF1zIlaQyPQGeAFIt6jNEYY9q?=
 =?us-ascii?Q?dHZPp5ZsEuaqCKIdpYIh3ITWRsjanBt8xozEUWDMGY7duybMsMEfIFXBYU6x?=
 =?us-ascii?Q?Q5c4k/+yC5owHGAzBvhOKFPTP/ipkGOX33kMVH6ZXhESueBDdn0TZFytP2Ib?=
 =?us-ascii?Q?MjF7PAUcF5/7XnPFtJKyAfx2t3fRxHX/5TpXhfpMlVTMIxMA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4673551b-c17a-4766-c93a-08deb83ba91b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:52:31.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTZykVyduSOhJX0NvTEqAJY5wYLqkb9xEkix4opitveSjWu2Cdoa9YKVKBo2zJj1LtTTdzRWduMlISMc81A4cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_125236_010359_614ED59B 
X-CRM114-Status: GOOD (  13.42  )
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

On Fri, May 22, 2026 at 01:18:14PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Remove an unnecessary tab to make the code cleaner.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index e6e05ac03082..a070db4d2440 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -109,7 +109,7 @@
>  #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
>
>  #define NRSPQP			0x154 /* Normal Respone Queue */
> -#define  NRSPQP_NO_ERROR			0
> +#define  NRSPQP_NO_ERROR		0
>  #define  NRSPQP_ERROR_CRC		1
>  #define  NRSPQP_ERROR_PARITY		2
>  #define  NRSPQP_ERROR_FRAME		3
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
