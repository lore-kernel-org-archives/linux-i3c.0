Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC835C982D3
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Jan 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIaeHOgqnM5w6smQ9JfuwWvQ9Pll4CN00S9lKRmbGz8=; b=lN1nTFtz3xsSph
	OM8JTFb9oOBFE3jSrqh5brsjC0ZKA+ILGn9rBjjHLx/hQ+golTXiSxI7dEsaGmAhJb7Ey2+RZhJPQ
	hT/ub7iRMm58zyOrY7WbTL0pGDRxHG3mUk4wMUAbzSwBQugvvTI0IBkti+sMoqgbXv2lviKlOHlqt
	tnoCB/1d3nN5sWBUzjqK25ZRf8dTD17yEJU4QCbEgGUunR6eeuJSL7I+Di1tgt6uJ9GB/Ww1dTHFg
	ZfjWQHB1OQUAV0MB9Uroo1nnrQaBbzN25Gw487jpXji69wJH86qFP0WD9ceGqhI2qXfzXhpabEHX6
	V8++BlGwwhFFPiiJ44aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgltJ-0000000ENZ8-1rZX;
	Fri, 16 Jan 2026 15:37:37 +0000
Received: from mail-westeuropeazon11010051.outbound.protection.outlook.com ([52.101.69.51] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgltG-0000000ENWj-3EIi
	for linux-i3c@lists.infradead.org;
	Fri, 16 Jan 2026 15:37:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEJ4sSwM1YUjz4dM9XTNzqyZvpt/iND2JM91nHz56vyZfITl9rP7iDr770SOe6SHDKfSlMcBGt2QRb5izApKdKHF6mWgu7cktb4E33uOkg7PDMCFjbpcfst6C8WTBfkFRdcSJvFWE7PHS0Jh1QxaCYt0kEH6A3+pMWBveCvd7POxBJVnFtrKH/vJPLI27P/JVM6wxeHRTYAVpGkPIScz8Pi0YZ52Gvn+FrOkAkU41JLV1NlQJMWN7xgJPdBjtg4vTslEQhU1hmeDd6w/zGOxUp7n5q+PA0AgcIigRdc/trTkFTeQZH1AN7aZI1Dmv1fV8nYrmViE71mZ1zeSUnb0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTtjC6i3JgokA2Gw4cDubB//3lU5pD4nECn/mjUoyQ8=;
 b=onmBtnrfbWwtwC65ORnu78yFPxk9nIYb0brVwOeR1lhkTgMdvVm6SOLagP7Jltiw7w7FNWf9moTID/VckVD16Tz0L7eFe6R+gzyQDK6N+3P1RuN7p52L56y1xTxWhFIZd2QbRYMQzvIrS9PE4keidn7gJcqdyyZn2aQD8WQpe9IynoijOYZlshT5yzMooP1J7MM41E24TPWKy4+9INuBHRQw1AwJ5H8Wdh2HShuDGABEUU9jJ47CPeOmFEO1itVblG+XLfF08sC+oHxWIt0RkDdwnQC2rsuTB7oRK1PLemHao4+nWnrfEuNhLldiQfsv1buGsesbJiLyRBLsJgR0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTtjC6i3JgokA2Gw4cDubB//3lU5pD4nECn/mjUoyQ8=;
 b=L6mpXwjv/3vyxUTGvzZuap/6PcPM1ODLttBO/MOIO34BtDq+4rcK8WyVjnUFAxZ+ocgxvqXwm+VfHJss1w01RkzYAaW0+WYcEIQNMBxZgleUhnzAfH6n+Die9PkvQHrR+1B3O17pUeOfsUequzDFff85jNkDzSldHYg24uxpv5kArQJy9FwxKIoajXeRWV1C99E93w2YxsYP2n9z23h+31BcCPrVJPEjykVYuSkbti2V7HJ8xSdnyHmtL7m3RFnm08eUfG6gsOos0Qqm9JlsAmwsXcjS/+2xwaT+zBF7WEY39//Gl+hHGZJQHMdzftFvD47CdIXfos2RNTY/BGEBlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB9754.eurprd04.prod.outlook.com (2603:10a6:20b:654::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 15:37:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 15:37:30 +0000
Date: Fri, 16 Jan 2026 10:37:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 2/3] i3c: mipi-i3c-hci: Add optional System Suspend
 support
Message-ID: <aWpbNHLu0BXPV1Cz@lizhi-Precision-Tower-5810>
References: <20260116151237.96721-1-adrian.hunter@intel.com>
 <20260116151237.96721-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260116151237.96721-3-adrian.hunter@intel.com>
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d05789-61b1-4ce1-7a53-08de551528fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Z5ktheCuRD4r4BZxXONBLOVr72yXaf5ROFNTnJiErJ28lI71TZE40GLQ0PK?=
 =?us-ascii?Q?ozcx6KMKRnuFvhytt3+5DqaE4x+KqiEeIJ9MqEVA+PZ+i50ONsj0C4xWf7x1?=
 =?us-ascii?Q?hJglCa+bej6Mwd6dP1q+uf6wov84adr3X9QtYuWlgmPB43zjk5Kmla0K+ado?=
 =?us-ascii?Q?bLgCrxajXuVNomg4j1ngRUQCl67ATBtfvO4WS/ljMj1j14AQgg1R3EptFgXH?=
 =?us-ascii?Q?6QClrnKNMxtiG0wYTLkTh3NQM+dccjbTG+lOwWBFPqW5H/Tm9ngJBLkp8rKy?=
 =?us-ascii?Q?6ydGbBU3HqRZxQOQgM9t1WeJVCakwvW9N8tmyXTT3K7h7+hBZAMpefi9sEUr?=
 =?us-ascii?Q?U6BS/Rw2vpbM8uoC9UcOLc7XPigpHC+k4T3OZEgbPNSlU66Gqu3rQ9lwRRwK?=
 =?us-ascii?Q?M8cpEMeOjWUKVM2gkQwKjKdHBsiVp754+AtB6cBaXX4ikHrQnKnesCZKXruM?=
 =?us-ascii?Q?m2Z3aTYYD7bHQ0l4iHLVg7Hkkn8DpVNVyIMAqaqRa47iw0OJq55G4iNQ/X5t?=
 =?us-ascii?Q?Z0xMgPae1upKJ8SHQEgfx54yCyu58XEG6x2ThQTgLyGzFfW+oBrJVYIN5zh8?=
 =?us-ascii?Q?X4UCTFQ95EUu1Q0g8+8vSSTFuAixy2bayllpaarPFauarTUO5DihVM0QACWu?=
 =?us-ascii?Q?VKfFADnz3kQ+wykR71CzCLMOkUxUHKLXj9m3l3Y9gikMaDyZKwIklsU6Ow2e?=
 =?us-ascii?Q?y+zhyNdcNzZfmikBkXLJBwQky6NvQ/FrB0bcxMiKv60jEgkvBMgwhb5zF23h?=
 =?us-ascii?Q?kD2A0ZHuw0zzghAruCPfyxeBkJOuBnhKnujRIpfUBL9kxqUTwlgOxEwmGCZt?=
 =?us-ascii?Q?RI1d6mpZnY6jMckJCvDVriqXRCy0kwOJXcWGGw0AkyfGGTi+Cjbe3/WMFbiF?=
 =?us-ascii?Q?/WT/Hr7Z7LB8HJHuty37vBZ0puhhsc7wg3PZReWr8W/3pV13WNTAnQda03VD?=
 =?us-ascii?Q?mr3WdKUbOM5NEC4eO/APYQUWIMAljJgfSYKVRAvLPipPoqSA8DDLYNsZzTzt?=
 =?us-ascii?Q?w9dlqLzUbm9/3evoYUZBP7x1KZywUHNvVdR8b9O88ee78LuxD9Pz3/jpoga6?=
 =?us-ascii?Q?o1OECowSBAfAqGqDlXfS9PJJuzKbVbCCXdmlLqdoxMhskzSLo6QlQOqPvZGW?=
 =?us-ascii?Q?62Wjbohc53VZUiY5x7UT974JCTjtmJXJrQfi6GKS0jGt+d1gnLUz20wb2Yvp?=
 =?us-ascii?Q?YnQmTzByIWRVeyMP6w1H0U3PMd0mHC61g9Q3EZt8GzajoA23IwAsx+GXUr1C?=
 =?us-ascii?Q?Ez/PaBpTPAB2/BC5GHC5Ixuo09B9KJ2sxjsFmDvA5b43ovaIUUDzMaAFlnyT?=
 =?us-ascii?Q?m4REClGqqZu/M+bm5KPqFQX5v6pA1n7vqyqb/i2Y0ZemaNgjia6Jeb2pe/yC?=
 =?us-ascii?Q?ycUadV1CDvwOKi0zxJFv5Vs/osjxJZK6dFyS/8ZsHa7oZ3vDho1L+m3ayTDp?=
 =?us-ascii?Q?67Z7njdn2dPDG5XSse0mT7lLSQgL1hjnmJaxybRRiTdAaepVAy2g5QMdJbWR?=
 =?us-ascii?Q?26s/3EBHamOX8JjTIzW5BJ+ubwKEYpjqaVSpNWZWq3GyszGX+xjrGIrfCvYY?=
 =?us-ascii?Q?afGxDLSwgqDriAwGVNH7aylVYlC/XjEDKJFkvnfmyqUL+KyYPeXaQDx8zSGL?=
 =?us-ascii?Q?fFN7YtT8h6QtCgd4rYinuxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BkRuyImlZXfRWKfDiqQDdB8dBGxkz7E9G4NVR8HPo7oFT2wdsFJfXZ5SzykJ?=
 =?us-ascii?Q?edcVEhyU2W7nmwJKOq/NTu9xS0nAq9uV9E0Ti7SsRCBdxEacukLA6bnDngS1?=
 =?us-ascii?Q?Bq+PUU2IAg+kS1nb1qr80JMfXYEbeAz30GSl24a9Pe1xN+l/MA2xLofGAuPK?=
 =?us-ascii?Q?5g82F68hgcD/zmhi/wl9Gfc46RfWbDIiXJrcBZw8vnXu6oCHoG1Hl6kLqJIv?=
 =?us-ascii?Q?nOqhPt2/7OnACkRBvcBEMTLW2cG/G5C6UeXyNh8N9d3sRv+lxv3UI47RZ4Hi?=
 =?us-ascii?Q?s2Ylw1Id89fC4U6LwwU+iwZMsFDfM5n11J0uMcq/lm8QJdJjALpY7dfAO6iR?=
 =?us-ascii?Q?5LvQvfsYDe6fshvJSp+s2AHHhgvfITg9Wc7tEzKCGzG7JdQndusNlaEmGP0n?=
 =?us-ascii?Q?2mpY+jTpVmpGKoLVNPyhdQcUcFZtgOfehb1C6LpvCoWjnBRG5crEJT7fB9Ck?=
 =?us-ascii?Q?nSe9keTT/XFgBDjnBkeBJ6rF8DhPl+WCz9I4eu2IRLOuf+wKxJ/9AKL7UW+R?=
 =?us-ascii?Q?764OIsA/hLodOd81cnCjuXyOjKF0M0qpJdDeL24W/4PMogprLBSUAtSwsGEr?=
 =?us-ascii?Q?acGMqxOIfg/TEjQJBG2er3y13gsyXleb7dxASGAQ6Wdw3Hf4Q8k/41rNG5g+?=
 =?us-ascii?Q?C8lsTx2WLTeam9MgLcsiDh7fQs7HKgVumxeP8eAYOhk4vrW4kRWlHyp5dcOV?=
 =?us-ascii?Q?VJovl0Gt8QjyxqZSHsmcCa/70eUMx+pTRiW7Gmgy3oSk8pNXbXSAYn/ye3kM?=
 =?us-ascii?Q?m8JKGQJqRsu4AU2PIPbkSl9zO/v+NC8GSn6FSl+DueGlNvPjxDLA8uzOR7q6?=
 =?us-ascii?Q?to1e2VCaYE2KYvlwi99bw3SqSBHwH6A9ne4Unxd2J4wtfIvXKGobPR+gv+sY?=
 =?us-ascii?Q?5PqAdlMyF0hStBmrydolfddXhjwkeqYXayBa82prabSaK6mrls1bFidfpeNq?=
 =?us-ascii?Q?PEs/5Vu/uwRF+MVhph6WeghMSSWiV4xyaCv6/U6fZxJic7iie8jmUpG44EUP?=
 =?us-ascii?Q?6SXXp1U0YBYQzEw5KSHgwSU6AFfvc8zT19vgdVZgh9ZjC+2vuVuNNanXtXDh?=
 =?us-ascii?Q?HCdaor7k1EwzVswGow7yE9dmwoe+8CdCN5Mr69lC/fqxijLbc2kPDTTICogu?=
 =?us-ascii?Q?SUmMV4XSCXFqFyLzfJK4TC9u0SEZOswX7tTyvYbybqXcfZH3V7iW1I+rxB4H?=
 =?us-ascii?Q?r/If8xmAzVS9kjd2CQ8zlBJjQCcpuVFJ/gW1ki1NT36a5w3z04KaLPrATekm?=
 =?us-ascii?Q?un7voGr6KlJbpSrY6I4be3OiQEVsrKkoRepwsRPzzsHCfXVr81CH20QEpOmJ?=
 =?us-ascii?Q?L7EY3BUfmgJtyaJcEYVFlWW0sAw7cKq7tLkUJO+Gci8KjMwkL495el+IbrEJ?=
 =?us-ascii?Q?hXkHjMXEeevrSnYXZNU/elWMqzDlqqH2mGPcI9OKKXyDgdd7dVZu7sF54LJO?=
 =?us-ascii?Q?i4U+2/i58AhKbzLdB5DyjagZ0mgTwHRfdkseddn4ymEesmp6gg0SY1Udm0pf?=
 =?us-ascii?Q?KJN619cqbuT1EIvVUsSqeuI7obenLEqfFcSFTJf+sjomJq/m+lZefYk74rcC?=
 =?us-ascii?Q?rAV2cN2ZwZObQ3qSQHilt2kCT7Hq44OERhcMsmv6fUG2/TZcyhYlTC4u3VxH?=
 =?us-ascii?Q?YA+u1MJ/W/c+Gi+ux5M7VYQJGPSXjI7guXTRLZp4vxVHBf2bau3ZSZkRJMTp?=
 =?us-ascii?Q?t/9PIVrWz4kwyteaHWUGeldq5vpTQmol1isqUJiZ1gUZK/Yg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d05789-61b1-4ce1-7a53-08de551528fc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:37:30.4686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biaztngwaoNfTGEnJlYt8Ed0WIdZkUj22g0fBpl62aB4nH/1sGw1pYck055wj5TpBpCwbUuFWj++R+QG/9D+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_073734_814821_9152486F 
X-CRM114-Status: GOOD (  22.56  )
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

On Fri, Jan 16, 2026 at 05:12:36PM +0200, Adrian Hunter wrote:
> Add system suspend callbacks.  Implement them by forcing runtime PM.
> Consequently bail out if Runtime PM is not allowed.
>
> On resume from System Suspend (suspend to RAM), rerun Dynamic Address
> Assignment to restore addresses for devices that may have lost power.
>
> On resume from System Hibernation (suspend to disk), use the new
> i3c_master_restore_daa() helper which additionally handles the case where
> devices are assigned different dynamic addresses after a hibernation boot.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 53 ++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 02c5a133e329..b972d8bc81e6 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -769,6 +769,53 @@ static int i3c_hci_runtime_resume(struct device *dev)
>  	return 0;
>  }
>
> +static int i3c_hci_suspend(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +
> +	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
> +		return 0;
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int i3c_hci_resume_common(struct device *dev, bool restore)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!(hci->quirks & HCI_QUIRK_RPM_ALLOWED))
> +		return 0;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (restore)
> +		ret = i3c_master_restore_daa(&hci->master);

Is it simpler if design API like

	i3c_master_do_daa_ext(&hci->master, restore);

Frank
> +	else
> +		ret = i3c_master_do_daa(&hci->master);
> +
> +	if (ret)
> +		dev_err(dev, "Dynamic Address Assignment failed on resume, error %d\n", ret);
> +
> +	/*
> +	 * I3C devices may have retained their dynamic address anyway. Do not
> +	 * fail the resume because of DAA error.
> +	 */
> +	return 0;
> +}
> +
> +static int i3c_hci_resume(struct device *dev)
> +{
> +	return i3c_hci_resume_common(dev, false);
> +}
> +
> +static int i3c_hci_restore(struct device *dev)
> +{
> +	return i3c_hci_resume_common(dev, true);
> +}
> +
>  #define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
>
>  static void i3c_hci_rpm_enable(struct device *dev)
> @@ -945,6 +992,12 @@ static const struct platform_device_id i3c_hci_driver_ids[] = {
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>
>  static const struct dev_pm_ops i3c_hci_pm_ops = {
> +	.suspend  = pm_sleep_ptr(i3c_hci_suspend),
> +	.resume   = pm_sleep_ptr(i3c_hci_resume),
> +	.freeze   = pm_sleep_ptr(i3c_hci_suspend),
> +	.thaw     = pm_sleep_ptr(i3c_hci_resume),
> +	.poweroff = pm_sleep_ptr(i3c_hci_suspend),
> +	.restore  = pm_sleep_ptr(i3c_hci_restore),
>  	RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)
>  };
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
