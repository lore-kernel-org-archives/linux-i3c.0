Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D6F9B5F6
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Apr 2026 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOkFF5EVYO8tIPXl12+3mRuNUCopxuuTBc311YOcbJA=; b=Gsn47comGQQo2C
	luYjpIIeoEzzNV8u1H2EzrmCdDnZEVnRmzRzifq1VeWeRogIOkRmZQbWsYaY4RkkyyoUVbaVw3Fgs
	ghYWzL6QaG+pItTA1snhu1wzh8B4K3GBLhsYLd3lJSPJeMPApjetuYnbwpG6norNc0F+lwQK/1RZs
	5RZxHKIfpuyXdnRSk00MpKqTX09G5BvY8NXZaVkPYdp83KfOWhoSdlKEompgA1VK6kYIq31Y/HyzZ
	a3IR0hzzAfT1AWa3YjGEKJnJinar5tCMyC+UM7WNNDLXlvHr5yLWcfGqtpdx0Bpog5uGDDgUjanyT
	h1ij0ZS6I1ZI3U5gYUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTlC-00000009pvm-1iEQ;
	Wed, 22 Apr 2026 09:20:42 +0000
Received: from mail-northeuropeazon11012040.outbound.protection.outlook.com ([52.101.66.40] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTl8-00000009pu4-19aW
	for linux-i3c@lists.infradead.org;
	Wed, 22 Apr 2026 09:20:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pu4jRsII8P0/+U85MdLG+oSQInZUCGrv3eJ69Yv6UDLCryZRzdRx5wn4WXgxHvbCcOfpAc50Um2GjCG8Uo0cvI3fleK5dpneNNBlMKuP8WHQIaiw8icwZB5+D5j7nrX3tDjbhLSbjM6pqrWp6MhHLiJZak+LB/hb8m7FD/Eev9hCSNIusRNfWl9t1XSxc5qwKNz+xYH9oMHSVv8MwaZ3BCKgh5haA+unPTFL5CypbG+5alVGOmLMxSC7En0000iZ9rHrRyKLl0pQuXKm2vgTCGMCQ1lA5c0UnoMuQGqsxvHgriyf+OdAtcV+XqbrulQ2YY9DiJeIGiQ5glWXPKHuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SoeIXNfDAZVpPNl4+wI5C+WPRfcp9N4WVATpH86wM0=;
 b=sH3jG0zIvIXGvPOqQKUvOEP8xfSjVIPByOWR15Oy6+sEv/0UCG4kXq6Dpd9DSgWAhuAhFBFcmVjZIxrsSQYUQbKOolg6wMSE120Bam73DA70iGxmpVDPx9OJ1aU/2X6kN2noOBEIl4EG/n5mGZvFJDXb9iXAe18+7ovJKmA3x/KYVykDbI1TxzMD1e87Gr2lrxZ0frY5paYnxdr4zhK+K4S4YwCD8SvBu+8dKjO3X2d1MIux63jqDAJttBTbwnjyeCVDX8fjNIr9GcZ7jy5C5MMUqbkD+ZT6IRitDi5sAAUWA9g7ChxOgPTUGzrzOHYw3+ho/nwSAhX3KwOj6ftHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SoeIXNfDAZVpPNl4+wI5C+WPRfcp9N4WVATpH86wM0=;
 b=UxEtVPSYM/Nlt0OJnwy9dW0lF05I0ygeu7gqyL99pZ8KE5hQRDZ91FRWPvJhbz93PLqPq6YtbpJmaju6njShsBK3aK4iRDuquSSz+hrw9m/za4iRr/kz35yXxmwtuUGo5buNuygaH0gfUE1yVlw12WdN4L2TT1nsAbVBCexO0CV622dZnTEhKrW5MX/wh6XH4g9ZpfNsl3Mg9cXWhVpKm006DQvQxXTi6aKyXFkdZQSet/ZBmxpGw/oGm1AP5ojl5VAc+4GdoDPpeBStllP3ncJiQK+oow575fHyiLzisSFU8oVC00O3BnuHsmTQ7zLt9CarFDjCGup1+4rZiYgp+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8612.eurprd04.prod.outlook.com (2603:10a6:20b:427::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Wed, 22 Apr
 2026 09:20:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:20:33 +0000
Date: Wed, 22 Apr 2026 05:20:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 2/2] i3c: master: svc: Prevent IRQ storm from false
 SLVSTART on NPCM845
Message-ID: <aeiS2dvbWw_o-tl5@lizhi-Precision-Tower-5810>
References: <20260413005040.1211107-1-yschu@nuvoton.com>
 <20260413005040.1211107-3-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20260413005040.1211107-3-yschu@nuvoton.com>
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: b62a4435-b81a-4917-30d0-08dea05067e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: J6WdAl7IPNipXok8+zUJH16/W4QFi9hfGvmQSsAH3JEZDtns0Zb6mLHtJvlA8BbtGwF20/FSQrqdc+WMh03MIfsVI1OsVBGs99HTv86Ebr7hJl6vXlxh32goJWapWXYDChfGWUgafv4/ECbVkf0FtnNcSCZ0lrLeSxerRf8s8hOquJmNv2FY9RjD5rbduXNoFKan4yL4FTjl3FmtqX4q5Lfsc1lWM++K+aTLjkUEdYLZKebRR0WM9prRZLLVv+BdpH7R/XE+jo0uKG2xLSjCyFHUnvXGT8fVgDnF1kP90GIAK/BRonxVqqwbesr7C7xuCtrOihKORN0wfNvOgzXdmDec4DIJsK87XEAqu8WQjwqsudtMDEupNp4ELn5SE5q7Wv+v0MCabJhm5rRANq1vcQOwxll1skBok8jnCYG4zSOQWoM4XrzuOIspkCGu4spxXLgr+M4iWX/YhfzIP8im7VwyAhwPyOHaEtwSw2XAm0WV9nuLBTRYqGtFUGmn4J0DkTe1XVfNtG8kGTwSkoBAH8qLWpg9lv0AflHdSIhss7WlOFaI7Yaf1BD9M6d03Fqy9MK2cTSFln+6oltvoqTARgpPeZzCzAu/UzlCAeptxhTiCOHi9U+ADgtd15KGNFSbX840YmFaczZwsf1i9hB+vhur0gouXscZCDbvt4kDMoCRSXBI1QmLXyx+tpJ4fZbCZgWTF+S4/SS1Ln3oGZGVS/PmP2KHlSxMlcBNMb+gZZNd10uYVD9xCQFX7lTfBdKhLFDrESMDG+64YcFOnIrxgDgR+jEqqTcjVpQz5AxN1D4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1qy11dWhkjhL8XfFMZODTvG23860dFnSbir6NM19jZKgwRbdL/gPagVwQCLq?=
 =?us-ascii?Q?A6/801BZzliHIXpuPVPQ8gxUcb8V+VlWJiUdmHHmkNHIaOeFXXMRXy+b3IQz?=
 =?us-ascii?Q?gpSFz6b76xnq7z/sxRc9HUE8nus3x/ieH1876gAIzS05DSnPckc1GUEGSvbn?=
 =?us-ascii?Q?pNghightZZCLykeSMygmXskyAFBbSxyWKIJ3qWj6cFVsZ1sh9UE2q8+eoWa/?=
 =?us-ascii?Q?Blyvav/pe8tJYWYa+qK/GhNYDXnpdM4z7vUXdrAY0+R3b2BGHXK5eS1uRA90?=
 =?us-ascii?Q?/Phh4JQzFwTapcXQrNvUE89ZX7x22Jyj/ostKJmOvjCI2IJEF5x8begpNWi7?=
 =?us-ascii?Q?wrw1Ibng9oPyHH8p5y0a/dXWBh7cZhwVpZMqd+uE4cfMbAduwYBwUMpUGKMs?=
 =?us-ascii?Q?j2Mi//WwAIa/p65v5pIxb4oiWVraWtSop35+Zu+1WPrHOZ7fVr+ym1/hUsQE?=
 =?us-ascii?Q?tWMT/nQdpJNSQZ1Ho/I9+r0pos93JK2E+oZjf64fUR8Z6e2awJUAtyE/7YgV?=
 =?us-ascii?Q?UeOIJX9f1/0cu9zg5XQGw6c2HJsHsMsp+3Pqt6cOgzukJiW9/vdSzPrKiE8Y?=
 =?us-ascii?Q?vHKhHTPw+vevHqjA9y7No+kiAA2apWXmB9s9u8m5kykTFENob7sYBS48gmpw?=
 =?us-ascii?Q?GhFweWQ9lBkS88n9BrYxkTQdB9znxjI9Y5YyuH7DMFJZVIzwZ8fvQoNpPSf9?=
 =?us-ascii?Q?oFquIeQ4fJvCsGa/FvKeu11psWJ3hGz/UWqRNJ/ZfCvj+ptDadBzS7y6jyxc?=
 =?us-ascii?Q?itzhJU1NYgGSweTVhebOq5Zi1xqgcsgwI0vNQIH/spnEBC71ztAbgdd5iL7Z?=
 =?us-ascii?Q?XruMeR9EY5UMOwFGfEIY7avvFR2c5Tu3jsF4Xfjnn0VwagGAYYc8tow8gf4X?=
 =?us-ascii?Q?Xe6bUPMkIFkXoBqUz5uwKC6fvu20/RW5KzbP7lLOVbDsnAPhn1wLn6W4CkBC?=
 =?us-ascii?Q?AHU31/p5czesmS/nYXh1Wtr7M66xigCy3N8LqIOdSMLC9QwmHxVc7LIElS3k?=
 =?us-ascii?Q?9FWGF15M1jTXLGFkwXT6CJZVpYk7QiMZ+gBUmn1dgA0JuJJxk3HusETm4mXK?=
 =?us-ascii?Q?bzr6CyrjfG98MTAFFE+geBt/OYdbexh8+zRIDL84AU7gKXuK/g5scAFGhBff?=
 =?us-ascii?Q?4xkW1p1ilEFOOApycbXj1qy0a8xtEfc+CmMpEdwTq0xjRdXGSm6H/1L5MEUX?=
 =?us-ascii?Q?Y3HGN75geN3lubtNbDA6llBJAb4twD4jb4UmiZhsVqLKd1R2A/bN9nGuhTIz?=
 =?us-ascii?Q?g2Tbp4f4LneEg9p8bNuSiGTtSMWA62rSB9tTGoxl3aSeERNYVh0VOfnnJDM8?=
 =?us-ascii?Q?Xg8o17KBbngu/vfEfPm4yIyKfyT+JLII3ZvIP9Wyqk2eC/lGNgZ+jRm81ml7?=
 =?us-ascii?Q?8JTVnocY/HaiYdelLNc77x5oRhf9JOV7W1AtVDKDzz5+71kTzdZ1hgEW7/rO?=
 =?us-ascii?Q?f1g84EW4r+HfULvlNzIihVMvB8Dwbjy4iPjEUt/0R5abF8WyOP+tXBb1KipV?=
 =?us-ascii?Q?sZnBcaA4aqmtMkAOc4cg9CUiDvMGyDlqKTEBrsR7TklhCQQg3EyqthntOU6G?=
 =?us-ascii?Q?PBTyrGx0erNhAGIpak1NVL6PfZBPVVW6ugqbQeZc+5r+B3UBpTxuqF0No59O?=
 =?us-ascii?Q?3yGXves8CtkAeAqIcdYnrYBpVJfovy3/fiTty89BMlEXUKS0Ngov4AD+W9wb?=
 =?us-ascii?Q?9oeFsjXjBu8AQCWKXexBarPebeE0TbHa5WuWuFALabQKl/0JYTTDAkKgpvDF?=
 =?us-ascii?Q?U1ouxlkzkw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62a4435-b81a-4917-30d0-08dea05067e3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 09:20:33.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TH5t8ZjClexDThMydaEiA+m+baXraB6Rz67BXG11v7vn7p5AgLmuCIj1zJdviYd/r4TWiItpDy3+I7rNbNisw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8612
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_022038_333951_6E1364FE 
X-CRM114-Status: GOOD (  21.00  )
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

On Mon, Apr 13, 2026 at 08:50:40AM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> On NPCM845, when a target on the I3C bus gets stuck holding SDA low,
> the controller reports a false Master Request (MR) in-band interrupt
> event. The driver handles this by emitting a STOP condition to restore
> the bus.
>
> However, the hardware quirk SVC_I3C_QUIRK_FALSE_SLVSTART indicates that
> emitting a STOP condition may spuriously set the SLVSTART interrupt
> status bit. In the Master Request case, this creates a feedback loop:
> the STOP triggers a new SLVSTART event, the IRQ handler fires again,
> the controller still reports an MR type, another STOP is emitted, and
> the cycle repeats indefinitely, resulting in an IRQ storm that can lock
> up the CPU.
>
> Clear the SLVSTART status bit explicitly after emitting the STOP in the
> Master Request IBI handler when the SVC_I3C_QUIRK_FALSE_SLVSTART quirk
> is set. This breaks the feedback loop without affecting normal SLVSTART
> processing, which is already guarded in the top-level IRQ handler by
> checking that MSTATUS is in SLVREQ state.
>
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/svc-i3c-master.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 7d88e8fe3742..c16397013334 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -655,6 +655,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
>  		break;
>  	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
>  		svc_i3c_master_emit_stop(master);
> +
> +		/*
> +		 * If a target gets stuck holding SDA low, the controller reports a MR.
> +		 * On NPCM845, emitting STOP may spuriously set SLVSTART, retriggering
> +		 * the interrupt and re-entering MR handling, leading to an IRQ storm.
> +		 * Clear SLVSTART after STOP to break the loop.
> +		 */
> +		if (svc_has_quirk(master, SVC_I3C_QUIRK_FALSE_SLVSTART))
> +			writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
>  		break;
>  	default:
>  		break;
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
