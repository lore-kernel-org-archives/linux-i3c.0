Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33916C83F27
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9fNMWS3Rk+CEMMDAxSakpWGRfl8AYhDwDPTu8oIcWg=; b=p2mFPfgZCba+kp
	A4usk7cc2s36OydGoYQuS4t2w6X2IKwqgyTvE7UYdtUBy4JcIVUQ7x6gkrrodHrwDde9KgyJ+0gas
	naazyQPagbKE9lVQ8OG3Y7EElN98BZDzI2paKt9yCROslUXKn3f1lqJvMc2e3QzdwAdQLf+nBRlzZ
	MVQrF7tS62Vak0ASQN0LhQbV08apc6o/pUEdZZeX9h4cRZ05FLip7IZykF41yUjdstgPu7WpNSP55
	fWaByFbFL5K/ckGBbqMbM9fRk9PAlFr4XPOSFtCI3K4pjtNJizD2vlRWnOvQnBsvTpEWIBsJLF9ig
	Nbp8ur440d0e8kclYaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnB-00000002ZSB-3Cu7;
	Mon, 14 Jul 2025 15:08:33 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJxj-00000002RB9-36M0
	for linux-i3c@lists.infradead.org;
	Mon, 14 Jul 2025 14:15:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqTYEPZA5l3R9zDoqmzdljgt/L8NTVwVUdl8Cgih8YF1Ag6Z6HhcJDKSrcwhQ7na0nuTx0GbPsOIaBxEoyxHiotrsJDzib5vT/zEae2B8djAlx/PwuyXZXzeUZeKfmDxdl4bxy9si4pSI6LmUyp5ARzKUN7YMGhUSMfZNkk4f24wsPajxZrORd8YKjgWD/zQGHkVk+LcSKjv8L13sM9XIYp8jsAKmy2mGrIJWvUdQH2Swnn+oO45w2NA6dlHyVK8FsecvBV5mlY6Q3ONaKKTksCU+RNRboB60Tzkv9biBj6QIhjnY26ykmkdg4ynwFLWfXe1fvTeGLDL7UUCI8lOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AapsZSL3u9Xx2kZlb+wUXOdn1faFzVX92WCDsWBAIlA=;
 b=PdjGdjRNR8lhVcHhVdTlKC6bV0dQDvMXAk7GOD+L0lRpqWANnsUVono24pEF9LzSE/WSEEvQsH8+KTk6NxugEOjKLhYjd/2auB3WmJdMjAyOkd6/1MciWra3P13l0tr3IkaapiBssT3x8iB0y6HKTD+GS4SYxkrjXs+R9a/ms1KVPXDcfxw9u7/VQUw3wWw9y/Eh07BPyoQ+dSsCDOUXRxp9GDNWl9+J0INyAvgeCCMIMK9dyEm0qpPPnK5/XsTF3RGOMhPQvAyORdvha/VC6/I6EpcBZHTUeVB5W+DGHMFytfsoUQLV6+NwMw0mU1SdFvC1vhHpcqHmkWpkpmiEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AapsZSL3u9Xx2kZlb+wUXOdn1faFzVX92WCDsWBAIlA=;
 b=eHzR6jEcC6IjDsiPBhN2NCQcVXRb4NHYEIg0Noib5xeELS2Z2YgQelDL5YMxfdPYjbap4JwgytPygp5GLGm91Jn1vcpYhk4f/UyJb7lWfg80fGBsZCpXD+z/teEqsIL/gjAo/X3Yt0g2k5ZUQe2SMzO9wFp+DY2uQAT18jrlhHkXkL3iimjaryc6pAFbu8nJsmFhji9Kk7/UdbAkbRl72Ej+JAWfgl3Ro1wWpkVZKRrNfsHBb6cdBtpXRYShJCzIqz81tQU/l/tCXbz9TmptZ3EG7KcpIZ+mWETKsT/kf0Yp6dKp9xE1/TQ5JtUkVX6MAM/+B6mXYE3oMo6RuOtvaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7645.eurprd04.prod.outlook.com (2603:10a6:102:eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 14:15:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 14:15:14 +0000
Date: Mon, 14 Jul 2025 10:15:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: cdns: Simplify handling clocks in probe()
Message-ID: <aHUQ7Ge97/glY+s7@lizhi-Precision-Tower-5810>
References: <20250713152411.74917-2-krzysztof.kozlowski@linaro.org>
Content-Disposition: inline
In-Reply-To: <20250713152411.74917-2-krzysztof.kozlowski@linaro.org>
X-ClientProxiedBy: AM8P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a08a2a-1c9e-4aec-1547-08ddc2e0d9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pvadOAPk1MMFxp5g9ccli7B7u+KVBSaGTwjGwGXzQadSxGuRCMpldsZ+iaX2?=
 =?us-ascii?Q?/reUDCf/Hvzx4Ve+esTD7mSPqSj7o+KswxjcA40lGeBvLiFaTNZRIgRb1Z0f?=
 =?us-ascii?Q?SGFG5lopft3ZAmY8h73SrmABt0+G/rNhZArfzhK5tSmtSP/qbdbC3RJ1jyMT?=
 =?us-ascii?Q?866CmqbU1W8+7ztbsy/UDpZqR+T6LaO66sZ9vCmat9QyjIqb2I3OCClP205R?=
 =?us-ascii?Q?e3ppmn5Ps8JzsbioO/ddpNwvwIc5J1hyg/VZBXpQCuqyko/NVuHnkoOz0FBU?=
 =?us-ascii?Q?znvJW1S4UBK+5AXaLnQLuH08rnrzawSsgloiWm1ReBWOlO8B/XDj/9foy8jz?=
 =?us-ascii?Q?2bHiGr9Wp2L76ZvMcKxgcOkBhKoVt5XnftbHV251Oa6KpbYnAxmjs114mCNz?=
 =?us-ascii?Q?PcJBNhEKVxj3d+ar8MAMqHdK0YNXmNWFd3OIMfKNg3P/qA6ZIwzYK/krarnx?=
 =?us-ascii?Q?G9oHu/lFNeUtPTl3wVyuEN/2RGc5B2l7uDwdXbtEXJGF2NOjzyKXljevjHSq?=
 =?us-ascii?Q?m3ojKfVIYILCTVAq2LhbDkJ10oO+LRDNTJUc7KD2FSTSTaCxgK3ekQJFtVBm?=
 =?us-ascii?Q?PGfM7wAP75U/ftSrAf4p9daEWB+a1UyqG/viU0a44IvyGsl1gaknUU3J0QXG?=
 =?us-ascii?Q?jT3JtLfL4RdIWeQIdsCf4ERP4oamtTU8DevT+aCTlFmnexGasIam775QVQk+?=
 =?us-ascii?Q?F+YzkC04y76ZNHqbBR+C9KJ4WcuTvaT5yPHcBQ63KeY774c8XuKOntuuYGHh?=
 =?us-ascii?Q?k8CahYmAw8SJYrCleEWNOjL/cRS61SBByIb5I5hPx6E0iXw9SGy6rjIK4mth?=
 =?us-ascii?Q?MShsytK9soxga1xdmMG74QfTkjqxAvkVFN8vuWl/5ptp1cJfknmVeGYhi3op?=
 =?us-ascii?Q?L5eioP9zipD96+8hP9Cx4uwtMfFZpyP5K7BcRT/0ORv8ScUK4IzmS8BsZj5e?=
 =?us-ascii?Q?oWo+OZVAEwWoa+bwlPE8K8U28EtpPI01fi5AEkB/ZrFF05oYVjbff0gcSYv4?=
 =?us-ascii?Q?i0MIT/9p+0SGyZdUx8m+kiWp4bPJyv478FAZpGAIOPag+h9rCN5a9CCeIwfc?=
 =?us-ascii?Q?9Wn0BQ7vqHBFNibdJPAh1I7Oud3Ze6JsAh5tFoU9refZoeAZ05M1H/fjUGsC?=
 =?us-ascii?Q?8tVLuHVn1JRKYsA5j6PRdaVVtVtt6KY8t6uBv4QrMSZ5LC622w1NGMtiIRqr?=
 =?us-ascii?Q?F5WM6IJK9WtPqzT0RD1kcjt4g4+Y5YT5faXIM42zgB63hjre4zPht7raOiHG?=
 =?us-ascii?Q?Dh6hfRF4JcjSF+kLztZYL9xgVHuTitLMiPLwIzSh0zWnHNCwVbdwQ23vNThN?=
 =?us-ascii?Q?eOVrzBI37CzZw8Gv4dkOaFL6kuqc59ZHlLQpSILanIgDP35bH8rw7AmySQp3?=
 =?us-ascii?Q?U5SqAaO8Fu8fjpiV12xSNdNyyW6bagF3RkSRsc387sUUgyTbcwJhxSR6ZrqZ?=
 =?us-ascii?Q?eaCn0SXMmMb54Q5k/3s6nFzHd4xreJEbVwZRtrYgnf3q+Z4aoXGWOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v7F2EAdRVAiGhiM4rrzQykRA8vJtXCl+xUqB0yximrXff1mbLrWCBjLVVVQL?=
 =?us-ascii?Q?mWYf+eMlfocK4lLboW5hiSWBOe2w7ueuO8GZsfAq9Y7q4nqbod+dJaCW1nB5?=
 =?us-ascii?Q?gE+p10K0d4g5wFltgo3SsW+uQuiFcXSybV37YBmS7aF6XgwXM9CP09vJYoty?=
 =?us-ascii?Q?k0bylwY/niacQeDoq6EaNmYjhzGsSsRDeouQe6+B37+uAcpmLkrbsTWrqUbf?=
 =?us-ascii?Q?pYAMqDiasrZOQT63scKqK1jG8rxkjhgtW86OWeanZszTFBcBqIIkoIvJrNF9?=
 =?us-ascii?Q?/G4+j9x9BFSvANCARAsNzW0+zPTpy6BEV9BGSyTBiEMuiFmR/Of74VR8RCz6?=
 =?us-ascii?Q?1nJ7bTvJCHb6kNgySY5gFJaiVRdSWi0MSGGF4GozrGp+uPpXq4Z/P57KB1N7?=
 =?us-ascii?Q?8WqTdrNMsiZwi2kBQit8db8KPO7VVzeg7kBYHUI8m8AoHxz9Xxxcbz8DQjy9?=
 =?us-ascii?Q?bprwbchEm0IC5n4DMidfIHLLmRGlXUcgqu0XH53bM/dRyhMnUs5R+2UTc0vA?=
 =?us-ascii?Q?bewPkzB5B9/U8hYP8JnVcrxkm28umXyrHrtbv1Haw2RApEGYVIR7gR+Q9zMy?=
 =?us-ascii?Q?s9Dx2riOeqccB/GlvoVfAFTrYC/VaiIv8gomuLaw/O9MWlsbc9AaTti+mOuu?=
 =?us-ascii?Q?+U6D/67FVJ2tXocesX0n1Bv8KIvtNbJ0Mng1SVF8Uo5gAqXAkjr+Xz+msZTF?=
 =?us-ascii?Q?WU6nycWrsIgBeIu+mTjCg6KGrrRiCK0vghPZ9wiDa/eSqrkQjbTwDz31Jf3E?=
 =?us-ascii?Q?Zn1J8J9DGkVtm7NbzaVcAJUEYNf/+YZnzaz1GbVqxRAgrvFOTeJiH96w1JY9?=
 =?us-ascii?Q?dGvbVx5HvS/Ea/teXKb9Xx+kKp6KFJV1uG2bQfBcLEpUp0e9cXlmuXhB1JmP?=
 =?us-ascii?Q?t7jf5h7U80JvK3ZEhtQ5qUgthG8lMuRXj81pgKwjCg8TWtp7TjAjmCdgg7vk?=
 =?us-ascii?Q?yeCUXDTmJxO6PTSzeOVrmgu52o+NLtOk6+IyBJU/+hdyTW2iJMldKpEhYH94?=
 =?us-ascii?Q?GXSzEZ09//VmmPbF6W1OuUdHXEdcIX5/9PEPd2dd4h/aw47ivhk8tWbjVVr6?=
 =?us-ascii?Q?ssefahYPEUmHkBPGS+xNFyRZnTl2zE2py8ttDunzrhOL5r+q1Rfz+PT42i7M?=
 =?us-ascii?Q?wacQO0RyDtXtLgMMEbr0EYwSwqirQo71Vajx2cZDu0XkKrFpz9PcL11jGEpu?=
 =?us-ascii?Q?7Mcdd2tYEhbfcdZ0S5FIdwjlKKa1HWKYMQpLkyKmV/EQvVnDJ6sapGP11cF+?=
 =?us-ascii?Q?v98gjxA3ruqRvh/k+ycd2XjpLiGpw4PkpyJSEbYLj9fCML+JpLCYkhnVX79W?=
 =?us-ascii?Q?XrEgNHEfTiGe/jrr+wGF1m9ccgAf6AvgfS4t3AfplppHgEh9OBX58kmu9mop?=
 =?us-ascii?Q?Z/A8oFDvl9j/2rrLDzrUFCugsrJj6Lov3OIMOXCXmguz/qoNHy2wxE4Mj6AN?=
 =?us-ascii?Q?Az6hc5YYE4zliXv9q0P0RiDIO8JuXV6JVkumLX+PTeoSNWt2tuP06Pf737uE?=
 =?us-ascii?Q?6g1GX21p5XTjEDTzTKW7IpzRtSizpiYE/UgZiiBXF8jUr3icydUVBiSr9sLE?=
 =?us-ascii?Q?nelTdvUqcl0ZfppKs90=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a08a2a-1c9e-4aec-1547-08ddc2e0d9c4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:15:14.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKgxzF796cXYNCbskqvpyBlJKw0Cwt/FtPcNOZx5c0pYv9tYHKo+tNhKz/6NleVKNbt3pA+L7LPmA3578ZlYug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_071523_789674_65011035 
X-CRM114-Status: GOOD (  23.14  )
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

On Sun, Jul 13, 2025 at 05:24:12PM +0200, Krzysztof Kozlowski wrote:
> The two clocks, driver is getting, are not being disabled/re-enabled
> during runtime of the device.  Eliminate one variable in state struct,
> all error paths and a lot of code from probe() and remove() by using
> devm_clk_get_enabled().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 51 +++++++---------------------
>  1 file changed, 12 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 449e85d7ba87..cc504b58013a 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -412,7 +412,6 @@ struct cdns_i3c_master {
>  	} xferqueue;
>  	void __iomem *regs;
>  	struct clk *sysclk;
> -	struct clk *pclk;
>  	struct cdns_i3c_master_caps caps;
>  	unsigned long i3c_scl_lim;
>  	const struct cdns_i3c_data *devdata;
> @@ -1566,6 +1565,7 @@ MODULE_DEVICE_TABLE(of, cdns_i3c_master_of_ids);
>  static int cdns_i3c_master_probe(struct platform_device *pdev)
>  {
>  	struct cdns_i3c_master *master;
> +	struct clk *pclk;
>  	int ret, irq;
>  	u32 val;
>
> @@ -1581,11 +1581,11 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
>
> -	master->pclk = devm_clk_get(&pdev->dev, "pclk");
> -	if (IS_ERR(master->pclk))
> -		return PTR_ERR(master->pclk);
> +	pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return PTR_ERR(pclk);
>
> -	master->sysclk = devm_clk_get(&pdev->dev, "sysclk");
> +	master->sysclk = devm_clk_get_enabled(&pdev->dev, "sysclk");

Can you use devm_clk_bulk_get_all_enabled() to simpilfy futher?

Frank

>  	if (IS_ERR(master->sysclk))
>  		return PTR_ERR(master->sysclk);
>
> @@ -1593,18 +1593,8 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>
> -	ret = clk_prepare_enable(master->pclk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(master->sysclk);
> -	if (ret)
> -		goto err_disable_pclk;
> -
> -	if (readl(master->regs + DEV_ID) != DEV_ID_I3C_MASTER) {
> -		ret = -EINVAL;
> -		goto err_disable_sysclk;
> -	}
> +	if (readl(master->regs + DEV_ID) != DEV_ID_I3C_MASTER)
> +		return -EINVAL;
>
>  	spin_lock_init(&master->xferqueue.lock);
>  	INIT_LIST_HEAD(&master->xferqueue.list);
> @@ -1615,7 +1605,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
>  			       dev_name(&pdev->dev), master);
>  	if (ret)
> -		goto err_disable_sysclk;
> +		return ret;
>
>  	platform_set_drvdata(pdev, master);
>
> @@ -1637,29 +1627,15 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
>  					 sizeof(*master->ibi.slots),
>  					 GFP_KERNEL);
> -	if (!master->ibi.slots) {
> -		ret = -ENOMEM;
> -		goto err_disable_sysclk;
> -	}
> +	if (!master->ibi.slots)
> +		return -ENOMEM;
>
>  	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
>  	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
>  	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
>
> -	ret = i3c_master_register(&master->base, &pdev->dev,
> -				  &cdns_i3c_master_ops, false);
> -	if (ret)
> -		goto err_disable_sysclk;
> -
> -	return 0;
> -
> -err_disable_sysclk:
> -	clk_disable_unprepare(master->sysclk);
> -
> -err_disable_pclk:
> -	clk_disable_unprepare(master->pclk);
> -
> -	return ret;
> +	return i3c_master_register(&master->base, &pdev->dev,
> +				   &cdns_i3c_master_ops, false);
>  }
>
>  static void cdns_i3c_master_remove(struct platform_device *pdev)
> @@ -1668,9 +1644,6 @@ static void cdns_i3c_master_remove(struct platform_device *pdev)
>
>  	cancel_work_sync(&master->hj_work);
>  	i3c_master_unregister(&master->base);
> -
> -	clk_disable_unprepare(master->sysclk);
> -	clk_disable_unprepare(master->pclk);
>  }
>
>  static struct platform_driver cdns_i3c_master = {
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
