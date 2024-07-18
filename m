Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F8AC3DA63
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jul 2024 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUkMnZ+3IMYRbn0mvyoqJmNcfjPDyRpVt2IDR3OgbSA=; b=oizg/0gdm7r38G
	CCjuDuOqLn5tI78Yqr4Zj0Bp9bYvnewrOutmiGOkjcHLtOTC/6BReboCBIgAorj8MLJEYmirZ1nj6
	qAfkMLqZVKAzLJZs/8rZn+/CZWmI16TeiJfyPyTOLJ92UoJhbjsVv36+9U20z3/Vs0BRdIboVV7v/
	S6xZWjBN3xOUNH3mcu63iDiZ8TpYpzT3TPhp1KE5rODrSS435xPPdjUOBbCPY0S2TYjb+JWy4fuQR
	OWrHOnu5MCBYGuBGGssfzthLk2DyhDp1lHZaZtBLN9Gf4+effiXLqKfurJZFg4I6u3mpbfxbxAPgP
	aAgn9m+8WstTklvh7lMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURf7-0000000HCu7-0oOW;
	Thu, 18 Jul 2024 13:59:13 +0000
Received: from [2a01:111:f403:c200::1] (helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURf3-0000000HCtL-2QhC
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jul 2024 13:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNb4DGNxtp3hztRe6BTc3V3zAdOqaQP8P2ofL4e2EtFJ1eH5k2OCqzpiWyyJZlFhQA+ftaswvUChanlfmqQZTRybbBf6d/1XypC0REyHzkkG2an3od43lWVKdLapoJ5tQ7eCI/fyUkqO1f7s75CHUNj4sFDwKIqRFhk56gBvwn8h8gUUv97oTUNtuGfg2Sk0v+enD5GG8TmX7PA52UX6Qc9vYg/XuW1ZJOZrE1DYY62a9iKjGKyxnBw0i01QXho14ZgHkBq0qLH9GzlE/bvvHi4pUeuWu6hTRN6Zm9xUAjWjDHjWHm/5W+3y//VEB5pOGisgLJ1hjzzkvNbs/2+9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6Ei1VDHhBjGcxQP+LwSpFjAnI/UHZJgCF4bv21g7j8=;
 b=onvx/srzjlLcrmI2BkrEhF3jqKCwFnzUhd6zMLwHyq1lORNUhE8AslL/w8onvZ1kICsr0SwGxPJIIr7K6XqVDiWoNuPOszqI1Isl9aMDHVpE2OY9WoLop6w9k2FSoFA8g+dTvYVZZxoWn5iC3XPlfBhcnpfzG/npQRi2+3/rzQhsTe8q9PywmV6bnJSKoPKXqdUqDnRzt9cBk+w7CC5VDoY6y+30TWc7tiEC5hfdhlntGqsJW+GEQqN5ZyyRVIVggZ5hiyatUX2E1vzNLumiKGYfMFJ2PDQZfdEqysKo59+NcWf4E2HYHcV/jrYqWtgOMDKeLUhLJlqI0TBAic2bxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6Ei1VDHhBjGcxQP+LwSpFjAnI/UHZJgCF4bv21g7j8=;
 b=Yl4+5Pp0RCMdIbH36u0QC1BsXeSOsOcQUzsnaIkCp6o08DSeEk4eQlyeIfE/6gnLmO99mJiM2ZWqHcEQpTuxZztUR6SmQdIU3NnFM33cLiBaA7cHo8wwH1gfxK7D3nVWiEaTK6HNBHI8YwzmgIcnmZ3UHaw5TnfNpuqY6tukwZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9374.eurprd04.prod.outlook.com (2603:10a6:102:2b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 13:59:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 13:59:00 +0000
Date: Thu, 18 Jul 2024 09:58:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2] i3c: master: svc: adjust SDR according to i3c spec
Message-ID: <ZpkfnGnPkzg1HW9A@lizhi-Precision-Tower-5810>
References: <20240718091329.3788619-1-carlos.song@nxp.com>
Content-Disposition: inline
In-Reply-To: <20240718091329.3788619-1-carlos.song@nxp.com>
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 420b32f7-fc47-4ca1-e49e-08dca731c655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5G/AUyivSi2W8RfjHpbnfNzaz3vKQlDi2bVEviIM4HQnG0Xi6UxF40QgnGdH?=
 =?us-ascii?Q?Ol8e9iYBOGL+2tAkzrb4+npM1LndwUQ3HU4G8ItIdSRhZQ5kdAyiQWuYAwEF?=
 =?us-ascii?Q?LJvN4L8yQK0eZOUF7Gu72D3GmCQliVhOjBF+W3Mrl0O8kpBqdv3QOaTg4RBJ?=
 =?us-ascii?Q?EeqpqIKzRKKNrL6s+DuT9FwOJV+O/t/jz3JQ+0jebeWRcxIqAKvESW3VUIPP?=
 =?us-ascii?Q?aRb/reOLT1jwUMlzfuTXmsEZjAd0GQldUEAOjem3FFX4h0t1JBkh9Ktg+fpy?=
 =?us-ascii?Q?RXn9g7irdxzpJS7FbWjxM8yYcmMPdA1SiPJN5AEh7wnBfOCPBGo7xnjNxSwk?=
 =?us-ascii?Q?cb5U/2SNhhGMX4vO/y0YtMtust8o9Q6AkBaaHiPR3zPEQJpYhx9ldywCExEL?=
 =?us-ascii?Q?jWJASPb/olZQVAV4Xr6Aod1zUKf6KQLCYSS0BdR9Cy72g9Uc8Vv7pGDMYudm?=
 =?us-ascii?Q?YOpDRXsGarHA3tUu+KqAVqn2QbdkGX8MqalaGcxD1pOHCMgdUANHHwFP1AMh?=
 =?us-ascii?Q?lbpZPn8Vo9Wxy5pUEM4YkOwX2YV2+HeG0zgvw6xTp+aKvVLUJUljHB6cb9VS?=
 =?us-ascii?Q?waHd66h+SIv5T+G1s2J+z1r7CeJgeeLlvHMy8Z1s/cKo7wDsKSHfGmZUCuqQ?=
 =?us-ascii?Q?1tdNTEnDtyEoZp1+b+yJ5drsRLl+iz8ZGW5TDlZ1fIkgLIzGIJdcargP39AO?=
 =?us-ascii?Q?msXmPb73mb4nQVZr3GQzx0EOCgTpd0kuxiABA2S2Vc7eWybZK2sD2DmSWA/V?=
 =?us-ascii?Q?vqs3Q1RYulklauRmcBDTR8q+ZCB7HgKJ+z1f3aDx+4OASgTZujLf2dP8u1Hb?=
 =?us-ascii?Q?PfF4mwVgVYQWajHpmQ/QH7z0pwUIse/7Q7usAR3/dXPx5bJ7y7gpO8SSnp6E?=
 =?us-ascii?Q?Yl9mJCZHAeYAVXArLWXuQ0gDSO8zEpiRTH7J6R+YRWxy0ztv7v8QmbspR/Jo?=
 =?us-ascii?Q?yWYjDwGqMC0uZsmP2Qh66CbRtdU8X8AWzoNV4iX2q0TaQT57vN7Me2ppTmYm?=
 =?us-ascii?Q?uo2IjSsXSvZyAjkbSl+MNTbGHKzYmQUkLHqrFXYi2JA/bILCFX6CI8BSrUwj?=
 =?us-ascii?Q?8ZplCX/qUJD+LEjpVjbfv+2ltlcLQ+lJxcGoczvC0zrXGopGIm0I+O3Z4LD3?=
 =?us-ascii?Q?A+qYrD1rF6uPX5onufBuSosGeNHxHqJHVBAO2VIz+UFUNydwUAqJ6eigYGFT?=
 =?us-ascii?Q?Bdf3ndwFfAkZzu9MqgUjmNHgxQGR8GIkVWrxYL9kiOqpIn4N/xkYE5dZb1vJ?=
 =?us-ascii?Q?g8LJt5YRk4aI7tEDlbOYvxmu268P6ngYV3JZsl/bzJdK9cCFH2uxRCAPBMsf?=
 =?us-ascii?Q?qllil5qwingfjgcbmrxGQgCsbIBdu/DlRI5JzdMcM8eh+sgBU0XXMg9fX/yN?=
 =?us-ascii?Q?YdBcMLH70vkoqYHnqzC3p+NMBV6TSRjphlDoqxdsztWr3e5pMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kojiweH04KKUiC7soIW8YrX9t9GroEcHJUNpVPNqODccN0iLejL861EcynZ4?=
 =?us-ascii?Q?P5u8w1Bql2onx6qhgq2WW+Fn6hlUNNjP3De5BSAGchkpJXccenIlP1rip6wX?=
 =?us-ascii?Q?YfMZf0uLWv/XIv2K+4FuhHhtLNyZaFHl5OJkQtQIbMt4RLW7/1FaVFC3DDZN?=
 =?us-ascii?Q?Fvo6gkaSkpYRnkeYAcdIM7mlFIL+AbIRM/k95d3CCcnMbA4SNMn8+n5kDri3?=
 =?us-ascii?Q?oS6LQLfnwzT2siU2BOUyRfUjoPQpysa5Y+HtOOUQ7rJLbMzVPMeIXYv8juby?=
 =?us-ascii?Q?Gk1He+nhenosKQyho2eXtdhsqBsv/Dbtxt2K5IiqhTPe0nNUu3/ZaVTYZvKB?=
 =?us-ascii?Q?Zmh0X31Kz1r0q7Hkw79z+J0cdYraJCtIUwx3icg2jxPLWuL2P2EUzZ88fNK/?=
 =?us-ascii?Q?Jg278sjq0JZE+p7SlmZEDBJpK7BVaTGPmWAQ+DWGBo0WOa5WHvFLFDl0y6Jj?=
 =?us-ascii?Q?VhTt4DvG8ZTKIV7l50uBnObsFucveNYuOQoCwNo2NpjQYKL3cBwwRfpD9a8a?=
 =?us-ascii?Q?cXHBE1KOS0gg0AHGhzKm77mcfOQCtM0T2a2VyNoFsMf8F3SCrHk/OsWLpFUQ?=
 =?us-ascii?Q?j0Y4UBQ6B/n/QjBgXuPfjV0VbSaG3bNSKGTzYGYD4qBzAw2KufPyOBIp3PJ2?=
 =?us-ascii?Q?UHmG3OBcvO+MRMfUlCjaZcy9TdK+5ha8g0ar06VWZLfObCBhLj5k4PabWxnt?=
 =?us-ascii?Q?qr/jFjbU/tmhf1YGme1OgZSS5wsnrfrZqhaWSIezhYNIg2GsLItjT70qGst5?=
 =?us-ascii?Q?2NMxVZFWmpM7BRiegVy5ImIBPFmZDooYHP2Tl44br6oy71WdYxiV1EhE6nWo?=
 =?us-ascii?Q?sudXqWhuYQMKeC/lSLMqeuqLtBDYPbn9SNvYRaZR0EojMrbAo+Pdspt7v70G?=
 =?us-ascii?Q?oy+o0Ie9vEUFBzxBykbgOGeVqINioixHmZ8Lu3pDJZgD/5ST0k9m+wOaNfcA?=
 =?us-ascii?Q?UEt/IYs30dy/2jHYcRIuBJZDetslhicPvF92YPyVo4NmqEYPa+VRa2iVZThj?=
 =?us-ascii?Q?GWXN12YrppCGKqMeeRk/IcgXQnTTeiRnk4PUAi/AnFz0rsgleoJ48nM6hCMa?=
 =?us-ascii?Q?rSdg4b26YEULxrqhMVctM9kqJpOwjgqaaa3JaGJvhsLmDJZBCr6k/0SY8jTK?=
 =?us-ascii?Q?8ix3N1a1qwaWQwV5DdUkcS9wBO/5xWXqXe9ZNoWjofwsqOhSFDpowRQ0fvqg?=
 =?us-ascii?Q?vRxqbjx6lsPXINEh58JPcefC6OpwvJ1hfBz4UJxXMwz4djyyxL4gGrOgKAY+?=
 =?us-ascii?Q?hNfxui4q+Wzvo9dj0EK3EZkM7V8MrzjEH0qXOM86FMA5gp73KiROk2RYJ8kN?=
 =?us-ascii?Q?mFOD/9bnxKA126gLKXNTlMaKURNQ7YMsSlN8V8/j5LOkLm0dL5qck67foUD7?=
 =?us-ascii?Q?lJrO4vm9kM9t3JuTx6x11GUcFhhUKhS1IAbyP5/OByDOHxUgAPxkOWljk7Oh?=
 =?us-ascii?Q?wEsyQ+I0wLgA4lZrrFLYHFK0hMXZahktPonuutk2RP6qDHhrJYscaxrYz//q?=
 =?us-ascii?Q?xb8P4NSuuNryPH9gpA2C7c4MzyRVPJYW7kxVLZZMq0LlRTTZZFuU7oJSwuRw?=
 =?us-ascii?Q?KtyRycqDjcdbzk8J/D0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420b32f7-fc47-4ca1-e49e-08dca731c655
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 13:59:00.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdEpuDMbuysPqXoQLMMQCLH/ZZnBrlla86SxVQ7qKKmVvIY8aQRHgkWLo+Ob6lhKZjDW2STzAfOZPb+aC15mng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_065909_812432_B847E2B5 
X-CRM114-Status: GOOD (  25.68  )
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

Please add imx@lists.linux.dev next time.

On Thu, Jul 18, 2024 at 05:13:28PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> According to I3C Specification(Version 1.1) 5.1.2.4 "Use of Clock
> Speed to Prevent Legacy I2C Devices From Seeing I3C traffic", when
> slow i2c devices(FM/FM+ rate i2c frequency without 50ns filter)
> works on i3c bus, i3c SDR should work at FM/FM+ rate.
> 
> Adjust timing for difference mode.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <frank.li@nxp.com>

V1 have my signed of, please keep it.

> ---
> Change for V2:
> - Correct I3C clk configuration and simplify the code:
>   Pure I3C mode and MIXED-FAST I3C mode just use the same i3c clk configuration:
>   1. i3c push-pull timing is 40ns high and 40ns low at 12.5Mhz
>   2. i3c open-darin timing is 40ns high and 200ns low at ~4Mhz
>   3. i2cbaud should be different between Pure I3C mode and MIXED-FAST
>      I3C mode.

V1 get Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
If you drop it because big change, you should mention at change log, said
not apply Miquel's ACK tag, because below change is quite big.

> ---
>  drivers/i3c/master/svc-i3c-master.c | 31 ++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index e80c002991f7..78116530f431 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -127,6 +127,8 @@
>  
>  /* This parameter depends on the implementation and may be tuned */
>  #define SVC_I3C_FIFO_SIZE 16
> +#define SVC_I3C_PPBAUD_MAX 15
> +#define SVC_I3C_QUICK_I2C_CLK 4170000
>  
>  #define SVC_I3C_EVENT_IBI	BIT(0)
>  #define SVC_I3C_EVENT_HOTJOIN	BIT(1)
> @@ -535,6 +537,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
>  	struct i3c_device_info info = {};
>  	unsigned long fclk_rate, fclk_period_ns;
> +	unsigned long i2c_period_ns, i2c_scl_rate, i3c_scl_rate;
>  	unsigned int high_period_ns, od_low_period_ns;
>  	u32 ppbaud, pplow, odhpp, odbaud, odstop, i2cbaud, reg;
>  	int ret;
> @@ -555,12 +558,15 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
>  	}
>  
>  	fclk_period_ns = DIV_ROUND_UP(1000000000, fclk_rate);
> +	i2c_period_ns = DIV_ROUND_UP(1000000000, bus->scl_rate.i2c);
> +	i2c_scl_rate = bus->scl_rate.i2c;
> +	i3c_scl_rate = bus->scl_rate.i3c;
>  
>  	/*
>  	 * Using I3C Push-Pull mode, target is 12.5MHz/80ns period.
>  	 * Simplest configuration is using a 50% duty-cycle of 40ns.
>  	 */
> -	ppbaud = DIV_ROUND_UP(40, fclk_period_ns) - 1;
> +	ppbaud = DIV_ROUND_UP(fclk_rate / 2, i3c_scl_rate) - 1;
>  	pplow = 0;
>  
>  	/*
> @@ -570,7 +576,7 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
>  	 */
>  	odhpp = 1;
>  	high_period_ns = (ppbaud + 1) * fclk_period_ns;
> -	odbaud = DIV_ROUND_UP(240 - high_period_ns, high_period_ns) - 1;
> +	odbaud = DIV_ROUND_UP(fclk_rate, SVC_I3C_QUICK_I2C_CLK * (1 + ppbaud)) - 2;
>  	od_low_period_ns = (odbaud + 1) * high_period_ns;
>  
>  	switch (bus->mode) {
> @@ -579,20 +585,27 @@ static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
>  		odstop = 0;
>  		break;
>  	case I3C_BUS_MODE_MIXED_FAST:
> -	case I3C_BUS_MODE_MIXED_LIMITED:
>  		/*
>  		 * Using I2C Fm+ mode, target is 1MHz/1000ns, the difference
>  		 * between the high and low period does not really matter.
>  		 */
> -		i2cbaud = DIV_ROUND_UP(1000, od_low_period_ns) - 2;
> +		i2cbaud = DIV_ROUND_UP(i2c_period_ns, od_low_period_ns) - 2;
>  		odstop = 1;
>  		break;
> +	case I3C_BUS_MODE_MIXED_LIMITED:
>  	case I3C_BUS_MODE_MIXED_SLOW:
> -		/*
> -		 * Using I2C Fm mode, target is 0.4MHz/2500ns, with the same
> -		 * constraints as the FM+ mode.
> -		 */
> -		i2cbaud = DIV_ROUND_UP(2500, od_low_period_ns) - 2;
> +		/* I3C PP + I3C OP + I2C OP both use i2c clk rate */
> +		if (ppbaud > SVC_I3C_PPBAUD_MAX) {
> +			ppbaud = SVC_I3C_PPBAUD_MAX;
> +			pplow =  DIV_ROUND_UP(fclk_rate, i3c_scl_rate) - (2 + 2 * ppbaud);
> +		}
> +
> +		high_period_ns = (ppbaud + 1) * fclk_period_ns;
> +		odhpp = 0;
> +		odbaud = DIV_ROUND_UP(fclk_rate, i2c_scl_rate * (2 + 2 * ppbaud)) - 1;
> +
> +		od_low_period_ns = (odbaud + 1) * high_period_ns;
> +		i2cbaud = DIV_ROUND_UP(i2c_period_ns, od_low_period_ns) - 2;
>  		odstop = 1;
>  		break;
>  	default:
> -- 
> 2.34.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
