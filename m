Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20388C4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DezPxq1VPXdcA5uyNbgsQS0tusASbLMZpIZx5Df1oxA=; b=scIPusStau2FQp
	XlEwm1Hhka42RRPzDzZZ+/tB6Aye5anDBA7p+OH+vDfI/Ao4MFIjA8cwBqEGo4TJPadMsI/gcQTB5
	u7uLFPrq+zNm93i9vg39zZv1PmZL13PSSGaRzQEoE/9BEgYRV5eszj/jQKvkk4UqQNGGznFgG1JkJ
	9lz+i1Mj18kdF+BOe43TeV/eppVNIRhPiXy8uP6ZzpT+xlj6ZU2GtKIqkU6im4xWZ/ls1OHIKiHJF
	+Pu+NJiGea72FOkg/XSQxh55tm+Q6TZT2d+cqNAT/lQOF8THjHw3N+SgvVB3dnSnBz4h7OHi68qNW
	DYxe88JPzJ1kefUFkQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDZ9-00000009yEP-3NLF;
	Tue, 21 Jul 2026 16:43:35 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDZ7-00000009yD5-17bK
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 16:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFS9Wgxvp1w+S9uel7a1hsmK3zMCBLRmZY4Ndh7JKWi7sTzPXfX+Pn5kUFn9JK1h9W3Oi0c7R9GQHALljLmekKKj27x7VGaD2dHdqFPqOE38XqDzF7T9CwaLUeSEejZQinhZQ27u9yW+PxIF6lM9kvENhBYQ02tVO3Au6KH7nlqgVDEzSI0wKPM4VojWq6/IwuNORSVJVdFKFXD3Yvq36Yu4sYtbeneDRK8N1T++OPF0+9jGWyk5O2lExWifsS1VU2gc1vK8p3KDPFka0vieQih+wr8jVQZXeiHVa5biO8BL4Ima8tZbDzyrWTxEN1Ip8Q8kAe9Bl+Bg8xVUt1sH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ihovp+XEVAuuJ8vtOtz/YWlDZlMfaCJRo1ny2W7J04=;
 b=wrd+X+d7SER5LAsLHwt7v1b2Ge/WaqPDrjoJ1g7SUv+l9cutJc3sIhCNbD/aKupB4zlBy05d28ZATOgUHC4+hGqBRm3WtZVl+1AN+fY72ja2QIKTzmcwLbXoPG4Nwd6AtsbYeN8Y4qvs44b/Do4AqUxl9V4/JiT/vpBMJfczsCEMDW2LZjF3jabEfx/fpnpY1xeLV3lwvoKApCa+Tna5oBA3VWGXNoydpNLQSDCGxkXcIsyvCzsLlDvgpoxDqqKTGIiWF7sJ1comnS9YCRpCJBMPjVKlc2C3MmV33ymgUhIbdzc1DJiEa+cDYIpDH7AKX/Du9yUQtYP01nEzyLzImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ihovp+XEVAuuJ8vtOtz/YWlDZlMfaCJRo1ny2W7J04=;
 b=ca8MX1QvikNA3SBYMxlXa1m01BLfBi2z6D0XfTtznWyrg1UbkY2YKjFWrSH8+z2aAeNoEL0W8tBvPok3S9y3/yme61UBaRjWeX1Pdvy7d4KiPxFNt/qYsuNY7pIOQXMvQFvVOPqW68kC6YOq/yTTR5xI7Pnmgch1o/ri7V7gBVtYE7xTSnOrNTubuh5UPanrN2489Z1jfPWQWX6WVeKzcLbncFGKG137ou6Npixi7wVnyHPXWEdRRd1KGlRp4oIGad7ubOYIYWvAjctfQCTR84SJws5D2Ybhd9qdayjpMN/ZpV0kI0nQAFwdwZF4lFKYrEZrLreZJgUEjyqXBXJZNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11852.eurprd04.prod.outlook.com (2603:10a6:150:2dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 16:43:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:43:27 +0000
Date: Tue, 21 Jul 2026 12:43:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH] i3c: renesas: Drop unused structure member
Message-ID: <al-hpyAf7x2pI2hz@lizhi-Precision-Tower-5810>
References: <20260721140928.1618736-1-claudiu.beznea+renesas@tuxon.dev>
Content-Disposition: inline
In-Reply-To: <20260721140928.1618736-1-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: SA0PR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:806:d0::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11852:EE_
X-MS-Office365-Filtering-Correlation-Id: ed87459f-7e92-4c2f-3e27-08dee7473011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DTIysr7WzQJhrfFYm/mmUsQ+ts0Su3CDZq1gJMt71Hs5gyhKBvtCOjKITxcGWpYpSYpZ/2gnxV6guCJnFF72dd+WeZWQq0KHUmkyCAe6fTG7ZjFCFMWt/HPTzY8jSSGz8hu2qmfg5TyHMaC1BN49HT7/jYfxQ8/1OMv2orAzzFHD+lX4sEaCl2i6j9oYLXYBUC+B/T9FpvLyG0p9XjBZXLtZ72U+THNwAGbOYH+fvxS1OvjuJNCLIZIVRxlAtJ7YHbfyFTtuIysZgOsS+Z9/zCnnW3PVNgWK8gySQwCDfVqzAzM3vjx9IEtpu8ImmEHru5zbt0gZ2JwlCA6UGU1yWddZ12L8DlyNilVcOwNVrMRoeLfTtVEz2ZaHpXfcY0lOPsNlRfHHJXpIweyeBYdhecBDB9qUUqLJBt3LXxSoNHQApotAnTm9+32jXBCzBUns8P2oH4dwHXz+4EkCWdLKrDvgOTq7CCAwRnEhD5BfBgu+OOMF0vD7oN9Nq2ahHiD3X4MORo5DY0duk90qVSzxRXPL0gemz92NRqRqrrBaWv3bi21ZFMBsZ+rj5NTLgT6iKDEruwQQdBY/vtTBUFgcL/y9mp6l5cc6fl1RAKGWWddUSItXvTIpbAiCMj1oNOG0As6PvSzh3Q9VRr5n528nbAKLoRUC/KQEXRiHmUIbnZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qiDUyGHGJ8jSVNwAHLA6R3wpHOlPdPtCwV5Po280hunllUkPypSQGQn0x0Z?=
 =?us-ascii?Q?ot8cNziM/cNfL55VTuqTTDOv2GJtE0jWKm29fLcoRbqet43wGTVLG4I2nmfH?=
 =?us-ascii?Q?RMePtvebQI9KiO8jfo9puQuJW7LaG8rUDTSOwbAnxFrcditRntmMn6sN9ghp?=
 =?us-ascii?Q?KAtaDrWMKd+z/Q2zwok8T+4vUIp1kXBbZ01UTpbQeWZfya0Ein2iTy1jP8mA?=
 =?us-ascii?Q?rxrtzenK/JDWyecqBLrYKCPpUjI6ChAVOZn2hcdK12gm/1uNX89VyAEys6uv?=
 =?us-ascii?Q?FMV4OVJFVAfiAhPmYoVzDprbiNOUjhGrXqLddZu/OWp0wspVjj4ufCR35ztt?=
 =?us-ascii?Q?xsB7nevhlOwO9BeXPfRPxO3vAewQ3B/dQTuVtLGfHssDurklGWTRwv12pvAi?=
 =?us-ascii?Q?Xrbjy9oxH6cEGVznVpTsHoFPlYaJffulS4YRd3RxGBhGaBKQ5HZPJXsPlOBw?=
 =?us-ascii?Q?tadwcWELtTP+i8y+I9dnguAbugGH/DPZLis/B3QnGOC8Oe99cDOjUi/WMCaP?=
 =?us-ascii?Q?QOsrdsrIoz7VjKi98NmxaGbQpSf3B68vYioP5j5ieCydA8BSslt+DXccJCTR?=
 =?us-ascii?Q?vwNWwjOKUNGI4Tdr5V/PN/NgRJHkwKKcLtYkdfYd8bJYTz5GOuPTSVxmua3o?=
 =?us-ascii?Q?KmMLBRQIhE50kcW3o3Sm1eHR5Z1lCuh5Ut/YrcZuIb3U5ngHqEg9Szx1bEMu?=
 =?us-ascii?Q?a03u5v0KbeaOuCh3HTQXllS94r0dW2E//0AFtzFd6ON8Rw307FZaG/qbT/yj?=
 =?us-ascii?Q?W4o0KOPgt4rNc8ESI57sEwMLT/Gb19HIhatW67IxWfc6ClE4KlgtO7DB34zc?=
 =?us-ascii?Q?kYitBny/Pp6kpqqoj2NGdK9ICboqPrHsmZtI4SuJS627QN18qRfTwl9uh3J/?=
 =?us-ascii?Q?q5LPI/dW4qxHagomVylQNCZWaUbxNvGW1BMOk6Vs5lKECJmsuCPAckVrSk36?=
 =?us-ascii?Q?NAki2VA/QvO/7tkmDQq3m+tDtcjyrrUurDRcGV5Q5keZVyTkKR330nqScgrH?=
 =?us-ascii?Q?U+PTJQwnEp3wppVFGIkWKwdQ/PHYZcSK4zUuulqB4SJv2NoZiImesFAh9T47?=
 =?us-ascii?Q?pI3CRVjWwifF5i/KtjbLZ5WsxXsM6R8TR+wgAbkiCooF+KyZrnChvJlzlSoV?=
 =?us-ascii?Q?jbsayVkWoT3awCvzlbjUQUbtdPuFvmUh53alnokz/qYbywRRGKhckV1rDmJQ?=
 =?us-ascii?Q?0Kv8VENEwdRr9kW3uwyGqv05bWmcGLySIa/Asyu4lIYoaYumWOGaig7XfeY7?=
 =?us-ascii?Q?pyGawiWp/E0rHjayuru+zFdhBlMGd6UtOkGVErca74WEWdzT6tJ5AifFmFeF?=
 =?us-ascii?Q?waQppNrHq3wQLIHskfjEUfqmZMUzzDCTDWxrFsXQwHGSlgpAddkkPoz5gVyL?=
 =?us-ascii?Q?DlG1PgiCbSPbXYG3A8yKB6AhYlzPiaRXyM0ijLsLVPV+G59QmuiYHOFEmjw0?=
 =?us-ascii?Q?ROBe/1OyP5H+cyKHVP4Vo2dj0pxK+RgZg/esFQj//r8LQ4FBNEazs37/Cc0H?=
 =?us-ascii?Q?SAevWsiISqsGaLmMwyoy8eBIxAutIWbLfmSYWA2xc78uCMSgUPpkpXqKuqD/?=
 =?us-ascii?Q?BsFnCPC8tksEky/i8dz0mN+utqEn/ZdaDv5NT98nEBYlJgluBg+K8h1Onisf?=
 =?us-ascii?Q?Or6En95ArSF+yVxACX0LyobxtqV+Fi1BR9eYvX11dYt2IeHUt92EPPtV4ZBq?=
 =?us-ascii?Q?hYePBNgVrcwU0kKgY9/MArz9AC80a9TPhDiAb4Z8uyAxi43zCXCaEmspJot7?=
 =?us-ascii?Q?/Cft+35wn2rzCwa23J/KJntVDv4aSCVS49nTseovILa9zFIYrDEd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed87459f-7e92-4c2f-3e27-08dee7473011
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:43:27.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/4b8WHGh16CgQNBix638TqqVzTKI9j/QAZHoubsXSkC8YOWuaOCfkhayGaW1XFd1L7t56/nrkPLOoGWy4Ip7MSTcOZRVDqJ8moLUbjypAtLxz18Rvsz5R9XdTDo7SaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_094333_317970_587B6BA7 
X-CRM114-Status: GOOD (  14.18  )
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

On Tue, Jul 21, 2026 at 05:09:28PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

subject:

i3c: renesas: Drop unused structure member 'resuming'

Frank
>
> The struct renesas_i3c::resuming is a leftover from a rebase. It is not
> used anywhere within the driver. Drop it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
>  drivers/i3c/master/renesas-i3c.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 2b501f31e874..ff1a243a802e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -262,7 +262,6 @@ struct renesas_i3c {
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	unsigned long rate;
>  	enum i3c_internal_state internal_state;
> -	bool resuming;
>  	u32 free_pos;
>  	u32 dyn_addr;
>  	u32 i2c_STDBR;
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
