Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F41CD6E7D
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Jun 2026 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfRhs2y4CBWQ2G9MDbkp1yvejs34Lvr8337BVsoCxus=; b=Q4U/Al0t8w9Wqp
	JtcNUER/01uZMmpzL84cwsp1SPGOTKwHnrsudc7HyxKfUcPSd9sZIwD+VRLV4MDiMLdCc2qZz8jtP
	/gYfxlITdo4I/TXnzes7NtBfslLd/SP1V0gZZOjHEYqKGjgrZzXvNEpQqE5QemITrx4gkD/QVkfvk
	ENYS1EAiyANHURbkDaos8YjmyNcm7mZ8SxVaWUEy+LE+fP9lLoNpQDfaG7BWjh3sOIU9TNgDErwOM
	d8aplLGIVsFLGeJRwJN6wjtsHsf65WH9ZVe1aCxev2gQKx0/malNnR2eAnfh74dihaWSkG4ehqHEM
	HAWZ3FM9SUqSUYLUAR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXKL-00000000uHq-2qma;
	Fri, 05 Jun 2026 16:23:21 +0000
Received: from mail-northeuropeazon11010040.outbound.protection.outlook.com ([52.101.84.40] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXKJ-00000000uH1-08Jg
	for linux-i3c@lists.infradead.org;
	Fri, 05 Jun 2026 16:23:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1F9Fy76T6vpXoL48/IRYlsC3vH8HzeExjD6t7pUkCzVOPvhNRM57QT0kaGoNHMmBEEnnOOCaNEmAHKN6kjSRTmarSF8jLauDUNnjMpvBYG/S/VVl5o0GwCupwUBgWIguTk2iRhD5S8yx/H282Ocg6Qgb63F0IP2nQwt9zkFzxYk50yngV/Bm5h6S38IQXaczmVNyRfHjZT5P/bt4JCX11Ato4CNcwBG+GzwEKb7tAFz7pnYkHcOZN3qS8rYreKbY7NbZCeKBYjayrEUqpg0EX4RJj8fNnreRFbHKWGBjz98p9ov5b0XPR9HRbFq33dgZKXfhUgMxJKoFS4FZzVDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Cp/ByKzR/RQDZA8ej/hraT2GviQLhEbpQnT0H5iJ9U=;
 b=JIxCyB6Xi5Bc0PBzlnnTab+LzQxJB74feMwzqLFH/kKyNy4ed3ROO0ZWh6/TaV0GGzkszWeyk46za0+PI6b0HM89FMDh7luUs+k3A/2pCkskm80Hx5OLvf1pyCstSvEJfPFGveePhubukpHPBZtm3YSEmbLIktITwKlQHMa8d6qwYhsmUponfX8yfvOImhpd4OCwDN6dVrQxfM4rhYzZUamOhojITRHUiO2vV5RQwHJf9D9ZZbk5UsgEkK5KeT02RirQSZ8Uz6lf/16kp63svEAR3xhRPvw1vF1iOVlHnXYHd5B3yh87JnwBKKwZbCYC5fHv9dlzh9GjVtEf+cYH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Cp/ByKzR/RQDZA8ej/hraT2GviQLhEbpQnT0H5iJ9U=;
 b=h50na8Wl9OH89+d8oGESl819IXGE3Flt5sECrIo38ON4RxKONno6vwghxkgXNbb3rg/KnOCt75RCtIzLPEw8bo9b724tTbkNy6BzYU9N0fKAW5b8WQb6KmKstgXgcB9YvRD819C352Ok9706b6al4t8euqc8uaDxSzdhkb7Kg2eBqL+e87ESZmdLrB2XoQ/8btWYO9RIiQ1fucaAHEZTpt199o8Gu3X3PSyWqKxPe1jWnt4mk6He0NrM7HtVgsS34LHtHy6DM3ZeMGQzz+rkIv62rjMywsjDu7V3BtwmXi/g5vk680x6npHZcOvDX3TiimxOwACgZmGo2LZ68Mp1jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11387.eurprd04.prod.outlook.com (2603:10a6:10:5cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 16:23:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:23:14 +0000
Date: Fri, 5 Jun 2026 12:23:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, david.nystrom@est.tech,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 6/8] i3c: master: Defer new-device registration out of
 DAA caller context
Message-ID: <aiL37EmdkHp6uKJ7@lizhi-Precision-Tower-5810>
References: <20260518115520.98335-1-adrian.hunter@intel.com>
 <20260518115520.98335-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260518115520.98335-7-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:510:339::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11387:EE_
X-MS-Office365-Filtering-Correlation-Id: cadfee2a-e860-494b-c031-08dec31ebe90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014|11063799006|56012099006|5023799004|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WPdlLmts4ESbO+oANwhAeJlSjlY894qPfk9mc+HHjtkC4iUd10tHG8mPJHFKJ0MEk0UrgCm/uQNcQ1yXW2abm4SG+RTry6Q1wAlepv5aiOmUUsXU9b7J5i/SaNQdYxw4ERGZF6nAK+aBAeXegHEJHpb61si3wK2NtVgAmYY9cBMQTTEcXJX5Br8nP5W68mEgmDGo205lAN+jj2nO1EXCg/pnyionicEK2W4dQ2St3lVsOUcoFavsKdP2oSirQLzhAAXCmB28xAAVxifymAatLm0A7WkLwa5FOmPHIcHWknvQf+uea6oDM45tf68P7kXVFk1aDuRRyd9wWel39Ul61TgerWlYRLfogoPhtKpw2Y+CarpifGXKrBj/e+iB6A5vKTUFh48t5fFcli1u5uvtAWA0mLjfgSbG6sHfUdT9zMikjI+AVpTk5Qs123PDelztgyqn6zCknjwWfQ9af32UKsD1c+SKw3D1gKYQiSv3xvfF1hnh5hpO+JaUvhg8pUp1SHVJjdUtnCFellUIxXCn58ZehKiFbsLe9nJxGIK+PM5fUYgtAuHvrV0WABK0ow0yo8iNWCuJ98rqIY+JWgGvsUKf/24WM/CXReyepiRyNNsr3NgOvcpbD3QHrMBWcyI/3PQB/o5nOiUj4chmTxudvQHl7YKNOfE9dWbzZgohEa77friy1FOwV4ay3MrwMC2tVswC6mDeRvipLMM1vCfsAho2uo+8zh3vTjYqs+PjZynsJrdHTXDS2/d+ufm7CFq5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014)(11063799006)(56012099006)(5023799004)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iy/E27zIxpFx8RPIBMuLH73l7YLiOkql4T9F6ykbzDt2yPUyShwtRERu996M?=
 =?us-ascii?Q?vH1V5Ma95dcsktubb5R+ju+tbk0iLPCQtatc2Hys3SFbTAZBJ0mrR4CMNbs6?=
 =?us-ascii?Q?s6u4YACq0PaRhcdqvywSmWZhs9zIGZ4xFblACfe7uTZR69OxlVUriusn+bOd?=
 =?us-ascii?Q?44yEDP2p5+mb/jlQfdXAZwTNCWcPKxKnXjWyjwu87b2jMEn3mvyZHgB4pPeS?=
 =?us-ascii?Q?PGYgMR8XWV6iSIJx6yX9dDdCmRJNqxsUQ/pmn3urtswzP0XGeXlFcEaFKNbO?=
 =?us-ascii?Q?X8aZbLMSq9ODxa4LGzjI32arbpRxeX/B9PvDGLaizqESkn/WghAgNODEKvYB?=
 =?us-ascii?Q?yxyvUfoIme2rfR3dazJ1bqzA+xu+QwhBvQLzOc3cFiRLJS2LGmiuhiZGkRMK?=
 =?us-ascii?Q?xq0DAEOoHFoJQBL2xUgON1BfmXJyj4pnwl9FViwcduK5LFxOz69EedOqBwJw?=
 =?us-ascii?Q?Sf9zPgdf8ejmj0GF8rV6vsielKHtKnZw/j/V4tBUlZYY/NQ9fALrb1qSLTQ/?=
 =?us-ascii?Q?2huarPdzUq9ylBfXxI94JcjS4DjIOugAnaDPybqT+BmBFnmBo6gh4VbJgxNh?=
 =?us-ascii?Q?a/DptCrzU77bXIaJQEH5SP+wGbZPYiwxIBWUG4YkM9en5e7ozRDemwF7cEKe?=
 =?us-ascii?Q?mf5eGOxI0q58bpy5PaWumTp9rbADl97/oVEOudcS70WPFjVcNLN0YoZFFUs2?=
 =?us-ascii?Q?Svd/doAgwqVhXVd409EZlbLb0UDrTe8XUtT3nzs0bJJvqMp5+h/gdqWGEaXT?=
 =?us-ascii?Q?e990E8MJHue8wjLCNLwlrqtUw+HhELRTDdRrfKmEYB5Lx64zzNyTUEdxw3Cj?=
 =?us-ascii?Q?sTxsM1CcMNQ6IlBsxm67fvtq4GvEJEQV4N7VpivqBh71P9KJFZGDv4j8PIXA?=
 =?us-ascii?Q?mTLj9cVS0+AJoqS5sLBujq1oqhcG6n8amoxMM6Z801GohS4vdHQnkIfCNoRO?=
 =?us-ascii?Q?2BtrJjmnWtgZgSlUm3k/7ucnRGYGJSS+9VhH19q7NC9eEqx53eZj4Ns8Qujr?=
 =?us-ascii?Q?voMrPgMhiZjO2x5TlLPUxEtodhRLdvHqd5TEViXbI8P7MQ2P3MEo5vy3u+Xb?=
 =?us-ascii?Q?kWoD7UgfxykbpKJzd9wDrQ2/hdCZsfswOFDxfiZEuyIqDls6ktXkfehODLcL?=
 =?us-ascii?Q?ed/vYU2FHlk8M8eygWHlPb4Xdhs9LTtH4uq8GgLcRB53TvcCSvcHzejY3sBV?=
 =?us-ascii?Q?OOKxBNPvdXSGiw/jC5veRqiMftUZhW0EZvZBBi6LHt6ErPOkGhKYCzqGJ1r5?=
 =?us-ascii?Q?GNb+V3qlZzscUjA8onWYYQimIIjB+Bh5CsysKmApWPWI1WBT34iHOC65qr8R?=
 =?us-ascii?Q?wguY3aCAdwSXN7lC2bN2AQzPiX5iM0efJk6LB49ZQ2TZsRiN2A5/jwCDt2w0?=
 =?us-ascii?Q?UWQG2rltN9rylPItsdt/WtsAoNeXblz6ZqJdgx/DqBm2UEzwfdE/r3Mh52wk?=
 =?us-ascii?Q?t07EyVb0+Mywv6iYnHnQ7KiXIHbNEC+jqajaoZJTZlP3hkiz9o8lE5jGNfuO?=
 =?us-ascii?Q?7BR6/REj1qj2E1AAOkSQ5n+cYIoTeBE8CDP5d/0mBISTQDFlRlHhWb4LaceZ?=
 =?us-ascii?Q?h1YzF8ysLlCx8qQBXKXdV4QJy0sWbaFVJiz9s5kBdcMtS99tn1bdGixipBXn?=
 =?us-ascii?Q?GhFVQ4LXsDiG3bOIE+EUyn2yR0E89H0qz2R7W7uwuQCE6iclfESWcHUmLiKR?=
 =?us-ascii?Q?hYukYUCc5GSfhoPOOjDUOvHQQBWyYSI5gyhVkZoj9wcFw0p5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadfee2a-e860-494b-c031-08dec31ebe90
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:23:14.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZY0F7eKQULrQrLT9iSDOVuLXhOFtrrlb862JTOyJ7llkBr7BmqRHlECTB+9khwoMg2qyVZRLFuFcvQeYSDqQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11387
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_092319_080723_E5F3E220 
X-CRM114-Status: GOOD (  34.10  )
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

On Mon, May 18, 2026 at 02:55:17PM +0300, Adrian Hunter wrote:
> Master drivers may invoke i3c_master_do_daa_ext() during resume to
> re-run Dynamic Address Assignment.  As well as assigning addresses to
> any newly arrived devices, this restores the dynamic address of devices
> that lost it across system suspend, so it has to run as part of the
> controller's resume path.
>
> A side effect of i3c_master_do_daa_ext() today is that it also
> registers any newly discovered I3C devices with the driver model
> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
> resume path is problematic: a hot-join-capable device may join the bus
> during this same DAA, and registering it immediately would push driver
> model work (probing, sysfs, etc.) into the controller's resume context,
> where the rest of the system is not yet fully resumed and the
> controller driver is still partway through its own resume sequence.
>
> Decouple discovery from registration: add a reg_work work item to
> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
> on master->wq (the freezable workqueue) instead of calling
> i3c_master_register_new_i3c_devs() directly.  The worker performs the
> registration only when the controller is not shutting_down, and is
> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
> freezable, any newly observed devices end up being registered after
> the system has finished resuming.
>
> i3c_master_register() also routes its initial post-bus-init registration
> through reg_work, using flush_work() to keep probe-time behavior
> synchronous.  This keeps a single registration code path and ensures the
> worker is the only writer of desc->dev.
>
> Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Add comment about reg_work use
> 	Add Fixes tag
>
>
>  drivers/i3c/master.c       | 27 ++++++++++++++++++++-------
>  include/linux/i3c/master.h |  6 ++++++
>  2 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index a59c4b744b36..c9685379e868 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -839,6 +839,7 @@ static void i3c_master_shutdown(struct i3c_master_controller *master)
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>  	cancel_work_sync(&master->hj_work);
> +	cancel_work_sync(&master->reg_work);
>  }
>
>  static void i3c_device_shutdown(struct device *dev)
> @@ -1838,6 +1839,16 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  	}
>  }
>
> +static void i3c_master_reg_work_fn(struct work_struct *work)
> +{
> +	struct i3c_master_controller *master = container_of(work, typeof(*master), reg_work);
> +
> +	i3c_bus_normaluse_lock(&master->bus);
> +	if (!master->shutting_down)
> +		i3c_master_register_new_i3c_devs(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +}
> +
>  /**
>   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
>   * @master: controller
> @@ -1878,9 +1889,7 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  	if (ret)
>  		goto out;
>
> -	i3c_bus_normaluse_lock(&master->bus);
> -	i3c_master_register_new_i3c_devs(master);
> -	i3c_bus_normaluse_unlock(&master->bus);
> +	queue_work(master->wq, &master->reg_work);
>  out:
>  	i3c_master_rpm_put(master);
>
> @@ -3126,6 +3135,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		goto err_put_dev;
>  	}
>  	INIT_WORK(&master->hj_work, i3c_master_hj_work_fn);
> +	INIT_WORK(&master->reg_work, i3c_master_reg_work_fn);
>
>  	ret = i3c_master_bus_init(master);
>  	if (ret)
> @@ -3151,12 +3161,15 @@ int i3c_master_register(struct i3c_master_controller *master,
>
>  	/*
>  	 * We're done initializing the bus and the controller, we can now
> -	 * register I3C devices discovered during the initial DAA.
> +	 * register I3C devices discovered during the initial DAA. Device
> +	 * registration is done via reg_work because that keeps a single
> +	 * registration code path and ensures the worker is the only writer
> +	 * of desc->dev. Flush the work to preserve synchronous probe-time
> +	 * behavior.
>  	 */
>  	master->init_done = true;
> -	i3c_bus_normaluse_lock(&master->bus);
> -	i3c_master_register_new_i3c_devs(master);
> -	i3c_bus_normaluse_unlock(&master->bus);
> +	queue_work(master->wq, &master->reg_work);
> +	flush_work(&master->reg_work);
>
>  	if (master->ops->set_dev_nack_retry)
>  		device_create_file(&master->dev, &dev_attr_dev_nack_retry_count);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 77e63082b06e..8cdd7be505d3 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -523,6 +523,11 @@ struct i3c_master_controller_ops {
>   *	be done from a sleep-able context
>   * @hj_work: work item used to run DAA after a Hot-Join event is detected.
>   *           Queued to @wq by i3c_master_queue_hotjoin()
> + * @reg_work: work item used to register newly discovered I3C devices with
> + *            the driver model. Queued to @wq by i3c_master_do_daa_ext() so
> + *            that device registration is deferred out of the DAA caller's
> + *            context (notably the resume path), and is skipped if the
> + *            controller is shutting down
>   * @dev_nack_retry_count: retry count when slave device nack
>   *
>   * A &struct i3c_master_controller has to be registered to the I3C subsystem
> @@ -548,6 +553,7 @@ struct i3c_master_controller {
>  	struct i3c_bus bus;
>  	struct workqueue_struct *wq;
>  	struct work_struct hj_work;
> +	struct work_struct reg_work;
>  	unsigned int dev_nack_retry_count;
>  };
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
