Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42BCCD5BB0
	for <linux-i3c@archiver.kernel.org>; Fri, 22 May 2026 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSQTJc2UPdXO0gG6ZW0uQ/A5S/eEI6euVIpd3cZx9po=; b=XfzJaInXmhrK5W
	RWEbKmp1FdwzBAdUiRMvmjj1GO/6GDifM0vANYKczK2UB34kEjwu0a+MW9uPQUheL9sl8F0yLyLWE
	iARErzl5p0mY86VIZJNaMr2qXdHA5Yb8f9xlkcwNduISDQQk3GbMayAOn86JEWeZC+5OgYdLDQn0O
	3L4QrqjQWhao2OKt9XV2GqLeArx5CF3AKNMrHnyoF1yO29dOddpsyIDHY0vbrJ/evHGpbPpmS/SLJ
	TtI0z8iayYD2iy44JbSN1XGOz4vdtaGNtAUjL68tyKK8C8oWPKl8Ww8cUh8CtIUwGqO4DM4ffOcrS
	fi++89j2/THKkYite4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQV99-0000000Bjdo-2LRS;
	Fri, 22 May 2026 19:02:59 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQV97-0000000BjdG-0nLJ
	for linux-i3c@lists.infradead.org;
	Fri, 22 May 2026 19:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEgiYRoyANTUXkBX85i/0l3ckfmkvkW1+MfKDkOhJAXOB9yX2kaPlPVYDMLxQYLEzyHI39ATbM6tCpv21hSSyO3KkAnIGGc9S6rK++HyOoxe3opJ+OT7eGRTrbgUz8OWKcRnyOOdlnB6tudkErFatDL8NUd5woLg5cAq8cke2xdF3vIFTRMZxOn5bUUmf+TRj5gulS9X6uX7PKamizNlW7ujoUhrPF0ndsMhjIhResIY1KKxqN4kKs0nKfRuIlWkopL2vwk7Eh24oHqdxdiTZ5/Sg4ph/F0yH8OUkIgRMw4iIdkcizirPNQ7IM2GsDc9NoU3djOEptEKlKNeX+Kqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GgBMJfJAGrtcoUj1vDKAKMFHUdFDEcn635ucO8UR+0=;
 b=JrdIt6DZihksSTQ8pIWaW8afxX2WAcz4yrspmIIcUEzvs8G5DJlDv54Yka99ALRGjej1kYoE4ZwEbKe8eerbqzsHIqtzA9g5LCCTArRdT8bqqlrxDpBCYzMskIvAQdNAkOt0SZq+yxLOg4S71McpXYLdyc+QZvwCJfp06aaEfIdPTYmk0lnZncqzGde1juPyZaFdp2Pjxg55e7uyrts0/4b/JmrFsodBg8/nUbTSyZ5Au2s8y5+dPcyw9Ph+qOYI/V/dZNPWYgv5J65kU5tUiVgOmYQRI9EMEoB3zvnR2CMqijoRE8YBs8Ue9IB9h1EloJnxS0ki/L11q19zPQi7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GgBMJfJAGrtcoUj1vDKAKMFHUdFDEcn635ucO8UR+0=;
 b=E80jTN0h4LIMcpBLh3cgzqCJA/wo14cSjSgvUainvjgBTy+EVXf2pdgiL3ROjYegNZViqWQn4aE1k+TDsKgyCRJyATnvwyhusD3NysNDOBaadvTLRzVsOeyg5pDHLZwGXMd14+E2/YwH3XydWiiFcrJyvz/+jgItqdmgRAQq2HFIAtUVduL9VW3dtRuBjCuBtuHj3Bgt3ZHBzV/Evv1/duYFff0DonZI5n7dBWKA+keGmz46PpvCmpZ1DFQEWn8p9JmgWQEXVp5xqADEHFYDw/kKhmq1F9bjfrDfmbTez9OJEc54/GtnGEjuHdQ0qvI7YGnXDG0vGrgk8CpVnmrQbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:02:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:02:51 +0000
Date: Fri, 22 May 2026 15:02:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 01/17] i3c: renesas: Check that the transfer is valid
 before accessing it
Message-ID: <ahCoVI9yIJ5Bsbq3@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-2-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-2-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH8PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:510:23c::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: ef40f444-9633-4cd7-38a0-08deb834b8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|56012099003|22082099003|18002099003|38350700014|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: YjWQ3lXyozkISbdGvZEk+FNzz8iFFNFePlkYNGyc8k5oW8WBR4nCMko7B3D73/OKK9uJqs7i/zLeIIJLnaquICm5SMHzqRAOdNto0meY3q+V1zhJPEEnsc8Muk+rviP07ZHvGqdaEd8sIDIttVSoK603wnBsHgbK1h+Iikg/gGxd613BmCIUcIDV/qb9fbHfMlfo3TqgUcX1Ep36rvhR3k3QsCTxZE172iHCoTs+d18M/aCxq8HNdrEzBgFnxbarCuzW332YGN18K7SYuS5LRIjcEtH/JuawtDpEJ7Zgr89/d2D3w5qk4HUEO7Pnq5f7kXt0mNkjKnmnICEYLUvSDrwyhoJITwTP8J4z6nPTYpCDmarlLctrH9AgDzbVjw7ZfSGJHZGLA803OTi+WL+96f39+WDxcn5iI0rqxjUylMqDXDxdvET5GtYKds/Goxj73IENzXM4UYMV0yvwtx50JDxULfWwfH8socEC9rR+UcwiiLL+GVsEhmvBnC8OeatkZ+cRopLxyljBycs+uBB8H5aSXGe5OcAL21TokbxSE4QcFizttrIJXMam+Ti0r5gzpr8/Ne1QjJ9gI5cfz9POkTjgm6WLrQVvQeGqoFZ7OXglvmzZCcvPe/2TYCg9k0KGPrlN9AeqohBOR2PuxViWeEJdYqoL+YWMKyKoV9oU3JNVcHLa/IaYpHM+kwAas/O1HsmK1JTprkJvryiCOO6xEtfLi7F6E7Zfmt6MeNB42ZzLvV3A4rvyL+8yx4EuGiuj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(56012099003)(22082099003)(18002099003)(38350700014)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8L6SNFTJ/7UXp1xX6ntNgXSxlNnLNMyyYTOEY2bqs91Ctk7q5wpe64XcPOPb?=
 =?us-ascii?Q?0mSKmRf/C2pwMCXuJj8AC9UBTqJHsx6AOhmOd9akSx4Galb9JHN06XhBXcIL?=
 =?us-ascii?Q?f9lf++WJ+XsESbaDGWuV/w3AFS2GZdyPwUUfUizuX6HcV0c70TsRfQsSR4UI?=
 =?us-ascii?Q?W08HkxzIKz3SHMoL6tqTTmMKLw847JudXiAAlRuFBolhRFLVjGTo1cR6gNi7?=
 =?us-ascii?Q?vpA27NA/LKtjBsS31NuLEwVppg04hd+5LfkEjxJ/Ui+eKE6+Yguwb27CksTf?=
 =?us-ascii?Q?v6J6gAWh00Krj2o5UvJLg+pnorJ6AoiPNhyIU5BzfDJ2Jsv+orFZLpGfELqy?=
 =?us-ascii?Q?6g6sg3L5vnx0ydMnJRa/MoOCiHBnf0RzK74xffZDbLHYhRdVlQaOamGPp19V?=
 =?us-ascii?Q?ZlWDskyyRJFnR9dFi+7589PlllNTA3Y14rgOjkZsgIo1azyBrK1a1p71jqiI?=
 =?us-ascii?Q?wA81dd/X4O5DEdNzfLb2P1pL29HmvNSyG4dB1wA3s95Oekn/i36jw3/pM+AK?=
 =?us-ascii?Q?1fO7bcLXystlULXUmGHLheGS+pHlfMBb9go8Qi/OSLzKKjHRAWn7JJQAkFF8?=
 =?us-ascii?Q?sFYviRTwn+EKlHKfswMG6RGRQxOhjplVBunOwGaoTwNGcd+AID0z9N9WU+Vr?=
 =?us-ascii?Q?+VaXb5ahVql4jdJAP4w7PjRN7qiCSgT1FgmaTV9yP6UzIf/HI7yuzcIkBI06?=
 =?us-ascii?Q?l36RiUNd+6ESgcDpSRHv7CFaslLFlcoYg2FI9ACKN9h2QJ/oDuF68NSwKRqT?=
 =?us-ascii?Q?hAxE1BPvL/GxRyCJIiEtXp9gonTrWML3LOYOejm/wwP3P/esunKr62pvaPUn?=
 =?us-ascii?Q?RiP6Xu0Jd+ATl6E9GieNvEZRjX+/euufFRfXgknJv2e4CM092xIpPb9hWx+r?=
 =?us-ascii?Q?agPL8JhMUsHKX0VtyaPpkTnXh0n836iY3YtFvY9mkf9pFw1TrFLcdNjimXW3?=
 =?us-ascii?Q?0H0EdU4IJ5chSCU8l4SFoyk2ntV+vGzSmaZmXWalWEzHzXjeCP5KE3swKRWA?=
 =?us-ascii?Q?3MNRBvM29OHvKT8pQVWQ+aN/+ViNgzUppRBafbxfFuZqxsZItUmkPde5a3mT?=
 =?us-ascii?Q?+6xP7s5EAQetlV6RhBjvSWc6Pu2hiDF2utVv/N6tZqHigDpfmu1AuHz9vCpD?=
 =?us-ascii?Q?MV8uo9c65Vt647WANKPYoVtsHLRsmqq5EDUG64ldLQbU4xovTJkowIUkl5vP?=
 =?us-ascii?Q?2ssxoSWsGsJf9ZoShNRaGeUsVsWshyp8/DmIuZC9fMYn9S/o1xXL64zNaZUI?=
 =?us-ascii?Q?TNrcT/rZ4EimlXUBFnKZHgaEqu3r2xyP+PTqLCrEuj2Q+G9Gaz5Pi5UELJ5Q?=
 =?us-ascii?Q?Lv466hw/L2aXqsRLhTmFWiGvUkuvkvv67+giZf0bNxXEnUyHobw/gOwQJtUy?=
 =?us-ascii?Q?B3tyIa3HCdAavWD0SFo7IR83O2MAeypjH3T/Gp+taYDG1+ySoCEBgQGfDdXC?=
 =?us-ascii?Q?OKS63JqtotxLi/FqhbqvX21GgChqP6zbg8/mNyBpOfERpH3C+D6e/+ORqyM4?=
 =?us-ascii?Q?69+Dq2qmeATgNmesQo/TJWlGicEj65vbHoNmjNkqm31YHVAPpkm3qrvwK2NX?=
 =?us-ascii?Q?jSWXozJRp8cl/+DdrsKV7i7veNdXIEXSbB1SiWqXkSf3UwokjFtiyce9PU7J?=
 =?us-ascii?Q?S6TIH1izBU64XUc/hGVfY7lqY4KK/dQwKrGVhwp5M1/lSF7HqueVx7lCWoKa?=
 =?us-ascii?Q?1BFJJjNhIC1f1SjGOjoFZFY1i6l7U/mB+BxiHlIDJ9Be7oLM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef40f444-9633-4cd7-38a0-08deb834b8aa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:02:51.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p6Or9eCingqJTmNFMcULJgXaYOvaPPpZkEhscu2ivoS5QOgD8GOgi+6pYpRFaQHIWZuBgpXf9NALLe6y5j9xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_120257_234647_1B1271DC 
X-CRM114-Status: GOOD (  18.89  )
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

On Fri, May 22, 2026 at 01:17:59PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas I3C driver uses an asynchronous model to transfer data. It
> prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
> The interrupt handler dequeues the transfer, updates/uses it, and signals
> the waiting thread.
>
> If the completion times out, the waiting thread dequeues the transfer and
> free it. If an interrupt fires after that, the handler may access freed
> memory, leading to crashes.
>
> Check that the transfer is still valid before accessing it in the
> interrupt handler.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index f39c449922ca..36e3ccbe66b0 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1014,6 +1014,9 @@ static irqreturn_t renesas_i3c_tx_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1054,6 +1057,9 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		/* Clear the Respone Queue Full status flag*/
> @@ -1138,6 +1144,9 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1184,6 +1193,9 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1235,6 +1247,8 @@ static irqreturn_t renesas_i3c_stop_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
>
>  		/* read back registers to confirm writes have fully propagated */
>  		renesas_writel(i3c->regs, BST, 0);
> @@ -1259,6 +1273,9 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
