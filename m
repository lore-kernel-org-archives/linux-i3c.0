Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42888D7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=428HfN1jqKCXPg3LUdodqtGmIh3APb8QigYddwwCQYg=; b=Nan1Rhjarucb+8
	GOiphuazgnr0jMPP4duZ+RNcezxuWXajpEEO1g0aJLHlpovOKE0btxB5kyIrbNAm9qrNnkq6ie2/P
	xvj9MyzSF/S5bQom8AdfHc79Kyyx/EsQodjzmjn5BmqfhsBlnwo3GYDgU12nOcs5F8TxXuKn4u7tv
	sV5wfHn9dw97j9I+APhtXig/UYAVbpnD40r2bicBhivVjw2lGs9bP7cG/JQp1SDX/clzLkkUpPhas
	8RHDeK1FRoo8nwS49/cBfKH1ThtUOU6adCCh/58E2I8VGqZtqtzDJdPX5eSLsIyuti6SmKdd4gSTF
	EUbkdWiTB80Bfb0kVJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdLh-0000000AeFU-015R;
	Fri, 19 Dec 2025 16:29:01 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdLe-0000000AeF1-3kJu
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNjIxAw9Zf+vtPhMMGwb9AhbyG2hItKbn6SSmyTj+FMKcSak7J3kN7xz1tzQP9tv79QX2WLEO6iB6CxYFXkhO1HZ0b6IBLgswmvYwTg0kwB3n9ZwtKY0l3AG/4WrFUFoxFKk3zSZj7hgiBv9VYjaZpXPmLD31w/WrcsBhzL3HOiv3rGlZ+IszLB5j4iuAQ6ZFgwAmAXfALin5KGZ6IDtBaX8PZ8QCq1A2y3puJ/+wcEtBbzTExoFofT9fqexud8ftH4z7wPLsq1iyOo1RKplTX1Sod70bU/IjwsVUq749lF6Co5ThgQVMqN+HrkV6ThyOO1LrTqPdkvWoM951/9ZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PF1xOJXVffo7/JWfBIuQKbfXqeySwTQ1f1yJ7Xf7slE=;
 b=GHNG/RyA1H/dmYYPYFkuQtV56NAGXryAIW4oWpUwt/8rYs3uCGls1nH9BpPuS4XcKVxp02dnt9iBDppoqZHRSSjLJji1bQnlFhXHAKpp10Eq14SmAfa/VAeJMMn93I6uYqbnJDm23UGk/PwP/4FiDatkGuCzyCSXWVZYR3tS4WrLg9u+xNuxqceFFBf1g0h1bhia+sQcOhEdD+gksa6Y/eAzqhPuO21tkLKok2bC6vfkgY5dNWZDc5XwUprWjBGcANlN/JhloYJuJRHEtxnpcDCHBi1CR4jIOLE+wmKvfD/mOniMVqUmMuJeqBy8358Q0wouNItDghYdYOLr4bo0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF1xOJXVffo7/JWfBIuQKbfXqeySwTQ1f1yJ7Xf7slE=;
 b=Jr2prKLuF3ziE9TaGUOyXecYEujgYEkm3J2aiiPupm2OpIJl+2hNhOoWr8D6IxxXLOw2fZGNnXByu9pLFk7TURYrWiwBEETJ3Hb94VZZygjYsb2quBLXGAEdBL771wCrf+dvbv8cqhtj0aiI7ustgabZH3Cue1kd0449QF0hjI11urKEx00/U7XAeucLuzYV6uoi5RJxbKBxJT/Y/HdSo49qqfiqPzpjqy4mG1UQfIbE3Pn8AmDDUj6YBJ8kri7lKZj/+3fi0vSFzYg4ybst/e6HIeA2UZylu2BCE+korkSGjKTNRjAl+7U3W7pkbCZnnEGzq0Q3xFBGY9fqRu1YOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8386.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 16:28:53 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:28:53 +0000
Date: Fri, 19 Dec 2025 11:28:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 06/17] i3c: mipi-i3c-hci: Switch PIO data allocation to
 devm_kzalloc()
Message-ID: <aUV9P+5ofUO2tdtA@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-7-adrian.hunter@intel.com>
X-ClientProxiedBy: PH5P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: fd29f570-b3d9-4684-c538-08de3f1bb2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OrhktK73JyYIvJEj/gzGp+5ucHfbfA8Gwj68bFPadD4R5yDOMQXjJx98O+kk?=
 =?us-ascii?Q?RxpCJ+GWassnhNetppbQ8uTOPEoyzm27QTJ/k0rp2ftv5BPQEL/AnIk4USIJ?=
 =?us-ascii?Q?OaDqeMonYyrnPTYl6jsafk+6pJZVo4lazm6DWxJoPwJg/oYW8INPXcni1fM0?=
 =?us-ascii?Q?hgxiDQIxUp/ykgp8sMoJnb95Q1MSTrpIt16FOBFooTPpjsoI4YLwsNG0pKBk?=
 =?us-ascii?Q?hqRFMS7QYrGjZmvUIzpnSEQD+e2DzgLFCifQt4ZkhHvn3mOV6pyyv0FC7PBu?=
 =?us-ascii?Q?AsZC8lEhqVnW9U8FnukVCs2h0EOG7MTB2JFXcyRjYjnkDyvEsPcnU/hH8mvM?=
 =?us-ascii?Q?myDFhZlfF3E2m4onyH2mQGBGM7S8z7x2VTbVfZQs+PzFkUwAcIqPGEhlcr/O?=
 =?us-ascii?Q?6AZ67AhW/e+oAVP0BPqpjU6qumwP3+9s2nyDRVYU1iXkD8PWgp/O+qpkTRLQ?=
 =?us-ascii?Q?T7mRiYBIjdCV2Wcz3zS263q7OsPOMmEDZd/pI8x7ifKphfm5rf900/OV1NmO?=
 =?us-ascii?Q?GtCn6gCacwet3A1NzMCHsj98Pu1Tq9LymXxyePYmQhtb3Z/pE1jeft8EKRKl?=
 =?us-ascii?Q?JEdDfpEkacDPocMsMh5QK9wUjwHXqCighwMR00HeYPlA0MFN/0pVANBLYihX?=
 =?us-ascii?Q?98/Entq1yQ7zpmHjT2F6K9qZiBwPrTrJ+GspbSXomjNnrqoCJdNpDwSveMn+?=
 =?us-ascii?Q?5YG6+MUqXyLvb9MrZ2x9ol37Uf8gcEhnsTNE+wFVOekcXIyeirsq8DUD/wUI?=
 =?us-ascii?Q?J6WCxu2JACe9F6X+dkYIkewhtMD2Om5HAYi41LmEooaXO9Yd34SNEhWjSnvB?=
 =?us-ascii?Q?KId1sSUiERS2PKoA1zrXmj/sQVEMDOX0okC6atWjtYg+/qWNvkGr6+gsCvYa?=
 =?us-ascii?Q?nhig5stdlZJyV8kvN+geUrLUKDFFmhFhPDaJJzVaMN/ncoNA5rDasKKs/XGh?=
 =?us-ascii?Q?Q4kq/obPRwLAvYmYenTZGgoJCsJdJkWf7HhdxZFy+RxOi7KtBMCfFjR/BSoL?=
 =?us-ascii?Q?B/QDH8fU/NA3aWs6RLaqpLDzJOOLYZWErWgYqsNXuPEkMG1ZYdqWJbh6kq5a?=
 =?us-ascii?Q?BsvRUYzLizBgThhd7BzUZsIsX6ihLXUhYWm0N1WqGcxwv8v61YeTxqorTrVX?=
 =?us-ascii?Q?liOpgbk2jnVqh5k2DufKCJ5mBTJ2OPu/RpckfaR0IwL/jPNKaYel2MP4lWDA?=
 =?us-ascii?Q?Gx8M40RlxKtqGKZBL7JCaFDk6bhQSyWCjDf3RFSecolak38cEOarn/FGQiRu?=
 =?us-ascii?Q?H7WsW1g7FxcapL51M31A0lLVMYLYmhNAQC24oEgkLCzprWrO1kVYMu+p2DvQ?=
 =?us-ascii?Q?OA7xGhgftl491jBTLWmIYFv4zBU3kXFNxSpxZ2UOwH12+KR4W68On6BBA5xt?=
 =?us-ascii?Q?MWSz0PuUupM7RHdEPKcQfbnmZzNRz31LiAyvXzGI48mPrS7JYtq16H/qwBjY?=
 =?us-ascii?Q?MKhuTygk6CZk2c/PE9LkpzWL/i3lGA39adha8rPlMaqGD4Xs+u2aG0raFaqB?=
 =?us-ascii?Q?DO2GywuEfU3sS0Ub+oEnzHAJl4Y9RuyTLhM6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e9yaASWVVL/8FkjcMCDyy0km82ktKk47NHoaIfvR/FUTLTPUjIltFj1UoZzx?=
 =?us-ascii?Q?YQkddUwRYQUOWk3ziHKHfEiraxj13Jy4T1HfcDKugFYBZDnbemT3hqrLx2ks?=
 =?us-ascii?Q?5e0/47nCIQ+yqWK7B5fvldi2CfpWHlixjyjFr6Hy09WJf/VAc15swcJL+KSQ?=
 =?us-ascii?Q?VF4wjM+959lHHwWi+ok5aOWBxaWBBVmbvl8KuNL25MORhbK5W9VFnYysMMuR?=
 =?us-ascii?Q?SFbJYI/DtizpB+fh7ZUDBH/8YBXkh+d043iU8+M9xhzVmY8Jsd1S1/0EfHPG?=
 =?us-ascii?Q?jRL2VbIetc4ZHybSd24yGSoC7sm+b2xY2ni8Ui998m0nB6f9wz8/XfuOT/JM?=
 =?us-ascii?Q?T7E143D6/K5gip+EEpofC98cSlW/e52rh4W3rLU3AGeKwEekTvzEbpKHVzpT?=
 =?us-ascii?Q?j7ADkYPzlYa9PlXNkuksdEbi6VNt8pXadF/c3nC3EHbAFkjPdFLW/85yC6be?=
 =?us-ascii?Q?jf67v4qvaOn/t4MjK0cfDW7saSRmeo2p4C9f8x3Jemejs0fCRevW0wwRVAC2?=
 =?us-ascii?Q?fKhASXU7uQYYwo83brreIPjvoxmt99FU9r6B+e+bC4K1Rx85UKXK5UngSilY?=
 =?us-ascii?Q?CroZKyjsmN6UR/0V8p+bFPnhszVFnFw1GkYGPsLLXerdiaCegrxrTILVoaXA?=
 =?us-ascii?Q?Ng1RHIJY5/ayYNUXrvVgnkPCnhY9GBhFZqnBiIx6egwGpLaohUU+P7jQCFX4?=
 =?us-ascii?Q?6Aw9HTF8MiJhhAem+OuT2cetKiiT7rq7XRg/wabaesRV51nyRyuvAeWBPcD/?=
 =?us-ascii?Q?73a6GUSyf9p4nIngLTD3GGEfUVRDEBcw9Nj8EzdCL15plGaw7yY4d7Q9NNWB?=
 =?us-ascii?Q?EmPJfjsQGvPoIri/U+sDIwhM8L+b+cBAj2jFqQUrGYwTne3DS2nyJrxu4TVd?=
 =?us-ascii?Q?rX0v2xJEVdYsZqres8OiE1gxJNwwnlEwwE9lS7qANqPIiQvCNh0DdBMxN5wD?=
 =?us-ascii?Q?IVvImEOjDGLQfYP0RL4R7DYKtZbEr7X3dHsYw0AaRAzFUwSwTTwW29WI07gZ?=
 =?us-ascii?Q?4VeNPM8xfyPMavzhflFQYllNn36h99zCZI1vflxj6tnPv0a8MGIrC9jhtPMS?=
 =?us-ascii?Q?Yd32VlRt2/r/RPsvXkjM1lCISFnKZCbGDSB5ad25gF0I3do9Jfq/730NGKFt?=
 =?us-ascii?Q?eJYUzujO+k0Tder4lcFYvc1E9VRmKiKGLZ6kjAxG3j8R/bvDp7XNn8PufLmg?=
 =?us-ascii?Q?S/wU3EwcUGBbtCBnPzsPZsakvqF4dWQcPHYP97kaA+K+Xro1D661NhVoJHwK?=
 =?us-ascii?Q?FvWQ2AaK59nNMXKG90DXR2YsyJ6J9C8IE+SiAVo6eITT1WsLEmp0VokUE6Lg?=
 =?us-ascii?Q?1lSxSh5w5NCVuoKcqRnvxSBshQ5Xb8V6tVd5XtX099Z7Kp+ckkCsiDZVJzdl?=
 =?us-ascii?Q?9xiyuzWMWvFy+uOE7s1A63ZbaIngGmuAfsqtZ87cmwFqP3P1/WVQXhrdExRk?=
 =?us-ascii?Q?7j5sQbKMWhwxuzJ4eUVigvW+uQQEUa2ipJytQJmf6rDj8ZPqOJWRlnJCJq47?=
 =?us-ascii?Q?UafCmBcMADIf6mqmKBHIUAbp9ipKa+/XmP1qbYQ9I103G3wJWArrJz8h+PzO?=
 =?us-ascii?Q?+Z0Ke1xMsAxIGE+iGgBhaZoY/nABjXqhrQ3t8nIqvD3h/Q60KnqBomSFAGeu?=
 =?us-ascii?Q?3TQiTTyb8AMMDhYBjTZcjJacFtFVFZTz1tEDVZHxgs17I1y+G7oeil62p65/?=
 =?us-ascii?Q?2tRaq2y2Tb8NifSxPyJQJ91OcLisP/4eqKcH8OTOHhgeX9nEfxKXPsB6SUhi?=
 =?us-ascii?Q?0aj3yCHLUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd29f570-b3d9-4684-c538-08de3f1bb2e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:28:53.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLjfgtQ8qF6hANlxjlb4cBQbgWj3JviunXbk/+egASmNOF5xkKKCSDMC+P+0TYkdogG7jSUUUU7Dg7xo17nSEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8386
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_082858_942245_2F0F47C2 
X-CRM114-Status: GOOD (  15.32  )
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

On Fri, Dec 19, 2025 at 04:45:23PM +0200, Adrian Hunter wrote:
> The driver already uses managed resources, so convert the PIO data
> structure allocation to use devm_zalloc().  Remove the manual kfree().

Nit: remove word 'use'.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/pio.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index 90dca56fc0c5..3d633abf6099 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -140,7 +140,7 @@ static int hci_pio_init(struct i3c_hci *hci)
>  	struct hci_pio_data *pio;
>  	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
>
> -	pio = kzalloc(sizeof(*pio), GFP_KERNEL);
> +	pio = devm_kzalloc(hci->master.dev.parent, sizeof(*pio), GFP_KERNEL);
>  	if (!pio)
>  		return -ENOMEM;
>
> @@ -220,8 +220,6 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>  		BUG_ON(pio->curr_rx);
>  		BUG_ON(pio->curr_tx);
>  		BUG_ON(pio->curr_resp);
> -		kfree(pio);
> -		hci->io_data = NULL;
>  	}
>  }
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
