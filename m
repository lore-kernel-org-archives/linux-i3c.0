Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50A7E9A05F
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Feb 2026 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LdVlfECE3tgpZKGnhs2TQUmr5F849OGwAW81qE3aZU=; b=y/qgHBshhNzX1+
	AtfVDYWVhI20D4a81r5iPaOlb+9WbKbfB8M7rl0wHu/f9PMCYBQIl0qkoc+jFwpDu923edoZIMX8i
	xg2m3XlR5BXnUGhFvR98xoxN2qSUxhjsaVG0pvzHU2W0xMhf/F1VMhxQDXBbh0FpryhZsY9W981yy
	C63DPVO/phUDRzQyUenJLXSx8IMvDH7/60tMkoLlprZzZD2Q3WpBh6fuFVrzUWdNOInQ18U7f0Tlx
	B/ill1/WO3uIddqLnJls0XLKj1GrzmzNcvjApUpQpOULC7WhS+naetDI2SlnGXUXFFGucmjy9s+kT
	oBVxQhfyXq7tURo4e3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAHi-0000000BuvK-2pWU;
	Thu, 19 Feb 2026 20:06:02 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAHf-0000000Buua-1uww
	for linux-i3c@lists.infradead.org;
	Thu, 19 Feb 2026 20:06:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3e6ZNxOjUIa/8GjcPfGP91HgR9kbTC98Cl9U83PfE/czulD+xyrOjxIYBEF6VhDOz+M2iws4AyM1R7gkyDa2zs21lC4DmklgIHQzOvz+LfxD1Eb5ytLwtt57QKrrloAyD2tfa0f+ic2k2HTU+yj1OLgbumZ2fHLqyNmGYGQnbGGAclgGxjRXC4N+26M3gtqY+fr7hH11AS+qYTBjxRdaCSR8gSi0pX+tFAe5EmfnzxnCcOKE07e8OT3WO4/0RiPaHD9EdubjXgbGI2w3g+ySdGSUyFl8ZM7LuifXgRi3c7pvOEOYAHm72l7NSE5wMBMZ68HmxPM2WiLf7cFhziQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdJHvvvwoLYMx+73AqWc4QMGWljGLl8ylJnuYhz2BEU=;
 b=QBnwM+US82s1n3MdtvoZjm4uDPu9VfRpcEveacsiR65x2mynuyR89tnSV3R0OkCbjRs7Hin+Q1NkYL2nWHMtmH8+ltYV3YoSOk9UVkn+dR1HiQUnqbrR+zn5i27kAmawbW+Zwp4odra3ZCMvLdlXtpk5kLu6NdLUWrzVZDZQMUQFmVRPzpvyjRay2Ym6UtcyzVUc8h5/0q0b2ebejrtUXptTyeJyaUbTx4SSEf0ro0C68sjkKbDSk+pO/t8o5ujfkRVuty7tOfMFW3ixWVfqF6X2GW11bNo+wv0UCodZk/4LYLcbTa9D3kCYJZQg/EmDFa+4nzJ2UHKbA+Y2ImIvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdJHvvvwoLYMx+73AqWc4QMGWljGLl8ylJnuYhz2BEU=;
 b=GZ7xDu1ItOsZ5OGMGjhYAvjh55PZ6gBEs6QjVhNuagy2xsRoA0GaX1Q8fm3/GGJDSrCZ8cT0dIeJqgq5v5t1eniQiaLLD6XGuPgcEamLOicHmLOCjMxGUkEax7apbL6WV+aTrDHaoSPHKtLipgxHOSNwHkZNu4BQnFXL/hgJ5qx9a3kyJdzTVcYt6VS7kk2FumTVCngPIXJdqhGtPDiL0WcD67y5/V5DFE9uf7I05fFPiunxSqAOAVDcmXWk5MsRhfCx09yEBnGD7A1yxw+hnw8nQ1T1eS5HMHF0UrXwNP1tvYzRlPnMjNAoNygeWUsx3hx1+Anm9Kt4Yy8vZBmUsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8283.eurprd04.prod.outlook.com (2603:10a6:10:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:05:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 20:05:55 +0000
Date: Thu, 19 Feb 2026 15:05:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joshua Yeong <joshua.yeong@starfivetech.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: Re: [PATCH v5] i3c: master: Add sysfs option to rescan bus via entdaa
Message-ID: <aZdtHMGNufA7jcZx@lizhi-Precision-Tower-5810>
References: <20260219-i3c_rescan-v5-1-42404db20d18@est.tech>
Content-Disposition: inline
In-Reply-To: <20260219-i3c_rescan-v5-1-42404db20d18@est.tech>
X-ClientProxiedBy: PH8P221CA0062.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 312c747b-ea18-489f-06c8-08de6ff24a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?53bVUW/ye8Nl09GZ7awBmqlI9EfoyuhMWmbg/sgbABfSukCSupyWCLgbcD?=
 =?iso-8859-1?Q?hZ2zEB9oVURr4ZJC2YD1pD0mW+8++6FTOICFzGHHV+6Ndt2SBod9HY+IeZ?=
 =?iso-8859-1?Q?vfjncM7R0VlRTOSrR3eO4okv8XRH/setVikcZnMJyww/WGPh7CSu2sjQyr?=
 =?iso-8859-1?Q?LCX1KmtfwA5uIBtU+B8AtefXyq6tPv+ZPaUMnqiicoMiI5/64W0vQShl/R?=
 =?iso-8859-1?Q?0ss7Uvif3t5mFQ0fFtJDEwMOcj12ptLuCvzKptmsuB5J7hYo7tfWlcz6B0?=
 =?iso-8859-1?Q?JJrvDGErd2jKjGQ8UAIc/dFKZk//DzLUB/t3GsEiKAkJvF1SIk1b6ZiyFd?=
 =?iso-8859-1?Q?tNVVLZbtXkG0+o0rXqp1uSJ7lvzFaDKQgy91ADzoLP2o6CSJHga/XaENle?=
 =?iso-8859-1?Q?x5xuxgx9xj6YoloMifXMlf/whV3jLsjAX1gy2b39o3ANsM/oydDW4hrGbG?=
 =?iso-8859-1?Q?ytWRc7JJKy+F7EVhLLcDU7JY8aLQ1H+Mg0eswoPsQfClLVUFjqs4hW0T3y?=
 =?iso-8859-1?Q?aET0sOttAIMpDPy3ou25c7p9C7O9HMIcYHcrUJdknTAhxRzZgMuLrVicur?=
 =?iso-8859-1?Q?P9d7lt69feUO1EItPzUf432KYYM+Pts87vn7T/83ZApgTU5fFvQsAHflP8?=
 =?iso-8859-1?Q?W+O7jwrFEdcIh3rxoT7mS44xa0ZbUndr39Udh/5xqEjQg7XPUUxYqMRTQC?=
 =?iso-8859-1?Q?0el3tERuZsPSseM5fkr2DoKlXnZO8tSns3lUJ6s58nN8op+Rd+HiJXF9hK?=
 =?iso-8859-1?Q?gM5wx5KzZ7Y91qpPeokQ8lvBcg03bviV0xxGb+yofU0/mRUYf1LYNo8dc2?=
 =?iso-8859-1?Q?CIMUSjR02Z5phHVpsolvqWK4rmDK+mUGixC7rzu/YkyWBFod+v7SdxKALt?=
 =?iso-8859-1?Q?rJDVvjEhV7uecG1goU8U4RFuYa4E+umHvHUWHo9uskdHtRlfBt91fyPSlX?=
 =?iso-8859-1?Q?QpUhip+UUlKiOUzroelz1hEqRYd5q/4Nd1FWCSXOIZpUHZH8ek+Tnwbmts?=
 =?iso-8859-1?Q?9LjNZqX2gLuGXK98bh4a5grbEzQ+RgnBOK6g32uDqvDRWJoZGX14WHjb6G?=
 =?iso-8859-1?Q?uD6uTwL9gpel1BX/awL6bO78AkVInnExmceWnXGpYjWPukFra+R/7gC0bK?=
 =?iso-8859-1?Q?cIYwpQIq8nn1j6Ce1kCezMUgVKe7R7dffYmdNuhl0kD1O7vKY9cjQIyzgm?=
 =?iso-8859-1?Q?EOcWP/LQrS2PiQdcGOei3r8lM2JSgkorj+JV9LuVWWmftam0V0ZpWCkrGB?=
 =?iso-8859-1?Q?DvB4pEkvU57Y6iyZkQFc54UBSE0ltMnLKOcRoZrjmi4iMvoGnivAKaqDva?=
 =?iso-8859-1?Q?1UmH+D+tPmpT7gHacAzi02SSoRa3UK0p6n6voBC504+x+5W7HP3WnqdjLJ?=
 =?iso-8859-1?Q?wmhMj7HXOP5S0XgFCWklj3YrE29mlYr6uX1Mno4A7xa6c160be9SFWe0f3?=
 =?iso-8859-1?Q?3OFkL2YvC/FxsuhxKxoEr5d8iQ200IxtK1o/jvZK5NQT1AwZeDFrRx3c4v?=
 =?iso-8859-1?Q?mFuu8yQyARC2YIRWVjUWYS47JszQ37voww3U30AbumLt4l9koIED/Z5Sxa?=
 =?iso-8859-1?Q?sEnB22xrZ6dQ7xSGxgWMn83e0sMc4wjJQxRx5y3uOAFuaWLAbze1AR1VKq?=
 =?iso-8859-1?Q?SdN9x/7Dilz7ZP4faK4IfH8rusvahdyzSI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?H1WING05PZMRWLNjUwXnG3/OFiBWnyCuePh5DxpqqfT4rV4b4URU+NtPjl?=
 =?iso-8859-1?Q?k4g0gPM9EVnLaQb8GOatKinXrir6PXMDJtNwQJvAYfJ/0AAvgoh7dadnej?=
 =?iso-8859-1?Q?0LCcQrudF6m3qzf0NGA4PruH/1KIeY40S1c+ytqSpz8eHlH5ZrQi9bfpoK?=
 =?iso-8859-1?Q?hIn1o93fuM3TKwQzwjUXOKENEMTIaxAMEFqB1z4QkT8zC8RtrQ+Mw2GQ2f?=
 =?iso-8859-1?Q?QQ3E6/vc+AQDpRhbOgqZcyeTDfxXVZoZfMbvgkaqfwM5Bq774yvfmZAmG9?=
 =?iso-8859-1?Q?b2ivuXzw9uj7u1Zwkw14Rp2k2Y3vW0+r+CuoWEg8AAxyy6x2Ybr2ySWrnc?=
 =?iso-8859-1?Q?BOgxL+HclPMd3xoEpLohFiSqpUqnA8YstmdkXn96OJZCSdUAKFei1Ygdvc?=
 =?iso-8859-1?Q?lXtjX3AEZRsqnHsETDdkdopWuiHhGIsDZuQnUPUEIIhAnaR95wJ7Lon1Qk?=
 =?iso-8859-1?Q?J/oygTegcUAr8QKUVpoBksSkStiXB3AN4E0+IHLLc1zs7PS4UpDMAkt0wn?=
 =?iso-8859-1?Q?kpZcTtMcVd3wQDx9Evmeqo3MUHSbf56UkFPCXTeMiMkhQPMfkqdjxWvciu?=
 =?iso-8859-1?Q?uW8IT6y8YFyrSJDKzllSBI+I+1/xc9zor1+Lg1K0ZoOJvas0hakxqOH9od?=
 =?iso-8859-1?Q?r+LySN1bxyKXrG2PxglvGVnAWcqo/IoRpK3YEr2nlKgf3T6IHEg56V4fmG?=
 =?iso-8859-1?Q?tb5khhkB72VdeSlv9gyJv9knrj5BcOSXwdLvc2mspPlhY+9kJNYvbRraHH?=
 =?iso-8859-1?Q?HBVsFE8S8QysWl45dLKkFZcCsCDrtsAzK3RuNS7epWL+FLsAi7DldF0Pqp?=
 =?iso-8859-1?Q?www2tMkl/TSmkquiz8kOlp7cWi8rIgSeWhZG3rEe5+IDiMuXDnw9D8lhlj?=
 =?iso-8859-1?Q?PPyGmn33O6ORXbsXjKayfXGpHdTNtCh4bguTQahB3NINtCpiPBXjwEHBkX?=
 =?iso-8859-1?Q?fFVoB7nyE+ulN3naSxv7m6VpY2pTT3eHKSdlRgQskN77VXjxXDK+rWXhtY?=
 =?iso-8859-1?Q?ZV66ibBxv8uTljKyA1r24urFGUQWFci4C9OOwDTagTsO5aCXzKsZCMZmW5?=
 =?iso-8859-1?Q?gOHBiDfZqh/qcQROrcq16/5c7dA7uA0mY58A6mfdVtibRp9xdUqG66QJuK?=
 =?iso-8859-1?Q?xvGOZYPCTJJtEfUo5U9BaCGUsk4JxrI2NV0GG8IMe9qtxECiblfat33HDR?=
 =?iso-8859-1?Q?GEG1selhW43APTVRZwwTOE5w3OolxaxD+XZxKksMRB5BG7I/PMKhMD0q6C?=
 =?iso-8859-1?Q?lbcDwMG42VUbBZwqBRCZmJUUlucz23mibBtKR+F40zxVrU/rUYJQgZqgNt?=
 =?iso-8859-1?Q?v+LELZuJ8mqL1ywAvVzwX0Jcktd9syzqjH+wscQpndAccT+TJ1YKeJahHA?=
 =?iso-8859-1?Q?wYHtva7yBDDPcBQI1edyP5AdeDR9M6llLw/JVZHm8Ufrz0hxxML24DFtjV?=
 =?iso-8859-1?Q?jcbgF+AiaFTjZUpskqCcHurX1PMoleT/U84M7t/moGYbJu5L36wCa3y+1L?=
 =?iso-8859-1?Q?VEMKlxB4WHIdCen7QNzz261py7wqAfcteY5vi4qvTFTAZ9Q8sTm6dw/sa6?=
 =?iso-8859-1?Q?WTL5FLv02uxUF3KU8xMfcSRovsTwOtUAmwLzAJzdpcPSHryFegwZdw6rPq?=
 =?iso-8859-1?Q?3mMAKsYcV5/oLQ3DrgsJF7qu7PHOSU28eOe4ZcntZZBUF4mujhQP8cfloF?=
 =?iso-8859-1?Q?5HfDhXfKorNobr3i1PbQOh6CHfT91DjvmWtfEC1QJ47BvqmP7SeGL8YLR8?=
 =?iso-8859-1?Q?WYb1iMKiB71I3NUCADGvFu5OkhnOzPkKiRc0f2j7APDGvTHGIXn06qwoJI?=
 =?iso-8859-1?Q?xN/sRKj+LQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312c747b-ea18-489f-06c8-08de6ff24a0c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:05:55.0427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKjbGtr9dj/2IUtW1yM0+HnHFIE3HWTpq33/8zbErpRtZ5gympiuqE2ciPy6qsINUtUiMEFtlZB9wZ5inWtDqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_120559_501496_8A41AD82 
X-CRM114-Status: GOOD (  27.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Feb 19, 2026 at 07:11:40PM +0100, David Nystr=F6m wrote:
> Allow userspace to request dynamic address assignment, which is
> useful for i3cdev devices with broken hot-join support.
> This will assign dynamic addresses to all devices on the I3C bus
> which are currently unassigned.
>
> Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v5:
> - Change sysfs interface to boolean. Comment: Meagan Lloyd
> - Change sysfs entry name to do_daa: Comment Megan Lloyd, Frank Li
> - Link to v4: https://patch.msgid.link/20260126-i3c_rescan-v4-1-6b3559d82=
abc@est.tech
>
> Changes in v4:
> - Improved commit message, once more. Comment: Frank Li
> - Added required documentation for sysfs addition. Comment: Frank Li
> - Link to v3: https://patch.msgid.link/20260123-i3c_rescan-v3-1-026429fa0=
c65@est.tech
>
> Changes in v3:
> - Rename sysfs entry from rescan to entdda, Comment: Joshua Yeong
> - Link to v2: https://patch.msgid.link/20260122-i3c_rescan-v2-1-84c74a483=
f03@est.tech
>
> Changes in v2:
> - Improved the commit message with why.
> - Link to v1: https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c17071e2=
32b@est.tech
> ---
>  Documentation/ABI/testing/sysfs-bus-i3c | 20 ++++++++++++++++++++
>  drivers/i3c/master.c                    | 24 ++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/=
testing/sysfs-bus-i3c
> index c1e048957a01..19f5cf8b1b11 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> @@ -172,3 +172,23 @@ Description:
>  		the automatic retries. Exist only when I3C constroller supports
>  		this retry on nack feature.
>
> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/do_daa
> +KernelVersion:  7.0
> +Contact:	linux-i3c@vger.kernel.org
> +Description:
> +		Write-only attribute that triggers a Dynamic Address Assignment
> +		(DAA) procedure which discovers new I3C devices on the bus.
> +		Writing a boolean true value (1, y, yes, true, on) to this
> +		attribute causes the master controller to perform DAA, which
> +		includes broadcasting an ENTDAA (Enter Dynamic Address Assignment)
> +		Common Command Code (CCC) on the bus. Writing a false value
> +		returns -EINVAL.
> +
> +		This is useful for discovering I3C devices that were not present
> +		during initial bus initialization and are unable to issue
> +		Hot-Join. Only devices without a currently assigned dynamic address
> +		will respond to the ENTDAA broadcast and be assigned addresses.
> +
> +		Note that this mechanism is distinct from Hot-Join, since this is
> +		controller-initiated discovery, while Hot-Join is device-initiated
> +		method to provoke controller discovery procedure.
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 0eae19b3823d..60020d56a580 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -758,6 +758,29 @@ static ssize_t dev_nack_retry_count_store(struct dev=
ice *dev,
>
>  static DEVICE_ATTR_RW(dev_nack_retry_count);
>
> +static ssize_t do_daa_store(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
> +	bool val;
> +	int ret;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +
> +	if (!val)
> +		return -EINVAL;
> +
> +	ret =3D i3c_master_do_daa(master);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_WO(do_daa);
> +
>  static struct attribute *i3c_masterdev_attrs[] =3D {
>  	&dev_attr_mode.attr,
>  	&dev_attr_current_master.attr,
> @@ -769,6 +792,7 @@ static struct attribute *i3c_masterdev_attrs[] =3D {
>  	&dev_attr_dynamic_address.attr,
>  	&dev_attr_hdrcap.attr,
>  	&dev_attr_hotjoin.attr,
> +	&dev_attr_do_daa.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(i3c_masterdev);
>
> ---
> base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
> change-id: 20260116-i3c_rescan-4921d0b41a00
>
> Best regards,
> --
> David Nystr=F6m <david.nystrom@est.tech>
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
