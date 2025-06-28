Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAA4C7EE39
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Jun 2025 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8c4r8yYh8P5CEcIhLK2mb6NYTcbMPXnzj/m8DUeadqA=; b=hM+6jTgqqSqCrM
	63juT9EcxIr9H+XP0ZSvkhByBZDm/uuqV/+oItO2Aw/aE6NnV68U3wgVhcmA6rxnr+LZBXH6A2/op
	CNt87qGro7fYLuDdeDCKB7wbsCwfsMWuEdkGDFTOnKI1kyHKh5HxPT7d7NuCpq1ZJ1krRJGosTIPv
	bAYe68oQNhpncEqhbr/v5YZ2Ox7HmpeHmrRe3FejomdFxUMgT8i07z7h0T2VgADdwkWDZKY41ovF+
	TC27KibFwyx6XrIvpn2pF5dBw7Qc5oap73tEPB4uyQ9QF66jZKXKcu6ev+cJjgiBWsvkfnTleg2BB
	N6ox00GdWOu6O6BSucDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVamE-0000000HEEQ-4ARp;
	Sat, 28 Jun 2025 18:59:50 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVamB-0000000HECg-1Rwb
	for linux-i3c@lists.infradead.org;
	Sat, 28 Jun 2025 18:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rV9BlUttxmKv0v3LTQptH0Df8ifX+CCKAAtGYblyzHBzDR4b82RR6Qb5AFWrAnVTeQN0ru79K+kGH9BoOJNpE8fI1pRmloVf25xQ3nvgnWdcRtdLB8XGEdhkD8aHvCNquwTZpHbgwKP9p4J328Vk+WdYD50yUDwP4IU5jc0uwpQKt1AfdeWo6kAqE6Z7qv2MdF9gKXrzKkCQcpyKqY7GsxqJBAtrIXZ3S3vsQ7I/T6o0ohwrPDcvJH/tPQp6fsuWYNZybydQ3Iitlx3C9h2ULndxLX/5zh0snhoinkcC79hjEqmHnGs4d0Rkb1z9VHJnI3pLaFRswPg389fq2rOjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5dtIt9Of+jL15Ql497uKRXFaU2HcO/UPbNX12d15FU=;
 b=sicly8Kxo7qclbuSe7/VL+ryVWEcJoRTtDkRmjyb5Kh2CptEVAfGtk6iqgN6Ky9x6p9cDaVSHAavoXKzfp6gzykFIM5AdvDydJ/5s8m9pkdytTFwYfqNTojWgV2UAwAhkFVYl7swwDDNge+8u/PMZ8MD766951CO/lewu9vlKzQiKYjJ3G8bMoENe3vh16CgJUinM44KrXWoYeD+jFuyVLPNOSql/+2kPe+VZG0qmTyKEiZ1pWyib/Ksd/hS/DmzS84NfD8gtrv4udBPBpWpKvOoD3MYGmZ6q1D559PfRXQuXed9IWDjmUy4LmtNzHjeYPc+M8Dg+369eZi3g3ki7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5dtIt9Of+jL15Ql497uKRXFaU2HcO/UPbNX12d15FU=;
 b=A3sHd9OU6j3sZPoqXZhnJerQ6wA/XVR7nEaMslYjBabmW/eaCSPHNt7NZwZUgdbUt+YjVHKCWpNZYUxJbKedg6k/S7ISY3qUWMUwHU52DO2JnVzvgAH7/9UFnPotOWcpPjpMW1Br+5ZeNit5PZOS4bVs4d4Rw9w2ykt22qkPNiR0zpZvV9aPACn18iLcs8pn+noXpJ87vXpkjQpPiuqDplwn0QWQcLDATPIVqs1kwhTF/dlUXuw+KbumFXQquMy/TdtTqNZMDinHNbPJj8XwvJC1h25XAkVrSY8+JHyth5Ts90roSDyTZESion+512jOqoPFAOsMNtA4Z+Q3uyMzdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB11058.eurprd04.prod.outlook.com (2603:10a6:102:489::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Sat, 28 Jun
 2025 18:59:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Sat, 28 Jun 2025
 18:59:43 +0000
Date: Sat, 28 Jun 2025 14:59:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 1/3] i3c: master: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aGA2DCfUfK5ZN4bR@lizhi-Precision-Tower-5810>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
 <20250627111755.16535-6-wsa+renesas@sang-engineering.com>
 <aF8DLbPnxLJVDn6t@lizhi-Precision-Tower-5810>
 <aF_AE7H6H_Zb2W0L@shikoro>
Content-Disposition: inline
In-Reply-To: <aF_AE7H6H_Zb2W0L@shikoro>
X-ClientProxiedBy: AM0PR02CA0185.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB11058:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4d93b7-2fed-4180-3a71-08ddb675f10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4dRwJqcReZJHed4Wnvj2E4U3FjGl0nh+ZE40x1SYII6bQ+/cDthM24FZ+ztv?=
 =?us-ascii?Q?Jgk+a/9GqEvejAYi4KTRGS6zl4+VfP4hqastNRJupNklH/5NDEUSDFnlerO2?=
 =?us-ascii?Q?CFkhyKZ+OJD5n52zLpEdta4jJdNwDFYpTnpnIIJBW5Xskxa+1XWYP+7qWU0M?=
 =?us-ascii?Q?9KAqbcjeUukmZMtD61PFiexmlZhwK97VoL6AQviLewH36BstLip5RIZr443t?=
 =?us-ascii?Q?TWWuWY/9Oe6AFrP67+kVnB1fFwEOz+E8u8Jvmeu9Om2n+ytL9AnfhfgDJhd4?=
 =?us-ascii?Q?43ZhGhqgDdR3vmQY6MJg2Cubq2Vpa0BZODGCk5Pa+jgc0UqQdJAlRr8jXv/N?=
 =?us-ascii?Q?lc+ZRTTR9bWDjt8Pm82UE5Tw6FRfUroiglifJFjYdSSS8DUXuzj36ftJRjSZ?=
 =?us-ascii?Q?KV7xBeON1zIBcs7XngWMMPl8RhXtJ094apBkVMfd/lmUsNdoLiojz2Zhu4L0?=
 =?us-ascii?Q?YgvxnJXNDCdgU2RV9ZGRVNZCNiCuxlY2rpZv75j2Dwdw7gcWIGxs3m7sxE5G?=
 =?us-ascii?Q?iyXaxfsasG1/fjhxRlhLKA7IzBJvYP8ABGWxNT+TBTRJoSBjwaic4nyIAaxO?=
 =?us-ascii?Q?Fvc98tUh0nVCCCSqDJQfPGbLkwViD/fg4aaxQe5EE/HoajLJRd4pRaH/FMj8?=
 =?us-ascii?Q?xddyoAe+j0PgebthzwkDFGj1s/vcfsK4yu94RwYDpJrAHHQIPLssAUKlRWf4?=
 =?us-ascii?Q?Wf5/KVcieLuBOf6Y8+4c9ckAUQQVPlMdTtU3Er3QGOaWU3VGxYp4bRx3OHAD?=
 =?us-ascii?Q?sU/3oO1YU/yvzPRI/S6PgGnHSe2eUwd/KIWhdjwTud+40vBwvhQptBYBIg+O?=
 =?us-ascii?Q?3jdeWfdWBG2lsq8H/QYbL2xUM4DG8ZmvkUKbk6F+3NPI04kLia72z6Kra5Nj?=
 =?us-ascii?Q?6VaH6VDZAFS0fv2s44t7ThsRroQhJAZVEdjU5wgXGjozBdNzRo6HK60YUnvV?=
 =?us-ascii?Q?0IIYtsKAAMqqZL9oxj0btmhpDPjcoxWixE4Ail7/QirWSl6E1q9ejjekB6VG?=
 =?us-ascii?Q?jvzK/ivPVmVlwtOeduaxZoBr70/IgPS76I4oekbg/NkKGJNKhawlmklrHQ81?=
 =?us-ascii?Q?BnY38dGnG2V4+7RChU/Bp+YswPSWEjhmUUoJYPVkqrBZl7SM+lP9+SutJ9dR?=
 =?us-ascii?Q?dg5kQaUVov4Md51gVWTSflpn8P8eIYP5RkT5RZzwjBibZjYmGjzD5xs3g9YM?=
 =?us-ascii?Q?KXcoFbAucLBkR+PF7a2kwgEL7wJxOXOWN3VGAh0whPLXImN2ZiIzmPueVChM?=
 =?us-ascii?Q?l20rHtnRU1tmciXf5gFNSComVIhMpR70S+6BVEbmeakQch0nXthDSObBd9sb?=
 =?us-ascii?Q?AVhWzl/aqKOXENVnQS7DtvRoLXMARw1Dzs305iqygcIs1i7rzazrZItl3Dx1?=
 =?us-ascii?Q?wo03uaIYbWqT34Rlx0YhA5bWekkpuk+yshBbr7GEudB82p7ABUwcUkA5zSph?=
 =?us-ascii?Q?wEchpy14eBVR0RQJlx8UgMNWDZGOHdiORA+u81oGp4MMI4yt8G0yxv+g3Iph?=
 =?us-ascii?Q?nZ9lbt7j19P3ZnE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMAbRiT/Mn7/XlnnHVU6pfP6+MUxbBg97vEJGqyzNkayfu6c0hALP7kTDCqI?=
 =?us-ascii?Q?vbJ9WUk/09C1dw5raWBcVJiMnFRl6zpJtsMW7fQOOsq1O1Ti3Bm+KCgwy9T7?=
 =?us-ascii?Q?5X+aoH6cpqSLO/zNwtQL/KCKSre1PjVYN94kC9d25gGsEtL1g7W7qDvjF++i?=
 =?us-ascii?Q?z5IV9hawDpZcYugxXVWXPaQiLcTul+Wse+ppUrOSTp7GEjQaJUFPN8W9waQ8?=
 =?us-ascii?Q?WhN9k3I15uqiB/FJ4WBbhgT+qiava89rZJEhs91IhsMjUKbaAfS4tLxPGxGA?=
 =?us-ascii?Q?dDU8IWg1lXhTdvYZEpQXEmgK48whirG9DzhIiT5llewhbXxmTgpI3MZTzYYC?=
 =?us-ascii?Q?UcoJE89oNOq2P8KIkJSnWUSjKtyOmNyueJtthyNWXR6J0ZpL27q84ELH836S?=
 =?us-ascii?Q?EVNi9a+S614LOBCoz6ih6yQd/IxI/O/gs0TcAPu8V7zZ2iwxIjVQHMV0rahV?=
 =?us-ascii?Q?ESYBgvuWDYX8o1hIBt2K3kIv6UpxvNuTP1GWZkMk77ekfKbGiA57sMQrbJR5?=
 =?us-ascii?Q?B3S4/W+aeg1I41AwTRcYDgAvV42P+QJgUmeMtkDzG+5dcBcN6RAtILPifY1e?=
 =?us-ascii?Q?Zgwc48sLr3ymkFb9FGL4glOjlVIGvwfH2WqAFlv2wE1hRRk49+GTG4qnuedC?=
 =?us-ascii?Q?Vd7J2CJMunkTjZZzwTdMbmLEQQ0z+fzg89FnUSYpIOJ8ibbAeAx3TmoKZkHG?=
 =?us-ascii?Q?Tn+GHMAVm2mBU2PC6eKQ+27RSlG9ACitYtkwZY/Q+i/mZuRJhHuLgnGkPKZB?=
 =?us-ascii?Q?uYzW1KTSh7w97PUtULi7gzOr8au1DEthLtzKG3IySiJ94f5LdrBNQjWC5HEu?=
 =?us-ascii?Q?jLAmMrdcSE11XUrtBCH7ZJ6WBrrr0dA91LAEbXwivnrArRhJSeT+vGkXxkxz?=
 =?us-ascii?Q?er/kiK9CYXf8fsRrpEN4TFP50e6Rg+oFv5IyF3woRmgD7TteqG4ny/ftmnPY?=
 =?us-ascii?Q?ybbo5cTGDnxMR4yEFTxSAC7F1WuxNFixAVJe+lQN0Mrys5YKya/77rhBBd+7?=
 =?us-ascii?Q?ARZG+0pDJvUZd634XpM8E9b3zDy+X10HFAmvTTvzOfjc4HlehgqFGyxG0n4j?=
 =?us-ascii?Q?cre9lAFw6IHeklpIrX/4w9p6XGdXrNKlUvGDb75++lCOuxYbrN5Vj4nF6/Gq?=
 =?us-ascii?Q?ArFjuS1Xc2ZJRMwAnk71xvg5ABEARRD+nfQBMA5GlzZE55rcKEndJCgyM8aY?=
 =?us-ascii?Q?mCmqY8ZeZlrfPQ5RTYRr9QtdObmnZtA2oDIOk2mQm2dRaRm6ZnbOi2gBcqJK?=
 =?us-ascii?Q?TQ2WBmhEoG6+mlu0wYB1AeKohaIWtRofpq2/U7c5uO7oaMj7onIveG3FZDEM?=
 =?us-ascii?Q?M3j7ukeSmO1td5C2a+P//YIEm18AQ5u7BB6i+LqDKGxWWgd+gQ3z+DsFSKUO?=
 =?us-ascii?Q?kClfC11SiRoMtdn+mL4F9mqKXNweoMsC/GpPgxRbqkPXCYptUrOglxetnILg?=
 =?us-ascii?Q?TE0Dyvj1Twnxn/qdBtzx6MkcdEt8oaLEtlg5ESlbEiOV6GQsmTxr4KCIumbB?=
 =?us-ascii?Q?LZ99QStqUlq0jcGkfLRqmuLzHmfVyCAwo0sLvtjAQl7eA2EteaPNe1IM1d02?=
 =?us-ascii?Q?RXikvam9dTt1+097eDAFIeTNd/PS16j3BV1WV6CU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4d93b7-2fed-4180-3a71-08ddb675f10f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 18:59:42.9804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEZuaGcRti8/2sw9JOZpoxilxRu4LkGcdJCSEyvtgSsHvgFbjhNkOHfUrM4lp+B2gecDs+EwnEOxeUrBIG4cTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_115947_408352_C5CD741E 
X-CRM114-Status: GOOD (  13.94  )
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

On Sat, Jun 28, 2025 at 12:12:35PM +0200, Wolfram Sang wrote:
> On Fri, Jun 27, 2025 at 04:46:37PM -0400, Frank Li wrote:
> > On Fri, Jun 27, 2025 at 01:17:56PM +0200, Wolfram Sang wrote:
> > > The checkpatch warning '"ENOTSUPP is not a SUSV4 error code, prefer
> > > EOPNOTSUPP"' is correct. We never want this to slip to userspace.
> >
> > what's means "We never want this to slip to userspace."?
> >
> > especial what's 'this' here?
>
> ENOTSUPP. If we were 100% sure to only use it it kernel space, we could
> keep using it. But since this is fragile because we never know about how
> error propagation will evolve, we chose to not use it.

I understand this. But the sentence "we never want this(ENOTSUPP) to slip to
userspace" literal means (I understand at least).

we don't expect to export it to userspace at all.

Actually your means "we don't know if it will skip to user space in future"

Frank


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
