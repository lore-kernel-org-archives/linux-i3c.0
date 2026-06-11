Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B74CD98C7
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nfo9Jeyw2iUAenANxzKmqKYA84VzVcpfC9Xs/ypwzDQ=; b=0PK19MsUccLrtD
	Dam+Ct7/hCTV4KEieqwqMPPqLZfuJ0IrnoIX3g4I2gxFsWISOibUUmPQ1JPuO4imO38NRen/jrBEp
	umB9EfCYe0i/NRryrUPQLcL2Hd7uc8vXGY96jwNh6K7dJXo+j2eCWTXzilCfSswovmvCWw98h2T9z
	kGYz9n45LjrdmuN5Tf+qP88P2UWv+bxnbm2i6SFnRa8rfA3fG1z7aU8N9QzAJ8kkxCB4qzTAXPgwq
	IjotzZ5MX005FULPcn7OW9oYVZCVYbnkZl0l0r+XQE/c5RnmZ3UCzmJvAgNHKhKC2wpmI38yV/lxq
	cn6JHPf3Qt6BCFKhSNOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi8O-00000009kUs-40yY;
	Thu, 11 Jun 2026 16:20:00 +0000
Received: from mail-westeuropeazon11013028.outbound.protection.outlook.com ([52.101.72.28] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi8M-00000009kUW-3v8r
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 16:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzU9dk3f47QaIIPMdhRmlKhQRine+lmqqwzOWsIUtrc0dVQwqysfRLB3pCn2N3WBLu2bjEfscz2y+bqC9uSPbvqALifEgZBFpyxXZ0bbNPn4xgezAWem6vrGDZAdneuyzH1lfkP+spgJyrAy3tpO4jQVRra2qkjZ5uonuwMBy6+VE5GttpaDe95lf9Xkkz4wvQkCkW23Vv87ITWRiRelmNO248iOYQETiopjM0gTcZrEqMMdm5YlU7qA+lyjf2DhW+x+oTTqe9kBbM3KCBmoRdWGLM886jUHksK/LoggvB3p2VLAUEzL2dt/qA9xhzdLhTVgtA6XVL3Wg2cMey+tuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ/z/nDFqwpcAZD300GN3deRxERky6wJmmADYWjrEqs=;
 b=JGOu3IQdukEQxxej9DnWsaFFJiI0IqG73vkz2eFiAhL6y/q1VYGBYwIQVYf5/Yjbnm9TNl+KymLwuUYuW3AbqZP+543zRU3G1RtBHDJzBCRqk6HbJwKj6dPDm4VJfi+J9qDr1E3CkSXcujxl+5GozU52A2IImRcxIlgLt2SG0RnlnICwXfu3LiL2qe6auFyJuEHktVSc2bpOQqsyX2lVwNjVmGRN27n7hLqFZdLnY49BFBmdvF2TGB5TZIIJAsN/CXClbs6QaIS/KhXqaNemNB0n9NJT0KxktsqsdwljG0X/au8pTz92RBSRyKAmRreBnEzL41OuLSqVGcIxuOqzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ/z/nDFqwpcAZD300GN3deRxERky6wJmmADYWjrEqs=;
 b=h18+cyK9rEAD4lvqe9m3djtbVVnCSndxW0ITunZPmre1+N+yS2suY80ygoH4oZXyrchqSoFwieDnsAn66NEMeDK4w8My8Bh0zn1a78NDKcYsr8XalY/OwAWSV6ZCpmaNEIwmrBYUiYicLvZJQxA9vvPgMU+cLLbOGviS9w5egYRRvlz+FcSkq+OFEu9pLdBnHN3Qw1LbghLH6747hRh4w/SW1TzYo7JEnomEiLa2EQIRu8cuGzbegUtuIggbx6XkhXR75vBO2cL+bebIdlbVdykil6+YrWqj2IefMA3gT4wYNPB4OyVIJ6WWGq8i5+fQa9/XKYNSDg1ZW1NBCuXPIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11359.eurprd04.prod.outlook.com (2603:10a6:102:4f0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 16:19:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 16:19:54 +0000
Date: Thu, 11 Jun 2026 12:19:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Message-ID: <airgIomzsbZnRf6X@lizhi-Precision-Tower-5810>
References: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: PH0PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:510:5::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11359:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e88618-edc7-4606-6572-08dec7d545ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|19092799006|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: hvQ0tu9B656u6VNob+SQCcaus6lumze0Hx0Yu3o0LRSx55tn20jqyu8OtMO3SsIjQ6PeLXicfUYxdZkRrhqWvLLAcV5sXhYugarjnkoHVmK0eWQFPA3gq4jspl/l4F5wqf6XgtMiLf9g4HL4U9Xh6HN20KA2qgbgZ+j8az/hMbY4vhAUERy6wiUoe0mZa8ZaxNW66Z2YSWcMNE4JTtnoHuAMvweNKxjpbvhOgrz6fvso6naPPMJ93TtwpLEYI+7Ual010ow7oarmErz60jJBhS57sLjLD+hyAg48gDJgqI+nyY9AIlx2x4NWuHyLW5MdUKsL0FpkwVDo4Suyfgfn9YNBFQdY7YNzvKimGHm96lqGzKUVWTQKzH1zHWzPUPaU3QicWFt4nN/zbhXeZhIuxtWPqSn1CvIQ27moEJ7JQ0KWu5QXL6nO/9efajATt+OzMUYMZJLgfbLoRt+mo0jgFUljIvYK1EwK0ADYvYkqnR3mqZcMrfRPU9FUu3SNtLBnqmjtjioHSxA4bkDDP8VOJj0FQM5tJYd6QnC8GB9IEnWKmUmX9B1VDmvzwZ51W2ReJWm5nPKpK29BnMDXVsexasfupApdStehFrlFLAESRYPIBWwssq6XoYdpxrsj7su0TABXO9Q/+N9QK0vciAyiTKJc9qojUTHvjK8ma3ZWcygZpcYjunktZ24jgkoTkZLR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wq7ubgEnFGmI74trJeGL8Hcs9wb2yfCqOff3nW2x5Yji2oopSERh9xidvsyq?=
 =?us-ascii?Q?r7Rq5qxM6GsbW9Wijq0373Ww6MiQ9BwMSUCK8wEIRbYbUv+5WEDjubUmf1NM?=
 =?us-ascii?Q?sXFg5tguDwgaTCZtZelMGzmUtNFdmcFBGj5dXuFUBBYkutwdAbpvadSl0ZCy?=
 =?us-ascii?Q?3hE3WbUy4+xhUMdtPFgpzhXPqSfzbTGr+K+xChcoI7uYHZKnZ7BQiaW9n1C4?=
 =?us-ascii?Q?bQUysy0cY41qUKeVW2N7B8hESp9ovTWO112QSk3SACDW2Mk0Hz6El5iYvQdS?=
 =?us-ascii?Q?GAcwO3Ylciu26sa6rfK1UvHh2i3rVcsJLuhKXd+sEehndb+kKp6QSzeArFDB?=
 =?us-ascii?Q?1NslUGopC3q+Hp2ryrbZDtORwwVdFcpqz9vlJ2ZPfxo+4zfB3uWgz4MbVLLM?=
 =?us-ascii?Q?eh9o8zUd1yaPHit0133CQ/UkYacbzwGvtZs3uTR1RTd9k6eB8kKc56y83zpA?=
 =?us-ascii?Q?K1ZuHqdTAUe/Sd0xF7Xl16MXyqqPlCQCWQeP58I7lKzEoSAO3ky3RVbyv7Y8?=
 =?us-ascii?Q?lfrbZemYZSV+ErZP4eYAZ/9s34T72QkO5/sKf+dgN832eP/gm/6Z79g6bYYp?=
 =?us-ascii?Q?+wjoVlJAzNjb1BzhlioQHpYaNpzuCed28VbKShQvH3iIYkZ9vvtPPoFx6m7W?=
 =?us-ascii?Q?A6lyimB8qWk1odss94HwTip8ZRDt4gd2FA+nlghbjOmp4VoOCz+YS/1Bo9MM?=
 =?us-ascii?Q?LgsT7nDlAcrsNtx1tbgP8ICgNQT88j+mkH5W0W2gx2UdA3p3tQxCRENvV2m6?=
 =?us-ascii?Q?k1P5E7ugCL6KpzkE2+IQax+iLcmVuBWPJlNGppwKIZbrRwVAo5bCteFa9Auf?=
 =?us-ascii?Q?c/LiHTWanCww383ZykVAG4aHJceQM9Ej8XJxm0Ja5tS93UpU4YGPRFT1oknM?=
 =?us-ascii?Q?WxQ1QkIs4+EzdRY378bFw3nZzN6xVAn16yvD9bDEUhTCBEzLy0emUpC1w+F2?=
 =?us-ascii?Q?b8Ja4VsEMMYket7PkA5EdfoLLmsN62XfNciQWGDVdc1wfJN6SMgWkujTpLVD?=
 =?us-ascii?Q?3TEvGjTH3au/HtERpsZ15BPYdfo+Yj7hksg7oD5NcFVPAAWltp6JRch2iMxy?=
 =?us-ascii?Q?jd9CYkNtRB6gzNQD3FJpMmdjJzidjK9HhURvQYDBMOYnSXCgqL7Uls+ld9zC?=
 =?us-ascii?Q?KV4ZAs1IqlLqrG6WeOACeSNSnlG4PmRPZkvF69FFgrnSRKcm/EvDRRg5/Bhy?=
 =?us-ascii?Q?d4S9CrQeLLc5fNcKzhxy+TUxSmprofC/ce3bzcAGImkLhxgEoBTWYJhMhgG7?=
 =?us-ascii?Q?z/yTmqrcLhvd7mctUVCkgF5flfCCfs8BGC7poIKHRirajtHV9YG1V0MYMsVX?=
 =?us-ascii?Q?iML9Rx+Ey6tGCYhENwy1hwHTTb1pfHjXXvMxd2oqtsrsRXwNawGB944DXIGI?=
 =?us-ascii?Q?ykeedWTtmU9VlvuLBPrlnHHYM0kx4ZR54NGmQ7xdrc9I75HG2NlpDFfL3a03?=
 =?us-ascii?Q?/sFKNVwIIUg7sZx8ZMuD2Ts+CIsUT0HzNPJRJEI/vngGoK9z9pBfbNOWuJwP?=
 =?us-ascii?Q?mbPXcbwH7DyIMZ3aT4PD+E1Y477LsrMwUZZJd2wt3IP2WSZSjrEQUwtRkqnx?=
 =?us-ascii?Q?QyelRNR4aB4W5SZofz7SUD9OsXtpPY9eiFTwxnqs5P7btrM7dfje5XNmfZD6?=
 =?us-ascii?Q?zlQb3/XKimgpYrCozBIX+v4hjSkwB5hClMZOg/AAbbYE8eGibdstrniQTZDf?=
 =?us-ascii?Q?qltiF1WrmJ3dbpPHpSOvFZj8rjeEovFG3wvtq04zNeW3pU/0kebnup3Qjwat?=
 =?us-ascii?Q?UL5GWiiBXUj2iDk/G96uuKBe4rNHqOpCv0OKrbZwyOCtlSSj3P5K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e88618-edc7-4606-6572-08dec7d545ab
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:19:54.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9vEK4UJD0Gevapdc97ZW7kk4+uhHDJHRDbdODOGabxtrccC3FF2iTT8SEgvE+woL4vfOqM5fyHR2O2pwEtFsPWkGz9z1dLyZMvPQjZ4MGhoTgYik1nBSH+mGi++ASff
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_091958_980794_128ADFD3 
X-CRM114-Status: GOOD (  21.88  )
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

On Wed, Jun 10, 2026 at 01:14:26AM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
>
> Implement ->set_speed() so the I3C core can switch open-drain timing for
> the first broadcast address per spec: I3C_OPEN_DRAIN_SLOW_SPEED programs
> tHIGH_INIT (200 ns) before RSTDAA, and I3C_OPEN_DRAIN_NORMAL_SPEED restores
> normal OD timing afterward. Cache the normal OD register value during bus
> init and use a separate od_hcnt for the slow path so SDR extended timing
> remains derived from the normal PP hcnt.
>
> Fixes I2C devices with spike filters not being detected on mixed buses.
>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 53 ++++++++++++++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.h |  1 +
>  include/linux/i3c/master.h         |  1 +
>  3 files changed, 55 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 655693a2187e..dbb801910b3d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -592,6 +592,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
>  	master->i3c_od_timing = scl_timing;
> +	master->i3c_od_timing_normal = scl_timing;
>
>  	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
>  	scl_timing = SCL_EXT_LCNT_1(lcnt);
> @@ -1480,6 +1481,57 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>
> +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
> +				   enum i3c_open_drain_speed speed)
> +{
> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	unsigned long core_rate, core_period;
> +	u32 scl_timing;
> +	u8 od_hcnt, lcnt;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(master->dev);
> +	if (ret < 0) {
> +		dev_err(master->dev,
> +			"<%s> cannot resume i3c bus master, err: %d\n",
> +			__func__, ret);
> +		return ret;
> +	}

	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev->dev, pm);
	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
		return -ENXIO;

Use modem QCQUIRE macro

> +
> +	switch (speed) {
> +	case I3C_OPEN_DRAIN_SLOW_SPEED:
> +		core_rate = clk_get_rate(master->core_clk);
> +		if (!core_rate) {
> +			ret = -EINVAL;
> +			break;

you can return ret; here after use ACQUIRE macro.

Frank
> +		}
> +
> +		core_period = DIV_ROUND_UP(1000000000, core_rate);
> +		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
> +		od_hcnt = max_t(u8, SCL_I3C_TIMING_CNT_MIN,
> +				DIV_ROUND_UP(I3C_BUS_THIGH_INIT_OD_MIN_NS,
> +					     core_period) - 1);
> +		scl_timing = SCL_I3C_TIMING_HCNT(od_hcnt) |
> +			     SCL_I3C_TIMING_LCNT(lcnt);
> +		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
> +		master->i3c_od_timing = scl_timing;
> +		break;
> +
> +	case I3C_OPEN_DRAIN_NORMAL_SPEED:
> +		writel(master->i3c_od_timing_normal,
> +		       master->regs + SCL_I3C_OD_TIMING);
> +		master->i3c_od_timing = master->i3c_od_timing_normal;
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	pm_runtime_put_autosuspend(master->dev);
> +
> +	return ret;
> +}
> +
>  static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m,
>  					    unsigned long dev_nack_retry_cnt)
>  {
> @@ -1534,6 +1586,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
>  	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
>  	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
> +	.set_speed = dw_i3c_master_set_speed,
>  	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
>  };
>
> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index c5cb695c16ab..c814087a6f1f 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -46,6 +46,7 @@ struct dw_i3c_master {
>  	u32 dev_addr;
>  	u32 i3c_pp_timing;
>  	u32 i3c_od_timing;
> +	u32 i3c_od_timing_normal;
>  	u32 ext_lcnt_timing;
>  	u32 bus_free_timing;
>  	u32 i2c_fm_timing;
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 592b646f6134..c7d7448c4cd7 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -259,6 +259,7 @@ struct i3c_device {
>  #define I3C_BUS_THIGH_MIXED_MAX_NS	41
>  #define I3C_BUS_TIDLE_MIN_NS		200000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
> +#define I3C_BUS_THIGH_INIT_OD_MIN_NS	200
>
>  /**
>   * enum i3c_bus_mode - I3C bus mode
> --
> 2.43.7
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
