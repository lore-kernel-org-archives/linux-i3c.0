Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D629CD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 20:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4plCOiGACkcDuF5hr3xX5prH9mzLt+aSX7AIaohIkc=; b=FALPoGHVXSVfOG
	fZJIccOT+wsrTkHPOXTg1RsGnY/xGVv8ZgMyPQ6fQhFnMpMKew8N5+J9TOcSPWiduCu8IXz7R0adu
	twy20O9ozxBcVZHz+NAhmfjnM6UXSJWhmdR2iV3B3MxLJ400GTSC1FD7Hk7Z2orDCi9Dr3wDzlqXQ
	UC4xYT744i2QtC7YklTZAySG3C53/PCeSp/2kNqDK95Fto3g6W1njsmD9UuW2eBfm/NgP77Lkjf4v
	ObwzW5hwnXYL/spcV7hEcjqWugKjUYv02IWPUoRYhipRD3xLEYOa89oUyeQ2xv8sRK9od55kp318P
	4A6JwkfpeM/TgHR6kTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8KQ-0000000BXHL-0LKK;
	Fri, 12 Jun 2026 20:18:10 +0000
Received: from mail-westeuropeazon11013058.outbound.protection.outlook.com ([52.101.72.58] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8KM-0000000BXGc-3THz
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 20:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvOwWw7OD9aWdwv3ZfzGOCByXb18T7EOgcj8aDetBmwtdVVm7ISzxxWA4prCF8roJCURu1UmBWHZTH0w/80CSMos5de2UHyAxNHotBJhI6xKKiGpPd7+oDfpjhv0n8ME0bWrOjnTZVk5tPb4crJJnrK/XjaIl+QZKRNX7XUwDOXuaFaAwA5XYVnbwSGjr7Xes8+c6GtuzRMA2JyLWkGNAazWEVJ6d+sUSeYUJzvlTo/6ayyIq8qFUQdxUctHfOymx+zzd4g2SuiVtf2/RkCBSvh7sVemIJk8yVI6Y5TEnOFsXvz62r6//8dMHrIyfBoZeIetaAjXq0GETZItwspOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm718gmRsIVIiZqAAieIO5qn1MvMoxihUVgAQD6MYSg=;
 b=GZLozO9J1k6WIa5YsrIeItNxUt53/gBIIuAPEmZAIHCrM5itY77VG4aa5CrG9VLo9AsUVJn6yekxM8020yCK8O1CEpLqm3u/NQFpbRNI3MiOVxdx90rp9sdwyU7AcM//nMEZq9vk1KvHDoIR8q1PLSa83LtmBlMzH9EAJfHp5VifRtwU5/vtas1dnsbxSvGVVcn46BmQLSC9Cd8SNTscV+V0Ty3/KSBUuabS9/mXoo0kujAfIwNTu+QY/1iFM640X8H+n5IhQWigsgSi2woy+PJKZV9xygxgUaAS74Yy/cLMGgffWR4oV4DZXDfypv0Q4QaIEni+YAU817lsO/J8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm718gmRsIVIiZqAAieIO5qn1MvMoxihUVgAQD6MYSg=;
 b=fz44tu89HX2FFjhw2vbhKHWkpEYDEZlWB/alDVqklKe3LVXY3z8IRjQO1j4s3Ehc7U8nV3CncFmC2IQIqV8eS/Ggsdl5OfOwu+YNbn/0ZiZ0TT/QWrK64wqcbt8nEXAy1MQ6PfcLEnJSmw8AtjrLxbVjoMvhqvq9TMfbbvWdmIsJuHxuJXuK/xdKneMSYYRK7oRtWbxpsgSSVZHQE+kwP03+PcfV4v3CQW1b/6zM1GnH9aZbYXWF+UE29Je/+yv1N2mK1LPGKy1XxcdOlpC81Ib1JlrVuRyn2TOTYlGpvJI6jjDA1suQDObVGpDr/pbjajrd/d6cN8ZTiEHJxBYGYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV1PR04MB10200.eurprd04.prod.outlook.com (2603:10a6:150:1ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 20:17:59 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 20:17:59 +0000
Date: Fri, 12 Jun 2026 16:17:50 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 00/16] i3c: renesas: Suspend to RAM with power loss
 and runtime PM
Message-ID: <aixpbs-V1ErRdbOc@lizhi-Precision-Tower-5810>
References: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260612160458.3102106-1-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV1PR04MB10200:EE_
X-MS-Office365-Filtering-Correlation-Id: b85fa2d9-b820-4f1b-5a83-08dec8bfb1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|11063799006|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: B4i/rXCirm7+OHrULf/Kk8umSo0BRfk9LXC/nx+CfkDkrxT5oQ7L70TzwmRWdBlbE3yXPRl+ieNV33NQbWnasij2xfbH8xE5LTtTD2e0x/YUNu6n5P/8c9faIoq5xP6VwUqCaoMhsFFICXU6edQ7JigyQseSMFG2/w7CsPNgqTfwZNAwkmp8J+MrToQKjGkmroVJpR/eWCK8y008Mq5mZReWXkkMyHC81pJ8F0/hPbTwxX1+CqMOoGTfg6lK94tzWXdN8ruuTuLuCfFAi+FKYnGHRoeKhDfnDTNlguVv6R+9FgRPEn3IB0UIiAtnE1erXCQF7zTTS2zXV1XhZaISpUJbaMvx4hSDOi/4NcXt2sezTAaw/GeYvMh4cfHFacf+WuqJHYhQRNDmIWWTt4WPER2RQW6WYNsscPsg1V82u9xenWHcPesn8UQG5hVo2PfR1SO0UtwVIwHMb7NhXFUKmNGN90O3jLj4Om9joopJQxFaig7aGjo9Zkceei36lwwEe8OtQ4DA22DnEyAcn/fo+M6aoB6N2O18caVCTUP2DUfl59NGbEiJHP7sC+Ra3zQ9aXNg/3vkoo3KMBSwh6TtnEpT4Ly7K4NPuoUUFuqh2a8MxiiblC9/hY1aY6oDmRl326JQUHdURS90+AkPsqpjpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4JGde3JxH9vNUX5ihEqzcWgCgfZMOa+/OfG8uS7hVvppHP9bLl+pP2DVnSgF?=
 =?us-ascii?Q?fwu7qqrh+XfHp+x3v/0b1WF3m3P5kUx4J3unoYywlayqU7QuSfhHaaY61lDr?=
 =?us-ascii?Q?6H6LF7D60svSdI8qnSxSlMHUINsuyJr8216+G8TlbcQpI/nM5BOC74OcRVEK?=
 =?us-ascii?Q?P0IeTwwbjHuWdfsfqzK0TOk8MyL3vjT6FYGnVss3oHSSReQVsT2cg4WEARFu?=
 =?us-ascii?Q?H31U8XoGPRtVerr0HcFiwAV6Foym7xI3vG5DwNsckcPJ3KyD8F8lj7xqnnyD?=
 =?us-ascii?Q?TGlOhe7HOoeukkeqJIb3rDMTtdAk9oO48iqCw2GeIhgiSJ8KmMfNZ4xUbmXx?=
 =?us-ascii?Q?nP+A8nVMe4YWb/gMImkyZoe8960TK2AcBpnL87sWxOFW3o0mf5ekzSv7+4ra?=
 =?us-ascii?Q?c5LiDyd3FZXsIB4Iaj95yEtbA5Op1SMnmZiRYTtgaBNV0IewRyotCmrD3Lj9?=
 =?us-ascii?Q?xei/tLjuLqK/PC58kl0A6HBLNhWdLoYWJVsyXOE/fnGMFnQTAKy8EE1uUVZm?=
 =?us-ascii?Q?1KwlcPdbTmCSTY9WLektvL4KtinWc+vnF18JPXyrAr6lKS2uy6+EPOCfBtXu?=
 =?us-ascii?Q?hwgWwePjgwp4lTBfVtVsdxUqZYLBbuXKwK95zQoBpMVMP9eFyjcayuBB7cgK?=
 =?us-ascii?Q?1PVp3M/JN6z0lBuA7jLsCGIFSQViMP6rValcooZwIKW//hFIvOY+EpxnQTz/?=
 =?us-ascii?Q?z4yYA+ounS8tvV71OsBbTRagjrsLu1/Xeenyd4dBN3+3TbxXOno9jlagpwq4?=
 =?us-ascii?Q?4S4AuS9yiBLHrsfMb2V12D0YIMW0NKcqjWxBO6WUQBpq+ffM5HTJ4rjD8A++?=
 =?us-ascii?Q?J1XOGLgeYKmMVpjCDIlhRx0bITDiFssJeFk0Otv0vEM6voCefqp3GcjCwWOz?=
 =?us-ascii?Q?BfW5JD2XvZ9mN6ApJ+Ej7Aylkw4kSHym49ktTRDMfZr3jGrLMCmNWHIViTMw?=
 =?us-ascii?Q?94ecNn70zMFaoTj+EL4h0DJi7LPiJPmlyXd0hUN7zCex8Po1t8A3VfrYc39y?=
 =?us-ascii?Q?jZJ2ba3JQhu+YjP59QNFh/UGYVsemsPFyVsomkgPsoxiwu1NwbKSdnKBIqcC?=
 =?us-ascii?Q?dk8bYTARhr5Yhv+a9awDfb0JDs756K244wa5gGW7zH3e8S9NorM7GHHs1Vv+?=
 =?us-ascii?Q?1fcZFQdqHVYHnsXIaBMZWidm/Ll9nLv/V5agz7ibZIaXAVZrUoPuXnTs9Lw5?=
 =?us-ascii?Q?+74ESzzooboYUUQiMnOwiXwjlPhcNNYxN+rdicDhPK3AtvtP316mOWCeW20c?=
 =?us-ascii?Q?iowfNeO6PsrtcuVlkzheVCI/2CwVyzjfcNujDEHAh9ZCeRXtsXANk1mKUq1c?=
 =?us-ascii?Q?vvJcAWv57o61oEm77wUR5fdVs7bTPusmPSqPBE3z54BOpa3zWoDmZVx8NOJM?=
 =?us-ascii?Q?0VvFNVQ/0vZRfVff4cI6OEw5qulRuAvxAAZe0gCDJ3Cx5c1AxRZJJDdGezLp?=
 =?us-ascii?Q?J9OrLqzJCdIqRs5yVOqg1FXS7CVdzQvlrNos2XZVAnQlNl145wye/mTv7/O1?=
 =?us-ascii?Q?AVZIKKfhko1RnEoiwnmq15lkjQEc/km8gb956TQrABwcd80mm3vPs6vC8EF1?=
 =?us-ascii?Q?bX1diYTuYhcIe/GDFmGf23resw/ol9DtIVKh1IeS3CWQE4PfgQkUXSl6RWUT?=
 =?us-ascii?Q?Yz11yG7jwiREGs/3KwzkMwwM/6NcDJQL/8CQQ8n3q48zIp5X4tseQ4PMLoWt?=
 =?us-ascii?Q?WJuKkPMiYyLb3Zu699vLKu2KD3mVerRF/bSX1Gfl81Uscx6ViZtdAC9n8xak?=
 =?us-ascii?Q?2MccfWRlMV8cF6LWA/8WwPZEy0HKkJvBq1oCBGfyHRY1KMwcqNeN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85fa2d9-b820-4f1b-5a83-08dec8bfb1f2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 20:17:59.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4p650WgnAA24WCR+jO9HknoBJOAAM7KyZwq4fGbj1P4tNReJyMB9k7m939XAAZuU3xTNmvt2WpkkGWSyne55DzVWNHRKGqUpFskFyJXPZpym0lkq08IDFEngBZNHZNs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_131806_893474_8FB31EF4 
X-CRM114-Status: GOOD (  20.68  )
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

On Fri, Jun 12, 2026 at 07:04:42PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> This series adjusts the suspend to RAM code to handle cases where power
> to the connected devices is lost during suspend to RAM. The fixes
> included in this series are required for that support.
>
> Along with suspend to RAM support, runtime PM support is also added.
> Cleanup patches were included to prepare for clean runtime PM support.
>
> Please note that series need to be applied on top of [1] since
> patch "i3c: renesas: Perform Dynamic Address Assignment on resume"
> uses i3c_master_reattach_i3c_dev_locked().

Please sashiko AI review result, except pre-existing problem you can fix
later, other problem need be fixed or provide your judegement.

Frank
>
> Thank you,
> Claudiu
>
> Changes in v4:
> - dropped patch "i3c: renesas: Do not attach devices if xfer failed"
> - fixed the swap in renesas_i3c_group_devs_in_slots() for i3c->addr[]
>   renesas_i3c_irqs_mask_and_clear();
> - in patch 16/16 renamed renesas_i3c_abort_xfer() from v3 to
>
> Changes in v3:
> - re-based on top of series [1] to be able to use
>   i3c_master_reattach_i3c_dev_locked()
> - used i3c_master_reattach_i3c_dev_locked() on patch
>   "i3c: renesas: Perform Dynamic Address Assignment on resume" along with
>   grouping the I2C and I3C devices in the driver slot
> - collected tags
>
> Changes in v2:
> - dropped patch "i3c: renesas: Use the divider 128"
> - adjusted the patches title and description where requested in the
>   review process
> - adjusted the DAA procedure after resume to still properly re-configure
>   the controller in case the bus was full before a suspend
> - added patch "i3c: renesas: Do not attach devices if xfer failed"
> - collected tags
>
> [1] https://lore.kernel.org/linux-i3c/20260525064209.2263045-1-lakshay.piplani@nxp.com/T/#m74ddb24e1e3a8006d933bd6106cc0c4508a11d2c
>
> Claudiu Beznea (16):
>   i3c: renesas: Check that the transfer is valid before accessing it
>   i3c: renesas: Restore STDBR and EXTBR registers on resume
>   i3c: renesas: Follow the reset deassert order used in probe
>   i3c: renesas: Reconfigure the DATBAS register on re-attach
>   i3c: renesas: Reset the controller on resume
>   i3c: renesas: Perform Dynamic Address Assignment on resume
>   i3c: renesas: Clean DATBAS register on detach
>   i3c: renesas: Use reset_control_bulk_{assert, deassert}()
>   i3c: renesas: Return immediately if there is no transfer
>   i3c: renesas: Follow a unified pattern for transfer and command
>     initialization
>   i3c: renesas: Drop the explicit memset() call
>   i3c: renesas: Update HW registers after SW computations are done
>   i3c: renesas: Organize structures to avoid unnecessary padding
>   i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
>     name
>   i3c: renesas: Drop unnecessary tab
>   i3c: renesas: Add runtime PM support
>
>  drivers/i3c/master/renesas-i3c.c | 541 +++++++++++++++++++++++--------
>  1 file changed, 413 insertions(+), 128 deletions(-)
>
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
